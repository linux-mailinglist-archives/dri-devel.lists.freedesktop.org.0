Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E274B4155B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 08:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6348410E12A;
	Wed,  3 Sep 2025 06:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVpo2GYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2106F10E06E;
 Wed,  3 Sep 2025 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756881776; x=1788417776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cxdJEEyAdspF6wc4C/4gi3bwwPZnMat9PCLzuOglIG8=;
 b=TVpo2GYjmBpN4bogcfnMOrKEfjHyMxvtojvShAd6pYehlBdj3Oytao+k
 N6cOhpWhlVPKcCyY/qEkajVr53o++GcvKObBcQy4tr7xZTUDr1+4Y/vhm
 4p1miBIudJpf9a/GeEbf8LrSdejAW8rl5e+8G+KU/vh6VC/gesputh9br
 d+VhcIMWw1pW6QJUmWUMJhMC8+MPDev/Ql66hlfh2Ebp5ZfVTwaWvKdOF
 tuU1HJwP1rrkSZnVBR2lj9ADLjbmyiAJO0EzTYLcxBPuO9098NgXGGd6N
 dMFahE1qSCZF6djREuZ9adAQcIxiILJWaRB/wKu558sUx8JCbsnWhe38f A==;
X-CSE-ConnectionGUID: tYwdHia4RnyEO7SIdCNi2Q==
X-CSE-MsgGUID: rEJwibmHQJaHbXf4guFNiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59134092"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59134092"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:42:55 -0700
X-CSE-ConnectionGUID: bWNKScUbSaGfRb8dFFgrZQ==
X-CSE-MsgGUID: a8XJ0D/CRCKdNuy2Q1SmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171468099"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:42:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:42:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 23:42:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKXk36GBwR33JLAgaBuifOPhQ42634bmL5gs2D0DJAC/mfMgKWADbWNH0+nHekLK8jja6um19F1j28Q+Dr6X3jfnaqkvpTmvjxABORCme99Enkambhqz9FNOW1S/PxmA2QFa0PY8Kh+vgazOa0NqVDwrBqsUrhrti1GgDLuWAMLr+4NNZio6KZb3OTgdpXlB4OBICBi6uu64N7ullfiaoNOCBopDb1H9okK/dPPqQcHNq8V6P5HhJCxjFsAdSvX1KsH6Ud3LxRgSGHtrXEVivQAVw8pz0yLJhgTZ3db8EalpY9RRTF/rf7bHUTJFhYrieaaCjxwP96AJFlXGhuYYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inFJ0GVRV7MWfdm63SRNOaMET31Fwe4cq+Qn7hq84Fo=;
 b=nxNBqBVfUX/TsY7viv+mqKTVYjYFYgihZGJ4pDAz4DneRU0GRJF86sgwkP1p5n3CrkAsbPe3UKnm8NoGPFMlbAgXW1QV2DuUjzE+/ChxSTtYnyA07Og3z1P0h3uuzBjiLzECNs32EeqOiwrkzgbSZctpgvNrUW1DzBUFrcmDNn3e7tfeNeXor3nSdka0ZTjLa6H17IBErkgMYF/PBNBhCE5cRseC8HYM7wWEpPfVUxung2781qK++j1SKReuCO8xHERKTi4GP0OI9pA6+fHRrIY105+v9JTX6wJkDc4rlBMfSD+xAUadg86afKAbLnmFwgZGq/maPeibWLvnMGRXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:42:45 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 06:42:45 +0000
Message-ID: <f951ee19-83d6-43e3-82db-1025fe6ce259@intel.com>
Date: Wed, 3 Sep 2025 12:12:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, <xaver.hugl@kde.org>, <harry.wentland@amd.com>,
 <uma.shankar@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
 <20250902-atomic-v4-1-a97b4bed969b@intel.com>
 <151f2f238b7ad4d86e503a1b0061a5bd840a55d0@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <151f2f238b7ad4d86e503a1b0061a5bd840a55d0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f8bbfa-a915-423a-0653-08ddeab516c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEgvb25aN2JNTXNkU0xuNGdtb0VieU81UVVlVjhiYy9MV1FlVWltdDYvd1Fv?=
 =?utf-8?B?Z205NUFUeU9YRlE4T0hjY1hCK2plUUExVDJmQ1czaTVkaG9nZytyZnhGM1lz?=
 =?utf-8?B?RHpyaTBPcTAyVUlodTlMNkN0dE1rMGNZVlpEWFB0dXNhMmtQU3NrbFUwRzNZ?=
 =?utf-8?B?c0daTXlxcmQwZVFJWUtiTHM4L0J5cUNQQ0ZRQTJ3Z3lOeHIvcGRCbDdrWVli?=
 =?utf-8?B?RTdzVGlNQzZjUmdnY1ZqOFFoTEtOUlR1LzZpU1dVUmZzNGZhV3hkNUhMRG9S?=
 =?utf-8?B?cElyMGNuZVV3VzFQYkovd1VqWlRYU3RNLzZrUVhJNVMvTWV1NzBjYUhFMWRQ?=
 =?utf-8?B?cTE3L1RXRzZVd1BCRVBXeVY4dk1XMVU3cDk1Uzh3NG1nVVJjbUhJR0Fia2FW?=
 =?utf-8?B?b0YvbDBlYWtscFRCRzdRT0oyTTl0eGdwTEN5L0dVUEo0RndMd1RZS01Vc1JL?=
 =?utf-8?B?b3g3bVREY0pPR1ZjdTFTKzc5WGFRQnU0UzZRdmc1MHRvM2d2Ykk2TlVTM1V0?=
 =?utf-8?B?dCs5WE5ZSS83RGVIcjB1MmgwYUxmOXQxaVJuUzhaTE13eFlnUDluZ1psazh6?=
 =?utf-8?B?UHJWOG0yNmVUYklsTFhTQUk3RWNKNlJaTklpZGVUbGhXZC80RU9UWjJXRWMv?=
 =?utf-8?B?WmJaU0tvdUdidldOTyswaTRIK3Y3bTJ2S29qYWZ4VnRscUdCMGJDZEc2d3hk?=
 =?utf-8?B?V3hUUTUvbjE1S3czSkFmei91TmlkVktLblg3NzV2ZFRJMnJ3dXg2eWhGM0Rt?=
 =?utf-8?B?aE10VzFma0tVbm1IM0djMnJEb0lMRnZ1WW1vMTQ2L1RQK0k1M1gySHUyZEhX?=
 =?utf-8?B?TXlQeTFyNE1uZzY4bkgzNXVURkNSUThlbXdyM1JCWEorWktpVkFkUnRjZC92?=
 =?utf-8?B?ZUp1VlJMaExtK2hxSGtPeGlUbmp4ZTY4M2ppVk5xN3plcXVsUVMzeStOTlVN?=
 =?utf-8?B?MmoxTzFZVTlUL1JGdWRFcEo4ZEFxM3lRdXZoSUJQL3VHTmMvenBkV2tna24v?=
 =?utf-8?B?VE5KWXgzVFB0a0o2ZGtYOGVGMkpaNElzdFRmUUxCSzBqemk0K3pTT0c0eUcy?=
 =?utf-8?B?RFBkVDVycmt4cHVHRWoxdVZrdXhreC9mbHdyamx2aVVPOW1HMEVLVGhOcnJx?=
 =?utf-8?B?THQzKzV5dmVBZFR2WmlXYkhTdDVldE1OTy9XdzdhbTg0ZlozcEJTMDErWUp1?=
 =?utf-8?B?d0QxMDZMdVdMeGI4c0s2aG13MzVwbXMrYlU5VTZSZktubE5Yc1AvVU1aUUcw?=
 =?utf-8?B?ZkU4N2duOUhWd0Q1ZjdZQkRIZXpibTFlZHBxckhZZ1g2Z0wzWXJ6aHk4NWVT?=
 =?utf-8?B?Sng0MEx5UVlIeUhuYjJndGp0aEtmcldyRmg0WEZyK0p1ek13M0d0UkJJK0VU?=
 =?utf-8?B?cTYwaVRqcHA1YTBLSFJobGlWMFg5STZYTnV0NVFwVE52cVhMWkxLdGJuZzB2?=
 =?utf-8?B?OVBGUGdpMHlxME5QcnNsSmFyS0lFWHZTTHU4ZHUzSjV4SnhtaVRBUlZNR1RC?=
 =?utf-8?B?YnM1bE91WHJTNURMaldiNENPTHJCclhTeCsyMXIxRzlhek53b1FCMnJvQlRw?=
 =?utf-8?B?Sjg1cTk4ZHNnSUhyUVFjSktXTlVzOFVYaEJtUnkwbStOMjU4VzFucHlsUVFP?=
 =?utf-8?B?cG0vWnRBTnpmMmd0YldkYzB0UmdLbzNZVjZ5RHlvbjNhcDNYWEJPN0hsei9B?=
 =?utf-8?B?dnI3Q041bzdXSXhpNkMyQ2RTWDRzbFFTY25Welpydyt1dEJpZmNSd0U2Qjgy?=
 =?utf-8?B?cjVWVzRMWFY2VmJqeldXWWZtMXZMbzZFdVY3VXhiVEVmWmFVZG55YkdFNnBS?=
 =?utf-8?B?blp0d1UwTHM1VjRPcmJUcVRhOXlzMCsrMTZMcmNkZ0VweWVUTkMycjhGd1ZR?=
 =?utf-8?B?OXhxSjBqSmZsa3h2U1o0SWRsaS84VlBYaUx0N0xIZWZYb09yRVBRYjU0dFIr?=
 =?utf-8?B?b1RYZkI0N3FRZ1FINm90WDE0VjdyemoyNWdNb2JseEoybk5YVktiUGorakU3?=
 =?utf-8?B?ZTFGZnhaV1BnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUFNK2ovcVQyam5rZG9GMG5KYStHTUp1MkZKZ2dpaVUweGdzUWxtMndnMTJR?=
 =?utf-8?B?bEtTNExjTzhqM1FqaU1jbWJWSG0rbjJaRWZRLzAweEJqS05scllWTmlZUld0?=
 =?utf-8?B?ZTJFSG10eWJvUi9mMksvRzN3R084c0FlRjdRbmlJb0tQZnU3SmR3cVN1eFFJ?=
 =?utf-8?B?TnBnWjhNK0pwR3J0Vml5RmtqbWJLc1cra0FhVm1mMllLZnN0RFBQTDl4dFJa?=
 =?utf-8?B?RXhBeWR3SkpIRThsY1VXaWlVM1hyVHlINklLZ3QybzRpMFlzUVBkVVdlUnVw?=
 =?utf-8?B?eng0YTlTV0VxbHI5OHV0WUxnRERxWVRsRGNsMUx4UTVmMlVGTVA3SDFab1BN?=
 =?utf-8?B?bElDc0wwSE12K0FmVHpocXZaZDNKTFAwNXRIVkdWK2haSW1tU01YTHdjek1i?=
 =?utf-8?B?TjlnMU8xQUlHV1pEM0dMQytxa1lPb3Fuanl2OU5JWjRQdForWjA4L1BRUkFz?=
 =?utf-8?B?MzNwditDa2dkNk9rc284UTVSaEhyMExSUTU0cTBDMU1oRm1KUTlFYnNxZ0dZ?=
 =?utf-8?B?WGh0ZXEzSHdjQkxOSnVQc0JnTXFHaTFSMDFxOGZEQjhFdEh4dkhMUWozazJ0?=
 =?utf-8?B?ai9MekV0MS8xcXVTbXJJQk0zUjlzbFNIK3R5Um9wZytlVmltcHNaeVkxa3kw?=
 =?utf-8?B?UmFLelVPSUpTZ1pzclozWVE4ZTdjRVpnSGFxdnA0bXpURzBxbWUrT0pJdis3?=
 =?utf-8?B?S05ZTWtHYUFmWmlJMVdFcVcvTWVJN2Z0aUZDcm5yUHZOaW54MTlxUFE1ejVr?=
 =?utf-8?B?TlJ6dnBJNTAwbVhGOHBzVmxUWGQ3bE0wTHVWc0dWditjL1FIVXUyaGtDd1NF?=
 =?utf-8?B?ZkQvc2lnSmkrNE40SHFFNGJBK1JVUUJDeTdld01hWSszVFdJNXNmVEJ1dVRF?=
 =?utf-8?B?a011REZqVmJoOVNnY0s4TE1HL0ZkYUk4YVhidkxBY0p5RWFhRTZwRkYyQ1pn?=
 =?utf-8?B?QUp3TmpZdjVZNFBEYnV3ZjAxT1JPTExVSDg0c0trWlNySVhYZEF4ME45UjVH?=
 =?utf-8?B?Z01pYW5lUzVSV1ZlVmFpbVVjZFV4RVovaUpmQlY2cU94YjNqQTZNMjJmNWo2?=
 =?utf-8?B?bGtwV1VDb1dWUlREUTBJMjdPdlhBcjB5WVQ0dGw4UngvRGJSSHlacUk1bkYw?=
 =?utf-8?B?Qis4MzUwc0QyQ2ZEMGYyNUVHVkYwREtzbG0rQTZNbjRQTjNsbXFMcm5ZK2Rs?=
 =?utf-8?B?TUtWb3Jrbko1L21ZaS9Vd1dMenpRdkpEVi9WUUUyTGJqL0EwOC9yeGJiTGdM?=
 =?utf-8?B?M3dLcldGWFhWTi9XS0N1cmpZVzkyb2NJTkFKRmxERk41WXRlL1dkQTBNd0RB?=
 =?utf-8?B?VS9RYlpKVThWd0dNd3dkdFVuYTh1QTA5eE1mVXlzRnk2eDJ4N1UvWDlXcVlp?=
 =?utf-8?B?LzBFN1ppR3hIeXI4R0FUeDBPdXd3K0laazY4VkJZdVp5aFdIVEplaSs4RmEr?=
 =?utf-8?B?T0htRFQ3eHdTTnppOWhGQ2l2RG1GTmRzd2M1U0VKb29CcHRYeENEdkpwaFZl?=
 =?utf-8?B?T2ZnNmY1TkVNdW1yZXRmTFk0VUlyTEFjV2NTcnQrNVFwK0FycGlFeHNDU1Qv?=
 =?utf-8?B?bTJJWDNuRHhMK2g1Y2pxUDdyVUcrMXNBa1EzbTZGSSsvQUx0S1dUbm13NzAr?=
 =?utf-8?B?cDg0bzFNMmJFVEJtSjFCMnFZT0RWaHFnQXdiOTlOaWpnM04yMnQzdm82OFdO?=
 =?utf-8?B?ekJwWmYzY3QraUtFY2V2am9iL2tyQVpveTB2bmRzbk9hV2UvSUhudDVHVzF4?=
 =?utf-8?B?c1JEMk45TGRVYlNQTTBGT1lmbHZuYTh5SzBHdnQ2UmY5WGo0djBNSmp3VVpz?=
 =?utf-8?B?MzdzeS9XNFY4a3F4SitsdDBsd2pVZE5IVGVMRHNURVFENmN0UlZ5cFRqM3Zt?=
 =?utf-8?B?K2dWeHBqVXd3SUxtU0xyQk42SzNQR2k1Q1VXUEJLVWRDV1krOXNzNVFDQkZr?=
 =?utf-8?B?ZDFwL0I4UGprUGNYd0hENXU0cVpEREg4dHVQdHVpdXlmSGo5Q2szWVo2eDYy?=
 =?utf-8?B?SEZHWXRIZ0FJUjJ5MndEL1ZoY2R2M2NoZmJZaDJzeXJJc3dldzVvSitUVHBo?=
 =?utf-8?B?U1NvVklRaWZCSVYvNFpQSVZ4VUxWZzZRNnppLzB2M3JLU3VWTERQbHpyc2Q1?=
 =?utf-8?Q?3+84U1Lu7WTk4ieQgomdU0Yo8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f8bbfa-a915-423a-0653-08ddeab516c7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:42:45.2136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/MZ0Jte5XgA/uH73idAVvte0u0IcPlB6TJ1uyVGmTsm46x1vTiGZ1CUXXDtFlmYyhUGUMVHpVoezc8iQZ0Oow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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

On 02-09-2025 15:36, Jani Nikula wrote:
> On Tue, 02 Sep 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> There can be multiple reasons for a failure in atomic_ioctl. Most often
>> in these error conditions -EINVAL is returned. User/Compositor would
>> have to blindly take a call on failure of this ioctl so as to use
>> ALLOW_MODESET or any. It would be good if user/compositor gets a
>> readable error code on failure so they can take proper corrections in
>> the next commit.
>> The struct drm_mode_atomic is being passed by the user/compositor which
>> holds the properties for modeset/flip. Reusing the same struct for
>> returning the error code in case of failure can save by creating a new
>> uapi/interface for returning the error code.
>> The element 'reserved' in the struct drm_mode_atomic is used for
>> returning the user readable error code. This points to the struct
>> drm_mode_atomic_err_code. Failure reasons have been initialized in
>> DRM_MODE_ATOMIC_FAILURE_REASON.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Please run 'scripts/kernel-doc -Wall -none path/to/file' on all changes,
> and make sure you're not adding new errors. There are plenty, and I'm
> not going to iterate to you separately what the tool can tell you.
Ok
>> ---
>>   include/uapi/drm/drm_mode.h | 41 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index a122bea2559387576150236e3a88f99c24ad3138..6c4929e591b30b7a5eac472dadeeb3c9400e36df 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -45,6 +45,7 @@ extern "C" {
>>   #define DRM_CONNECTOR_NAME_LEN	32
>>   #define DRM_DISPLAY_MODE_LEN	32
>>   #define DRM_PROP_NAME_LEN	32
>> +#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	64
> 64 is enough for everyone?
Should be sufficient, as we just need small meaningful error messages 
that can be used for logging in user space.

To accommodate long ones, can change it to 128.

Thanks and Regards,
Arun R Murthy
--------------------

>>   
>>   #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
>>   #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
>> @@ -1157,6 +1158,46 @@ struct drm_mode_destroy_dumb {
>>   		DRM_MODE_ATOMIC_NONBLOCK |\
>>   		DRM_MODE_ATOMIC_ALLOW_MODESET)
>>   
>> +/**
>> + * enum drm_mode_atomic_err_code -  error codes for failures in atomic_ioctl
>> + * @DRM_MODE_ATOMIC_INVALID_API_USAGE: invallid API usage(DRM_ATOMIC not
>> + *				       enabled, invalid falg, page_flip event
>> + *				       with test-only, etc)
>> + * @DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET: Need full modeset on this crtc
>> + * @DRM_MODE_ATOMIC_NEED_FULL_MODESET: Need full modeset on all connected crtc's
>> + * @DRM_MODE_ATOMIC_ASYN_NOTSUPP_PLANE: Aync flip not supported on this plane
>> + * DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP: Modifier not supported by async flip
>> + * @DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED: Property changed in async flip
>> + */
>> +enum drm_mode_atomic_failure_codes {
>> +	DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +	DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
>> +	DRM_MODE_ATOMIC_NEED_FULL_MODESET,
>> +	DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
>> +	DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP,
>> +	DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
>> +};
>> +
>> +/**
>> + * drm_mode_atomic_err_code - struct to store the error code
>> + *
>> + * pointer to this struct will be stored in reserved variable of
>> + * struct drm_mode_atomic to report the failure cause to the user.
>> + *
>> + * @failure_code: error codes defined in enum drm_moide_atomic_failure_code
>> + * @failure_string_ptr: pointer to user readable error message string
>> + * @failure_obj_ptr: pointer to the drm_object that caused error
>> + * @reserved: reserved for future use
>> + * @count_objs: count of drm_objects if multiple drm_objects caused error
>> + */
>> +struct drm_mode_atomic_err_code {
>> +	__u64 failure_code;
>> +	__u64 failure_objs_ptr;
>> +	__u64 reserved;
>> +	__u32 count_objs;
>> +	char failure_string[DRM_MODE_ATOMIC_FAILURE_STRING_LEN];
>> +};
>> +
>>   struct drm_mode_atomic {
>>   	__u32 flags;
>>   	__u32 count_objs;
