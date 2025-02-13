Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB5A33BFB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 11:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC93910E2C2;
	Thu, 13 Feb 2025 10:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuvCBlL9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB08C10E2C2;
 Thu, 13 Feb 2025 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739441169; x=1770977169;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UqZ6pOgM/QUoBCk5jalIaIPWdkkjiDi88F0vUDFmXug=;
 b=MuvCBlL9YN1tBd59tao8pa3gpO8kPxG2W7Cy9x+Oh1V+IkGOT2xri9de
 Y4poKB3mf898bQiDs6eLYZIEjCzke33gc/TEkeMeFcvUjkQwigyRAToEt
 SryiIvpkE8IYx9v2DotieBB2VRoYuew7RcNu84e9hteVC+KkUekENoRJL
 kMRnvwOwn3piyX7HPng/SQ0CdWsSWRmlcrAe+7xNMiO1B3xMJj/Uhcrit
 1axmncyPEEWUwjNYqz7GwiCWP693zx8DTGkLb1uL7Xpp7a0Bvf0GfE6Q3
 X2JhiCxGhb0IrsMPsbVEMug7YOyZpDOLMUbHh1d4iknc2yH4ugLqtz+7y w==;
X-CSE-ConnectionGUID: UBUmfIHdT9K+uEnJZGcyyw==
X-CSE-MsgGUID: BM8iN24pRryKBxRnnVo7LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="57667441"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="57667441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 02:06:08 -0800
X-CSE-ConnectionGUID: lDOccwcDRAy7jjYesw1hsA==
X-CSE-MsgGUID: e71mJQVrQ+O9zAhBLEjhLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117710439"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 02:06:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 02:06:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 02:06:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 02:06:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGvTNa8KqyJQAgIWTNfQy/VWZb2QKKOHHJ2OI66IloHkvc6jnX7I00AoG8lu6kKdQIUt26Xk9wgBsyNHcl6iZN9OGhldpJb0L3aC/yuny1jemYJUeMEJP/UeqIZ8Sl4pX/pSrH4KfgG+jeXGfRjWj+I1RkteG7VaS4uB2bnDnDLOfVAz20sdhCHpWYwMHTJo2Qv8b3hHPEhCBgALJwB95vSDFemLPwELmpSGbPJ4OofZKnJiTcTL04gqQej96Atp4uh2OHr8QJSTRNlE9r4IyBchum5MGkjPAXp67KgktXD1eDgd4GAyjUsv0YIOOA0DZWPQJO07SaehGt0bAweofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsxMoUWW26MZ4E/7bJ1tLuKZtdLM87wQs14zmUt11r8=;
 b=AwpjIUnMNWEzJQyPHO7twQNu4LV4hssIf9dmK9stjasq7+spV7nz0HnUcEUlf+mu9pSfxVz/rOjnE5bE0ZAN5ylGZdkkaxVTmAwZ6V69dEz8fv0GgbwQ14iBYRwkZ6zVJYqm45au9KPOKxCAUayRNHfJIk4S6G5A61U95cf16OsMaf9josjiFcyew9jFXuxLb2ULqIlqC3HbsnJkgWnJhWizpLbPZ/nFE+GRtuQvTFJUZbJ6OKJCZJ2eiBFot0hXFsQGSe2uEgkGCm3ThY9i5qfMC3lPeoPXRAk5v6AA8kUOEuJSRRoZEYaDZHp6FLTwXkfT0M17COSTrrcqRzZY+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 10:05:50 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 10:05:49 +0000
Message-ID: <04daa324-6d95-4845-b0b8-a065c5d1f624@intel.com>
Date: Thu, 13 Feb 2025 15:35:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/32] drm/xe: Add SVM range invalidation and page fault
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-13-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-13-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 02400017-ef00-4cc7-eab6-08dd4c15fdec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2N5ZFkyVXVZTTNEbVV5K2prdUhGWkVNbG11NHdpQnhRSkFRVUl4L05FMFE3?=
 =?utf-8?B?YytPOVNKRTh6ZTFNWXhpcEhtaGpQdUdTOXFQK0xjMzhPdGZ0VjVIMXBuQ3pm?=
 =?utf-8?B?SUtRaUVZcXczRkl6N29pNWdKU1JDcjhLY0x5clU1YzcycEgvTUVIcW1DQzVY?=
 =?utf-8?B?ZHRTeElweXZJVWhlaXlGKzRLbWM3WjZNdlFPb1ZFRmd2VVlydWtzS2VlazFW?=
 =?utf-8?B?a2h0L2JCaFFGZldhNm8xeDB5NVQySG5xSWNLeHM2TkJBWEI0TGdnNFU5N1p3?=
 =?utf-8?B?UzhJVWZLUlZMUFpqc3VCaGJsNlpRUCtTSjhhRWRqS00yT0VGZktaZDNjTk0z?=
 =?utf-8?B?TlMrMC9uMGNBTDdhVlQ0SGN4WHFCL1J6Ti84K3dLaERwTGZPR3ZLLzZhMzk1?=
 =?utf-8?B?aGRSc25tZ0NCdktsdE1zSDQyaVVKRHhPMU5QbFE5eVpYdVFDTWQ0MTZjcC9F?=
 =?utf-8?B?MjE1TWhONjVSYnZvZ28vYTNYUFB1T0JYWUF3ejN3UlBCdEJLSno2dDFpdU1s?=
 =?utf-8?B?SXd2V2hWd2xiMHNUTjdzRWxSZ2tFNCs5bXE3bjhLdmdtcVBBRitLZ3c1NVVu?=
 =?utf-8?B?YWdUanhqd3lnWlZtS0o0eWRsMm5XVXFDS0JWN0FWSDZmQWFrbG1zdGRSY0lu?=
 =?utf-8?B?cEtoekY2eUdBVDlGWGFvV0dsTWtRUDlKNUlWMW9wdUprK2VZYkE0Y1c1RGlY?=
 =?utf-8?B?MFhaaWhDUWF5b2lGdXgwcXNSNmhnUzM4azlOZVMrS0ZNcFRuRWk5Q2syYVVD?=
 =?utf-8?B?SkZCc0xTRndwWDBTVVlhM2R4U3lTZHpTZ2pXMjQ4NHByTVFGZDVncUVRUmdp?=
 =?utf-8?B?U2QydmJlSXMzNXlPOFVyc0tsdk9OVzhVY3VUYllUdXNsU1hWbW1GTkg0UWVS?=
 =?utf-8?B?eWRhNERrYWxLV21OSkI5YkI0Ni8reFNaVVJUM09zOGFLRmJYU1NHMlltZ0s0?=
 =?utf-8?B?SzRsd3hkdlRpdUtYbWwwcHVMNXJsbEJsQzlRL0dzOXM3ZmFoOFIwWURtUjBB?=
 =?utf-8?B?Nk85Sm10eTlFb1d0TDgwSTVtTDh1d25MRk11aER1YklGQjNtSE1aRnFQdnRj?=
 =?utf-8?B?bG9DRTN6T2FDU0NlSzVTTy9qRm9iNERLRHpwdWFwWGV6ejEybURVMVBhc2Iz?=
 =?utf-8?B?TFJvRGV0cjBydzZtSVZQcHVqOVlHNmRYb2p4WnhaNkNoK2lPZWV6MzZKUnV6?=
 =?utf-8?B?WC9INVlLV1hNODJpK1Z4KytZUXBmckNzbGxwYW9HQnpSZ01XVTJJK0xzamZM?=
 =?utf-8?B?ZDFETEt6ejNvMkZ0T2JLc29MUm55SnZyNlQ1d3NNQkdOcEpKZEhuSkFmK1pY?=
 =?utf-8?B?N29uSTZwTjhEcVozcDFBYkpZRy91TlA5bHJ0blRhUElGYXF1UXNQSGdvU2Ur?=
 =?utf-8?B?bnRCZFFLS21yK3loM3liL29JWkhxMkxsNUduZ0FselBQOU81b0FRNFVFUW9L?=
 =?utf-8?B?OW1HWjZWQkVWcXFYWmFaSHpJd2daZ0M4L1k3TldFSUNUUUpjZFVQbU9hWWha?=
 =?utf-8?B?RHFBOW50TjNRVWE2RldJdXpKeXF6YXN2NHY0MitSb2VHcDdnblFlbHBLS2Zq?=
 =?utf-8?B?MXV1TG0xR0xEWDJWYlBVSS9OZHBYZERVMWY2TGdSV1NCalBkN2xWL3FnalEv?=
 =?utf-8?B?MW1Ea1M0djVzMkRHeDVOU2pQbHA5UjMxNmdTMCttNjlvQ25EYzROSTZNMmlj?=
 =?utf-8?B?Ym9wL2NQOG5hR2dvek41Q3B6cEExR25aY0daMXAwL2J3a3hJNjcybGZhUmFR?=
 =?utf-8?B?YnpCc2lMTlFUbTkrTjJMb2NIVGdUdXlzZ3ZOUGVUNHBVZEJ1UXFDZ1NVZk82?=
 =?utf-8?B?ZjdsQXdhRklud1lZMGJvNlVVOVZ4U0g1bExHUUJEaG40VVFzaitlOHlrRGJY?=
 =?utf-8?Q?pXbuCKPK5CGbG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDdXaFpxVWc1UWpiU1I5dEppSzI2aEs3cGZzTnpsOTdlcDRzbC9pd3A5ZXd3?=
 =?utf-8?B?bENFdWV2YU9MNy9QcENyb2hOK2FncDVvYVhoLzF6QlVhQkpjeThMRkVkRGU5?=
 =?utf-8?B?andZZDJESnpiSC9jWmRiVUcwQ0N0L3VCUEJjQ25kYkF4U0x4cmVoNm9LZyts?=
 =?utf-8?B?UWE3dnZYYkZsRnU1RHdZY043Z1VkQ3pydDM0NHpiMFBUTWdoZTZFYXdvZFlt?=
 =?utf-8?B?OFhKNE1BczlnMndvbk82YnpzeHNlV1JjVUl6ditoZUlxdmV6NU1qTnN1dFBR?=
 =?utf-8?B?cFBYbDhDS2RhWm1HOFlNMzR5US9XVGV2TEp2SVdWNFRFbURKSEpYeFJyTjlB?=
 =?utf-8?B?K0ZSOW45cFVqZFZ3MStLK0d0WmxBM2JCZ1dVa1ZIYjUyT2REalhTQjVhVlRZ?=
 =?utf-8?B?NVpVYjVZQTRBcEdqNU5xbk5Qc0FVYXRWRWYxUG8ra01xaUErN2psMkEwdTZ2?=
 =?utf-8?B?VjJtWUd2aWpIbG1PaTErdEZqK09QOURPSVR3OE1QbEhRU2VpQlRDMklURVZS?=
 =?utf-8?B?enFkSktMN0toeWYyeXRKcmJRVzlrbUxtdXdKNXk5ZmRZaHp1Z0VOalhNZTc0?=
 =?utf-8?B?Z2RydktnajNKVXVVcThjOFNMSUdFOGI5Zytma3NpUXoxcGYrME5HamNHaXVx?=
 =?utf-8?B?Q1NkbjZpakF4aVNCaThqenZmcmxoN2w1cGxwUlBsR2NFYmRGekRSSzNEc3Bp?=
 =?utf-8?B?TmNuemtXeDZxYzRJM0hJa0dBRy8rdzVlcjR2KzBaMFQvRE5EVHZjd3RySE1x?=
 =?utf-8?B?UWVEcllVSDgzNjdGbzRZVGI3M2VsNDhnR2FBL3hHYmc0QjNNdnA5cUdzUitE?=
 =?utf-8?B?cW01cmcyZEc1a2NVVVhLWHlua2RnQUI1dmdvN1BSVEVheVRMeXA1YjNXV2FI?=
 =?utf-8?B?aW9JZG5nSkpBWXZidEttRjQ4dU40ZC9HWDVWWlJLNjRIWFBQVWprTzVMM0lr?=
 =?utf-8?B?WVYrTkZiODRSTmlmY1JWNnZmVVZEbE16UlRvYk1ESHV0ZWJkRFhUalZrWjZm?=
 =?utf-8?B?eklCRFZrc3JjQzdFZkNqeE1jWnQyaWw4N29HbVlSaGtoWHltY3M3UldxVnZt?=
 =?utf-8?B?U2NZcS83TlNUbDh3NDd6RDI4SmFMVDkreDkzNnl5RzJlc0N2ZlN0Q0Q2SnR5?=
 =?utf-8?B?OEtrdGpNMkdqMzc1QVFLSis3ZnNQaTNCcnNETHpJemdsalMxVWhGbTNaMlVD?=
 =?utf-8?B?VXlJY2NRcUFHRXc2a2c3d2g2a0VtV05LK0QrYVM5SU9Id0JUb2cxOWh1U1l6?=
 =?utf-8?B?THc4RU5mODR1ZlBURmJ0bDViS2hENnpFclc4UXpDdVNvWUxvUGdzMjBUYWN6?=
 =?utf-8?B?MlFGTTRPOXAyNjBCam1VK1MxZkw3TUNlRGlaakRWZEMyMGEwMXcweVNVVHlY?=
 =?utf-8?B?Zi9YT3M2T0JuZkNFRXpGN1M5bldKeDlwRmtsUU0vUWUyMk9TSXFGYldpa1Zz?=
 =?utf-8?B?UG96TE1VbHRabXNWbDVCbTFuTStkbzAxK2RQaDAwQnBTdlphM295VnZkczhV?=
 =?utf-8?B?VnhoL2RDTEd0b3JDdGIzcEgxaGViRUpQUW1VTDVHT0VyRTZqQ2E3R1BoTmkw?=
 =?utf-8?B?SzhLakFkanhHT1pqb1ArMnYydVU0UHZLQUxEUTFnMW1oUk5OenF5a2F5Z01X?=
 =?utf-8?B?SnVwN3RSSTRLZTMvbmQ2OHZWalRON21YU1laeW1JUmhMY3BXYU0zR2dxbjJY?=
 =?utf-8?B?NEljcG5Xak5yRXJoZmV1a1ZqSWZFdVRTS243WVlHdXYrTEhFQ1plL3ZYUUZw?=
 =?utf-8?B?eWkvSktoK2QrZFBBNUNORmEvbUpmaHNVNHFZR0tzM3Z0ZHR3UGg2R2R4VmRU?=
 =?utf-8?B?UC82OFd3L0tkWU9jY0ZRbXR0N2gwaUdhZGZsOW5zZUYyOExDZzZSM3NaYU9Z?=
 =?utf-8?B?cGlUYWFzWFlKQ3VTRHAwUXdTNXZIQlB2UlV3S2lWN2p1eU9mVzdDQmpoTFNq?=
 =?utf-8?B?b3lLeVFudENGYlFaTkFtQ1ozbnVvNHZWRWpmTlBFZHFaOXVFTE1SbWM0L1lU?=
 =?utf-8?B?Wms2c20rRWlkY1dTWEdJa1ptclVzZFlZOHA1SDdGVUVUSlFaZVUvbHRRNWla?=
 =?utf-8?B?bEF2eVZNNGN1aytDbjJXekd3KzE3N0g1alVwY3Zoc1BpdjhjVW5ybGFySUlL?=
 =?utf-8?B?M3BVN2hNbng2YkVwajVxc3cxa252YmtDVnlSd3dYMmc4ZUZzeCszdzRZaG1G?=
 =?utf-8?Q?pbK3D5v2jDDPZY+aisH1n4o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02400017-ef00-4cc7-eab6-08dd4c15fdec
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 10:05:49.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZA9NtmLK1R4v+3aKr9MfG81XptPiHBAtqvudsNmCTTu+w5KIlyHNjL0zbnfMeCGF69fswZJwjMBNgNoi3z3a9GBkQNMKxk5LZ8eBie2cM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
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



On 13-02-2025 07:40, Matthew Brost wrote:
> Add SVM range invalidation vfunc which invalidates PTEs. A new PT layer
> function which accepts a SVM range is added to support this. In
> addition, add the basic page fault handler which allocates a SVM range
> which is used by SVM range invalidation vfunc.
> 
> v2:
>   - Don't run invalidation if VM is closed
>   - Cycle notifier lock in xe_svm_close
>   - Drop xe_gt_tlb_invalidation_fence_fini
> v3:
>   - Better commit message (Thomas)
>   - Add lockdep asserts (Thomas)
>   - Add kernel doc (Thomas)
>   - s/change/changed (Thomas)
>   - Use new GPU SVM range / notifier structures
>   - Ensure PTEs are zapped / dma mappings are unmapped on VM close (Thomas)
> v4:
>   - Fix macro (Checkpatch)
> v5:
>   - Use range start/end helpers (Thomas)
>   - Use notifier start/end helpers (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c |  18 ++-
>   drivers/gpu/drm/xe/xe_pt.c           |  41 +++++
>   drivers/gpu/drm/xe/xe_pt.h           |   2 +
>   drivers/gpu/drm/xe/xe_svm.c          | 233 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_svm.h          |  32 ++++
>   drivers/gpu/drm/xe/xe_vm.c           |   4 +
>   6 files changed, 324 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 46701ca11ce0..3047b1ac024c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -19,6 +19,7 @@
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
>   #include "xe_migrate.h"
> +#include "xe_svm.h"
>   #include "xe_trace_bo.h"
>   #include "xe_vm.h"
>   
> @@ -125,8 +126,8 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>   	return 0;
>   }
>   
> -static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
> -				struct xe_vma *vma)
> +static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
> +				bool atomic)
>   {
>   	struct xe_vm *vm = xe_vma_vm(vma);
>   	struct xe_tile *tile = gt_to_tile(gt);
> @@ -134,13 +135,13 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>   	struct dma_fence *fence;
>   	ktime_t end = 0;
>   	int err;
> -	bool atomic;
> +
> +	lockdep_assert_held_write(&vm->lock);
>   
>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
>   
>   	trace_xe_vma_pagefault(vma);
> -	atomic = access_is_atomic(pf->access_type);
>   
>   	/* Check if VMA is valid */
>   	if (vma_is_valid(tile, vma) && !atomic)
> @@ -210,6 +211,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	struct xe_vm *vm;
>   	struct xe_vma *vma = NULL;
>   	int err;
> +	bool atomic;
>   
>   	/* SW isn't expected to handle TRTT faults */
>   	if (pf->trva_fault)
> @@ -235,7 +237,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   		goto unlock_vm;
>   	}
>   
> -	err = handle_vma_pagefault(gt, pf, vma);
> +	atomic = access_is_atomic(pf->access_type);
> +
> +	if (xe_vma_is_cpu_addr_mirror(vma))
> +		err = xe_svm_handle_pagefault(vm, vma, gt_to_tile(gt),
> +					      pf->page_addr, atomic);
> +	else
> +		err = handle_vma_pagefault(gt, vma, atomic);
>   
>   unlock_vm:
>   	if (!err)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c5060011ad43..a9aa1678437e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -20,6 +20,7 @@
>   #include "xe_res_cursor.h"
>   #include "xe_sched_job.h"
>   #include "xe_sync.h"
> +#include "xe_svm.h"
>   #include "xe_trace.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_vm.h"
> @@ -844,6 +845,46 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
>   	return xe_walk.needs_invalidate;
>   }
>   
> +/**
> + * xe_pt_zap_ptes_range() - Zap (zero) gpu ptes of a SVM range
> + * @tile: The tile we're zapping for.
> + * @vm: The VM we're zapping for.
> + * @range: The SVM range we're zapping for.
> + *
> + * SVM invalidation needs to be able to zap the gpu ptes of a given address
> + * range. In order to be able to do that, that function needs access to the
> + * shared page-table entries so it can either clear the leaf PTEs or
> + * clear the pointers to lower-level page-tables. The caller is required
> + * to hold the SVM notifier lock.
> + *
> + * Return: Whether ptes were actually updated and a TLB invalidation is
> + * required.
> + */
> +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> +			  struct xe_svm_range *range)
> +{
> +	struct xe_pt_zap_ptes_walk xe_walk = {
> +		.base = {
> +			.ops = &xe_pt_zap_ptes_ops,
> +			.shifts = xe_normal_pt_shifts,
> +			.max_level = XE_PT_HIGHEST_LEVEL,
> +		},
> +		.tile = tile,
> +	};
> +	struct xe_pt *pt = vm->pt_root[tile->id];
> +	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
> +
> +	xe_svm_assert_in_notifier(vm);
> +
> +	if (!(pt_mask & BIT(tile->id)))
> +		return false;
> +
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, range->base.itree.start,
> +				range->base.itree.last + 1, &xe_walk.base);
> +
> +	return xe_walk.needs_invalidate;
> +}
> +
>   static void
>   xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
>   		       struct iosys_map *map, void *data,
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 8e43912ae8e9..5ecf003d513c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -45,5 +45,7 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
>   void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
>   
>   bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> +			  struct xe_svm_range *range);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 79da859f02b1..42f415a88bde 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,18 +3,208 @@
>    * Copyright © 2024 Intel Corporation
>    */
>   
> +#include "xe_gt_tlb_invalidation.h"
> +#include "xe_pt.h"
>   #include "xe_svm.h"
>   #include "xe_vm.h"
>   #include "xe_vm_types.h"
>   
> +static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
> +{
> +	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> +}
> +
> +static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
> +{
> +	return gpusvm_to_vm(r->gpusvm);
> +}
> +
> +static unsigned long xe_svm_range_start(struct xe_svm_range *range)
> +{
> +	return drm_gpusvm_range_start(&range->base);
> +}
> +
> +static unsigned long xe_svm_range_end(struct xe_svm_range *range)
> +{
> +	return drm_gpusvm_range_end(&range->base);
> +}
> +
> +static struct drm_gpusvm_range *
> +xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> +{
> +	struct xe_svm_range *range;
> +
> +	range = kzalloc(sizeof(*range), GFP_KERNEL);
> +	if (!range)
> +		return ERR_PTR(-ENOMEM);
> +
> +	xe_vm_get(gpusvm_to_vm(gpusvm));
> +
> +	return &range->base;
> +}
> +
> +static void xe_svm_range_free(struct drm_gpusvm_range *range)
> +{
> +	xe_vm_put(range_to_vm(range));
> +	kfree(range);
> +}
> +
> +static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
> +{
> +	return container_of(r, struct xe_svm_range, base);
> +}
> +
> +static u8
> +xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> +				  const struct mmu_notifier_range *mmu_range,
> +				  u64 *adj_start, u64 *adj_end)
> +{
> +	struct xe_svm_range *range = to_xe_range(r);
> +	struct xe_device *xe = vm->xe;
> +	struct xe_tile *tile;
> +	u8 tile_mask = 0;
> +	u8 id;
> +
> +	xe_svm_assert_in_notifier(vm);
> +
> +	/* Skip if already unmapped or if no binding exist */
> +	if (range->base.flags.unmapped || !range->tile_present)
> +		return 0;
> +
> +	/* Adjust invalidation to range boundaries */
> +	if (xe_svm_range_start(range) < mmu_range->start)
> +		*adj_start = xe_svm_range_start(range);
> +	if (xe_svm_range_end(range) > mmu_range->end)
> +		*adj_end = xe_svm_range_end(range);
> +
> +	/*
> +	 * XXX: Ideally would zap PTEs in one shot in xe_svm_invalidate but the
> +	 * invalidation code can't correctly cope with sparse ranges or
> +	 * invalidations spanning multiple ranges.
> +	 */
> +	for_each_tile(tile, xe, id)
> +		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> +			tile_mask |= BIT(id);
> +			range->tile_invalidated |= BIT(id);
> +		}
> +
> +	return tile_mask;
> +}
> +
> +static void
> +xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
> +				const struct mmu_notifier_range *mmu_range)
> +{
> +	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> +
> +	xe_svm_assert_in_notifier(vm);
> +
> +	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> +	/* TODO: Add range to garbage collector if VM is not closed */
> +}
> +
>   static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>   			      struct drm_gpusvm_notifier *notifier,
>   			      const struct mmu_notifier_range *mmu_range)
>   {
> -	/* TODO: Implement */
> +	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> +	struct xe_device *xe = vm->xe;
> +	struct xe_tile *tile;
> +	struct drm_gpusvm_range *r, *first;
> +	struct xe_gt_tlb_invalidation_fence
> +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> +	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> +	u8 tile_mask = 0;
> +	u8 id;
> +	u32 fence_id = 0;
> +	long err;
> +
> +	xe_svm_assert_in_notifier(vm);
> +
> +	/* Adjust invalidation to notifier boundaries */
> +	if (adj_start < drm_gpusvm_notifier_start(notifier))
> +		adj_start = drm_gpusvm_notifier_start(notifier);
> +	if (adj_end > drm_gpusvm_notifier_end(notifier))
> +		adj_end = drm_gpusvm_notifier_end(notifier);

Nit:
adj_start = max(adj_start, drm_gpusvm_notifier_start(notifier));
adj_end = min(adj_end, drm_gpusvm_notifier_end(notifier));


> +
> +	first = drm_gpusvm_range_find(notifier, adj_start, adj_end);
> +	if (!first)
> +		return;
> +
> +	/*
> +	 * PTs may be getting destroyed so not safe to touch these but PT should
> +	 * be invalidated at this point in time. Regardless we still need to
> +	 * ensure any dma mappings are unmapped in the here.
> +	 */
> +	if (xe_vm_is_closed(vm))
> +		goto range_notifier_event_end;
> +
> +	/*
> +	 * XXX: Less than ideal to always wait on VM's resv slots if an
> +	 * invalidation is not required. Could walk range list twice to figure
> +	 * out if an invalidations is need, but also not ideal.
> +	 */
> +	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> +				    DMA_RESV_USAGE_BOOKKEEP,
> +				    false, MAX_SCHEDULE_TIMEOUT);
> +	XE_WARN_ON(err <= 0);
> +
> +	r = first;
> +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> +		tile_mask |= xe_svm_range_notifier_event_begin(vm, r, mmu_range,
> +							       &adj_start,
> +							       &adj_end);
> +	if (!tile_mask)
> +		goto range_notifier_event_end;
> +
> +	xe_device_wmb(xe);
> +
> +	for_each_tile(tile, xe, id) {
> +		if (tile_mask & BIT(id)) {
> +			int err;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> +							  &fence[fence_id], true);
> +
> +			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
> +							   &fence[fence_id],
> +							   adj_start,
> +							   adj_end,
> +							   vm->usm.asid);
> +			if (WARN_ON_ONCE(err < 0))
> +				goto wait;
> +			++fence_id;
> +
> +			if (!tile->media_gt)
> +				continue;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> +							  &fence[fence_id], true);
> +
> +			err = xe_gt_tlb_invalidation_range(tile->media_gt,
> +							   &fence[fence_id],
> +							   adj_start,
> +							   adj_end,
> +							   vm->usm.asid);
> +			if (WARN_ON_ONCE(err < 0))
> +				goto wait;
> +			++fence_id;
> +		}
> +	}
> +
> +wait:
> +	for (id = 0; id < fence_id; ++id)
> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +
> +range_notifier_event_end:
> +	r = first;
> +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> +		xe_svm_range_notifier_event_end(vm, r, mmu_range);
>   }
>   
>   static const struct drm_gpusvm_ops gpusvm_ops = {
> +	.range_alloc = xe_svm_range_alloc,
> +	.range_free = xe_svm_range_free,
>   	.invalidate = xe_svm_invalidate,
>   };
>   
> @@ -71,3 +261,44 @@ void xe_svm_fini(struct xe_vm *vm)
>   
>   	drm_gpusvm_fini(&vm->svm.gpusvm);
>   }
> +
> +/**
> + * xe_svm_handle_pagefault() - SVM handle page fault
> + * @vm: The VM.
> + * @vma: The CPU address mirror VMA.
> + * @tile: The tile upon the fault occurred.
> + * @fault_addr: The GPU fault address.
> + * @atomic: The fault atomic access bit.
> + *
> + * Create GPU bindings for a SVM page fault.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> +			    struct xe_tile *tile, u64 fault_addr,
> +			    bool atomic)
> +{
> +	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> +	struct drm_gpusvm_range *r;
> +	int err;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> +
> +retry:
> +	/* TODO: Run garbage collector */
> +
> +	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
> +					    xe_vma_start(vma), xe_vma_end(vma),
> +					    &ctx);
> +	if (IS_ERR(r))
> +		return PTR_ERR(r);
> +
> +	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> +	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
> +		goto retry;
> +
> +	/* TODO: Issue bind */
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 4569931db622..caf02138ae4f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -7,10 +7,29 @@
>   #define _XE_SVM_H_
>   
>   #include <drm/drm_pagemap.h>
> +#include <drm/drm_gpusvm.h>
>   
>   #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
>   
> +struct xe_tile;
>   struct xe_vm;
> +struct xe_vma;
> +
> +/** struct xe_svm_range - SVM range */
> +struct xe_svm_range {
> +	/** @base: base drm_gpusvm_range */
> +	struct drm_gpusvm_range base;
> +	/**
> +	 * @tile_present: Tile mask of binding is present for this range.
> +	 * Protected by GPU SVM notifier lock.
> +	 */
> +	u8 tile_present;
> +	/**
> +	 * @tile_invalidated: Tile mask of binding is invalidated for this
> +	 * range. Protected by GPU SVM notifier lock.
> +	 */
> +	u8 tile_invalidated;
> +};
>   
>   int xe_svm_init(struct xe_vm *vm);
>   
> @@ -18,4 +37,17 @@ void xe_svm_fini(struct xe_vm *vm);
>   
>   void xe_svm_close(struct xe_vm *vm);
>   
> +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> +			    struct xe_tile *tile, u64 fault_addr,
> +			    bool atomic);
> +
> +#define xe_svm_assert_in_notifier(vm__) \
> +	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> +
> +#define xe_svm_notifier_lock(vm__)	\
> +	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> +
> +#define xe_svm_notifier_unlock(vm__)	\
> +	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9cfb068f5845..7d16e34a408a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1559,6 +1559,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   static void xe_vm_close(struct xe_vm *vm)
>   {
>   	down_write(&vm->lock);
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_notifier_lock(vm);


LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	vm->size = 0;
>   
> @@ -1580,6 +1582,8 @@ static void xe_vm_close(struct xe_vm *vm)
>   			xe_gt_tlb_invalidation_vm(gt, vm);
>   	}
>   
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_notifier_unlock(vm);
>   	up_write(&vm->lock);
>   }
>   

