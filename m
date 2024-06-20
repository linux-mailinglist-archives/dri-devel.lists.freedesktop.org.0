Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BC9910890
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A30810EA34;
	Thu, 20 Jun 2024 14:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNDdLxbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E596C10EA23;
 Thu, 20 Jun 2024 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718894277; x=1750430277;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pl0odpbJUOPM0hD8JjcEnhFGUP2kKxFNZGkwU4yy8eo=;
 b=lNDdLxbmWXz0dqH+P3CYK1xVHQkpr7vegFfnZ0Y4JMr7KyXpfao9FVnD
 I/Z4HIqFyaBhUZFad6nv8gHB4GrhoXiSUAfS7/twd7jMNFyQN6W+NYoGL
 NvEt7MBP2nn6c6lU1o8oxn11zEfiMkFwZHAWT7Ep8zAZuOXy9baJ8PuuJ
 LG3eQR8OlPynht2VywwtsgQERxHURz5t/p633GewhRZjCdNOQX+ocVHpP
 uZqxMg1Y/iDqS8JXktuPrvcgvgcqZi1Y7WNEjrAS/vuSyWSYzUrPCbXI3
 yPvsea2CPUvYj9SuOO65ZorHd0Qu53cYGVJMjgo0NWgyMJRiyoKziGB1p Q==;
X-CSE-ConnectionGUID: 0bR19MHRS6683zlz1NF5Ag==
X-CSE-MsgGUID: xVaI/LfQT2+De/MLH6R/Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="33414927"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="33414927"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:37:56 -0700
X-CSE-ConnectionGUID: rTD60PFJR/uTwQWI29iAnQ==
X-CSE-MsgGUID: 3vwOjrxSRR+j8KyjFZ04VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="47200182"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 07:37:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 07:37:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 07:37:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 07:37:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVM01bkLMOT478F4FEySHet45FLcuLmucF/yHLH5ldRRMj24AuOdYwyjvkbXgMJw6AUlhVc+k+TkYuCoO1Ui6SlML9IkBrhMDtTwrQafNV/TuO+bZMOwjAyrZVzfWGwToG/MsW4KSRRLQfR8Ru7AAy02BkzFjUc0eKK4s5ozyRjHuYrUj4xSUnYz8TDbwAWca4GxN9+4H7vt4vHDO4i8RoFems1KD+jP5d9VseZUmou780gKALg9OqiF224c/G8y+LTjkV0w0GUCbDRBqeS2IESY+/04PY/PdGZBGADukyCJvt/Xxh8qBf/wTTWKaH2CKHdjo2srS7Gf7rMXyMVjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Pc6CmDso16ivCmotFbxoj9IeM4FcF535VgkULiI34=;
 b=SClBeJEzOTGNlhd7UhUeJQYhIlP0ItqOhkAiMwBACJS3qLMyMTV2kMsVdl4Bs5H80HOKktb2zDtS27UKL/ybctE92LpU6xELIOG9SSglMQnX5btnWMs3YPyXJazgdDJn6HUzfYFxbu93EPgPmqk/DZAZj53o0GL/o7juHLcC8tQ97epJxw4qIaKqgk2G1jsPDPHaZBPmMiCMiRHZ43x2gBxFbwK6oK5X6ndGfevbzcdiHsNZrO1styNcBfNOHsyUgRXxBOCEZBLbwU2k/yP+boAAe9viT5DtevOV3IyAes2WwELQBTYWwm61Ahol5/cM1zrZt/0L4ZAwDJgVrRwb/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA2PR11MB4986.namprd11.prod.outlook.com (2603:10b6:806:114::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 14:37:53 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 14:37:53 +0000
Message-ID: <f81307fb-b63b-4f87-9e20-a8033faac514@intel.com>
Date: Thu, 20 Jun 2024 16:37:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/ttm/pool: Introduce a way to skip clear on
 free
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20240620134656.14380-1-nirmoy.das@intel.com>
 <20240620134656.14380-2-nirmoy.das@intel.com>
 <71e4aed6-d9d3-41cd-b043-277e9573cb3f@amd.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <71e4aed6-d9d3-41cd-b043-277e9573cb3f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::13) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA2PR11MB4986:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b150a7-7f25-480c-978b-08dc913690e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2FISGlEcVJjdUZ3NTZQY0ZRN0tqSFJqcCtDNUt2SDg1T0N2TVpOUUNmcUYw?=
 =?utf-8?B?dU90YjR6WGRURXBiL1lhY3lQM1c2dm5Vckh2UEtrRGtjR1lEOUNJVExuOTlx?=
 =?utf-8?B?eDNWeUpzV25pVzJVakhSSDV1cFFsTFcrZkhzbCtUTmFxNzV0T2RoanlmU1J6?=
 =?utf-8?B?SW9rcUc5emFteENWRWVUcVZpaEdQSldqc3FvdUVTcXB0USt4WWdMeFdUaTNC?=
 =?utf-8?B?L3JMbGNjRDNQa21Qb3ErTTFCYmNEcDJEVHFjSHFoWXkwVC93QTlTeU1WNXBS?=
 =?utf-8?B?RFR4V2lCUkh6VStqRndiWUFQdWVNZ3YvSUZmcW5tQ2FMVk44cWpaZUtnTkdH?=
 =?utf-8?B?SkJFN2Q1bCswVEJhRDczVEhhQ2JHNXRoUEs2VUl1NTQ1T1NTOU1QMkd6Mlc4?=
 =?utf-8?B?Q3plTzh5QXFXRUN5T3J2dDNnRWl2bkVSRWFxZ2Jxam8xdlNsaTlOQnZtOCts?=
 =?utf-8?B?MnJBV01UTjNmTzNKaU9oSStud0JqdUxES1RDNjVnalovS1R6QmovOW1WaUZi?=
 =?utf-8?B?RWZGdWpsRDFvNForKy9PaXFEYkRiNjJ1aGlqM3N2TlNEMmxiNGpLa0k0Vk9Z?=
 =?utf-8?B?aUoxNXY2NlB3YTRZb2tIRXRieW1pcGR2RStGOFhkMkFpOWxQSzdsb2dyTlA1?=
 =?utf-8?B?VjJxb1I4Vm9BdldrVjUybDJRSUJXYnlteHRISW9VYUtySnAzN3o1Z0tGME85?=
 =?utf-8?B?Q201OGcreTdRYmtPbklJbXlsemFuaURISWVpK2pyRm5yZ21IY2U1M241SnUw?=
 =?utf-8?B?S2kwaVN4ZndleDZ5NzZiRGRlTm9lWWpMLzBDd0FMWlpxR1JxampXKzQ1a3Fx?=
 =?utf-8?B?VFhqMFhXN2xlbGFnS0ZYeFNlcHZIWTQxaXk2eDF1WXhiWGdzKzdvNXVKVWFj?=
 =?utf-8?B?eG9hdm84bURxeFN1eG1LOFU1MnJZYnJNcWdmQk5wQ3QyUXdYN3NYWjkrSnRy?=
 =?utf-8?B?NzZsa0xmeXIvbHFNR2NvMldsaWVUK3VEbE1QMmlqay9tVTRPVllKd2VHbEFM?=
 =?utf-8?B?RVZ2OWxFZGU1WFJtajU3OXVRb1ZVbGgzeGdVNGdsd1lONVhvR1pTTExRckRK?=
 =?utf-8?B?aG1mRS8wd0VNWm1SSHR4WWw0MEN6TXZ6bElEaENpeThnT1RUWGMxekNDUTY3?=
 =?utf-8?B?TzNscVBtaVNQMHQycE1DWE05KzBrbHF4Y2FSYjNTMEk1ZGVGUjMyWVNpTzRj?=
 =?utf-8?B?bWdoMklOVVZIMThrR0lEako1V05sQ3creVdXVjZvL3BNUmowQUVydjRDWlZM?=
 =?utf-8?B?TXdzdmxmVWZQN0lxaE1tQjVZWFRSUTN2ZmR4V2Q0b2x0bndmYVQxTlhpRTZW?=
 =?utf-8?B?cmUxdnc5M2tLazhJTnl5a1lyQ0I1UFVscFdtZXFqZjBpSXBYTEpITFNyanJx?=
 =?utf-8?B?RHN5b0VBNWZGWGtQSE5yQ0h3cE5tZWRvVHpnc09ialQxb3V1Z050TC9mcFJ2?=
 =?utf-8?B?Rkt0cFlLT1k5WFFJeHZLOG90MGxzVklSVXVCSWhWeEZuYTVkeXQ1dzh6WS9s?=
 =?utf-8?B?dkN1UkN5dGR5UmhzQ0plRXByTGpVdkpPTXA2RjA3L2hhWkN3eXk5Y1l2bkJu?=
 =?utf-8?B?ODdzTzd4a29pb0F1NXYyZjZISjJzdGxsdWdPa2FsUlYxa3ZwbWswN1k1TXVa?=
 =?utf-8?B?WHRUNHV6Qmwza2x2eWdZbWVuaTVkcFJ4QzExUkNIYklidUw5aFlWaVFGa3c1?=
 =?utf-8?B?V1BIYVNWM3hPdWh4R1pRNk12SEp6NUhHWXdHaE9qVVFpc2VOcEU5TkZVT0tj?=
 =?utf-8?Q?P+3zrN0vqy3Hayl59jufev7usPNTbYU5DJZuZat?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zmx6MUhOcjRUSldqSi94bGFacWJOOGwweFlGeWRnbmFnU1BwMnJIRTdZbTBl?=
 =?utf-8?B?ZTNsVTdXcmdybHpKakVGejBTTTV3eDVzbGNNajhRcklZdXVRaG0rTXp2QnFK?=
 =?utf-8?B?emxIYng5Sy9jSkxiQ1Z0aFNRZnNrVkRMMmNJRVliOHRGdms2VE9LMU93cFF3?=
 =?utf-8?B?U3c4Smg4NjYwSVp0K0hxbWprNE1HZFY3R2VUQ3JHSWhVUzcvOFFqYzZ4V21i?=
 =?utf-8?B?OEM4R3hQWmdBZXg4YWNWVkRvYklXUkZIb2FDR05JcnpxblZUUVhlaGpBSE9S?=
 =?utf-8?B?dG9VaUVPS3hHUklPV1Z0Y2NJUmNBdlVqQ2FycDN6ai9nUzA3V0Z0Wi9XOVFI?=
 =?utf-8?B?RU80TUpKZEU2ei8wbU9yQWo1QzVxK1BMTHhOYzVIWUtPU051WDlrbkVDcTJr?=
 =?utf-8?B?dkcrYTJ5YndxdnMrNFlVUmdQczFhS3RHTnEzb213dm9uUTUvY0pkVE5EQm1K?=
 =?utf-8?B?SnNNc1A5N1Z0cTBSLzlIdzgwaVgrZnlpdENSRU9JaytDeGwzcVFyNkZuM1VG?=
 =?utf-8?B?Vm85R3ZTakJTMGxlMjllZFJ3ZEVsQVMrempJVStJV2ZFckF2RGVzZENoTTdX?=
 =?utf-8?B?ckplcWhwS2dIaDg2cWtwUUowbkZzdHZKdnBFZHhQQVoyVitzUW9IZjlOejd1?=
 =?utf-8?B?dmRZSS9pY3g0TURKQkNBaEUyb0tIa1J0dFRkd0dzbHdHK01XNVhFVkk3Q1Jk?=
 =?utf-8?B?SFVOQUxJNVROMEtPcVk3L0lrMUdTdE15djhKUTljQXUzVXRVRkdnVlFlTzBD?=
 =?utf-8?B?OE1ySkxxNVdPZmlwTUhGY0xDTldYbUlYS3Z1cm5NYi81M0lmblhaRmRzcnJl?=
 =?utf-8?B?ZEw4UzVibzZ0NFBrR1dKOHFaaTE2T3V1THd0K3lpWndGTnhMc25zYzB0VnlD?=
 =?utf-8?B?bSsyaEQ5em5YZUdVelpmSFdhUGRwVFU5Y0tsWStuQVF2alo2WUU5L1RSSFJp?=
 =?utf-8?B?bWh0QStVYWZQajlCUGFOUHFXbEs1eFFzV1M3RHBzcEVWWTk0MjdTRXlvNUhP?=
 =?utf-8?B?RUFFZVJMRjF6ZFg3cmR4Zit6UUlUTEl1aDNmcWp5ZU03d3prdDJHRVNJb2VH?=
 =?utf-8?B?WkxtbDdEQTJEY05SM2xDdXExLzhVdzVkZDYyNDNheXg0dkJGRHNnMTZjUURs?=
 =?utf-8?B?Y3RXWjVITTNtV2VMczFrR2tZOW1wS1ByVlNIZ2lhVHRNMjVseXFyeCs3Sy9R?=
 =?utf-8?B?YXNPb2ZFYnc5Y05YcjkzaGlyMHhkNFNxQ3VYVERuOW1rZlRlM2NYY1R6SmVT?=
 =?utf-8?B?cjRIT2VsRDNvcnArYzJ3SitLMWhmVXFSNDV6VDVwN2RzNFIvMXJacFAxRk45?=
 =?utf-8?B?WXdrMTdpQXAyUHF1dFE0aXZpWGRVSXFVeUg2eHY4bjRYT0REbUVhbjZnUzR3?=
 =?utf-8?B?SXA2VWVCVmt6eFIyck9XcUtoWEdHVkNyb1B2dWZ2QzhDTEF5clJ4ZE5ib2lz?=
 =?utf-8?B?ZTdVa3ZrNnpjWENQaVUxblpZWDRXM21LMStvaHdqK3hITUlxTnpOMGtGM00z?=
 =?utf-8?B?cGJQVmZSTXpGbFlINTBvT1BwSDd5aWQ1TFhKWlJaWlhPcXpva2d1MVFNcWIv?=
 =?utf-8?B?aWxLZDRiYnRYS0lUWDhTTFRwLysxdUlrWUsrSXRlVGtqeHNPeFN1K0I0Y2JR?=
 =?utf-8?B?eGxKSHk3TkJlQ2NhaUZBWDI3aWM3V0s1YVoyOFpSSXhUN0RnbmdGMlllV0Vx?=
 =?utf-8?B?akVRM242cXVSNGNBWFRhbXJuT3BGWXUvV3lwUkg0U0locXViWHFoK3U0NmFM?=
 =?utf-8?B?R2g3bEdJckFBTGpYZXhCa0pYaHZCODgra20zakZObGQ4eFJCYnRERkMxc24w?=
 =?utf-8?B?Mkdndm1QMVcwMmZzSDRLS1FNZTJkWVphby9EQ0Rrc2p0bXlzOHd0Z0pNRmNT?=
 =?utf-8?B?V0REUlJsMlBxRWgydzdTSldWZTErTWk2Uzl3TUtiZ0diUE1ZcXhwaFB3Nk5W?=
 =?utf-8?B?WGEySDRWa1pmM2hkK0FXcmptYlJyQXc5VUZGYTd5SzRydFd5dnhLeXVwbTB5?=
 =?utf-8?B?cTFzQlRyQUo1K2gveDZhMDF1eDZqOXhaaER1eWhBdWJBOFFha1l1YTBhYTJa?=
 =?utf-8?B?VnlZUVplNEVyUm52L1ZtcTJhZXhSZjlsdXROc09jaFJqM2xEMTQ2TGYwV0hv?=
 =?utf-8?Q?ywbOD0MNidG232ww9S5lwQcvq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b150a7-7f25-480c-978b-08dc913690e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 14:37:52.9695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nV91kNn7aouqzINl7IiNhqJC/9AXTdsRXaz2na/+Fdyt6xsJN1ewLxSyGi+wCI27nKv7GqZIIdvLjr/0jtbrZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4986
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

Hi Christian,

On 6/20/2024 4:08 PM, Christian König wrote:
> Am 20.06.24 um 15:46 schrieb Nirmoy Das:
>> Clearing pages can be very slow when using CPU but GPUs can perform this
>> task much faster. With this new pool API driver can decide if it 
>> wants to
>> clear pages using GPU. This provides the flexibility to choose the 
>> desired
>> clear policy, either during allocation or upon freeing, as per the 
>> driver's
>> preference.
>
> We already have the TTM_TT_FLAG_ZERO_ALLOC to indicate if pages needs 
> to be cleared on alloc from the OS.
>
> I'm not sure if we really need the option to not clear them in the 
> pool as well, but if we really need this I suggest to switch from 
> clear on free to clear on alloc again and just honor the flag.


Perf reported higher latency because of clearing pages before giving 
back to the pool. I think it would be nice if drm driver could avoid it.

I  can modify this to move clearing page to ttm_pool_type_take() to 
honor TTM_TT_FLAG_ZERO_ALLOC flags.


>
> Alternatively you could also split the pools into cleared and not 
> cleared pages as well.


Could you expand this please ?


I have another question. Our userspace team have  found that there is 
higher latency for ttm_cached type buffer as well and using gpu clear 
doesn't help much

because kernel will clear pages anyways if 
alloc_on_init/CONFIG_INIT_ON_ALLOC_DEFAULT_ON is active. I see that only 
way to mitigate this is to use a pool for

ttm_cached buffers.  I was thinking of using a pool flag to also allow 
drm driver to create a pool for ttm_cached. I wonder what do you think 
about it and if

there is any other better solution.


Thanks,

Nirmoy

>
> Regards,
> Christian.
>
>>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c | 42 +++++++++++++++++++++++----
>>   drivers/gpu/drm/ttm/ttm_pool.c   | 49 +++++++++++++++++++++++++-------
>>   include/drm/ttm/ttm_device.h     |  8 ++++++
>>   include/drm/ttm/ttm_pool.h       | 11 +++++++
>>   4 files changed, 94 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index 434cf0258000..54a3ea825c2e 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -191,15 +191,19 @@ EXPORT_SYMBOL(ttm_device_swapout);
>>    * @vma_manager: A pointer to a vma manager.
>>    * @use_dma_alloc: If coherent DMA allocation API should be used.
>>    * @use_dma32: If we should use GFP_DMA32 for device memory 
>> allocations.
>> + * @pool_flags: Desired pool flags
>>    *
>>    * Initializes a struct ttm_device:
>>    * Returns:
>>    * !0: Failure.
>>    */
>> -int ttm_device_init(struct ttm_device *bdev, const struct 
>> ttm_device_funcs *funcs,
>> -            struct device *dev, struct address_space *mapping,
>> -            struct drm_vma_offset_manager *vma_manager,
>> -            bool use_dma_alloc, bool use_dma32)
>> +int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
>> +                    const struct ttm_device_funcs *funcs,
>> +                    struct device *dev,
>> +                    struct address_space *mapping,
>> +                    struct drm_vma_offset_manager *vma_manager,
>> +                    bool use_dma_alloc, bool use_dma32,
>> +                    unsigned int pool_flags)
>>   {
>>       struct ttm_global *glob = &ttm_glob;
>>       int ret, nid;
>> @@ -227,7 +231,8 @@ int ttm_device_init(struct ttm_device *bdev, 
>> const struct ttm_device_funcs *func
>>       else
>>           nid = NUMA_NO_NODE;
>>   -    ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
>> +    ttm_pool_init_with_flags(&bdev->pool, dev, nid, use_dma_alloc,
>> +                 use_dma32, pool_flags);
>>         bdev->vma_manager = vma_manager;
>>       spin_lock_init(&bdev->lru_lock);
>> @@ -239,6 +244,33 @@ int ttm_device_init(struct ttm_device *bdev, 
>> const struct ttm_device_funcs *func
>>         return 0;
>>   }
>> +EXPORT_SYMBOL(ttm_device_init_with_pool_flags);
>> +
>> +
>> +/**
>> + * ttm_device_init
>> + *
>> + * @bdev: A pointer to a struct ttm_device to initialize.
>> + * @funcs: Function table for the device.
>> + * @dev: The core kernel device pointer for DMA mappings and 
>> allocations.
>> + * @mapping: The address space to use for this bo.
>> + * @vma_manager: A pointer to a vma manager.
>> + * @use_dma_alloc: If coherent DMA allocation API should be used.
>> + * @use_dma32: If we should use GFP_DMA32 for device memory 
>> allocations.
>> + *
>> + * Initializes a struct ttm_device:
>> + * Returns:
>> + * !0: Failure.
>> + */
>> +int ttm_device_init(struct ttm_device *bdev, const struct 
>> ttm_device_funcs *funcs,
>> +            struct device *dev, struct address_space *mapping,
>> +            struct drm_vma_offset_manager *vma_manager,
>> +            bool use_dma_alloc, bool use_dma32)
>> +{
>> +    return ttm_device_init_with_pool_flags(bdev, funcs, dev, mapping,
>> +                           vma_manager, use_dma_alloc,
>> +                           use_dma32, 0);
>> +}
>>   EXPORT_SYMBOL(ttm_device_init);
>>     void ttm_device_fini(struct ttm_device *bdev)
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 6e1fd6985ffc..6f33c3e7cdf2 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -222,15 +222,17 @@ static void ttm_pool_unmap(struct ttm_pool 
>> *pool, dma_addr_t dma_addr,
>>   }
>>     /* Give pages into a specific pool_type */
>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page 
>> *p)
>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page 
>> *p, bool skip_clear)
>>   {
>>       unsigned int i, num_pages = 1 << pt->order;
>>   -    for (i = 0; i < num_pages; ++i) {
>> -        if (PageHighMem(p))
>> -            clear_highpage(p + i);
>> -        else
>> -            clear_page(page_address(p + i));
>> +    if (!skip_clear) {
>> +        for (i = 0; i < num_pages; ++i) {
>> +            if (PageHighMem(p))
>> +                clear_highpage(p + i);
>> +            else
>> +                clear_page(page_address(p + i));
>> +        }
>>       }
>>         spin_lock(&pt->lock);
>> @@ -396,7 +398,10 @@ static void ttm_pool_free_range(struct ttm_pool 
>> *pool, struct ttm_tt *tt,
>>       struct page **pages = &tt->pages[start_page];
>>       unsigned int order;
>>       pgoff_t i, nr;
>> +    bool skip_clear = false;
>>   +    if (pool->flags & TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE)
>> +        skip_clear = true;
>>       for (i = start_page; i < end_page; i += nr, pages += nr) {
>>           struct ttm_pool_type *pt = NULL;
>>   @@ -407,7 +412,7 @@ static void ttm_pool_free_range(struct ttm_pool 
>> *pool, struct ttm_tt *tt,
>>             pt = ttm_pool_select_type(pool, caching, order);
>>           if (pt)
>> -            ttm_pool_type_give(pt, *pages);
>> +            ttm_pool_type_give(pt, *pages, skip_clear);
>>           else
>>               ttm_pool_free_page(pool, caching, order, *pages);
>>       }
>> @@ -550,18 +555,21 @@ void ttm_pool_free(struct ttm_pool *pool, 
>> struct ttm_tt *tt)
>>   EXPORT_SYMBOL(ttm_pool_free);
>>     /**
>> - * ttm_pool_init - Initialize a pool
>> + * ttm_pool_init_with_flags - Initialize a pool with flags
>>    *
>>    * @pool: the pool to initialize
>>    * @dev: device for DMA allocations and mappings
>>    * @nid: NUMA node to use for allocations
>>    * @use_dma_alloc: true if coherent DMA alloc should be used
>>    * @use_dma32: true if GFP_DMA32 should be used
>> + * @flags: control flags for the pool
>> + *
>> + * Initialize the pool and its pool types with flags to modify defaults
>>    *
>> - * Initialize the pool and its pool types.
>>    */
>> -void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>> -           int nid, bool use_dma_alloc, bool use_dma32)
>> +void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device 
>> *dev,
>> +           int nid, bool use_dma_alloc, bool use_dma32,
>> +           unsigned int flags)
>>   {
>>       unsigned int i, j;
>>   @@ -571,6 +579,7 @@ void ttm_pool_init(struct ttm_pool *pool, 
>> struct device *dev,
>>       pool->nid = nid;
>>       pool->use_dma_alloc = use_dma_alloc;
>>       pool->use_dma32 = use_dma32;
>> +    pool->flags = flags;
>>         for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>           for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>> @@ -585,6 +594,24 @@ void ttm_pool_init(struct ttm_pool *pool, struct 
>> device *dev,
>>           }
>>       }
>>   }
>> +EXPORT_SYMBOL(ttm_pool_init_with_flags);
>> +
>> +/**
>> + * ttm_pool_init - Initialize a pool
>> + *
>> + * @pool: the pool to initialize
>> + * @dev: device for DMA allocations and mappings
>> + * @nid: NUMA node to use for allocations
>> + * @use_dma_alloc: true if coherent DMA alloc should be used
>> + * @use_dma32: true if GFP_DMA32 should be used
>> + *
>> + * Initialize the pool and its pool types.
>> + */
>> +void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>> +           int nid, bool use_dma_alloc, bool use_dma32)
>> +{
>> +    ttm_pool_init_with_flags(pool, dev, nid, use_dma_alloc, 
>> use_dma32, 0);
>> +}
>>   EXPORT_SYMBOL(ttm_pool_init);
>>     /**
>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
>> index c22f30535c84..1b20c5798e97 100644
>> --- a/include/drm/ttm/ttm_device.h
>> +++ b/include/drm/ttm/ttm_device.h
>> @@ -291,6 +291,14 @@ int ttm_device_init(struct ttm_device *bdev, 
>> const struct ttm_device_funcs *func
>>               struct device *dev, struct address_space *mapping,
>>               struct drm_vma_offset_manager *vma_manager,
>>               bool use_dma_alloc, bool use_dma32);
>> +int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
>> +                    const struct ttm_device_funcs *funcs,
>> +                    struct device *dev,
>> +                    struct address_space *mapping,
>> +                    struct drm_vma_offset_manager *vma_manager,
>> +                    bool use_dma_alloc, bool use_dma32,
>> +                    unsigned int pool_flags);
>> +
>>   void ttm_device_fini(struct ttm_device *bdev);
>>   void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
>>   diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>> index 160d954a261e..9822996309e5 100644
>> --- a/include/drm/ttm/ttm_pool.h
>> +++ b/include/drm/ttm/ttm_pool.h
>> @@ -66,10 +66,17 @@ struct ttm_pool_type {
>>    * @use_dma_alloc: if coherent DMA allocations should be used
>>    * @use_dma32: if GFP_DMA32 should be used
>>    * @caching: pools for each caching/order
>> + * @flags: flags to control certain pool behaviour
>> + *
>> + * The @flags can be:
>> + *  - %TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE - This flag can be used to
>> + *    skip clear on free when driver decides to do that on it's own.
>>    */
>>   struct ttm_pool {
>>       struct device *dev;
>>       int nid;
>> +#define TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE    1 << 0
>> +    unsigned int flags;
>>         bool use_dma_alloc;
>>       bool use_dma32;
>> @@ -85,6 +92,10 @@ void ttm_pool_free(struct ttm_pool *pool, struct 
>> ttm_tt *tt);
>>     void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>              int nid, bool use_dma_alloc, bool use_dma32);
>> +void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device 
>> *dev,
>> +                  int nid, bool use_dma_alloc, bool use_dma32,
>> +                  unsigned int flags);
>> +
>>   void ttm_pool_fini(struct ttm_pool *pool);
>>     int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>
