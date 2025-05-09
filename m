Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9ACAB0A86
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 08:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DF510E9B9;
	Fri,  9 May 2025 06:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HlXQ7u0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C4110E9B9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 06:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=th84uDt18hGDXSIkWgsc2GK/SReb9HqbiSYPpzS3DD7HTafic8WXcBGb/Bl8EdZgRu//YnQOoaagvge8cBBLa3jhG7cGWpD+2hBcy092HyRYaYk7YIG8wZkDS4a29Phx4LE/YR/DjMJW2vAIM/Q15gGzjMQATIjb4aTmMuJ1ubaEdP06fseCrZN0iCyKKLfJwwtoMqwU/Rz5HZ8lJGxNRAIG2AcRVHghHDqA3+f/edTnR9ohVxse5YE/yrQ4J2oVSeOopZ2esA4Ist/dPa9UQIlIhkiK5FWwRG+Un1sKejTOLAuzixR5kwVX2hq2/CwsKO3b2l+5F1EFfkT43r3c9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ozzTALYG4mDv0b0V5xyj/RXW0CyfZjYzMWyoG46gR8=;
 b=WO98CJqF3SGwWQzGe+D06TWvmlvHImU7H6JygeqcBY0LNX7bu8QouKAQxx/0XJK9dup0cf3tswhEULsjO8XTMoy5nwDgBWV5/i7NsZ5z+F/0kgROAWKqWKUg+mAW9gDr0rJTuYM9fBftMyctfVYtQaQN623MP6V7ep7QnFwj8z3SNcUkA6JX83mSRUZ44t49svQRAp4fUu19eAsR55uKxpFjS9fR/W9cCLb6Iyi3DZxXWbRA+dRjIFIdGuMm/T89VOAiZsjPBEKgMBOuB8CLQlh+TglbCXIGq4dnbN2eVoV9vHIXM6IykGgWKa5TYFbzfolboxaPOH0eV2TpelMO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ozzTALYG4mDv0b0V5xyj/RXW0CyfZjYzMWyoG46gR8=;
 b=HlXQ7u0si7zAoLctWywOFF4uSRaRjx255Wx6TxdeAMvlxzGxnYZ1sz7a3L/q9c/YueVvVXWHxz6fH/fP0yJJsJuELAOkN0sNI7/1oOy8u7Y3I1yU4MzL2swXKRxIOayu+gfUK3sVCi7bm9QVRbIdw4GRR7mOS5Kz0d+U6N8XhSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6782.namprd12.prod.outlook.com (2603:10b6:a03:44d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 06:22:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Fri, 9 May 2025
 06:22:28 +0000
Message-ID: <301f1962-88a5-4ea1-bfc1-826426d01ab5@amd.com>
Date: Fri, 9 May 2025 08:22:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/shmem-helper: Import dmabuf without mapping
 its sg_table
To: oushixiong1025@163.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250509032040.185730-1-oushixiong1025@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250509032040.185730-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0024.namprd12.prod.outlook.com
 (2603:10b6:208:a8::37) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8caca8-266a-451b-a8a0-08dd8ec1df53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wmk0NUs4NHJkY3pHWHdqSVVySVpGY3Zma0RJK0xiOVB2SnQrQ3dkdHhKaEgz?=
 =?utf-8?B?OGNMcDkxMVRVOWlEekQzU0FJWkhmZm9td1VlOFA3N25ORkNEZmpyZjVUMDgr?=
 =?utf-8?B?TTNGb1NyemFxYVN4LzFtbFozcXFYVjVIQTdoRWhtdFdXdzkzSGVRYzBPUzRC?=
 =?utf-8?B?N1RKMWFydW4yUzlSSFFkN1pVL0FtR0lNT3hnVUdwVkx0ZGNzanQ0d2J1Umor?=
 =?utf-8?B?d3o3QTQvZG1FTndycStPM1FUcFNwZzNHbFRJRlZkUzIwQXZqNHpiSGg2Z1lJ?=
 =?utf-8?B?V25sNkdPYk9aMlc1b01hNENUeHBCajBnd2Q0SkpCSHdnMHlHMEdwc0dXUDUy?=
 =?utf-8?B?TlpadDlDM2dZZXlxem9RUzNqUDFxdVB1bXVWT2VDRWVEajVTR0FTMFdmUzVX?=
 =?utf-8?B?K2dldHkzU1hqM2FkTkwzRUtwR0lBam04UkR5Vm41WjFLMVpBTjE3cFg4SWNZ?=
 =?utf-8?B?Q0N5M3NKQzZOUDBlbHl2ODlkWjhkOE5MT2lNVStvdFhWZzlrQzRWRTRMV2Rt?=
 =?utf-8?B?NDdYWDczVDdWUFJwN0ljRmFWdktrZzdXQlF3S2x2clJQblFTRzRjbWpCZkpr?=
 =?utf-8?B?OHZWTzdUSGxONnNDUXVzMjlJUXJYbCs4VVpINk1LU1Jac1RLSllPU0s1WDZk?=
 =?utf-8?B?TE5JaDIrSGllTWdYQzJwckRxYmFUVllBY3I2Z2tSMk4zTXFWNWNIcHZrdVAr?=
 =?utf-8?B?NENsYlJxVTl5bEVxQXpDb0dQbjNvaWlOVzlXSTFVOU9CTEgrM3NpRFN0WGFX?=
 =?utf-8?B?ajVjNkx5dHNhRU9vemxyWG1ySjQxbkxUcXR3U1UrSEZWUzB2S3FSRC9mWklx?=
 =?utf-8?B?TysrMnlabnMxVnFseWNzZDA1cW5VRldmVFRDUUlza040a1hqYk1maUhZT2Zt?=
 =?utf-8?B?OHJwM1FqMlFDZHFSczdadDI3emxUUXd1M0x5QVNheUwrcjZmVG9KY0Y2ZVNv?=
 =?utf-8?B?WjZUMnRhSis3NjFGYzl1cDBmWkFlaXBaMjhmdUJxSEh1TW5PMno1QzlQR0pl?=
 =?utf-8?B?L2drWjJZTW0wc1Z4UzlxbUV6V1ZwcHRVTk4xWHZvNG5uYVlmMCtiZ2syZVd0?=
 =?utf-8?B?M0J6NmRMcWlsRWJKL2ZRTU1udENyZzNiY3Q1UEUxQWVsRDVUVlE5NEtSNDFs?=
 =?utf-8?B?bjFrSVZUcnl2RFVHMlhIdTMyNnR1ZVUrbC9Zc1FYY2xtanV1elEzcE5xVHpX?=
 =?utf-8?B?TmJXb3pKdXF2YmtqNHJoVm90ZElydVhqTEtKSnZmL1VSVkp4N2NTWUI2LytN?=
 =?utf-8?B?Y1I1Sy84VkFnZnRQUFVGUGZNekRETGo0enlDZGFhb1Y4K3BsRVNwZHJHckJv?=
 =?utf-8?B?R0U0dVVtcit6dFFuNmFsZDdSdDNFUXVCdUJiMmhVUjk2ZGkwYURxWjI3SHE4?=
 =?utf-8?B?TTJ6Zmdvci9iNmlLNDVBdHB1KzlKYlJsN1lLQkpOTlJ4V2xVcW10Y0ZIQitO?=
 =?utf-8?B?Vk9nZWd0eDIvdm9aR0pSVEZyVWloL00wSnpaMDBaT3AyYmJFdkdWUmcyRjRV?=
 =?utf-8?B?d1JsS3NBUUxoYmtWRWJkeEdKQW40em52TE5ReUFRZWdFRndjTDFjMzZ0WUpW?=
 =?utf-8?B?VGtTWEpRTzd0WStFZ2lwbDZkT2NmQU9xeU9vT1QwcExOMnlUUW5xdWliNUV3?=
 =?utf-8?B?U1ZPeXJkWXpZUU5Tdm1EQkpRNUl1MnBWZHRlaklpMXVDVzEzeDhHZlc5V2t1?=
 =?utf-8?B?V0VwMEV2aUNVcVM5bFhXVlhiK1lSanA1MERZK1BOZjlOdVhDYk8zcm1yM0hR?=
 =?utf-8?B?TUVRUmZ4WThGeWlMV09UTUI0Z3EyWjU0R2ZiUW9aOUlEUVUya1ZJMEhKQ0F1?=
 =?utf-8?B?MDBJSGh1MVA1Q3ZOd0pyUkpVeVE1MXJBNWFDM1BzTkF6UnR1anM4NEsyQkI5?=
 =?utf-8?B?aWU3Z2FVc3JaVUJWWE5naTBEdDlvSkc3R2VPVHo4aGQ5WjdCUUFjbHRzTkQ2?=
 =?utf-8?Q?8IPCSKuEGEk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVlmY1VEVVdUYjQ5eWdDeWRJZmZ6amlmUkNPZTFlRE43WVRNNjIxbUZUNmFZ?=
 =?utf-8?B?M2o2aGs4dGNMNFRUZFVlcUlrN1NQRDRYQlVuK0UxbWZpL2QxenRUTE1oamRY?=
 =?utf-8?B?Vm9rM1NldEw3bnBrV1U2NDJIY0VIR0I0NjJJNWVEbVF2ZmtPVzZiUCtsU1Rp?=
 =?utf-8?B?Qm9aSFFTVldRancza0tIbzQ3WEo2bTFkRnJGdFRlSkdwaFlXWmUxL1dQbjBU?=
 =?utf-8?B?ZmpCRk0zRW5SdlNpMUVsUVlmRXo2RWlMWXJ1S3FmTFd5Z1d2cTB2OFRqZE5W?=
 =?utf-8?B?bndZQ0JPNnlkRlc4a3N5ci91cjRNYVNHbTg5dFB0Q29HRGpBVE5xSGJpbHRo?=
 =?utf-8?B?aVBsQlU4Y1ZMbVdqT0ZlY2xJMnNQc25MWW96b3kzVlo2L1B1N2pacVN4WG9R?=
 =?utf-8?B?eStCYjN6NlY2dHVpeHFVb1FQQ05ML0xkOWU3ajZDNU40Vk5rODA0UHkrV0dU?=
 =?utf-8?B?SGc5VWYrWnFBMXNYWEFUazlMM1BIOWVjRGlyRUQzUWplb21tWStKNzdpbjJT?=
 =?utf-8?B?bFV3MmV5Tjl4NFd1MFBwRjdtakdUS3hmRk44eWFHUG1tRWFRQ0tIeFhCK1g2?=
 =?utf-8?B?dUo4UFZBR3pmVWJqTjVybVh1aUJkYzFlMjEzU3FhNlRmR01qeWw1M0c4d0sy?=
 =?utf-8?B?TUUwSmdPU0IwdjVMYnFkYTgvM2kyYTlTaU1OKy9XVFlUYitSUHhkb1dXditn?=
 =?utf-8?B?SVZrOUozdHAyVnNWeVVLVXJGQU9HNXFyRGVvemZPMjdseUt4WFZGUmJiTXJQ?=
 =?utf-8?B?WmxnSjI5OVRLQnFhMkNENVJSVmg2Yi9KTi9MOVU3dkNIWWNGTTMxUTFmdzRM?=
 =?utf-8?B?NGszaUQzVCs5dkhmTjlMaW1xa0pMVWRTQTNmVWdzbVJSWnJrQW16bURzeHhQ?=
 =?utf-8?B?WjFUZzBINXJJR2NuQ09GN09JM3dwYnBMTitFNVNSZTBmSUkyVXIrQWRjNUVm?=
 =?utf-8?B?NmdNUlg4Y2t2YkhlcW9BeUhBN1hxbC9YU2RaaXgyZll4bUpPbFU0ajF3SStv?=
 =?utf-8?B?STloZnR0YTBPamVLWVVoMXpVa2hrTmdITFVBa0Z6cHFJNDNBbFNFY1RVdzMv?=
 =?utf-8?B?NSt2b1RSUGFFTmlYc1UrMGlqbjZ2WnQ2eUNjM0FhRGJVTkd1Y3VDNklHc0xi?=
 =?utf-8?B?dU0rSEdObFQ0d1BhTStNS3diaFV2UGNnRjhhampCUEl4ZWc5bW9SanZPaGVG?=
 =?utf-8?B?aGpCUlNFVXV4VXNEVlJrT3lMODdJRjdFSXUySXV2b3F4MWdqSnlmZnp0WkhR?=
 =?utf-8?B?TU5vMG11N2E4dW53eE5aOVRTT05nT0Y0MjRKSlE3L3RYUm5JOEpLM2Q2T3Rs?=
 =?utf-8?B?QSs0S2J3Y3JMaW5NWlNJWVMzdkNjY0ZVSldXbkpBWnNBakxYTWwxMEQzY09h?=
 =?utf-8?B?NTV2TUdxcW9HN1BEUzFOaFhvTGVINXc5ZEx3aHBTUW5JV3J1WUpnQnRuK3Iz?=
 =?utf-8?B?dFpGbGt2Vk9CRnROa29BblZpU1llWFZPTHhaK05GVldWODI2bUl2djJyVXVB?=
 =?utf-8?B?cEk1cDRIMjdLeTdHOGdnY3BhRGFJN3BWd2lMNHFrT2R4SFZ5blNjSEdLNVpk?=
 =?utf-8?B?QVFZR0N4WERmZ0ZrekhWUUxaL1g2a1R4ck4ydDlYQ2RJR3hmRkpvR1dmYWFE?=
 =?utf-8?B?RXhHeHdZaHB4ajFCWE5NRzJJSUR4NUJhYnNNeUhqWkk2a3orN0JMUlhCamV4?=
 =?utf-8?B?bWRjWG5pZGw2YldqVWV6aEVneDNFNGNnZkhnY2VnMTV0NzBFd01VTWljRDVY?=
 =?utf-8?B?aTVQTHVwQ1V5Q0Zob2NLVW9yT1ZaNElrZDJvTWZnbDU4N3gxcG1Bbk10R3J1?=
 =?utf-8?B?eWUwQU5ZQk5JVGdBaUxEblhxdmlQWU9QdVQwWXA3ZmZmNnZFYlBIWjJsYWhL?=
 =?utf-8?B?K0ZjQ08zdDdPQzZNdktnYjExY2lHNUwwM1VERml5eHp2dFJ1UXBwZXk5YlFs?=
 =?utf-8?B?YkUyQlZmSUpyVnFsSkZla2JJWDkzNkJOM0c1OG1XVWN2NEVRdjhjWmJxV0lk?=
 =?utf-8?B?OCtzdzAraWF3dlh2T25mSWlmYnZVRFRlUitXaGpad0Jva2RFcmgwbHl6ay9M?=
 =?utf-8?B?aE1DeklOY1VKSnVIRzIyNUhhTGFvRmx4clJjNVFRRE9DR01vNU5JWE0xdVJx?=
 =?utf-8?Q?0Fjur7/wJQ0fJ02T14qmUU2Oh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8caca8-266a-451b-a8a0-08dd8ec1df53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 06:22:28.4965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw9BWgXT0GMpvzliMhKjBSssk0urTY3MMF+EXN++a4cVP8KNKp1rKA7loY6IwYG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6782
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

On 5/9/25 05:20, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> [WHY]
> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>    DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>    sg_table import.
>    They only need dma_buf_vmap() to access the shared buffer's
>    kernel virtual address.
> 
> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>    trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>    restricts the maximum DMA streaming mapping memory, resulting in
>    errors like:
> 
>    ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
> 
> [HOW]
> Provide a gem_prime_import implementation without sg_table mapping
> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
> require sg_table can adopt this.
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
> v1->v2:
> 	Patch rebase.
> v2->v3:
> 	Rename the import callback function.
> 	Remove drm_gem_shmem_prime_export() and separate some codes
> 	to drm_gem_prime_import_self(). 
> v3->v4:
> 	Separate the test from the policy.
> 	Rename the macro.
> 
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 57 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_prime.c            | 36 ++++++++++++----
>  include/drm/drm_gem_shmem_helper.h     | 15 +++++++
>  include/drm/drm_prime.h                |  3 ++
>  4 files changed, 102 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index aa43265f4f4f..8fa160c3635e 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -800,6 +800,63 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>  
> +/**
> + * drm_gem_shmem_prime_import_no_sgt - Import dmabuf without mapping its sg_table
> + * @dev: Device to import into
> + * @dma_buf: dma-buf object to import
> + *
> + * Drivers that use the shmem helpers but also wants to import dmabuf without
> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
> + * implementation.
> + */
> +struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct drm_device *dev,
> +							 struct dma_buf *dma_buf)


Please don't mention "no sgt" in the name, that we use sgtable is an implementation detail.

Maybe use something like "no map" or similar.


> +{
> +	struct dma_buf_attachment *attach;
> +	struct drm_gem_shmem_object *shmem;
> +	struct drm_gem_object *obj;
> +	size_t size;
> +	int ret;
> +
> +	if (drm_gem_prime_exported_dma_buf(dev, dma_buf)) {
> +		/*
> +		 * Importing dmabuf exported from our own gem increases
> +		 * refcount on gem itself instead of f_count of dmabuf.
> +		 */
> +		obj = dma_buf->priv;
> +		drm_gem_object_get(obj);
> +		return obj;
> +	}
> +
> +	attach = dma_buf_attach(dma_buf, dev->dev);
> +	if (IS_ERR(attach))
> +		return ERR_CAST(attach);
> +
> +	get_dma_buf(dma_buf);
> +
> +	size = PAGE_ALIGN(attach->dmabuf->size);
> +
> +	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
> +	if (IS_ERR(shmem)) {
> +		ret = PTR_ERR(shmem);
> +		goto fail_detach;
> +	}
> +
> +	drm_dbg_prime(dev, "size = %zu\n", size);
> +
> +	shmem->base.import_attach = attach;
> +	shmem->base.resv = dma_buf->resv;
> +
> +	return &shmem->base;
> +
> +fail_detach:
> +	dma_buf_detach(dma_buf, attach);
> +	dma_buf_put(dma_buf);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_sgt);
> +
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d828502268b8..5bcf483520b8 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -910,6 +910,26 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  }
>  EXPORT_SYMBOL(drm_gem_prime_export);
>  
> +
> +/**
> + * drm_gem_prime_exported_dma_buf -
> + * checks if the DMA-BUF was exported from a GEM object belonging to @dev.
> + * @dev: drm_device to check against
> + * @dma_buf: dma-buf object to import
> + *
> + * Return: true if the DMA-BUF was exported from a GEM object belonging
> + * to @dev, false otherwise.
> + */
> +
> +bool drm_gem_prime_exported_dma_buf(struct drm_device *dev,
> +				    struct dma_buf *dma_buf)

If I remember the naming conventions correctly this should be something like drm_gem_is_prime_exported_dma_buf().

Regards,
Christian.

> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +
> +	return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && (obj->dev == dev);
> +}
> +EXPORT_SYMBOL(drm_gem_prime_exported_dma_buf);
> +
>  /**
>   * drm_gem_prime_import_dev - core implementation of the import callback
>   * @dev: drm_device to import into
> @@ -933,16 +953,14 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  	struct drm_gem_object *obj;
>  	int ret;
>  
> -	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
> +	if (drm_gem_prime_exported_dma_buf(dev, dma_buf)) {
> +		/*
> +		 * Importing dmabuf exported from our own gem increases
> +		 * refcount on gem itself instead of f_count of dmabuf.
> +		 */
>  		obj = dma_buf->priv;
> -		if (obj->dev == dev) {
> -			/*
> -			 * Importing dmabuf exported from our own gem increases
> -			 * refcount on gem itself instead of f_count of dmabuf.
> -			 */
> -			drm_gem_object_get(obj);
> -			return obj;
> -		}
> +		drm_gem_object_get(obj);
> +		return obj;
>  	}
>  
>  	if (!dev->driver->gem_prime_import_sg_table)
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index b4f993da3cae..9ee697ff52ea 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -287,6 +287,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  				    struct sg_table *sgt);
>  int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			      struct drm_mode_create_dumb *args);
> +struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct drm_device *dev,
> +							 struct dma_buf *buf);
>  
>  /**
>   * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
> @@ -298,4 +300,17 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>  	.dumb_create		   = drm_gem_shmem_dumb_create
>  
> +/**
> + * DRM_GEM_SHMEM_DRIVER_OPS_NO_SGT - shmem GEM operations
> + *                                   without mapping sg_table on
> + *                                   imported buffer.
> + *
> + * This macro provides a shortcut for setting the shmem GEM operations in
> + * the &drm_driver structure for drivers that do not require a sg_table on
> + * imported buffers.
> + */
> +#define DRM_GEM_SHMEM_DRIVER_OPS_NO_SGT \
> +	.gem_prime_import       = drm_gem_shmem_prime_import_no_sgt, \
> +	.dumb_create            = drm_gem_shmem_dumb_create
> +
>  #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index fa085c44d4ca..ec83f1c077a4 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -100,6 +100,9 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
>  
>  /* helper functions for importing */
> +bool drm_gem_prime_exported_dma_buf(struct drm_device *dev,
> +				    struct dma_buf *dma_buf);
> +
>  struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  						struct dma_buf *dma_buf,
>  						struct device *attach_dev);

