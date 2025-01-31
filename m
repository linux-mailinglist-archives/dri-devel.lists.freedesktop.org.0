Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE42A23A4B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 08:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395D810EA31;
	Fri, 31 Jan 2025 07:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOZ/RQbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D0010EA30;
 Fri, 31 Jan 2025 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738309723; x=1769845723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QWw0yaZVYj+LX9qKZPE/mn4nNkTqxeYa2Q/SvRXG7F8=;
 b=JOZ/RQbvBYI+6bgLhb78xPh/Ozno2VpJkCu6LDayFebieLKZAmD6tRnr
 2pWRDHa1131ZqiVcBl1Ts5qFCJJ8UZKvF1KAcAhS5eb33AhDcHiJnhJ2r
 46XCDplf6vYzcmDIk2e80P6Z1ScoI3aTpibaykFZHvIGwDyiZifoQnj/U
 YjARIPzLDcgWyQ5xcCOXp9tMjCqAV9/Oxfb8ZbH4QGB7jwb+FSgCsMIyP
 8pOw7w5bdoafp/1gc8MAQWZ70mQ9f9Gs/WPFXYH/W8pxEZmKgT0R3xn4s
 tLN7poedWHPcdLpws6fMWJacrRuf+4OW8j76ElQZl/sywN+F0nS6+cHwh w==;
X-CSE-ConnectionGUID: sLwglH6bQiS94I2mw5KOhw==
X-CSE-MsgGUID: 5UbZJYd3ScGHLypFX805Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61344748"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="61344748"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 23:48:43 -0800
X-CSE-ConnectionGUID: GEZgzovZR867v/W2AsBTig==
X-CSE-MsgGUID: dCypFFF6TeGH5Yaap9S/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="109711136"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 23:48:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 23:48:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 23:48:42 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 23:48:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx1KXmGkfMzIlwnN4zd+06iMX3l+OC0bDaq/S3jGKEpQvRKqf6QwOLr9oYpct6f07dssMeFHYJFAKTH5iOuFL2jFN1aUyIrYW/xcmII7oJnxfLgqia4vel1DbUCZOBbLBhTpESmby+8e8RUGpqJC566b0fjREv/njQ7O+OMyLwGK9inFevpKftl9ZjQAZRJr23gRvC2PDCJHVXAK3iX8b4LCgsMPa7v8OZn8Y5Ez+a2WH6PXKIZv8Ipphse4qK7DgwPEx/OLYsVEO32ssZj51dAWveTBREwYe9J85uWmTK0C8qs8rkkwl5q0H8eP8Yn2SPtuvKZLezX4B9vDlSXoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVGbzgCvCAJU7Vvz1c6nVkJlZPq5qQvT6EhtztCPENU=;
 b=tNSd9+kdo8EjkybMty4wAL9UWJ6zhy3HlRn33uP9eaRZzfnWJxxgJrM4jrZ8OaBJt4IsJYujwaDcwas8tF10fRG0BMeyizZkE90lDk2qC4vZe9nYvwIkbPcyong3YOLOB8uQ6OPsIp+DrkIflCsbX9ZKAu7E3o5cy3Uvn4RPl+chWm2edmaMNW82Na2WHLIvUcryfeeII95e9En0nuZ3DrvE0Y7WkuQQ4NwocDVoHnpmDPBRrZWN7VFFuv1lkOi5zOJvtFyR2ncqa4AQoQpEAfUImledIylMwT9svyCxz6ikP84qTagJXyocl9oXP5h0KNRrDWGtL1AZIkConiYoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 07:48:12 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 07:48:12 +0000
Message-ID: <e6f93c69-d6a9-4cb3-8f86-65a1e3f04985@intel.com>
Date: Fri, 31 Jan 2025 09:47:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] mm/migrate: Add migrate_device_pfns
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-3-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250129195212.745731-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0181.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::38) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|MW5PR11MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: cae46466-cd22-4812-1a92-08dd41cb9cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXdPTUp1TGZmY1dvS3lvdlZtYWpNR0lDOGh1QTFTS0s4NCtTTzVaTjZUZGFP?=
 =?utf-8?B?OEU5RzRqa2p6bm1xOFFJeFhGeDRZV3o2RnNCN0FLd0JIWDFJMjVnekhveGxy?=
 =?utf-8?B?S2lHZ3dpNGh5T1A5QUNFVWlBdTJvQWhsY3dtMTg4ZXNLU29NRGpaUlB3b1M2?=
 =?utf-8?B?QmxyRzZkcExWZ0R6K3FHT1k1WCtuQTJhN0xyR2lubHd5OXBtb1VQUnhEYTdV?=
 =?utf-8?B?SnlPRmdtdVhUN2hHMHlaTm9CS0o1SVIvQlhNWThHWHJyVm8rVlk2bXlzZWlP?=
 =?utf-8?B?LzJ6b2FZS0tTVnZLSDNUaSsvT1d1UWxZZ0tnNDhaam9SaEJaR21ZMFNSNGJU?=
 =?utf-8?B?OWh0M2VmKy9wZ2krVUhaZXp0aitvcUZtY1lDbWhwazFmVmNLQUUva1BoMlB3?=
 =?utf-8?B?YXBXT2ZMQ09PQm5wZXBzcDE1M2NrWWl5ZVozbE9oU08wY0t3UG9aRnVHUmov?=
 =?utf-8?B?NkF3alErS2ZsNTdyd0UxZytzSmZCRmswWm5lMXBvWHdzMVllbTU3QVl5dzVY?=
 =?utf-8?B?N0ErVlp4QzgxVDZjTnd4SUt0dW43QjZMem1tZnRFaE8rSzFNV1VjMGk3aWlB?=
 =?utf-8?B?b0NSME8vTFVYd1gzc3Nud0hYRVVvajZHZFZIV25nRTlSaTl1L05sbS9KMS9i?=
 =?utf-8?B?TlV5ZFlETG1STEhsRGFVbEVBckZIWEF6QTZaRzBOZDNLUG9MTHk0WVJubUdC?=
 =?utf-8?B?YjNXU1YvQzZuRTgvYUFidUdsaElCSmorNWtwY1pvdjNOR25QQk5ubk5yYmJS?=
 =?utf-8?B?bHBLdXdHZ2dlc0N5K2VSWGtKbkVqQkMyOFF1VWJ5N0tyUklzVzEzWmNuR3Ir?=
 =?utf-8?B?ZWhzQ2xMZHJvc0wyenpsbU1mOUU0MTJBMmszejEySWNSTTZ3TmZ3dzlEendR?=
 =?utf-8?B?TStoTDZWMlU1eDhORzZkVmlub21kNVRWbk5UZ1oyVURRRHhxVll3UkpwRTAr?=
 =?utf-8?B?ck5Uc1dpQTZEQXA5UXQrQTMrK3U5YTc2dVhSMSsyeHE0Y2VPZ1VDUm56b1A3?=
 =?utf-8?B?TVpjVjFjSkR0NnRiMmNHZW9qY1B3VFViT28rK2M2aitrZUpBaXRDZTY5VWRF?=
 =?utf-8?B?N3BDTDFGOTFPRjJ5Njc0YVplYXJSNjNhaXRmd01lYkZVKzJsVWRraXJVNDAv?=
 =?utf-8?B?bHhiN0EvK3kyN2pxQ0c1bFNQbUc5N1owWXlJTE8zT05wVjVPa0pNTmZsSlhw?=
 =?utf-8?B?SkVtZGVWY200L2RsczlSQ1pTSEg2Yno4OXVNK1diTmFGNytGdTBGVlk4Rko3?=
 =?utf-8?B?bFFhOTBnaVMxdXBETXVHRCtDaUFqZTZ3d3E3czVGeXR2MEdjYXBaV3I5Z3Vj?=
 =?utf-8?B?WnBRN1hMKzkyczV5a1k1TURjRGo1emd4ZGcxVlkza1BlZWtoYTVrMENzNW1w?=
 =?utf-8?B?czRhSmZYOW9GSERiQWFRTWpheis4VFRqc3Exa0F6cXV5YzBLc1pXb2t5NDNS?=
 =?utf-8?B?NDFoTlIxQlVUR0tuZ2dEUDJMRzUrMTBRMXl5U2NndUQ3Sk1lWUIzOFlESWxP?=
 =?utf-8?B?OGZPL0J3ekM1bUphT1dlUVVzMXZ5M2Ywd0RSSXlOZ0RlNm1uTDZHUmllZWEz?=
 =?utf-8?B?ZDZMOVhOMWFCNFNHOXU0N21mcUc1cVpSRTdSdXpxZysrNVplcklkUy9veFRj?=
 =?utf-8?B?eEF3Q04vTWVNaDFRRHd1RlBzYitCWjBxc09KaGZXMU9pUzl4Z2RraXQ1aXh5?=
 =?utf-8?B?eWhKQ2wxQmhNYzdQRTdiTER5WTA1OTE1MzBvY2FHc1VQMGRaWHc1TER0c01I?=
 =?utf-8?B?SGcvcWZnZHg2eUZNSHozQjFzVEhFZDF2NDhLd2hGd0pyb0locDQwaVdTNjNF?=
 =?utf-8?B?WE52NkZnYXgyQ0VaUVAwc1grVlE2b213c1h4VE5kQkJhbkpFakxqUUkzeEwz?=
 =?utf-8?Q?+dGXy54NZjW5y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHFmRVExRmNGNXpBUVVxTmd5L2RPTWhtcGx0WVlLWkVVNXJ2VUZjcVYrU0Nu?=
 =?utf-8?B?d0x2dGZkZ3VKa2ZBbDF1REhRVDY3NHhYUStZMk0zNlpnUmFPb0tUVmkwMzg4?=
 =?utf-8?B?ODBoSkE2eVF3dWpYcVdBMHZCSWZJOW4xZmkySVFqSkNlYUFpcjVwZzFzWnpF?=
 =?utf-8?B?azFMUzRWOWYwRU9iKzZvYXNqK3g3WmtLNjIrL1pONFdSbTZMQ2NwYUxnckhy?=
 =?utf-8?B?dlRzek1YQ3pVa0J6ZHN5SnZoeHU5TnR6bW9NUEpnNnR1am11dENqMkNkMUFh?=
 =?utf-8?B?RHlDemFCNEJNU3FEa0tMMHlna0VtUEk5MDJCME5jQXRESDc4d0JSUlpVQTdJ?=
 =?utf-8?B?Q2lsRnZCNDdZZU9jMkIvN2lLdTF6ZlpEekxkNjRCQ1lXRGxWN0pHYnVtczhi?=
 =?utf-8?B?ZGgxZFhDVjQrY3I1U0l0alRlYjhWanVyS2ZnVHIvUHk4cWdONkVnRnZXcnYz?=
 =?utf-8?B?clFHeU51K2NTSFpwNnBhZzlJS3RiUHo0UmNGOEpVLzNaSFBtQlJPUTZDOUxo?=
 =?utf-8?B?cExRM0N1ZnJ0RHZER2NXREdyYlpHSUxTeGZxWmRwVzRlOEgzeEhHbVlJaUhm?=
 =?utf-8?B?Mmd3QkNaSXZZL1pTbVFULzJqbUZmMHpDNW96dUJIVWFGNDFxUklUK3lSMFJ4?=
 =?utf-8?B?Z2piQ0ZaWkwyWmlTT2Vtc0N4a1F3SWVRU21QZ1NCMWxyVWtmWjMxVmdpcytH?=
 =?utf-8?B?SlZZZWFVQTMydmJtQXVVSnhheFpWR092SUVGWTZUTVpNUllPa0x0WnlnTjBo?=
 =?utf-8?B?cFpIMWwzQTBDR2pnS2FOZUt5OVJreWNxK1FYMlhlUTFmNnpkbmlyUWJIc2M2?=
 =?utf-8?B?TTNMTUhEQklhRmVUUHgwNzJTVDZLUkFsR0c3N0RCclA4Q29JNjNaNjFCMXR4?=
 =?utf-8?B?ZHhiY3VkeXlLTXQycG5wMXlxcWg3dW9RRVNuWWpxR0N1TTNZelMwbmt2dFEy?=
 =?utf-8?B?bkJOODY3dHRjNFRFWWIxTGJzY2N5UlZ5OVVPcHlFTldyKzVLcWljbnNYYmNq?=
 =?utf-8?B?NlZsWmFWMGNlSXhVVmxvR2praUtFbE9WWU9VcjNkR3MyejZjTFFiOVdQNmY2?=
 =?utf-8?B?SmZ2MGxDSnBKNW00WjhIRFhibEFuZ2FHUnlEYXAwUjh0REtNNUNuSVd5cGUy?=
 =?utf-8?B?c1pYMlJmYjRRb0dEcS9zNzVXWU1nLzlxZERMUmplazk3S0laeXBaSTQzUnN3?=
 =?utf-8?B?T2ozbjFJYWsyWG53dlNDMm5LR3N5cDZJYjdBb2N5VWtiWjJjcTdRN3F4Q1N4?=
 =?utf-8?B?eUZqcm5RUFdpWFA0RU1YWllxUEptdGp3VmE0RllSSDJJeFJyTkpwSFdOZCsx?=
 =?utf-8?B?TGMxM2FwVFlsMyt6VlMzR1VCaE4rOHk3eHlYMVRrb3YyeWVFanhmRU5KRndn?=
 =?utf-8?B?N2JObjZRT1VZNGJNWFR1SFFhai9SSG10TEZCd1ZwVUVZVElVMUUvTCtwb0NW?=
 =?utf-8?B?L3J1Yk5MTnZ4NG5WR2xjREVhdXdzQmFYaTltYlQ0cjJSNTliMFhWUkQzckNR?=
 =?utf-8?B?YXBML0swMU4weTd2Wkpsbi93aks4dkprN05Uc3hUTUswOENVQ01JcGdFUng1?=
 =?utf-8?B?VnRuU3hQS3NJbk5sdGo5aUV6d3JJRjRmdnZPdTA5U1lpYSsvR1MweGN3ZjVN?=
 =?utf-8?B?a3pjZFB1KytJMXNpck9sK1RTRW56N0V4NmdObWhhbkMyZ2xLZ3U4YWViYkxW?=
 =?utf-8?B?d2w4T05QWnFKOVlSSkFXZU1XY1dRVUhlU1dodUU0N0w1bThseXdpeE9kVEZH?=
 =?utf-8?B?RjRpeFQ0bjhLT1JubmhKL05pcnNKeElpeEZQNllXa212ajRNb0lmeWZ2UGFa?=
 =?utf-8?B?MVhsWmMrTGZMcWlEbXJZbFVTWVNPNlp0QlZMeEVBUHNTT0tmYUFqV21icEIv?=
 =?utf-8?B?b2NiS0FJUjFrL1JHclhmUk9yVGNGQS9SRTJhNnZ3VVoxSnBnb3Z6eDFvM3o3?=
 =?utf-8?B?R2Z0NDB0cGZCTy9HaU5id1JTY1VjZXhGSWg3R1VSWWQ1TldzSEdzOGRJUTVD?=
 =?utf-8?B?QUpLdldQSUpiZTVMTWpFRTdQWFdQVVhBQUIrTW1iUGxQazZJNlliUUVtQ29R?=
 =?utf-8?B?aGVxVXFvdk5rT2VCZkpnZndsbndsYWFwK1BrQXdmd1RBZnhEbmhxMllLa24v?=
 =?utf-8?B?MlJMbi9lMXNZUTU3d25yKzVOSXluQmdObm5PR1FUUUxFV1Y4akxSUDNKYStj?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cae46466-cd22-4812-1a92-08dd41cb9cc3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 07:48:12.4656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVBOueNNzpWj/yhrvkXFIE6LQTGTIDh9+OR/BoeoyOLimj+jsiFNRawYk7hED29+BBG6Xqqug/Dg0ZLUPlW7nHtVrzDIxbSEry9bM4si4A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5811
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



On 1/29/25 9:51 PM, Matthew Brost wrote:
> Add migrate_device_pfns which prepares an array of pre-populated device
> pages for migration. This is needed for eviction of known set of
> non-contiguous devices pages to cpu pages which is a common case for SVM
> in DRM drivers using TTM.
> 
> v2:
>   - s/migrate_device_vma_range/migrate_device_prepopulated_range
>   - Drop extra mmu invalidation (Vetter)
> v3:
>   - s/migrate_device_prepopulated_range/migrate_device_pfns (Alistar)
>   - Use helper to lock device pages (Alistar)
>   - Update commit message with why this is required (Alistar)
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   include/linux/migrate.h |  1 +
>   mm/migrate_device.c     | 52 +++++++++++++++++++++++++++++------------
>   2 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 002e49b2ebd9..6254746648cc 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -229,6 +229,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
>   void migrate_vma_finalize(struct migrate_vma *migrate);
>   int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>   			unsigned long npages);
> +int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages);
>   void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
>   			unsigned long npages);
>   void migrate_device_finalize(unsigned long *src_pfns,
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 9cf26592ac93..19960743f927 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -876,6 +876,22 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
>   }
>   EXPORT_SYMBOL(migrate_vma_finalize);
>   
> +static unsigned long migrate_device_pfn_lock(unsigned long pfn)
> +{
> +	struct folio *folio;
> +
> +	folio = folio_get_nontail_page(pfn_to_page(pfn));
> +	if (!folio)
> +		return 0;
> +
> +	if (!folio_trylock(folio)) {
> +		folio_put(folio);
> +		return 0;
> +	}
> +
> +	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> +}
> +
>   /**
>    * migrate_device_range() - migrate device private pfns to normal memory.
>    * @src_pfns: array large enough to hold migrating source device private pfns.
> @@ -900,29 +916,35 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>   {
>   	unsigned long i, pfn;
>   
> -	for (pfn = start, i = 0; i < npages; pfn++, i++) {
> -		struct folio *folio;
> +	for (pfn = start, i = 0; i < npages; pfn++, i++)
> +		src_pfns[i] = migrate_device_pfn_lock(pfn);
>   
> -		folio = folio_get_nontail_page(pfn_to_page(pfn));
> -		if (!folio) {
> -			src_pfns[i] = 0;
> -			continue;
> -		}
> +	migrate_device_unmap(src_pfns, npages, NULL);
>   
> -		if (!folio_trylock(folio)) {
> -			src_pfns[i] = 0;
> -			folio_put(folio);
> -			continue;
> -		}
> +	return 0;
> +}
> +EXPORT_SYMBOL(migrate_device_range);
>   
> -		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> -	}
> +/**
> + * migrate_device_pfns() - migrate device private pfns to normal memory.
> + * @src_pfns: pre-popluated array of source device private pfns to migrate.
> + * @npages: number of pages to migrate.
> + *
> + * Similar to migrate_device_range() but supports non-contiguous pre-popluated
> + * array of device pages to migrate.
> + */
> +int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; i++)
> +		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
>   
>   	migrate_device_unmap(src_pfns, npages, NULL);
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL(migrate_device_range);
> +EXPORT_SYMBOL(migrate_device_pfns);
>   
>   /*
>    * Migrate a device coherent folio back to normal memory. The caller should have
Looks good to me and I have confirmed that a code flow has been added 
that calls this function from the actual driver (xe),
which did not exist in the previous v3 patch series.
(This code flow called when ttm performs eviction when ttm needs)

There seems to be no test scenario for testing device memory pressure in 
the test cases mentioned in the cover letter.
Do you plan to add this scenario as well? ( Please correct me if I 
misunderstood.)

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

