Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8007A7744C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 08:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1819F10E296;
	Tue,  1 Apr 2025 06:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4sZog97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562210E296;
 Tue,  1 Apr 2025 06:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743487869; x=1775023869;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2/11ylSbRAaJ+oQq4IZf0wXmIuTMS22pT9G/pBUB0z0=;
 b=T4sZog97WBEMjIyw2Zy96OaDmTLATV28IJRGhEMuhCKJEQJ8Fbf3ky3h
 YrUI50cUEBqx7xCj+Kfy0Vb6rzTUGaBeT9kQwWETBmm1uys6FY4uz8izE
 39+dEKw35yzKupblUjCnD40WxGRd5BZQTmDHA72BZM6HvEXjxmfme1mME
 5bcGy/NIPdt8GiNel/w3gJu0r1wF/veL3kqM4iHhydALxGYLiDQvByjee
 130XW97FwfnTPtRR68PyGsbHVudd0otcT1jNCgVpCqx+0godZLQwAXSds
 vifMaFidhewmAa4K4JjxyAGYK8uZ7M3L6j9b2VJa0/lb5QggLbNt0Fyqp Q==;
X-CSE-ConnectionGUID: bbKBFT98S3WMpDUCyDfE5A==
X-CSE-MsgGUID: VNeYCx9JT5iS/kG4gNZYyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48663862"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="48663862"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 23:11:08 -0700
X-CSE-ConnectionGUID: AA0E/NnXTZeT9agTrJW0Bw==
X-CSE-MsgGUID: SNFMu3dGTEWrZ3StkWAjkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126800124"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 23:11:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 23:11:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 23:11:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 23:11:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuQOq4i7Ci/FGnDCjVN4WxapVBPnhemG1yRUH7EBYTCcCfG6AZvXGtH5stQHPyn9zTJQmPeQXDVdr5jsR9je3e9pGS17XAuUg/ogfpN+dS7OmzWcOa4BrVKg/x/RHpQqP2qCRl6rwblUWKgFE17TA1Dw0VnSFhKV6m7GXjY8xgK1+MVfOZyuf2YXHJQ3T7uVnHlOkjo2GOoHmRHQfLr5Jl0BXcvtd6Z4WpMP4n3s0H4r1KY4O7dzo03ucnO+5xraIFneRGlvqVDPDaxTy23ASYYgI+qHUt4q0a744en2mS8JpS2cvUHjnm+AebbTn+64ujYwD8kSD6FHeU67CeC7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhqB4fiRghx2gpg+UieJHDWfk4CiVbpR4KOLFwAoW2w=;
 b=qPm0qyUmm+F8K7sgxMtfWB43rOQNpScZStE8qpprlj67qD2NMRxK64pUe3aqYK+0NtYStPOk8K+3fL47lEEWzM0wrzy20JDpzzko0kLdSgq87ouLYTES9Lh9FsuEuFlOQADm48XbiZl2iIugN5j89B9RpRYAQDH3sLQil83YY5DldgeuZwuGsBQIrB0Ttpp+YuvHkLrxND4HeO4M34VoIp/Ol20mKFj3pimjMgCqnPi9GtVJBAQJ7aPR7vsf8bR2I628rlxExj3rl4MAvYj5lbXIxg91pKcfEGiIOgIGNydCu71cTlrTb57RW4dxRD7q4N6jNnBLj8R6618wA6Ycow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 06:10:51 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:10:51 +0000
Message-ID: <0ab25302-e00b-46fc-a9c4-3fb42013e0dd@intel.com>
Date: Tue, 1 Apr 2025 11:40:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] drm/i915/display: Expose sharpness strength property
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-13-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-13-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db6ac85-a9c5-4567-b211-08dd70e3f3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmRFSktsQXJUTnVvcktVakpzR1ZLbHMxTDg4SW9GMXhwWHQ5aDRSMU1uK3dK?=
 =?utf-8?B?QjlmN3lLVnhrYXh1cTV5RjZWNEI5UUlGQ3RybVZSaU1SS3prbTd2aEpuMDVO?=
 =?utf-8?B?czVodjBuSzJURWJRM0hYdDZzcmtkeXI3VGZIZjhmcmFsU2YxK0FHTjVtZWJN?=
 =?utf-8?B?U2U0b25McU9VRVY2b3EwVlA0cDVtNEcwUldnSHhaMDlZWCtUSkJ2N0Yyci8y?=
 =?utf-8?B?a0ZiTTdEZjhaTHgyUU51dGxBa2tDRW8vL3c0dGV4U1Y3RCt1QitSRUZ5SlRt?=
 =?utf-8?B?dnUzZCszclh5TVl4TVpVdmdYSzVZdHJReHRwT0JzSDZOTS80ck1CbFQ2ZzlV?=
 =?utf-8?B?RXNwaHFud2lqU08vMm9adWs1OGRjMk1jMUJra1pja1htajBVUmQyTzZjd3M3?=
 =?utf-8?B?SWIrZUkrWW02bFFVQUJ6amh4RjFOc3pCV2NZaUhMeWhlOWpNMjUrcVU1Qmp2?=
 =?utf-8?B?Nkp1TWIreDYrVzl3YzlkdXlmaE5rc2xSSnI4T3d1K290UUtvQjF6SnJURzVs?=
 =?utf-8?B?ejE3cGNUNDd3R1o3TUhqaEtrZndFTmhLeFYvekcxWjlRZnZXaGpIdHYyYzBR?=
 =?utf-8?B?bURZOTE0OER5Q2R4RVVTLzZlNEZTZS81eEFTRU03T1k5bXBuQTU3Q09MSlFh?=
 =?utf-8?B?UURCUjN4L0xUMzA2UDNFYmVPOThNdE5OQ1JweHY2MlZwVU5RNlM3Y0VpRmlR?=
 =?utf-8?B?aUxoY2I5aFdYZjJZSkxvRDhvQ0NyYWJTeTRQUlAwTFNIV0VodjBsOW9Sdm5M?=
 =?utf-8?B?aFQ4TkI4L1dzYkljaXY0ZXZ6VmJHM2xBSmppZUtmWCtxL213MDlXKzVJOVZx?=
 =?utf-8?B?VVFvNXoxVi9FNC9pMUFPN2k0Y2pZblFaWlJpMHgrL2ZORHhFUVpKbVgyakRJ?=
 =?utf-8?B?Q0V3U0NFUEdkMEJPWVkyVGVwK092SCsyNG9EeDNicXdHdUU4cXJGQ2w3d1Uy?=
 =?utf-8?B?ZXZjZkFOSzBSS0JtMlNvVkh5LzVCUURFTXVyVkR3T0E3ZnRXbEtxbEJZOTNQ?=
 =?utf-8?B?UXZVejI0WTJZS3dHM2YwOUM5bE84OXN6alFSWHVqUEVjYTJ4ZHVLd0h3VlNi?=
 =?utf-8?B?ZmdyY0ZRK0tlZ0NrMk5UYy9SU004T1Y0TVQyKzdQV1kzMjE5V24vUWtrNy95?=
 =?utf-8?B?R014K25FZVBNL2JhS1FGQmRUZzMvYWt2R3NxY3ZIaVBxeTVXQmN3RlFDOFkx?=
 =?utf-8?B?VFlzdzk3aC82RkpsMzdBcXRzR1RQN0RlRTkvTHJyT0xUQ0NYLyt0ZXNxNnBh?=
 =?utf-8?B?aXZzdTQ4alo0TVFZWEV6T0xSYitwRUhMSG52L0VFQnpLRC9LU1BnSHhpdnJY?=
 =?utf-8?B?eDNzTWxpZU4wQnEvRUtUbXV6cTlTUE1ZWG0rejZjYVhXMHozUCtxRlJrRmZi?=
 =?utf-8?B?VVNMVEtSdXN5TGhUY3hWVDV4TUpkbldoeUhKMi9Va045WVBiTTQzTUhJd0M4?=
 =?utf-8?B?MVBQUDlQQ05MT3ViaG5LeEVuVVlzS1FrTjJnNjhPeDVBN3BMdTIyRDlwTTFW?=
 =?utf-8?B?NHhPNTM5SzdnelkwZVZMQ3paUUVQZEtXVUsrajRldU13ZkVpUVRqQ0E1M2hB?=
 =?utf-8?B?cVdGREpESUtOU2tweXZEWUdGQUJTRXZqdGZ3TlBxNG1aUDN4RTNRMlFSZ1gr?=
 =?utf-8?B?VTlIeU9EUkJxb2Y3NmJsSGxWZklQQnk0b1p2eVVYRExBcUg4YzY3VTZyMnVS?=
 =?utf-8?B?NExuUFlqSyt4VEJ5WnBxR1lyM2M5dUFWMmRGZ0wvY3B1MXFjV1Rwb1c1RUJP?=
 =?utf-8?B?K1IvZTlKWlQ4Skdad3hBcVZwa3NPTE1sSjUzcDN2K3BsK2h0ZWVaRXNteXhD?=
 =?utf-8?B?eVRBZDlacEpNRFNQVGNpNDErS0tCSHFOWmVYZHRBNjZSQm9kTTRxM1BPbUlz?=
 =?utf-8?Q?x8GVKVST72zk4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTVuUHo1UUlWTVNUWU83NzdnaXVwejhjNC96aVp0Z1V4czhQQVBZNmN2T0cr?=
 =?utf-8?B?LzN5Z1Btb2FydmtVQjhxdXFtMlM5aFJRU0F3NFVKa2JqLzlnMjFEYWRNQ0ts?=
 =?utf-8?B?enBFS2VBczVkQ05CMEYyOUkvTjdVbmMyZmVJYWVSalpybENsSmk2RTUyeFZj?=
 =?utf-8?B?V1p5VGZGcTUvVzhyVXJ3WG9Db0FOQklHQWYvNWk1WDZ3bGNVT0svU0N2a1lr?=
 =?utf-8?B?WnNESWNQQ2FDZGY4cVQ2SW5TMDBBbS9QS1gzL0ZESnVHL2wzVkp6aWFFT1VE?=
 =?utf-8?B?bXk5Z3pPL3p0bGFxOEd4ajBLTURMcGE5WTE2dHRpbzNLSkZJazRja013akJ3?=
 =?utf-8?B?MS9XTmxDWXhHdCtER1lkSUJFMjIvTGNHc2xUQVJWaSt2YlFTYzZrNlhHQXlU?=
 =?utf-8?B?L1pldDVFK0xuVFVoVXRJS1B0am5BRC8ycE02MHl0WGtRb0NaaDcvNndkV3lT?=
 =?utf-8?B?Nzd2c3VhdlY2ZmR3R2hBMVFjT0VweG1WM0FROUEzZE5XbkIybzdLM3FGWTRN?=
 =?utf-8?B?WmxqN3Z5S2JYek5RR1pyNUd2dkE1ZHpaY2NtdFpjU3M2L3I4SW8xV3RDU1Zp?=
 =?utf-8?B?Zy9ybHhVQ2ZDUm1LVURCT0czK1R6Q29jRjNzcmljOFJiUGlsd21xWWd5cnd5?=
 =?utf-8?B?Y0dwRkV5UjhKVElNUEJBdkFBWlo1YXRGeHF5YXBmSjBnejNqYmRUbDdTT1pZ?=
 =?utf-8?B?ZnYzc0xQN1FNbG9NaVV1ZU40emlmMGdJbkc5SmlXdjV5ZS9sWW15dTdGVGcv?=
 =?utf-8?B?azFXem5aWGJVWXRueHN3Y0lOSUc0YVVrRzY5REpUMHpmV2ZQM1FUZzJwWUpm?=
 =?utf-8?B?R2YxdUFZVzhLOUMrUjZsR3NhNDBMU3R2aEI4VUZaejV4L25WWUdGMHR6aFFz?=
 =?utf-8?B?NTk5b2wyc2ovdEp2RmN4djBhSVVsb2pVb0JZZVRaNi93Zkw5eGVEZ1hpbm4v?=
 =?utf-8?B?SGFtbWVvbUxkOHg1UDAvQnFmSTlrVVhISHM2Z0FDM0FTSGFpQVgyKzZySkx0?=
 =?utf-8?B?T2ZkeGFoVE1UUUhxVVhtaTEwYzJoa3VOTlpLWE83ZndDQldPZ2FQcndNdjVl?=
 =?utf-8?B?MVhzZ0pJSmpFT2c3OExBTllHc09FRGQybE1VSnE2QlNxNDFudU5QNUNNNVlw?=
 =?utf-8?B?TVIwV09IOFlIRVF3QnVURjRCMzRrSWpTRm1Fak9PTGZZeVhEOE4xMnZVMGFB?=
 =?utf-8?B?VWhxZE9MTEZaeEdHWWdGWUVBczhob1BCL0RaTmFCZDFEcG5qSGhVYmJmY3hH?=
 =?utf-8?B?ZG5jbDQ2YXUzK014YUcyWENYQzV5NFlkb3NxSnJXRTc4MGF5bitPdGx5enhQ?=
 =?utf-8?B?T3dSbmVYTmZOL0NhZ2VqRVBHVEtlUFc5NHN5d21sZldSYkZ4TVd0NFNlZ2c1?=
 =?utf-8?B?Y2ZieDZ4REFkVXdKMmkwWVk4bmxzVlZMTXQ2eUFlOXlpdlJjY1dpN3IzSSts?=
 =?utf-8?B?MzM5Q0ZZWjBZUG0wckZqdjMvSzE3ZmdiWmlrRmM2dmVLaXNEYWpnTWo3TGJ2?=
 =?utf-8?B?NmdoU1J4S1ZTajQ5VkZab0VYYWVJekl4NWI0bGdIeGVrVnNTVEx1dkdCSGRU?=
 =?utf-8?B?aGlyTmI2SjYzWmhCaE1tZ0k2eG1yQXFvaUNyV3IyTU9GSlB1T1M3bWYzQTBL?=
 =?utf-8?B?QjdhcWxPaHdkRTBMdGdiUkY1SW5ObFQ5emNmR1pUMGttVGZwdzQ5ODRjUzRw?=
 =?utf-8?B?emhNWDB5ZzJ6bisvQmpRREw3Rngxckl0QWZhdUpzYlpId2RVZi9VWkJ0a2Q1?=
 =?utf-8?B?Sk1xb1NGSWtRWGdkK2t0NVBZUkI2dyttYlJhTWJVYVk4TlZwb1JQNjRsVld5?=
 =?utf-8?B?V3pmRzFoL0VFZCthV3BCcitLNXdiZDJyaTkyQ3VnNEVvaGhxcGxDY2dFTy81?=
 =?utf-8?B?UUxHK1JSQ1pvcHRGZ0Q0MTBoSTYyZUZhOXBUK2RLekJWeVhDUmNRM1VrRUE0?=
 =?utf-8?B?eW15QXlIRjhPRFBqRElKU0ZWQ3RKUC8zc243cVh2TDliZjVCUC96OFpneDhy?=
 =?utf-8?B?VVZGR0tsdXNlS09FZmROVnE2MFJYZXhIRkRDNDVLaGhnUFRXZ2txYXJSMlMx?=
 =?utf-8?B?NHZtOHRNZ0FHcE16UDJvRnZRTE56SGt1Nmx2SEZkR1VQL0tLOUJTb1ZHTmgz?=
 =?utf-8?B?Qm9DbGJCUGJEUFA4eHE1MTh2ZXZZUTdsck1nV2JRNTZyRkt6U0cxbFAwMThM?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db6ac85-a9c5-4567-b211-08dd70e3f3f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:10:51.0060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9Ad7pbP0VPTf1FCsk66S1A8jsFFlRthiXFVydokXFqBUgDulizRiy93tWoUupbZaY6jA3Y04/sVhB16r/gK/5/9BWMWN7LAx7rp6QDOGlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> Expose the drm crtc sharpness strength property which will enable
> or disable the sharpness/casf based on user input. With this user
> can set/update the strength of the sharpness or casf filter.
>
> v2: Update subject[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 5b2603ef2ff7..b8bd255e9555 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -391,6 +391,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
>   
>   	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
>   
> +	if (HAS_CASF(dev_priv))
> +		drm_crtc_create_sharpness_strength_property(&crtc->base);
> +
>   	return 0;
>   
>   fail:
