Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D19A22D6A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0220010E95D;
	Thu, 30 Jan 2025 13:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eov0AAtg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758B310E95C;
 Thu, 30 Jan 2025 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738242827; x=1769778827;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3mhrzdLvUgFy0+Bs6hdHFO0OfaqPO5LlGJKdHyXyEt0=;
 b=Eov0AAtgRZeCbxz15w/IjbR+PeaXd0c7bOPQ0QeZyM8remyoAV1eslAq
 EwVYo0x0s/inGFPljYUf63hkYuj30NM7wNBr4LEH3n+vgFv+8c1Y4wKHl
 uWh9FtZCkA2dBUZiZ5zBgbNQ/eNubPcmAX01qzd83eNBHlIUqkvJT4IXI
 TGmprzr7XFjR0g0E0V8uNac/EiiIGGgT6UJ9bg9nXopI6QtPI2INd9Pmv
 vw00gValkkALkJyYUYvwIpofMTW4cRNfQ+Zp2UxWkb3zJakqgsY5dchiq
 vrpGcommpCWPNKW7oa8Ag2TbzJVnNg3Pkf4ri7TdO0wDgXO1Qa//XFdzy w==;
X-CSE-ConnectionGUID: O9H7zAO5RnygO8Yuj8xjzA==
X-CSE-MsgGUID: LX/AxQMDRNCU+q444aUFxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="41618243"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="41618243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 05:13:46 -0800
X-CSE-ConnectionGUID: Kur4aPUeSdOMSarbOHcyTg==
X-CSE-MsgGUID: VDkLuGBlQ2CoARKf7mInCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109461695"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 05:13:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 05:13:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 05:13:45 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 05:13:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npYxwtj41qNVsnBQEDDLiX+iZc09j3PbNz5gObHgYRUxZstj5V+eTrUqgi1SynmIoNrRym5Ghs8mehPb0231vp5WgWypUpvPo3qABa6XdVdpRhb2//IAwdrY6pW4xNd8Pq8VvoGCVV+3H6pzBYzZKi5V98NrDmS+p07kB8sVFDNnuNmHUrY6cQl27IFSHu69ru8CDQP/q4j/QP2yrebYZrfVLoGsXM4mFDX1aQu5I/n9Z7WQ0uVa2vkRueXiRi5uRmzRznNy9Df5SahKF+u/7WgoUPkeps9M+iugFHYjQHuBmLLWQX7gViJEf+0bMa1fR3WzjZf57gZESQuw7HfnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3fXm1EWpm/Svc//gE0nsqEoKM6018bqbfhuytJpVb4=;
 b=dP09yZM+h+gasm9vh7u894MVUkHzt+c5u1GORejjW9iIu8+TyO8Bv+loOigB/XoPPfOIh/OqKT/aaiRDmncNKRRzh6IWfv+8r7S8BIIv0usGFGsk5vAfsIc0lOz40GSkILSQ9HLHxbnQvaqned4UlptYlW4FD753Qf2xHILLAu9MNKyH0GU1Z9QJTK0lTG/RTuQxU+Ng1OSRBKJfbCwogOOx2jyZ+drUdKYhBV4kX6rXhFSFkNEZnlE8cvwIGm6Qch9R4l0YDr0cOGbutk1uyGFZLzdsqnXFAq1t9ODzjTSd80Wxa+mOOi9o/IXu2cdD0rDnOarhBnt9kElZsiDy3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 CH3PR11MB7762.namprd11.prod.outlook.com (2603:10b6:610:151::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 13:13:43 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 13:13:42 +0000
Message-ID: <e2cf8b22-b00b-4447-a4d8-1415388b5530@intel.com>
Date: Thu, 30 Jan 2025 15:13:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/33] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-7-matthew.brost@intel.com>
 <4cdb6d9a-cf7b-4d2f-b214-c5c53f7b9714@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <4cdb6d9a-cf7b-4d2f-b214-c5c53f7b9714@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0029.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::15) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|CH3PR11MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e304da-fcc7-418d-57c1-08dd412feb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzY3NGdJZERQdUt3MkVBa3pUcHk3emUwSUlHYzUzTWRsejBJRytNMFhNTTFU?=
 =?utf-8?B?MTl1d2RFZ0dKUWFpdW4vQjNmbERLRWxvUVd5OXBYUjB3WERFWlphSHVzaklM?=
 =?utf-8?B?Z1RXSUV6dmlhZlVUNWZUcGJpRFg0VXRJSzZQNG43a2toSXFqekdiMGVDRWdP?=
 =?utf-8?B?UjZ0dTY4QVJUajFIVTgxaDNWM0hTNjJ0dkE3ODMzdU9qK215T044RzY2b1pW?=
 =?utf-8?B?K1pvbWoydy85VFJCNE9FMCt1ME9BTGVoUyszR1FabldMaGlZeW9TYlVvK3ZQ?=
 =?utf-8?B?ZXBGd3g4ekZUNEZObEZWd0FUMmVYZXY5TFZsZC9nN0RNUk5pVzdCWGVqRUh4?=
 =?utf-8?B?YVFTQnNtbE93RjZOQTE3YUNYQTRuenZTNUlsanpNcERwUm90Y01FNTVUTTYw?=
 =?utf-8?B?OElTTG55UkxsZG5qSUhVcXN6SFVZL1ZmWGNxUmlHNnVVWW9WOUl6RUNNa1p5?=
 =?utf-8?B?dHg3ZEVBc0JLc2xoME83L2g1ZnFBZ1ZTRWpWRkYyUlY3V2FiTVBCeGRCUWJa?=
 =?utf-8?B?eXh6VXgxLzhBNG1wYThGTlB6Q0NTN2pPSnlhb1EwN0lDbkcvY0xXdUFaMi9h?=
 =?utf-8?B?VkZ4dytxcmxrRTBMOWdNUXorRVZ5VklMbkwrZmNIWTFEK2tHRjVnOG5XVTht?=
 =?utf-8?B?dnhoTWE3aHhWV05Ua1NlcVl1OU9NQjduMVBKd1k1SnNtQVVQbmFsQjM2Q1Yy?=
 =?utf-8?B?UzFJSTRMWFNQbm5STy9CdnlvdktXOHF1dUswMUhDbXRNajBSdDN6bjZoTzRS?=
 =?utf-8?B?UXlqR003M0phVUpBQkVrZENvZERKZlhaV3hSWFAyZHFXUGlKdkxEZDl4b0h3?=
 =?utf-8?B?dUJHL3pQVTV0aW41Smg5ZG96WFVlV0w1aTZMZFpib3d5WnprMmhjc0FaQkl3?=
 =?utf-8?B?cXRQdDlLNGpWSitXY2NPUzFOb3Z6aDVWRTU3V050bVZoa1VHWVVVNmx5MTJS?=
 =?utf-8?B?Q2pkczNzZ2poQmpQRTBFY2todFV1OFpPUVNEdDlIdHZwU2diRkRXamlzeWUv?=
 =?utf-8?B?R3p2OUxqQVc5TTVlcDBaZWJTLzZxbThFaVpFQk44NmNFdHhaaXdnUDJwU0Qv?=
 =?utf-8?B?VCswR1A1LzVKcHB1SVNEdDNVM0ttekpIa0NhN0hwRUZLSmh4K3gxOG96Rnhu?=
 =?utf-8?B?VWhzM2NnVTg3ZVlTR2dBek5rRzIxdTI5dXpSVDNYaHlobVZ6RzV3ck9yc2k0?=
 =?utf-8?B?ekh6Sk41Y3E4YzltMDBxSWtPbHp6bE1iK0YxZ21DbVRQTDYybWNDTzNBT2h5?=
 =?utf-8?B?VktyWEtCaUZwVmZPVEp4RHNsNzlPV2NFRTVncnhaYVAxcXRiYUY4c0xQdm1C?=
 =?utf-8?B?MmZPU3VoYjgzWDgxdnp2VFV2Qlg5QnRrN1hSV1hGaVlDSkdtMjlDL2VaVDV1?=
 =?utf-8?B?QVNoOTM0S0NwRzhQWE5YdFFDVU9zOVM5WlZnditiTGlVN3YxR0tIRU50N1VL?=
 =?utf-8?B?aW5oQ05jdWhxeit5MUZvQkVGT3p1M2RMNnk4a25OSmcrcHUyREpyRmRVSHFn?=
 =?utf-8?B?UHNyMGtvd3l2Y1ZvY2ZXUTB0azZrU21YSU05ZmdxbkFLa0Q2UzRPRzdUZ3RV?=
 =?utf-8?B?Mkoya3VKR1hEWi9qSllpZE4rZ21YdHRIWTZCNXBuMC9YZi8rSzYydEdmc3pP?=
 =?utf-8?B?dVhrbW1wSjJiOXpCMTVOWjF4b2pkZFBwZmVCUTNoT2JiL3dlMmRLY3lWbG5v?=
 =?utf-8?B?SWR5ZXRDYmxISFFxUTFPNDBiYVhRZlRrdFlvaVRDbitoWS9idlN2N3hGVkR1?=
 =?utf-8?B?Z3Bzczl0THFWZzZlcDJSV0k0dUpTSHBSWlkyM0lXSkFmS1Nvbkk5YTFpZ3RF?=
 =?utf-8?B?ZFVGcnBFWHAyTW9IUWxnbG5HUGlJaVBWRm1ITmNFbG54Q2R5dWJRbDRmS1Vn?=
 =?utf-8?Q?bnJ85b0BmD9dr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1JS1dxWWIzSTRKa2VUWUwxUzVYWmtodjFRQW5NY1ZOU2FLdWN4ZlhNZXli?=
 =?utf-8?B?ZTFKa2JxR0Q0WUVXT0JBcVN1QlU5VDVFR1FrbjlaWENZdGo2dHFqdXozWWNB?=
 =?utf-8?B?RzQ2QUVJZkFlQmx6Z3RJQkFvMXJXdkVlTC8vMGVwNFpFR2FBcThkZ040MndP?=
 =?utf-8?B?RjAyMUZTWmplWGVVaFdtYW1WRW9VZ2VjQytXdjFlbHRyd2U0S2s5RWFvUnFF?=
 =?utf-8?B?anBFd2IwUTdiaG9Ec0Y4d0crLzJHUWd1RUpVT2Vhd3UxS0VWRTgrVk5Bb1Rk?=
 =?utf-8?B?cVZCbG5iU1UwakphRXlqSmQ4clhOQ29BZGdyYlpERVc0amNQelZxWHkxa1V0?=
 =?utf-8?B?Z05aRitZOTROVjc2RVZRck9rL3BhYm5MNk1QMTVwMTRlSzk5cnJJYXhpQmxy?=
 =?utf-8?B?RGhhOVJHbnl6NkEvOXNuRmdMbmhXUThWSDBmRC9ZSC9keC8zWTNidmJvS2Nz?=
 =?utf-8?B?TDA0STdIamhWWDE5bG9tTGorc2tTYndiZ2ZCcXc1dTY1ZGpuVlBHcTJrWFcv?=
 =?utf-8?B?cnhDcE1PNlRiOHJYR3BYNENIQ3dkKzhpRUplbWNoNm5NV1AzeXB2RHJONUth?=
 =?utf-8?B?YWdualhuVCszTWY2eFNIS24vbW5mYVFSSmVkRUp0eVdXZzNmNnB1Uk4vUXlV?=
 =?utf-8?B?MWZnY0xYeFRJNGlzb2V2dkVuWHljdGZ6V3U0bTU4bUxnaHhocUI2bkl6alpF?=
 =?utf-8?B?eFNDbFFxTFBJNzE1aXRmYnBCUEt5RkM3MzhGTVhGZGRtTEVVM0hvdVJ6bjA0?=
 =?utf-8?B?ME5yWithY1Q2c2ViMFJUNFBDWUVYaGhXWHlzOVRlQjk1K2pHQzB1UGFkRFgw?=
 =?utf-8?B?bXdUV0FSRDcxakJ1VUYxQTMwU3NjMm14c1pKSDREUmdONnFBdEZjamM5YWFR?=
 =?utf-8?B?UkNVeW9XN245SDRFdnh0YldEN29JR0F4N1MvamhuazAwTUE0WjNrUUZOdEk2?=
 =?utf-8?B?NXRFbjVnR1NSWjB0U2Y1U3NET1M5L1F3YTBXSU41Vm44cm1iLzJHczhweHB6?=
 =?utf-8?B?QWpHdjNkZUVTem1kR2Q3QWZ4d08yWWh6WEdSR0hRc1RQUXk2eW1CZW1UOHNj?=
 =?utf-8?B?YytNbTg0bElrb05paVEyY1ZFM1pwanVlZnVkWDdRSEFCTEdjV1Y4cFZwN0Ew?=
 =?utf-8?B?Y25Sc0x4dTZiRTJpMnl1akVJMy9SQk5JbjVrVkNURXJRZzUwZXZWOVNqOGd5?=
 =?utf-8?B?MTdLeWd0cHQ1cTBnSUNCb2RwU1NZLzIwb2RheGdSdmRvZjBISUprMzVKWGJy?=
 =?utf-8?B?aldUbllBa2Y3Q3FsODFjdUZ4alRudmgwVXRtc01MZ0FjU2xkWWpkcmR4VHps?=
 =?utf-8?B?NUJqNXYxTmVNUGhDeXY2U1lmenQvRzR2M0Y5dDloTHhLdVlEb2crWFVDZXh6?=
 =?utf-8?B?eWkwT3dNMVR1akR4cGFqRWdxVzdSdkJuUC9mTnpSOFNvaVhTa3F3T1BEcVRn?=
 =?utf-8?B?QnZkYlpNaGk2Q2NXTFN1dXNQQWFLc1IzR2h1TVVBbEhjWkVXYVRUUXhuV2JK?=
 =?utf-8?B?elRxcGhGTzY4N0dOMCt2NnZmZU5JUllVWitmeHlicEFiOGwvUmpSVExOMWtU?=
 =?utf-8?B?MmdCVEpBWVpGdUU3RjJYNlkxdlpUQ3hVSCtsSE5rdG5UVGdiSTBXRmJpTCtF?=
 =?utf-8?B?QnJvY1FiLzRJNkxvL0R3dnRFZE41QnFzclhMckpNaElNRzk2K3g2ZUpnRkdN?=
 =?utf-8?B?ZmVtWlpYYmJXT29Oa1M3N1ZlTTVORE5tZTI4VjMyKzFDRFlWODEwZ09MRldZ?=
 =?utf-8?B?SmVtejdaR3lIUnRpNm5jeDdMOGc5Qm5SUVFZcUYrNE1WcGZFbkpIUGFiak1q?=
 =?utf-8?B?YzhVdFFQVy9PdGFDVVcyV2VKcThZR2FaaGFKVEM2MVcvYlpFZkRYcEdSWTZD?=
 =?utf-8?B?Y0dZVUVZYlA1Y2xuTW9rYlcyYmdUbzg3SFJsV2kvRkEvbnZMQkt6NTZQSFpk?=
 =?utf-8?B?WDVTMU85VlErejZneVB4OXkrMkJsUFcrQjM5d3BPWmdnWDdrYjNXZFJKQ1ls?=
 =?utf-8?B?WnIya1JTcGpBdFpIejdGUWFndnpiLzM4M3UzMEVlVEhrM2Rja3dPSzB5TzlF?=
 =?utf-8?B?OUNEZ1k2TThZQ014YmU5Wm5xNW1qWXRYeURyLzZyeEpWaGNvSHpHWXZFYk9G?=
 =?utf-8?B?ZEd3Zi92OElFVjhwLzdVOStKTXd1TmxNUGxST2R5N0IzOTJQNzUxOUdWWS8y?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e304da-fcc7-418d-57c1-08dd412feb4a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:13:42.6987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRn86KZWggJTBp078vu2haijftDsxxHgbfWkpYfsOWTibd7Zn/aLAek/JUN0QuQVSMljoqjEucxlOEeEWE3VkYnxeGXazKUHZ54HeqqIDho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7762
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



On 1/30/25 1:17 PM, Matthew Auld wrote:
> On 29/01/2025 19:51, Matthew Brost wrote:
>> This patch introduces support for GPU Shared Virtual Memory (SVM) in the
>> Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
>> sharing of memory between the CPU and GPU, enhancing performance and
>> flexibility in GPU computing tasks.
>>
>> The patch adds the necessary infrastructure for SVM, including data
>> structures and functions for managing SVM ranges and notifiers. It also
>> provides mechanisms for allocating, deallocating, and migrating memory
>> regions between system RAM and GPU VRAM.
>>
>> This is largely inspired by GPUVM.
>>
>> v2:
>>   - Take order into account in check pages
>>   - Clear range->pages in get pages error
>>   - Drop setting dirty or accessed bit in get pages (Vetter)
>>   - Remove mmap assert for cpu faults
>>   - Drop mmap write lock abuse (Vetter, Christian)
>>   - Decouple zdd from range (Vetter, Oak)
>>   - Add drm_gpusvm_range_evict, make it work with coherent pages
>>   - Export drm_gpusvm_evict_to_sram, only use in BO evict path (Vetter)
>>   - mmget/put in drm_gpusvm_evict_to_sram
>>   - Drop range->vram_alloation variable
>>   - Don't return in drm_gpusvm_evict_to_sram until all pages detached
>>   - Don't warn on mixing sram and device pages
>>   - Update kernel doc
>>   - Add coherent page support to get pages
>>   - Use DMA_FROM_DEVICE rather than DMA_BIDIRECTIONAL
>>   - Add struct drm_gpusvm_vram and ops (Thomas)
>>   - Update the range's seqno if the range is valid (Thomas)
>>   - Remove the is_unmapped check before hmm_range_fault (Thomas)
>>   - Use drm_pagemap (Thomas)
>>   - Drop kfree_mapping (Thomas)
>>   - dma mapp pages under notifier lock (Thomas)
>>   - Remove ctx.prefault
>>   - Remove ctx.mmap_locked
>>   - Add ctx.check_pages
>>   - s/vram/devmem (Thomas)
>> v3:
>>   - Fix memory leak drm_gpusvm_range_get_pages
>>   - Only migrate pages with same zdd on CPU fault
>>   - Loop over al VMAs in drm_gpusvm_range_evict
>>   - Make GPUSVM a drm level module
>>   - GPL or MIT license
>>   - Update main kernel doc (Thomas)
>>   - Prefer foo() vs foo for functions in kernel doc (Thomas)
>>   - Prefer functions over macros (Thomas)
>>   - Use unsigned long vs u64 for addresses (Thomas)
>>   - Use standard interval_tree (Thomas)
>>   - s/drm_gpusvm_migration_put_page/ 
>> drm_gpusvm_migration_unlock_put_page (Thomas)
>>   - Drop err_out label in drm_gpusvm_range_find_or_insert (Thomas)
>>   - Fix kernel doc in drm_gpusvm_range_free_pages (Thomas)
>>   - Newlines between functions defs in header file (Thomas)
>>   - Drop shall language in driver vfunc kernel doc (Thomas)
>>   - Move some static inlines from head to C file (Thomas)
>>   - Don't allocate pages under page lock in 
>> drm_gpusvm_migrate_populate_ram_pfn (Thomas)
>>   - Change check_pages to a threshold
>> v4:
>>   - Fix NULL ptr deref in drm_gpusvm_migrate_populate_ram_pfn (Thomas, 
>> Himal)
>>   - Fix check pages threshold
>>   - Check for range being unmapped under notifier lock in get pages 
>> (Testing)
>>   - Fix characters per line
>>   - Drop WRITE_ONCE for zdd->devmem_allocation assignment (Thomas)
>>   - Use completion for devmem_allocation->detached (Thomas)
>>   - Make GPU SVM depend on ZONE_DEVICE (CI)
>>   - Use hmm_range_fault for eviction (Thomas)
>>   - Drop zdd worker (Thomas)
>>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
> 
> <snip>
> 
>> +/**
>> + * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM 
>> (internal)
>> + * @vas: Pointer to the VM area structure
>> + * @device_private_page_owner: Device private pages owner
>> + * @page: Pointer to the page for fault handling (can be NULL)
>> + * @fault_addr: Fault address
>> + * @size: Size of migration
>> + *
>> + * This internal function performs the migration of the specified GPU 
>> SVM range
>> + * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
>> + * invokes the driver-specific operations for migration to RAM.
>> + *
>> + * Returns:
>> + * 0 on success, negative error code on failure.
>> + */
>> +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
>> +                       void *device_private_page_owner,
>> +                       struct page *page,
>> +                       unsigned long fault_addr,
>> +                       unsigned long size)
>> +{
>> +    struct migrate_vma migrate = {
>> +        .vma        = vas,
>> +        .pgmap_owner    = device_private_page_owner,
>> +        .flags        = MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
>> +            MIGRATE_VMA_SELECT_DEVICE_COHERENT,
>> +        .fault_page    = page,
>> +    };
>> +    struct drm_gpusvm_zdd *zdd;
>> +    const struct drm_gpusvm_devmem_ops *ops;
>> +    struct device *dev;
>> +    unsigned long npages, mpages = 0;
>> +    struct page **pages;
>> +    dma_addr_t *dma_addr;
>> +    unsigned long start, end;
>> +    void *buf;
>> +    int i, err = 0;
>> +
>> +    start = ALIGN_DOWN(fault_addr, size);
>> +    end = ALIGN(fault_addr + 1, size);
>> +
>> +    /* Corner where VMA area struct has been partially unmapped */
>> +    if (start < vas->vm_start)
>> +        start = vas->vm_start;
>> +    if (end > vas->vm_end)
>> +        end = vas->vm_end;
>> +
>> +    migrate.start = start;
>> +    migrate.end = end;
>> +    npages = npages_in_range(start, end);
>> +
>> +    buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + 
>> sizeof(*dma_addr) +
>> +               sizeof(*pages), GFP_KERNEL);
>> +    if (!buf) {
>> +        err = -ENOMEM;
>> +        goto err_out;
>> +    }
>> +    dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
>> +    pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * 
>> npages;
>> +
>> +    migrate.vma = vas;
>> +    migrate.src = buf;
>> +    migrate.dst = migrate.src + npages;
>> +
>> +    err = migrate_vma_setup(&migrate);
>> +    if (err)
>> +        goto err_free;
>> +
>> +    /* Raced with another CPU fault, nothing to do */
>> +    if (!migrate.cpages)
>> +        goto err_free;
>> +
>> +    if (!page) {
>> +        for (i = 0; i < npages; ++i) {
>> +            if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
>> +                continue;
>> +
>> +            page = migrate_pfn_to_page(migrate.src[i]);
>> +            break;
>> +        }
>> +
>> +        if (!page)
>> +            goto err_finalize;
>> +    }
>> +    zdd = page->zone_device_data;
>> +    ops = zdd->devmem_allocation->ops;
>> +    dev = zdd->devmem_allocation->dev;
>> +
>> +    err = drm_gpusvm_migrate_populate_ram_pfn(vas, page, npages, 
>> &mpages,
>> +                          migrate.src, migrate.dst,
>> +                          start);
>> +    if (err)
>> +        goto err_finalize;
>> +
>> +    err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, 
>> npages,
>> +                       DMA_FROM_DEVICE);
>> +    if (err)
>> +        goto err_finalize;
>> +
>> +    for (i = 0; i < npages; ++i)
>> +        pages[i] = migrate_pfn_to_page(migrate.src[i]);
>> +
>> +    err = ops->copy_to_ram(pages, dma_addr, npages);
>> +    if (err)
>> +        goto err_finalize;
>> +
>> +err_finalize:
>> +    if (err)
>> +        drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
>> +    migrate_vma_pages(&migrate);
>> +    migrate_vma_finalize(&migrate);
>> +    drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
>> +                       DMA_FROM_DEVICE);
> 
> clang for me is throwing:
> 
> drivers/gpu/drm/drm_gpusvm.c:2017:7: error: variable 'dev' is used 
> uninitialized whenever 'if' condition is true [-Werror,-Wsometimes- 
> uninitialized]
>   2017 |                 if (!page)
>        |                     ^~~~~
> drivers/gpu/drm/drm_gpusvm.c:2047:33: note: uninitialized use occurs here
>   2047 |         drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
>        |                                        ^~~
> drivers/gpu/drm/drm_gpusvm.c:2017:3: note: remove the 'if' if its 
> condition is always false
>   2017 |                 if (!page)
>        |                 ^~~~~~~~~~
>   2018 |                         goto err_finalize;
>        |                         ~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_gpusvm.c:1966:20: note: initialize the variable 
> 'dev' to silence this warning
>   1966 |         struct device *dev;
>        |                           ^
>        |                            = NULL
> 1 error generated.

I also reported this issue in the v3 patch, but it doesn't seem to have 
been fixed in v4 yet.

https://lore.kernel.org/dri-devel/0416fa97-1734-4565-a352-f045a6c0a15a@intel.com/

Br,

G.G.

