Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B00CA31DE9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 06:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A85B10E7AE;
	Wed, 12 Feb 2025 05:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBe74ZUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED7A10E7A9;
 Wed, 12 Feb 2025 05:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739337903; x=1770873903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YQCR8Ydp2hXEnpdjl/F25+hesiPTXlxYYLs6S5DGYU8=;
 b=IBe74ZUfCR+FQIt/IM6vEVQDr/dUEw748UNsMmeNQKOEM5AZVkXaMN7B
 kpweCHx4f8RTuAwsDp7ShS6cQuTyMGUqTMUdCipp9P0Xie/aauO4F+Bqd
 +rfJWbuH3AQwv3w/bCL++nlW7VHGD61lOO0XViX7z06D1NFJ6fMN2umIb
 tXvn7jd8kKVa61VYmqYJO3RneqlCdY9O2/eBQn3z8icsHpNvSb2QUOUG1
 pwFC+CH5om+NJJ4UG1P5zCxshX9i54OfDAsQ4NO3qBDiG/PSZ3CktAeOb
 2ash4DOJ7GQhtjKe7a2Di2ykshC3pLxyouj/NVDX628474r/Il4ie+iEg A==;
X-CSE-ConnectionGUID: Oho92Df0ReS47o87X09PZQ==
X-CSE-MsgGUID: fb+AgrTJRQqbBpKymuQEqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43632506"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="43632506"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 21:25:02 -0800
X-CSE-ConnectionGUID: LIm3/dxTSuCyTR4wNFc/mw==
X-CSE-MsgGUID: ZcqhrZf9SkuDKVTAX8Qzwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112673590"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 21:25:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 21:25:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 21:25:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 21:25:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBO5nbJ9gbCmWuMUrRu1T+cWgP/Nag9kH68ra37l4CmejJki82c8bXqXhBpxBoLLFUmX9wV0A6tf33VumfdVsSyHi7UdUownTUP+wkVXAHHTEzSzwX3MgkTbeelQUoPXP1RuaTYv+IM/nJk4DaIF0aIwlfnNfYcuBY3JZItBfWlpEC83vxt7v2SedrFpcj2sRXZqRCoWbr4GnyRyaofVzAuUc0RiX3m5MMwH/kf3SYA1B8wl4Rozzv5l501MPNA9cqciekWy2DTT1wqq8c52i9A0/sNXVyxcYRFaJtaxio8PsaT7xQtyeiTOqCgpGXvJu/JcVRnWRiGMhmpHrfAo6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQdMzQIGy773rhffVdkPGdYCEFaRP5KsqB76guxq9dA=;
 b=Yor8lNpAwnzwmG6VSxq3FtQONZtsj5n64bLjHPjcJ174WvHVykSxpx4SEjV2lBNYlbZujLmYnRH213nbl3HpGlqHYg9XujjzHrTgo7Z3A5xQhxRL67Iy48DOsHslaWZ5YIUKb0prE9/VRENhp4OAxUzxzcqN8Sac5WtsMsH9TGsQpB03DyKYKzQ5qOfgfey4mj5HFmfjDDKpQ2iXwfNzM4Cnh9tDgT2DQ9mGEmsW+/q0ckYHNG/FDwpxhBugeUeenGqw1+9M1dD20v1XKqO42Phk2GMpwLA/F+Er0jaU4wu9o38tYwwmxnlgsXHtp+ufZYYvW18aPL3TbT69iLTqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA3PR11MB8048.namprd11.prod.outlook.com (2603:10b6:806:2fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 05:24:40 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 05:24:40 +0000
Message-ID: <677163e1-dd44-472b-a0cc-3fdb315b1712@intel.com>
Date: Wed, 12 Feb 2025 10:54:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/plane: modify create_in_formats to accommodate
 async
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
 <20250205-asyn-v4-2-9a5b018e359b@intel.com>
 <SJ1PR11MB61298A26E2E2FD639AB75998B9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <SJ1PR11MB61298A26E2E2FD639AB75998B9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::28) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SA3PR11MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 22580b9d-e193-4903-c08d-08dd4b258cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXBhRFNRWUFmd3FINjdrcDI0aWVtbFZERXE4ZGRmYVorUlR0YkpTUWEwZ25E?=
 =?utf-8?B?K0ZNSmdkMHo2R0hlMTBnY1k5YU43eEtjb2ZMY3AvZWlMRGw1UU9wZWsrOEVM?=
 =?utf-8?B?MmI4ODdoUmZRUnoxdXY4d2c3TTgyQUVFQ09qQVd6QjFudG1uNHVvVVYzT0sx?=
 =?utf-8?B?VlZ4YXJEZEFsUDNwNlQxaGRBRWkxajE0VWdiQ1lMMEMzdWY0djdRSnVJNUZ2?=
 =?utf-8?B?RnZJZTF5T0RhM0NtQ1diR1VWU2Z5RTgvL3BlMlFGVlhiTVZBeG9NdisxQmxh?=
 =?utf-8?B?c2Z2NXdzQzFiNXlLOXNiTW1sV2Vta1Z6Tk8wRHJpZCs4bkZpdC9CMmI5QXEr?=
 =?utf-8?B?czl1RXMxdkE5WktuYVdUS3d4QkhlTTRSU25ra2UwS1JVaTlmZUdTV1BrUHZ1?=
 =?utf-8?B?b3pHa0JkcmN6QjFjZDBvM3d5ODZRcHdBRkpIUzZUS09hS3lWU1llTDI1Nnhk?=
 =?utf-8?B?ekNpZXh1WmVlL0VMMUZHanZwNnJCZUM2KzBOT1JWVFNseFFQNFAyUlFGV3pu?=
 =?utf-8?B?a21uY3doVzZyU052RFFtNHNrTW0wbENyNjJGVWJsT3RCWlBXcHhLbnQxbTVR?=
 =?utf-8?B?aG8rekgrVDFrcDNBaDZsY2RMTDVUMWNWaFJucUpzeTQ3dnlkOTBGT3R6SWRM?=
 =?utf-8?B?SnJSQlRwWE11bnhxT0YxcWhpMS94K1haTDNpZjJmWnVMSlVjM0NHU1FIZFJ3?=
 =?utf-8?B?cGxQbTBsNWFDQisrcTJPVnpJRmRWR2F2YWVVOHhsOEsreHRKMTdUOTV6SGZr?=
 =?utf-8?B?QmR4UUpTLzdBUGhkOEtVamNZQlVWWHd4aDdBcEtqQm9oV1N4aFpQT2diOWl5?=
 =?utf-8?B?V2NKVU0wKy9EeWpjbGZveTN6MSt3MmNSZHVHNkdheU5PTk8wbFJIZVNHNmJh?=
 =?utf-8?B?bUtaVWZEV01LL2duQmpYTUFUbVF5S0kxS2g1enprM3RIb25tVDEvdHBqR2Qv?=
 =?utf-8?B?L01reXZBZVZ6cUNMRXVVdVVXWFpsa1hLSktOalFRaWJDZ09JbUR4NmsrUTQ1?=
 =?utf-8?B?NjZ5eXJFaXdBMDk5L0p0dXVPVXlCR1dkcGMzWnVsZjRjNnduMElxVkM2L2tM?=
 =?utf-8?B?MUxld0lYRzd3eFhualZ1OWIxVWRBV1phbm53OURBZDNLR1ExUjhvSWNyMDhi?=
 =?utf-8?B?a2orOWpXcmU2MStnTUQzbzZIMlAwTUpWa3Z0cW1vNFQwWEdXQlpWcTV0UER5?=
 =?utf-8?B?WGQ0ZjB1SHRBc3N4cGgzLzZyaGhDalUzUzB3SFpuL1VhakpUNmVmRFdWUXBh?=
 =?utf-8?B?VHZHbWEveFE3SHBSaFNZWW5VSFRIT0wvQ05yVnd2dGVSZ1RySDNrOThWQXAy?=
 =?utf-8?B?RW9XRFk0ZGJWc2hzclE5dUlNTWFiNTRaVzBvOUYvODRxNm9IRldrTjVGb2s2?=
 =?utf-8?B?cldjQlBYalcrM1hRWUtSWGduNndWOEdwelZ2ZWRVL3pkR21TbkpvZWpzcFNk?=
 =?utf-8?B?L0VmUXhkYVBubjQxTWs5RzlPUTBhMy9FbHlucFRXcXF5Ym56Z3hLdTlrY2l4?=
 =?utf-8?B?SXUxQ3FSTi9sa0UrM09rZGc5S3RnVC8zWEtGUTdCTVp1Mm5HSk1iWTRnOTZE?=
 =?utf-8?B?b29IVzVyUkVmU2szMW1wV1pmTjRNeGFhVCtISmk2aXlFVjJtZXozOGNqczNH?=
 =?utf-8?B?NEU4dWJScVZwOVVzcXBrMDB2eVZvMHpNMjBnbXJtOHdMV0pFZDdIWU1sV3dX?=
 =?utf-8?B?eXg3VVdVSDR3L2JFSHZKbWl1b3p0UzAyQk5taUdFVmVUWnlwZnJrdVZTZ0Zi?=
 =?utf-8?B?aU02aGFLWVBNTHBrZlhQUGpPSGJaUGZudEJ5YXJncnpzVDloclZITkk3VkJO?=
 =?utf-8?B?S0Q3eTBMcms4UHBhUmhITjlxUnYxUThleVVsQTlKV0dTL2txdnZUNThsNWFm?=
 =?utf-8?Q?4jxM+e6KAb22O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9WQ1o1U3lJVzlUVnNOTEJ2K2ZCM01jWEVxeE1LL0IxV2Q4cnpqYkdNK3RS?=
 =?utf-8?B?SGZUbjB0dHVNeEdGekZWdVZDQk5xNFZhOFhVWUUzb2ptekcrZ1QwY3dTVm9k?=
 =?utf-8?B?NEdIc1BoYWY0ZlRMdGpGbHpyUDduYkJNcXNpbW1xUWFPMFRPWkwrZ1M5QSt0?=
 =?utf-8?B?dUJOU1c3b1lmbW8yQS80VzZ0MUtPcDVDbVlJSmV6dW4vb0R2Rm1HYlltckFw?=
 =?utf-8?B?dWxuT2VIcjh0aWYvTVRwdDd4ZExVS0RYbnNnbkhodXNmMmRYZTNickF0QmQ3?=
 =?utf-8?B?dDVoMVMxZHQrbGF0UTA5YWNrMnhiUS9HdmdRUjJBY3ByR1RBajdHSEJZRWdm?=
 =?utf-8?B?UUMvb2x6SlU1ZXpkeGZMazA2SFE0dDFkTFhUR0tKZWd3ZUhtV01TeHZXaHJS?=
 =?utf-8?B?bG9VQkFJa1dJaWxCc04vb0ZhOVdONWdxM1c1Y2dPRE9BMTlSOFdyVklBeVdR?=
 =?utf-8?B?MmR3OElYNGdOL2VrSTBOWlZEeWkxUlkwdHBuc1ZSUFloRW9FQ0lqYVljVWd5?=
 =?utf-8?B?bUdoNlY3QVpVSHA3eU9YYlJWQ1lKeFlkM1NDcnBZKzlnQk1ISHVkNXNCWVk4?=
 =?utf-8?B?djc3R2pJMVBOd3pXL01haEE5elZxQk44QnlCYkRJRFViZWQzL3JVaC94VVRB?=
 =?utf-8?B?S2pWeTVzTjFmdXhPckNRVnl0ZjJXdVM0VDBqZkw1UThNOFY5ZnpPUDRZdDAz?=
 =?utf-8?B?UzcxYkxnU1VRNVVMSndPQTN4TTdOdFp3aVZyd1RoMFJrZWRxYjZxTFBSVTBU?=
 =?utf-8?B?THVIMXV0VGxIZW43VmYrUzVhTEpFREFHN2tSdThMYi93WWhaajN3YUlEOWxI?=
 =?utf-8?B?andITEpnRyt2US9lWDludFV3YUJONkVNTDdXOEdqdGpJT0krVGIvM0gxV3NY?=
 =?utf-8?B?SVc5T1RLamV5ZnQwUjhnSGlJbktWZU55d05JWTVNaEpSQ3RPTjNuSHhVWURT?=
 =?utf-8?B?MzFKUkFoR1pyTExJNjZyOTBkWnZZTnZZL3U5czROSjRkTWhEa0Z3OUF0dVNp?=
 =?utf-8?B?RFUxdmN5azJLWW1PRkJBZnJFWnplSW5oVzI0bmZYdGx6cDlUMmc4T2xBSXAr?=
 =?utf-8?B?Mzl5UmpVYXRWVTNwbVlwQitBN3N5Q3BHRDBieUlubVRUZ1dvQzg4dThOeEdR?=
 =?utf-8?B?MmdpZ3ZmNy9ZVkgrbDBsNEErSTJFbDB5TVZYT1czNHRlNXltNkFPajJ0VHVw?=
 =?utf-8?B?ZmxVOFpwU09EOGlXdFN3NU9sazRsYUc4SjBHdjMwMnl1QVVPNmhIRksvcEp5?=
 =?utf-8?B?WnpPTHhFM3BwWHo1SnZKdktCZjFDSFMxRkkyRGFuR3ZpbTd0UHlwY2JxTHd5?=
 =?utf-8?B?cjR0MHd0YWlEUzhJbGVoMTBIS1J0TmtiZUdHWDRQVlpVQysxU0ZKUjNIWDhl?=
 =?utf-8?B?L0lKM3BWMkM1L1pabHV4RGFBcWY1UGpTcmI3a2I2cDZxSG85bGwwK1VUMmVy?=
 =?utf-8?B?MHRSUURHamM5ZmRucUdaYk9nYklMNTFOMUtod3BGU29OdFk0eW9OeHFCZy9t?=
 =?utf-8?B?SDlUR1VHVU9QYWJpYzBucklVRTArOHF1YzdBYnNTS3p3MWpTakxvdmdEUDZL?=
 =?utf-8?B?SVViMi8wNm9YR0RpbzdmM2c1bTdid2RXWUpleE9JZk4vY1RqeGc3T1dSd1p5?=
 =?utf-8?B?dmdSOUphZ0ttMmZYTnRzRFRZckt2NG9OeTJmZUlHUmpGQS9oZTV0SngwUjFh?=
 =?utf-8?B?WUNvM2poQi84cElFTG9USzhWbjVCLzc1amV6K1lBQ2RzMUNkd3R4WUcxbCtw?=
 =?utf-8?B?bjFlbkdYMFlBU0xnWHd5NWVKb25UZVNTMkc2MHVjcE1OTmZXUHRXcGdIRlhj?=
 =?utf-8?B?L3pHY3JDRHQxMnU2WGc3Ulk1RTQzRnpjdG5QSDAycFFCdFZRcmR1bHhuUVVs?=
 =?utf-8?B?MXNoNzZXWk1DUUlHRVpWcnRuQnNpdUFtaFRsZXBpTk96aGFOWU4vZ2gyMzVh?=
 =?utf-8?B?STNzMW9OY0ZMTk45RUtUNHQ1U0ZKNlJCL0VkblZSSkJrb2xXN0NqQWptU1R5?=
 =?utf-8?B?cy9WWTNGdmNJdnEzL2VDZ201VVlrdWQ5NnRNK0JIZVU2UHhSUDVZUHpTRUQ4?=
 =?utf-8?B?b0pHYklrVmR6VFdMQkU1TFhiRkprREdsblgwUEdPcmY4WUoyM1BtNWtWQjRO?=
 =?utf-8?B?UDZwdTBkV1dkRTQrRGdDUFg1TkQ0eHV2THBScmdodzlDbHlNWXZ4MTZ3aTk0?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22580b9d-e193-4903-c08d-08dd4b258cb5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:24:40.6186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyMFFlJ3Tr8lI09hZ89yatn8AmGUcEBWIOxj/ZMZLvgnDz8wHiXUJKp/BUPE2DdCB+sy+kkiKUM6zb0HsGXwOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8048
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

On 12-02-2025 10:23, Borah, Chaitanya Kumar wrote:
>> -----Original Message-----
>> From: Murthy, Arun R <arun.r.murthy@intel.com>
>> Sent: Wednesday, February 5, 2025 3:57 PM
>> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Syrjala,
>> Ville <ville.syrjala@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
>> Subject: [PATCH v4 2/3] drm/plane: modify create_in_formats to
>> accommodate async
>>
>> create_in_formats creates the list of supported format/modifiers for
>> synchronous flips, modify the same function so as to take the
>> format_mod_supported as argument and create list of format/modifier for
>> async as well.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/drm_plane.c | 40 +++++++++++++++++++++++++++++--------
>> ---
>>   1 file changed, 29 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index
>> 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..3819fdde985576bd6ba6a08ce
>> b64613bd5e0a663 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -191,7 +191,11 @@ modifiers_ptr(struct drm_format_modifier_blob
>> *blob)
>>   	return (struct drm_format_modifier *)(((char *)blob) + blob-
>>> modifiers_offset);  }
>> -static int create_in_format_blob(struct drm_device *dev, struct drm_plane
>> *plane)
>> +static int create_in_format_blob(struct drm_device *dev, struct drm_plane
>> *plane,
>> +				 bool (*format_mod_supported)
>> +						(struct drm_plane *plane,
>> +						 uint32_t format,
>> +						 uint64_t modifier))
>>   {
>>   	const struct drm_mode_config *config = &dev->mode_config;
>>   	struct drm_property_blob *blob;
>> @@ -235,10 +239,10 @@ static int create_in_format_blob(struct drm_device
>> *dev, struct drm_plane *plane
>>   	mod = modifiers_ptr(blob_data);
>>   	for (i = 0; i < plane->modifier_count; i++) {
>>   		for (j = 0; j < plane->format_count; j++) {
>> -			if (!plane->funcs->format_mod_supported ||
>> -			    plane->funcs->format_mod_supported(plane,
>> -							       plane-
>>> format_types[j],
>> -							       plane-
>>> modifiers[i])) {
>> +			if (!format_mod_supported ||
>> format_mod_supported
>> +							(plane,
>> +							 plane-
>>> format_types[j],
>> +							 plane->modifiers[i]))
>> {
>>   				mod->formats |= 1ULL << j;
>>   			}
>>   		}
>> @@ -249,10 +253,7 @@ static int create_in_format_blob(struct drm_device
>> *dev, struct drm_plane *plane
>>   		mod++;
>>   	}
>>
>> -	drm_object_attach_property(&plane->base, config-
>>> modifiers_property,
>> -				   blob->base.id);
>> -
>> -	return 0;
>> +	return blob->base.id;
> I think we can return the blob instead of the id, more on this later.
Do you mean pointer to the blob. That can also be done.
But any advantage of doing so, because from blob_id we can get the blob.
>
>>   }
>>
>>   /**
>> @@ -369,6 +370,7 @@ static int __drm_universal_plane_init(struct
>> drm_device *dev,
>>   	};
>>   	unsigned int format_modifier_count = 0;
>>   	int ret;
>> +	int blob_id;
>>
>>   	/* plane index is used with 32bit bitmasks */
>>   	if (WARN_ON(config->num_total_plane >= 32)) @@ -475,8 +477,24
>> @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>   		drm_plane_create_hotspot_properties(plane);
>>   	}
>>
>> -	if (format_modifier_count)
>> -		create_in_format_blob(dev, plane);
>> +	if (format_modifier_count) {
>> +		blob_id = create_in_format_blob(dev, plane,
>> +						plane->funcs-
>>> format_mod_supported);
>> +		if (blob_id)
> The function create_in_format_blob() can return negative value. This check does not work if that is the case.

corrected!

Thanks and Regards,
Arun R Murthy
-------------------

>> 0 can be used as the blob id's start range is from 1 to INT_MAX
> Regards
>
> Chaitanya
>
>> +			drm_object_attach_property(&plane->base,
>> +						   config->modifiers_property,
>> +						   blob_id);
>> +	}
>> +
>> +	if (plane->funcs->format_mod_supported_async) {
>> +		blob_id = create_in_format_blob(dev, plane,
>> +						plane->funcs-
>>> format_mod_supported_async);
>> +		if (blob_id)
>> +			drm_object_attach_property(&plane->base,
>> +						   config-
>>> async_modifiers_property,
>> +						   blob_id);
>> +	}
>> +
>>
>>   	return 0;
>>   }
>>
>> --
>> 2.25.1
