Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E40A33DF5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576B310EA6A;
	Thu, 13 Feb 2025 11:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dilf6h4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7886110EA8B;
 Thu, 13 Feb 2025 11:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739446021; x=1770982021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aFSWnLN9GrByXBvbGKuUcb/0EY7aPov4XQua22VFiFk=;
 b=dilf6h4KNEbmk/7KXhRBqo+0FZQj+S6KSdM7u6uRtbbALX53bubYd9JE
 N9e3zEoq9X9mJWehect8/mghARMH8jfwxXVHsJFV0ppddy2324mHWaGLA
 6j2A+xs+e9j3J9wUAlyjO8X/AA4orXa1vkiXIuw7elhv90Ub2biQ8RTCS
 aUAe7wdiepHXJw5Jsbhsp0acmDmW9/I8gHuPZNGvmZyLpIWOSmiu0soVQ
 /85+MFeb8gGXNniSumUQ566VGsHON0tOk9/aq971kuCS33Im9vTN3r/8M
 5dJx6dfxmZcWVAwnSDPMDmFfT0b/GgZbYbyllwh6zeNsulrs0wpNK9wyl g==;
X-CSE-ConnectionGUID: VV9dlpE+Rv26Knaqjkk7OA==
X-CSE-MsgGUID: d3PArcFCQoy/J35pUYtBXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40061561"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40061561"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:27:01 -0800
X-CSE-ConnectionGUID: +rI/A8ODRHGAhDQtlOc/CQ==
X-CSE-MsgGUID: iaksXVLyR1Ojr4NNkfcnRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113781356"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 03:27:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 03:27:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 03:27:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 03:27:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSMWc2GrGRnnYXbFQsgddv6bTcE7QaOGeKmvt48huWMKDCVsU3vyD34QPuyaUA9/hijMFFi/MkGwInOMBXdtafeEg4zdxi4x1A2XCVomCIGoY0fJ6rfZy7PVJvKgWJvImESlCfNwqENfnbQDElS2Ii9SSBo7QrKZSNxIwB23mgC43NkpZL6t0XV0HQ4vUhif19xPxoJRGq+3pHZPJF8C90onwFAsFx6hbjBinAz4v93gTqYYBreT9ETJayoTzUgGgidaag2IRTaGJwuASOsHYmFrdjyqKYpdG5gmZKmW/oG2zHnkRcfcxAudFCF3lWPFUawJgti7SY4W2kyhRonlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW8B1N4UqsW/KeUeTJGayPQcGlBDjMGtY/1DTrozv7I=;
 b=j+Jt/gFhD9sPllwgRZlJfqALagw+QNlIHqrEbyaRR0CnKC08Hxmumov6tfwmY20pMaThIFao4kmAy8BlWcDFD0+rb3l3OG386+D66mmGIQkua4gVsou/YFrV5GDPVoc8onyUByPeF2BvSd/+j2qnxr9B4kQaLkSRrb44K5MQMWzJs5qPecg4OesuDGVLCdJxZQNMTA68nOn+9PDFnlt5GubGS5JRFGRClytJyFIyHEyfYgtNi0jE/ZvWsMDihbW3IA4khZtOq1CueHH6eDs8fi66PykTGV5GrUSIeIPuJjgEa9voO9wQKkK7Du+ExNN2x2ygL8ejG3GOGa2mJJT3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 11:26:56 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:26:56 +0000
Message-ID: <cbc0e645-875a-4598-90e9-86014ed8418e@intel.com>
Date: Thu, 13 Feb 2025 16:56:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/32] drm/xe: Enable CPU address mirror uAPI
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-19-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-19-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::27) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 56af2aa1-5d79-4bcb-8cfc-08dd4c2152b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1dwYitRZ0lNTVg2WDlMY0JLK3kxeFU4RkFZdWNrODR4bW1zNUd5V09QaU1K?=
 =?utf-8?B?OWNmeE1RQTU3VTd0NmU3N1RMRFZYbER1QTZQRnpRWlNxNXlNUkpuanZuSGdP?=
 =?utf-8?B?bUZ5Vml6d2c4WFJZeDlNdmJhb0gyMFdSMmtLY0lyMisyQzRtNWc2ZzRQaHlE?=
 =?utf-8?B?aFZnSHg5R21TNktDajk2K1c4dkU5K2ptUXJJM0xpNFhHdFA3K2swa2lvU2dl?=
 =?utf-8?B?N0JPdDZDc21xem10RzlLa00vb0hYNTRVMUxvUklFL25YQ205Vzl6TGxIZWxE?=
 =?utf-8?B?R2dIYTdzVjJ2V294OGNtTTkwT2FsYTFGZkVnQU9Ld3pza0NSQ2FTNHlJRERq?=
 =?utf-8?B?K0hja1NHT0l3MjJDcEtaZzdRZmxiSGFQeWl3dDZFUy9rYk1TNmErMUZ6Q1lI?=
 =?utf-8?B?SzVxTkJiRkZxa2lwK3hIRDlJMTlReS9odEhsU2tXZTcvUmdtdmprcDQ0aVRE?=
 =?utf-8?B?akMwL3pyOExlNWh3Wk9wYVRvSkRmZnllbFVLc01iZ2UyRm5FSmhwc2NJaDkw?=
 =?utf-8?B?bUVkR0FTZkt5eWIxMHlONmVRUXFqMzJiVTlmNTk1NXhsN1k2cHA4TS8rL2Jh?=
 =?utf-8?B?SGxhem9GUjhHVnp0NlByaDRVZmtiK3FxY1pvcDRSOUZaelFxbXpkZHlWZnZi?=
 =?utf-8?B?V2MxQ1pZdWNSNVp0ZTZad1JDZXBxVlF0dGgvQnlKL0FDRFoxcjRZTktiaDBp?=
 =?utf-8?B?V1hrUkJZUEJJbCtoM1dhR1E3Wmx1SVJwMDdKM2N6WEdVRklCSTFmMHdOZWpq?=
 =?utf-8?B?VmR1ZkIrektGcENjdXg0dkM1cHpsZVp2WmJ1MG01dFlEaURKRXNEOFRkWHg0?=
 =?utf-8?B?VjNiSURUMmdEdWNtajlBbWVqQ0JlcjhQL0FwaXViN1pmTkNzUGhrQUQrUTgy?=
 =?utf-8?B?OWNkN0hmMUlnQ0k2aURXcWNwTVVDdDNBaG1LWFo1VU5vdzVJNkhqb3hpUGdo?=
 =?utf-8?B?aHEyaUJjQUJLUG4rQUg1aXlZakVjZEJlMGw5a2hWSmZocVplcDZiWnZiVnpw?=
 =?utf-8?B?UjB4d3NtNTJHa2QyK2ZBQUtPRitPOWh2OTRaNWNDOFBqVm9UdG9RMi9PVzBx?=
 =?utf-8?B?ZHE2dmVsVkZ1YjljQkdFcU1xakdFTlErYjZpYnhPN0JpcXdxbDQ2L1BWYkZY?=
 =?utf-8?B?Ri9wYTFzZHJ1MlJlU0JwUm9xdXVKa2ordjVGbDdROUJXQ0NkUXNIUW51Mnh1?=
 =?utf-8?B?RTBCVmg4eTlEOGFrREJkTWFKUGh5S2NPTElDNWpmSkpUK25WUGVnOUc1SHlp?=
 =?utf-8?B?RmI0YjY0NzZEcmlWd1laMEROSHhLMDc0NDVvcEk1ang0Wk1zTi82Y2FnZTBB?=
 =?utf-8?B?Sk8zZnNhT1BHbnNDdmRRTzhDa282L2hoMWJGRzlxWnMzT3k2WFM0eHlydkd5?=
 =?utf-8?B?eFpoU2dzN1RldEpjdnV6cTcxTGFuVXQyMFlVcWd2U0NRMXhPY0ZibkJpZUtI?=
 =?utf-8?B?RDlyMjI1bS9qZDRkYmJucUZDdFBqaVdQaC9tMVBSZk42R1lTaWRqTW9UUWR0?=
 =?utf-8?B?OWY3RTFUOFFMZzNsTkV0RmhWdzFLMzJpbElqNTJUOThTTkdUUHpDaElnaUk3?=
 =?utf-8?B?ekdwR05mMmVHL3ZWdFZ3djhKdUp5QWdxVzhOdjNJUUNXVFBIQkdodGI4QVh0?=
 =?utf-8?B?dThRYUR0c2lVaGRpU1QveUNMRFM4T1YyVkVGMGxadm1QcVpYbU4wVlM2Mm12?=
 =?utf-8?B?aHFEZHZ6VkN6QmIvNThiT1pob21oSC9BTVNDdG9Id1l1ZFgydjlZVFdKSGxH?=
 =?utf-8?B?YVJXMW9uWUNNUENsMG9oaElPRGdIUWtZUGlCelV2TjNqeTdvSWUyc1hlUi92?=
 =?utf-8?B?Rzk5UzFTcTVQNFdsbGpqeHN5T3F2N1pEL3JYTnlEck00UEpUNTRsNVA5dDdn?=
 =?utf-8?Q?IW0/VF11qAB23?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mnd1anNTeWszTHZDa0dXMk5UMjQwZzFoVkY0cS9vZUQrNFlEWnExTUJ1NE5p?=
 =?utf-8?B?YTh6Y2FxSUlWTWpYYW1scTJ3ckFRZUJyTDVaKzJvd0lWaU13dDlQd1BPT1ly?=
 =?utf-8?B?aFZTeDJJNldNK29IcEo4eGZOR2FpZktwU29ET0JWR1NhcTdRNjVZZkx6Zlo4?=
 =?utf-8?B?dUhybmk5bG1aeVpWOHBPU1JFSEFIcXZHY0o1QTNaNUUvR0VUY282VEdQYnZ0?=
 =?utf-8?B?MlRiNzE5NS9tdHNyalBvY291cUIwcXBYeWVTQ0NtdWVyN1FpM1g3RHlqYnRh?=
 =?utf-8?B?YzZ2bGpoK082a0JETWt0a3drNXJoN1dsR1ZsNW5DN0YxZytaMDRIRmV0OTIw?=
 =?utf-8?B?NUxyVjkxVERzME9lV1NuNDdGajU3RXk2NWNkNk43R3luYkozdUdreWNSUkRj?=
 =?utf-8?B?d2lvWVlqRU1na0s5Tkk2NWQ3Y1Jwd3JIbVBxaE5uZXBveFFQemFEQ0NaRU8x?=
 =?utf-8?B?TW1lNmh6RnVSM0tYcjJON01NaTMvYUVLN3NJc3VtMzNGRXFiczZQRVBEM3p1?=
 =?utf-8?B?K3BKcUNYVUFkVWx1VFVEcnhwTHRabWtiOWtNOStHWTRqYmNpQmFoMUg3cm5C?=
 =?utf-8?B?dTM3SDBZWUJhWUJ2VmVZNVc3bi9hV0JNbk9pY2pXSTJpaXEzd2x3QytIMHRp?=
 =?utf-8?B?Yy9Wd201cGJTNG9TeFZGUHE4aXR5WVY4a1VTVVJsUTExTy8yeG51S212V3B1?=
 =?utf-8?B?bCttWjlWYjV5dGcwSzdUUjAzS3RjZmxVRGx2SmhVV0VzR3psbzBBcGNoeUJp?=
 =?utf-8?B?U0VibGFNV0VxbGl2MHA0RDBIQVVYU0NoSGZwODZIUDI2M2pnSExtRSt1VlRG?=
 =?utf-8?B?ekdMVkZLSEFQeHVkVGhNeFJ0VVZJZFNQTFBIbFRpbFNVa2k5Vmx3VEZyc3Zk?=
 =?utf-8?B?RDJCMXdoWTlRRm5pVnJtYUNQa3c2VCtNdDcwa29JRGFWWndqcGEzYVVVaTZ1?=
 =?utf-8?B?cVl3MnFOb0MzQzlkcnBkZnFMOFAxaGk2ckVVYnUxZHRTM1ZtMk9QbzJhc1VS?=
 =?utf-8?B?Nm4yS201ZUZIcEVLV28vOGwvUEpqdkhWMHl5ZHZRb09MZDltRjBWSVdQcU5k?=
 =?utf-8?B?VXFKYTRkQndmVzRYVWVzQmVYZElrcjZqY2tMWXpnRUNTdzlBSnV5R2hIUXor?=
 =?utf-8?B?QndFMWFwanJSd1FqNUJ3Ky9mMUpibks1NWFpVHdJKzl4RVFKYmtPbjR0Y1FL?=
 =?utf-8?B?ZWZyN3RBLzVSS2tSb0JpRDdtMW83NWxnTU9IemluRzBKd2RlQVpPdG1nLzhq?=
 =?utf-8?B?aUNNQUxwV2JoNXlQMVJPV1ZrYTI1K1pVVVBZbThwaXJ6SG1MQVd5MmcwNC9D?=
 =?utf-8?B?aHhEVFd4T0pzWUF0by9KaXFuTDFrZ3M4K29GYWszdUloVGEwTFNpRVk1OHJ4?=
 =?utf-8?B?NjJHU29KbmZqVEdRbU9XeDh5emNaOVZqdVc0dG9RaXljajg4N3QvSFVRNU5o?=
 =?utf-8?B?S3NkcENxVXJ4MDhzRWkzWGRnQUFLaDFzWHJsRFBKRmxvcnhRWXV5VGtoVHhn?=
 =?utf-8?B?cld3SnNHK0toSUdvNnZsV1Z0U2xpL0RtWTd0QWRLZnd5TkRUYks2UFNWMnB6?=
 =?utf-8?B?bEVadzRPK2pJWVZCeWJ0UllRSlNJU211S05adk1NNnM2S2IrdXpYeFJSdG5u?=
 =?utf-8?B?dFhlM0YzdHNWUHRjR1MvRnpZQmJtYURMbzFHWE94blFqTnlmMUpwL1NPQkdI?=
 =?utf-8?B?N1JMTjJBalZSdUZSUEp3RkovcXlEWTEwSXZpRGFzWHdTeE5VZlZodW0zT0JX?=
 =?utf-8?B?MTNKMEo3Z3RSZEh3TSt5S0YrRHFQWnN5czFpQTlmb2xzZVdXZGNENXBsUEVC?=
 =?utf-8?B?SllOT1NkazlJaGk1amxralRVZ1hhTmltVzNKV2tKUlRucHMxSjhsN3FqQnNx?=
 =?utf-8?B?UzhzWG9EZ1B5MWdOVWVXNm91eDlQMDB2dCtxaEQrSEd2MENCeXUxeFRoNFAw?=
 =?utf-8?B?NHBsRGY5cDROVEJObENoVEo2ZDlpODhWbnRqdVJhTHV0d0V4NHhJSytEdGF6?=
 =?utf-8?B?dGt2YkhDMWRwWWY0MUtUcGE1K211NGpWdEpqbjc0b2FqMDQzazM3SE5EejB6?=
 =?utf-8?B?eW5LcFBGVW02MDFqSmlEQWcwZTlNeFFidjJocVV6OW11V0NpbTByeUNJUjlN?=
 =?utf-8?B?bTdaQXFvWHVmY0h0SVdsb2pUclR2VWFDeVU2d0tUZVpyS21tRDdFR2xBeDFL?=
 =?utf-8?Q?zopIiF7muzVDaEg+CQYTj+8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56af2aa1-5d79-4bcb-8cfc-08dd4c2152b9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:26:56.4997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2fQtJ+Ex8yOr136agNktza9Gr02vagzEQzmKmjf5nOYLyHusH0BaE7iplxsaIby156+esvBQdH90kcMDmj6s+o7cunfbrfRcyfOKristCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
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



On 13-02-2025 07:40, Matthew Brost wrote:
> Support for CPU address mirror bindings in SRAM fully in place, enable the
> implementation.
> 
> v3:
>   - s/system allocator/CPU address mirror (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 06b013d1f533..6c9c3f9e307d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3040,12 +3040,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   		u16 pat_index = (*bind_ops)[i].pat_index;
>   		u16 coh_mode;
>   
> -		/* FIXME: Disabling CPU address mirror for now */
> -		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror)) {
> -			err = -EOPNOTSUPP;
> -			goto free_bind_ops;
> -		}

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> -
>   		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
>   				 !xe_vm_in_fault_mode(vm))) {
>   			err = -EINVAL;

