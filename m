Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D84CA5F03F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB7710E829;
	Thu, 13 Mar 2025 10:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gFaS1/5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D167B10E829
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/jTV46vm4S/fbVd40x98HuowHstroe0PZv2z0w0BRVyYeHNb+UTbg1dAicQ3S/6l6d6fvplnIjCOB4X7wG+08FHhz5Cph2lUgGRbAQ6FDsh6cb2QldH0nksr2rW0fBocjIuhDVmxIbWHkMbALG1LL6497s7wJ30mYJ/HXz+37ktW8NTp99YahNWxuC9vYXWnJ1V1kkZ609kQ9dKDR1rFagtYVfWHFRjDvvpTlQBLMzmK/4RRUHzdd9Dy3Lqevn6d6q3WYgrg3zRUi9sYSas2m9/iM4efQLgrhSupYCQVOzJK0H875YWymkjcjVsV4LuJY2Tiwf+QO+ZoRJPLlaQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OckP4Gg/lzIdiNJjeurIPaQr28SiJnbt9scVABz2lJg=;
 b=Jil/qSLrIq6r0xS3cF1OKGtWUIOuisagtCdcIRPv5jOd6PmsBPde6xz/2CLQYzF0vaHxM/51wMorvKhQNJWbVBpH6uXTEX58JqbfzOurOeoOCuOGZSb/1cPV9jTueuksUVHdVeMZnEvWEi+myiVa0/lyHuyo7gug2NTywdHcKip7rvfarC/zrVHZRxoVsHh/KLg5HA1t8MPbD6er4W2UhAVwmHrG5onBkK+1GVBdNR/rSfVL0MisQ5lMrs9bBhfCYzCRL1V/SZOz0ZIDWVN5feCZJ+fc6JbdtBBlX4457lKGgJznYO2zUNVyrKKd67BD1dG/5Y6uIassvirkzvmPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OckP4Gg/lzIdiNJjeurIPaQr28SiJnbt9scVABz2lJg=;
 b=gFaS1/5k1qS/3ge3XQP3kaQJjRo2SqA+AZtMOc23t5oUjHNxWZU1swirIFTrFICew9uPXMRkGZYjzyVJrO0XKGyPYkcnbzZmtG/mg4w+aGvO7sm9sYb5OrSDTU4YNMCXqz6SJeA9VDPExxfWNkPcKKqdlE+BYKzxWtTcTEnqwlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7034.namprd12.prod.outlook.com (2603:10b6:a03:449::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 10:07:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 10:07:26 +0000
Message-ID: <d02a205a-c7e7-45a5-bcba-b5a5a6bebf4e@amd.com>
Date: Thu, 13 Mar 2025 11:07:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Clarify docu concerning drm_sched_job_arm()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250313093053.65001-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250313093053.65001-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: d55b2a24-ecda-450f-859e-08dd6216db11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXJzMWlMbFJaRmIwQW04NFVJU2srTTZxNEZUZFpMd28wMlRNem5PQTBlZVVR?=
 =?utf-8?B?RitBV1JrRjVjV0pMSGdLa0JtM3hpcENESGlnM0Q3REpSbURvZmh3VjNKdXdw?=
 =?utf-8?B?QkxUKytLaUwvMjh6cmExYS8wRXloTklzallCeHBqNStjdXlwU016aEIzKzJm?=
 =?utf-8?B?QWlUOUxhRTlOY1RERmRBeEhXdkNtVDB0WFpTZlkweDJuaHhGZ0xMOVY1Skd1?=
 =?utf-8?B?L2NrWVd3dC9waEZLc2l2WXErdTMrenV3SkJlL2hBUTRZTTJlc1p0NjAyNUxD?=
 =?utf-8?B?YkJ0cFd0dTVzMW9kVG1KL2c5Wjk0UnlhNWw5M1I0QUhlbmovZFFBRFJKWHFH?=
 =?utf-8?B?bGtHZi9QZzN6WSsxQjZ6Z2h2MG4zOGE0VlZKdkp0VGJRSXBieG5Xeis0eGhP?=
 =?utf-8?B?NVBPTjFuZHdzR1htRFU5Y1dqUkdzS2dwb2FHQlBwUCtFZGNBV0RPQXJDNmho?=
 =?utf-8?B?K3JVVklFbXhabkwwMFo1M2hoK1ZoOEt1UEF1dDVsT2RyOGxxQityalVXZlBP?=
 =?utf-8?B?RXppTEUyMkp4QXVHaDljclZCRmQ2cDZpWVBMMzcyL2FxY1lzaVpXc1E2bkJR?=
 =?utf-8?B?V2NGMXpsNmdNczg3OWdzL2JDamhNaEpmeDNlL0VESHIrNjIxaW1ralMzajBx?=
 =?utf-8?B?TmdCaTBuNlM5TnZjSWQ5U2JHRWZXQUdVMVg3TGFxUzNleGV6V2pRQ1BjWmxK?=
 =?utf-8?B?VThaUFpsWWl2Uk5RVUZWeFVqZU5JN0tZeVFoMEJacVJnelBudWdGeWVkL2E4?=
 =?utf-8?B?THVNK2FkRTNPTU5tWHppNGI1RFJiRHJoYVlhT2Q3ajVEb0dWTXFoWDE3ZldJ?=
 =?utf-8?B?N3pJTitFV0EyWDZsbHY1SUhWaHlJSkp1ODFYRjRZdFlYOU9GdFlTR2tWdGs2?=
 =?utf-8?B?eDN1R1V5eGxKNnBSZitNeWRMM1N5em1GSTUyNURtS3o2OURqY1BPdE0zNWtT?=
 =?utf-8?B?aUY1bjkrdzdVd2U5NEtMeHUvN1VVSFAwN3M0Q0NMTzhTenhocWd1UitVTU80?=
 =?utf-8?B?MVlhdTdCV0R5L0xCTHlvaHJxZEhUYWxoTkxvSVM2MUlCQ2Q4eWljYVRnLzFr?=
 =?utf-8?B?U2hzVVpOQVRmaUh0a1ljRFFsdUN5SjFDZnN0aUlBZmNFQjlWUC9tdG12bU9C?=
 =?utf-8?B?TnF5TndjMzcvODM0bDFlZ3ZpVXhQTDdnYXhpSHRSeXdUTGN1NUF3d2hCbnh4?=
 =?utf-8?B?V0haZUN6YTl5cytmblI3Wk9kS0VYZ3hlaU9jWWN0R3lTU0laWTdYNVdZejJM?=
 =?utf-8?B?clhRNkJCMElWYnkvTGpRKzhlZDA0cTIzUTVQSUoyL2Vxb1dNY2pMd0FJOVZL?=
 =?utf-8?B?bkJRZUM0R0FKem5QYkc2QjRqRStxelFTU0RUUVNWRE01bytQd2JRb3FuYTVw?=
 =?utf-8?B?dFA5ZCthZVlvUXF0ZTZLeGx1b3Y0UWNlckV6T2JCdjFYK2ozQVFHTlN1R2ho?=
 =?utf-8?B?cVNZUlJHZ1ordEtuVWNsTUFDWC9PMjdhRjhtK1o0ajJHQi8vZUdDUUdad3JP?=
 =?utf-8?B?UmZBdE90YUdnSzAyVFlWT3BFU1hFSWx6c0Z5N2N1dkVhUlkvK3dDdUlZZ2o2?=
 =?utf-8?B?cFFtVlFNekpLTUx3THltQkVBSTZoWStJRjV1QTFFNnFseHZFYW1JR1JxMzJN?=
 =?utf-8?B?VklzbVlLU0xvTDVhWjNHcXBvaXZKN25OcW9uSlYzTXV4TTZhTDJ2dHNDbm9p?=
 =?utf-8?B?MFh6UG5QRE5tMkxKVWM3MDZ1NmNsYVZVMFVDVEJpRVFEK2dmaFY1TVhCNkl5?=
 =?utf-8?B?RjZDbEdXb0R4cTZGVHlYMmkyS2V6bUN1MmZhRm1Qb1UwakNVanFoRnhKakhy?=
 =?utf-8?B?SWR1eVpwZUxKd2w0RUlSQkdUZlI5VWQrMGdJVkUyd1dlaTZwK0d3UFZCZ1VK?=
 =?utf-8?Q?Vj+q3skFTF8CN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFhsdzVXS0puQkwwSGVVNjZnU2FWbUc2bXBCeHpPSVpuWlpHeGRIMm5uclpK?=
 =?utf-8?B?MDVSeXdxOEQwZHFZNlcyUElCY20rK3RGaFJJMlpkWE1jSGRLT09VWUFMb1hG?=
 =?utf-8?B?eURpT0xlNUR3eEtEYlFOTWt5UkZWYVdRRUF0ZWhSL2oyTmpqellNaUFWdDgv?=
 =?utf-8?B?STY3d3ZvbE5Ja2Q5VUFzOVdwZDVzMTY1MlNyZ0didUxlSTV1SzZveWV3RTBj?=
 =?utf-8?B?eGpUNCtyb0pxRDNqaVcveHlIcGJmUDA1VExZVFdndW9ncnB0MGtiTGhPVDI5?=
 =?utf-8?B?OW91c2NvRUxXVkpESnUyTnJBUzUzMjFYSG5YUnpma1g1TlVsTUQvUndoRlVh?=
 =?utf-8?B?Y3ZtTEdxaVpNNkdVNlNWaXlRZXpwaU40QzJuTDVSL0hxWXNLb2x5R2M3Mk8w?=
 =?utf-8?B?YWRRcmhOK3VWUGI3MDVpc3FHOS93MGoyV1p3cFVBdWRmc1VoZ2d2TGc4L0NM?=
 =?utf-8?B?TnQvUDlId1BMWjJLZGNRTGhwQkFsWGkySHd3STE5OVBHQ2g3ZG5VaWhnOERY?=
 =?utf-8?B?Q0tnZHNXTVd1aWFJUjRPUGhOU1N4b1BlUFFyMkNFU1BheUZOeVByNldQZmlz?=
 =?utf-8?B?RzU3OXgwaitGcWJQbW1LNlBvRjhiZFEzWFdEa0JEbFc3N0IxZHZ4SkxQSWlF?=
 =?utf-8?B?N3BGenRTNmxsM2lNL1hwQW9VSlpBajJqYUNjMzZSR2tEQ0o1czVrcmhRYTlH?=
 =?utf-8?B?YVN2UE5yRjlzTUpybGFndW5meUM2M0pvR1Y4VVpmR09UdWpxa2tIMnNvb3FS?=
 =?utf-8?B?RXNsOGs4b241ck5xWVBzNmdtSUhBYlM3WVZxSlg5SlgxK1gvSW1CODhyL2RT?=
 =?utf-8?B?SS9VYkgwN0VYQ3RjRkpTTHRnYUw5dWEwQVZQZENrSytVekdkeitoTnluZUU0?=
 =?utf-8?B?MVBxVlV0WjJXd0R1cDJyYVpreFRzUHFCN0o3N2pyaXNtalVqMEN5QmYxNnA3?=
 =?utf-8?B?czgydUJBS0IvK3N1c3RJYko4NElGN2FrS1F6NlZpRnFWbDZJckc0aS9hRmVP?=
 =?utf-8?B?NUtFSG1PUkNpb0FvQUJpMG9wYi9WbjZjeDB1ZHZyMXVvV3VUSlhXZnUrMkZX?=
 =?utf-8?B?d3hGY3Rwa04yVVlQY3dWWXBWS1JET24zOUwvWUk3dUhNbVFIalZ6emJCL2Fq?=
 =?utf-8?B?Qmx3TjVkdG5WS3VGMEFLaVgzQm93aGUwYmdlN2hKS3g0aGQ5K0RmdFp5bVlk?=
 =?utf-8?B?MGpJYkYrbmZYM1pPV0Q0UkpzS3E5VEI2cWxpcmFXL25pc1p1TWh1ei9jVFE5?=
 =?utf-8?B?ZjlKdXhtNlNZMFhVY0crUWJ6N2hOQngwMitwVVZyTVpUdHhqR3AwekhCTUJi?=
 =?utf-8?B?ekpMTitXVTBBbUhNbWhXeC8zdjMwUmtpK2ZsL3F6VmxRVkc5Ly9qL2pJUHVv?=
 =?utf-8?B?aUxUay9wTnRJWXg2TElqV3hXbVl3L2xhUUV3RllqSXhoVEorUHV1N1h0bDUz?=
 =?utf-8?B?eG5jdnJzVTltNTIwc1YxWDdIdGcrQ1k5ZWJtN3Q1d24velBYK2R3RzFVa2Rz?=
 =?utf-8?B?KzR5N25qL1ZMWHYwV2tFanp4b3lYZEgxaXlaU2k3L1JzRjRjL01VNlNGQ3Uv?=
 =?utf-8?B?dC81VTNvbi9SWW50VURXMHUxL0l1SDd6L2ZScFVDU1Q2ejBpak8rZjVEQkJx?=
 =?utf-8?B?d1pFNHpwT29ZMHFRdHJWNFJWQXk3c0VQRUtkQ2dGc3lZSzZxZWh1N01jTCtM?=
 =?utf-8?B?ci9Xd2QveWdvMnZsODA3OEE2QVdwT3hXa3ROckJmQnRwSnJoMVpsM2dXNEkr?=
 =?utf-8?B?TW5YZHhoaUZLem91cFZURGVJSlErQTErVmFEM2psVTRTUUhjNUVPQTgzVkdN?=
 =?utf-8?B?UGpwL1N5QmJwTTBDOGtZRC9VQXhBNlBLZyt0ankwTVQxNHJnZ1ptRHpURDdY?=
 =?utf-8?B?Y1JIbUpoVlpkMXVTZFd5SFhKNDF2Z3VDUkNBOUdNMGVWUEZxK2FDTEFIOG13?=
 =?utf-8?B?dlkvazVUamQ3eVZxNTVTUEtBbEgvbHQyS3BxWGVKTWhVK1MzSjlBSzN6ZzhN?=
 =?utf-8?B?bXUzZDhqRFMzWnEvbkdZSFpzSDI3SEUzcmdDcEVHYyt3Nzk4MEJYYjFxd2hC?=
 =?utf-8?B?ekRDbUtWYWxXMHRBMUxwQUVKaTBGS0ZCS05UZ28wTWFncVZ1WGVmN1lScE5v?=
 =?utf-8?Q?eMZQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55b2a24-ecda-450f-859e-08dd6216db11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 10:07:26.3454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBxGDn0htkIISmi4IUWGtnR/ekRg75Y9OmkXotxUIRePoeZmS1NuWomqFWlneakL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7034
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

Am 13.03.25 um 10:30 schrieb Philipp Stanner:
> The documentation for drm_sched_job_arm() and especially
> drm_sched_job_cleanup() does not make it very clear why
> drm_sched_job_arm() is a point of no return, which it indeed is.
>
> Make the nature of drm_sched_job_arm() in the docu as clear as possible.
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

I'm currently looking into how to fix the amdgpu CS path for gang submission regarding this.

Any objections that I add a preload function to allocate the memory for the XA outside of the critical section?

Regards,
Christian.

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4d4219fbe49d..829579c41c6b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -828,11 +828,15 @@ EXPORT_SYMBOL(drm_sched_job_init);
>   *
>   * This arms a scheduler job for execution. Specifically it initializes the
>   * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
> - * or other places that need to track the completion of this job.
> + * or other places that need to track the completion of this job. It also
> + * initializes sequence numbers, which are fundamental for fence ordering.
>   *
>   * Refer to drm_sched_entity_push_job() documentation for locking
>   * considerations.
>   *
> + * Once this function was called, you *must* submit @job with
> + * drm_sched_entity_push_job().
> + *
>   * This can only be called if drm_sched_job_init() succeeded.
>   */
>  void drm_sched_job_arm(struct drm_sched_job *job)
> @@ -1017,9 +1021,12 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>   * Drivers should call this from their error unwind code if @job is aborted
>   * before drm_sched_job_arm() is called.
>   *
> - * After that point of no return @job is committed to be executed by the
> - * scheduler, and this function should be called from the
> - * &drm_sched_backend_ops.free_job callback.
> + * drm_sched_job_arm() is a point of no return since it initializes the fences
> + * and their sequence number etc. Once that function has been called, you *must*
> + * submit it with drm_sched_entity_push_job() and cannot simply abort it by
> + * calling drm_sched_job_cleanup().
> + *
> + * This function should be called in the &drm_sched_backend_ops.free_job callback.
>   */
>  void drm_sched_job_cleanup(struct drm_sched_job *job)
>  {
> @@ -1027,10 +1034,15 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>  	unsigned long index;
>  
>  	if (kref_read(&job->s_fence->finished.refcount)) {
> -		/* drm_sched_job_arm() has been called */
> +		/* The job has been processed by the scheduler, i.e.,
> +		 * drm_sched_job_arm() and drm_sched_entity_push_job() have
> +		 * been called.
> +		 */
>  		dma_fence_put(&job->s_fence->finished);
>  	} else {
> -		/* aborted job before committing to run it */
> +		/* The job was aborted before it has been committed to be run;
> +		 * notably, drm_sched_job_arm() has not been called.
> +		 */
>  		drm_sched_fence_free(job->s_fence);
>  	}
>  

