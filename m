Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B470A03F1B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 13:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D041D10E6C7;
	Tue,  7 Jan 2025 12:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GT7WPp9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29A110E24B;
 Tue,  7 Jan 2025 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736252983; x=1767788983;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B5c0yj0/PbRMgSjyB5PEq56yfZa17fGb3wkqL0Uq11U=;
 b=GT7WPp9KY7vnXHg304bS0LNzicbknB7mnqMjtRLg+cTy3p8JF5uZ3QN9
 12srhVaM9ua6lhZSDKHNg45z2zc2I/XLKAsWsDM1PceOcDQYachxQRnbt
 U0iyD7sWG4aNCbJ4G1IbjeqjhOavTZHOlO2ekQc0kg5j3va5nDWeFA8+W
 OddcXfBK0bVj9apuqrVKhabeXMwqMT+M5tE/5FUNtqQkusnwOEH1nmHdo
 HElHTfd0DPdoy1kmXLWYTs38XumzAIKantyAtu24YEQkKUEX3UHI6yyHf
 Yn62L8D4m35u1qg63XZOgJt1x7ecibxy7ZtXS9uE3Nz3LDpTWwMvIlEWE g==;
X-CSE-ConnectionGUID: PIV6FRpOQNq9cS1PXiBAQA==
X-CSE-MsgGUID: F5hsoj/ZSHGgXOlaF870Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36550127"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36550127"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 04:29:43 -0800
X-CSE-ConnectionGUID: aIBJ7fJzRT6vJIgkLzupwQ==
X-CSE-MsgGUID: vtrsN+W1TYCQefNNU8Nb1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="107735043"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 04:29:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 04:29:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 04:29:42 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 04:29:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daxiXDWxb18O6RhHmY4Q5jVsMpY85EHSU7G9Oc2kIQ4VAXiSBIYCMB0ug1dKMRTyjTCCHpbhusNwjIZlN2LSkt+Kyi1alCa7kfr+dVFYWBzVZ3K3/iuCXQ5Ld5MEGFkCh1J12tiYBQHs5dZUu03DzUpaxIrKVqGUoIYe5V8QTe6+hCzpeL3yk3YDPHbOkCwXbdzuoLjxfjj+2PKaK2ne2ZrkjNe+EvITizvu8mLsEngquw3caeug4l+XyuuMpnoS3+ZIrRHP3864ffTGDFghcdPXJWh7yTv90J+U5qW76hVc0plG0FUAnbyH/xc2PrZJb+rRJttxmAQrChTCuoW9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9g9b/EhXjWvNmWKhFqBa5HQIIJO8J3vffcVU7d1/LQ=;
 b=JG0JHRp+9i6N3E3AT5P68HIQMm3kW7BhSIajMfAKK9/rFrdTpXlYK1RAZfxcp37vlKdIv6N3XvmflOiXh43kElgKU/Nup3keTt9Pf2bfIGfYV38gir/1MP9ha/kK4cL4VPXDDE+clrfnWkb8v8ked2Sd0XjP9NKV3uMcNrP05/TLYOgmxyL3OQT4gmKZxvyhvGz8FPVRrPWLMndEN/98Ks8Ya6AQ9OV6hvdIOJoEMDMx/CKoOCxsRFWE6dp03eTUYG1gmdkLSxbPOsfOTyzADmrY1iDp570k0+55qghORufCfjMr6BrFPT09OfzadG+v2HX/DADg//wm32ZsmNMm7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 12:29:31 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 12:29:31 +0000
Message-ID: <92b57a9c-e935-46cf-9b63-59399086e2e6@intel.com>
Date: Tue, 7 Jan 2025 14:28:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/30] drm/xe: Retry BO allocation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-2-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20241217233348.3519726-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0050.eurprd02.prod.outlook.com
 (2603:10a6:802:14::21) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: ff45e901-1544-4176-ba3f-08dd2f16ef9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekZIQXJPTTdjTUg3UlQ3Z2Z3QVFmdjBLcGg4b2N0UENyQXJWckpjdFpWR1J1?=
 =?utf-8?B?Uy9Xc3h1clk2SEpSV0VPaWFmVTJLTVVCSy9UaWJqMExtVHp2NC9kYWtud2VG?=
 =?utf-8?B?ZmxKdktGcmtvUE82b0Rpa0RFYUhydUtTYldVL2w5aWNQTUI0OHBXcGR2Q1E0?=
 =?utf-8?B?cWlPUDlvSGVoajM0cnVXampqaE5vcXZjWGhDYUVndnE5eGJmeEZLcnRBalJn?=
 =?utf-8?B?YjZIQ0Z2bTVMQVc0Z3hmTU1TUHJYa2k2bzZiWm12VnN1OFliT3RLcGgvSjdH?=
 =?utf-8?B?THdVSEtwY3YvSjlIbC96RjlPKzhORWRPejZBQUd6NVhTU2ticUo0TDhqem1D?=
 =?utf-8?B?dUNxNGRmRmlPS2M5amxqaVB3bG5tdlB1aFFIS1dJUDd0elZTaVJ6TWNSTzUy?=
 =?utf-8?B?dEUwVittbzI1WFhVMERRVWxhN0lBclkvSEZ6ZUtpSEwyZU1SdW1PQzlpWTdu?=
 =?utf-8?B?VVJCcUlibWppaGRjVThSS29rMzNDQ05HMW5idVhkTkp0cDdEZ1FNcmxBZ05F?=
 =?utf-8?B?VXZ0R1llWWxPQWlXeEplSVdQTnVXRnNodC9NbXFsUFdlaUdMWGxlRWNmQWRa?=
 =?utf-8?B?WGYrSExMQisybzNkZ0s0K2diTmhXV2c4U3IrRndSbzJONllCbWVTRUxEa0lz?=
 =?utf-8?B?Nk9Ib1B5RmM2Zjk0VzRET25LRXJxSHlDYlBzMk1sektWS0V3RnVUcGRUL0I3?=
 =?utf-8?B?SFJrVjI5RlF5bDI0a3FLUHJLN1duSUtINEtsRElxN2tmSlJNRnU2V2k3MUpX?=
 =?utf-8?B?UFFTbFFJZDBKdlF3NzdWanZacWQwNUxta3BadGJKUUxYT2t3cVdacEtnV2py?=
 =?utf-8?B?MDNDQmxuMGY0TVNvUS9yV2dWZEw1UHQxRFMwWGdBbkVLMlNBMFhmcy9Pb1FZ?=
 =?utf-8?B?cTNSaldydGZGdjRic29uZlcrZWVYNW5SNEg1NzBqSUgvcFF0WCtqMXJNVW5X?=
 =?utf-8?B?NlpKeHZSWjBCWnJMQjBPMDdJbitXOUdHR2cvaVFZc3NBMHZCM0hRV1hQbjdZ?=
 =?utf-8?B?a0ZJcitDSjhyVmdRQTVrNWNBQWtIMUZkcmhuNDQ3dmpnK2N0MXJXcHkrTTM0?=
 =?utf-8?B?RExmTFptS0RGNWVIT2kyY0xhNGZNWWlKNEY4dzdDL3ROelNrT3M0YnNINVlR?=
 =?utf-8?B?WXkwNHQyVUdOSHVmQjNYWGt3dG5Xc1BMaVpJSUp2cWhFaVhMckg2N1pRU0Nl?=
 =?utf-8?B?a2dnTStnZ2xNU21ZYlZISUN3dUg1WmNGd0YzUEtWOExnSUF6VU9zRHluVVZx?=
 =?utf-8?B?Z3dBZk9uTFE0Ukd4NlRYNmxkZ0pIeXV6SUNDK1J1UTZ6RmkxQjVUbms2ek94?=
 =?utf-8?B?L0dXTjd6STNlRkE0OCtXeHR5UXlVQkVKV3YvREdYMDhyUkxpYlhOMVJJbHJE?=
 =?utf-8?B?bW1IZzh3Vi9uN2J6Vm1rMnhMQ2w5ZDNJMzVVMERrYkllRm1Ndm9CemtJS3NF?=
 =?utf-8?B?c01oWHV2U2x4V3ByMCtrbVZJZCszTXpKc3M0VWMwTEsyemtBcjNQS2FKYktQ?=
 =?utf-8?B?TWxBSTZHM2FqaWlPTEZac3FBNlJzMjUyUExNWnBWSm1FZnBwQjlzaDdlYkJh?=
 =?utf-8?B?YUFiWlY0ZEdGQWhWdTJGdHNJMmlqL2NqL0Q5V1NjRmcwN0FKb0k5U0pFaUdw?=
 =?utf-8?B?K0xsYkdoeFF2LzdTSlM1NEY0eVUwUHlPdDVxQTFXRWNnWlU1ZDhxVEhXV3hB?=
 =?utf-8?B?RkhzUTgxM0lDVHJOZjg4Qm9QTGpGT216UFQxZzFGZkFsL3FPUHgya3R5SDBK?=
 =?utf-8?B?NVpscmo1TUJEc0JhV1hkOXVnZzdiT1N0TUNEcWh4bWduN0VNWDVJcVNOQmVS?=
 =?utf-8?B?QzZGenJlMXdUY2VwL3d0M0RBeEJjaWpNMEFDa1hST0JLbmdSYktoSDJkaGtq?=
 =?utf-8?Q?Pfs36TojfuJ34?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUpMSjdtbVRSRmNjejllMEhTeFhMdnhGbE9OcjBaelZvTEROWjNZSmRKUGFm?=
 =?utf-8?B?OUI3a2NvUTJGOVVqcHNkdWtFcHF0c3VCL3BGQTdPSHZ4eXRRbDk5cGxHejRW?=
 =?utf-8?B?TStHYjBUSVhpRzRUZXJxMmY0NG5uN0ovSkhRNTJ5VVh1aUt1YjV2RDF6eEp2?=
 =?utf-8?B?MVJqYjlkSTJUZnpadjVDZjJ5ai9yT2RtRWRveGx1RVd1em1GemZBVnlVVWw2?=
 =?utf-8?B?bFJmMHhqY29uWC85L2c1VG5RVUl3SDJrUFEybEZ5emREWEFpOVJncldCLzB0?=
 =?utf-8?B?NG5WK05GS3dpVld3SzJMTVNoYzVpaFhpRnh3VUp3c2NXQzRTKzVrZVNWeXpS?=
 =?utf-8?B?M1owZzVQQ0dQSURpeXArOTNuOHBIUTZCODhzcnhVWml0S29uQkFaV3FJdkx1?=
 =?utf-8?B?ZnIzREJvZkZEVTlVelpvUHlyZHk4UjlwUk5tS1o0UllpUDFTWXg1YUl0QTlO?=
 =?utf-8?B?UngwUUQ1aDlFOS9Xc3cyR1VEd290UDJ6bkNMbWw4ZnF5K3hwQWZxTy9ZWm81?=
 =?utf-8?B?TVpZNm4yanpBVy9YODh6MTB2N1NTRHpudXpBMW4weEQ0OUdWR0lHQXZqMTA1?=
 =?utf-8?B?dDkyaTMzdGp1UW9rOTdRTFNiMzVoOEc5NEdtWDhQWWRtcHA0MitOc0xZL0Ra?=
 =?utf-8?B?S1ZQNjI3c1oyOUxYamZtdlZNSDFGemIwZ3R3N3RpQVNFQjVWbmdZK0tTc0Jx?=
 =?utf-8?B?UjRKVWN4MFhZOEkxT0VTa1ZkUG5mYmRwNUdkR0V4U05aR0tDeEJ4UHlndkFy?=
 =?utf-8?B?akt3V0VabTJ3WU9VWmZGc0Qyd1Q4WG04RnFHQmJ2aFhNSm9mQ21GODR3bDJT?=
 =?utf-8?B?ZWVMbXIyZWQzQnk3SkhiV3ZWOGwvMzdMY1c3WUFFanUxdGF4WUdkYVV2Y0lU?=
 =?utf-8?B?WVp6aFZZUEdya0FmWVJZRzZGdnE0K3F3cytLTjlMVTUvdnduZTVxdHdWUENn?=
 =?utf-8?B?a2sxY0dpcGZNUTZqaEFHUVJYK0pBdnlmUkVQYnF3NDBXeTJGUDkrSTBHTUt4?=
 =?utf-8?B?YVJ6VXZuZUZSbWxndVdYbG5JUmpSZE52bU5la1ZaNmRHZEhiOHFpRnRnZTl4?=
 =?utf-8?B?VGk5SmxxaTBhVHVCOUYrZDlQM1Vpa3FmR1ZpN0NyRVF2V0xJTzRwdFFxRWJV?=
 =?utf-8?B?QjZ6YUZNUEdKa09KbFVKNDhZNHNYbm9iRHhZQUo5b2Z5NWFhR3RPV1huMVhr?=
 =?utf-8?B?UmhubmdTWVNmRXl3bGtJWFNNejkwbGhrKzdLV1I0aGVNNGliOUsxbGp0TjQ1?=
 =?utf-8?B?SEpMZ2swN0dnUXNucjhFL3o0cm16NjJxakhTUG4wbGpPdVREbGNxQ1diZElk?=
 =?utf-8?B?MFdBU2c4ekd5NG40dGVORFVuMEJVNHNxMVRJOXYyV3hyUlJaWXQ2S0FkRzVM?=
 =?utf-8?B?VmU0Q3VBTnhuUUNSYy8rWkZsZlpjZGY1OXZsdGNpdzRmbnpjdVF2NUhqYWR4?=
 =?utf-8?B?UmdYQyt5TXg5SzRqOHcxL2lmamgzZUpFRE9lN0lic1RNNlNOa1huamRLWUxP?=
 =?utf-8?B?OEgzVEh3UnJ4UnlmUlhPeXZDbDRIZFkzbFRCWnpyYVVBUzJ5WWluZTgrNVdJ?=
 =?utf-8?B?L0pZaVFyYk5MUTBoMjV5QjRscTIyOWJkMnI0bGVnc0tKWG9RRmtqdklyMUNQ?=
 =?utf-8?B?V0RDVWUrTlhFN3B6ZUxFZkpydmtZbHRNZytRWFBNVWtqbGw0bDRVOE1paFF2?=
 =?utf-8?B?Z21wMXZmNjRpMnJJMFE0RHpDUStjWVgyZUNOMWpxZ2dlS3hweWxRbFZscUht?=
 =?utf-8?B?SmxGRlBEQkZaTW5YcGthMkxoekJIQ0ZZZVZ5WHZSb2FRZ1UvUGhZc2lVdTlY?=
 =?utf-8?B?UFd2aUYxVFkzSFAyVldJSkt5dTZyZzloOWdXYm8vVkovaEtnQkdIcEcxMXg1?=
 =?utf-8?B?UFBEaG1QRkhZOWZnTzJaYy9jbDIvbE5QRVN1aG8zM0IvYktLVGRZUURJRTgy?=
 =?utf-8?B?QW1zdS9FeTBNTWdGWjdJdmxMRGlqN2syU3JDaTMzcURJN2dQQ3ZNUlZyZlJX?=
 =?utf-8?B?Y2R6Z2ZwRGZUNU9abFlDMFpLZmsrMlpDTE9oblZOaU1BS0NiZG9pZkl6Qkph?=
 =?utf-8?B?QzJORGEwTkw0SXB0SUUvVU1EZ01WRis2ODZONlFTQ0wyalJhZ2NZZzc0Wisr?=
 =?utf-8?B?UGlpRUg4ZHR5Nnpuc3hLRHhvS3ZJanBqTkdqWjdDa3BTTVU5WjgvRUtwUC9R?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff45e901-1544-4176-ba3f-08dd2f16ef9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 12:29:31.5729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Zud0/z/DpXslhxlg1un7y17eON1Y0DiY6DaqKGN+Rnbu2zQwIvBXFzmD7j19T8NA+f8cQh6JHlSowCRweE2NT4n6wGxbLIu0pxYUmk2krk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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



On 12/18/24 1:33 AM, Matthew Brost wrote:
> TTM doesn't support fair eviction via WW locking, this mitigated in by
> using retry loops in exec and preempt rebind worker. Extend this retry
> loop to BO allocation. Once TTM supports fair eviction this patch can be
> reverted.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e6c896ad5602..a670a0444e03 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2142,6 +2142,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	struct xe_file *xef = to_xe_file(file);
>   	struct drm_xe_gem_create *args = data;
>   	struct xe_vm *vm = NULL;
> +	ktime_t end = 0;
>   	struct xe_bo *bo;
>   	unsigned int bo_flags;
>   	u32 handle;
> @@ -2214,11 +2215,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		vm = xe_vm_lookup(xef, args->vm_id);
>   		if (XE_IOCTL_DBG(xe, !vm))
>   			return -ENOENT;
> +	}
> +
> +retry:
> +	if (vm) {
>   		err = xe_vm_lock(vm, true);
>   		if (err)
>   			goto out_vm;
>   	}
> -
>   	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
>   			       bo_flags);
>   
> @@ -2227,6 +2231,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   
>   	if (IS_ERR(bo)) {
>   		err = PTR_ERR(bo);
> +		if (xe_vm_validate_should_retry(NULL, err, &end))
> +			goto retry;
>   		goto out_vm;
>   	}
>   
looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
