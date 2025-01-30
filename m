Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56051A22E41
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5733010E986;
	Thu, 30 Jan 2025 13:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy0louvb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B04410E986;
 Thu, 30 Jan 2025 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738245213; x=1769781213;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d7/akFGlFvlVgEofhQtCyMxzhiqMKDBEr1mSkc/sQzk=;
 b=Oy0louvbClNOKbF97v9nn5BjzypjgvP8Ktv9qj+J/DoFh8wDHbL+llbJ
 8mr3P28Ybeu7FFMhxa9f2J5j0rGIpwyTp2uHnotMuQkvsjixEh/qPfyuS
 ho2BUAdFpaR/I5nqezemYxm7bqzGSVnbJSg0CI/+xzyw0MvDaH5MIIsb1
 mSWUCzOj18jrjb4UuV5WKi+99NAezktshCK9r7//KhcX6wsT0Yrjr5ZXM
 VT8E3uS9gr21YaoXvh8VlAKP19MNF2efas9NTKGJ6jTPLTHcApjyFfFk6
 JZuEBMmYCDq+sB5nXEgH3RwR/cMeUm9H+Z/3jA+Re0mo4CpR7ZLVmbFRk Q==;
X-CSE-ConnectionGUID: VteQlOVUR4681+QI5knWMg==
X-CSE-MsgGUID: MtDOWKKDRC2saUeP4Ggn7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38925729"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38925729"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 05:53:33 -0800
X-CSE-ConnectionGUID: cCXjNH6QQqKbRiBMdzh0HQ==
X-CSE-MsgGUID: HRgRdPF2SI+T+0Wqs/2U3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146528856"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 05:53:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 05:53:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 05:53:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 05:53:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kluYuqTZDovowTYjj/DSY/ouzL0MnNi19/ezNJnGmocsyCpZaCQRHTUUtKKmWdO/vB9rdOOhETd0KJGivARg2T5S1GJ5pdJewrMzGuFzab8APl9+UJ/M7pEh7LnUIGin58+D6RieAetaKvxwVf/X9jJPPazaCHGpq+BL/RTpRKBCbrW7h0mDTlZKkMyrLNv4yR0YnaIv8BEQn67/6052P5fSyrRD5s4KI1rZbhKx+9lUst63uf6i3Q9TZy5qXp8dOGs6QokCoCK0LQBGk/TWPm18NyKjUTjj5QFO0sVg248GcdLMxfkxHg5qQfdjJyLW3o7OvanVw8bwPCL2hgYiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suXWJK+s9T3qxiggi7Lip+0S0vE1JwaJGh4MLkdt0b0=;
 b=N2AwkmdleL0UjUkPXa8bsFCdEF13sMvKO9dHO0Rf55WUV7QplRVZsyi2GZO41/8x9J/klMPyiUxDMrgsiuEvyqCXwvAqD4V6x96onRI0Un4G/O7maXUz152PBQEPJP8Qh6BKJoIduy3tDseDCGLrWei1l+e++uHeO2AATcQnCkgihTJQVJv5m09/xluIJHG6QlcIyr9hkj60lkUmMPkiFc7gInEUoDTW7GSmE+OWQKO2oCHA9IZDICRps4010HxFoajRorP5Vb4GLtIShZJ2dMpjPTpvhTEEDefIMixphNBTWAIr8ilWKmXK8USiP5Pe37waNSKhfubdvhIrUPl8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 13:53:02 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 13:53:01 +0000
Message-ID: <ebbda74b-3cda-4df8-aac6-129377bb81c0@intel.com>
Date: Thu, 30 Jan 2025 15:52:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/33] Introduce GPU SVM and Xe SVM implementation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|PH7PR11MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6ea5de-7ad4-48df-fb57-08dd413569a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTI0clFMMk8zRm5ROVh3Y2NBeEtPNWFNSXV6UVNGdnVJMFJienl3ZGpzRXVK?=
 =?utf-8?B?TThvYTFBa2EzZGM2Q2NJQWowV2JwWStISElsckJ0SDBVYldtc3JGNGNlcU13?=
 =?utf-8?B?MzhRSzZNei92bU5kMFFtTkVPdDYxZlBQTUk0WXdRdUx3cUM2cHRxNWFpMS9L?=
 =?utf-8?B?Q01tNjJJeDdGeDd4T2RFaitaeDRObDlzZVBjSDJQWTlkSnRMSk9XRG5xcUEr?=
 =?utf-8?B?UG8rMG4waElXT3dzYmJuNkFXS2VYOHZJd2Fzc0txL3pZYmdJelh1UC85TDdI?=
 =?utf-8?B?aUh4anh0QjFKR0lTY09yUG9sSnFGM21BN1pPbmxhMDdOTElON3JVcHh1TnFr?=
 =?utf-8?B?RlZYVExTeTRmVUdEbGVzcG5zU2JoMy9BWjl2V1RmdWt6SzBWRDcwWmFhRHBo?=
 =?utf-8?B?WVk4alI3dGg5Nm1rS24rWW54aU9IZU90UTJlRXVoMmJ1bDFFNElmUEs0eUpp?=
 =?utf-8?B?enZhdDlsOEE0Si9xS1dLZmpRS0Rsckl4WDRoaGRBeFRhaFJqN0h2ck4zQStS?=
 =?utf-8?B?ZHg3SGpRYlc1ZFpxeU4wNTdPbnl2bS83MVEwcUUvUm10Q1ZZVGtjMk9zdkZn?=
 =?utf-8?B?cFZiQmJoa2RvWVNMWXZLbkhueXZGTlNxdHRweGV4a0VhZ0lSZzl0QVFZK2Na?=
 =?utf-8?B?QUV2S0ZLMjR5bkZLUjVVa21RQ01VbkNNQ0UyUDl3Y3lBaEFOL1NXTGJSOXRB?=
 =?utf-8?B?M2pFRnF4TVc5YWJaTi9vZkR1eHNFbmplRGpNcjFXdHNFQ1hBbTQrSldURThx?=
 =?utf-8?B?ZnVHM0lwdzBSVUZkN3o1ZHRvQm9rbkdzSFVuREFXOERGRWFCZCtMYWNHakNt?=
 =?utf-8?B?VE9oSFNZZUxxS1RadVB3TERaRWIzRldXY0tpUG9seWlEQlFFRlJKKzZEc3N2?=
 =?utf-8?B?eHliaER3K0xnSlFha0FrSDZ4QVV1ZlMrUW9uR3RBYTlJdUlFcks3cjFnODNl?=
 =?utf-8?B?bDN1RWRBL1NMM2JreVM5N0ZzQ1QrY0lqemJNNTdXazBvQzlVOGYvWlR5MjZv?=
 =?utf-8?B?Z1ZUb2pjaTRWVzJrMncwWGFodHpLK2RBUitWTnV5SjhmeE9NQ09jTkVWNmFD?=
 =?utf-8?B?SkY5WVc2VDk2eTlFc3loMDZuY01vOFVsWENPeXdPeHBJdGhMRGtNSC83cUtD?=
 =?utf-8?B?ZFM3bG42NStJM0NRVy9RR245OFNicnBOYS9yeWl6MGp4dDRXS0puRGlqWURs?=
 =?utf-8?B?WHBOOFR4VktwY0NzcHkyckdrTTArK2RSU25RZmZoVGVVTlNQT0xkWVdvYm5z?=
 =?utf-8?B?VlAyQ2VXN0REdEJXblBuQlJkOFJDMVBhOG5zQkRJdWwvQnUxNnBGTXhWbjJG?=
 =?utf-8?B?VDdLZlBsdCsvOUw0Y1lzWWhCczJqQXAyYzdkODVmRmpoLzN5b2RrRldsYkhF?=
 =?utf-8?B?RWsvMHI4eThYZmpUdW5sMENxNG1MeWRrWm9xakNUQnNqQ0RYL3dJdTJ2WUhQ?=
 =?utf-8?B?OEVSNHVlK1Q0SStXdHE1a0pGeHdENVYzQmg3TEFxbHVNL1kvNmhJdjRuTFA0?=
 =?utf-8?B?RmZOZk9yQUFtU1BKQ0NrVzlUV3Y1NWdqKzZxRUJsUUh6OTBlMXlFT2IxTVhk?=
 =?utf-8?B?c013UHhOTlJXRzNwOE00VHgzZ1VjbURFbExQZk1HcHorOXFrVnVlLzJoUWs3?=
 =?utf-8?B?YUZKYVJxY0kzT28vR1JFSjVobG0zb0NuYXRFQmo0eHZpdTJ5QVk3S2dQQ0hK?=
 =?utf-8?B?OVhMSlM5VFMwSVBKNEJUVWo3aFRMTXFOejd2YmNUKzk2SUpST0ZXY20rTHZz?=
 =?utf-8?B?NHBqdGRqVVZsd1ErOVNuZk5YeVl5TEJ4QUVWUStTcGxUbUxmVVliZzJrQkVr?=
 =?utf-8?B?OHJGUVlWL0txOURqSi9WZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW5zOW93aGduUi9NeFQ0MlFjK05DTGFuaUE3Z3RiLzJKQWt2ckJjRlhEUHQ1?=
 =?utf-8?B?TUNmYktqcWszcVRpSXQ2V3BVRHNYZTZINGZrN0FRVFF5UGh2WDdGblY2MStv?=
 =?utf-8?B?alVyL2VEbEhjcGppZ016S1FxMThQb3h0d3htUEN6WU81RGVUbkFhbDh1K2xW?=
 =?utf-8?B?WElvdmIwSjhUak5sUmszeGZCR2lRNjRJWERDemoxRC9NdHd3OUxLeXZ1alZt?=
 =?utf-8?B?SW1vNlZtVE9hcUNOWVgyeW81QTJVZmNBZ0xZbFFUQnNOMWs4SFdha0JSYmpv?=
 =?utf-8?B?SVdxUXo3K1VaRVBvZGVGQlRwMnFlaXhaUmlQRzBZWlU2dzAwblh3WG9SVmtU?=
 =?utf-8?B?MnUwMmtyWDBUZDJDTU1BTS9NaHNmZXo2RVhkSTZXR1R1emw5Nk56TW5pbmUx?=
 =?utf-8?B?TlA3cU02aUQvUG1HeTBvSEhvRml6NEJVRFdHQXFaV3BOMEwvNTlzRVpzdzd1?=
 =?utf-8?B?VHVVMUlvUHRGZy9YV2VUTkZQakRkN3pHbGFmcVRIZDFZYnVHRGxIRE1GY09S?=
 =?utf-8?B?eWJ3RUN2NFJQSDNNSlcyMkpEL0NjMlEvanBRZVA1TXlocUJldGRRUUNsV0lY?=
 =?utf-8?B?WUZWQ0w0bHl2cmZNdTJ6OThuaE1uU0lheWZNaUFGRFVIN0hrU0ZOUG02clN1?=
 =?utf-8?B?c09XWWdvNWcvaE5YUkZaV2FNQUErY21uN1gvMHRRbVlzS0llUmp5cmFpTEhL?=
 =?utf-8?B?Ly9DYjZ3djQ2LyswVlAxZ041QlU0NGQweHhENFJpUXJ0OFlKdllBcHNWRlRI?=
 =?utf-8?B?N0dBT29nczFKNEJYTWZqMWFOTCs5Wjkyc3p4N1k3TjhZRnlPUUwwb2pYTWRE?=
 =?utf-8?B?R20vK29qQXpqWWRFZk5nMWRwWER5VVkwbnRMS0V4OGhKRE5mRDhvWXB4MlFv?=
 =?utf-8?B?ZzE1QXdmTmNoT3JzQVI2YVdYSTRjNHFnWHFSQUdGdExaUGh4c0FwYkVpUGRi?=
 =?utf-8?B?MWdhcS9SZDhOU1c1WkZpb0tDMExFekc0aXRTcE9xR0VwWSt5QkxmTEFIeWsw?=
 =?utf-8?B?UHZvNWZicSthSHNPQU03a0QwMEozNWNpT0xqK3U1NXQ3VFUrNjBiSFZvdkZ5?=
 =?utf-8?B?V0diUzRpSFQ1TkhFNmJxKzJUMnZwT21WR3lVZkxqU1B3V0pPS2V5bmVXdFAw?=
 =?utf-8?B?NnJ0aDdpYzZGWXl3YUlVdGkwaldWVkl2UnpjdG0rYkNVVStuZGttVmxUL0xx?=
 =?utf-8?B?LzBhTjFLTURKMnVkaFREU1dLWUVTUUlVRVAreXN2ek5TM1BwTnBySzc2b3hP?=
 =?utf-8?B?SVNITWpZU0czRGRNQmJsOFZjSUpsM0Z3TWMwTEtwZEZodW8zYnFKWko2NG54?=
 =?utf-8?B?Y0RBcG5wYVJLVVl2NkRGdEV0R1V6d3VEdHowUEZPTXdVbkZPZ3l6d2d0K3R2?=
 =?utf-8?B?UmpmY1lkYXJVNzE5UzRPSHFxR1NWQmI2TUs5bUI4eWZnZFhGS2xKSzlyMkJk?=
 =?utf-8?B?QTlybzNPcVkwNzFpdkZqNm1ZNlhyeVVMWlA1OFBzcStKR0Y2RTc0R2Ntdm80?=
 =?utf-8?B?aWU3VmVpY3VxL01SSUxDU2tJVElVRlJPQ3FnY3VQVTBTdGk2QkZMWmNhc3Nj?=
 =?utf-8?B?bXZ1dndncjgwM2wwNFNSY2NrbVpVSHRqSFh6RmlaRTBseUVrT2hNOGthL3Jq?=
 =?utf-8?B?UzhsSnV6SmV0WmE1MUJKYndiQUZwMVJsa29TMnh4T2hPZklKSm5tZ2Zzay9q?=
 =?utf-8?B?WXhmc0xZYmpybTdnYVFnbUlaY1g4Vms5Mk9ldUVBS2JldExwRVovRlRBS05P?=
 =?utf-8?B?RU43dnFHR0JlcmVTZ3M2Nzd5Z2NjVnFaeVRWZnVkYjVZOUpWdVhmRlZGYjRh?=
 =?utf-8?B?a0s5ZFZKT0Y3emJaa2hUY0xrUXhWZzUzSVh0NVlBSUJqNjhaVjRqZHhvbDUz?=
 =?utf-8?B?QVNjczN5Wi9kZ0w0VkhoUmxkbkpRNzdnbks4bVhKQTRKNGtsUDVtY2tOTXNp?=
 =?utf-8?B?eENwUTJMNFdMSGlsL084MnFVZFU3bHZ4QmtIYUV4RUYzUmdhUXFCd2V5aVdM?=
 =?utf-8?B?M1U0aUZXSld5cGtxTms2LzBNUHZvSG9oL1gwK25EQUNoc1JzSkIvU0YyUmM3?=
 =?utf-8?B?cnFLVjNxWEpJYmVwckhCN2FDdXRaM1diYllHcVdjei9xMzFkWW4rM0JQQm5I?=
 =?utf-8?B?b1IxN1l3eHo4a0VPU3QzWitaSGdwVU5iVnRhWGZUakRrRlBZODNZZFE5QWZz?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6ea5de-7ad4-48df-fb57-08dd413569a4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:53:01.9115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrjHTFd3Xc8fYRCwOjod72s+LGCt8u/zYQxjY83IdrsbeD7uvgxBdainAstjlX8e+6cqwYTkg37VrdHulWrgESfz7fKxTMKKOEp8rXmcKGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
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

Hi Matt,

I report this VM_WARN_ON_ONCE_FOLIO(), which also occurred when testing 
with v3, but also occurs in the same callstack when testing with this 
version.

G.G.

[  249.486325] [IGT] xe_exec_system_allocator: executing
[  249.530682] [IGT] xe_exec_system_allocator: starting subtest 
once-malloc-race
[  249.536822] xe 0000:00:04.0: [drm:vm_bind_ioctl_ops_create [xe]] 
op=0, addr=0x0000000000000000, range=0x0001000000000000, 
bo_offset_or_userptr=0x0000000000000000
[  249.536981] xe 0000:00:04.0: [drm:vm_bind_ioctl_ops_create [xe]] MAP: 
addr=0x0000000000000000, range=0x0001000000000000
[  249.539658] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] PAGE 
FAULT: asid=17, gpusvm=ffff888179f09188, vram=0,0, 
seqno=9223372036854775807, start=0x005562fec30000, end=0x005562fec40000, 
size=65536
[  249.539801] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] 
ALLOCATE VRAM: asid=17, gpusvm=ffff888179f09188, vram=0,0, 
seqno=9223372036854775807, start=0x005562fec30000, end=0x005562fec40000, 
size=65536
[  249.540518] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] ALLOC 
VRAM: asid=17, gpusvm=ffff888179f09188, pfn=17179850416, npages=16
[  249.540709] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] INVALIDATE: 
asid=17, gpusvm=ffff888179f09188, seqno=3, start=0x00005562fec30000, 
end=0x00005562fec40000, event=6
[  249.541133] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] NOTIFIER: 
asid=17, gpusvm=ffff888179f09188, vram=0,0, seqno=9223372036854775807, 
start=0x005562fec30000, end=0x005562fec40000, size=65536
[  249.542416] xe 0000:00:04.0: [drm:xe_svm_copy [xe]] COPY TO VRAM - 
0x0000000157564000 -> 0x00000002fb6b0000, NPAGES=16
[  249.543466] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] GET 
PAGES: asid=17, gpusvm=ffff888179f09188, vram=0,0, 
seqno=9223372036854775807, start=0x005562fec30000, end=0x005562fec40000, 
size=65536
[  249.543476] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] INVALIDATE: 
asid=17, gpusvm=ffff888179f09188, seqno=5, start=0x00005562fec30000, 
end=0x00005562fec40000, event=6
[  249.543585] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] NOTIFIER: 
asid=17, gpusvm=ffff888179f09188, vram=0,0, seqno=9223372036854775807, 
start=0x005562fec30000, end=0x005562fec40000, size=65536
[  249.543800] xe 0000:00:04.0: [drm:xe_svm_copy [xe]] COPY TO SRAM - 
0x00000002fb6b0000 -> 0x000000017687c000, NPAGES=16
[  249.544575] page: refcount:1 mapcount:0 mapping:0000000000000000 
index:0x5562fec30 pfn:0x157564
[  249.545266] anon flags: 
0x4000000000020018(uptodate|dirty|swapbacked|zone=2)
[  249.545786] raw: 4000000000020018 dead000000000100 dead000000000122 
ffff88817c2cad19
[  249.546368] raw: 00000005562fec30 0000000000000000 00000001ffffffff 
0000000000000000
[  249.546957] page dumped because: VM_WARN_ON_ONCE_FOLIO(!memcg && 
!mem_cgroup_disabled())
[  249.547534] ------------[ cut here ]------------
[  249.547903] WARNING: CPU: 2 PID: 398 at 
./include/linux/memcontrol.h:730 folio_lruvec_lock_irqsave+0x121/0x1e0
[  249.548608] Modules linked in: xe drm_ttm_helper gpu_sched 
drm_suballoc_helper drm_gpuvm drm_exec drm_gpusvm i2c_algo_bit drm_buddy 
video wmi ttm drm_display_helper drm_kms_helper crct10dif_pclmul e1000 
crc32_pclmul ghash_clmulni_intel i2c_piix4 i2c_smbus fuse
[  249.550223] CPU: 2 UID: 0 PID: 398 Comm: xe_exec_system_ Not tainted 
6.13.0-drm-tip-test+ #59
[  249.550863] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
BIOS 1.15.0-1 04/01/2014
[  249.551445] RIP: 0010:folio_lruvec_lock_irqsave+0x121/0x1e0
[  249.551876] Code: ff ff 0f 1f 44 00 00 80 3d ea 97 4b 01 00 0f 85 47 
ff ff ff 48 c7 c6 c8 4b 44 82 48 89 df e8 36 60 f5 ff c6 05 ce 97 4b 01 
01 <0f> 0b e9 2a ff ff ff e8 a3 b6 e0 ff 85 c0 75 bb be ff ff ff ff 48
[  249.553067] RSP: 0018:ffffc90001e1b7e0 EFLAGS: 00010246
[  249.553465] RAX: 000000000000004c RBX: ffffea00055d5900 RCX: 
0000000000000000
[  249.553923] RDX: 0000000000000000 RSI: ffffffff824dbf9f RDI: 
00000000ffffffff
[  249.554391] RBP: 0000000000000000 R08: 00000000ffff7fff R09: 
ffff88842fbfffa8
[  249.554882] R10: ffff88842f940000 R11: 0000000000000002 R12: 
ffffc90001e1b808
[  249.555351] R13: ffffffff812d7a10 R14: ffffc90001e1b808 R15: 
ffffea00055d5900
[  249.555854] FS:  00007f05ce05bf00(0000) GS:ffff88842fd00000(0000) 
knlGS:0000000000000000
[  249.556382] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  249.556851] CR2: 00007f05cf99f460 CR3: 0000000165226000 CR4: 
0000000000750ef0
[  249.557324] PKRU: 55555554
[  249.557531] Call Trace:
[  249.557679]  <TASK>
[  249.557804]  ? __warn.cold+0xb7/0x155
[  249.558040]  ? folio_lruvec_lock_irqsave+0x121/0x1e0
[  249.558330]  ? report_bug+0xe6/0x170
[  249.558560]  ? handle_bug+0x53/0x90
[  249.558755]  ? exc_invalid_op+0x13/0x60
[  249.558962]  ? asm_exc_invalid_op+0x16/0x20
[  249.559187]  ? __pfx_lru_add+0x10/0x10
[  249.559407]  ? folio_lruvec_lock_irqsave+0x121/0x1e0
[  249.559707]  folio_batch_move_lru+0x89/0x160
[  249.559941]  ? find_held_lock+0x2b/0x80
[  249.560151]  ? __pfx_lru_add+0x10/0x10
[  249.560368]  __folio_batch_add_and_move+0x1a8/0x350
[  249.560652]  folio_putback_lru+0xe/0x40
[  249.560865]  __migrate_device_finalize+0xbc/0x370
[  249.561123]  drm_gpusvm_migrate_to_ram+0x276/0x3a0 [drm_gpusvm]
[  249.561460]  do_swap_page+0x129e/0x2160
[  249.561710]  ? __pfx_default_wake_function+0x10/0x10
[  249.561985]  ? rcu_is_watching+0xd/0x40
[  249.562196]  __handle_mm_fault+0x566/0x940
[  249.562488]  handle_mm_fault+0xae/0x280
[  249.562699]  do_user_addr_fault+0x168/0x700
[  249.562930]  exc_page_fault+0x72/0x230
[  249.563135]  asm_exc_page_fault+0x22/0x30
[  249.563363] RIP: 0010:_copy_from_user+0x41/0x90
[  249.563639] Code: 00 00 48 83 ec 08 e8 7e a2 be ff 48 b8 00 f0 ff ff 
ff 7f 00 00 48 39 d8 48 19 c0 0f 01 cb 48 09 c3 4c 89 e1 48 89 ef 48 89 
de <f3> a4 0f 1f 00 0f 01 ca 48 85 c9 75 10 48 83 c4 08 48 89 c8 5b 5d
[  249.564621] RSP: 0018:ffffc90001e1bcb0 EFLAGS: 00050206
[  249.564943] RAX: 0000000000000000 RBX: 00005562fec37090 RCX: 
0000000000000008
[  249.565331] RDX: 0000000000000000 RSI: 00005562fec37090 RDI: 
ffffc90001e1bcd8
[  249.565736] RBP: ffffc90001e1bcd8 R08: 0000000000000188 R09: 
0000000000000000
[  249.566113] R10: 0000000000000001 R11: 0000000000000000 R12: 
0000000000000008
[  249.566500] R13: 00005562fec37090 R14: ffffc90001e1be10 R15: 
0000000000000001
[  249.566915]  do_compare+0x33/0x110 [xe]
[  249.567195]  xe_wait_user_fence_ioctl+0x182/0x410 [xe]
[  249.567576]  ? __pfx_woken_wake_function+0x10/0x10
[  249.567839]  ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
[  249.568219]  drm_ioctl_kernel+0xa4/0x100
[  249.568469]  drm_ioctl+0x21f/0x4d0
[  249.568655]  ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
[  249.569020]  ? _raw_spin_unlock_irqrestore+0x53/0x80
[  249.569299]  ? lockdep_hardirqs_on+0xba/0x140
[  249.569575]  ? _raw_spin_unlock_irqrestore+0x3c/0x80
[  249.569845]  xe_drm_ioctl+0x4f/0x80 [xe]
[  249.570092]  __x64_sys_ioctl+0x7e/0xb0
[  249.570308]  do_syscall_64+0x64/0x140
[  249.570535]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  249.570811] RIP: 0033:0x7f05cf841ced
[  249.571006] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 
45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 
05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[  249.571994] RSP: 002b:00007ffea49d2280 EFLAGS: 00000246 ORIG_RAX: 
0000000000000010
[  249.572436] RAX: ffffffffffffffda RBX: 00007ffea49d2388 RCX: 
00007f05cf841ced
[  249.572842] RDX: 00007ffea49d2310 RSI: 00000000c048644a RDI: 
0000000000000003
[  249.573228] RBP: 00007ffea49d22d0 R08: 00007ffea49d2388 R09: 
00007f05cf9140a0
[  249.573631] R10: 0000000000000000 R11: 0000000000000246 R12: 
00007ffea49d2310
[  249.574009] R13: 00000000c048644a R14: 0000000000000003 R15: 
0000000000000001
[  249.574405]  </TASK>
[  249.574529] irq event stamp: 30955
[  249.574755] hardirqs last  enabled at (30963): [<ffffffff811a6c3e>] 
__up_console_sem+0x5e/0x80
[  249.575220] hardirqs last disabled at (30972): [<ffffffff811a6c23>] 
__up_console_sem+0x43/0x80
[  249.575725] softirqs last  enabled at (30378): [<ffffffff8110d147>] 
__irq_exit_rcu+0xb7/0x110
[  249.576181] softirqs last disabled at (30359): [<ffffffff8110d147>] 
__irq_exit_rcu+0xb7/0x110
[  249.576645] ---[ end trace 0000000000000000 ]---


On 1/29/25 9:51 PM, Matthew Brost wrote:
> Version 4 of GPU SVM. Thanks to everyone (especially Sima, Thomas,
> Alistair, Himal) for their numerous reviews on revision 1, 2, 3  and for
> helping to address many design issues.
> 
> This version has been tested with IGT [1] on PVC, BMG, and LNL. Also
> tested with level0 (UMD) PR [2].
> 
> Major changes in v2:
> - Dropped mmap write abuse
> - core MM locking and retry loops instead of driver locking to avoid races
> - Removed physical to virtual references
> - Embedded structure/ops for drm_gpusvm_devmem
> - Fixed mremap and fork issues
> - Added DRM pagemap
> - Included RFC documentation in the kernel doc
> 
> Major changes in v3:
> - Move GPU SVM and DRM pagemap to DRM level
> - Mostly addresses Thomas's feedback, lots of small changes documented
>    in each individual patch change log
> 
> Major changes in v4:
> - Pull documentation patch in
> - Fix Kconfig / VRAM migration issue
> - Address feedback which came out of internal multi-GPU implementation
> 
> Known issues in v4:
> - Check pages still exists, changed to threshold in this version which
>    is better but still need to root cause cross process page finding on
>    small user allocations.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/137545/#rev3
> [2] https://github.com/intel/compute-runtime/pull/782
> 
> Matthew Brost (29):
>    drm/xe: Retry BO allocation
>    mm/migrate: Add migrate_device_pfns
>    mm/migrate: Trylock device page in do_swap_page
>    drm/gpusvm: Add support for GPU Shared Virtual Memory
>    drm/xe: Select DRM_GPUSVM Kconfig
>    drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
>    drm/xe: Add SVM init / close / fini to faulting VMs
>    drm/xe: Nuke VM's mapping upon close
>    drm/xe: Add SVM range invalidation and page fault handler
>    drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
>    drm/xe: Add (re)bind to SVM page fault handler
>    drm/xe: Add SVM garbage collector
>    drm/xe: Add unbind to SVM garbage collector
>    drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has
>      bindings
>    drm/xe: Enable CPU address mirror uAPI
>    drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
>    drm/xe: Add migrate layer functions for SVM support
>    drm/xe: Add SVM device memory mirroring
>    drm/xe: Add drm_gpusvm_devmem to xe_bo
>    drm/xe: Add GPUSVM device memory copy vfunc functions
>    drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
>    drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
>    drm/xe: Add BO flags required for SVM
>    drm/xe: Add SVM VRAM migration
>    drm/xe: Basic SVM BO eviction
>    drm/xe: Add SVM debug
>    drm/xe: Add modparam for SVM notifier size
>    drm/xe: Add always_migrate_to_vram modparam
>    drm/doc: gpusvm: Add GPU SVM documentation
> 
> Thomas Hellström (4):
>    drm/pagemap: Add DRM pagemap
>    drm/xe/bo: Introduce xe_bo_put_async
>    drm/xe: Add dma_addr res cursor
>    drm/xe: Add drm_pagemap ops to SVM
> 
>   Documentation/gpu/rfc/gpusvm.rst            |   84 +
>   Documentation/gpu/rfc/index.rst             |    4 +
>   drivers/gpu/drm/Kconfig                     |    9 +
>   drivers/gpu/drm/Makefile                    |    1 +
>   drivers/gpu/drm/drm_gpusvm.c                | 2240 +++++++++++++++++++
>   drivers/gpu/drm/xe/Kconfig                  |   10 +
>   drivers/gpu/drm/xe/Makefile                 |    1 +
>   drivers/gpu/drm/xe/xe_bo.c                  |   63 +-
>   drivers/gpu/drm/xe/xe_bo.h                  |   14 +
>   drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
>   drivers/gpu/drm/xe/xe_device.c              |    3 +
>   drivers/gpu/drm/xe/xe_device_types.h        |   22 +
>   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   17 +-
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   24 +
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    2 +
>   drivers/gpu/drm/xe/xe_migrate.c             |  175 ++
>   drivers/gpu/drm/xe/xe_migrate.h             |   10 +
>   drivers/gpu/drm/xe/xe_module.c              |    7 +
>   drivers/gpu/drm/xe/xe_module.h              |    2 +
>   drivers/gpu/drm/xe/xe_pt.c                  |  393 +++-
>   drivers/gpu/drm/xe/xe_pt.h                  |    5 +
>   drivers/gpu/drm/xe/xe_pt_types.h            |    2 +
>   drivers/gpu/drm/xe/xe_query.c               |    5 +-
>   drivers/gpu/drm/xe/xe_res_cursor.h          |  116 +-
>   drivers/gpu/drm/xe/xe_svm.c                 |  946 ++++++++
>   drivers/gpu/drm/xe/xe_svm.h                 |   84 +
>   drivers/gpu/drm/xe/xe_tile.c                |    5 +
>   drivers/gpu/drm/xe/xe_vm.c                  |  375 +++-
>   drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
>   drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
>   include/drm/drm_gpusvm.h                    |  445 ++++
>   include/drm/drm_gpuvm.h                     |    5 +
>   include/drm/drm_pagemap.h                   |  105 +
>   include/linux/migrate.h                     |    1 +
>   include/uapi/drm/xe_drm.h                   |   22 +-
>   mm/memory.c                                 |   13 +-
>   mm/migrate_device.c                         |  116 +-
>   37 files changed, 5245 insertions(+), 157 deletions(-)
>   create mode 100644 Documentation/gpu/rfc/gpusvm.rst
>   create mode 100644 drivers/gpu/drm/drm_gpusvm.c
>   create mode 100644 drivers/gpu/drm/xe/xe_svm.c
>   create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>   create mode 100644 include/drm/drm_gpusvm.h
>   create mode 100644 include/drm/drm_pagemap.h
> 

