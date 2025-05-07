Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43C1AAEEC6
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 00:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D259A10E22E;
	Wed,  7 May 2025 22:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZieDkaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751F710E202;
 Wed,  7 May 2025 22:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746657760; x=1778193760;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XmghFlPzDF/jsC2Yjm8uaMi6Wq4TKnh0qNxHUBB6Z0c=;
 b=LZieDkaEfctkLsFlcRk2vB09hzy/u4NXDlC+K9Kr6xH922D8M6++Nk3d
 CRxJTDJ9M0g78HUzuuVAG7vJ9oeGJvivI8Bpxx3JYYYThkqceHbYlI0SK
 nQ/HN4EnhZ79ER+re+sA0HcpeKAZARJm337ToA5txXfkq+3xfPIs5i9xr
 CJeFszOwA48pZrP8u9fi3qlzzmsynHytbxIT9F72SNkHkdP+T/l7E7eMi
 wLPZsRcr5I39jjPP/rNxxMmiP1HH3vvgaxRerAZN6nqDrlvg1c9AQKc3d
 tMqQYRbiXl4mDwUw7rlXAWZa1gGiAaeRs/ynZLuf4WO7ZdsRDVOcX8SVk w==;
X-CSE-ConnectionGUID: APkgEW3YSpq8CcdGnmFbjQ==
X-CSE-MsgGUID: pNJ/htYMRCKg3HQjRaK9cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48497699"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48497699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 15:42:39 -0700
X-CSE-ConnectionGUID: O4Zz1ZNKTEeVZHFrY5HJeQ==
X-CSE-MsgGUID: d8tFQy7/T7upKLn/3VMxVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="137028246"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 15:42:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 15:42:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 15:42:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 15:42:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i56G3o2iRgID/TbZUFhC87MF/btmeBtMq0Kda96vr0Ye9sFZrsGe5j7ZMkBzCg1YBCrLOneu0PNOJrlkbiHmrCLeEP/GW5xVBAAgpWLNUarGREpdC3go0Q8N04QNeJrk4zOQAoEIc5TI8mEkhrkJ4xHgerBj1dI4qzNP/ZdAGONBCvGiE8xqbzXTs1F56dGN6OhqOP0omi10WwSzNu4k8Sot3GX6XgOG1fegUazgf32sP2151pAbxIe8AdZV9CTlb1Z/cfubyMlxK6ojCIQb84mVewfpQXJqXe5u+TtazMW/4dQ/HZ9ct4qoV43o3+OG6SmxoGsUx50OQYnsY5kQPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpRjW+viLI2umFN0IET9eSV3LbuvzsYUp61zEJYlNsQ=;
 b=cZ29qY8unEGcZgi+40FU3b5JYR5Vx5SBcyBxhqoVcIE/tHwwKt3X63GPg78HTemqYI/Yi0y25EmDMIDNwgMy7vkp76S/Wxe5Vjl/JuvLOfkhbuZOqgwmO2S9a/PzVj73RT+lTyLQuX9eBxmiq4TMObkFCw5X0/FzCeUXM2sdLE/x2Kvkw8+OSVBGov6yfUqpS6CcgbK3G/xRkTgYPjAIJxslAVY5SLai9cj1G8SIQe45kJ133CsTwSdvFB8aZokUkNmVBAZ9rMgJC2cnvllfrMtZ9goIvt9jd2i52NHjB36G4l8cmDFkV5ZJ9H866esHGRm/EZmq8m1zZiQ+hKiHxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM3PPFE8B1F622C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 22:42:22 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 22:42:21 +0000
Message-ID: <f9c351fc-da71-4583-9487-3678e354569d@intel.com>
Date: Wed, 7 May 2025 15:42:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/9] mei: late_bind: add late binding component driver
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-3-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250429160956.1014376-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM3PPFE8B1F622C:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bbfc2c-01b0-430f-4b3c-08dd8db86e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmxNc0taUEhqdWVjdUdWWWFWNmkzbDVJVllJd2ZIdWY5VVprL0VRNjFMb3FZ?=
 =?utf-8?B?UEJjRTBDTFg0UDV3RFFTUGpRcENiLzIxaUY0Y240bE5HUWE1NTlLME1LT3VL?=
 =?utf-8?B?ejErV3dLbER0UUp5Wm9HUmdXQUZYb3NTd0NqRFQ3QXQwc3JJdXU1OVI5ZUFK?=
 =?utf-8?B?RGgzTjNWbjVRSWgreHdrM2VmRUNLMUREVFkyNjVwYzlRSXVORStjK1ZjZUNs?=
 =?utf-8?B?bFg5UFRKbEUzZzBDN01NbThkTmh4YjQrMk5qeXZwUmM4SGpCdWh3UTN3WVFp?=
 =?utf-8?B?RGpSUno5UlJPVXRFMHc1VG4vQ0ZuVzdpVjhKRm5TelF6Zk8xb1BLeVE3OW5N?=
 =?utf-8?B?L0c0VTh0LzdydWk3Vm9MOHYrdjY5b3Z1VFpYcWh1RlFFc2lON2h4S3dSK2J5?=
 =?utf-8?B?S0IyNmloa3FHa3JBVTFqMlZyQXU3ZjA5OERMZ2pFWjNmekw1elBsbDQxVzVh?=
 =?utf-8?B?bUF6TGFickxqbXVMc2lDQXNrNkJkRytPR2tGdW5hS1YreEdrRWp2SkNoWGU5?=
 =?utf-8?B?ZnJuRzdCbmJLdHgvRUlFa016MTNhdThyLy80ZHpuM0YrVjRiZmJjNDh6ZXRZ?=
 =?utf-8?B?U0RnWTdoUzdMYkw3Nk55T3ZGbnlLQ3k2RGRPZGpqaGhXcU9EUE5XSlltdGZl?=
 =?utf-8?B?L0g5Vmx6anVtMFN2ZFJaYTR4c0Q5T2hEb2F5MmU4eUFMOWRVb1hPYlRrOSsx?=
 =?utf-8?B?c1htNkxSb3A3M1pjbnp0SHZ0OEVHdFVkbDNPYjBDNXQ3d3NWNEV5N3AyYTgz?=
 =?utf-8?B?TEhocUZyKzlOaldrUHhNeW5PZENLbnYvZVAwVStVV2VwQmUzWkZ0OVpwdlpY?=
 =?utf-8?B?NzNpNm9sYjFoZ2tVSmp1VDZESlMzMVNPVzZ5Y3Y4TGt0Y28vOEthd05kR0ps?=
 =?utf-8?B?QzBZMWRxLzc3MkhXaFdhbWViWk1tVUJXMi9CWE9yaTRTQkNsUms1Z0xtZTNw?=
 =?utf-8?B?cjhBcHNjQmIvTklta3JENHFSSHlpL2E5anlFM3h6OTNzUXFZcm1CWDhHMjBS?=
 =?utf-8?B?MUd4SUN6Slpib2NaamwxbWFDWm5FOW5keE01c2hpT3o2cmlTWFAwekEzT0NZ?=
 =?utf-8?B?aVRIZ1NFWGlhSlNIVVNEa1NUbWEyZHg0Ym9uNm9URGdIbXdUZW4rS1RWOGFR?=
 =?utf-8?B?WW1XQUlmWG9TRktHZWlSdExMcFQwcnJ4UVlLeGg2eWt5YjIrVGh1YittTjFs?=
 =?utf-8?B?bjdKcUIrMm5xVkQwQ0paeXkwU0F1MGFBV2lnUUNQQy9KQkd3bHpHZjVhcnNu?=
 =?utf-8?B?aWRmMzRGOHBHYzBTcSt3cVVJS3dVamhpaExsRHVQMGdIcjdjNlRDZEVsRkMz?=
 =?utf-8?B?SnVodHNveEFrRzdlZXo3dFd4QkJER21ZWDNHVWFJKzIrLzUvU2hrM2xUMzRu?=
 =?utf-8?B?UU9UQzg0dW12bFptMys1NTNxeHNlYmlSTlNvTDhvemRTcDdhN0Qvc0lTeTVk?=
 =?utf-8?B?VGsyUGFhN1c5RHJLa0tBQVl1Q1BRZkRxWk84dE5SL3JoOUFGN09LWW5rUWN1?=
 =?utf-8?B?NjVwemRrZUdlLzkxQWFXVTR1bTFOTzRhUDZhOXFtaThDT25nQndkSDN1SmVC?=
 =?utf-8?B?TnI4My9XK2twcWRMUURzMDVOYzJqQm11WjVKU2NLd05mUEtkSG1vM2tnN0lV?=
 =?utf-8?B?Sm4vYzRxaDJvbU5wdWxJR2FZUnFVNjE1b0pFVE1iY0thaDR2RXM1c3lybWFl?=
 =?utf-8?B?WEdoM3pmNzBDZDFlRWNvbkRFeHpvQlpLYldhVlRocXJFWnNleVhBWFcvUFBz?=
 =?utf-8?B?d2VaOG8zWTE1cGtvR20vMGt1UU1BaUdEOEFhVTJCZk5haS9xaHhqRkQ3WWFL?=
 =?utf-8?B?akE4bUo3RDlYUUV1Y0IxTzJJN1VhUU0vd0s5aUZLQU9QU1d5RExyWG54eVM3?=
 =?utf-8?B?YXJrcjdyWGZ0eDFuT0tFSGlmSFQ2R3hicnVkKzFTRUw3MkNUanlhQ0x3c25D?=
 =?utf-8?Q?UGc5kG+XZCo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkR4bWtIcmk0TEJMVDN2S05uZW4rcEl0ZnlFQkp0S0lpdFowZWVKeEN3TGw5?=
 =?utf-8?B?Wit1MTc3a0dKaG0rbG1HSkE4NlUrdSt1Zi90YnZvMUZVbDlHRWg3OUZGQXIy?=
 =?utf-8?B?ZDJoQjlES3UxL0JJbk1IQ2toQjRDRWFIZlJqbGNTVCs2TjAzbXdqQTJoa0hM?=
 =?utf-8?B?NnNkTEhRM3l2VW5ZaGdDeFA1bW5UODY4OTU5ZjBKN2pNRTdPY256WGo3VGI0?=
 =?utf-8?B?Y2JhRWVlUnozdlR1SjRtYjhjbUo2blFkUzEvNnFhMGhPWnlXM3hkWk1mTzJU?=
 =?utf-8?B?TUJkYzREME9WWmVJMjZHQU9MSE1iam05eUNMNCtwdEI3RzJHRzN3NkpaaDJq?=
 =?utf-8?B?L3VzQzhpM3lJYjVPMVlrSFN1YjltUU5SNFdSWmlJazN2a0JFaVNLdDZrUWgy?=
 =?utf-8?B?elBzaDdiRFZGWW5YOWhhOWRKVmhCWEEybERVL3BScG9QdEdLTVFnQTdVcXhS?=
 =?utf-8?B?bzlxd2lmUEljclF2c2dkdFNmS2dHNExGeDYzK3ZZc0gyTEpPS2JIZ0xhRHZJ?=
 =?utf-8?B?cG80S1oxSnNiZTNqSk1EbWNGTSs3bVBKSW5zOU9TbXc3Q1JnbUUrZVNueVhS?=
 =?utf-8?B?WW9odkN1NUxKcHhtMlRrZnAwS3BsMm9IK09PSFc4WGtGcGZyRm9QTnhkN1p4?=
 =?utf-8?B?QVVwOXQ0QldrclN3SFBZZmZ1ZXI1Sm9yM3p6R3JZS2wxQ0dmMk5iZnM4bWFu?=
 =?utf-8?B?RW9IVWJKZy94VXZCSDBKc1IyZ3g2YmFlaFgzUGJpeXRBVE0xeUZKN2gwNENk?=
 =?utf-8?B?VVl0R2tBbmNjZFJsTWxUNTVJbWhFb0ZZOXFZb1RYb20xbnE0Sjd1RjU5eTJv?=
 =?utf-8?B?cWFTYlpzMWZWMHpkT1ZCYjRjb1BIS2l2bC9LaEY3MUsxU1grNkJEdE9tbk9J?=
 =?utf-8?B?MDFrZVNHanFMQm1Ua25KNVVHTHk3a2IzQjU3MXVJZ2U2UytNdndFTkl0S3lL?=
 =?utf-8?B?elV4cCtXdllzMDRER3J4d1hZbG16S2dxT2haek9CRWV2YVZtV09hKzB3RTZn?=
 =?utf-8?B?MzdMT3R2RmI1Q25hV2hwRy9OdEJHNHJDOXdkdU85T0ZvZ0FLMGs3dHExOHlP?=
 =?utf-8?B?NnYxMUlvdUVJZVZ4bVdPQlZtM1RuTXZ5K1JyaitvN1J1Zmd4OE14MlFsNHgr?=
 =?utf-8?B?bUE4ZU4wejNwRGJXbmtsNFIyQ1pVUkErK1VUc2lNRXJPbXNOUDZLdzc1NkhM?=
 =?utf-8?B?bm9JTWsxL3Z6UDdJbVRIS013TkxUaDRFbUtqcy9adlJadWp5ano3RzY0N3BS?=
 =?utf-8?B?ZTFONmFOeFN0a0RGR0xsWndsL0VzRlRQaEtHcU1NWXNiV2dpR2IyY1BuTG83?=
 =?utf-8?B?T1ZSNERHYU5za01la1NmV2R2cHVmOU1nODBNS1lkT0dYTEVxRmVjamZzOCtZ?=
 =?utf-8?B?OW5sdFNtbityZXFQemVVdDh2RjJnYUFuVklMZFZlNklsMGVuM2J5UW1nZEla?=
 =?utf-8?B?MWZXengveEtwcXVJOWJNbmpXT0VHSXdZYWw5c2tHR21XYWpLVWVqVjhZbXlj?=
 =?utf-8?B?ZFpvZ011QWdKZGJsLytvdHBRUFIxS3FpMm0xeVhqbFhlZ1h5T20zcUFYdFZh?=
 =?utf-8?B?bWJ6ajdmcVVWVTdHdzZweHhIRHJSNlRCVEhqdHhkRnU3VFlNUDJzSmZOT0RC?=
 =?utf-8?B?TE03S3hybVhGUWdJUmtxa3FIWWxubFA5cHNGL3RUQlZtdkxyeHVMNmQ3SjZs?=
 =?utf-8?B?UWFzQUd3OGp4V0lxR1hNaXJ4SEVabkVaWklqNmhmTG1pSS81VWRlcGVCV2o1?=
 =?utf-8?B?UGJ0eVVSa1g4clFNMTBXRDZXMkNvejFCRHRGLzMyQ2Z1MnNXMllRaGk3ZnF4?=
 =?utf-8?B?WnR1U3JCQnVZemxyVHBBemhNck5WT3BkZVhBS1ZDSVFjelRzQ21oa3p6T3Zq?=
 =?utf-8?B?d2tzbWpPRjJtajNPTnNTZ1FHOHYyMVNweGd4NDh4L0gzSWZUeFZkSCsvaUVk?=
 =?utf-8?B?NFMxTmI5Q1FZOEh2ZE1VZm1HS05IdFE5ZW0wZnV4YTNZSW5zVGNJdE5abEdp?=
 =?utf-8?B?bzM4MUh1WWRNeklXZ3pFMTdtRXJjYXhHSU41Z044L2RFWWxaYWJoczI2LzJv?=
 =?utf-8?B?MGxKUEhCaGUxWnhObHFUV3NueVBZdEgwUHhQM1l3MEtUSEMwY1RwNDlaMDRj?=
 =?utf-8?B?bjhDbkE1dUF0TURxMjVvL05vZVVJZUtSd1pxUlNsWVFQRFdkNEIyeFNyZlUw?=
 =?utf-8?Q?q+n/Qhz6FP4+xB6QgRbX2eg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bbfc2c-01b0-430f-4b3c-08dd8db86e02
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 22:42:21.7428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pY/x0DqE9MD65zpVRySswtALCMK7HLu6UifWnTkcPukACKvkEMDaB5Jkgr7Pl5Us6GU2bgtuh0iGxdXhBjFx0e5uWk3+BeB1NBjhZXh4p8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE8B1F622C
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

<snip>
> diff --git a/include/drm/intel/xe_late_bind_mei_interface.h b/include/drm/intel/xe_late_bind_mei_interface.h
> new file mode 100644
> index 000000000000..4005c4c6184f
> --- /dev/null
> +++ b/include/drm/intel/xe_late_bind_mei_interface.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_LATE_BIND_MEI_INTERFACE_H_
> +#define _XE_LATE_BIND_MEI_INTERFACE_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct module;
> +
> +/**
> + * struct xe_late_bind_component_ops - ops for Late Binding services.
> + * @owner: Module providing the ops
> + * @push_config: Sends a config to FW.
> + */
> +struct xe_late_bind_component_ops {
> +	struct module *owner;
> +
> +	/**
> +	 * @push_config: Sends a config to FW.
> +	 * @dev: device struct corresponding to the mei device
> +	 * @type: payload type
> +	 * @flags: payload flags
> +	 * @payload: payload buffer
> +	 * @payload_size: payload buffer size
> +	 *
> +	 * Return: 0 success, negative errno value on transport failure,
> +	 *         positive status returned by FW
> +	 */
> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
> +			   const void *payload, size_t payload_size);
> +};
> +
> +/**
> + * struct xe_late_bind_component - Late Binding services component
> + * @mei_dev: device that provide Late Binding service.
> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
> + *
> + * Communication between Xe and MEI drivers for Late Binding services
> + */
> +struct xe_late_bind_component {
> +	struct device *mei_dev;
> +	const struct xe_late_bind_component_ops *ops;
> +};

Does this structure actually need to be defined here? Differently from 
other components, for this component we're only passing the 
xe_late_bind_component_ops via the component_bind_all call, so in the Xe 
driver we should be free to use wherever type we want to store this info.

Daniele

> +
> +#endif /* _XE_LATE_BIND_MEI_INTERFACE_H_ */

