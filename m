Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F069BD0B2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 16:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C50110E00C;
	Tue,  5 Nov 2024 15:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrmACWkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993D310E00C;
 Tue,  5 Nov 2024 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730821089; x=1762357089;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EVy3ALWU8B4y22wD9qR3fIHoZ9LXqEF8FGmObkHIs+Y=;
 b=LrmACWkT01SoRa/+dv538nqI3wUPZ24kBoULdkL/i/xbG3LE4UKfQ2fg
 TU6Lc/uWnta8Rweffdy1rTVyth/5j0Y+vfo2zB3fygJOL/jfYOwEIiJSO
 j/vJKQmDzilIODJGX5XnUOgNpWBG1HblnT9HPyqQiFcJLUOFNtvAXTNcX
 2d2/HDO028UNYi2prhCsaoW4vDE85T3NaoHPWyLEIKkDDNFdU9mjHZnOX
 /ER8wQgetZpGGwCYmi2UYSIFmHXdIIr0/uLa1oKWH/8363LzI0EDfVUh9
 p/mDEyxHL9bG8vQnvLFWt6GJOlAbKU9bf903o79bfJmTt9oHDyiGuLu+8 A==;
X-CSE-ConnectionGUID: FgYQss9QRY6Nzso4B1TJRw==
X-CSE-MsgGUID: cYy28juWQ5eCaN1fB3RBzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="33415903"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="33415903"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 07:38:09 -0800
X-CSE-ConnectionGUID: upOPEi9DRY6aGtmn72fsVg==
X-CSE-MsgGUID: kY9p9gDRTXeve8tJDO10KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114860164"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 07:38:09 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 07:38:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 07:38:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 07:38:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blSJiHxqopJLAI7xksLVd8+1zPL3H13OEfQ2MN6vivea9/7p20WUY8lPruV4dt9Z8eClbfTyEiGpNMYioZi0ihaxxzXMO3K+ccAKFwleYKFcAY2gA7As5TRXQId5u5hGDt1MhionclFx8XO9t4+e1wenbNVLkkLC14Sx36czOEigv9qJv1qJLQtK/TXOrYnjXxwxZDu/R7sQseP58w+VIH3KOUAce861Wk5ySCrM9mN4T4Y/fpy+zmA/IRb5rQGa8ozHgz3Ub0M6ZRQMi4PieDvyp8FsPqgZUtgNo9/KiopfibHcc7fmzwRObSc7Jh6ExfTQJKp4CBHnF8XnO3jCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ6dAQ9YOsLSUDCJvuI/ZH9JoOs+HAcHaqJ1jqpmAX4=;
 b=eVj3nvAxsOq2MaVIc0r2tPeM7u9tt89nZYu3uFc7S5S7RiCPy7kXrWSKW1HYMk/hDx1N/SDH9zag9E5kB4hS+SBorI7MuiK2DkMVSWEP+YLq8OI8FUQWEXsSq+lalCSHKOybyZTTJihLv5XeN2BdhIZf3zUHFd6HqGGB428uh4p0XStMz+Dn9Q4vVZzmWdMVwqK/tNT20sViMEUUIcB9m9xfltWruUozEsXztMz0y/wtnZSYPIICikgffRhxXRG/pWvga0qTaLjH0Kz85jpL5wJbJTfcwED+X1voFPPggzYf0Wta0axM+J/7jrZXy+alBO1fwGAA8AwNHyid5vx4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 15:38:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 15:38:06 +0000
Message-ID: <9339ed5a-bc5e-4329-bf2e-77bd53eae3c3@intel.com>
Date: Tue, 5 Nov 2024 10:38:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/guc: Flush ct receive tasklet during reset
 preparation
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20241030223846.2272374-1-zhanjun.dong@intel.com>
 <d48da820-a9b6-4bf1-95c2-984d900a2700@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <d48da820-a9b6-4bf1-95c2-984d900a2700@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH0PR11MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ebcba6-2648-4aac-5f71-08dcfdafd7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjZhK3krbkE0OFFiOTNqRmZkenBlQStNQ0lPUkU2RlRaZG5tWUpGa2JlRnJt?=
 =?utf-8?B?WXBOU3VtOXRRVDVQMlBYZXhtNWhTQWlZT0JDdHRBOGV4ZEkwb2JUUkxQb3Bi?=
 =?utf-8?B?UFZQemR5cTQ5YjArL256OWE5ak02TmlDclNtTG1kRDBRcUV0MEJrcmlYVkpn?=
 =?utf-8?B?b0MvVndwdnhEbHRFWk9rYVVyQnBPRXRBL3RFMElXZVIveGZJM0ptK1RRWk5R?=
 =?utf-8?B?S1pLNzIzU3NqWXUxNlZMWHZ6TS95eWlYaEdiRWZlM3BUMTBNMGV2T052S3Ew?=
 =?utf-8?B?NWcwZlhKSm1vVVRMOVRRQ2VKcFRnYzQ1Y1J2dWpLMklQWGhXU1Q0c29lOUpG?=
 =?utf-8?B?dG11ZUQ3NE14dG1FMzFsMVpxNDZsZTFOMERja2IzeHZaeEo4ZGJjSlVPSzRL?=
 =?utf-8?B?NU8vc2daZkszb3FQYjIrbDkxME45WUlseDRsM3pnSDRaTnRJSE5pcTYxcG9h?=
 =?utf-8?B?citQWDJTNFU0RGIyZ0hsZUtSamxNSzd1bVZvUGQweUdpR2Vqckk3UFQ0ZGU3?=
 =?utf-8?B?cGE4Lzd1SGcvcmtja3hQMVI1ZlVHRmJ1L3kxRHBwbzFBL2sxdVZrME5icnhh?=
 =?utf-8?B?TVpKK2Exd0orSSs5VlRJc2NWRDIyalZNL2NrR3FyRGVVQjhCY09XSjlndmM5?=
 =?utf-8?B?U240REV4SW5kaEpydXhVcGdUWmtzZkdDK1N5c1dDTWppbzJNUTg5dk84bFQr?=
 =?utf-8?B?MTZ5MzR3eXNnRkpLckNWd1JEL0ZlZ0F1Zmc4NGpIaVhWeThPNGJuQUhWNHQ1?=
 =?utf-8?B?YVJkbGl0K1JvTmlQNjhMcVlDc29WVzlyWlZIdlZuNlNNR2NLRlBteFRFSngz?=
 =?utf-8?B?L0Z3OHZRME9jMlI3Zzh6Q0tBaEZkWjhjZkN1bXJFdXlzYWRMeEhQbU8zWDVE?=
 =?utf-8?B?NWtzd2U1cnh5VUtpRVpJejJOVVp2bGpJNzNkekRIa2srMkJld3Qwd2lBUWlj?=
 =?utf-8?B?QjlnWDhkMWxVMlNkMGhTR2JjWnZQb3BudlhMbyswR2RCMFJmcE9DeCsrTlpk?=
 =?utf-8?B?cm1vWElWOEtmN0NmbVRhTjQyL1ZidE1QK3NnN2JvdzltZzZOOGJQZGwyTk51?=
 =?utf-8?B?QXVveGZhZ3RVZ1ZDK0JpMlJQSDk2ODVGaDVPbmNaQkJQYmFRWnV2eEo5L2xl?=
 =?utf-8?B?YkpaV3JIT01UVGFpbkFSNitwWDRvSE5KdDFCL3BsWVZWODFCWkthc1B3Q2dj?=
 =?utf-8?B?YXRUVFI0cWlCcko3cjQyUTY2Qk56S2drNjExb3IyWXQ2NFgraXZkdEdUVUlm?=
 =?utf-8?B?OSsrOW5RNUROS0VWdTJFc2lhamN1TlEyS0ExWTJwUFhQSVlLN1NEVGJvR1Fk?=
 =?utf-8?B?MCtBaEdtd3NaNUhqb21MNjZleXpKMUxKb3B5SjZRSkdBa0VabjBYekovNy85?=
 =?utf-8?B?azFBdVhiWkVkQzgzK1pUa3NDbHRxZkFYUnN5cElUeXMvUEowUTZkdGRjTE5j?=
 =?utf-8?B?NFZpU1hmbXFhSzBPbDk3b2VSVVRxbnM0NkFMREw4Nld2RWowVTJJQWNiaUx5?=
 =?utf-8?B?RnBSTHFTYjE0MGhnT3VDMDdxcFM0Zk9oaktyZmdVbjM5MTRSdk1KZ244aUJP?=
 =?utf-8?B?UTUwSFdqVXVaRlpDbklib09La2JWQ291eG9kTW9IWnY2V2UzaGxxdWt5am9q?=
 =?utf-8?B?Wms1SVVrWlBXTENaaWFkM25sbVU3SWJnZDFiY0lyZ05CS1UyNDVZaVRWRUd6?=
 =?utf-8?B?ejRqMWlScWdKUG4xTGQxTjh2cnhyLysyeXl1L3lwQVQwNm9ESlBPMDJVeWox?=
 =?utf-8?Q?X80okCAGaYo8BzZuJwSceUTRUnEpF2VrDY/lfA7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0plUnByV241MkhLQUFmZnRQRnlOdXlTR295YjVUdkJYb0FhV2FRQXZtL3V4?=
 =?utf-8?B?NWhpaGJIa050Ulp5eUNIWXdRd3lMaWttbTl6Nzgwc2pSUzRScExERUgwZVp0?=
 =?utf-8?B?Z1pCaFplblVMOTYwMVdRWkN5Nmt2VnNLRGJsZFI0UkJ1VVVUZzJkdWxiOHVN?=
 =?utf-8?B?L2o0eDFhczdJT04vUkpXQ1A2elJCUkh1QUxMa3VDTGsyQWNHMWZZOUZ6RGUv?=
 =?utf-8?B?OVVueVlhK1Vmei9vWEZFRFlnVEl2UTg4VGVTMlBneEhnTG41U0VScjdJY0ww?=
 =?utf-8?B?R21TRlZFR2FVZ3ZCNUxLdmxrelQwemJhN0Z3eUV3VGlJN0JVYkEzenZZeWpH?=
 =?utf-8?B?Y1YzZ1NCd281RW1tY291TjZIMzVWaTdicy95L0VKYm5Jbmo2YU9LT0JuK0t1?=
 =?utf-8?B?K0xZVksrVVpTQnB0WGdESTN0WU42ZW9EcWVVZ09Nd1h0aWxuVXQ2SDNJS3cz?=
 =?utf-8?B?cDJhdGpaZHE2eVRrR0RLVG81bVZ2c3BmVXQ4Z0dteVNXQkFnUG1Wa0s5bmFG?=
 =?utf-8?B?V01vL3NQazNZWnpzNk5zajVFQ0t1SFV4WUN3WTZmWTEvb2tpSmFwS0ZtcjBS?=
 =?utf-8?B?Rk9iMnZkVURpYzY3MXUwSEROenlWR25BdnVYc3cyejZjT01XUWVtd3lJNSt3?=
 =?utf-8?B?MTR2OTFRSTlLbTdEQlVNM3hBd3k2SXFuMHlZYWV5N3lCOUZDQnl5TlBDYU03?=
 =?utf-8?B?QS9lOUVGYUxkUXVPWHVmQ1NCNklRelZnbUQyOVc5QVpMSkR0dFhPa3JFSDB5?=
 =?utf-8?B?L2l4OEw1cnNEb0lxNVRUTnFZaWlOMEpQZ2Q0ekdSb0phT0pXV2YzaU1KUElV?=
 =?utf-8?B?WFVPcHZ5WXJocDRXbEQxMDJ6L3pVUlcvMjNHaXJnWjRPSHBXcHhkZHVLSnVu?=
 =?utf-8?B?dWNoNXdMVURJZk4zWEN0MWoxMkZGTjV6UUVnRllWYzN0NWxBazd5c2RJQjRE?=
 =?utf-8?B?QVRvcXhyZU9LS2crOGxJd1J0UlBHMnoxTHphYmlQckVyZFF1MEFsT1Jra2Nz?=
 =?utf-8?B?T2Z6TGtJR2E2WDBvK01Dd0hVTWI4RDJacjFGcHZZNDd5OE95NmpUVnFENnZJ?=
 =?utf-8?B?UmI1UStpcGlhbk9ZWmZzK2lOY2o5TGpBOENIQ2J2VjMrd1RaTFlVd3BFczUr?=
 =?utf-8?B?bi80K0dOVXJxbStwSnNMdkJNaUNmcWpyZ1pRUDY0bE9UZlJlV1NNdFZ2YTNK?=
 =?utf-8?B?bEtGbXpCUkJCd0hvdkxTSmhBTjQxSXFGY0tuQ3ZjWFExQTNPOHlIaEEzOWgw?=
 =?utf-8?B?aGtCWXVSWnF4QUUydTFoNEFvdTZSWVhqcldjakZrTndXZjdIZjRqTytRWDdn?=
 =?utf-8?B?L01sNDM0VmswOVJBb3l6ZFJMTWNSZWN2TXBpUzY4VTRSVkdVak5ZSUNsd3d0?=
 =?utf-8?B?bWp2L1RnaW1aaFlwdzNWclZHMW1HWEdOZlJzWThzeDRSRHNSQStvcXcrN3Zs?=
 =?utf-8?B?R0lNYVdkZUxKWVV2TDlDTWZ6WWhlR2R4SkVxWjhSTlkzZHZRZURvU3ZHNFZN?=
 =?utf-8?B?QllRMkF5SExBNm5DN3pOMno2NjdHTk53c2JZcVRDdm1DdjBzLzdiUGlvNEVj?=
 =?utf-8?B?dG5EVTdYYklLNUpTcG5kWi9UYklzU3U3TzVpbGxvS0h3YlJDZ2ltZFMzaUtH?=
 =?utf-8?B?M25zL1BkZmEyUG52YTVYc0VTY041NG1aUHFsdUhFQ1QzQlE4b0thRWJaUis1?=
 =?utf-8?B?Ym1pb3d5U3B0dXJtRjM2WmtNUW9VZ3F3aVZaVXZESkFiMHdueVdWdjB3MVhv?=
 =?utf-8?B?d2V0T1JBejc1NHYwYWtJbWtKdThqVHM1RWFTMUdRSHVvRG5NYVgxMXA5STJ2?=
 =?utf-8?B?QTFwb2RORnJiYmdOWXJJTk1HQkNOMWNFcUIwaEt1ZnZjVGdzYjcxbjdVZnF0?=
 =?utf-8?B?TTVkaXlXUVN4WWtXSFBOa3B5RjgxazZVcnp2WGlFS2pQR2NsbzI2TjFZbmYy?=
 =?utf-8?B?cEFRSGNKSlJZOU90OXhVZnAxdTBueXVjbWZRNmdXVnNwZ3VXNW9RVUhqYjhI?=
 =?utf-8?B?dlFPVzgrZ0ZXejFaSUxhbDRkaHpSdnBxNlJoVEEzSjFHS1BVYk05T2ZGSDND?=
 =?utf-8?B?emo3bGxHQzVJU3FvaGZ5bnpJZTNUZ2JyMi9lMmpFcTdsS2w0cUloWllYN2xm?=
 =?utf-8?Q?seCLeQdy/7ofXjCcC5/hVBUb1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ebcba6-2648-4aac-5f71-08dcfdafd7bc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 15:38:06.2177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHzypya1M/7tkkNL2adtJzQdu1ugrgD5LH/dZc9SaLYvF9LyD9EUAazAIetD3EwCcd7oFfpvA7yb1H2m4mF3iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
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



On 2024-11-04 6:20 p.m., Daniele Ceraolo Spurio wrote:
> 
> 
> 
> On 10/30/2024 3:38 PM, Zhanjun Dong wrote:
>> GuC to host communication is interrupt driven, the handling has 3
>> parts: interrupt context, tasklet and request queue worker.
>> During GuC reset prepare, interrupt is disabled before destroy
>> contexts steps start. The IRQ and worker flushed to finish
>> in progress message handling if there are. The tasklet flush is
>> missing, it might causes 2 race conditions:
>> 1. Tasklet runs after IRQ flushed, add request to queue after worker
>> flush started, causes unexpected G2H message request processing,
>> meanwhile, reset prepare code already get the context destroyed.
>> This will causes error reported about bad context state.
>> 2. Tasklet runs after intel_guc_submission_reset_prepare,
>> ct_try_receive_message start to run, while intel_uc_reset_prepare
>> already finished guc sanitize and set ct->enable to false. This will
>> causes warning on incorrect ct->enable state.
>>
>> Add the missing tasklet flush to flush all 3 parts.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/ 
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 9ede6f240d79..353a9167c9a4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1688,6 +1688,10 @@ void intel_guc_submission_reset_prepare(struct 
>> intel_guc *guc)
>>       spin_lock_irq(guc_to_gt(guc)->irq_lock);
>>       spin_unlock_irq(guc_to_gt(guc)->irq_lock);
>> +    /* Flush tasklet */
>> +    tasklet_disable(&guc->ct.receive_tasklet);
>> +    tasklet_enable(&guc->ct.receive_tasklet);
>> +
> 
> It looks like we might have the same problem around suspend/resume, 
> because AFAICS the tasklet is never stopped anywhere except driver 
> unload. Maybe it's worth adding the tasklet disabling/enabling to the 
> interrupt disabling/enabling functions, i.e. guc->interrupts.disable/ 
> enable(), so it's automatically called any time we want to disable GuC 
> interrupts? not a blocker.
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Daniele
> 
Thanks Daniele for review.

I like the idea to put tasklet disabling/enabling to the
 > interrupt disabling/enabling functions. Let me do some investigation 
on suspend/resume workflow and run some test first. It might take some time.
This patch might fix multiple issues, I would like to get it merged 
after we got positive CI.Full result.

Regards,
Zhanjun Dong

>>       guc_flush_submissions(guc);
>>       guc_flush_destroyed_contexts(guc);
>>       flush_work(&guc->ct.requests.worker);
> 

