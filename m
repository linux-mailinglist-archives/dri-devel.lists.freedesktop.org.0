Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E898D2812
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 00:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595F010EA8D;
	Tue, 28 May 2024 22:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZkUhFL4";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A18810EA8D;
 Tue, 28 May 2024 22:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716935804; x=1748471804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xzy8M0lZ8T+tgH75g9HbIL7kInOiiTH1199QGoyB1Z8=;
 b=mZkUhFL4cvbuhrCYtpyAFRfo6fyLPa+A+7mkLZ7wceLszJaCAaL6bymS
 KCyJw1bol00yapYfJS7fdvuS/If5J/aJe9f7E3DfAmoKsJOHkcbkbvNGR
 pN4Oqz8M00+pt15RKkl+HZnuLuV85/E10Pn8oRWR6KjuXRiS9CCCZjWL8
 AhtEPSP6CaB3lRDOGn1iCcJXtUSwWZWQHcQLN8L3dSVNwgjArOrG2yMQP
 AkfMY+3oIWkKcBRh1lFZmAO12WEjclfKiQWges75mdBFQHtNBbMJWFJfL
 bDGENY5GnfYKD6Za+5DmYY9/mHv6hlkIPhxCh5gcQ9F4u4QOQh1yPpSIq A==;
X-CSE-ConnectionGUID: IdzX8jslTXO76DXWRTglcQ==
X-CSE-MsgGUID: v7kcyprISyiPmxCJnhL1UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35835567"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35835567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 15:36:43 -0700
X-CSE-ConnectionGUID: BmThKTcxTJWzW3dxf2s0FQ==
X-CSE-MsgGUID: FSFSvYlMT1KmZhtV6iYqdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39666243"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 15:36:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 15:36:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 15:36:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 15:36:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX4Q866ZDEJ6dYvjDgmnmcdAi8jT3RSJrehp4erv0GqPOtk0MlSsbeC94OyfKAdjuzf9AIftFonCqGl4rArmr2R1eBZ6aTyU34E1g46S0H5KpkY49orPW7231suV15aOFqgK9mgU2O8Jz/74xTpwOnf3+uzgKQiOUGNPhztAxYb2OV/K+SVhIWb6ZEshUZeX2EZ6D0V4z6FlpCIYDRFRzmFNEsBeyaIVSXRuDAMcHsoUsYdoBzbmFgLtwD2uT1IExy0YnRokQeXQk9k+mQOKwMr1PufpbxBB+pQzndHMTa4JK3ol9TVO9ltLFNRoEGbKLdzrhs17gu1ALACDEtpAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ob75ErG9XvvR8vZsLdNzMSlt9CCzOEXEbRvs2Pu3FI=;
 b=B4UQBULHNlKBiyC6qLpCKGGP2Hu7Bp7xaiYY3U9RgWFMus4mOUTC+J98lRS54NrYog4u7mdO3ZAODWlSLuZ/ha895PSB5fNxSkDzglqw9wt3Lq+3xDZpCe5YLHbYvqGcLN17VBOmrq6Fs0W4j9U1ROiQUHtgPqB8r+g4MkiBIr7m6CQWzWzs7HoHVg5k7euglxVrg/2yiKs8gCU7ZJqqKwTFXBAsle1FSDo6AR7T5caPoEXzB4HAcYg/c8i50EFE5+nyHlqUsOvdoOhA5yIiA9j3AwGpeAwkLBkvrpeko9QqUyDhiWQOHxn3UI0hUi4Z6yAv1NATZ8LEfQf/MDbrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Tue, 28 May
 2024 22:36:40 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 22:36:40 +0000
Message-ID: <20564b94-7bf9-4362-ad6b-b9b9b6e79588@intel.com>
Date: Tue, 28 May 2024 15:36:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Enable w/a 14019882105 for DG2 and MTL
To: Matt Roper <matthew.d.roper@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>
References: <20240525014121.4157254-1-John.C.Harrison@Intel.com>
 <20240528202110.GE4990@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240528202110.GE4990@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: f368122f-4c68-459a-d33f-08dc7f66a474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHh5TUNscWRFMTVJUnN3bFNINGdJQ2o0cHlZMDlDOTR3Vm1rR3oyWXBLRUk4?=
 =?utf-8?B?M2RZUUIzN1duN3Z3Qk40Q2xDa2NOS0h2U1JUdURER1ZlZnJmUHdKeXRQaDBi?=
 =?utf-8?B?ZmJGSGhDU0R0YjMxSnpLN2pxVmhFVGRudWxXUjV4WUduaXVjOS9sZ2syTWxs?=
 =?utf-8?B?bnVWSVJKRDFmcU4xSmFQK3l3OXV6QjhsQTFsR1kwcTkrMmVtNlkyYXJaTElT?=
 =?utf-8?B?U2RjUk12VmkvRnRLZFVodGQ3ZEROQUtyUXVCVlM1VzJHd3R2VzNtejZQUTl5?=
 =?utf-8?B?Z0llZjBCZkFBTUo1YmFWUUJPMDJZTFlIcE95cHJRM3IzZS9mUy82WGpZZlB4?=
 =?utf-8?B?SWNVVlNMeU5yNGdJSUFWbldDRUlkV0xIVmJUS1hpamYxZ3J0c2VWdzlPRWVB?=
 =?utf-8?B?YUp0SXhIR0w5SHZpZmE2OUVEYVdMaVZxa0M5cFVZUGk5Vzk1bU1WYTNONjJp?=
 =?utf-8?B?dlBOekU4cUZybkF5VFRySEtTRDhabW9GaVN1blArWHp1K3JyOHExOFp6MW51?=
 =?utf-8?B?cjJYcXUwZTF4aVBwZDU0c25MY2krNkxNRzZwOEZTS2lDN3RxaXBtSktWbWEv?=
 =?utf-8?B?MU5YSmpNYWNvWlVDSTU3QVBaR3NqOER0N2Q2N1dyeTBHUFN1ZGJEaTVFQmh6?=
 =?utf-8?B?TUFYWFBuWVRPNUo3cmp6ZE9RdE1raDNSU3dkNUxYLy9FdlQ4L09KbXl1OVA4?=
 =?utf-8?B?ZEtSNFcvbDg4SVNMNUc3alNnN0p2L0pKSjlWanY1VkdPVzNwZFhxa1Q2emw5?=
 =?utf-8?B?ZEltSWdrZndQVXQ0cDlkcjQ0UlZ6S0Ixd2JyRzVxRUR4SW4xRXJqZ0pLRktT?=
 =?utf-8?B?UEdsS2UvMS93ZEMyS0V2djVWa3o1cHJoZ2hzR0ViUTdJdVZ6YzliTGZCVHVa?=
 =?utf-8?B?cDF0dXV0dy9mejExTFd3MXFTbTFHZDRYR2t4K1VuK2QrdnI2ZHhQS01STEh2?=
 =?utf-8?B?NXpLR21mNnFkTjFLQ0RhcStWbXk4bDNBeUlyVzFHSnFWcENsaGVRQzZOYmI2?=
 =?utf-8?B?ZnZCSHIvOGFsME1Nb0pONlg0Y0ZTbTRQWUxRL3lCaHgwaVR0ZXVRTTZEOThp?=
 =?utf-8?B?TDNrYUc1K3daMFdLWVplQmlEMnhiY0tIVCt6bzBkRFM5eDBGQlRJdThoZ0FJ?=
 =?utf-8?B?Wno5Wk9UcGxLdjRvUWVZL3dRVUExcVNsUi82d002SzI4MHF2T3BEYjduNUF3?=
 =?utf-8?B?VmpINXhnZTVtVkVkcG52ZjFLeU9VNWFhNGdMWldINEV3NzJ3V0ZkeUdOWUwr?=
 =?utf-8?B?UnUyWC8vaXBEZ28wRGlqMCthSmZXbFozVDY5Vk1CZXFZLzJtYWhWUWpzQ09Y?=
 =?utf-8?B?UTBMYmFsUm9BdGJseEt5Z244OEx2VGxGWFZDcit2aVBsMVIrZUVpaktRdzIy?=
 =?utf-8?B?Y2t4a2lLSzNUVStFb3FFRmt5K2dsTlNtTmFRNWdGdUF4YndXTlhHMUY3S3pm?=
 =?utf-8?B?b21xQk14TzNhbW9oN2VJcXRSZzBITFg1cVZrajF0azFzMUlISWFFWjJLc0pR?=
 =?utf-8?B?Y1dMNk9xcE1RTnh1UDVBbW9ycGs0c2g3ZnJiMW9QeFBLTUxOZzVKb0s1elY0?=
 =?utf-8?B?OTNqVXZGLzFKT1MxK2JaQ1ZMbURKdUtwUzd5TVlzSkZEeEpNWGZBOHBMSzRt?=
 =?utf-8?B?eFFQKzZKS0s0bUNhalVSbk5tZlRmblVOYXNHcldlTnk1Q1JBdXp4NGZnZmMr?=
 =?utf-8?B?WXRFSzk3OVRoTlorM1BVUTFhMndTdCt0MHhWSVBuNnk4MWVMR3VuNlNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDAxSlVTN1dxeW53ZFZobFQyMytRUzZpR2Z3QWR4N1ZJRUllSWZjczhIUmxO?=
 =?utf-8?B?OXNZeUFEV0ZuaVBPUnNTYkNxTkQ4cUt2Uk5EaURML0x4ZUNqVXJsL0xjTVlv?=
 =?utf-8?B?OVZOM3JFdVhtYVlMYktQbzVPRllLUW1xZGtRUDZ0R0dmRTNhc2hRSGFRbUVs?=
 =?utf-8?B?L1dXWlhrVTE0d0tOUjc5eTFlMmJWeE1oWHVlS0pPcDVjQ1dvbW4yRTU5VkxK?=
 =?utf-8?B?QUdtOUR4ejFsdEVha1MyYTdKOWJDWEJNdjhhdzNnM1I5cnVIbjJlOFM0ZzB4?=
 =?utf-8?B?THdTUEtPb05XaHljWWxPc2luZEVDZS9lcnE3UzMxaTZ4RlVlMzZpcXJvZnVS?=
 =?utf-8?B?c3FGQ1lLQUZ0K2M2U01WNm5QK3hOVFBtOGZkNDVDU3lNaVlObUxRSGpKcDVU?=
 =?utf-8?B?eGFIa1RtSzRxQ1VoeDRQYTVqMWJhdS9MQ0ZsYnZ2YTA2M1U3RG8zMUNock14?=
 =?utf-8?B?ZnZWcnpvYUZscFcrZFhZWUMwcTFQcGRGZUJLT3VUQjhNWG5Jb1dXcGZ3WVN3?=
 =?utf-8?B?ZFpsYVZMVFBQNnIxS25VWlkyTy9Vd3FaL3dtSjF0ZjFBSHk2eld6bTA4MHNC?=
 =?utf-8?B?WWw3SXpQRURZeHFSREZTM3dtS0M4cE9ibk0vUmZNOVZaeWV0TFZrVXZmb3c2?=
 =?utf-8?B?U1R3ZVRTNjZWdVBiaDlKQ2k3MGRJN3JZbTYyUGg3QldNL2VEOEx5R3VYYmpT?=
 =?utf-8?B?KzVSZ1BsdFg4N3oyRDJQcU9lT0NPdFJNdDdJYlpiVFFvQTBTYzQyQ0c1b0ZG?=
 =?utf-8?B?c2V4bHlodjBKMTd0ZXM2c3J0VllWdEVaK1ZiaXk1SjJRci84d2dLZDBFYlBx?=
 =?utf-8?B?bGNJWTMwZXowSWdLQVJnR0FYOWtJbjhwNVF1ejRnUFdUT1c1V0FrdEx2NXB1?=
 =?utf-8?B?SU1ScVRxMDUzQ2ZhL3ZWTFBlZ3k4dUovbHArNjltaHJ2dlEwSHRrV1hxc09I?=
 =?utf-8?B?UlpBNGRTZENZRjMzQzh3MzFJcEdwNTI3dkZtTHhOd01WeWNyQklJNEFBck4r?=
 =?utf-8?B?Q3Rid2xLaVNFeWdjakdWNUswNVNwcndWck9xa1lkWFJsQ2pNZW1IVWVuWFd4?=
 =?utf-8?B?SEIyWlZ1SWRpNGVxT1AxMk1BdG9UWjhkUG9JQVhHNlNXNWVoUTJNeTdYblVm?=
 =?utf-8?B?ZEQ1bktlNnFnN0R1ZG5MY09DWW92aWlqcElKNTJWY0NXS0xXaGpicnNzdEcw?=
 =?utf-8?B?NWNQY2pRMjFxcUJxQ3Vzc0ZEenczMG5JK3kzZjNEZGFsc3U5dXAvZjdQZHlo?=
 =?utf-8?B?d29iLy8vU3FlYmsrZ1FZa2dXN2ZSUGsxcEZwbjNwK1lhTXFOamM5K1p5cFVk?=
 =?utf-8?B?SjJKRVNZcHAxMVF0NHlyQzJJNk1UUjJjVjJlSWJaZVBXWE9FdjNEL2ZnQ0pj?=
 =?utf-8?B?L3ZXaFN0UStzRGJqc1ByNXBHQUIxOUU2YStNRmRsZlJIMDdDNG4wdDVZWnc1?=
 =?utf-8?B?Ums1NHpqcEM3d0J1OUxBQnJoS2hXODVUMk9NNDU0ZTd5M1d6TlhnenRJTjNG?=
 =?utf-8?B?RldpcHliQ04xMEFKSW1TTHZlakRqU1pnS2ZjcE9Qcy9iQisvMmsydTU1c1JC?=
 =?utf-8?B?VmhQNVdYVDNMVG1YWllYeEtOZ2RMY1pYNlk1d0h5ejFWbitBVkJ1SWNqTEJD?=
 =?utf-8?B?anJlSHNDeW1XZWJBNkR1THZkQkpmY0J6NldlWldyZGRPcVBFdjkwTmdFN3Av?=
 =?utf-8?B?MCtpakdiWHI2OHpsc0lXc013QmVwTVd2Y2tPLzY2K0x3WUZVeFdSVWNka0xG?=
 =?utf-8?B?RkkweE9VNkxkM2RuTEIrRjltSkduNDhIcDhLb0YrdTZUaTQva1JLOWoxSUlD?=
 =?utf-8?B?dVJQTmk0Z0RicENHY2VDL0FwQUhJVDdVM1h2VE5Pc3Uzc3paRXIyRGdvWlVi?=
 =?utf-8?B?ZDJSSEpqc3BWbjFVTzJWVXZ5R2k5Y1dGOU9lV0pTSjNVdks2ZlYrLzQwQUxX?=
 =?utf-8?B?SFdyekw4dWcxNngwdE5Pb2cvS0NvUmhoSU9vVVViekFrUEVJM2hyY09PcjhU?=
 =?utf-8?B?dy85WTRZK09xWUlYaExZNmRUbTNqTXliZVd4VWR4UFNvWFBZeFdxOWIzRjlJ?=
 =?utf-8?B?WFpFelMvWmlsdWZhRzVVenp4MDRyYUN6dTJSWkh5SHovbEliYUR3dWJ3QUtB?=
 =?utf-8?B?MjdzTE5NWXBENzNrUFVvTXFUV1MvMVBpdkRNaTBJTEsvNmY4VERiK0xVUGJp?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f368122f-4c68-459a-d33f-08dc7f66a474
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 22:36:40.5750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqNyiSHTF6pVonSgpiBtxkEKFV0GMQHsLR4okWJmU6K0svcQd13GMe11KXUDr3AA8WWO+tc0Wasla6OsQET2z38wSlv6opPIgBzAUfzfHww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
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

On 5/28/2024 13:21, Matt Roper wrote:
> On Fri, May 24, 2024 at 06:41:20PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Enable another workaround that is implemented inside the GuC.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 32 ++++++++++++-------
>>   2 files changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> index 525587cfe1af9..37ff539a6963d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> @@ -106,6 +106,7 @@ enum {
>>    */
>>   enum {
>>   	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
>> +	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED		= 0x9002,
>>   };
>>   
>>   #endif /* _ABI_GUC_KLVS_ABI_H */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> index c606bb5e3b7b0..6c382785bc60b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> @@ -815,23 +815,23 @@ guc_capture_prep_lists(struct intel_guc *guc)
>>   	return PAGE_ALIGN(total_size);
>>   }
>>   
>> -/* Wa_14019159160 */
>> -static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
>> +static void guc_waklv_enable_simple(struct intel_guc *guc,
>> +				    u32 klv_id, u32 *offset, u32 *remain)
>>   {
>>   	u32 size;
>>   	u32 klv_entry[] = {
>>   		/* 16:16 key/length */
>> -		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
>> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>   		FIELD_PREP(GUC_KLV_0_LEN, 0),
>>   		/* 0 dwords data */
>>   	};
>>   
>>   	size = sizeof(klv_entry);
>> -	GEM_BUG_ON(remain < size);
>> +	GEM_BUG_ON(*remain < size);
>>   
>> -	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
>> -
>> -	return size;
>> +	iosys_map_memcpy_to(&guc->ads_map, *offset, klv_entry, size);
>> +	*offset += size;
>> +	*remain -= size;
>>   }
>>   
>>   static void guc_waklv_init(struct intel_guc *guc)
>> @@ -850,11 +850,19 @@ static void guc_waklv_init(struct intel_guc *guc)
>>   	remain = guc_ads_waklv_size(guc);
>>   
>>   	/* Wa_14019159160 */
>> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
>> -		size = guc_waklv_ra_mode(guc, offset, remain);
>> -		offset += size;
>> -		remain -= size;
>> -	}
>> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
>> +		guc_waklv_enable_simple(guc,
>> +					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE,
>> +					&offset, &remain);
>> +
>> +	/* Wa_14019882105 */
> Is this the right number?  When I look up Wa_14019882105 in the
> workaround database, it only lists it as being relevant to A steppings
> of G:20.04.  I don't see entries for 12.70/12.71.  Did it go by a
> different lineage number on the older platforms?
Argh. Copied the wrong number. 2105 is the Xe version, the Gen12 version 
is 16021333562. I think it is two separate actual issues, hence two 
different w/a numbers, but the w/a itself is the same for both. Hmm, 
looks ike 3562 should also be enabled for 12.74. Not sure how I missed 
that, unless that is a recent update?

>
> Also, I notice the Wa_14019159160 we had just above this workaround is
> missing handling for graphics version 12.74.
12.74 is ARL? I think extending that is on my todo list as well. I have 
just been leaving updates to 160 until later because that one is 
horrific. It needs extending to DG2 as well but a whole bunch of tests 
start to fail when it is enabled because they need to be re-written to 
cope with the broken hardware.

John.

>
>
> Matt
>
>> +	if ((GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 21, 1)) &&
>> +	    (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) ||
>> +	     IS_MEDIA_GT_IP_RANGE(gt, IP_VER(13, 0), IP_VER(13, 0)) ||
>> +	     IS_DG2(gt->i915)))
>> +		guc_waklv_enable_simple(guc,
>> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>> +					&offset, &remain);
>>   
>>   	size = guc_ads_waklv_size(guc) - remain;
>>   	if (!size)
>> -- 
>> 2.43.2
>>

