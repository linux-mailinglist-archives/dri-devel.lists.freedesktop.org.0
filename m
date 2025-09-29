Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E1BAABC9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 01:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18B010E25C;
	Mon, 29 Sep 2025 23:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NL3hutNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9EC10E25C;
 Mon, 29 Sep 2025 23:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759188136; x=1790724136;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9Cb0oSHDzaJ/t20kNIefPAC0aMxX8KWaB5lFv3ikOuI=;
 b=NL3hutNPPHYexzU2opDb203TUbSjwme5pLy1wgZFuJtVTETKfmRfhEtD
 /QKXZfbYASt6MamLP2j2WvHnUWB94GMkD9ZYlbseciipd0EVgyqVjhQ9i
 SILRXglsAE1psZzDvD8VIRl72tyNHyjJrxp4E8lVqwOALJ2PoaPAING+u
 /N1iN7X6dU+TFkaQUW22D/3zBitftWyJpCSbfUf55qc/OrsfgTW4pjEXs
 TFgYIegCEzHjty3oVCthM0DJlzYQOdzW/Cf2werGXKLySVTdilcOy3PNG
 RbeA7HykXMWvdx5wQHn4IeiftLOJ/TXBpHN/G48we3skwHbGLPF2bb3ck Q==;
X-CSE-ConnectionGUID: HJUrUzcdR9+WJvRfaFS+8w==
X-CSE-MsgGUID: 1Sq7I+GzSWe1fJ5I3YxGcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="49000854"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="49000854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:22:15 -0700
X-CSE-ConnectionGUID: 6jUDSXIYQ8GTjvoBMA6/2g==
X-CSE-MsgGUID: bgYw/nykSxq5sGp6v4rbCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="182381563"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:22:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:22:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 16:22:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:22:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HddBX3q3T6hW7VofcP0CRQk1+pkyTrkwi3u8t6ovPNJ8H5oS0YDWcb3ywYO6UitqTrknp90SuLw+GTA9fkY6fGc/CdUN7d0/LK9zmw3xbwM60HUywF3G52NwdLAG7UjdSk++0aVGIoLOKo/ATzqTv+lZpsikG4i8oVCEdr2kesRDvdziXiB38P9KKbiCgADEdCHlUcflJjS4XpuYmZl4b+RQYxedR6nycjVJZguYjP/ewcif2JG7OcfVO0abwN8t8jwB9UqHW7ZbjJkd85Pv4eWJBAujuh+1s1Q/nuTfteGUnxh5S+oNK7aym5uwdt/QZUJGhVhvYpWt4HBE0fjueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONeUJdlOGQJG17FpX9xfr9HDXIP9cwBH/Ezb/HDJ+JI=;
 b=grmpNTKl7Op9Ft6BI48jnj9AHiDU65olC4/CVkTq9bsVL0MuyOTMFa87MDXYWBif5/OBZhKKemrI8htXDPoBE2ej+iHZSix9UvXda6ZSJZFeTNkT2a9KdLpC+jqo2uA67cICBHDj2COTxR+Kr3dCca77ZucfsPW/4kDuAyFv30DzxJ3DJj35oX1iJaDK3e6qCeRtEe0I1LNt0atwcSoA9rcVnYEdR6HIckcLXzlhk78FlT6uVd27Dq0gtE+OkTDi7CodeE7MKWjYyRSY0xA1h9ngsdlGfAwAnAI3umq5AkWvY3plcbpcjVvOOiR/0/OfE/KIGjRl/B7Pcjxh/Qeo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 23:22:13 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:22:12 +0000
Message-ID: <d39b9747-6916-47ae-be6e-f402efd86c1b@intel.com>
Date: Mon, 29 Sep 2025 16:22:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/i915/guc: Skip communication warning on reset in
 progress
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
References: <20250929152904.269776-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250929152904.269776-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a649887-0fcd-4983-3553-08ddffaf051c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlZMTmxoS21qNTZQS2dLM0xIajRZbHE4Z0VXRUxJM1BLMG9hRUdjcWhPOUta?=
 =?utf-8?B?dkxtUkhQTVJyaVVaditaYWNRRWlCdjJDUFZMR3VxTGMvWFNMSThveEJ0U1FG?=
 =?utf-8?B?bElnMVI1M2dCcFY2VVpwenFOVktNRWFCTXBNMWVQM2RGTEZtMkxUSkgxczBl?=
 =?utf-8?B?cVlLOTNaUC84NC9YWVJwSFl3Z2FvZlFBZnJUU2xHTUo3OU96SDhhUHBxQ08w?=
 =?utf-8?B?dW1wSDl6TXRTaXltWHdGb2FKNnF4bElpeHpzRHNBNEZHc0RFL1pBQUhJRkly?=
 =?utf-8?B?N3gwUnNyaThoU2pJeWhwWGhheGhRbmVicVhRSXNxaS9Wbm0rbkdIek1wMUho?=
 =?utf-8?B?R2NXK3VwYUY1akxlNmFFVWJoTzVQUVlXWHlmRjE5K0hrOXhQWGJOQkxyUkRT?=
 =?utf-8?B?NllIVEJDSHN3djJpZnBlOXliNUJBeThBaXhwbE95UEM4TjB6d1lSTlc2d2Zl?=
 =?utf-8?B?OTZ0VFNGbmtPYWNFRThxVkdTZHlPMCt5OHpmdnAvTkRGZkRZYVpCTDI3UDA1?=
 =?utf-8?B?K0U2RGpJOFhaZ1pvQ3loT3VUTVJkUHlGR2g4QU1NTUYwVDIwWE5aeTR3MVMr?=
 =?utf-8?B?eVRZUURCSVJzdmlsZFByYS9tUzlkNG1vNzNmV3ZhZnVwdDhGOHhFWisvZzJy?=
 =?utf-8?B?NElSdnhwSTVSUE5PZHpaRnBtalhjdGNzaXZZaFRjaWFEK0swbVk3ODNNV1Vv?=
 =?utf-8?B?WS9MYUNBTUFYbm1SamtkTnphWVJ6YnUyNDdVQzlhVjJhdU5JYW0rTFpBL3FS?=
 =?utf-8?B?VFlHSlRqdDZUcFVTanA5MmZkOHNhR1NFNGpPZGIvSUlOT2x5UkpSNkRpbVhD?=
 =?utf-8?B?Y1ZLcnl4eVcvaGhIaFBBbUhNcWVXcmVyUHpUc3g5SkcvNHVob1p0WEdhNm11?=
 =?utf-8?B?bjQzTWUrcnVCTkZVWVRtcVNHSlFWbVlRcklzWmFKcm5USFJ3cVZZdmFIR3px?=
 =?utf-8?B?MjlaajVoQTYva2V6ZlBiOGlCWXZNeXJiazJ5Qlo5NkpmdnlqK3pRTThqRGtC?=
 =?utf-8?B?VFhwcEVwVG9Ea292QlZxazJjdW1SZjd5RlBZWjJZdWdoNk1STEJxVU5IM05C?=
 =?utf-8?B?MDVzbmxQUXRvc2owSlVPM1lEQ2lSZkJodUJ0U2FTRjRodlZBMFZPYncrZndF?=
 =?utf-8?B?SVJEOUFSdVgrNlE0UmdyOTRnSTU1b0VOb2ZZQzE4N1lQUHUzeWtMVTJTUkUw?=
 =?utf-8?B?M01ObytITGtKSjd1dllQTDhiMHQxMGQ1elJTUFhnMGgwMXB3d2pCNFcydWs1?=
 =?utf-8?B?RlhBV0lGWnNlS0d4cHhqdFJ3aGFVZjFnVDgrdHEyeGVVMmVoUmU3cWxhVjRZ?=
 =?utf-8?B?VHNFVUxDSG8zVTJSeWUydlBpSWliV0NOamlROVpGMXA2YWVUeExaQVBRNmpq?=
 =?utf-8?B?OHJNT0hLMHczTk1xUDU3VHFrRElLaUNkYktTdk1Oa0ZnR1gvRTlZVW1BUUJF?=
 =?utf-8?B?NDJRTHlSUHJwSXh6NGVLRHFNVWU1MC9VcUxqOWt4djJMeUxsZUJ5VFh4MWk5?=
 =?utf-8?B?STZscGduT3dRVzF4N1hwL2RXNmZHbTY5eUlCek5OY2JuemYyL0hJYVJUdkMz?=
 =?utf-8?B?MjFpRnIyZ2kwSWNFK1F0RnB4R3dROWZaOUQxdXNzR1kxQVBHZytlcndBWTF1?=
 =?utf-8?B?QWVNbGFNamdCejY5K2ZYMWxaeGZNd1M4UGNlOUhLRGJ6VzlLenZ4WFlDeDN6?=
 =?utf-8?B?QVV1SWZzY0dKQllxVmZwcjFYd250OTNid2NqMzcyQ0NmZnY5NzNtbjJHc1h1?=
 =?utf-8?B?N05jQi9JOFNYTm1KR2hDT1gyOU5BRTdiYVpQZ0tMQmNBMDRUdVZNOEdlRlJx?=
 =?utf-8?B?aHVYWnhMMlorUENabDBGUzBpZEFWTWkwcU9TWitCVkNjbFdZUm14YW5JUFRx?=
 =?utf-8?B?L1RaRzBNNm82QkJDL2ViVk1mV0dVN1paMzhVbTQ5Y051WDFmbzVLeHo5ejZG?=
 =?utf-8?B?QzF5NDhrRjY1Y2E3U015aktKRTdxdXdjVjlKY2dqZFJwMng4QkxLbGV3Mm0x?=
 =?utf-8?B?cnhaNGhxelBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2Vjb2ZMdzhqVHo2cGVuZk1DUURML2JoajgxdmRVWHdrSUMyWFduV2JWMnlY?=
 =?utf-8?B?UjJJTHhFZ08ydFZRRmxhQUpxbnVYWS80MU4rSk5remIvVmhQeDlLakhEVEhQ?=
 =?utf-8?B?NHlHSVF0V3pQN1JsVGMzRXRJYmdsWGVyZi9JMmljNnVRcXZYalY5c1hsWUp1?=
 =?utf-8?B?dE1EVTVRYm05Y0diSWw1eVJyTFZVMHlTMFA2U3pWbmU5RnhobE5tRDhxUW16?=
 =?utf-8?B?RkNuRkQzbzZuNGsreEx0eiszZHJ5SG55ZDlOdTQwVldITitPL0EzSzQ5cWdG?=
 =?utf-8?B?dExuM2N4c2Q3NlhZeklrMjAydnF2b3pBbUp3aEhmbjFCc0RoTVd2ZDNoZDk1?=
 =?utf-8?B?dVJoaXduS2k3SnZjdWdNNWNhdkhTWmV2YmtRdEdhK0hhVkVYUXhSaDJSSUor?=
 =?utf-8?B?MXFSeEZ5ZEt2dUxoWFRON3lyeHdxSDAvQWlvMEViSTkwcTJqWHRRVEYwQUZW?=
 =?utf-8?B?Z1E0bVZ5YTlZZXUxUkFMcmpucTduaVNVK1IzbHhVekJEakVENVpxTUtIbi9h?=
 =?utf-8?B?WEpJcHAwTjRjeTJnRFd3ZVBQczJUUk5JeStWTDloWEdWL2wyM2ZZNVJiMDNr?=
 =?utf-8?B?T04ydjR5TEtYTVpSQ2prTFlQOTJGRFBTaUhJdFhmSjlLemNHRzh0WDlUYTR0?=
 =?utf-8?B?UzJxNjBCay9LU2NhaGwvWjZBSDVXMk80a2JDVEozRlpWdTlkaFVtUGs0RlV1?=
 =?utf-8?B?Rmdicll2VDRzTkY1cEtlVGRCM0FJUjFDVlV6TUpyU2M1blVHeTNrRzhiaEFM?=
 =?utf-8?B?NEVkMEIxU2Z0Z29icXNvdUJlUzhWS2UyaS9pM01rVGhVRDRGSFN5WDZxRlkx?=
 =?utf-8?B?U0NnVFY4Nyt0a2MyQUFmRXp1eGV2NjMrdXB4cmZSNU1iZkhhNWY1d2swQ2Ju?=
 =?utf-8?B?OHgvQllsQ0JCYjUxaEpCSGd0RHpOOFhxZnZIWjAvdXBVMTZ3TjdxNTV0ZHk5?=
 =?utf-8?B?SWw3QWtyQ3lRcjBidFdiV2hiaFJ1QzVnKzhvejg5T3lNUy9hcUNmVys3U2Vw?=
 =?utf-8?B?eVgyeXIxbDhtWDczVzlodEpaaStiS1hSS0p0ZUUvMm1yMWdRblk2OXpYTC8w?=
 =?utf-8?B?S3l1bWxtWEZrZHdiWXZGdUErMHFLS01ZVTVvYXZ1NUdoMXU0OUVEZkdrUFNT?=
 =?utf-8?B?OGtWSEVheHBYMzFtU0hOOTA2OEhQVjFhOXF0enhSNmcrMHNSZHp5ZHA0ZnB1?=
 =?utf-8?B?QjRtaUZzN2pJcUpaaThaMzhOTUJ5NzJDU09uMUs5TXh2SGtDelZRQTNSdE5k?=
 =?utf-8?B?NHFPLy85U3NQVFAxaFpqSDFPWWNyRGI4Y1Zlb1krNElOWHlGU1ljbVc0NXhz?=
 =?utf-8?B?UVJ0VVJqRHIvSllJTVovQUNkbzAydWlwc3B4MVlNekVndkdzUHgrSjU0Wklu?=
 =?utf-8?B?RmwxTjNreWRaTDhmODU0SDNVYWs1Sy9USEZrRGxDYnlLT0dZdVpPU1pXbFp4?=
 =?utf-8?B?aEQ1d3JtS2RqYXRKdVZ3QkNLZXdRa2xZdENxSU5mNlhRak94U3paQndZMm5T?=
 =?utf-8?B?T0lUVVdObDIybE1QUnU3VmVXNWJGVVp4a1hKTWpEc0Y2eFloNm5sak0vSlNv?=
 =?utf-8?B?ckh1dDZUWXJzU2syeUFxUEd0N3dtWCtLUFNtTitnMFpSUjRmdEQ3Z3ZqUS9h?=
 =?utf-8?B?ZGt0WFpYTUtMWW04OE5GTkVvVUN3K0VZeE1nd3lQdW1ZL053czVaNkcwenpX?=
 =?utf-8?B?cTEyZlRQTHpaWldJTkhBSDlkaUd3NnlEUEYxSFZORWRjQ2J2OVhXNDRHU3la?=
 =?utf-8?B?L3BMM01jZDN4cEg3VnNrSmZKS0lRM3p0a2VXaS9RaGlTTDRhZll5aURqZEp2?=
 =?utf-8?B?ZXk1TExWcWpYZmVGdU5wV1kxb21WYllReCt5QXBEd2ZQK2pwb2NVSGl5Umky?=
 =?utf-8?B?aUNneG4vWnk4Ui8xUDlDWCtyVHMxZllNaXpvQ2k5MExrR0lpMjdqZFVYUkV2?=
 =?utf-8?B?SW9ldVFKNmlZZk1EcEZRSWJmWVBGNUZhTlUyS1BuSXd4TEQ4RnNybmtKUnA4?=
 =?utf-8?B?Q3dDU2RnT1loOFk5VlM0T1hwejZhZGlWM0JIL2Fmb2xMQm5EQVVwUjhxcWR4?=
 =?utf-8?B?dWlCWElYTi9iTXBKM2tVbWZkNzNwNG5ibXVydGlUeGZMMlFwMHVuSk00YTh0?=
 =?utf-8?B?Q2tMelFtRktCc1pHcDJoRVc3eUV5R1Vrd3FrZzFmTUZpNXRzeVhiZC8xSWY1?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a649887-0fcd-4983-3553-08ddffaf051c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:22:12.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDFW3Y4L0fLepHBOcnqH1nb8O4zNjPXqC/BKDTth0grDvziRickSgu9eXX3xGpseFnov8Jd6yo+qCvgbeXqkAWnE9jS0FMOsK3w4DMhKerI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
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


On 9/29/2025 8:29 AM, Zhanjun Dong wrote:
> GuC IRQ and tasklet handler receive just single G2H message, and let other
> messages to be received from next tasklet. During this chained tasklet
> process, if reset process started, communication will be disabled.
> Skip warning for this condition.

LGTM (Other than the minor comment below).

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Fixes: 65dd4ed0f4e1 ("drm/i915/guc: Don't receive all G2H messages in irq handler")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> Cc: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
Need to remove the comma between the last and fname here, I think. It 
creates an invalid Cc when doing a reply-all.
> History:
> v4: Add code comment
> v3: Add skip on interrupt disabled case
> v2: Update subject text, removed fixup
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 3e7e5badcc2b..2c651ec024ef 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1325,9 +1325,16 @@ static int ct_receive(struct intel_guc_ct *ct)
>   
>   static void ct_try_receive_message(struct intel_guc_ct *ct)
>   {
> +	struct intel_guc *guc = ct_to_guc(ct);
>   	int ret;
>   
> -	if (GEM_WARN_ON(!ct->enabled))
> +	if (!ct->enabled) {
> +		GEM_WARN_ON(!guc_to_gt(guc)->uc.reset_in_progress);
> +		return;
> +	}
> +
> +	/* When interrupt disabled, message handling is not expected */
> +	if (!guc->interrupts.enabled)
>   		return;
>   
>   	ret = ct_receive(ct);
