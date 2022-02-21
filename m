Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6BD4BD904
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0208910F269;
	Mon, 21 Feb 2022 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F8610F26F;
 Mon, 21 Feb 2022 10:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxNMuIHU4UQoSqP+mYoruVsbJIsV+O2X8O0QBp5vBf651pzkS5XX3zJDR3zRt5BkL3uqPPOvbciljfNPhsmlhZBbjZESQEKOlkgN5TGYhGss1x/M5j3xfq+0CUV8JXAs997GKtFsW/4Tb1RKFls8G0RpURc2eM/UBQYI/JzEu1n3J1dabEq8TUpjkfSH3W6osxhFrs3gDd95dVgrfqIJteRDxu8opmhLuKtDg2aUS/tunstvtTzZ80kefwGSUSX+bsDbsQnxnWLxRGCS7Z7UKO+2GDYzUhpqlOeygXZJFCdCsuYhvRort75g0INMz9UR70Hc925w1wgDk+e4842lwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j1bR2/3ird+1iz/aWgpnp3JHm4B+AAzHFtVSEddkVI=;
 b=XZRVMWpfNt0rkDNQBEvUykHmfJ8yl3CDAqhKGvoGYGQhqmvbVwJD4V1GVXnyZBU1iAiLyCVQdG4Qcvf8NBS2T5CyCJ9holAoQp9HpHPiqT2+vBMj4dZBseI0XqaXvYZsjl+Q7tB23/Wrw4LB89b7jSHe1fjIJ0kePSfqw3/NLnzGblxQ428wVan509lpjCzMMpyGwFNxdRk1XEcyX063ut9732vIGNWypOKVl7n/4qBnYSjVz+98+Recs6TouSfbgEV9PE8XjDWJAxEZ0aC4sP0kATTx16P4pLIBzSjUCZAAMru1oAYmmf/5ixzkRU2SbQUS1ydY3zLe1n2Nq2c05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j1bR2/3ird+1iz/aWgpnp3JHm4B+AAzHFtVSEddkVI=;
 b=h/+e5VDkI0h477bDn09YHkG0gT2ReXhALHVSmzJjOgYAA7er2PFZUtN+aQ9N2pnehhqsFPPaFhVGUTkaGf+2UfxLqHqulUTyODPODw6pBH9z5Mmzm6aq3dw+e7ng0KeaQY8LQwdnhsA2GeXsA3tuxkRMpwAPqz2GqBS9svM3X24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 10:17:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 10:17:15 +0000
Message-ID: <47dc8f0a-cdd2-39e5-5ffe-ac9da38951d9@amd.com>
Date: Mon, 21 Feb 2022 11:17:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Content-Language: en-US
To: Jiawei Gu <Jiawei.Gu@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Andrey.Grodzovsky@amd.com, Monk.Liu@amd.com,
 Emily.Deng@amd.com, Horace.Chen@amd.com
References: <20220221095705.5290-1-Jiawei.Gu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220221095705.5290-1-Jiawei.Gu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0502CA0021.eurprd05.prod.outlook.com
 (2603:10a6:203:91::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0ee4ccf-86c1-435b-89f9-08d9f523556a
X-MS-TrafficTypeDiagnostic: PH7PR12MB5975:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5975F608490FC10259E3FCB5833A9@PH7PR12MB5975.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5yPHt4JjJzvszXvpookGX4SYOO+iMHQv1URGmahQBpKu76aZBho591VzSwQDiNbRjm+R78AVO/b6hA/i/ndnbnBesyb7HA5zV6+Vymdt8ctr8HFobSX4U8vLcfnmL0v/9ABD0ONYh/UKqoMekiMVTZpS+aOa17XHOMuzZLs8QnrBjlesAnF94Qd4JUefc+EYyHsob+fH4V4A5xEMGoH+fOXu7DGNYfJyc1j+jUeYfCR+4+S0QA0OHHuxx7RRzuNz9v6esPpNu1uswm70iRrmzhyXRUF0SybCIes6NJfw0Kp/sGPbM0muqCB8ZCanuEVfPVs9q1DpU0bA04igoWW+4RFgv+qrszDvvD0yokJoBd5Dv3PVW/o1K67MzJvA514/advlEwEn/bvOmpPf3ksm7uzc14CIMenWb6qugg3CpSyiZzWOmP162RPwcLZ3627p5OksiT+/P1vNmuwpTwAW7qgVPniV2OsP0Q62xjCcAoZ+SpPINk2xLZD4R/cok6iFpzCJO0SUTF+XKYhC/ifj0HOLjrMT2qzbJmNryXfnw0n/sMjfAFwYaooncJHf4zSIOUlX4gUKeCNauapXxgvK4IpnNWi0I/DnUcaMvABEgb0MT47k5CZ+p8ydlDDXKCbVA5NgRIebiAicUNrhx1hz44+srZZmRPAPCR6gS68dwJoLyBFaVQz+RCAcvu7nEi4Uv5r6jTsUL0M6+RG8lRiGtclSzm5yDtZgB0+JbbNtEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(6636002)(36756003)(66574015)(6512007)(316002)(508600001)(38100700002)(31696002)(6486002)(186003)(8936002)(450100002)(6666004)(26005)(8676002)(66946007)(66556008)(66476007)(86362001)(31686004)(5660300002)(2616005)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytmSytyM2hxblUvK3lwUkU3eXMvQ1Q1SDhoRHNqNWx4c2hEY0NNVkFkcTEy?=
 =?utf-8?B?aU16bkcwRkZ4VHV3KzNyMWI1NHk3VmZ4b2lwcjhIR2E4bmJETzREbEVvQ21p?=
 =?utf-8?B?YVZxZkJPMmQ3Wi9CaUFoUEpzWFFka3FXVWNnSlVjS0dKT3BZT2pUTWhtaHhY?=
 =?utf-8?B?RzZhVzhnNDNpMDBkQjR1cEtCaW8wcUcxdlVtVzJDZ2tlNDVqUzJ0b2VsTmE5?=
 =?utf-8?B?MThkWXZYb2JxVEJVTXp3ZndKQkg0eUNnTlJQcWtTckZ2ZzJ5ZklRR05TTFd5?=
 =?utf-8?B?SjY5QTRQSDNzWVpmdUdKZjl1dmIwU2pGQitjWGhRR1plNDA5ZTViNVBudGxw?=
 =?utf-8?B?S0NtQ3hhVHh5dWZiVWROMWJaZkZYQ1BzOHM5OGpiMTRzYXp6amJuazRXS1dm?=
 =?utf-8?B?ZjFXU1VIeWgzSmNtNXZTMXZuWHlJdlFSc3N4RGFid0djOGt2L3R5L3UzVlFW?=
 =?utf-8?B?Y001M2VuQkJvUjNOMEM3V3YzUlhmMERPSnd2Qi9ZNFp5eG1ubCs5TXN0WEtN?=
 =?utf-8?B?MjJjUFhmYTI2bHhobEViMDFFUndSWHhmY2NqeGhXbGQ4ZW5SSlpuaTdMU2Vo?=
 =?utf-8?B?OHgzcFN2ZUpHVysvWHYxUlNDTS8rWnVDZzdjaE5MZWpEKzJUSk00RzFYcEY1?=
 =?utf-8?B?eWZzY09HT3ZRZWtJMDY5UU5LaGsrMDJET0tVNnQ0M3A2Wk53Z3JLSjF1VTh1?=
 =?utf-8?B?UHhmNXQ2UFRXcWRuVlNVYnR0MXcwMDAzSE40TmdaN0FwbXBQbGJrcFc3VU5L?=
 =?utf-8?B?S0V0TWhvVzAzZ0EwcVhPNmc0bzRja2JiM2JOWU9KOFBQSnkyUG9ZMkJqSjRm?=
 =?utf-8?B?aGdiNmp6UW4rVXdRdnZySmpqRnI1Q04wa0dMbC9pMWdPODRsVjJDdVlnUmdw?=
 =?utf-8?B?YWs2eHk4S1Q3b1lBSmxqY21IbjhPWXlWTEtnKzJBU0VqeGZmY2pIZWNWWUd0?=
 =?utf-8?B?M0ducWFCNzJra1BJSExVemhkdmhRY21aNjd0NWdocVhFYUR6NS9Nb25ZVmc5?=
 =?utf-8?B?VE1mZXhMc2dnSFZabDFRR0hLTFBzcHYrbUwwU3NjYnNyOW00NWdCSUdxaGZH?=
 =?utf-8?B?VGxzOVJOQzlzSUhVZXB0eGZocGNwR1FtcTgvcmZ4Kzc1aTBBTXgxcy95WXF2?=
 =?utf-8?B?NHh5WjRtdEYwRGE2ODROTGNkSENzWFZhOTZ3MzZCOERxY2ljZFpteE0va3p4?=
 =?utf-8?B?a041NGwvQjVXc1hvQ0Jaa2xYbG5CdlQ3ZWFpTHpnTnIxWjNWUVN1dGlkRS9r?=
 =?utf-8?B?N1l5YndrcEhkVUJPQlV2eExGVktMYXVrTFJhaHNGQkVWcXUrU3k5Skt2eG9O?=
 =?utf-8?B?VGp2bmh3V0plMHJOTndPbys3czEvaEVqSFhranFlamlTTHdXRmpjY2N1SWEy?=
 =?utf-8?B?Wm5jR1pKZi9vZFVJbGZNWjUwN1I4bHJzNUN3WXU2Z0pDYlBsTDBlZjkxbXUv?=
 =?utf-8?B?T1lIT1A2VHVhbElhaGFueHlldURwYTlaVU0xQktRSmZ5c2FXUEptdUNZYTk2?=
 =?utf-8?B?NXJqd2FQSmZnNllYbkM3WFQ5Vlg1ZTJWanZvT20yeWpTNzM2VkdoclFpYmRi?=
 =?utf-8?B?alg2ay84SDhpazUxNWwyR1crbTc3aXhzdmhFN0pIK0FTT1BEcXRlT3Z3dXJQ?=
 =?utf-8?B?TWlFQTk2dFcwZ2JTM1g0VnBnaytudFR2Rm8yOFpqOVFld2kvRmE2eVdWeW0r?=
 =?utf-8?B?K1ppUFlUSVoyVUV0ODF4OW0zeDNHTkFXd3JBMWFWRUxKbGZVOSs3TVNUQW9i?=
 =?utf-8?B?YTR4NUM0SGRpTFlybExhTW9xVGtYZmRwNmR5eU1hNTVFZlQxUkZ4Q3pnSFVV?=
 =?utf-8?B?M1JFVHBiamZ3WFlPcEZIcVdmMXFxUjM4b1JJK1hqQUZPcU9tYmQxTzNWQXpF?=
 =?utf-8?B?QTdxdXdZMmFvUy9CcXMwT25ESlYyODMzUjVrVTlES0dOOUloVUxNcW1pMTZi?=
 =?utf-8?B?NjVWTnNzZ1ViRVJWSXdFaEdrdUlqRktpYnpXTTFOT3p2N200b0UvdytZaHZa?=
 =?utf-8?B?bDJ1N3dEc0VhUW5qY1pQZk5mWlZXMnA0UTlDc0gxdkVSZ1J6RXpFWHVRQTBo?=
 =?utf-8?B?dThTL0hCRXVrZEhyVElVZlJRTzFibTVpUHNoRmZxTGFxZTc5N0s2aTJPMGpN?=
 =?utf-8?Q?kUXQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ee4ccf-86c1-435b-89f9-08d9f523556a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 10:17:15.8154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/bjowxfO+TF1HaD3ijyuuZP4GQWOGsJgXGSrPX0t2+H8uERGjatJdxiDNY2nk5A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975
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

Am 21.02.22 um 10:57 schrieb Jiawei Gu:
> Add device pointer so scheduler's printing can use
> DRM_DEV_ERROR() instead, which makes life easier under multiple GPU
> scenario.
>
> v2: amend all calls of drm_sched_init()
> v3: fill dev pointer for all drm_sched_init() calls
>
> Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

When Andrey is fine with that as well I think the best approach is to 
push this upstream through drm-misc-next since it touches multiple drivers.

We can merge it into the DKMS branch as well if necessary.

Regards,
Christian

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  2 +-
>   drivers/gpu/drm/lima/lima_sched.c         |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c   |  2 +-
>   drivers/gpu/drm/scheduler/sched_main.c    |  9 +++++----
>   drivers/gpu/drm/v3d/v3d_sched.c           | 10 +++++-----
>   include/drm/gpu_scheduler.h               |  3 ++-
>   7 files changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 45977a72b5dd..cd2d594d4ffc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -502,7 +502,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   
>   	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>   			   num_hw_submission, amdgpu_job_hang_limit,
> -			   timeout, NULL, sched_score, ring->name);
> +			   timeout, NULL, sched_score, ring->name, adev->dev);
>   	if (r) {
>   		DRM_ERROR("Failed to create scheduler on ring %s.\n",
>   			  ring->name);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 58f593b278c1..35e5ef7dbdcc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -195,7 +195,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>   	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>   			     msecs_to_jiffies(500), NULL, NULL,
> -			     dev_name(gpu->dev));
> +			     dev_name(gpu->dev), gpu->dev);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 5612d73f238f..8d517c8880e3 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -490,7 +490,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>   	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>   			      lima_job_hang_limit,
>   			      msecs_to_jiffies(timeout), NULL,
> -			      NULL, name);
> +			      NULL, name, pipe->ldev->dev);
>   }
>   
>   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 908d79520853..a6925dbb6224 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -812,7 +812,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   				     nentries, 0,
>   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>   				     pfdev->reset.wq,
> -				     NULL, "pan_js");
> +				     NULL, "pan_js", pfdev->dev);
>   		if (ret) {
>   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>   			goto err_sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f91fb31ab7a7..b81fceb0b8a2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -491,7 +491,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   			if (r == -ENOENT)
>   				drm_sched_job_done(s_job);
>   			else if (r)
> -				DRM_ERROR("fence add callback failed (%d)\n",
> +				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
>   		} else
>   			drm_sched_job_done(s_job);
> @@ -957,7 +957,7 @@ static int drm_sched_main(void *param)
>   			if (r == -ENOENT)
>   				drm_sched_job_done(sched_job);
>   			else if (r)
> -				DRM_ERROR("fence add callback failed (%d)\n",
> +				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
>   			dma_fence_put(fence);
>   		} else {
> @@ -991,7 +991,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
>   		   unsigned hw_submission, unsigned hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name)
> +		   atomic_t *score, const char *name, struct device *dev)
>   {
>   	int i, ret;
>   	sched->ops = ops;
> @@ -1001,6 +1001,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->timeout_wq = timeout_wq ? : system_wq;
>   	sched->hang_limit = hang_limit;
>   	sched->score = score ? score : &sched->_score;
> +	sched->dev = dev;
>   	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>   		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>   
> @@ -1018,7 +1019,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	if (IS_ERR(sched->thread)) {
>   		ret = PTR_ERR(sched->thread);
>   		sched->thread = NULL;
> -		DRM_ERROR("Failed to create scheduler for %s.\n", name);
> +		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
>   		return ret;
>   	}
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index e0cb7d0697a7..080710fd8eb7 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -391,7 +391,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_bin_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin");
> +			     NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
>   		return ret;
> @@ -401,7 +401,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_render_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render");
> +			     NULL, "v3d_render", &(v3d_to_pdev(v3d)->dev));
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
>   			ret);
> @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_tfu_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu");
> +			     NULL, "v3d_tfu", &(v3d_to_pdev(v3d)->dev));
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
>   			ret);
> @@ -426,7 +426,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     &v3d_csd_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd");
> +				     NULL, "v3d_csd", &(v3d_to_pdev(v3d)->dev));
>   		if (ret) {
>   			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
>   				ret);
> @@ -438,7 +438,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     &v3d_cache_clean_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean");
> +				     NULL, "v3d_cache_clean", &(v3d_to_pdev(v3d)->dev));
>   		if (ret) {
>   			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
>   				ret);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index bbc22fad8d80..944f83ef9f2e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -457,13 +457,14 @@ struct drm_gpu_scheduler {
>   	atomic_t                        _score;
>   	bool				ready;
>   	bool				free_guilty;
> +	struct device			*dev;
>   };
>   
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
>   		   uint32_t hw_submission, unsigned hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name);
> +		   atomic_t *score, const char *name, struct device *dev);
>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   int drm_sched_job_init(struct drm_sched_job *job,

