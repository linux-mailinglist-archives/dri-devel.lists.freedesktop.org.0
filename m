Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F67A93F6A0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 15:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E45910E032;
	Mon, 29 Jul 2024 13:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ECfTqbTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2CD10E3D2;
 Mon, 29 Jul 2024 13:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RR8m/a4WMHLQ5dBGJ/ruxCXI5wotgARX/Tlw+e/nuI61KmR03kKf5T8YO802usC7yEDYZuwozv2fWed7gshROC/K2datTJf00htppi3ZP1aT07ivqWxnYlAjta5NvZ8YPWTEEsDOJkwDEaFmROGvKQ7/PQf0ysGc8lF+x9ilDqQAe8wFY5y089I4cFWuItd0CIXmEQ6GDEtVdjoQjM3T0KTXkB7tSdowiZ3FGsOUuJQLg+exofm5moL0smIhfRBpMbvRvc7Yx2aVr07YZqRAYeQuMvP1IWqXrT8CYkfDRaV4eyBmxFVuIquHg+1WPYuVpHba0DZY9PiY2utjyGoXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i73rI7fDwPmIuT7/lONYQYwdQ1PcK5jrwc7OSF8HDRQ=;
 b=dKwCAt/RhtVQvJy1UYvyqXJk9xF9JDT/eYuiy8EtOIyznY0RwDELi6XghAkzmaGzOLIlDTA4TjjD+BmfUoN4xylMq92wfBH/HofEnLXhnyEC5VhuK/pu3OcG/aIApF9Yx/jbG/hATwsVOqnHSNYgahpNPz89k7zBxtDBQUvZMsRGpxByoRQkFCW2GOhS/wg/5rgHo5KWnAqaH72hQQTHsOzy7+3DbrtVr/UMGlO4hNBzCRrSKauPk2Q1+tPiYokKIE6YUTWy+h/qKRq34B0HlTHu4hUM69BbX6Vuf6dzXN0txLLCc/XRfwyQERLjlCcFyMk/uu+oZFa3kGESwCB2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73rI7fDwPmIuT7/lONYQYwdQ1PcK5jrwc7OSF8HDRQ=;
 b=ECfTqbTTVyXpEbwhRHSyod1N94pAgL5juJQzKUOOsnnMKJ4TuHHKsT9/8ICDAIvZ4wV0r9mmhEsDc/bXoBE8pqMw/DG7i8gJ6LaG8/4RbyD7nFgN3gak7m6fw/VsisKqqS4U5wfItgDy4qw8RMwt/l6BZum35CSGeVWBPlvpkpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 13:24:38 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 13:24:38 +0000
Message-ID: <deba6c9f-989b-4bd6-96fa-872ea229af97@amd.com>
Date: Mon, 29 Jul 2024 07:24:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] drm/amd/display: clean unused variables for hdmi
 freesync parser
To: Melissa Wen <mwen@igalia.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-2-mwen@igalia.com>
 <b0017268-5651-4031-901e-45e64319d537@amd.com>
 <n335sldiuaq4tslcrsybeslq34tfr67d3vigbalp6gtku2yghs@j2guivjhp6ff>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <n335sldiuaq4tslcrsybeslq34tfr67d3vigbalp6gtku2yghs@j2guivjhp6ff>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0291.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::15) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|MN2PR12MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: e9095f77-5149-484f-c2ff-08dcafd1cbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGlDd3grdXZzWHd2K2JqSTRsRHduYTZnbC82Q0xWOUNOQkFoV005WXRjNFdq?=
 =?utf-8?B?alJnZEp6c2NqdkdMeGVBeS9UWUNZNFA1ZXNrbnN0TjlTZE16ZTFZTVFkbmdw?=
 =?utf-8?B?U0RpR1F4Tys0RkROODM3TWRFbThWTTY0bDZtYU9vTWd0bVVwMnFPTUw5K2NR?=
 =?utf-8?B?YUI0RHFuOFpHNjB6QVo3Y1BSN3BZNVpoVWRERm5Ic21NWnVJZHM4UitXTjBy?=
 =?utf-8?B?L0NzUVJGQjBxYldlNXVlSlpURlR6SmVtVTdCU2RhaTladm9pY2FheFh5elNH?=
 =?utf-8?B?NFY2anJkL0tFY1hvWnZaUm9vblNUb0RSYkgzbmVISnFHdnpLb0NHVC93VFgy?=
 =?utf-8?B?VWd3cUpCWVRhQXBXYXVuTElON29leEZ5aHZSUUdOMWVIZXVCYjJjSE5hZEdF?=
 =?utf-8?B?Sk81T1dpL0dLUDFUbjIzSlRGS0NjNkpENlluRHQrWFFPVlNiMk00RHk0aE9t?=
 =?utf-8?B?LzhhbjBzUUVLem5jOXpVRzlBVnVYZ0RXdkpBeWszTkI3dDN0QnY1SlBrNG5E?=
 =?utf-8?B?TnM4WVJzbWlXTm1jakRtRzhiY1BJNnF1bGhuWVlvUXlLNXBaMytIU3A3ZWQr?=
 =?utf-8?B?ZUliZ1hXdzdHMFRySGFWejlBV0trQ0pWbGRQaUcxOWIxaUVpMEwvSjB2Mzlq?=
 =?utf-8?B?Vk55cjlCdGpFeVZiUXBjSmNxKzMyVmJ5bzlQK0w3UUlSUUlYbm13OWFTNSta?=
 =?utf-8?B?ZURsdlllMnZFK29CcUl6MVE5ejl5UFJqU3QxbEhHbTBVT0MvR2l3bktoUTdt?=
 =?utf-8?B?L3JGTlNOTTZmU3ErRElLdVFCNFdkd0ljV2wwZzVKU3ZrM0ViS1RvejFMMVUr?=
 =?utf-8?B?M1hKdVUzbmh6RWdRUHgyalIydHIveDFxMDJ1UFdJNk9mZytBekRhSzZyL0lL?=
 =?utf-8?B?R2RBK0xBbklDaDlDZWhCWmxaOHBvd1hzemh1RER0SmlPd2ZISmZoQmpmNEFt?=
 =?utf-8?B?VEZSS3NUb2N4ZFJISW9rdnkyTm5pcUdBais5VUM2OWQ2RGVjNDk3ZmdNNUpw?=
 =?utf-8?B?SU9CakFkWWJ2dzRRWlFkbCtNUHorV0w2QnFkSm5GNC9Ud2crYUhoVDMxNE9X?=
 =?utf-8?B?SFZRUURYMnc1cFFBaHZqaUdyV2pLVmdqMm9JdDFoa0RlNmdYd28rY1BLRTNS?=
 =?utf-8?B?K28xQXg1SnN4NFhLMlZwZ2ZidzhRNjVQZll4Y083L25ObW00K0g2OEgwcy9h?=
 =?utf-8?B?WllEUjhMY1Z5SXZUNkZlTCtpQnhSbTkvbDdGQ2lIOGRzZlZKdGltVzFhQlhX?=
 =?utf-8?B?TWZsUVJmeXdnb09xQzZJL1RhZnJxTGswNUZhbWd0RktpUkgxTGJTZFdZQkZT?=
 =?utf-8?B?a1hUdEx3WURUTkdCYmk4bTdVeWtsbmYvNE1BcGkwVEduRkNPMlNYK1VaQ1Er?=
 =?utf-8?B?a0FpS2l2ekt4dWhRN1dFQW1haEZrWjZzOHNMTU44dlNZcUZKcTR1cXNhdEM3?=
 =?utf-8?B?dDhKNFdWb0FYQnl4NTM2ZWVSbWRaZWFla3VHOEJwUkk5cVIzN0tkOXE4aFJV?=
 =?utf-8?B?U2JBNW1wYW92YUgwMmo2djhWaUZXV0RKQzJScUQ4dzQrdGtQUFBtMEVET0Rw?=
 =?utf-8?B?aGdXWmQyeVdBcHFpZUtXRWtSSU9vU0pVaXg3b2dPVDl0OWp1THZVZjVGbkJa?=
 =?utf-8?B?NDV4RnR0OGVIZEhHSllJUVNuU3I0R2FjQnVCZEsrTkVFNHg5aHhhOEZBUUdi?=
 =?utf-8?B?TzlsZitaajQ1V1BRSkRzcG9QbE1ja0VGVXYrcDJvV2dDVHRGcUxQcWEyZ0h2?=
 =?utf-8?B?b1ZkS3NoSnk3T2k1U3ZEZmV6blQrODhhSlpldW9LdXlVQlFlVStWdlYxWCtD?=
 =?utf-8?B?cFQ3R3hDM2gxRE5pa0kvUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3g0ekNwNHZjSzBKZjBtZkd3ZXFlWmpsMG44OHhOVi9FUC9YNUpDNXdxUWVh?=
 =?utf-8?B?Z1dpUTYwbHRObHcxTU5qRDZPRmxqNkdhazZ1OU9GNzNGK0x4N1F6NmxVWVJE?=
 =?utf-8?B?TElsaVZoNXdHMGFnZ1I5bCttUTBzMndUcG9OZmw3RkNFNnZqbWp3ZkJMbEJQ?=
 =?utf-8?B?YWJnUEdtNzBJZzRhM2N0L2JnSW9KR3BTcTU5NjduQjZVTXVsLzBPakxWYUsr?=
 =?utf-8?B?M1NTcjh6ZHkwRlBoZGpXRmVzUVhPUzBTSXc2dWVMTjlaWlVtWjdwY1V3cWdr?=
 =?utf-8?B?N2JKWEhvMURZNnozQ2pwVTIxQWk1ZGYzdWxlOEhUYXUwWUlHamdTS2pFdUtY?=
 =?utf-8?B?dmFZUG0zQUExUWQ5aVVSZlE5MFM0YklxVmZvMUtjRDBKK2E3ZWczUm9JbTIr?=
 =?utf-8?B?T1lmOWVqaUNEWHdOMW52d0QzRFppWlZDQW56SzJDT25xVDUrSDZoRW9JMTFi?=
 =?utf-8?B?bk8vaU5RdGU1dldkL0Jrd1Q3Q0s3ekV3TVNBMWwyMktyOFp6ZEV3cDVWK1l6?=
 =?utf-8?B?UEw2UzQwdFY3cEx4QS8vcjNQVmJHTFZLQXlyd0NWNGFUS3BCYnpEZ0VzRnd3?=
 =?utf-8?B?TEZjcEcxRXBqcHd1SjR4dDZDVnNqSFE3SEhHUmlrbmpNK3M1TEhFVTZQS2Iz?=
 =?utf-8?B?SmcwaSt2RFFzV2xsUE12RTYwRWdaNkxUT1l6T3JTdG9hblNlS3EzNmhVVnhT?=
 =?utf-8?B?MmJSK3B5N0kzaHliMDEwcE1aYkhRSUoyT0djeTg1YkUyRzRpTUIzMTA1U2xI?=
 =?utf-8?B?R1NmNE4rbVg1RzBuUUJENklOcHYrbUwvYlRkbzdWM1dENkR2MkhMRjFjdUcw?=
 =?utf-8?B?YUxkZzFJOE0vTTZ0empVS1RMN1IzREVqS1BzRnkxUVNZb2tUZWxZUjVNRHR4?=
 =?utf-8?B?RDYrMFRZYU1qWFBEcmdjMTdNaldxNTJkUk9hdloycTFUd3BlRFFrbWEzNkhV?=
 =?utf-8?B?TUt5czZmOTBRWTZHbzlON29mV3I1OGFzWVV4ZDlydmhLQWdNSXVMVjNnbUZJ?=
 =?utf-8?B?eXU3aHAxeU5FOTVESnpuNm1vSm10eWZjdHgvMi81VSt0djREenRUczkwcGF2?=
 =?utf-8?B?L1JTQTJVSitMUWFrb2NLQ1NzWVcvQ0xnc3JEN3A3SFNRMytqYndSb3BlN0Z6?=
 =?utf-8?B?VTdQZVoyMGhHNnIxTGFVUjljRy9OMzBjVm5kQ3BuaTRQakZyeUZqdG1yejFa?=
 =?utf-8?B?SXJZcnc1SVc3VXBPellQWWZXL0FueHRLdEF6cENOTjZENTBJQzhibkxpYWZh?=
 =?utf-8?B?QVhkUnZpcC9NZVVYOTVqcHU1ZEFXZlRXenZ2RjE4NnhOenpxd0pmWlVSdHhZ?=
 =?utf-8?B?TFJialBVeE9UTmJNZGpya09qdlFIc1NJSVZGM1kxbWp3TFZXbk4wQlNBNEZo?=
 =?utf-8?B?a2pCMXJtdVZKQzkwYzNOdm5RZDJCU1RrTFRGaTlxTGVjeXhlRzhWTnFaWHRU?=
 =?utf-8?B?elo2VzFIcjUvZ0pyMmhsQU1teWZad3BzUklKT3hYT1JRSFh1VUJTVS9JdFcz?=
 =?utf-8?B?bERNbHhPVUczeVpGcmdpNEJCQWlzb25CaEh1U0x3RFV0RTdoNGVhZld0b3py?=
 =?utf-8?B?SENQdkx1aVVwSzJxNFVsV0dlZmhqVURSQ0JJOWhxczh4V2o2SzJKdld0d1Rt?=
 =?utf-8?B?M3l3OTdPWG1JOHFZbFFFbTY3VlU0dHJScnhkV0RWbnYwcEgxK1d6SERHK2Zi?=
 =?utf-8?B?aVRJbm9MRzQySnV4eWFXVitGSHozSnQ3dW9nYzU4N0pFQUpPVjVkL2pXdTZ3?=
 =?utf-8?B?UzVEbHUraWxiZG91TzF3SzlUTU9VWGxROTVJZ0tzKzRkWldxM1VDYXpvR0hS?=
 =?utf-8?B?L1BVaDZ1ckJ2VXk4Q0xiMmpiQkVYV0ZmbE5RTnZmOVRoUVdSV0oxeXVlbHRF?=
 =?utf-8?B?Vlc3V1d2bzJhTkdhR00zaU9FZlVXN3RJMFdxRkJGTXRaSlY1MGtYRDdmZ2VU?=
 =?utf-8?B?TDBrODQrZFNWSHdpYkpYZlpNcjAxQjVrbVVYcitXUUxIUm1lT1hkK0hrYzFl?=
 =?utf-8?B?cHBkN1BCaWFyMFVyT3c2NjF6UDBkbmlWRXNYNmpWVElJczdWeS9RaUhtYXpt?=
 =?utf-8?B?OFVGQUxBRGx1K1M2emQ2Z0ZLTmtzU1U4MUFnbk0rbTVwdFpXMkxNbGJ4UVFL?=
 =?utf-8?Q?F63oDPKTg8dR069jLftWDXf+i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9095f77-5149-484f-c2ff-08dcafd1cbd6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 13:24:38.4300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dS2B2V+zvjCq0GQf1s3Mu5u7rp2yVZ2dnn9Gm+elR1HxYyNUuMiX3I8yVX0kfjS1fi0C+7yKsDo1qrUal3N7qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
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



On 2024-07-28 19:32, Melissa Wen wrote:
> On 07/25, Alex Hung wrote:
>> Hi Melissa,
>>
>> There are no commit messages in this patch.
>>
>> Also, do you think this can be merged with Patch 5 "drm/amd/display: remove
>> redundant freesync parser for  DP"?
> 
> Hi Alex,
> 
> Thanks for your feedback.
> I'll add a brief description in the next version.
> Regarding merging it into patch 5, I'd prefer to keep it detached
> because here we have a non-functional change. I can send it as a
> separate, single patch from this series to reduce noise and make
> validation faster. WDYT?

Make thanks. Thanks for clarification.

> 
> Melissa
> 
>>
>> On 2024-07-05 21:35, Melissa Wen wrote:
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
>>>    1 file changed, 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 98cf523a629e..1dfa7ec9af35 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -12108,9 +12108,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>>>    	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
>>>    		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
>>>    		if (i >= 0 && vsdb_info.freesync_supported) {
>>> -			timing  = &edid->detailed_timings[i];
>>> -			data    = &timing->data.other_data;
>>> -
>>>    			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
>>>    			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
>>>    			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
