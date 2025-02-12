Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D5A32D3B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 18:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6B310E92D;
	Wed, 12 Feb 2025 17:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WD8n6zqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB61410E090;
 Wed, 12 Feb 2025 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739380759; x=1770916759;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pg3eZ2zU6RD12V0voezXMLgUGXlR5EGFDXtnB0PF76U=;
 b=WD8n6zqY0e5OE9N57dfl/UpIWMGwPZzbb5RY89nl5ulJgS39mftAMs34
 pE4HrN+XQOhuiS+zSAISFqNBe5FiVEKWrNX5a3f9MaFuopWWKX2pSCsSP
 zgVXmrwxtMN92ZvInl08CqNGHHn7ewMy9AoBD0iX0TglU+Tua7VWGXOJC
 VJOpEAgbducwUReqpPgqMAUDXC0XMB3pXbWArFc6bj6RoNjZ+xUe8wx/t
 LpTU/f9417BfOXXhDvrgYDejGpQjPuAHddBg8u6j2h61ue4P9MfIhtfWZ
 kheQp9lj3ss0D5hSsbRVyEEsDqmVyvo7H59OZMoaujQ72HNFXeDXTlgXO g==;
X-CSE-ConnectionGUID: t9YkiNZHQ8G8bUM1jkvyVw==
X-CSE-MsgGUID: 7u2T+A+ETS+QFeCvfdA6xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39935636"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39935636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 09:19:19 -0800
X-CSE-ConnectionGUID: fq3fKEmWSByIr7kY2SUF4Q==
X-CSE-MsgGUID: o1pUl+2TTfeDoAfF4C+vwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117512279"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 09:19:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 09:19:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 09:19:17 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 09:19:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZ3Y34+/BhK6kD6KTuZWvf7/jOoU9hooPtYiW4CzFbrEAezWj9nS8iDz2VG0oiTuRDRRJCWQj0lR6gKsdPJc7weS1Arl3NQQ5+kcWVYcKSHDqsMs1o+r4jX6rPOFrb3YOjZ9a46ajkn8LLGx6V57RZS3Avab6BUotZXt89IuIqXQGTRVcGpdfnDu8fFOZNLLfrnz93qM3r0x7t02r4x9998m3QdOQCpNOR/JqP/3HDcVI5aoDRvnE6XfqI/9o3gB6SPsTe93k046p63C4FOq0DtMLuLGrayOFFgtQM7xuFqSeVRzjdCBfcTqUPd1usp2VXl+qzUmPcbnOjAmMpyqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTqgWdEzB7riYNSw3z96kosT/5yTlRFlKw531pSgK4s=;
 b=Fd2vQy00N4H1+YeOQ5+1nOMOe9ttyDrBXz3KFgftFfvlnzQ4rdLgRcYYdRhFGKZlJNW1UKZEKhT4GMKMI3UJr/g98/uOd6kHwUwLXmbtk9gaZiWMk6vnvhQYnEglDY5lEvMre/w20khWrLs9r7vLmW9sMWS9X8wJvlyJG4h+8/L2n5SFoYRX+iMCU9Ep+tw0EwV61eWmRsuPIaEc6eJmVC+cl929X2xpq0s/b/YsNhLtUvR8fxZIohgi4hirV9ggqI3RVsTXe74uPimt1oSkmVA8xVyBDHYchAE6Y9qI2DRTGO7FDJAdprJlCbakXZUgPu+W9evnrSXTzrbVC7WX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CO1PR11MB4946.namprd11.prod.outlook.com (2603:10b6:303:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 17:19:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 17:19:14 +0000
Message-ID: <48036d4f-47c4-4949-b837-b92c28893b32@intel.com>
Date: Wed, 12 Feb 2025 12:19:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] drm/xe/guc: Move xe_hw_engine_snapshot creation
 back to xe_hw_engine.c
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
 <20250210233254.419587-5-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250210233254.419587-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:303:8d::8) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CO1PR11MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3e2a6c-0506-4213-83ad-08dd4b895fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm53cHllYjdzOTYxK2FNWjFud1lKZU9Dd3U1eStKQ3pXdTF2TEtpTmIya0lF?=
 =?utf-8?B?L0xvazRLTlFnc3lrUjkyUmNEYUJMNTIxWjQvS3JiWkpORXBaeWdGbDNCa3p6?=
 =?utf-8?B?dnR2T0EvNEtPZzcrMWdnNXlIYjVOSjgwVi83T3hFS1pON3ZZRXVER3gyTVAx?=
 =?utf-8?B?aE9QcDhEdFZORXFjaDJ1aGVQenNFMVdkenJtZkphQTVhMit1WFhTNW5BRDhC?=
 =?utf-8?B?VGdNWHdDNVZqWXpnVWU2Tm03eTV1SWs4eDh3SVdRNnJIeGdQb2JqMks0bTBW?=
 =?utf-8?B?ZjZHbWNRTjZGWm5QUFRmS21xaGs3eTVEZ1dCcllDSUtHTDNHanF0SXdtck43?=
 =?utf-8?B?dTZlVDBoMEp0L04rMC9LcmVsY3NGbEt5UUI4NXV6cHo3ZVJvV25CTDdIWVo3?=
 =?utf-8?B?dGZDbU5oMUhCdDBKMUQ2SndHMjBPVVJsTVR3djVEVlh6UnhmbjBHTnNRdFhq?=
 =?utf-8?B?QXVESGYwMndRay8xUkhKL29rM0FKUGMrZlpva3ZuRVBjVnlxbzJBT0k2cXF0?=
 =?utf-8?B?VWQwZzduUnc2QjlPZkhIWHVkMW45c2lETTM3cXJZUHI2YTJlUCtSaVFhRndJ?=
 =?utf-8?B?OE5IdmdHL1dTRUlGK3dnWmpib3JBbDhMSHAzTVIxTEYrT1k1K0VseVpoSDJv?=
 =?utf-8?B?clNReXNac1A5SDRXdW1ackVRTWo5YWJIbGdZKzRWVWZHUWZPNVliL0xtNnZY?=
 =?utf-8?B?dUZDMHBDamdqblpXSS9FQmVaWnZRUDZDMm5lNlUvWVpoSWVUVkxjRTZpelRL?=
 =?utf-8?B?WXFwd1Z5Q2QzaTc2akMyWUhFcmlxV0lvbTlla05sVWMzTG9ycVR0TkFZZ2lx?=
 =?utf-8?B?N2crMFo3UkdyTExnRGpIaG0xcVlNT1dXQjBtNnVsZXhzSjcrUzdpckNmR2gz?=
 =?utf-8?B?aWZiTEYyV2VEZmY0MC9lMitwTW51OWZNSXhpTmJkVWt1NSttN0hQekV0WU5Q?=
 =?utf-8?B?WXhZcHRHbGFvRkN1WTY4WnJ3SXV5VVQ4bmZEQkRneHowQWlWYWZlZkdSOUZK?=
 =?utf-8?B?U1N6dUlnc05OTms2c1BVZGRLcStPbDRkTG5hSm55NWcyL3NPbmpoU2xqZk1t?=
 =?utf-8?B?WVNPNXFPUlliT2djN3EwUm5JM3cwZjg2TVJkNmtzMVkvTTd2TVhlVzhOKzBB?=
 =?utf-8?B?blNFUEErUzkyZHpNTmVLRU1MYVptS0wwb1dZb1lJMnJwb2NaQmN5eWpBWWtN?=
 =?utf-8?B?cGNHN3RYZzlEUGRMTTgvWHJqeWNEcnBJZGpDTG9Xem9pbElRWFRkZmRJUHR4?=
 =?utf-8?B?VUh1bndZbmhTbjdiR3RRUDc4Um4xNllsblhCUnNMK2tzUE9pZEZqVTdWVVhx?=
 =?utf-8?B?aUQrSS9Wc3BGaEpDazFkRVFUOGg3K1QxZ01sdDhkdlZSa2F4aWhoYXIvbCtr?=
 =?utf-8?B?Z205cEQyN05Ob2QvZGdCS1RqVTYrQkdBeHErWW5HT29xSm5ZYjNuZHNLTWhJ?=
 =?utf-8?B?dlZJSk1mOWJYVk53OE8rTnV5ZkFpc0l1dGw1RXB1cnFmYU5ZaWF1NlJmZ0k5?=
 =?utf-8?B?cHFDMmFSRjFpbFRTV0FGcmZNeGNpVFd3WEVBSlZiZGNFVm13bk1QTUxMQWdt?=
 =?utf-8?B?SkxvMEJxTTNIT3l0cnZ6d2IyRUV1ZTNqb0NxdnFNbTRWYVIrdHN6cTA1OTY5?=
 =?utf-8?B?bGhLVWsrSGtSekZ0NFgrZS9MdTVMODB4TXI3dlQxRloyV0ttbEsrQmNCUU5V?=
 =?utf-8?B?YlhVdk16TFdPN2diU2VZK3lzaEJoTThtcWl1WWFucTgyc1ZIQklMY0I1bXYx?=
 =?utf-8?B?azVnK0xMRlpNRTB1UEZsb2ZQUW5sUjREZldBWHBsZzJrRVJ4c2Q5c3ZVdHNj?=
 =?utf-8?B?N3BBbnJrNklTSVVaaFBCTU9VUUNZVFZBYmNFMDRSSkI2aUs2Rmw0V0JxbEtF?=
 =?utf-8?Q?d5cORRDuNF2ur?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGlWZDJFai9BOGpjajBtcnBQODIvazdmTFZEdytOSVIrUmNGb2JqUWtTYkIz?=
 =?utf-8?B?Mlk2TjZaVVBSUDFUZEljNlMyWVIxcThkS3lSdUJINkpjU1ZuM2xteEs5cEZk?=
 =?utf-8?B?UlRaRDB0dW84WnQxUHJaejE5bGtGbTlzdE40cENVc2xCN0p1L1hIbnNLRGs1?=
 =?utf-8?B?czB5NG5IVDA5Nm1sYlhPZkNNT0VYbW95OUJMMER0TUdXWXQ3amlndG9JVFJM?=
 =?utf-8?B?NlcrSUU0clhqc2NUQ2ZLWExEUmJLY0tFenRPU2RqOWRCNnF1MkpJdTl6cktl?=
 =?utf-8?B?K2F3NHYrTkovemtVMmEvMUkrc0tZMWRtQ1lkY0ZFY0x5bnBzSm1iVk9LVUMz?=
 =?utf-8?B?dTlwYVZoc1V4L0ovcHpyOGgwRnBqRFg3cjhYcWZ0eUVlZzl3VENUUXk3Y1U1?=
 =?utf-8?B?dUtXNWtBV3prTkJRaUpLdWZaVTZhREhvM0lEM3lLMXlwNHJFU1B1WWVaRXRJ?=
 =?utf-8?B?ODZoamVOaDM1aXA2ZGNOVTJnc1hZbjc3S3V6Z0VybXA0c1lub0pYa1Ywa1RN?=
 =?utf-8?B?THZ5aENVQzB2N0UzbEQ3akZnNlFOU3hTbHprbEl6dng4UklGMVJhU1h5MGkx?=
 =?utf-8?B?SHZzbDBYRERQK2R3bllyQThaOThrSUtxUWwydm8rR21mYVJKcEpaYmtaaWh0?=
 =?utf-8?B?VlZxdHhrS1JSRmJmaHlJc1ZiaUQyYzIwbUpTMmFoUEx4dzhEd3RUWGlPTVph?=
 =?utf-8?B?NXg3dk1wZDhranZtTStqU0E5QnJ6Nlc3a3ppS2lKdmRoTlFmREdvRDhXa2h3?=
 =?utf-8?B?eTJaUHlYbjVDaUVjNm9vM0VTcXBoeit5UytpWEZtYXFMd0lwSERxT1N2YkRw?=
 =?utf-8?B?Mlc5Y1owL1B6QVJVeHhCWUFrZklWQU8zMmtjemFrUTdlckNQRjVnY04va1g5?=
 =?utf-8?B?b2l5VXpOb3RGYUFHRndzTFBUR2c4L1RhR1ZrK28yejhnU2tQRFBXRDN1SDdV?=
 =?utf-8?B?bWdFazVKQjJzeEQ5UzBvVm0wOGhPMFdRODlBODFNMHZFeFQwWkxkZ1pwWnhp?=
 =?utf-8?B?Um5MaHp5Vm0xSmZLNm9sbDF4aDYvMG00RkNIZm96RFlmeWFkMmxFR3cyWUU2?=
 =?utf-8?B?eldpZmJPTzEwVFJJQmFBVEtpOGxTaWtSdFU2dHQzd3FaRU1yRFkrR05GbWJ3?=
 =?utf-8?B?SWMzVHpYd2QzYlp4aExPa0RzQXJZUU9OM2Q5UnNXV0ZPWkFLNU9qWWxTWHFq?=
 =?utf-8?B?RzV3MFBBeWtiQ0VOSHBpQlNSbWpLeXJ0eWoyeEJMSTJudTM3d2F0OHhISG8r?=
 =?utf-8?B?TmJuTEtOKy8vM3pwRUdWcEJGdWF0ZU56ZTYwSWlwZDlmeXNDQlV0Nk1LQ0pV?=
 =?utf-8?B?MXRaTlBiUkI3MFpmK25iYi9namphQ2VIRVQ3aWpjZzVJMDRyajBtd3Z2RVpm?=
 =?utf-8?B?MHVjeXB4OEw2Z2UrQzF1ZndUUThHU2hUbGVER3FrNUhEdTFOMnV5TEE5aGow?=
 =?utf-8?B?YzdpVU1hMlNvNVpaRFBwZllNcm5IYUpqWEdrNWZEajZVV1JwVlpNQzFTblVZ?=
 =?utf-8?B?THRZajlWU3c0VlN6VjR6aHVscEZaTk9oOGRRTmVQOUgvaHU4dWxtd2xvTWJl?=
 =?utf-8?B?aTRiZ0gyNE1CY3RQSitIMjAwQzJYbmkra3J4TTBQeWFtWngva0hzTGUvMUt0?=
 =?utf-8?B?VGJnSEMzRDRuOVF2OW10Nklkc3hLMW5Xc2d1MFdvVUNKN2dZa2xzNFBRS1J4?=
 =?utf-8?B?blNPL252dEZKZDUydFNma0hTV0FtMWJtRXpVK1Zxd3ozNUVncGEvdWJoMUlj?=
 =?utf-8?B?MEpVK3JVZzJIYysxNTJxK2xkNmlqZEx4clQ1RFVmYmNRRkE3dENtTER2S09Y?=
 =?utf-8?B?VU1NNUlJS25ndE0wanFFMktURThuMmJCV0NUVGcrb3dJSUpUOHk2eW5jWjRx?=
 =?utf-8?B?NkY0S05CUUtXdWgwRUZIV28wRUNPWjZ1SmxOL3hGTTBHRzFZZnRFRGhsQWxW?=
 =?utf-8?B?aUxyTTZlTDlQL2xia3ZoTFVnNEhBaVd3VXJpU1NaRVQzQTgxWWRaYTVPT0s1?=
 =?utf-8?B?dERJM21UU1NWUVN3NHZhTWZuc25JT3pFbGxlY0U3ZUxNN24wUml2Qmpsa2dO?=
 =?utf-8?B?N1lwRjYzbU1sMm5zeFozcEw5Z2NnaVAzZjZZQk4vdzZRR05TUjM4Z1F6czky?=
 =?utf-8?B?a2RtNUw2ZzNkU1lCdDdmT3JyREpJZnRkbkw1djlEdTFObjJmRkNNKzhFbnJr?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3e2a6c-0506-4213-83ad-08dd4b895fa5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 17:19:14.6159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rub5yggvUIXPmiuRwUTqU6raU2ITglm0Qz9cK4BRoJVOUNsn+OqLRVSkkM4NvMFAJbJnqqVFSxBB9Vh7lXR3lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
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

LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

On 2025-02-10 6:32 p.m., Alan Previn wrote:
> xe_devcoredump calls xe_engine_snapshot_capture_for_queue() to allocate
> and populate the xe_hw_engine_snapshot structure. Move that function
> back into xe_hw_engine.c since it doesn't make sense for
> GuC-Err-Capture to allocate a structure it doesn't own.
> 
>     v7: Rename function to respect "xe_hw_engine" namespace (Rodrigo)
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
>   drivers/gpu/drm/xe/xe_guc_capture.c | 30 -----------------------
>   drivers/gpu/drm/xe/xe_guc_capture.h |  1 -
>   drivers/gpu/drm/xe/xe_hw_engine.c   | 38 ++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_hw_engine.h   |  3 +--
>   5 files changed, 36 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 7a4610d2ea4f..6cbb4fce8ef2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -311,7 +311,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   		ss->job = xe_sched_job_snapshot_capture(job);
>   	ss->vm = xe_vm_snapshot_capture(q->vm);
>   
> -	xe_engine_snapshot_capture_for_queue(q);
> +	xe_hw_engine_snapshot_capture_for_queue(q);
>   
>   	queue_work(system_unbound_wq, &ss->work);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 76c20ff97864..ff16bed86b77 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1867,36 +1867,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
>   	return NULL;
>   }
>   
> -/**
> - * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> - * @q: The exec queue object
> - *
> - * Take snapshot of associated HW Engine
> - *
> - * Returns: None.
> - */
> -void
> -xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
> -{
> -	struct xe_device *xe = gt_to_xe(q->gt);
> -	struct xe_devcoredump *coredump = &xe->devcoredump;
> -	struct xe_hw_engine *hwe;
> -	enum xe_hw_engine_id id;
> -	u32 adj_logical_mask = q->logical_mask;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
> -	for_each_hw_engine(hwe, q->gt, id) {
> -		if (hwe->class != q->hwe->class ||
> -		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> -			coredump->snapshot.hwe[id] = NULL;
> -			continue;
> -		}
> -		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, q);
> -	}
> -}
> -
>   /*
>    * xe_guc_capture_put_matched_nodes - Cleanup matched nodes
>    * @guc: The GuC object
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index e67589ab4342..77ee35a3f205 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -56,7 +56,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
>   void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
>   void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
>   				   struct drm_printer *p);
> -void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_guc_capture_steered_list_init(struct xe_guc *guc);
>   void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
>   int xe_guc_capture_init(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c980a5c84a8b..fef01d2086a8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -830,7 +830,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>   }
>   
>   /**
> - * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> + * hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>    * @hwe: Xe HW Engine.
>    * @q: The exec queue object.
>    *
> @@ -840,8 +840,8 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>    * Returns: a Xe HW Engine snapshot object that must be freed by the
>    * caller, using `xe_hw_engine_snapshot_free`.
>    */
> -struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
> +static struct xe_hw_engine_snapshot *
> +hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
>   	struct xe_guc_capture_snapshot *node;
> @@ -887,6 +887,36 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   	return snapshot;
>   }
>   
> +/**
> + * xe_hw_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> + * @q: The exec queue object
> + *
> + * Take snapshot of associated HW Engine
> + *
> + * Returns: None.
> + */
> +void
> +xe_hw_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
> +{
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	u32 adj_logical_mask = q->logical_mask;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	for_each_hw_engine(hwe, q->gt, id) {
> +		if (hwe->class != q->hwe->class ||
> +		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> +			coredump->snapshot.hwe[id] = NULL;
> +			continue;
> +		}
> +		coredump->snapshot.hwe[id] = hw_engine_snapshot_capture(hwe, q);
> +	}
> +}
> +
>   /**
>    * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
>    * @snapshot: Xe HW Engine snapshot object.
> @@ -945,7 +975,7 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
>   
> -	snapshot = xe_hw_engine_snapshot_capture(hwe, NULL);
> +	snapshot = hw_engine_snapshot_capture(hwe, NULL);
>   	xe_hw_engine_snapshot_print(snapshot, p);
>   	xe_hw_engine_snapshot_free(snapshot);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 069b32aa7423..74f6ea0c8d3e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -55,8 +55,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>   void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>   u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>   				enum xe_engine_class engine_class);
> -struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
> +void xe_hw_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
>   void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>   void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);

