Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF5A141D9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 19:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2A10E1E5;
	Thu, 16 Jan 2025 18:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9umJpk0";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DB710E1E5;
 Thu, 16 Jan 2025 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737053486; x=1768589486;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k92Iq37cwzzqVrgk7FaqnF6N+R1DaibpvvPkkVRxCM0=;
 b=W9umJpk0KoFHFlL8vR46djveC7vO9l0jsdmuHjCnZKBqE+3nYZFliF7b
 SL3okj4vq+SEkkMys1itKS0qvCHmNDdO4LK5E7RaDL+DOmPqeXaPifyxB
 SCZ4S7qB6IgvSsfZlo7LU9CUQjDv3q/oj8GTkZfPqXxFrdnqFUw1mpdP5
 kKRWUSnd5Ccfk2NEbdM9wZSwwgz47qm1P54aYT0BjwRQPs6iUUKPXOA8I
 9VTFTtF9suXgrHAtuE7gduzKd478aDgijipYo9VK7nnnjZQCw27RoBtT4
 CP6dEKwcttC2ax54Tk4tTXbqUpfYdN/QD4q6w4Y6vrwObKWpf5stCaiFU w==;
X-CSE-ConnectionGUID: KkK75dfFQ7qRc4SQw7ub6Q==
X-CSE-MsgGUID: HqV4RwXnTwCobbjfKeGWmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36670346"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="36670346"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 10:51:26 -0800
X-CSE-ConnectionGUID: VsqQ1rwLRmWUSCxrPzUyvg==
X-CSE-MsgGUID: 6x0KRR6WS6C0NtVDLfutJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="136411241"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 10:51:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 10:51:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 10:51:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 10:51:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9ieMFYynlAU9y2fF0dFY8YP8Js+nu7tOIf9fuKnF9TaBlInfHR0tophnsDXmutDoy0Beeoh8cUyVkYj5kGNEtfsrfHUlQHN/t96PmJxLPIC/TRcunR9YEH8Lyz9D9K8vcLnpAixdL5wrchkLPUXTNCSBS3c+iro6NcsdIni7BngasyPLD42E/4t9ZeRqqwpMdxSutqwc6Ak2Zmtyf735ZpaB7mplLxUm4+Jvh8SDUQ0VuOltqIG0jaWF+IVaGiBLlLIPIxEmIOPNlRlV/87EozaYYcQGH5FljkvCyRuDDTfS/llEvXYcKOC6a/YgtCL7v6RFhf3djy/jYsbDRxLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZZroty3GdwzcyNxibAYcZSfVluXcRtFm/1Un4kgoTU=;
 b=J4bcZo1MeC8wmGB4kTKgf36hAGETPTwKwZGU0Y1HWAB3h6/CWmoA/Yi/6AxlgwvveOV+PsreRyVkAy0pZF0qj3/xnBMNYbT/wHEZ5FXXpMAeWs5o5/JLfw4jw1X/NDXxj5ExIjBrP/fQI2i0fb0w8wMqJ0WMs0Dkz5TpKf/1RrkomKhMjtnwqPipT+LC6o7DP0Dm8BW8diTY5+HImOgz/+Grpwxl9Wg2gepJzdz0d+WTIJtYPrOdXhYe1OTx1xjgArwASXppRH9P7FuqB9cU36SNLU/Za7mSp7O6+c31Gx78mzpAYidyqvK7VSVxzaulj3yAbW3YoGL0/Xeqr7+ZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 18:51:04 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 18:51:04 +0000
Message-ID: <e583d7e1-d643-48b5-845c-5666131e481b@intel.com>
Date: Thu, 16 Jan 2025 10:51:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/uc: Include requested frequency in slow firmware
 load messages
To: Krzysztof Karas <krzysztof.karas@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20241221014329.4048408-1-John.C.Harrison@Intel.com>
 <2qmdebuh4r5lkrq2ygbmbyjqtxcbinjocnb75acyjtt3jfgzkx@o3vbgzyi2kyf>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2qmdebuh4r5lkrq2ygbmbyjqtxcbinjocnb75acyjtt3jfgzkx@o3vbgzyi2kyf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 272da4a6-2601-4d2c-1194-08dd365eba7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkFlZ1BtODZQWFpzNk9FUmZHamFudkQ3MUhPRUpNbUlJZlFnQllNM2RDVWRx?=
 =?utf-8?B?U2xrdlU3aE9hZlpzUlRDL1IvWU52MmdBOGpCWkdTaGRQdWp5eWtWZi8yWHlt?=
 =?utf-8?B?Y05YZ1ZxSkt1ajRLVGF3NUxPY3VOL1pKRUxSRERmcGQycmI2SEIySHlhYk9M?=
 =?utf-8?B?MWRTNlRqbTErNytQQmRCNGM3SHFlaUZhV3ozM1hUQnhKd0hKZy92S3pHZkxW?=
 =?utf-8?B?NHFCMVl5VnFoUTgvWk9CSVRaNWJuazRyY2xLejhZcDlSYWZ3c0lKeDc4V0M3?=
 =?utf-8?B?bFJhdlplVzZRaXh3NHl1MS9MM0VDNUtlZnZEdU1IdjQzU05QaCtQUjdjYTNz?=
 =?utf-8?B?V1R5MWFHRnJBVk5GTnRxVWd6RnFGYzA2Z3NCNFhYNFJ4cUNwRnptOWJieWVT?=
 =?utf-8?B?VUg4Z2hqTkpaQWdLSnBpNmwzWDUxbjlOV0hJWS9qdFBsbGV0TWdUOG5reTY5?=
 =?utf-8?B?bDBSU0dVVS9SQ2NKbXR0QTYyN2tXb1lLS2JXMGlKNWdUNXZQRGJTNnAxcmRx?=
 =?utf-8?B?WXI0ZXpGQkNwWE1VM284Ym9vK0FVMEdDOTlzUnBBVXJpcG1YV1hObzRFdWNF?=
 =?utf-8?B?aUdHUjY0cWVxdS9iNlk0eGpzODVnRVVnUThHODIyV1ZVYnZJVkxBc0R5dyt3?=
 =?utf-8?B?bmtHVGZNNmg1VDJLTDFqNVZCLzVkT2hWRlZYaVhhOUVUZWtDM0JoUFpXNUtl?=
 =?utf-8?B?ZzIrUkNZbmRvOUV2TGw0SXc1TjJ1eE1XMTIzTVFpYWdzUmNlTlV6M3hPZnFy?=
 =?utf-8?B?YjUvVzFGRno5N0QrVnl1NGxWajJjZjRoUm41V2diL0xZQ1Z4SkptN0x6dGlZ?=
 =?utf-8?B?Lzc2NEtGS1ZBNnNlR2dVZm9oZFpabjNlVEpob3p1akFKYWVpRlRJZXprK1l5?=
 =?utf-8?B?UG82U0d0KzlBTEZnckFNaFNRR1VQM1d6SFNoV2xqZGxrK3RzYjR4cUJnajZv?=
 =?utf-8?B?TXZtWjBXSnY1M0dpQ2M1TVBvdTdzUFM1d2pVMGdhcUJCWUNyeXh5NGRpQ2hr?=
 =?utf-8?B?Z0tzMlppbEtUYlZESkZSZFVVK09tTExEOEIzd2FEUjl0TGk0QkplaFZaZG90?=
 =?utf-8?B?ay9KdUZBSSthVWNKcjlic2NZNjF5cUZjMWQ5Mk9BV250bjBmK0k4dU56YkxW?=
 =?utf-8?B?dXdvSngrQnRlelBqVmpZZGpXQjRCUE84bFlEWUJldjNXdndncTFoYUh5M1NW?=
 =?utf-8?B?TW1SdVNQL3BkMWsvSHZzcE5vRHdjRFR1em1CQkdjK3hEQ0d3ZkxUUWI3QjhO?=
 =?utf-8?B?NDl1cUc3bHdhVm14QWRMeU50djFxNXhaMzNBVWo2UXlhYWZ0aWh4elpmT1Yr?=
 =?utf-8?B?YWx6aitFaThKWFNQUjYvMFBuNlRXZDJscWVkRjJsV053QVBESE1VY2NKcjhp?=
 =?utf-8?B?NHJxc0R1dDBNd0tWYVRmTWhGR1dKcmJmamk0TGxCUmE3VTJlcEV0L3VqaXVH?=
 =?utf-8?B?M0RHbWJha1RsMUZ3c292SlFEMENRb0Z0N09RSFJpOGVmUkNBVDE1ZG1pUVgy?=
 =?utf-8?B?ZGJMWGFDb3Y2SkllSGc5ZVdJYW9Lc3dzR2FFdC9Cdkh5bHlhdlFNeTBYYzlR?=
 =?utf-8?B?cFJvQUhjOGNMY2FPb1hmWXZoMmo4T05EVDV1bHduanJuOHdxU1E4RWMwK0lC?=
 =?utf-8?B?WDZJWTZCbVF6M1U4Wi8xOFhTRWk3cXdpUncvNS9MK3VNRS9vNUNtVVhBOWQz?=
 =?utf-8?B?VENJM0hac0JPdjl4UWk2RTZ5M2k0UXN5V3NFaER4VVpLblpLNXBjMnowUENi?=
 =?utf-8?B?elVhV0RQa25zVXlLSGhlUGIyUW43TkcrUVJTTTNwLzlSeFFtOTB2am1Vb3Vj?=
 =?utf-8?B?TWk4azRjWGFuQVBSV1JiOVdhcVM3SEpLK0dtcmQ1aTB5cGtKRVNQKzlmYVlh?=
 =?utf-8?Q?KZlsVoXHSmx8r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnE3N216UEMwNEJZeGtRTkJjQ1orNDBxRjhIL2VlT2pRRjkySU1HQlN2S0xB?=
 =?utf-8?B?Y2NLTHVydGVzNS9vNUNYNDJBRFFIWTZSUW9PRjM2UVQ5UC9NWmJHVVZUZG54?=
 =?utf-8?B?TGRsWXNVMmRTREZWS1dlYi9OOGZqOWhsaUZQTXFtMUM2ZkxJRStMc0h4VnJE?=
 =?utf-8?B?L1RpK1dqQnMzNzJQbHlRQ0lNYUMwR2NGL3ZiejExcDg5Rnl0bk1OdTRTT093?=
 =?utf-8?B?ZWFPcm1DdHl3ZDlRMjBFZldNbksweUQ0aWdENC9HKzFJdW9lVXp2M1dLN2lD?=
 =?utf-8?B?TFppaG4zTnpxWU1xN09RYlRwcjBGaEpMNXlES0F1RlFJL3FlZGdkZ1NpTE11?=
 =?utf-8?B?OGl3di9aN2RFM3ZSckFRWk5YZ2daOFhMc0IyYkk3Wi9wU3hoVldqSXJCak0v?=
 =?utf-8?B?eWQ0citGQnB1UzVOd0p3RmtSd0dpdzVqdUpDT3VQZ3lZYkEvdUdTM0lhenRS?=
 =?utf-8?B?VkIyTEFybm9MTTc5SE5sNTFhUWhiZ1hJbndwRHAycE5vOHhVTWszbXJWam5Y?=
 =?utf-8?B?V05JMHRIdUtoVFB4VjQ5VlhDeDN5Q2duSllTWElEdlVjOWMzSnRHd0NSeEFR?=
 =?utf-8?B?U3VqbzlPdXZLV3ZTc3RKdjVyTHhORkdEUTFsa3dkUFZOdEo4TzVRaXZncXNH?=
 =?utf-8?B?a3NLSFp5cEtTWDdrNGgwSmdpd0JUMS9hQjJoaDdKdDh6Y0VpQzJkMmJnSkY2?=
 =?utf-8?B?a0ZXang0QVZVOE9OVmxkQmVoSjNvSVN2RktqQWNTL0VyakRIN0g0dmRZWVVF?=
 =?utf-8?B?VW1lb2xLUktnNUJEK2pSUHJ1TWFiV1ZOVmQ1enhCRDkvMUh3dW01RnpTYTVR?=
 =?utf-8?B?Y3RuT1FobVREdlJEcDhwZmZ5OVp6REx0dGtuTGhESmI3ZHZUV0NLaE5HRU9M?=
 =?utf-8?B?d281enBpeVNSWHRvRkJXR2ZITExsZEY1d0l6QTlRZk5TblJwaVhhaE41akpm?=
 =?utf-8?B?NWtCaEtvSDZBNDI1KzRSY0hHYU5JN0lXbE1yZ0xqWHVwR2x2ak54dXdSUzdr?=
 =?utf-8?B?VW52R0Rla0ZNNmlQNUE1dmhhY29CcXhSOS81RU5HQy9zMmRLVGRQaUY3bVNm?=
 =?utf-8?B?NjhPaWFRUjdjb0VLQjdRWEY1c1MwK2VuRWk0bTk2RXZ0bVFyMzd6b05RT0Mv?=
 =?utf-8?B?eU96SkgrWEdFUG03ek1jemdTOEYybUZueEl2MDhjekxVSkV3eGdqelZ0c0ZQ?=
 =?utf-8?B?L2hVQUVaaHc5NW83WnZoc1k4dnlHTSs3djdZSy9ZR3JsR3RtdVBYcE83S2tX?=
 =?utf-8?B?MWZPVEZ4emVFRVpTeGtCWXV2MGl5blRjOW1hQ0xrdDMxQnQ5Wmw0andmUFBE?=
 =?utf-8?B?b1k1VGdndnJQTk56cmgzZGxncTdzaS95a3ltSS9iZkZveCtzRTNYalVvZ2Nq?=
 =?utf-8?B?VUFQdkhzcWRuN2d3MENKZXFyMThUdFo2clpVMXJIcGhHTVlKT3RXRWFGNHd3?=
 =?utf-8?B?U1NxNVVtYkllOFQwR2RVQW1lUXpMY1FBb25wZ1J3RmtiRW9uZWIva2F1S2Nv?=
 =?utf-8?B?VEFkUUk4Mkh5c3VxYkdmR0t4TUZJQjQ0VjR2clhtVk1FekJ2UEtGZGJVNWdK?=
 =?utf-8?B?b0hpeFFNWmFPSlZ4b1FMdmpOcUo2OExLWU9XdzRLa093M3p1UjBIdjZQYnlC?=
 =?utf-8?B?aW1WUCtGdEE0YlpRUVBmdHZ3ZWljbTNrUTNqU2R3c1kvK0U0SjduV1MveUsy?=
 =?utf-8?B?aTN0TkJVbXhhSW5lY0ZNVlJwRUlzUXZNSmljenk1MFN1OXZMV1M4V3E3RHJ6?=
 =?utf-8?B?aDVjV3M4elVtMEZaQkpVdlhJMEgvL2ErTCs3TWl4Y2t5MWUrVVNRaUFJYm1h?=
 =?utf-8?B?Rzc5OEhqVkVOR2ZoaENUakUxMmM1NFRrdnhxT1N1ODUwWU14cmNJd2VsM1Nm?=
 =?utf-8?B?V2wwR0MwNmQvdjNwK3ZsUkt2b3VkU1VBTEloM0V1dDI4ZEJQWlQzUUErd3Bk?=
 =?utf-8?B?K240S2RJWEJsNEZJVm9rK0pXQnpUczVSeDlNbzE5QVNmYnpOYitGR09HRmpV?=
 =?utf-8?B?dTNiVjVWcjJic1V1R1hOcDN1UHBnUDhDUzF4dU5SYVRIalpDRkxTdS8rRUx6?=
 =?utf-8?B?czNKZHgzb3R5NnE5UVVLTTU1ZmNielFVbG8ySlZXY3RnVnhzYSsyWFNwTStj?=
 =?utf-8?B?aklpRXlSSWc3NWRZbVVYb3pTTytSVzJuVWdsSkQ2Wlk2K1BuSXJEWjl1OFpJ?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 272da4a6-2601-4d2c-1194-08dd365eba7f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 18:51:04.1950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB1YQuj3dtxUGB+AaZ46hKmKnbYYp6UTuWVvLzwGQ7s5qgRjw3uay3cMzPPpUzkAuCtxdAbIVL6k177Pkik7rVVXj1PSQ4Xvjg4IC6XqZHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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

On 1/16/2025 03:52, Krzysztof Karas wrote:
> Hi John,
>
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> To aid debug of sporadic issues, include the requested frequency in
>> the debug message as well as the actual frequency. That way we know
>> for certain that the clamping is not because the driver forgot to ask.
>>
> ...
>>   	} else if (delta_ms > 200) {
>>   		guc_warn(guc, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
>>   			 delta_ms, status, count, ret);
>> -		guc_warn(guc, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
>> -			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
>> +		guc_warn(guc, "excessive init time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
>> +			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
>> +			 intel_rps_get_requested_frequency(&gt->rps),
> While, <value> -> <value> is clear to me if I were to encounter
> this type of log, I wonder if it would be apparent what "vs"
> means here without having to look into the code. Maybe it would
> be worth to add "vs actual:" or ", actual:" instead?
Are you meaning to swap the actual and requested values around? Changing 
it to "<before> -> <requested>, actual <actual>" would make it more 
confusing, IMHO.

The print is '<before> -> <actual> vs <requested>', i.e. "it started 
<here> and went <there> compared to what we asked for which was <this>". 
That seems like the logical order and description to me. The line is 
already fairly long so the idea was not to make it any longer than 
necessary while still giving all the useful information in a sensible 
manner.

John.

>
> Krzysztof
>
>>   			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
>>   	} else {
>> -		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>> -			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
>> -			before_freq, status, count, ret);
>> +		guc_dbg(guc, "init took %lldms, freq = %dMHz -> %dMHz vs %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>> +			delta_ms, before_freq, intel_rps_read_actual_frequency(&gt->rps),
>> +			intel_rps_get_requested_frequency(&gt->rps), status, count, ret);
> ...

