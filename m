Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB2A22CD5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 13:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD30B10E94A;
	Thu, 30 Jan 2025 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ta5Pk1HT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99A810E93E;
 Thu, 30 Jan 2025 12:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD3WRPMdWFRQrD7vlynhNvqe5eVACKkL5lFmuVPFPP8+1cDJKUSrRSnqfORMq4OkdDJAP9DB+lQ+cV6aFXXFXW1dpN5fWbY3ky8c7gCtsuItyR/a4u9o/I7CAoKxsF4VMOY3N9e3zYjyBjouszkH+E78FUT8YtxV0as7grbAsQmk/AeFI1yTwnUrkWWAh0BrrZ1YplVcFO6eRgdOw9xBF2Ib8AMn9wxay3L+Qo2xB4+8DUIddLb/LLmTvgpwYSaQtHwxgMEnCzj0i76PM80v5imfX34vHP7H8/IH778ZY05SYrEr7liRGrw8IQdpOFRvRMW+sqJyjm7RbxHz8S5O0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xavSCauqLCPOEXTYOFx6FcUgJkzv6+mQjKKLs+Hm2Uo=;
 b=mH2uUpl1Uc1Gi7RQ0mplTyP7DJIppEBVGbnSXmfiym3x/GYPfpZxt6ddHknWegP8fTqG1uNHh3wzDfyiaag96dMXUTRfAv3ZIPGTMjfhOF2rbrvSVS7/OlyrCaZXqt8P6vwVH8SRpD/BpYh8I2IL2qMcfzI9jtu9yqCg4tPgGbhqDOLbOsDrQNg/4XATF76xDLXSdj0dH5BTaM72nVTStN1h6e2n7XqrH2zXx8OtyFnUHd+Gzw+ZvzfaH2BagOOPUYLfu2Hvt8pfP+0EFQFI9qJRpQq04i6EpieHrb7TrT9fhGYz8BaSN+eeW9OOQQoUF3eqYns9Ke6qTYBHLka+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xavSCauqLCPOEXTYOFx6FcUgJkzv6+mQjKKLs+Hm2Uo=;
 b=Ta5Pk1HTGAA2nBtznYkL4ylYr5RTIwERc0j1CR5hSDb4O8AR+a7fbkeIY40QDYsV7qiEGPDde0p8xH+4+o14LrY+wdxBB4bMCxAAZVgnSm1/36VqMUQDunmpwkRLDH8g8bVvVZ3rezM3Lng02Wp7InDSX7d9nNFuYDdkSaCLtTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 12:09:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 12:09:06 +0000
Content-Type: multipart/alternative;
 boundary="------------fsWGnDq8l9uompi4GkhneprX"
Message-ID: <f2f8bdc4-d803-41f1-931d-d9a68273fa70@amd.com>
Date: Thu, 30 Jan 2025 13:09:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
 <2eadfcd7-5cbd-4f3c-86aa-7e5a50df01d8@amd.com>
 <173813781464.9444.9979122540723604978@jlahtine-mobl.ger.corp.intel.com>
 <39142118-2f55-4ecb-bc7b-50705afaf4c8@amd.com>
 <173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com>
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: ad617cae-aead-462f-61d3-08dd4126e4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWZpczFpVHBHTkw3ZHpOMHVUNE1kWG8vRFFCMUE0S1dPZnpLRkoybjZaY3F1?=
 =?utf-8?B?NzBSVGhLVDltbGMyd2srY2dabElTeklLcEp5U3ZWNm93NnlSK1R5djg2UitS?=
 =?utf-8?B?OW9KSlBpRXh3QVlaVk5zc2pOMnVqTmc5QmFUY2Q1ZDUxTVJGTWkySWEzQ0xE?=
 =?utf-8?B?WW5FMnBITEFwbC9rQ3VsK2NwWW5kRThQWXVsVkVkeFN0cC9HenEySVV6aXRk?=
 =?utf-8?B?a293K1pqK1BRZkM3Rm5DWEZHaGpMb2Z5dS91NlV5bWtLNHAwUHhhSEVSeXZm?=
 =?utf-8?B?dkdUbWp1dElOTmpyU1ZpWUlKY1czM3QwYnFDbEF0QVZ5TDhiY0tkNzJ2ODBD?=
 =?utf-8?B?WFFBeEVFdERnRmt6K0R1dS9ZNENQZVZUS25ibFg5V0JoYkVYdFJxdXVJNnU4?=
 =?utf-8?B?RGdPRTRjS05lVkRheFJTbnFSUXQvR0loR1hYVnhpNWFiVkNoM3B3alRBL1E5?=
 =?utf-8?B?YVF6ekJCY0Z6K1QvaXM4WHF4UDEyMnJrM0JHS0lmckNscUNzUGkzNkRNcHJ1?=
 =?utf-8?B?MXlUbDRzNnFSblJLTjczRHBjT0VYMlArT1JObXFzOS95U0dDYWs0d3BIclEy?=
 =?utf-8?B?N2J2cmZ5MGhIOWhKMG0xODc1b004WCswNTRNenQyd3ZOZmYzWGdFd1V3UjdN?=
 =?utf-8?B?d1QwT0Nwdlh2UWZLbmp6aFpXWmlPcXpEeU1rRkZhdTRjejFjSkh0UEtpMWw4?=
 =?utf-8?B?bWxXRFJBV2NsQTBKeEhTcVBXNG5ZbmJHcmIyWHlTMUNoQzY4M2dsY1lhN3lv?=
 =?utf-8?B?eDlHOTlabSswWERQSGZ0cU1BaHNBZCtyVmJuMEZxdjJrMGJLdE1FQXM1YU5Z?=
 =?utf-8?B?aEVYQTVmMTdwZzBtcWtKUEtXQ1hVTEtWMFVNbytYN3NwekQ2alJ5UWJWcWZR?=
 =?utf-8?B?aDMzY3Z2K2s5Mm1mWlQzMnViZXlOZlhNcXZZK0JBTTNuLzd0anRXRjVWbEI0?=
 =?utf-8?B?ZEl5UWlKNDhwWEtQWEE4ZU15dXFHVExEQ3k5MHI2bW9XL1VqcWtWOU14UGor?=
 =?utf-8?B?d0ZlS3NpVVRuOUV5ODQwNTdNRGFBelVXS2RkeXRJTkNYZkVVRWlZUnVKemd2?=
 =?utf-8?B?aUFrK0dEZ3NOQ1J4cXpsZVhCcVlDZVpVSDE1bE1pR1JreVFoVFJxWXQvMDZz?=
 =?utf-8?B?QVpsclZITy9TZ3JsTkpoV29IS294MlM2RUY4bEhFMjBsdUhMQVFKY0dvbng0?=
 =?utf-8?B?N3pKSGNQZHdpeUdDdUtpd1UrMzdRd2hsZ2Fxam54eXkvaUd6UFlOMm9QL0Y2?=
 =?utf-8?B?SDVkalVsTHZyT3VjTGJwSml6a0pxN2JCR2JjZ2JXajVSaU1PNnFtYjk4dHFz?=
 =?utf-8?B?cTB6WVBmVVpQMmtRWnlWMURYWk9XWWdPWFF6aFFNb1lvNmY0NnBGL1FhVE9Y?=
 =?utf-8?B?ZFdrMnlQMnNkSS9tbkxOc2wyMi9sWExQdlhzNVpBcW9RbEhFbXhuT0VneFRD?=
 =?utf-8?B?NFQxUWIxYXJCbC9NZG5VaHkyeTlySmNKczhQaFYyTkQ2RzVWNkVyOUt1alk2?=
 =?utf-8?B?TjRHTGhETXV2UnBpUFRhQ1dpOXdPVnpsRmYyempGOVBVenU2eXQwbXR0T1ow?=
 =?utf-8?B?c2I1VnVpelZ5cFZjR0w4enMra0RwK2xFVCtJcG9OVFVYREQrdm84REhxUnd1?=
 =?utf-8?B?OXlLckJQY3R2QmlueWUyVEwrZ2lCVEN0OVhVYzU4OTVBOUxFQmVTQ1JuTXpF?=
 =?utf-8?B?OGZGMWxHWmllZDJudzc2ck83bVlUTTZMdzNaUHdjK213Q2xZOXVRTVdsN0xK?=
 =?utf-8?B?UkhZc3VTRDVQSlJTOUw1cXB4b0pVMC9YVFdzNnJRL05kb0hBMkZCakpmZVFw?=
 =?utf-8?B?eXVBMkF1czNmMVNRaU03dUVQSnozTHdmZktNbmR1L0tBT1ZscW5nTW14ajVt?=
 =?utf-8?Q?t9NE5zWzheORT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZwNE9qNEpkSTVRSG9HWUNTcnBuU0hxZXdqcytXK0JCRDdadkZRWTFwWTZr?=
 =?utf-8?B?dGtzRXIzRlU0bXI5V1JsYmQ2ZnZCbzlYdldIRkdtNWZ0UnNCV012djVJZVFs?=
 =?utf-8?B?bDFEUm1QQW96UXQ5ekN5bGI3bXNWaCs3WUtES0hza3h2bEszR3NpanoxZ0Vm?=
 =?utf-8?B?Z1RlS3oyWW5Fb1FleG8xNzVvNmFqMXYwVUxIK0ZqdWQ3MEp3R3JmVFIwcVkr?=
 =?utf-8?B?Q2dPNHNWeFRoREtKeVRDU1kzamdEYUEwTEdjQ0VmRkZVTTdyL1d0YWJneXdX?=
 =?utf-8?B?TGp0LzNxL1k1QlhYZnN4SFMzcXNMNnFCejlEdGJzU1lFMTdDQWJOZDZsdkEv?=
 =?utf-8?B?ek9iWlZldkxMK0R6ZHZPVm54dVpYbW5NSTVpVEJ3NEV3WklEaTFtcHA5b2Fo?=
 =?utf-8?B?UXBBdzR0aVMwRm11dVJCWHBaV3BSV2QwTFVzSzNxOHI5TS9oRlBxMW8wU1Mw?=
 =?utf-8?B?WVA2NFNLSGpycjFUWXVYVmxaeEJBYVBLWm95SWJEZ2YzQnN3WkgvdXpGcTFT?=
 =?utf-8?B?ZkE2YmhGZWFmdkxZT3lTZFZEWnkycXNrT25tY3AvdzJYTWV3RENTVHhnY1dz?=
 =?utf-8?B?UGh0cm5qR3VIQmRsTTdzTW82Q1lHTzBQWUh3eHMzblJSanhKSW5mVzI0QkRO?=
 =?utf-8?B?d2RJaDJXUzU4YTliVlFEVXlwLzdmSkxSSUZSb2VPUGJSQWZzeXY0TG5xaG91?=
 =?utf-8?B?cVMrS0RqbFlTbjlrcm9JNjBlNzlxSzh5VURYaEVQVDNVbisxWUN5RUVjNXF1?=
 =?utf-8?B?c2RBckRVUktBelY2SnlDT25jYUl0S3hJN2ZKSjNkemN5d21nUzU2NUdXbk0y?=
 =?utf-8?B?cWdwdllxR21ES3JUU3djTlhVTGwrK2pHWEliWk9XVVJEb0kwU3p3MWpvYitZ?=
 =?utf-8?B?MmZrMWdQYUp5dTNhQUNQYmpNd1V6RG4yWXlWNGZpMHVhMkxBNWM3V0JlamE0?=
 =?utf-8?B?OWNtUGZtNHNMRHNzd0lIdktYZVhTQytvM0RGVVlEbFRmN1ZsRWRaRHFEaFJ1?=
 =?utf-8?B?Z0UvZktSR1ZBeE8vTFIzZjJWSXp5NHRjOWZkVVFiTk42eE5qSnFzOG54S3kz?=
 =?utf-8?B?SUp4MDk5Qm83VkZFN0lTZHh0bVpmeERFQXVMVWVMZWROY2pacy9mVVlMemQ2?=
 =?utf-8?B?V00zbW9SVUdNS1ZhejJOZEN4aDJxeExaUXRNK2R4TzBsNS9uY3pKQXRmTEZw?=
 =?utf-8?B?QTFyZGd2SmMvT1laMGFVZFZyYUtnc012MmRWRjZMc1dERUw1WW1XZi9yN25k?=
 =?utf-8?B?R1dlRHRmYzIrUGRVc1dmc1ZIQTgyK0MycFAwamxiMDMyL0ZpeGtRUHovZmRa?=
 =?utf-8?B?N1c0b3FPOGVvNEJvWUE0UWtNN3hiUmhCeXlscWVWQ0JZOStKR0htNHBiVy96?=
 =?utf-8?B?aGw0czQ5RTRpcDZwMm5tTEdzK292Mk40Vmt5MlpCaXpHdDhaMU0rdGRHdjNB?=
 =?utf-8?B?aTVXb3lGYlA1ZjJUZXloMDVTWE11QzN5KzR5S0lLUUtLZWlpeU1NaHUwVUYz?=
 =?utf-8?B?L21QZmYzd1BvUjU4YVRNQmtxYVN4K1l5WVlzT0xrY1pkMFBobDZWVHF4cjE5?=
 =?utf-8?B?OEdQZ29pNmlrVFduZVFyakwyeDdHVktqYkRMNzRaclplSm1QNVQ0OEUxZmJm?=
 =?utf-8?B?SUZzNTkwb2U5U25NSUJxSUJYS0JiVjBQQkZkRzlNSE56K29qZGpyb1UwdytK?=
 =?utf-8?B?K0RCcFlnY1kvSmVCZFpTdXp1Mi96S2RuTWdjeFJMOVJRSFdvOC9jQnpvUUJ0?=
 =?utf-8?B?UVVjQnJCWDAraGZGR2d3RjBmM3dzenhnVDN5aERESHRFSDc1YTQ1blJMTEh5?=
 =?utf-8?B?bWFjUkRvSUpiY0U2RTIxajZQc09tYkJhWU82L3dTMkFVRGlrcEg0ZFlxTTl6?=
 =?utf-8?B?SnI0aGxZV3p0ZTRYTUlZWlFBTDRaT0JIOGEwT3pTMGoyclVaR0lGckJWeFNQ?=
 =?utf-8?B?MVdWa2pUeDBnbk4wYXYrZjdldHJwZ1hmK3dna3pCVFJ5RHNveXNDc1czRStM?=
 =?utf-8?B?Y3BtclpqMG8yRGd0WkYwdHFjbjBVMEZzZXRmMTY3dTdaYXoveEJCU294R29D?=
 =?utf-8?B?QmZobTBCTzFtKzlTMXJBYWVhVTNFRUZWd2NaNzJJd1paTXJua1U2K3RUQmdv?=
 =?utf-8?Q?8hjcFEgyw9NyK7szcPVHDRgkq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad617cae-aead-462f-61d3-08dd4126e4e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 12:09:06.2170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCgxuQDEHmG9zI5/aAVW7Kv8Cq4FuMVDvDdD9uDSMaHRlN7vUVG7OW9n57Pw13Oj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217
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

--------------fsWGnDq8l9uompi4GkhneprX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 29.01.25 um 19:18 schrieb Joonas Lahtinen:
>>> Would be great to reach a consensus on the high level details before
>>> spinning off further series addressing the smaller items.
>> I would say that attaching debug metadata to the GPU VMA doesn't look
>> like the best design, but if you just do that inside XE it won't affect
>> any other part of the kernel.
> It just grew out of convenience of implementation on the side of VM_BIND.
>
> The other alternative would be to maintain a secondary load map in the
> kernel in a separate data structure from GPU VMA.
>
> I was actually going to suggest such thing as a common DRM thing: GPU VMA
> metadata interface or parallel "GPU loadmap" interface. It'd allow for
> userspace tooling to more easier go from GPU EU IP to a module that
> was loaded at that address. Kind of a step 0 towards backtrace for GPU.
>
> Can you elaborate on what your concern is with the VMA metadata
> attachment?

In general we should try to avoid putting data into the kernel the 
kernel doesn't need.

In other words we don't put the debug metadata for the CPU process on 
the CPU VMA either.

You could reduce the amount of data massively if you just attach the 
source of the debug metadata to the GPU VMA.

E.g. instead of the symbol table just where to find it. A VA of the CPU 
process, a file system location or something like that.

>> My other concern I have is using ptrace_may_access, I would still try to
>> avoid that.
>>
>> What if you first grab the DRM render node file descriptor which
>> represents the GPU address space you want to debug with pidfd_getfd()
>> and then either create the eudebug file descriptor from an IOCTL or
>> implement the necessary IOCTLs on the DRM render node directly?
>>
>> That would make it unnecessary to export ptrace_may_access.
> We're prototyping this. At this point there are some caveats recognized:
>
> 1. There is a limitation that you don't get a notification when your
> target PID opens a DRM client, but GDB or other application would have
> to keep polling for the FDs. I'll have to check with the team how that
> would fit to GDB side.

Well there is the dnotify/inotify API which allows a process to be 
notified of certain filesystem events.

I never used it, but it potentially provides an event when a specific 
file is open.

On the other hand I have no idea what permissions are necessary to use 
it, potentially root.

> 2. Debugging multiple DRM clients (to same GPU) under one PID now
> requires separate debugger connections. This may break the way the debugger
> locking is currently implemented for the discovery phase to prevent parallel
> IOCTL from running. Will have to look into it once we have a working
> prototype.

Well multiple DRM clients would also have multiple GPU VM address 
spaces, wouldn't they?

So you would need multiple connections, one for each DRM client as well.

> 3. Last but not the least, we'll have to compare which LSM security
> modules and other conditions checked on the pidfd_getfd() paths for
> access restrictions.
>
> Reason for using ptrace_may_access() was to have a clear 1:1 mapping
> between user being allowed to ptrace() a PID to control CPU threads and
> do debugger IOCTL to control GPU threads. So if user can attach to a PID
> with GDB, they would certainly also be able to debug the GPU portion.
>
> If there is divergence, I don't see a big benefit in going to
> pidfd_getfd(). We're all the same not even exporting ptrace_may_access()
> and YOLO'ing the access check by comparing euid and such which is close
> to what ptrace does, but not exactly the same (just like pidfd_getfd()
> access checks).

Well that argumentation is exactly backward to why I suggested not using 
ptrace_may_access().

When an administrator used LSM to block pidfd_getfd() then a driver 
which uses a driver specific IOCTL to bypass that is actually a really 
bad idea.

> However I believe this would not be a fundamental blocker for the
> series? If this would be the only remaining disagreement, I guess we
> could just do CAP_ADMIN check initially before we can find something
> agreeable.

Well as soon as anything is merged upstream it becomes UAPI, which in 
turn means that changing it fundamentally becomes really hard to do.

What you could do is to expose the interface through debugfs and 
explicitly state that it isn't stable in any way.

Regards,
Christian.

>
> Regards, Joonas
>
>> Regards,
>> Christian.
>>
>>> Regards, Joonas
>>>
>>>> Regards,
>>>> Christian.

--------------fsWGnDq8l9uompi4GkhneprX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 29.01.25 um 19:18 schrieb Joonas Lahtinen:<br>
    <blockquote type="cite" cite="mid:173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Would be great to reach a consensus on the high level details before
spinning off further series addressing the smaller items.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I would say that attaching debug metadata to the GPU VMA doesn't look 
like the best design, but if you just do that inside XE it won't affect 
any other part of the kernel.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It just grew out of convenience of implementation on the side of VM_BIND.

The other alternative would be to maintain a secondary load map in the
kernel in a separate data structure from GPU VMA.

I was actually going to suggest such thing as a common DRM thing: GPU VMA
metadata interface or parallel &quot;GPU loadmap&quot; interface. It'd allow for
userspace tooling to more easier go from GPU EU IP to a module that
was loaded at that address. Kind of a step 0 towards backtrace for GPU.

Can you elaborate on what your concern is with the VMA metadata
attachment?</pre>
    </blockquote>
    <br>
    In general we should try to avoid putting data into the kernel the
    kernel doesn't need.<br>
    <br>
    In other words we don't put the debug metadata for the CPU process
    on the CPU VMA either.<br>
    <br>
    You could reduce the amount of data massively if you just attach the
    source of the debug metadata to the GPU VMA.<br>
    <br>
    E.g. instead of the symbol table just where to find it. A VA of the
    CPU process, a file system location or something like that.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">My other concern I have is using ptrace_may_access, I would still try to 
avoid that.

What if you first grab the DRM render node file descriptor which 
represents the GPU address space you want to debug with pidfd_getfd() 
and then either create the eudebug file descriptor from an IOCTL or 
implement the necessary IOCTLs on the DRM render node directly?

That would make it unnecessary to export ptrace_may_access.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We're prototyping this. At this point there are some caveats recognized:

1. There is a limitation that you don't get a notification when your
target PID opens a DRM client, but GDB or other application would have
to keep polling for the FDs. I'll have to check with the team how that
would fit to GDB side.</pre>
    </blockquote>
    <br>
    Well there is the dnotify/inotify API which allows a process to be
    notified of certain filesystem events.<br>
    <br>
    I never used it, but it potentially provides an event when a
    specific file is open.<br>
    <br>
    On the other hand I have no idea what permissions are necessary to
    use it, potentially root.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">2. Debugging multiple DRM clients (to same GPU) under one PID now
requires separate debugger connections. This may break the way the debugger
locking is currently implemented for the discovery phase to prevent parallel
IOCTL from running. Will have to look into it once we have a working
prototype.</pre>
    </blockquote>
    <br>
    Well multiple DRM clients would also have multiple GPU VM address
    spaces, wouldn't they?<br>
    <br>
    So you would need multiple connections, one for each DRM client as
    well.<br>
    <br>
    <blockquote type="cite" cite="mid:173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">3. Last but not the least, we'll have to compare which LSM security
modules and other conditions checked on the pidfd_getfd() paths for
access restrictions.

Reason for using ptrace_may_access() was to have a clear 1:1 mapping
between user being allowed to ptrace() a PID to control CPU threads and
do debugger IOCTL to control GPU threads. So if user can attach to a PID
with GDB, they would certainly also be able to debug the GPU portion.

If there is divergence, I don't see a big benefit in going to
pidfd_getfd(). We're all the same not even exporting ptrace_may_access()
and YOLO'ing the access check by comparing euid and such which is close
to what ptrace does, but not exactly the same (just like pidfd_getfd()
access checks).</pre>
    </blockquote>
    <br>
    Well that argumentation is exactly backward to why I suggested not
    using ptrace_may_access().<br>
    <br>
    When an administrator used LSM to block pidfd_getfd() then a driver
    which uses a driver specific IOCTL to bypass that is actually a
    really bad idea.<br>
    <br>
    <blockquote type="cite" cite="mid:173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">However I believe this would not be a fundamental blocker for the
series? If this would be the only remaining disagreement, I guess we
could just do CAP_ADMIN check initially before we can find something
agreeable.</pre>
    </blockquote>
    <br>
    Well as soon as anything is merged upstream it becomes UAPI, which
    in turn means that changing it fundamentally becomes really hard to
    do.<br>
    <br>
    What you could do is to expose the interface through debugfs and
    explicitly state that it isn't stable in any way.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

Regards, Joonas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Regards, Joonas

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------fsWGnDq8l9uompi4GkhneprX--
