Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B0A702AE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2945510E39C;
	Tue, 25 Mar 2025 13:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WOq54Jac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59A710E39C;
 Tue, 25 Mar 2025 13:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI+DDLVogNfJNzS110/3LdO7LfHoKgQg5NtrhT3ebhvL7C6mM5046RO3NpwRoZKfRTP4QM8FVaGCkoYu448L6HXB0/VY1P1qdhgKNVxQ4o3xwlUHVFbvBM0cXpIp28cHqFqctsaM/bp9QhkpNeeyxAfN0fvMgEXuKGl6K5sgo9kGkedkbzSlu+oSlROc6US06htJu9VjUBMpH7C1AcMI5r7I6u4xwB2KiYua/uE0xSxbrK8HA+Sbpir+uhPtBjlp5bJeUIixUe10N1FUMiI2/OKfGNwgvGooQBMb71JcUfdfS572CispXbuF5K+YKX0zkD09A0Jcsq1WWTVVr3m+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+H59aX1EMLG7jL6M+o0l0ztSLpYMeokagP3zL7BZFSg=;
 b=KTAZwVXb8Ms1UeafSSNAEjA6KJzTp0w1++YuJNTmNbiKUPxex+16sZGsN+J1Yk0/jgyFXWyUMGOkKX/5HQvZMCk6gKwDOmkYvaugv3D8/XeSi6Sg+6O4ESlB8ugWm+esuoGP268eyD1m0mXHQhzS+HK0Lv9FqB/Kmh6e7RM8GRALmej61cmnWlMnsU6fJnvywbg5bpZUCKhNeNLNL39YgrfP7nGhVkX/Etn4onnaOBovlHvPCOcctGGTL9Z9/MFVa+L2ybBD/aSQJMw/mR+v+UhFJ+3472vreDEvN0nN49sOMRtbqBEN09gl2wiVxpcyqyK/Li+ogQKsI/kmAsTQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+H59aX1EMLG7jL6M+o0l0ztSLpYMeokagP3zL7BZFSg=;
 b=WOq54JaczIZBBhxMd/nFteTBib6tKVFnNGqLHqClJPS1Lm6VE76ysK2UqU+Sh7zS5utAnJJx17DkjTnXehgREfkn1UadyokNmYswHmdcv7vkSHuHPowlwz39AC0eeDhQscWXpFo3wtjqMjPPwQC5atMV4tgEahPdmkwVd1rxSyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 13:50:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 25 Mar 2025
 13:50:17 +0000
Message-ID: <436be94f-2aab-4d15-9322-01ee72d46337@amd.com>
Date: Tue, 25 Mar 2025 14:50:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Replace deprecated function strcpy() with
 strscpy()
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>,
 alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch,
 mario.limonciello@amd.com, arnd@arndb.de, Tim.Huang@amd.com,
 skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250325000723.366365-1-andres.emb.sys@gmail.com>
 <85bda3bf-eaed-4eac-97ca-92c6301c0f9b@amd.com>
 <CADnq5_OQEA07TNXdJy5wfViAk2dp-LNvaQQbT2UCs7BtcokgQg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_OQEA07TNXdJy5wfViAk2dp-LNvaQQbT2UCs7BtcokgQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: db070136-2af5-46a4-f90d-08dd6ba3f9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFk2blIrUEkrbjMzeS94ZXBOSDh6cUZ2NVpVYlFSQWVHQUw3Z082OTZoRWRa?=
 =?utf-8?B?YnFsQW9yZi9wT3FiajJjSHI5QzJ4MDV1RGU4NTlnU281TnlVdDVPNFFveWRV?=
 =?utf-8?B?VGtiUUIzQkhrSjZ3OFUvU0pRQ243VExkc05WcklzczNTTHBXNDErc1VqaUV1?=
 =?utf-8?B?T1ZIZWZ0S1R2UDI2dktMa3VXa1ZhV3pyTjJoWmcvR2cwT0QxL2gybkI1akxw?=
 =?utf-8?B?M3pOUU5aS20ybDl3T0Z1RHcva2puaVZVRkYybm9Cb0xSaVJ0ekNiUXpRU2lD?=
 =?utf-8?B?WXVvdk9uRTgxd2J1a1czM2RiVmw1UGlkUEhzTHAxTEpJSFd0QzM3TXd3bnlY?=
 =?utf-8?B?T3lWYjllQXB1cDlobmtqNHoyL0NlZTlIWHdkZnBtbXdUY2tteEZZNEhieDBl?=
 =?utf-8?B?dXlkajFkenRndzFPNUJNd2dYM29URUNHUzVWcEJYNFdjR2hkYzFaSWxQckZH?=
 =?utf-8?B?SG5yQVpxZWY1eDVpZDBFRjRIcytLOUhpVjI1OUphT05OUDlhWDlPNU0ybDdD?=
 =?utf-8?B?UW5ZTnJhRlRwbzhaMEhObkNJczkxR3pUWk1zcDRBajRGS1lMNlArdm5ZOXNm?=
 =?utf-8?B?ZUtOaDFoWWFMU0FTOTNPa3FhQytPanpmVDVHQ2hzalN2d1U2SW5xZVdkUmsr?=
 =?utf-8?B?YlhWRmY5VWJhb1g0MlI0VjZXRFBGMThEczNYSXhnRXF6THVJS0oycnVpNExZ?=
 =?utf-8?B?U0xGMFRPak5sT0l5R0xhaXYwRjV2YnpSdFJqK0Iza0tjK2JvTWMxWnNaNEFG?=
 =?utf-8?B?c2N4OVZvRnJrWU5UOVJzUFJJWnc5ZE9Qc3dOa1NhV1RobGdTSUM1ZW43ZndU?=
 =?utf-8?B?NURKU21Eamd0cnkvaUlXTnJqNkJtU2hCWTQxcDVsOTdtV2MvcDRVcG5hcDJ3?=
 =?utf-8?B?M0VNSzlDV2VDN1g4YjdmSXlVTkpocnIrYmcxdldEZUp1c2dxRVFTbWJKVTBZ?=
 =?utf-8?B?YlJ2Z2wrWjE1ajBpbnBtajRxVkVaVFBnOURwd0JlazNGK3hnWWx2WS9hdHdv?=
 =?utf-8?B?NlZOQkpkUi90Q0Z0SnF4MUxaL1JaR21JVTlkRE9ocDJodlJJNlFGZWxQNVNU?=
 =?utf-8?B?ZDJ4dG12MFNqdnJLTUVMbnBVbTBmS0o0ME5ldGY0cm55UENoZ05qWEdmMnhP?=
 =?utf-8?B?d0lsZVhtMUMzV0JrTFY1NW5FY3l2b3lQS0RxT3lWSkt0U3Nsc2toNHhEV1JQ?=
 =?utf-8?B?WWhZdW5mYzJvZ3BGUUtQbmwwL0xUR05FUm5qcmoxNzRZYnBnR1VET2lPOGxj?=
 =?utf-8?B?dUNCbTI5MWRranhhY0NpSitVRjBSWmNQZTJyLy9DeWZkc3FvQjQyZitnNWN1?=
 =?utf-8?B?dTJsdkc4Q0p1RVM3VTJtOVlvcHhEYW5uaWQwOTRlNDh1eDZrRGMrTU9DZkU3?=
 =?utf-8?B?QnRhckxjQ2JDZlh5YXlhbytoaS9jUzYrYm9CY3Z0c2pzYitSWGhhQ2U4WkR5?=
 =?utf-8?B?N0lkRy9IMCtxYTRKZU9wVk55R1AwVjZURjhvcHNZcEt4SDgvQXVDU3JYZlpp?=
 =?utf-8?B?WHJETmJ5ODU3L0R0dFhHZkZxdXJybnBTVUlYaEdrS2pTMXdrSE9SbkIwN3VB?=
 =?utf-8?B?YXlxaWJPODQyRUs1Tm5QUC9oQkN1Z21tNWFZZ0lCTGFuNFFHekgwblllbTlI?=
 =?utf-8?B?cktmVHQ4dDg5cGlDOElZRXR5SWQrRHlTNVluSjFuRFhXR3htdWxmTzRHemhj?=
 =?utf-8?B?cDlZUkhDa2JCa2UrMUpkRnIwalAvb2lNYU11NXhRSGtTWGNEQktGbWpnYURl?=
 =?utf-8?B?bW0wQklCQU5saS9nVkhRUWxTTCtBdlFIZDIxZmNvN2JUOEd6VlM4cHROcWY2?=
 =?utf-8?Q?PR37rF3kbK4xhXZOe8Fjhxinj1HKy95rqkmh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWdROGlzakpmSmhFTXV4c1hhby9OM0VUendLVFlhc1dxcnFqbjJDMCtsSkxX?=
 =?utf-8?B?UWMvRnhrbFJyNDhLVnY0dzdJaFBHUHdwZTV2WVcyRUw0OWxuTzVMS0VMYklj?=
 =?utf-8?B?Nkw1cVJ5N09NU1Z6bUF1ZGd1SVFhbnhxa053TXdVTFpIMCtTMUE0aFNJWFlu?=
 =?utf-8?B?bW9QLzR3T1BTZHROSlBWcmJ5UlRZdEVIbGhMVmcxMG1tRkRYclpVRGY3dW5K?=
 =?utf-8?B?eWx3UUw2UTRDNWxEWXludmdrZisrN2VoUUFyUGx1SFhWR3lYejZxN2RyOTBF?=
 =?utf-8?B?TWdmTVBGWDNPOHlGVkpyZUk1emZoKzBvV25pRTlNS3Y5enFuaDEvYmpJclcz?=
 =?utf-8?B?Skc3Mmsxekp3ZzRSckw1aVVvR08xYVVVdFpsbVJ2T2xUYXRDMU9VRXJBYU40?=
 =?utf-8?B?cHBMdkZ3TWtaVWF0aDArd3FyMG1LWTVXU0RnS2dmRWhLUitRNTlId25HZnU2?=
 =?utf-8?B?QzJWQ1U0OEZUbW85MUFnY3Mxa2hkTm1sUEc1WFd6NEVkL2FKZ01RdDNJejZq?=
 =?utf-8?B?VFJDQ1JwTFByQXNWclc5T21FcHpETTFFR0FkMTRNVkJ1dStuNTY2cHdjaFc5?=
 =?utf-8?B?SG5kNGhVcXpaTjQ4UkZjRlh3NEpGK2ZUTkxsWDh0bnpXSml5R0NVRkVSQ2kv?=
 =?utf-8?B?OXlCTGY3SVFQcytzbHllcDZGU0Faa2ZNanB2Tmd1OVVFcXZpbG12cXZuSHBG?=
 =?utf-8?B?WlVwWmxrL21xUDVaSWM5ejQ1bVZrYkkvRHVQN0JmNWRZdmJEQU1LRjNSQjZB?=
 =?utf-8?B?MDJ2aTQ1Z3hpYWN3dXhmeUNmVnNzbnNYQzkyU2Z4eDNDM1Rzc2hOeXFUSFZu?=
 =?utf-8?B?Ti96bldUM2ZRMkROVG5kUmNBV1pUTE53ODhla2NpSHdYUFdyNnFpSzdNUmRw?=
 =?utf-8?B?eFc1Q1lLUG9LMXpHU2toaXlHRU03NFJiUmNXWmlNYkJIOUxTaG1qaE9xbFE2?=
 =?utf-8?B?dG1FR1VYMDB5UzlUUW9XbldZNkt4Y1A3eTVLMlV1cGRRQlBDS1A4RlV5UjBZ?=
 =?utf-8?B?WFlSMTErS2ZROHlkeFZJMEdGMU1VcEliY3FCUHIzMmVaYnordnoxS2kvNE44?=
 =?utf-8?B?RW8xb3BYbzljM2FYSmEwb3cvNG01SGI5QUY5azY1SmdIN1IxNnJ4N0tjMlRT?=
 =?utf-8?B?dGtRc251OENBNnFEVXhlWDl6bmd6SUJXMUpDeENQa2t4UkhJdHhBbWhnRzhX?=
 =?utf-8?B?WUlJQU1tMXdTVUlVVFJzVHJYVjB1eUt2OTRXRUJhQlRhRTVrdGhsajRsSHRn?=
 =?utf-8?B?YzNvb0lqODlvZkdaMVNtTUJTcWNCbWZOZ3RKS0ZZQmdVNm1oSk8yOWtEMDhk?=
 =?utf-8?B?UTRrZ0t3cW9Cc1NvMTl1TiszYTQ1RThIZnZNdUY1SUJWMjQvV1U4cDdlSFdE?=
 =?utf-8?B?MGFJOWpUTG1jOHdEdmF3dWp4Y3hEallqbXd3ZmpyeHp4SGllRG92MlBsdXIw?=
 =?utf-8?B?ZS96MnMzcG9KMDlHVjV5QW51bTlHUmpPSS8yZDk5SkdNN0Jla05nVWdFd0tY?=
 =?utf-8?B?V0RrTnM1SDIyMkJyNGdyUXpVQTIwS3RJTGtsZS8xTHRRU3Vrb2N5eEZTWS9F?=
 =?utf-8?B?Y1NJVGtpQ0Uwa0MzeVI4bjZsVEVIZ0djeUJIOERMVW5tTmhVWW9CZEpUOHE0?=
 =?utf-8?B?KzE4SE9zWjhrZE95cm95WFlRUm1JUHhxR3JqS0R0NEdwTklhWUlqUTFWUjdS?=
 =?utf-8?B?YjZQeDdkZVJaM0RGbjZOc2pKMlJjbWdFUmJnWlBRZUgyU0EvamNPUjFUMnY1?=
 =?utf-8?B?dkUrODA2WTNTZ2xENWZWcUJTTDZmUE5uODFZNVlUcllOOE0xamJwUy9DM3Yz?=
 =?utf-8?B?RTlIeXJ5VTJBQThEQWd5aTV2bW1DVHN6Mm01ZWdkZkZTTlNzb1pneDNsTUxh?=
 =?utf-8?B?RVdOWGs2VnovUEl0YkR2UmdFVGRNanczWU5xdmdVcU9VQTM0Z3U0cmkxRnYv?=
 =?utf-8?B?aWdkdlMxb3ZwNmpzdVpXcE1pb1MyMXlCTUFDZzM1ZVlQZjJVY3pzaDgwUkUz?=
 =?utf-8?B?bU1xVHJ0akpKV3lLSjRnTU1CT2xyTE85K2NyLzJmbkxkKy9zai9YdTVsUjB5?=
 =?utf-8?B?L0l0SC91dHJUTTVtTW5yNGJROEsvMXV4S3lSMUk2L0k2eUsxdmFyVm1may9t?=
 =?utf-8?Q?mFxdy46wjOJCSE9HuRdoMo6d0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db070136-2af5-46a4-f90d-08dd6ba3f9fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 13:50:17.6033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4suJ9HXOqZEjD60Fmo3Gc5g/oBO+S1bvwEMtx5APdP3lXvGYqp1P3ArWQsnZeIG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385
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

Am 25.03.25 um 14:30 schrieb Alex Deucher:
> On Tue, Mar 25, 2025 at 4:38 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Alex shouldn't be try to completely nuke the CGS functions?
> Sure, but it would need to be replaced with something else so I'm not
> sure it's worth the effort since it's only used by a few older GPUs.

Well how about at least nuking this code here? Take a closer look it's trying to pull in firmware from "radeon/*".

That is certainly not used :)

Christian.

>
> Alex
>
>> Christian.
>>
>> Am 25.03.25 um 01:07 schrieb Andres Urian Florez:
>>> Instead of using the strcpy() deprecated function to populate the
>>> fw_name, use the strscpy() function
>>>
>>> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
>>>
>>> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 68 ++++++++++++-------------
>>>  1 file changed, 34 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
>>> index 68bce6a6d09d..525e53c94f4f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
>>> @@ -253,16 +253,16 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>>>               if (!adev->pm.fw) {
>>>                       switch (adev->asic_type) {
>>>                       case CHIP_TAHITI:
>>> -                             strcpy(fw_name, "radeon/tahiti_smc.bin");
>>> +                             strscpy(fw_name, "radeon/tahiti_smc.bin");
>>>                               break;
>>>                       case CHIP_PITCAIRN:
>>>                               if ((adev->pdev->revision == 0x81) &&
>>>                                   ((adev->pdev->device == 0x6810) ||
>>>                                   (adev->pdev->device == 0x6811))) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "radeon/pitcairn_k_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/pitcairn_k_smc.bin");
>>>                               } else {
>>> -                                     strcpy(fw_name, "radeon/pitcairn_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/pitcairn_smc.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_VERDE:
>>> @@ -276,9 +276,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>>>                                       ((adev->pdev->device == 0x6823) ||
>>>                                       (adev->pdev->device == 0x682b)))) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "radeon/verde_k_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/verde_k_smc.bin");
>>>                               } else {
>>> -                                     strcpy(fw_name, "radeon/verde_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/verde_smc.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_OLAND:
>>> @@ -290,9 +290,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>>>                                   ((adev->pdev->revision == 0x83) &&
>>>                                       (adev->pdev->device == 0x6610))) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "radeon/oland_k_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/oland_k_smc.bin");
>>>                               } else {
>>> -                                     strcpy(fw_name, "radeon/oland_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/oland_smc.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_HAINAN:
>>> @@ -304,13 +304,13 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>>>                                       (adev->pdev->device == 0x6665) ||
>>>                                        (adev->pdev->device == 0x6667)))) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "radeon/hainan_k_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/hainan_k_smc.bin");
>>>                               } else if ((adev->pdev->revision == 0xc3) &&
>>>                                        (adev->pdev->device == 0x6665)) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "radeon/banks_k_2_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/banks_k_2_smc.bin");
>>>                               } else {
>>> -                                     strcpy(fw_name, "radeon/hainan_smc.bin");
>>> +                                     strscpy(fw_name, "radeon/hainan_smc.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_BONAIRE:
>>> @@ -318,17 +318,17 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>>>                                       (adev->pdev->revision == 0x81) ||
>>>                                       (adev->pdev->device == 0x665f)) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "amdgpu/bonaire_k_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/bonaire_k_smc.bin");
>>>                               } else {
>>> -                                     strcpy(fw_name, "amdgpu/bonaire_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/bonaire_smc.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_HAWAII:
>>>                               if (adev->pdev->revision == 0x80) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "amdgpu/hawaii_k_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/hawaii_k_smc.bin");
>>>                               } else {
>>> -                                     strcpy(fw_name, "amdgpu/hawaii_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/hawaii_smc.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_TOPAZ:
>>> @@ -338,76 +338,76 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>>>                                   ((adev->pdev->device == 0x6900) && (adev->pdev->revision == 0xD1)) ||
>>>                                   ((adev->pdev->device == 0x6900) && (adev->pdev->revision == 0xD3))) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "amdgpu/topaz_k_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/topaz_k_smc.bin");
>>>                               } else
>>> -                                     strcpy(fw_name, "amdgpu/topaz_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/topaz_smc.bin");
>>>                               break;
>>>                       case CHIP_TONGA:
>>>                               if (((adev->pdev->device == 0x6939) && (adev->pdev->revision == 0xf1)) ||
>>>                                   ((adev->pdev->device == 0x6938) && (adev->pdev->revision == 0xf1))) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "amdgpu/tonga_k_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/tonga_k_smc.bin");
>>>                               } else
>>> -                                     strcpy(fw_name, "amdgpu/tonga_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/tonga_smc.bin");
>>>                               break;
>>>                       case CHIP_FIJI:
>>> -                             strcpy(fw_name, "amdgpu/fiji_smc.bin");
>>> +                             strscpy(fw_name, "amdgpu/fiji_smc.bin");
>>>                               break;
>>>                       case CHIP_POLARIS11:
>>>                               if (type == CGS_UCODE_ID_SMU) {
>>>                                       if (ASICID_IS_P21(adev->pdev->device, adev->pdev->revision)) {
>>>                                               info->is_kicker = true;
>>> -                                             strcpy(fw_name, "amdgpu/polaris11_k_smc.bin");
>>> +                                             strscpy(fw_name, "amdgpu/polaris11_k_smc.bin");
>>>                                       } else if (ASICID_IS_P31(adev->pdev->device, adev->pdev->revision)) {
>>>                                               info->is_kicker = true;
>>> -                                             strcpy(fw_name, "amdgpu/polaris11_k2_smc.bin");
>>> +                                             strscpy(fw_name, "amdgpu/polaris11_k2_smc.bin");
>>>                                       } else {
>>> -                                             strcpy(fw_name, "amdgpu/polaris11_smc.bin");
>>> +                                             strscpy(fw_name, "amdgpu/polaris11_smc.bin");
>>>                                       }
>>>                               } else if (type == CGS_UCODE_ID_SMU_SK) {
>>> -                                     strcpy(fw_name, "amdgpu/polaris11_smc_sk.bin");
>>> +                                     strscpy(fw_name, "amdgpu/polaris11_smc_sk.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_POLARIS10:
>>>                               if (type == CGS_UCODE_ID_SMU) {
>>>                                       if (ASICID_IS_P20(adev->pdev->device, adev->pdev->revision)) {
>>>                                               info->is_kicker = true;
>>> -                                             strcpy(fw_name, "amdgpu/polaris10_k_smc.bin");
>>> +                                             strscpy(fw_name, "amdgpu/polaris10_k_smc.bin");
>>>                                       } else if (ASICID_IS_P30(adev->pdev->device, adev->pdev->revision)) {
>>>                                               info->is_kicker = true;
>>> -                                             strcpy(fw_name, "amdgpu/polaris10_k2_smc.bin");
>>> +                                             strscpy(fw_name, "amdgpu/polaris10_k2_smc.bin");
>>>                                       } else {
>>> -                                             strcpy(fw_name, "amdgpu/polaris10_smc.bin");
>>> +                                             strscpy(fw_name, "amdgpu/polaris10_smc.bin");
>>>                                       }
>>>                               } else if (type == CGS_UCODE_ID_SMU_SK) {
>>> -                                     strcpy(fw_name, "amdgpu/polaris10_smc_sk.bin");
>>> +                                     strscpy(fw_name, "amdgpu/polaris10_smc_sk.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_POLARIS12:
>>>                               if (ASICID_IS_P23(adev->pdev->device, adev->pdev->revision)) {
>>>                                       info->is_kicker = true;
>>> -                                     strcpy(fw_name, "amdgpu/polaris12_k_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/polaris12_k_smc.bin");
>>>                               } else {
>>> -                                     strcpy(fw_name, "amdgpu/polaris12_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/polaris12_smc.bin");
>>>                               }
>>>                               break;
>>>                       case CHIP_VEGAM:
>>> -                             strcpy(fw_name, "amdgpu/vegam_smc.bin");
>>> +                             strscpy(fw_name, "amdgpu/vegam_smc.bin");
>>>                               break;
>>>                       case CHIP_VEGA10:
>>>                               if ((adev->pdev->device == 0x687f) &&
>>>                                       ((adev->pdev->revision == 0xc0) ||
>>>                                       (adev->pdev->revision == 0xc1) ||
>>>                                       (adev->pdev->revision == 0xc3)))
>>> -                                     strcpy(fw_name, "amdgpu/vega10_acg_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/vega10_acg_smc.bin");
>>>                               else
>>> -                                     strcpy(fw_name, "amdgpu/vega10_smc.bin");
>>> +                                     strscpy(fw_name, "amdgpu/vega10_smc.bin");
>>>                               break;
>>>                       case CHIP_VEGA12:
>>> -                             strcpy(fw_name, "amdgpu/vega12_smc.bin");
>>> +                             strscpy(fw_name, "amdgpu/vega12_smc.bin");
>>>                               break;
>>>                       case CHIP_VEGA20:
>>> -                             strcpy(fw_name, "amdgpu/vega20_smc.bin");
>>> +                             strscpy(fw_name, "amdgpu/vega20_smc.bin");
>>>                               break;
>>>                       default:
>>>                               DRM_ERROR("SMC firmware not supported\n");

