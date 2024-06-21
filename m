Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA9912A87
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBF510F261;
	Fri, 21 Jun 2024 15:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYbDf6Cp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C9F10F261;
 Fri, 21 Jun 2024 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718984665; x=1750520665;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=38fHgDOLBZiC8vYThuf8gkhPcb5Nl5yr6Af6HkmJIkg=;
 b=hYbDf6CpFVu9GvSZ5QiUcj2nBHjJ/mezSb86hmTkUnF3U1CZzp7exXEz
 oR2bw2EUxkbRhpQp9+pcKqnR/srrBJ50kfcU8AqJebmUeYrClXTi8oOrt
 q7uK7UjCMDdmm7t8hyaYXwM0pp4YryNOU3C0vSLPEDCnUt5WDV6n+YuGC
 jjDD3x7sE8ttfmDuM0osbwxcb2U0feZnTvAQ62KJrUwpLRnnhvcsFkoQE
 sCynzq5CxgtPwugfCdrk09SKjfIW84zBENN7s3weRfeaiozmIFinH3JNR
 qt4Dh+beJcATZ9L6ndPC5jW7h+qSzRcYq2UfOeKIvKC9M7ft5gOnQMCqp w==;
X-CSE-ConnectionGUID: vs0wGXRhQJ2ztKQ4uT1Rig==
X-CSE-MsgGUID: VBUUke5uT5OTuHd8bRi1bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16152428"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="16152428"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 08:44:24 -0700
X-CSE-ConnectionGUID: IQnkj3hhTUieCWkF8PiVhA==
X-CSE-MsgGUID: bYl5YLVBQAO+vjDgoaZ5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="73835383"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 08:44:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 08:44:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 08:44:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 08:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8oficwfV8dwK5MRrzyjgdjianklmpeKcEVZUEl41AoX3IEGD9w30SJR/oXa65xfK0NY1w+t0pE3Da82gLmsXAH3A7gycqDVSDW7/ZiWzbXIQjypxc21+wFOBOvAlpl4VoilmMPgBsmy2wPvK9kSRBjCxH2oRK1OI+jXju0k0a2sHcaQYuPGX7v7v5KQkR1uxB5YwEfbedJDEnwGXaqYhYno8huLEdWFYCgzS6vwIyo5iHvVRORPJdZBpv8AUhDU2a2bajP7v1m8tKL1VSs/+Bs53/5u4Aa00xK4foXMt5Op2UJ7t9luXN83ZgiaeyxXgMLTq39ggxEe1KvFyVIfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUOcpfVIPjpuCrDEjiyAV6WImzxdt1R2xza20mi7Fs0=;
 b=HcxMeZLz/1bLrNPWRnz3OVbiygfevrbC8y+s4pkVtnUvtjQvzDIqXOT7vXji+WBzI7FJ1xMt93KMvXVz+PAXQ7uwee64GKvsQj3x/EgeDuNnONk90vAmXAubT0ZTHdEV2933XGRJrHRC3TDXuv41kS8hg4izNQL2ae85u8FvqVE48Q5hlEdOpGZml9wNYidN5s8qxYxIrSBreRs6P3Cneh5q68Y8J+//0pjeRvmPxWe+0MAcBkDX5V/15pHNvXUSkGKXiyRCDzWYN5O+RCMdQ2fJKO+H0LKJseYZe3lqeLy2w4AXEc2j9r7PN9MWGLx3jKlxsd6Ba0hYAF5CV6hYzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.27; Fri, 21 Jun 2024 15:44:02 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 15:44:02 +0000
Message-ID: <0f3d8391-ba82-434c-8871-85bb17bac6eb@intel.com>
Date: Fri, 21 Jun 2024 17:43:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm/pool: Revert to clear-on-alloc to honor
 TTM_TT_FLAG_ZERO_ALLOC
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20240620160147.29819-1-nirmoy.das@intel.com>
 <98890fd6-43b8-4a08-84e8-1f635abb933d@amd.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <98890fd6-43b8-4a08-84e8-1f635abb933d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0090.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ff9c26-c63d-4c12-3d86-08dc9208f926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXpMOGd4NUJwTVVLR1NscHZoZmxoSWcvQlVuVkpGWTJNbnpKODJpQjFxUmlF?=
 =?utf-8?B?OExXTDMzMlpUekExK0xCVXhLY3FoM1NEaUpJK0pDak5rajEzbTQxRHRrS3ZE?=
 =?utf-8?B?TnJPdStHaXNRMTU0WUJoS21rU1EwaEFUZUVoWGdFREMwQVIrOWVlSU5LSnFk?=
 =?utf-8?B?dnpxU3pCMjUyK28xMGh1alZONWZQWWVWYUZ6WFo0elZvdUlJeG5UcThjV0p5?=
 =?utf-8?B?Kzk4dmlzN1ltU0JtK1BhVDlncmUwbTZleUJac3dObER5NFRSQ0lpNUFiVmdH?=
 =?utf-8?B?M3lFbGdhZ2NoRmZIRHBiaEVyRFhOc25BbWpLNUdzQ2tyQ1RiYk5MdGVETjQv?=
 =?utf-8?B?RHlpZUJKUnBsb2wxU3BpeUNlSk1OeUZqNE9KTjV0Z1FHZWt5V01nL1puVmov?=
 =?utf-8?B?dTBIYWIvZkYyUThLRVpaNE9KU05FWVZadUZrL1IrZTFCM0RzN2FVVTJuMnhZ?=
 =?utf-8?B?T1k4VTRKaVFwZy9JL1dyc1I3WjFleW5SNE5HREsybVFERUVUWjN3cjM3R09P?=
 =?utf-8?B?cXVmaGtTNmIwR0Z0Ly9QdlVWS2hkQ2xwSW9PLzJxOW5RYXlMRlQxcm5ZOEp0?=
 =?utf-8?B?TFp6WkZ3OXAwUGcwTU9hKzgyVXRubGFiQTJydC9mV05RQzVtRUN2ZEs3MitH?=
 =?utf-8?B?NXpGZ2U0a1ZuTXVEaGpiQlZ5OVBoc05tR241cHdhcFl0UG5wQ1FvK0hrdkl4?=
 =?utf-8?B?cEJEaEFiRWp0bUNxZUc0YkVXN1FyOW1QUUduUXRpTGM5N0dwTldJNU5abTZt?=
 =?utf-8?B?RFlEc2FtVmdDRmpJYmZCWTdFSEY1ZWVvV1E5QUUwcE1QQjlqYXdDYWhtM0FD?=
 =?utf-8?B?VFVRSG5HR2Q2eXdzVUpmUllEWlNYVlNueks3SFVNanhoa2crK0gvRk5qTHVT?=
 =?utf-8?B?SkRUdzJpNG9ybkF1VDVoNVFUdGhGTGhNaXlua2VNRDEvZk4vQXpBSUppdkM1?=
 =?utf-8?B?ZzRFeUNRUW8zd2QvTUR3U0dqVUdzbloxM3QxZ0JDQVdZMzNOYkJzcFhseEtF?=
 =?utf-8?B?NFloUWlpcEFhWWV1c054Y1ZBZ3UxT05jbExnQU52SlZIUVkreHNXVW1VMlJF?=
 =?utf-8?B?SXNnako3eE1NOEh4bzZCLzVibUZrMjFwVVZncU1MaEwza3ZiR2NSMXBsSHJw?=
 =?utf-8?B?c1ZaakJGdjZNV0VwOUxxMVFwa2F0OFdjZXEvc2h6akZKb3NDc3FTRUV4MmpB?=
 =?utf-8?B?cFVmcUtMcmdueFVudm1CVWs0blFmUEw1NTIxQll4c0o2V0pwWjJPTGJvMnRI?=
 =?utf-8?B?OHVhTEJJeVg4M3pIdWlNU21DM2Q3bnhxU0toaEdCUzI4cC9sT1luaG1SNHJx?=
 =?utf-8?B?QTNmRkNhZEVib3U0RFpzZ3d0TWRBdW96ZXpLUE9EY3ViMzdqeHBIVzRyNDJt?=
 =?utf-8?B?Smorelg2Q1BWSUxpTW9SNHZPL0tERXdiejYxRlUxUUZvS2JRS3dlVGpkck92?=
 =?utf-8?B?UFlRRDdmdFh1WmFBZTcvR091dWxLKzh1UXV2UHFSUU1sWjFxcVhFSE5LL24z?=
 =?utf-8?B?VHllTW1WYzB4dmo1WmtjS3NIR21BRWNCZkNJeFI2U2FSaUF2Tm1RZjZCdUpa?=
 =?utf-8?B?Uk5GYUlIbi9zVHU1Z1FZN0xKL2V2K3lGUkl0UDlyVS8zZ0w2SWh1WnkxQ0ky?=
 =?utf-8?B?S2U0QUI5eTZ6byszNWZBQnozUU5EK3NRVE8raVlRbEc0akc5MEpvenVhcG1v?=
 =?utf-8?B?THVtVWtwZkVHT3ZEd2U4ME5tY0EzU3Y4MGYxRllrTUR1ckQ4K3Qydi9qTlhm?=
 =?utf-8?Q?7dfe5fI5u1+2ynA/XZObc6XdUal4yK5GflhDkm9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzcvYTJ1R0E4ZzZHdTdJREg2NnRROS9XallSeTBkckhQS25oTTFYUWRuWDdT?=
 =?utf-8?B?TzhmRWVZbUJFcGlTWVk5b2pVWktnTEI1ZXJIRE1tbnBQUGtjTDc0SUhxYmth?=
 =?utf-8?B?YnNSV2k4TzZEWisyMzZGMXI0SGdYTzZmTm80T3JWZEpEYzJ2clh5WEhQVVI1?=
 =?utf-8?B?RVpUVGMxN2NLTkNoRDB2ZS85bzI2TFA1c0xCSXJleWRNSkJoS0xUMkEvc0Q2?=
 =?utf-8?B?dVZ0ckkxdVJkSXFxY2dBbGd0YjBqWDlTdlowMHMrbXllQW9TNnhqOTJnVkV2?=
 =?utf-8?B?ckZCcm1FZkk0VmpzU3UxajdyWTc0K0NQUDRDRlpFMC83QTlBNGZXaFhxa2x6?=
 =?utf-8?B?REJPWWFtSEExNU93VUlmc2RvYUZFRlFuTGJMMHk1ektIR3RjcHBxNUxBMTU4?=
 =?utf-8?B?L0cva0hlRTBnLzUxaE43aE5XVUdoRUxrYVlkalYyTG5aWVVBYnJwdk1Sc1kv?=
 =?utf-8?B?SWtLVUFVTTB3YWRuTDFsTVZNaVFHZnAxRFN2Nnk3b3lLMXNmYzJ6aGZRKzFa?=
 =?utf-8?B?VDlWN083UFVhbGFaNkYxckExa0lOZUd1Si8rUVYwUGR1UFhkVUpkLzNPbHQx?=
 =?utf-8?B?K3E5cWZUbzFxM29ZYStHODl0eTVBdzJYNXRZdWRrdEljTVVCdGljczBweHpV?=
 =?utf-8?B?TkxaVk9RVE41NThMUjVjTHFZa25OUFVPTzRPd041U2FXTVhsVWdTUUd0Q3Yv?=
 =?utf-8?B?QUVBYWF2Yytqa2s5N3dhQnVZc0MxS3krc3QzYXFHcWYxZGtRNzZwY1lEN2Fp?=
 =?utf-8?B?NkRSRUV5VVlLWGhIck42Nm9NTXFiWDlHTElwZGovMVladDJLTXEvc3FMd09X?=
 =?utf-8?B?Z3pXTU03NlVGLzdGOGdJREViSGJvRUtvRTlRc1QvVHdvMU1uNUlYRVhpcGhD?=
 =?utf-8?B?VHZpZzhYaXViNklmZis0SVdMemt2N3RnMEhrc3c2RnRhQnRROHVOVlZXaXE4?=
 =?utf-8?B?MHdMb0t6OHpQOGY5VE4zcnAvKzFlSGtseFY3b0NVcFkxOWdLTTlxUVVUaE96?=
 =?utf-8?B?cWluc0tOVElsck1LME8rblNBYUQ2Q1RyTnVKbHFWb2VYNmFvUGs4ZnJUWmpw?=
 =?utf-8?B?b1JQNklXOVorL0FuK0E0OXRFTEJ1cktuUmJVYTZia2V3T2U1bW92N215cU91?=
 =?utf-8?B?MWdHRmFubXNkazIzeUQyUmFUSDdpUVB2VlZ2dWtaUXE4eks0TnprNE04VHlq?=
 =?utf-8?B?Yy90MnlVaThFNkxnQUdLaTh2TE5TS1RSOFcyaWVaTjZXanZEL25QYXFTNG5N?=
 =?utf-8?B?NFk0eGNsdzVaZUlERkZkVkFyc1Mzek9vSHB4cFU4RDV3c28rN2lqeEVlMWNE?=
 =?utf-8?B?TFRhQXJBU2MrTkJOcmdoYlVTWmFHRDhCZjZhY2ZRMkVtSitpbmRpaWdRQ09D?=
 =?utf-8?B?MUNOR3NFOThiN1l1OWZvMkR4VkVYZGZKN09GVHcwUTlkNmdKOFkrK3lyS3hk?=
 =?utf-8?B?bGtQajFWbmFuSlhZT2JMSVdmeVZlUFdGdUEybWdnZi83UHRqL2xsazhkK0pK?=
 =?utf-8?B?eG9ZZ00rNFBDT3huejZUb3kreGJLVTRJOVhLN2VQV3dBTys2OXNURTFrY1Zx?=
 =?utf-8?B?S3plazBoaXYrY09JUE02MUtmT212dWcwaSttNlVqdEFtZGZHaU85UC9vV1ky?=
 =?utf-8?B?dWp4ZitMdHFHelNNR0ZVaVFIZzI3VmJ1MVZTUHJCb3FVSkxhQ1o0bGhZNWIx?=
 =?utf-8?B?OHhuWlZ6NG82cDROd2dOcWhVSVJjdzVscER4ejFEcmZGcndJOHZ6aWVLQ3U5?=
 =?utf-8?B?NTY1djVLRHJWUks1U1BnY1ZGaUQzaEp0SEo3NlVKZXY5aVU5d05EUGRDTThM?=
 =?utf-8?B?TGVVZG9CT1IyQzdTZlFVVTAxWkNNNTNBMHBwdEZsUHpLQnZkMVJqT0hSTE1D?=
 =?utf-8?B?OVNKeWpPVVc4VFVsQnk0WGRlSU1DSGRjaTVOeVBvd0c0eGxRbU9VOUZMR2pj?=
 =?utf-8?B?cklzWTdUVVM4V2hXYnhOa0hGYkxGekJDZDhLYXBLSTg2ZklVR3JoamlueFM2?=
 =?utf-8?B?aks5Yjd5V2R2Q3hrdU1ZM1AzUjVZV3k0c2Zud0x4OXE4M3VJWTdieGlwdnoy?=
 =?utf-8?B?QU5QT0F1Nkc1QnpGaEdVMVF1ZHIzVm9COXFsMEZtME5DL2wvckEvNThaRm1z?=
 =?utf-8?Q?qjhA9PUn9QMgsHMqUhPzYaq0a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ff9c26-c63d-4c12-3d86-08dc9208f926
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 15:44:01.9920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcKvRp55adW+AzFkMIAQpctHqJsAdD+aFDiut8AUfL6pmP60j0jeJkylPA34WdRLxbMTN7wMlsvrGa5PFftZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
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

On 6/21/2024 4:54 PM, Christian König wrote:
> Am 20.06.24 um 18:01 schrieb Nirmoy Das:
>> Currently ttm pool is not honoring TTM_TT_FLAG_ZERO_ALLOC flag and
>> clearing pages on free. It does help with allocation latency but 
>> clearing
>> happens even if drm driver doesn't passes the flag. If clear on free
>> is needed then a new flag can be added for that purpose.
>
> Mhm, thinking more about it that will most likely get push back from 
> others as well.


Agreed, it is diverting a lot from a known behavior.

>
> How about the attached patch? We just skip clearing pages when the 
> driver set the ZERO_ALLOC flag again before freeing them.
>
> Maybe rename the flag or add a new one for that, but in general that 
> looks like the option with the least impact.


I would prefer a few flag (TTM_TT_FLAG_CLEARED_ALLOC ?) which driver can 
set before freeing. I can resend the patch if you are

fine with it.


Regards,

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
>>   drivers/gpu/drm/ttm/ttm_pool.c | 31 +++++++++++++++++--------------
>>   1 file changed, 17 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 6e1fd6985ffc..cbbd722185ee 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -224,15 +224,6 @@ static void ttm_pool_unmap(struct ttm_pool 
>> *pool, dma_addr_t dma_addr,
>>   /* Give pages into a specific pool_type */
>>   static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>> page *p)
>>   {
>> -    unsigned int i, num_pages = 1 << pt->order;
>> -
>> -    for (i = 0; i < num_pages; ++i) {
>> -        if (PageHighMem(p))
>> -            clear_highpage(p + i);
>> -        else
>> -            clear_page(page_address(p + i));
>> -    }
>> -
>>       spin_lock(&pt->lock);
>>       list_add(&p->lru, &pt->pages);
>>       spin_unlock(&pt->lock);
>> @@ -240,15 +231,26 @@ static void ttm_pool_type_give(struct 
>> ttm_pool_type *pt, struct page *p)
>>   }
>>     /* Take pages from a specific pool_type, return NULL when nothing 
>> available */
>> -static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
>> +static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, 
>> bool clear)
>>   {
>>       struct page *p;
>>         spin_lock(&pt->lock);
>>       p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
>>       if (p) {
>> +        unsigned int i, num_pages = 1 << pt->order;
>> +
>>           atomic_long_sub(1 << pt->order, &allocated_pages);
>>           list_del(&p->lru);
>> +        if (clear) {
>> +            for (i = 0; i < num_pages; ++i) {
>> +                if (PageHighMem(p))
>> +                    clear_highpage(p + i);
>> +                else
>> +                    clear_page(page_address(p + i));
>> +            }
>> +        }
>> +
>>       }
>>       spin_unlock(&pt->lock);
>>   @@ -279,7 +281,7 @@ static void ttm_pool_type_fini(struct 
>> ttm_pool_type *pt)
>>       list_del(&pt->shrinker_list);
>>       spin_unlock(&shrinker_lock);
>>   -    while ((p = ttm_pool_type_take(pt)))
>> +    while ((p = ttm_pool_type_take(pt, false)))
>>           ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>>   }
>>   @@ -330,7 +332,7 @@ static unsigned int ttm_pool_shrink(void)
>>       list_move_tail(&pt->shrinker_list, &shrinker_list);
>>       spin_unlock(&shrinker_lock);
>>   -    p = ttm_pool_type_take(pt);
>> +    p = ttm_pool_type_take(pt, false);
>>       if (p) {
>>           ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>>           num_pages = 1 << pt->order;
>> @@ -457,10 +459,11 @@ int ttm_pool_alloc(struct ttm_pool *pool, 
>> struct ttm_tt *tt,
>>            num_pages;
>>            order = min_t(unsigned int, order, __fls(num_pages))) {
>>           struct ttm_pool_type *pt;
>> +        bool clear = tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC;
>>             page_caching = tt->caching;
>>           pt = ttm_pool_select_type(pool, tt->caching, order);
>> -        p = pt ? ttm_pool_type_take(pt) : NULL;
>> +        p = pt ? ttm_pool_type_take(pt, clear) : NULL;
>>           if (p) {
>>               r = ttm_pool_apply_caching(caching, pages,
>>                              tt->caching);
>> @@ -480,7 +483,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct 
>> ttm_tt *tt,
>>                   if (num_pages < (1 << order))
>>                       break;
>>   -                p = ttm_pool_type_take(pt);
>> +                p = ttm_pool_type_take(pt, clear);
>>               } while (p);
>>           }
