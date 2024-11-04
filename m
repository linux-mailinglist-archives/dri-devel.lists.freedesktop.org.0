Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E850B9BC159
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 00:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07D510E4EC;
	Mon,  4 Nov 2024 23:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQW/jkIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDF010E4E9;
 Mon,  4 Nov 2024 23:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730762454; x=1762298454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KlrVBgdyzDHFzkMu7sxsjMct+7x1+W+jHzoHlsdUx6c=;
 b=eQW/jkIFcJ17l8r30M/gSOK9VugIpvNS/TC2j/d909ActeOhJoaYLb6D
 /Xj9RjshZUFU5HnSVfpupfePolQEtFreXzZH5I+bRrpewz84MnDm0BAOG
 X6Qysqr2gtfR799NrD3sUz6RbQVgc5ByHM4h9Rh78tBmvQCDlqGiWuEzc
 G8J5vmVSs8/P4OxzQDslHV/7p0y7FIyr4XxL0YWvQupQ98gWl01JEuQbv
 PlAN5UsZbvpVtjue1VDCjfb5kTzHvnNW6viE/ikdKAoWsE8sIpt1MoGfu
 P4ZvC6eKh6vkRHFxLYMyrsfDvC/iMu1o1OMGFy5aXNIDZtlygWRiFxJ3V w==;
X-CSE-ConnectionGUID: 3NpOYQiWQHO2ius9byLPTA==
X-CSE-MsgGUID: MipHiCQURjqQ8ZJOeab7Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41116040"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="41116040"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 15:20:53 -0800
X-CSE-ConnectionGUID: hZe1b01cQdmSyN0guslIbg==
X-CSE-MsgGUID: SobQClCZTxyYpe+mjzY87Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88944407"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 15:20:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 15:20:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 15:20:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 15:20:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qgy1PVdGvrshuksUlfJZCg5eDD68ZZuMF0t/uMVwqkFnJtDSFaqGMEWMoaPH5lQn5QzG3AQB7ZDvfCwQkijN7hKBUH3i2sqWCq9rVSKp6cwlaE6noHXWDsSQoujz9AIMxrGP2ukX/7i5k2a+AWvuZA/erQ35faCAlSKoFJo8DUP/IYQmVOJ01ysyoyYa0E3++6Is9wFLlWVbisr1M+TtGVwbx9kwduok2sVeQ5HlBJbRVjhjQEiOIZqWuPGUYT00ewGch9y+dQi1NnLDjfoZIa+U93xxx1TNb8m/ZEVQT27e6KHhmc9NKv4HBxeE++PKWG8BvdJcIFdByla2eqnWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aV4CjbyiAYEcf1JtlBH46DUHcU9Zhl6mHO7x4vkQicI=;
 b=X/97KfaNxer2PCar+tgx49iVIRv6y11kCG1m3BEpEh/HDGJEyvHucouuaY9ZrG02LbcOZpK85nqM8RxeTI28fww+UyMDHECLMq3LFYLSwugSxubKOdQ6UKovGFH8tMg9CejlnAl9iCGDR/1T3ZGbFQ5Io9uCe0dSpVyqAK8kf/Mio5pKnBMKcIzC4YH2eZK2jjV2aTr9zl50BCB+8vOZ2w1wyVoOsyUaheSbtpYcLiCr/6eObzI3z+EHEOH7+O8DXJU2yLzlUWM3E2aGYcofJZNNtvBkczxK2IaaKbBCPcMN2sdIohkkp+I7AprHvrWCoulNRUTeccBrlSNKV4xxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 23:20:50 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 23:20:50 +0000
Message-ID: <d48da820-a9b6-4bf1-95c2-984d900a2700@intel.com>
Date: Mon, 4 Nov 2024 15:20:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/guc: Flush ct receive tasklet during reset
 preparation
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20241030223846.2272374-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20241030223846.2272374-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: f814e3ea-3950-4c2e-3ce6-08dcfd2751ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ampvcWlWK0dXdzIzVGt3aDhreCtkUGszYW5qL0t5aXlUWFA1NVFvSnJMWWg1?=
 =?utf-8?B?Q1dGbWsvSG83WStoajAzdUJkQ0VXcUtRdlJpWWRBeWlLaDR6c2R0STBBd2Fw?=
 =?utf-8?B?QTZYeW1iQUpQSnZZU0ltQ09PdldrTHVqWmI4amJBVWxZc2VjRGpkbUJ1SUFY?=
 =?utf-8?B?RHZYYklPeTZjSHgrMTdrUSszaDBUS09xZjJ3bzlLRXloQnh1dHhSbnVRZ29Y?=
 =?utf-8?B?NUxsdEg5VHgvb1RmdDRwZVJGcEZJVXBicEQ1SDhjV3lFVlhnZTRSN1dObG1B?=
 =?utf-8?B?czk3ZEJkSmM0aTBJTXcrVnFVRlRlbFdDUkpGTm04L0t3SzBoWS80WXhidjlr?=
 =?utf-8?B?TVp6R0pBQm5jTUlzekM1RzJYVlFlWi9qN2VwdExtdXE2RnlzdDA2S3d4QlA1?=
 =?utf-8?B?Rjk0NUhwUDI3ZXlDZ1NSYUMwTi84aWRGMkZncWg0cWpsRXVjZHk0NDZQMmIy?=
 =?utf-8?B?bjh3RXlBUXI1eTlkOGx6NHNnbWVpdnRKMWxOTHVlWkFRb1ZTTDNhNmdvdHNr?=
 =?utf-8?B?OFc1MmNMNDEzOXE2eVplWFhmb1Fsa2EvMlAzSGI4dkxvbGRHZFZxK1FEZ1px?=
 =?utf-8?B?cUY3Z2xRbEkvQk0wcEp0a0g5VmxlZkErLzlsVU40c2VnNUErZDE1QUc4S20z?=
 =?utf-8?B?NW1TRkt0OHBjMDRJbW9NTDJYd3BRWXltSFpvaWFrK2g2WmdxS2JySitjeTJ3?=
 =?utf-8?B?YkhldG9rNyttc2tZRnhTeGlzTWJQZDVLbGpBTjhyNEcwMnFQcUhrb29JMUhQ?=
 =?utf-8?B?dGxJYU9JNDFhcHE0UzhJckN0LzAyUFBiN2xMa29sa0FGS29SMHdnd3V1cXlT?=
 =?utf-8?B?cG4vTDRFT25ZQmFZWXdIU0o1c29wSUIrbGJubUJKY2h2WlRRNXhlNForbXBj?=
 =?utf-8?B?RlY4b1l5NUFtR0I4NmhsSzNRS0t0RUl0YUFXZkdLTVFDMFpzMXJ0ZUR4U1FH?=
 =?utf-8?B?T2NJZHZERmRianVMS1dKSWl3SHZxeDRBWUxiRDIzRGpVbm9yeE8weUN3cFR6?=
 =?utf-8?B?dStZdXMwSmhSUmxGNWpzc3pvK21nMzc3dlNtR0ViaEZJOFp1RG1jSFBwZW1n?=
 =?utf-8?B?YWNTb1hHQkRHdTJFQVZSVlljRUZMaVVSQXlUNHRScTg3aXJqT2RsVFM4ZlBL?=
 =?utf-8?B?MkdKT0E3ZjlUN3JDT0liNWsvN2lHQzlldEFYU1RrdFpGbGtka3BrUEdJcTNT?=
 =?utf-8?B?TkhDUlpsSjAwMGpxTzBiR01ENnU2YXliTm9DMW1zaFVWNFV2UTV5VGxtczdm?=
 =?utf-8?B?VTNtRXpvUnFvNXpLbHhlZS81ejlkMzcvWU82bUE1MTdxNDNWMkZIZlpKTElT?=
 =?utf-8?B?Y1hkTW5ienBBeG5iME9hQ1kzRFdERERKVUNSYll6RjlaSldnT0lZS0F6ZlBy?=
 =?utf-8?B?QTFXemJTYks5bHFRcUpPVzJCTkhqOTRnd05PWTVWUXRKQ2poRHBoL1FmNVds?=
 =?utf-8?B?bXZSeDF6M1NWOXhuVzVxRUZ2bXhQd0d4VHVUV1I4SkExWGhJZUREV3Q4TGdB?=
 =?utf-8?B?SFpTc1NZUTdnUHI1RndxMFUwWWJwQ0NnZ3VVL09RUXdDOTJjZzIzdktVZVJa?=
 =?utf-8?B?SkdFMzlZclNQZHVpVngrUzhIdkNNODV2b1U5S2pwcFVwdzcwWEZhZFhycXpU?=
 =?utf-8?B?aUU5SHE2OU83SDFIWWhuVVNSTHAvQVh2ZjdQNHM0Q3NGekpDMzBvSjBURnhP?=
 =?utf-8?Q?+FogNXVgXTGzNELN84Kx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjh1NDhtNkU1TEE2dDdWQXVCWWw4WEdBczFYUWxONHcweklCOU1PT3hHVGlj?=
 =?utf-8?B?WGxzY3JvZ05MN2RNNm0yOE4wQ2xic1dwVXhVSjhWakh2bEo1UXNkV3pQQjlm?=
 =?utf-8?B?NGR5L2UzT09NOUxLYjBHSHA2UDl2QXNHWEd3WXY5VlRXV1BIdnhXZzJkYjcz?=
 =?utf-8?B?bytqU25xYUsxUTlyd2JRVkt3ZnFyMk9IUHJrVDR0a0JiQXJVL0JKSXNGMHBh?=
 =?utf-8?B?dTcyNlhDZDNlRi9VdzZhMmU1TUl5NkFYdGg5dmtLcDJ3NzYvVDZIcjU5TytE?=
 =?utf-8?B?aytjdkE1amRraGxBY3ZOWXRINDZuMEhYenQzZnlUT1lweWE2K1FabkFiSW5z?=
 =?utf-8?B?RlZVNE1vRkl5bUtRT0hHSHBFYzVVNEx1MVBHSkFwenZzcnhKSXFTR05ZQW11?=
 =?utf-8?B?RXkwbmUrUi9qajRYd0ZTL3lwUFZLNzIwU0VyUGJ5akoyUVRKUWRQb29OOEls?=
 =?utf-8?B?bmFSTmJycTI2Wnd0djgrODRXYnZXUmUyb0pPMEdjY09nMW5pa1lFbml2bUhW?=
 =?utf-8?B?NVMzMkdyeDZDb1k4UTBTN3F5aCtWZWZMWFN3MnFZNEo5MkhOV0loSmtkNkd1?=
 =?utf-8?B?dDd6U1BQeCtzWUJxWEZrVHhUT1VxbmFiVEZBdjRWRitCWEdzdlBBWDUzUUNl?=
 =?utf-8?B?THhZYlJ2U09YQUQ4Rkd5dXlOSUxRbURnVnYvaisyMUNmbEViYkdpeE9qSGtP?=
 =?utf-8?B?TWx3U2hYV1RDd0laSHo4d1RvWGlOL050K1dLc1dGMSs5V0dOMVhSdnNQelR0?=
 =?utf-8?B?QmxQZUM5YmF2R2w3MDByVXY1Zmk0ZkZCNzVpTzBHS1VOZDM4UXBDamJydWhQ?=
 =?utf-8?B?SWs3Q21MbnREcmZEWWpTU1pXQU4xakpBS2V5Mnp4N2pSQ09pemp1b05panhF?=
 =?utf-8?B?dDZXc1haR0tXTS9McnBpSVFXQjNYaXZ3MHB3bHpIWXNpUUR1RzhxWmxFdUVJ?=
 =?utf-8?B?NmZQZndPQXBuSS94NEEyQ1RNT2dIRjZWSG9jcUdxUzIzUVl0SXRscHBzU0tq?=
 =?utf-8?B?bTdWTS9JeTBLV1pGZ0NDWG1wTTFaVDZQZnBuV0hBRGFKV04vUUFBU1Q3b2p6?=
 =?utf-8?B?Rmd6NDdkN2xwK0hSRFEya1l2WnM2TW9uQmJ1ODllbVIyUkN1aVlQUjlvdTd4?=
 =?utf-8?B?a283eStuWHByczBRRjNjQndlaFp5bVdoN2w1WnRjY1BHOTJtb2tRZFdENVVF?=
 =?utf-8?B?NzFPSmFISWFXaGd6aFJjMUxJSkJFeXhJa21oekpBNUFkTmYyWHpwYS9ETC90?=
 =?utf-8?B?NFluRmpHVGdINnNieDB0Yk5qWVZLZm1uQlpiUjFDRThvL0ljSGNmaXJXWkQw?=
 =?utf-8?B?Vk12dW9kTjBHZVRIUS9rUEdkN0NrTkZ0azlmYnphaEhrelpxU2dFK3g5SnBT?=
 =?utf-8?B?VGwyWU42UEpldElaMTUzS0dreUhtMDYwRjRXQ0E1bVVLcjk2Y2htYjdMWjZZ?=
 =?utf-8?B?UUJ4SGYzNldsc0l6UVpuWXdKNjdKRVlPMWxyRTk2U1ZraWF3eTJXbjVVMTJY?=
 =?utf-8?B?Tmh3SG9uc0FSaVFucW5Ccjl1dzFNVzBQL2w4MkRnVkRNRERrWUpQdVZxNHNq?=
 =?utf-8?B?RGR6eGR3L0kvYlVhM0x1T3ZHS0I0R3p3ZEFMNHdqbzBhZEZucW5NbnVic3RZ?=
 =?utf-8?B?TTcyMkxxZzBoNnRhaDFzS20zUUo4SURtSERJUzNmeGF4YTBDTVBBMHpMMzdz?=
 =?utf-8?B?ZDBJVEtYTlQ3YTNJWkxmcGVPNTlqN1dHbWszcG9RZDlEMkhVZzBzQURzTU9T?=
 =?utf-8?B?VlBkRDZ2VEpuWTIwQlJiay92dXZldGRycklZNGp6aW80WVhCNDBvc3dEeUJD?=
 =?utf-8?B?bEZad0RnRWVRYmxjK0xFcmU5S1lYMkRwZVJBVFhlYUUyaGppaXFxODRCS0Ir?=
 =?utf-8?B?QmFDdEsrUkZPaXlRd2JOUTdGeElTcHRPNE5YRHF0YUtXV2VtcnkwaG93Ylh5?=
 =?utf-8?B?cWJtZVBrdXB6SS8raXNQT1VPVGpFUm5yQ25NbGplQW9nM1lZbWVyUUlxQUtT?=
 =?utf-8?B?YVlGRWRCbWo3RkdDVlUzTisvRWEwMmlxOWNmeFg2OUhBTWxPYnYyZ0FheTNq?=
 =?utf-8?B?Y3I1ZGltMmNWT0dSaWhJeEFwV3YrM0FZWjRLclovZDlIaGdqUEpBaURFVGc5?=
 =?utf-8?B?WlA4d1IvU3FIcFAwR283VWZrcVMvMVM1dEsrQTdMMEpGWDRuVkdnb3F4SExX?=
 =?utf-8?Q?Tg6uN2d/CsOIebX6BHLxJbk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f814e3ea-3950-4c2e-3ce6-08dcfd2751ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 23:20:50.1298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnSdaiPx3njnNBQXUs171IYrSG3tBBTKOZZzbp2gKcBXH4dWbOxBkFmymiiXJ1LdgbULighOsEhhzi0+KkFeNn11jLpP3RL06bQMs16GDH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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




On 10/30/2024 3:38 PM, Zhanjun Dong wrote:
> GuC to host communication is interrupt driven, the handling has 3
> parts: interrupt context, tasklet and request queue worker.
> During GuC reset prepare, interrupt is disabled before destroy
> contexts steps start. The IRQ and worker flushed to finish
> in progress message handling if there are. The tasklet flush is
> missing, it might causes 2 race conditions:
> 1. Tasklet runs after IRQ flushed, add request to queue after worker
> flush started, causes unexpected G2H message request processing,
> meanwhile, reset prepare code already get the context destroyed.
> This will causes error reported about bad context state.
> 2. Tasklet runs after intel_guc_submission_reset_prepare,
> ct_try_receive_message start to run, while intel_uc_reset_prepare
> already finished guc sanitize and set ct->enable to false. This will
> causes warning on incorrect ct->enable state.
>
> Add the missing tasklet flush to flush all 3 parts.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9ede6f240d79..353a9167c9a4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1688,6 +1688,10 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   	spin_lock_irq(guc_to_gt(guc)->irq_lock);
>   	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
>   
> +	/* Flush tasklet */
> +	tasklet_disable(&guc->ct.receive_tasklet);
> +	tasklet_enable(&guc->ct.receive_tasklet);
> +

It looks like we might have the same problem around suspend/resume, 
because AFAICS the tasklet is never stopped anywhere except driver 
unload. Maybe it's worth adding the tasklet disabling/enabling to the 
interrupt disabling/enabling functions, i.e. 
guc->interrupts.disable/enable(), so it's automatically called any time 
we want to disable GuC interrupts? not a blocker.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   	guc_flush_submissions(guc);
>   	guc_flush_destroyed_contexts(guc);
>   	flush_work(&guc->ct.requests.worker);

