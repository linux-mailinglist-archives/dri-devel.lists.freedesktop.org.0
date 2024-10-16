Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D39A0049
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 06:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B6910E670;
	Wed, 16 Oct 2024 04:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3ytFQam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FE710E684;
 Wed, 16 Oct 2024 04:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729054015; x=1760590015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sQNA2qriHbTSuqCusXfQ/WyxYsiw9HS05OjPG83Xy8E=;
 b=n3ytFQamXZ2RCCuuzdJPUW8SzP+fMQ4x1UwfbBd1FvPfz6MLg82HLRal
 32E2BYLtMG4RiVu4AD+fTP0lwwhMtR6bfM240264uJCs7TVmtyRCOePe8
 vSse2ITQdsWRqD0oI0kUJZeUdvIcrqNzfqp5KDvdLzKD2wuAIKp83L68y
 JT/JmJ40rIU2d7rmbGqRgTGV+syMyyUXr/y585x8FuQeNPRndtnR0TnO3
 R9OG37c1yl43ccFWRq3ix6zI3gpNTK7ZQfBvhahVIo+7mZ9xrOpf7SHpM
 jQRuXz2SIjhejlngr5sihQXHZBk2tV9xsRopIEBQ6OLmb8Q7TMN1zKbAk Q==;
X-CSE-ConnectionGUID: j700iChFRCqcvxb4DiOALA==
X-CSE-MsgGUID: uW6fEX2vS6Kw4l4oqIuuew==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39856446"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="39856446"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 21:46:54 -0700
X-CSE-ConnectionGUID: 94G1DmiMQfmguI3OcgAl7g==
X-CSE-MsgGUID: /RTygPR2SDeAwTk4LcDNcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78001068"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 21:46:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:46:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 21:46:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 21:46:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNjBIjwOxEG1qo3ltkqc4w7dZT/LQwbXhOHgGzdLofo2ADVRYuaYutEH9/+/8HpO3uJ3NNmdxdHlyjGu3YpC0sX0bjPc5ymnwdPR+4JyruAreXJJLZWyw1ANrSUu5edhi4QRi/fb3CWRIWdILh7T/aMO4li4avRlFRZ7/0kOzXbZB+37eL5T8XJdZ5CpxnAX4mVkSXR4qsjY/gNdQ3RdCnylniR184rUHsC0ND4jiNC0yYPz9xRutaOURf/5nIwOGtSveFQ3Oy7/yt/pxp4nEXxv/+BDykHd5I6KITrJR3TlFguN+2ssauI0qCxfjGb/aCLDgxMNcRaR81wKGP722g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Nb+p35E76f9GGtRokBG88UOUlt/uGV2fVP/JqtvhJU=;
 b=FmDB2eh0xCaAp40n/eC8Uk4qZqmxzH27jRdPhXC4dAsNgwXKHdTj239UmBXe+lwX/cpo5Uj+mMYGAI4dXqzmb82O7UMYbfJDJlO8H4uMxc8WDSEjL4jpZe99myNfoP8lGK3XjTLNEdRPNkrqiljuw7vhb4SfapuA1fQacJHUZgZhA/3KO4EeoZpIlf+O+YkP0KWo6vgGgP/RwVLjwixXGGFLUH3zOO34lnozB19IjJajrL4nVgI0+PYkxvvn7ZVsVBNEwUTyUdos0h79m5I7CDXD2M4lKH1XAFJzMTcdPSQm/Cx6xC7V2O/jjoN/CsMAoTMG72jkQjfHf36T8CpEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 04:46:50 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:46:50 +0000
Message-ID: <31c2fe01-f1c8-4dc8-a38f-ef20dcf42717@intel.com>
Date: Wed, 16 Oct 2024 10:16:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/lspcon: do not hardcode settle timeout
To: =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedriuswork@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20241014093914.109162-1-giedriuswork@gmail.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241014093914.109162-1-giedriuswork@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 5061367a-392a-4061-1f42-08dced9d8c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0kxQVhMTjh1aTU2bnFPMitsdFJ5Uy9sMjlYV0szWFdXUlN3WnJjZWhSVG15?=
 =?utf-8?B?OGZ5aHk2STc5emdDR0JwcE9zQ0h3WlhFU2M4T21IbmZCWmVrS3dvQmhvT21k?=
 =?utf-8?B?V21qZThsS0RkRzJaSGZnSlhtZnA5NFc3Yk52bGhOeXpVeHlJWUZqNUJCRHZi?=
 =?utf-8?B?YXBTZlNnOE5wTVdzSC9sOU8yQTh5SGFEc3VIbkI5MDAzZGQ5UHMwdzExdHRu?=
 =?utf-8?B?dnhTRE5CSEFxYUtWeE1aNmNpM2M1TjRIN1R4YWdTdE52WFkwSWd4MDZqRHJ5?=
 =?utf-8?B?VHZvcXlsUmc4SC9rSWpuS2d4WGRsOG5hbTNYTW9GaUFxOWRqbHVSdW40eml2?=
 =?utf-8?B?M1ZLc2hVQ3FSRDdCTzgxcjZMMk5xSFZlZk95cWhUZXVYeEJqdS9EeUhDbUkz?=
 =?utf-8?B?MDFTeHppWFBhNHBEclZIODBXRlgzQk00YTEvSlU3VUxYSzFEUkZmZzlvTjAz?=
 =?utf-8?B?MU12OFk5a0Q3RGNNOU9sUTRDZVZvT0g3ZUpqVUFvbnkyR2hUV25pek8raWhn?=
 =?utf-8?B?Y1U3cXJmMk9EQUx1b012cmhzTDIrNkhmb0VnM0locm1ma1NUSDFYN0psWXZC?=
 =?utf-8?B?TU1MVHlBTlN2YWRlYUN2d2RKOUZtM3l1YzFlTVdpNXdWc0RNUzhCbnlwUFly?=
 =?utf-8?B?T29tNHZ1MVVJemRGU2YyekIwYzQwZDlrYlN5MGRjQm5ldGpVTzlvRXRteUUy?=
 =?utf-8?B?QTFhbW1ydzQwN0xnL1dWS0U1VDZmQUdXeVVZczBHRnlxRVF3c2o4NlBXYmsr?=
 =?utf-8?B?ZzZ4VmpwYVlPVjVDZ3Q4RTFlb2pwOTFyTDBuM0NXSkhrRUd6STBoWEF3ajVP?=
 =?utf-8?B?MlQwSllQVllNR1o1TVZXaCt6cXJTOVF2dTFyNVJ1bmovTXJYU1pjbVN0clFG?=
 =?utf-8?B?aGNUUnVyQmVqODVjR25vVURkQW01YTlWRmpOSHloc2JnWGVOOXptdWZ1MmVi?=
 =?utf-8?B?NGw1b0w1Qi9JZFU2cDJTcmdHekYra3I1U3k5Y2YzWE9oQmhhT3RNdjRrb2Mx?=
 =?utf-8?B?enVJWlFxZnIrendjSEZ1Mi92RnhoWTRZc0dVNzZOcmxnM3lhNHdHbVNIdjF0?=
 =?utf-8?B?aUFFSFJFdHgwVDh4VGdWYnhGL3VuZmZLbmQ2YjRucW5OQUxSZHhyUjJKR1k0?=
 =?utf-8?B?SUI0SGJQNzhJWnZ3Zk9iNm1Camg3eUg0S2cvcVZ2VnY0MTdJVUNkdFF5eURY?=
 =?utf-8?B?OWpUeDVlZk9UQ2xsSjc0eTVwZXVQZUtpMlhSditsZ2QvK0Q1eUxwT1lRQkRo?=
 =?utf-8?B?QnprNy9TYXBOdE1ucUN6a3hBMGlpTS83VHhNNzRqZGdVOHdKaDV1aHRBaTZ0?=
 =?utf-8?B?VEV3UXlWaG9mak1DbWtpaDEyODY1dkgzTklYL1VPQ3Q0Ym8xOExlNXc2STQ2?=
 =?utf-8?B?c3NjaHdyRHF5b3Byb3czQnJmNEovTVRXRGxzaTJyZkRhbTJndUVQY252Ti9i?=
 =?utf-8?B?cGx3dzliYlRhY3MwNTc3QXVZZlhnbEpjcmtsYzJ4c3NncDB4N3dzdjVXdjBh?=
 =?utf-8?B?aVZHYXVsc0tHd0pRdEphL2thTk1XVFl5SURUeWg1S1NFQUI4dVNuakQyczRT?=
 =?utf-8?B?UzRHVzZmL0VVQ0xRN08yR1gyQjdjUkpkcTFrd3poTDRzdXF5KzNrb3ZvVVcy?=
 =?utf-8?B?Mkh6aHZWcTdIalN1SEpJcHd0RWFlVUZHblFwNWVGREp5eHdtL3NJUS92dWNG?=
 =?utf-8?B?b3lobHpuL292TkdmdnIyOVhabWdLTU5zNmZoRXdhMGJSS1BOZEtoS3hPOUlV?=
 =?utf-8?Q?cy6EqQyk2tkGNc9mgESCUZZJroUzf7XQTYnJ8IR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGdmeGExUWtpaW5pR3ZVTXRVWWVsb2c0ZDZmL0tVbzZNUFlldVBCbXdoV2VM?=
 =?utf-8?B?NWJpbnQ4YUxuNjRSV3NILzZWdmFlelFncktJeUh1VlNMaHIxTmM3NnNSamFF?=
 =?utf-8?B?dWtmMmNENFl6emcyUGpoRGFZWnp6NVFtTGVVY3ByUE15YmRPUWMzME05TC9M?=
 =?utf-8?B?ZjRoZWhrbkUxRysxYVFRQlVxaGZWeUF3TkF0TGtFWXpJWXdia2QrWDBBWFAz?=
 =?utf-8?B?SW9xa3hKQ1ROOTdTT25wcHFETFNBOXdOV3dkc0o1VFZ1UThOUjUvdXdjUE8w?=
 =?utf-8?B?cWU1eWcwVjJHc0lxeXIxVFpsZStqOWxtOXBaT0o0YmlSSUxOSHl3R0lTdmF1?=
 =?utf-8?B?VEVJRC8xQWVYbng1VEVydEZJbjN2bzM3NnpqbDhGcFpXRDRsU3Y1cVgvMzY4?=
 =?utf-8?B?elk3S1RMS1gxaGdiUWVUTVBqM09CV1owZC9nRXQwV2NXejdUNWl1QjhTU0ll?=
 =?utf-8?B?bEthN0ErVlRyQ295Nkk2dXhZU0x6ZnRvbGd6bzdnTGU0bG5TUFF2VUtvZmN6?=
 =?utf-8?B?ZDBmczliOU5jSllUazhSRkdvQzJFekRzV3J5NGVOUmhmN0JlSWFtVmlzd0lK?=
 =?utf-8?B?RHduck1yWmNCaDdsdFlvWWhYN0tpUjlud2FYN0tud1FpaEFDdjlYaGZEdm1x?=
 =?utf-8?B?NnpLWnNBUGlmTks4MnlLWkliRE9tT0E0NTJEMGtTUlY5SUJHeW4rM0N1bFNT?=
 =?utf-8?B?WC9lN3IxY05tVFhCbTRxNlhqS1ZLbTVtYnkxVjI1NlZLTUJWcHdHb2FTd2dK?=
 =?utf-8?B?Z0FWdjVrVFBlaTliVk11SW43T05YSnM2NGdCekRFUkhHbmJCeDkzTzZYN1Y5?=
 =?utf-8?B?cHU5TTg3TWFQUzk1eXVydm9Fd1N6K1I0b3hac3pSUXlWSGlibWZHMFJIdThy?=
 =?utf-8?B?UVNhYVdFS1VQc2Yvc2h3aXNpL2FXdlRIWmJqU1V0RkJNYlQ5empDZUFncy9Q?=
 =?utf-8?B?NEJ5cDlaaWNzSVN1NHZTYXJHeUVKTGZxZk40RTBIUlczYlRHejZIc3VnVUNm?=
 =?utf-8?B?NGxMWmpCdVh0MjN1MUpPOGV0SUlnVHI5bHpRWGJrYWZ2OUhjaU52Zm54TmVz?=
 =?utf-8?B?U1o3OTcyWHI3K29nMndjaFZxNnJBYmpuNjlFWW5hYnA0TFpLNjJLcUp6NUJw?=
 =?utf-8?B?NGVnRmVOTFQ4SXNkWHJKUkZCVmlRam05Y2Q5OHVtODZzUG1pQ051aGVVV2hl?=
 =?utf-8?B?L3JXZmJJaHpmdUNaSmRPWFAxYXEyRDk3UnNWZnE2ZUZ0a3I3dFhtbnB5RTJG?=
 =?utf-8?B?Z2V1QjNRUURwZWN3SWU0ekhrNEw1Z3hDM2RrTllUV1hSN2lEZnF0bnBpYWRR?=
 =?utf-8?B?ajdyU3dmQ093TTc3RHlsZTh4ZHl1eTY0ZHJjVXpUc2JqOVBjb3RHNnYveENv?=
 =?utf-8?B?bGRuK3VLcWNUb0d4MGNQYTBQWnV6YzkraTJnUUdReXpjclVMVGcrOEtBenZW?=
 =?utf-8?B?OURRM3psQzc4bGc2NXFucC81S01hanZaYjF2Wk5Za2hPaU9mbkxBanZuTlpT?=
 =?utf-8?B?UTNmK1BYeXgvaTZwV3dTV1Q3ZjdiODJ5RzhnUG9wMFJhNkRaMjkvaGhCcjFG?=
 =?utf-8?B?dmdDY3JWZE9od2I5SEN2Q0phNTJtN2YveFl5TSttd2tsUVlUQ3RLRW8wS0pC?=
 =?utf-8?B?dkpkUW5oRjJldlBhSDhUK1cwdWJMY0lUN0E2ZkVSVUwyWDJ0YUdoWlRZZGFE?=
 =?utf-8?B?N09wNFdZR001aDA0RmhqL0FBSUlFbHdoc3ByKzZUaFZ2UUN4cEhtS1AwRlRX?=
 =?utf-8?B?c3hpRDRsRHlKY0wxYnREVW9mTXltbEduSWdOWWY0NWRVNUpsTTJ4UGtzRXR1?=
 =?utf-8?B?VTlpanBtc0hnMHQ5cjFnbUw2T1NYbHgvU1dKWVBwSlNTUy9EaVJ6U3E0UExa?=
 =?utf-8?B?UTZyRzlIVWpGMXZWWS8yVWorTXpLQklBNHNLVFA1a0VRVVNtdERuWlVSb3RO?=
 =?utf-8?B?M1BVY0Qxd0J1WEF2WE01dllzQUdPZHExL2ljTjNjNHlteW9CVjZhYkEyK1RJ?=
 =?utf-8?B?MCtOZm92VFhsdFRraHl2eXMwOEorTnBIME10R3FPTks2NnJqVERla29tYWVz?=
 =?utf-8?B?WnlZeFhTRWRvaGVPZTQ3ZlQxMEk0TEJWNDIrMmVpTllPREc0VGoxZHpCaCtt?=
 =?utf-8?B?TGwzMnl3dGFxVUZsZkV2TkQyNlk3STNrdnA4QXllQTU1cFdrODRiYTRtZHpH?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5061367a-392a-4061-1f42-08dced9d8c91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:46:50.7345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SoImEcI0DkImQXRqkBmQTEfJkFU+tV156oXnSUV4w91Sg2MkR9OQTULFDWzXWL/RWjzF0vUQLJXnP/JbqGyJRzzNkqgncwlQ4BuF9kh444=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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


On 10/14/2024 3:09 PM, Giedrius Statkevičius wrote:
> Avoid hardcoding the LSPCON settle timeout because it takes a longer
> time on certain chips made by certain vendors. Use the function that
> already exists to determine the timeout.
>
> Signed-off-by: Giedrius Statkevičius <giedriuswork@gmail.com>
> ---
>   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 3 +--
>   drivers/gpu/drm/i915/display/intel_lspcon.c       | 2 +-
>   include/drm/display/drm_dp_dual_mode_helper.h     | 2 +-
>   3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> index 14a2a8473682..ae9d6b93136b 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -491,11 +491,10 @@ EXPORT_SYMBOL(drm_lspcon_get_mode);
>    * 0 on success, -error on failure/timeout
>    */
>   int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
> -			enum drm_lspcon_mode mode)
> +			enum drm_lspcon_mode mode, int time_out)

Add documentation for new argument 'time_out', as also reported by 
kernel test robot.

Otherwise looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>   {
>   	u8 data = 0;
>   	int ret;
> -	int time_out = 200;
>   	enum drm_lspcon_mode current_mode;
>   
>   	if (mode == DRM_LSPCON_MODE_PCON)
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index f9db867fae89..764cf4898364 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -211,7 +211,7 @@ static int lspcon_change_mode(struct intel_lspcon *lspcon,
>   		return 0;
>   	}
>   
> -	err = drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode);
> +	err = drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode, lspcon_get_mode_settle_timeout(lspcon));
>   	if (err < 0) {
>   		drm_err(display->drm, "LSPCON mode change failed\n");
>   		return err;
> diff --git a/include/drm/display/drm_dp_dual_mode_helper.h b/include/drm/display/drm_dp_dual_mode_helper.h
> index 7ee482265087..7ac6969db935 100644
> --- a/include/drm/display/drm_dp_dual_mode_helper.h
> +++ b/include/drm/display/drm_dp_dual_mode_helper.h
> @@ -117,5 +117,5 @@ const char *drm_dp_get_dual_mode_type_name(enum drm_dp_dual_mode_type type);
>   int drm_lspcon_get_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
>   			enum drm_lspcon_mode *current_mode);
>   int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
> -			enum drm_lspcon_mode reqd_mode);
> +			enum drm_lspcon_mode reqd_mode, int time_out);
>   #endif
