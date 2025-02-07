Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10220A2C19F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 12:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7AC10EAD8;
	Fri,  7 Feb 2025 11:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI/6kuGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAF310EAD7;
 Fri,  7 Feb 2025 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738928167; x=1770464167;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mg7iBmnTlvLbsccB9079bwyyaU0xXdK1mLkdFw/Z2fk=;
 b=EI/6kuGudEsLYUFD/aJCMrsRPIkLOJ18A5hLaJiZHJmHg2Jx4EWAAaKc
 OvrV3o7kne3LpuwzG3G/WEJIGRROzFVbcW8BFKAAhOwNttAyQsiX47uqM
 ia82y7iOKY3EQzpWpaJQm+Zr/valnNgslZXyTF9Qck2rsOUdbE5hcCvLw
 sThFXUh/goOBOtSKmceE2ZDZNifZ4EQgO0fQycD/FgPvwY3DazsqXJpee
 BeRMC0xGzmCbNsLFBRPdhaqEQlBGSfNHZVoemFQ9fevZthEiOuoYd18lp
 89X7CKRS3qaPS5Vtn/6girGGJmj6IDDmyfYAOnpjpYvnLJMjmABzVtZFY w==;
X-CSE-ConnectionGUID: FKH+Bme5SPKn5oBWK18vig==
X-CSE-MsgGUID: PT5a6YJKRLmMP0tNIn9Cgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39472529"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39472529"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:36:07 -0800
X-CSE-ConnectionGUID: htNZ6Z8QTFO55lD65M/1gA==
X-CSE-MsgGUID: D0yOZDvpQt+wiG8CN2S6gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142375959"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 03:36:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 03:36:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 03:36:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 03:36:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC3bJBbyDkUpIWzYZIrWbDE4K+RE/Qljf+866HxMnw3xhoMiU2YJLXrA47BBHWOiXmhPjuItoW79NuHOmcA6URnjiNekpJm0WLsdrNevpS4Pwvn3Ranx/88Sq4ZF08N7P1GE5Vu9rm+w7YdNRpkiXwIByk5JLkgbsfuvq9eXj0a1q7zY1VuZ7+AvgregAUauULVsahEroabewX7irbnhGXyP4ZCYmHQcNKZo9yRIIxhFxmIF9WHL9Ie1yB7JcxZjSBFqZbYYGaodiVIn/Er7h7SYft9phcNpeFl7AXT3BrV9pOYx9woyixrqTP9U/NbxvVEoTdzgjS8K3W2QMqwWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UyDeciyo1CbUbVX4F0hUoRnJgfQmp+FhKWH7VM/JOk=;
 b=oJ247HrnXEuoFd8Y6gSitJp3dGOVd8jN8Cd0WmTu9XSEVMksZGC4GSBS3fDtipuxlYHrNgK+RSYG9Xl3nAVp7Td6BEhTMD6f2wKnDSOt+7hrr/02MOA90DyjaP896NDRxSfCqK9wZhWKrXmsJKD3g0B9weDU/E8zrYH7BeYIZyzQHx7tY/BfOOvttuRqyubwn0MbS1Ck5CwBVuiBoPpxn+RTjUpPcSrfZOalK5lVSBj5jstN/yPf9QMCHoT6qiHwXgbXF3LOqIL9LEs0xgdue8XH+mpfuLybmauKjot0lFev2t1DI+bEo0z25/LWhlmg9Ag+bRw64fb+rPQqwjG74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 11:35:31 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 11:35:31 +0000
Message-ID: <abd2dd33-e61a-496f-9ea1-0332ff2ec409@intel.com>
Date: Fri, 7 Feb 2025 17:05:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/33] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-20-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=0
X-Identity-Key: id1
Fcc: imap://himal.prasad.ghimiray%40intel.com@outlook.office365.com/Sent Items
In-Reply-To: <20250129195212.745731-20-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 440ca3d9-33bb-4eaf-eb3a-08dd476b8759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTRMZUhRemo5bm5SekdyV2Q4dkpYUVpWUUVJZzFIRUJJdDhPVGxzS3ViMXVi?=
 =?utf-8?B?SG9xd2FmSDgwV3Y0ai9QTWhhNlRqRHFvNUtIVlpBZEF3U1N1RzJsTmlHZlgv?=
 =?utf-8?B?TVlnbGM2bkpuU1BkSnFKcyt5d3FWR0JrREdENzVMeEN2TXVERGhJNCtkMjh4?=
 =?utf-8?B?MnYwQXpSYzN4eEpjY3dQamVLdTZHUk9KSzdKRytXU1lDSU10d3VXMTg3ZFo1?=
 =?utf-8?B?RHlaemQvVFFxa01yQno1TmpDdzFsVGpoN1JxYmxNYXA3a05uaHBiSEdXbWl3?=
 =?utf-8?B?SFc0dVNQWWdzSVNOMjYxZGVKandDNXBTSHJQcVJrT25RQ2dUcnR6OWpxTnRE?=
 =?utf-8?B?ZkNMM1d4Z096Q00wT0dvTFZoYmlZQ3dPTlFLbWlYWXZ1clNJdGlNYXJWSHY0?=
 =?utf-8?B?NHNDT0pYdk1VUWtxcms2OS9HOVhEMjYyM01zVlk0QmF0TWdabXRwaGJyaWdP?=
 =?utf-8?B?bjN4S05GUlVyU2Rpa1BtcERyZUZIZjdXK1RSM1hMM3J2MjFRbWlJR3NVUGNi?=
 =?utf-8?B?YlprcjVOU1ZPYSs3elJwTkhsR3c4cTExRkpoNS8xYmJqR0QxL3ZHSUFwakpQ?=
 =?utf-8?B?b0thV04yTXhhSU1mRGRvSmc2WDZDRHd0UC9HaG1RRG5NbUpIRnhqeitQODZX?=
 =?utf-8?B?OUgrcit5UXY0WEt1N1FsVWZmSk9DeEdFVmdRWnFTdjJPU2Q5L3AxS0prUmlO?=
 =?utf-8?B?RlZRczlud3Q5U0E0QVY2d0Y1a0tMTUl2TW9XcUJiUW1KZnBMb1dwTFp3UXov?=
 =?utf-8?B?N0ZzSE14cUJIalg0MWwvdnk2b0dpeERTR2tYMzVQQ0FjSnhCaVlSUDByU0RO?=
 =?utf-8?B?aHVKQUxCMGRCNTZJbVh4T29jeEpYVHNGVDBNT281akZZZGlPNW9XRkdIU05P?=
 =?utf-8?B?dHpGa1M5SkxpZ2VobFU0MGx6bjdxUlZwMldycFZibUlHYWQ4Rk9YbTlUaEkw?=
 =?utf-8?B?S21oL29Ia0hHQlFPM25EOHQyZTFhTUtsNzVxc01NUmw4UHQ3a1d4Z3UvOXBH?=
 =?utf-8?B?SE5PMnhGNXAvM2lac3U2OXc5aTh4VHhMbDI5ZU1HKzBlWW1GN0hYa2xOaS9i?=
 =?utf-8?B?K0ZWaU5LVnZYT280RVJNSG9vekdQMkZFcHVWK291WkxJL0s0eE5SdGpMeks2?=
 =?utf-8?B?eng3MllkaG9NVEw1MVc4L000bkJIL2VnVTFVT1dvN2NTVTliNWNGa0lrWkt2?=
 =?utf-8?B?ZG0rSlpOMjdzN0ZJVVFac1dReDZGWDZVeGVSd2JIdVJsbjAwNlBtVXEyQTFO?=
 =?utf-8?B?MjRNVXVIUVE3WnZXdy93SmRZZldJbFgzWHJnVTJqYVJwTDJpbTFlb3J6Wmp1?=
 =?utf-8?B?WWlHR3dVRVFyWDFPUkVKN080cnkrNENWWW1GenREbFE2bTBOS3Nzc05IWFZM?=
 =?utf-8?B?Yy9YN2RvVlpnT3h4ekJvZWpnczg0VGFaZktGdk43TGJVRjcwbkZYRFQyait2?=
 =?utf-8?B?RkJwMmEzMURUNCtGWEVsVlE2MEc0a0dzazQ3a0xodm1RNnVxeHdvM0ExemNl?=
 =?utf-8?B?S0xBMWVWRmhBRE4vWjRYbTFWTFE0bkVYalJreDlka1BmbW40bUtad2VlcW85?=
 =?utf-8?B?cktBSkltbHZUN3lCUTRCbGlkQ1R5NDRWYmtiNG5XOVZDbEtpS2NzSHhKclpt?=
 =?utf-8?B?R1dXY0RlaThRNmR5T0Mxb1cxWmhkcFVycGZGL0NobW1ENWV3S2UxVGJLc1dw?=
 =?utf-8?B?M3B4K21uKy9ySGl1MFhRcjVLdGpCVk1mdVBVeUl5ZTcyeDJudTcrL0ZrU0FN?=
 =?utf-8?B?eW4zbmk2eUJmTE1FTTdDZW8rUkRUQXErS2ZlMUFuTGU4V2FvMjZueXdabWow?=
 =?utf-8?B?Zk5ONWJBdzB0RnRWYmpWdXRzWkJHUUo5QUdIMW1tS2dmaVo0N3dvcXphYktj?=
 =?utf-8?Q?9BzMcYu28o0aZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXlhaStvZnQydUR0UkI3S3Brek9NR0tuNUFHRGs4SVlCK1czZ0hzekNPNnJD?=
 =?utf-8?B?UG9LKzVoK0RRUGZXS3V2cU1yNldWSmVIV2JzNHR0RWc0ZkhLRFFhdGV0b0dT?=
 =?utf-8?B?RVdPNC83cnlSZ2Z5THExeW5pMlJ5cVp4QWl2Z3JGbndGWGh4TlRTeW9ZTys0?=
 =?utf-8?B?V3VCN1MrNENXMXFZWFRPMU9Rd3VRUFlESUk0NkNFcndibE83NC82RGdYYkJY?=
 =?utf-8?B?ZWxHaTdXSXR5MnJIUFFSM3ZOVUs2NERDT25HS3VVZmZRMTY0NzE5N1dhWmM1?=
 =?utf-8?B?dmYyZmc5WmJzNGJiWEw2Ykl2QzZHSGxXVDg0MW5sUEpZR0lCcGx5UlZEeVpR?=
 =?utf-8?B?eGxXQ0NjeU1wNGhxakFpTEp0N3VkZ0lHU2JqOEZEdjV4czY4UDlVQm91V0NG?=
 =?utf-8?B?eXRENWVaZGRENEFKSzEwR0R4eEJCVFJrZVh5cjEybFltS3dKOU5lWXBnMXZm?=
 =?utf-8?B?MVN1YlhZR1RPSzB4ZkNidDh2MldyS0tMR1FRY1Z2WEtFYzAxcE9DZ1lCd0Z2?=
 =?utf-8?B?QXVUandFaFpORGFTeFdVWHBpQmJDNGVrcGxBVUZWY3doeFFJcklqSjVqUGZ3?=
 =?utf-8?B?SDM3Z2VIdThRZVpzYTV2ZE9ySnIvVFNrTUpDOXNrTHVoUTl4Zml1Q3NDa2lE?=
 =?utf-8?B?ei9MNnNzQTZJOTNCNUw2UG1Uejk4dXZlTDR1ay9WU1d3dFpiTzhrdVBDc2ZN?=
 =?utf-8?B?RGpmY0ZodXBjc0VuOU51SDQ2WTZSU1A4czE0MkEvMGVEZ203aXUwdTZIK3dx?=
 =?utf-8?B?dXNtV3BMYmJrd3NXSzNMMWc2cWsvQUx1NVhKWEhwTDY1b2tzYzdJWUVUa3lD?=
 =?utf-8?B?TXMycUJXZ2I1bDY0Q21MUmVTd2ZQY1ZLY05RWDIwaSsrb2JvU1VkZUpRWWti?=
 =?utf-8?B?TkpzTjR6TFBjNWplQUFIVTJjdGRVL3FSUjcvdzVydXBrQ1V2NS9sV0NzZGt3?=
 =?utf-8?B?c2ErVWFiSFBrdEVQRVc3andtVkdQdjJFT1g2TE82WkpDWHVCSlVjTmhuckZC?=
 =?utf-8?B?WVZRMURSUlc0VFRYankveEtocXM3d1B6NmhYNmtTcFNUS3dIUW5hWjVoNW02?=
 =?utf-8?B?MWM4NjVtOXIwNlZTVXhXV050S25MWnFKNHd6cEVvVTBLOW1mRkRpamJHa1NV?=
 =?utf-8?B?NG16SlR6YUJpWUJSM0pQSndVMnI0UWZROTRHSzFISWkvTWFDVVR1WkJrNG5O?=
 =?utf-8?B?Umh4cGhYK2doVDJEYzk3ZVdad1E4TzdONHNWOWpseVNYZWpidkkwUU5oUGlT?=
 =?utf-8?B?YU1zcVlBVHdFSkYyZ0NhMk43bnRyNksyT3NoOGtlUFNGZVdIRDlxOWI0RFhj?=
 =?utf-8?B?aUNvSGVJdjdFTFM4ZXRtZVVuTnNISGgrTnFrZ2s5cXAxQk8wSi9ZMnJaVVN1?=
 =?utf-8?B?a3N1VkpSVE1CZWZ3UnNuWExoc1p6dDJhUFJkSzZjdlRoUXNhSUlMejd5VUxk?=
 =?utf-8?B?ZklpU0c2S2VGSnMzQWtDd0tNRlVFcDVUUDJSM05lZDhKeHFBWDZ2bnNSbEQ4?=
 =?utf-8?B?QzNVL1h2VmNIcU1NMERTZ2RoN2kwUVVNTE80MXB0aE02MEdzYVc1SzNkckFR?=
 =?utf-8?B?WlB3ZFZKWHNCTXRid0hHNUp1d0w0QzJQTks1U3VLT3hPaENGV1FVd01iMTR3?=
 =?utf-8?B?aFlJeHoreDF6M21jRms1RjE1WlVIakpxazhYYUg5SGptNGZaU29lVFFwd0du?=
 =?utf-8?B?eWpWYXdFaldnVU8rc1FHM0IyR0J1Z0pzRmtGeEdPcFp3WXA3b0k3RFVNR0RT?=
 =?utf-8?B?MmJJMkZEbE91aW04R1RlM2Vmcis0cHowVUVCY2sraG04QnRMejRidUs2dkNT?=
 =?utf-8?B?d0V2V3B5QW55WnBTcTRVRFNJcmkyZXR1MktxWG43U050ODd3MVJ2eDh6aFBi?=
 =?utf-8?B?bnA0cW5Cd3MxUGcwU1BTdVVud1lNOTZ1ZTJmWVZQVHlyYk5jWVZmWGtHQmF6?=
 =?utf-8?B?ZHk5c1prQ3F5WHdUazdQU0t3ME5pa3NTZ0Y3RU1jaVZNbEZtRzlLYi9LTjc1?=
 =?utf-8?B?R0VYenhkYlczKzg4dDhWRUsrclV0ZmZTWTFmVS9uVVNlYlgzQzdwUGZjRXpK?=
 =?utf-8?B?eko4OHk3N3RwbWxWYS9GSU5XN0ZGSzNOa2NucnN6dS9GMTE1WGlTQzhtTUtZ?=
 =?utf-8?B?ZzFJMVdkQThwbEMrMEIzdE1XUUNVbWxrYU1SdXVyMjFoR2J0WFpMSjNuWStS?=
 =?utf-8?Q?/bR7dewyxapz3XO/lMKT/bU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 440ca3d9-33bb-4eaf-eb3a-08dd476b8759
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:35:31.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d87ln7+pcT3N9fkZR4ir+OEZHQnZiLsNdbyTTgmuY5XTKV1J+S5T/I040MDb1HSPbWc1QEFP3sFDmhauzvjlidj3SQag0ydvZlw9wCeEnyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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



On 30-01-2025 01:21, Matthew Brost wrote:
> Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR device query flag,
> which indicates whether the device supports CPU address mirroring. The
> intent is for UMDs to use this query to determine if a VM can be set up
> with CPU address mirroring. This flag is implemented by checking if the
> device supports GPU faults.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 5 ++++-
>   include/uapi/drm/xe_drm.h     | 3 +++
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index c059639613f7..40f56eaf98fa 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -333,8 +333,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>   		xe->info.devid | (xe->info.revid << 16);
>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> -		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +	if (xe->info.has_usm)
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b86dc1b4c2fe..37e54ca6ffe9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>    *
>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>    *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
> + *      device has CPU address mirroring support
>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>    *    required by this device, typically SZ_4K or SZ_64K
>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 1)

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4

