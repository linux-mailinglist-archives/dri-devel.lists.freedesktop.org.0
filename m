Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49ABDD316
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5242510E73F;
	Wed, 15 Oct 2025 07:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QlTIvZBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A31110E73E;
 Wed, 15 Oct 2025 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760514458; x=1792050458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JJbu4By4QbI/DdxnJfV9xbeUdSvU2kMF0rlD/SeGNzc=;
 b=QlTIvZBkuKB4QvunNwsMBnicnug4LqlWIQp7JwhR/d/tLNhOy6GcU6U9
 XTeLm9DCdTlTuKHU9kpT3yA487YPF1UCHAMucNPiu3NYOLW76iSb3ke6u
 sEnyFoRA6nXYq6gHE1GQTZ4OZmRVpxcTrvmcyEnWxom7fWcILErcbUNts
 GlAIHt7LjCI780Zaey1a4H+NE7/1D5Jh78V/qPYk0rcdBEkS6g5miIKZT
 3Y7n97PKlN0ZsKyrkNfGDptb27AQ/J3SQglnrbf65UlilCSAYeiOs3Eu4
 xkYjw1H+Na6Q53CF4jUGVkzrlg4zHfhMNWSPJim+sgFubyxl+tooq/rsk Q==;
X-CSE-ConnectionGUID: HZ8uN5kUQ3Cxmte7/KXCfA==
X-CSE-MsgGUID: rCggE/MWS06o0b2+jexj0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62578187"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62578187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:47:38 -0700
X-CSE-ConnectionGUID: gTKm0R0aQ0OHfXqVDQLw9Q==
X-CSE-MsgGUID: PpG1ayaTT8iC6OvYenbxtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="219244336"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:47:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:47:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 00:47:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uv9nJ/O3vSyMFY6gL4cqxLHpn0g686ta0efFi6g72DdIJ15Ie8JLyLg7VD9b10Qw8ec9cFl0Cp0oq/avioRSWLMQmc1r/m9d5GeUFUTzo4mBI6wJU0forRhHbjrLIfElxyBbtPh09FcIYAySLwyIoc+XsKAl79IHsnwmspM4wWoraxVvtNgbEeqsMa9tF2QcpBxNgKVQmf0aJoRHZQWniZNUUA8IYUfUyfR0iYEDzcgMwrqYVAnQ+4vqrUwR46MFAiKBZGyO5ArYKmHwOMpJVZNHBw506uMtcSHAE2koRu0LRnM26Tp52qrjHAIBy29k+GEuJPea3zge1k6nxfan7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEVWW1Jyb4xko0b1wBXp20rYE8sD4y+jgvHHHZN1Blw=;
 b=cXPA4IXEt3D9OXTS4sYd+tMV3xAc54BuXUCjV8RXYfGvko5BsKBRjUNUKjQl+kRulblh/esro02eY9U0EEtwuTuujbCxWneDa1CB4+0o5hW9cbF1Ro2hBKzdo4UNVWxDJmkjopSaKDJJDjNjcAeQCnv9CeecUxo2O19cT3P6M0YB9zN+uHIGDDGqwazMTpJR/ZtJQVhBtt+Wt7VlwbaQ2cIVwHUEfbrm6kmEWeuC1es7aupwkdvwK+D55XR8COgjkHylazK47RjlJykBYKc+jZLQ68dOJRH/ONm0POTksMQk+6opTpM2WYbHkODQnbuLKSr6cb2HObbrap3b5nVTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 07:47:34 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 07:47:34 +0000
Date: Wed, 15 Oct 2025 07:47:19 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915: Wait longer for threads in migrate
 selftest on CHV/BXT+VTD
Message-ID: <jjejq6jsl5c6pgvb6cgme27wuhpo2pohey6qwjmqfm2kkxhvra@q2qqdx5ygxol>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
 <20251014125504.14804-7-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251014125504.14804-7-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 74159079-af1a-4188-0123-08de0bbf1855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE9mT0ZUUGNxcU8rcUl3QzFEVDJJWGkvdGNJRmRSb3RZcEJPM0xWZ3l2dGsx?=
 =?utf-8?B?djVWTkJpV2htbi9Ua0d4R2RDSG5rUDVIaWt5cHhMdVpYSlZZWTNDQWVkSWM2?=
 =?utf-8?B?ZlpnTENWeExiZUI4YWNwMXVrVDRFRERTTlI0VllwN2E4ZzJ5YVZYWUg0MVh3?=
 =?utf-8?B?VExoQkk1ZFBjNjZLemNLZG8zdTgveTVpTzQ1aHFMUUpmSVhIbTRuL3B6bjh4?=
 =?utf-8?B?YXdNamxrdG9qd0xHRExza1NWejdnQ29kUnpUQkdOM0NqR1dHLzQvREh4U2FS?=
 =?utf-8?B?TlFXeFZiV016d2pmbHdhZ1ZIeDdBcmkySjVEVzEyMXlwN3J2L2VmUm5DSWJZ?=
 =?utf-8?B?dVJYdFA0VjZRYVNVVHgxYm1jSFlCVnhmelNJUCtOajNBenhqVWgzeHRFU0lS?=
 =?utf-8?B?OWRQYnUvYlJWcFRmVDlGbzlXZFRTbldMMk1LclVWSCtOOWdrZGF0Y3l2L2t0?=
 =?utf-8?B?dzNudUhIM1A4V2R2MFpFU1YxRDlMMlhGZlpqbXdPb2hVeXlzSFhMUVg5bFVL?=
 =?utf-8?B?VE9UME50UlNrOE94MkFhZldqakVsUlpSeWN0bkdyd3lyMWJydHRROHlvUmVL?=
 =?utf-8?B?eGl1bmtLcDdIb0VralY0VEsyTHRkbjNMNU9ORGEvRjBzb3lOU3Yya0JGTml1?=
 =?utf-8?B?OFJmUnYwOXdOdWprdzdmKzdVMmZpSWhQRGlNZGlsejdmSkkyaWFDNjIzY01B?=
 =?utf-8?B?V3JQOWFvV1BMV1FsemtRZ3pueDBPSldvSmk3emF0YkhpNDZ5U0k1a1EwRG1R?=
 =?utf-8?B?NWR6YTRYV3JQUExiaytDUGZMTk4rTDdKVW5ib1NYaUpIRTFRRi8zcmhQRDl4?=
 =?utf-8?B?bzVjamdsaHNGYUtUZGMwYVVkdi9Jc2F6alFnQUdGVnlKa1ZtTEhocjBFcWhJ?=
 =?utf-8?B?THMvVGtaSjBwNG8yWGt6ZHhMQUxlM2U5bHJUWGpnQUZ3c3BTb0o3ZGFGa1NQ?=
 =?utf-8?B?MkprMHdWVU9taWU4NWJ6a09vN1pDclRLSTNVY2k4Ri8rRCtXWTVrVCtlc1BD?=
 =?utf-8?B?SDdQU3pzMkp3T3E2WFQ1U0dScVU1NmxKNy92NHNyaUFwUnBteFVPMFhZVWQ5?=
 =?utf-8?B?bm1IUW80NXNwNkNHQVNaaHA0QnF4VDhhT2IyVkx1UCtLNUkwcTFUUmxHc1lJ?=
 =?utf-8?B?QkI0c2h5NFg2REx0MEhkYWJHRFhxOFYxTXc2UUxqQlZ4RnEza0F1NWxvVUpa?=
 =?utf-8?B?MHVxSFVsS2prN2JyTCtPa0RSV0ExQ0dYaDNETVlmb3ZLclJIWVMxUXNURUtn?=
 =?utf-8?B?MTdHU2dGK2hjYndPQlFUQ1NqbkZ4TVZnNkhqWS83ZDJWSGoyWjFNZzBBMjMx?=
 =?utf-8?B?bHdLQ1BKYm43Vm5TVEVCRm5ob2l0ajhlU1ErU1hqcHkydEdyRHlKcFVpWURN?=
 =?utf-8?B?T21GUHBUdEdIZlVuYzFPM1hDV3I3K01nY21SVWpscW1mOVVKcmYrS3A2UFIz?=
 =?utf-8?B?RzBMN0dWQWpZM01od0ZKSHdYejVwVkFSendHQTJQQkVDc0k5aFl3cnhhcE9D?=
 =?utf-8?B?d3kxemQ2bFpXdzVYdlV4a0pYNklITndMeVBqeWJydWd1SFFCOGp3RVArQzdl?=
 =?utf-8?B?ZWZMbHgwOGNXZ294VzVkR0VWNk9rQW1zWkY1T1N6U0xUeGtuOVVId1ZBdUxJ?=
 =?utf-8?B?VVZVQ2k5K2JVTHl3c2ZOeWNSalJEekR3SnoxUjNFVllpNy9sdllXTmRhejdQ?=
 =?utf-8?B?Y2VQY2JFM2w4UlJramJqUGFKbGhqb1VMbVVncEVBY2kzSi9OOG1tZTdrZVp6?=
 =?utf-8?B?UWJsUlV2eDE2VHVDYmRGOHlUTU5pc0szSGNwN2tLTHJpWllsMFhvWmtobWs5?=
 =?utf-8?B?dTlpNWFrT1hiWHZidzQ4SERGcnAwamlhZmxPbyt0ZE94NzZZQ2FyOUVmM3NJ?=
 =?utf-8?B?YkYwZDB3eFk3d2I4cTVmemh1OEZ5TnpNQ2NQU3BpQ1FObEc2VXg5R0xjTjNw?=
 =?utf-8?Q?MZuDQkI7PPNEppp/3fGgYsQzadkNcfE8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUFteHZVODV6TGNiMFRINGVWMUF1LzgrbW9zTEswZjNUUHlnS3dmRldpVTU5?=
 =?utf-8?B?M3YvLzJocHA4RWRja0ZxUW9lL0VVeTd4dURVbEJWWWpCdUdwUlRYRW50Kzkx?=
 =?utf-8?B?dVBBT0VkaUFhVndCcDJHR3ZUYlJPL25ubDMxbkQ1ek82YlppeUw4RmpHT0J0?=
 =?utf-8?B?VEM2cTZvZ1Z4NTFWZDd2b2pENmFsRHczSkVqVW1vbTRXQW5COHFXbzgxSUZQ?=
 =?utf-8?B?dGxyUlU0RGo1VjFjb2JsSzFiNzNsaEs2Kyt5N0VJV0lwSnF3QkxBVG5ldHgr?=
 =?utf-8?B?VVhmZmlueTZ1RnFmWWhtVEpwakhhUzJ6K3k1aWdLbk5vS2VEcEJzbldRSmMy?=
 =?utf-8?B?bmJVWWFXRktlSW9nZ3pteVA4a1Qva3ZWWWJkMjlOM09iMXhBbUZpZ0d4T3Vk?=
 =?utf-8?B?dHdvSTAybEJzRC9IWUk5Z2pIRUNIY096L3NDQ29zbkMwd1BuMnAwY2JKckJ6?=
 =?utf-8?B?WnhJUFAvdEtLVWc2cFh5THZ1ei93MG5RZHlaYTVzMjA4akNyYmtpY2NITEQ3?=
 =?utf-8?B?TnQ0RW5GWnRlaHRoejNqS3pvT0JpWmpXaXBReEhUUlFONHJBNGdGWG1GUlc1?=
 =?utf-8?B?K2RGV1Y1SlJxc3kweGJDZ2dlRFVrM3BhQ1B3Zjhvc3d2ZnFJSkIydnJndGE1?=
 =?utf-8?B?cFZtVXE4V1JFeWY2MWt6cmUyZmJrK3A2MERRSjI3Y0JBd0x5TEh4ZURZKzlJ?=
 =?utf-8?B?UitwT3hkUTd0MS9wNjlhK2V2Q3RXeTI5SzM1RGZ6bnNLa2lTd1ExNUtXM3BK?=
 =?utf-8?B?blpuSWRxSUE4Mk42cjY1MDJPcTlMTk1xU0M5L3hkTmFvTFBocjYyaXNWSXln?=
 =?utf-8?B?Snpld29lUTUzc3BCbEt5Y05ySnBiZi9venQ0dFlpcmhvM0ZOcXkya2pMaUd2?=
 =?utf-8?B?R2NNeEVEdFVwT0V6T08rVmhIWWVhS2JFTkFoakhYZmFqUEhQeEpWZjNCQ2x3?=
 =?utf-8?B?ek1KZHROZFpSdzgyWnphTzgrMzR1eEZxUkVzNytBZDhIc0QrSnBlVnJFNmE0?=
 =?utf-8?B?RmFLZnJkTWsvcWNxNEM0dVdmRTcrTjhhVFVFN0wwOGFJdU9abnJZUCt0VUlo?=
 =?utf-8?B?WHRray9TaWRWRXpmVTBEYjFxWDFDM05oZXovaTVNcmpYUmo1VTRzNnR4R3ZV?=
 =?utf-8?B?UmpsbFREeWswcmNTdkZ3eGxvV1RRZFJRUy9EUmNMdnAvRlFFYStlNGw3Z01q?=
 =?utf-8?B?dHF2SC9Zc281VTVUdTMzbVM3cWJPVUNtbnRZNWpvRWlMZTBCZnZnb1VYdml6?=
 =?utf-8?B?WVlmNW1TTzlxM0JaendIUFBPZi9MV3VPWmJZT2RZUFpRUFJvYmlKMkZOL3ll?=
 =?utf-8?B?U3ZqTEZnVmxuZ3lIYXJkbUE1dEMvTXJHa0ZoaER1ZXh3SUVoMXlxTjROcUg3?=
 =?utf-8?B?QXhxcHpycDgyTy93ZWpDaEFPdXZhc01TbDBZS2YzK2lSeW0yWktLWnZlYk9U?=
 =?utf-8?B?N0d5K2tZMjdwZmxOOHJCaktvNFhZNHlOMXFteGRwY2dyemd3Ry8rNW1xRytM?=
 =?utf-8?B?OUUzemJicDJMM2dZSFpZYVJkUVh1ek81UVgvY2EzVUZSNkRRMXd6UFg5V2xV?=
 =?utf-8?B?RzE0Ynp1Nk0zS2FXbGRldFFuZlRmWTRSb1NWWUowZFVHSHJRYjRwdGVkWFBt?=
 =?utf-8?B?R0UrUDJTQytIWmtRLzV3S0QwUXM5MEFkSjdHYU45S2VxZ3ZiYTVCRWd2OHVX?=
 =?utf-8?B?ZllEaTVXb2xtVkpJNWcxa3o4QVhmQ0QxUVdZYjV5MVRSM21vbllrNDIwKzVP?=
 =?utf-8?B?MFZRRVJYQ2RZZUVLUDFQY0Q0SUZxWnQ0WkFCNHR2MzFvTzZUUCtiWVBGODY1?=
 =?utf-8?B?ZUkrL3FRb093eTlOYmpCaTRlV2JaZmVkTEZnaUM4REcrVnNYWVlZbExzR3ZV?=
 =?utf-8?B?Uld1enViYS9UVWR1S2tqTktLSk1LamszOEtXWkdhTFM0cll0TmRQQW4wK0Vm?=
 =?utf-8?B?WDE5QkFIT2trRnE2SGFsTVJ6ZmlzWkFQUTg3VHJYd01oYVViNk9RVDB2OXdL?=
 =?utf-8?B?ckF4ZUdLTmRNaTNBWHlqYTZDODZ3L2pITUZDeWpGeURxYmpZWW9GRHpyZnpk?=
 =?utf-8?B?bVRjK3BKeEg0UHB2eGFvcUc1K3pwaDErSTM0WGlZckRhbzdZREg3SmxQcDF0?=
 =?utf-8?B?cUlrTGs2UDEvSm1mNUp4ZHhGdG9xcTdrTlpaSWdEajE3UjNONWd6aHN0NW5M?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74159079-af1a-4188-0123-08de0bbf1855
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 07:47:34.2060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVv5cdQsmXTrlJ76n5mW9C1Dtq8mQ4KJ0AXB0p9yAYlDFC+dXK6mC4da31vO+fymVwEtjDSN7SWVhHZb1zeUcEpTsUK2FdAbDjq7fGGyuHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

On 2025-10-14 at 14:47:37 +0200, Janusz Krzysztofik wrote:
> When running on a Cherryview, or on a Broxton with VTD enabled, pinning of
> a VMA to GGTT is now committed asynchronously to avoid lock inversion
> among reservation_ww and cpu_hotplug locks, the latter acquired from
> stop_machine().  That may defer further processing of resources that
> depend on that VMA.  As a consequence, a 10ms delay in a multithreaded
> migrate test case may occur too short and still incomplete threads may be
> interrupted, and the test case may fail with -ERESTARTSYS or -EINTR error
> code returned by any of those threads.
> 
> Extend the delay to empirically determined 100ms on affected platforms.
> 
> v2: Fix spelling (Sebastian, Krzysztof),
>   - explain why VMA pinning is commited asynchronously on CHV/BXT+VTD
>     (Krzysztof),
>   - use more precise wording in commit description.
> 
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Also, thanks for including that additional bit of information
about CHV and BXT in the last patch :)

-- 
Best Regards,
Krzysztof
