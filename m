Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB944BD50F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 06:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420BC10E1DC;
	Mon, 21 Feb 2022 05:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E31E10E1B7;
 Mon, 21 Feb 2022 05:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbsRIMriJGaMFVh/i8xU6Uvsm26zCMqzNCQZhMNWPZKP6pK8c/rxmbG90i+8yb8h+vuc9EjZQjX8gDRubsn5Z+PO2Y97Hx3y+wk6SFEKld3xp/lAS93p4tuXSbk1l+s0e6P7FpKGvPZa+CvSwHHdelk3M/elFwMZWqLEkdpFResk9M78XDq/IVYb5BcFAP9oqN7qIkraT7yP5AtoDSiKGBzu/hvsuEPHodPljCR8LGDFkCXrRR93JSlMxgr/wdPpejLK4UGa0nRAGvlbORIvE7mgVa1nu/OPx5N84YNnn1YUNzGUS3cOHFhM7LXFGf86g553NgSzPmXXvoiaC645wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNnOPlO5YptDhnpM4MtutFxg77hof0uyyNKAM8sKL2A=;
 b=SZ4RwjgLFCCtXsWj3+eioJIBxtVebC4ApaXBD+LnjSF8uY7uQLz+4plUC7PCigOLoMk863QcLNS39dXt9HgKjHTPlWlkaNnM/AzaD4Kbbrf/iBO71fu96FwLkjCAb8J0DKIRB3aZpVadLwwiQPl2p7CQMGl/+fvJSX9GpdH0xDebaU82RBfmBvA/zEtCypN+qEC22BPBeD9l5GIC8+cUT1ZEBsW0NpXPO/uKe83w1Vn6lHv1t4QPhiQmbRnv07f6onFw7iySmh3Ssq31ezjYb1x7QI8CSbm/8mL8iojwX77SFNtWO+WIxrBB9myQhiZsxctAe9aEMcmXTHttr+/TCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNnOPlO5YptDhnpM4MtutFxg77hof0uyyNKAM8sKL2A=;
 b=ZGOarFL/fHwJ5QRsggyQc+z7D52y5lSjFWeeyXQBGO2QG5t9HLRJTObivoGcrnJWz7Wq26Ns8xGB/P6HZYoszB+Di/09QK953yQTP84YiAo/lsa3CZPSUkJTTZxmlb64lh61byxh85Poiwcw5zqvI4o4HIYgVFRB1kl/4OxrVZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3594.namprd12.prod.outlook.com (2603:10b6:5:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Mon, 21 Feb
 2022 05:22:56 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 05:22:56 +0000
Message-ID: <e7715707-6293-fae4-cb4e-1d92040db634@amd.com>
Date: Mon, 21 Feb 2022 00:22:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Content-Language: en-US
To: "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 "Chen, Horace" <Horace.Chen@amd.com>
References: <20220217104331.6455-1-Jiawei.Gu@amd.com>
 <CH0PR12MB5156A295D22DB349CA263A75F83A9@CH0PR12MB5156.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CH0PR12MB5156A295D22DB349CA263A75F83A9@CH0PR12MB5156.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::22) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89345cb6-cf55-4d06-f08d-08d9f4fa3751
X-MS-TrafficTypeDiagnostic: DM6PR12MB3594:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB359434F392E93056F70E2CBCEA3A9@DM6PR12MB3594.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7y1IYzkXb/7NCWJOBHPWo/xW+AwKcHRtKDMJ42OL3UmhhPKDA7XiQbXEKfYOusM1bYgH0Di0mtHVE4ks+6k8haYL25KnetWpQmm5CSuV/WPqsaUvjqclEeMJB72PS4R96rdAM/U9Nwy9aTq56m0AsFY6yPPFD2yPEzrGNfWCn27C9aPTHCBQS7qV8F0tVGmJugM/f2/VdY4sxaLzG1A7mMA3WjP2onjEj631mi8jv7QHV7cGD1TvDqQQVHVyFZfpJavBvAGpDAjnkO/VtSjQwJBNpEVsDj+MSryD6sd/Tea7Pr0s1SP/n1hhLgo//3ICo7kDp0Q9ugO6rpVSP/ghU/GjUD40Fg4p1g5UEPr8BC9pUDVVX8oC0YhzyBFtnuSRYwMFtwD1oLs4sn+76j4E5LGAyxPgNmAciWUs2ZIN7OlyDBhg8c0uAnhE9dwSa5mzrpuXrZm0tnt6Nz7ehZgRJReI6w+F73EKk/GSWFWhYwraQ+Q9xVSF1bMGRvJ9nVJyRG6lKdd6E821Uv2QCqEmBvIikMiHScB/JyUpMJ3Ykz29RaWTAjgP4fr4YpwYAvUSB/knqGeNlU2zrwqDNxaRcXT1LHTYwGQuAu+D2wMCkC+P4NJURZx7zmsw+ZEb7FXwh2GAmWtMioCqtl+A+PZMsbyKMK13Q3O4jJ250EprKoPFa08+Cw916n6PYfpDM3jx0GHMv09sHcB+Ey16Sn6evCpWyRn1pkVxNuVI71UsYcUlti1p/UxMd6G8pEQAGANU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(450100002)(66476007)(66556008)(186003)(66946007)(508600001)(6486002)(2616005)(921005)(316002)(6512007)(38100700002)(86362001)(31696002)(6506007)(53546011)(6666004)(83380400001)(2906002)(110136005)(8936002)(31686004)(5660300002)(36756003)(44832011)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZoNUgwZWZPaE15aGRSaGVQY1FtOHRRcnYycUI5VjNwSm9SamtDUVBnV2ZX?=
 =?utf-8?B?TU1aMjNNN0o2eFRjck1KSUtCQUN6STA0SGQyZ0ViVUMwdm55dXIwcElpV0NB?=
 =?utf-8?B?TWpzMXViQVcvcDVWSWozZ0RqTXFOTVUxVFBxdElxSGhVMVhPVjFHZWlUMEto?=
 =?utf-8?B?Q0xGU1pjbEo3YXR1Z1huTmpjOTdUWVdxNURUNTFIdkN1Y2NBVjNEN1c0azBD?=
 =?utf-8?B?c0llblVyaUV2anpJdnEzSitRVDdneE1jQitOKy9aTStxd2RqY012bzRUcEJk?=
 =?utf-8?B?NFBlN29hRVNXNGE2ejBTMkNsNnlYRWVoY29DdXBLUW1CdFNqS0Vja1RoUEJV?=
 =?utf-8?B?SEQyM210V3FLZ3Nvdllpb09vZzJvVUg5cG1GSHdZbVBsN2lBOFIvSW9XTU82?=
 =?utf-8?B?UStCdXhaUlJVV2FpbDVadnpWb3U0RkRyeWpiV3pRRXZ4WHZvS1dwVktyRzgv?=
 =?utf-8?B?L0cyM1drMkVrSGxlVTh1WHZtVDN4Kzl0dURlVGYwYVZkRU1scUdHRklKZXRw?=
 =?utf-8?B?SVo3eklBcVN1Um9aZzlaWTZleXdPTmNpTFJ0SDhXY055eUtYUEVoUEdkSlZ5?=
 =?utf-8?B?aXl5UEdmZGVCK0V4bG1nbWhOY3hVWTVJbUw3cU85a01XeTNjdkFJaVc5QjQr?=
 =?utf-8?B?VDl5NUhFUnhXMXJ0aTJ2RU1PVW15MlBHK25LRDVYUjdBOVlkenJScTBNZDhz?=
 =?utf-8?B?YkpNK2wwT0c0OEQ5cHlaaUdZZmp4VjRNSWUwMEdsMjVxbGZrTUpVQVNVdGhy?=
 =?utf-8?B?QlpnTGRrRmsyU3E1eldhWVlCdlMxVGFuU1ZES3J6SFRWUlZaUmpQVEFON0hq?=
 =?utf-8?B?cVJrc05TV0FQVzBNeEVkWUZuRENxU3FlUURHVWpPZS96M3gycTVDMlFMY0Q3?=
 =?utf-8?B?a1BuNitwSFYzUUtIN1hMazR4UVN1bVprMU9tcGhnOEVxejhXRVdEa2ZUd1Ro?=
 =?utf-8?B?RHIzLzV6RVFGOXFycHVydWw1aFFDKzhtMTcxNGhpalpXSGppcEVZakRKN2Fw?=
 =?utf-8?B?NHVPVVk2RlZzT0ZoVEJHNlJuQjYyS3M0V0FsRExvT2NENnRvVFVrYStrUCti?=
 =?utf-8?B?cXdKL0o5bmZ4VU1NTlBmS3RuTUkrb0piKzRYMGJvQkxEblhYajZEV1UvOEJa?=
 =?utf-8?B?OUtZVitsOWh6bVhrVjJ1NUdzS3pMZi95SVFXOWVnSnIvbWZCMlZzUHJSRHVy?=
 =?utf-8?B?c2ZTb3BWYW95bHBDdkx2TTRPcFVwNWwxY2J3a3F4eE85QXRiWU5EM3ZvYTZn?=
 =?utf-8?B?MHFSaThJZUI0MVhDQkI2czkxMDFNYnI4MVk5dnFCNS92c3FIWk1TRUpWSTlY?=
 =?utf-8?B?ZW1vSHJEcUlYWlUzKzFqMllQeDRzU1pHZTkzY1lxQmttbHN1cG9aNWFlNzJI?=
 =?utf-8?B?dVBiYm91dWgrWW5CSU15Mk5Lamo5dU5oODBPUnkvdkR1c0ljaWtRVVVwOHB0?=
 =?utf-8?B?OGdqUjBoay81OU9keUFvcWNLQ3p5UE1TYnVwaFl3V0tlT2hlc3VOMVV5L3Vy?=
 =?utf-8?B?R3F5VEg4K2I0MzRacmFyNXhCWXhIeUM1aGM2azAybjhSUUx6U0ZkRTZIVFhV?=
 =?utf-8?B?a2hCcjd0c28rTU1nTE9qbW81RFhBSlhFRnZxcG5tR29rbWZ6ZVBwemo2M2ky?=
 =?utf-8?B?TE51dysrcW5TdmdEK3BMenRkYStGNTVlMVYwc05hZTMyNHZJdTBMQXBxeHdH?=
 =?utf-8?B?bHhYQlRzRjR1RDdwUmdVTHFJSjYxWU9Jd1M3emwrdEN2WDcxamQ2UmFrTHYv?=
 =?utf-8?B?dE40Qjh4VHB6Z0NtQkpRM01QemNSTHE0Y3dXaElvdW1SVHRhTE85SGV2ajVL?=
 =?utf-8?B?VkQ0S1dWYTVJMW9FSlBXM1ExeHBiTUhVSHhwMmRyOUVzRm1sRWNMeEpIVHc1?=
 =?utf-8?B?V3pEUTZzbXY0VmxxdlZxaXkyVDFUNnMza01WaFFKa3ZNbDVzV09iNWl4T3Jz?=
 =?utf-8?B?WmtqK1oyRDlDcFlrVWp5dzUrWFNWaGRHQndzMVArRjFkQTBoRStLK1ZvMFJE?=
 =?utf-8?B?ckFDOTd6eVp3Vi96cU5jdTNud2IvdC8zWFFIZVdOeTNzVUV3N29adVg1ekkw?=
 =?utf-8?B?UkpOQkh4S2FIM0xDZkhrQ24ybllRcDN5Mzg0eHdvYVlSKzZiVjNWcVU1eFZz?=
 =?utf-8?B?bm9tWkpFYWY0ZUhDVTBqTllDODc5UlpQZXhtVjF1MS9JUU9GK2JySk5xUjlq?=
 =?utf-8?B?dzQ4ay80QnlRWEpFVHNlVXU4Z3JlY240ZzhhK01MbWRNSlN3UUQ3WTFpVDFk?=
 =?utf-8?Q?u6njDWb0OyHnmpsOCQdPanRF4LWEUsiNTpmmCWTXK8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89345cb6-cf55-4d06-f08d-08d9f4fa3751
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 05:22:55.9566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4xoLTBE/aLOJPxkdj3YmMHo8d7r4OpyX0q5QjcTs0/XvA/wBHdtiusD5SzkIx5U7NtVD1EhsQoUTWZcNzEvrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3594
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

On 2022-02-20 22:32, Gu, JiaWei (Will) wrote:

> [AMD Official Use Only]
>
> Pinging.
>
> -----Original Message-----
> From: Jiawei Gu <Jiawei.Gu@amd.com>
> Sent: Thursday, February 17, 2022 6:44 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Chen, Horace <Horace.Chen@amd.com>
> Cc: Gu, JiaWei (Will) <JiaWei.Gu@amd.com>
> Subject: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
>
> Add device pointer so scheduler's printing can use
> DRM_DEV_ERROR() instead, which makes life easier under multiple GPU scenario.
>
> v2: amend all calls of drm_sched_init()
>
> Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com>
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
> index 4787cb3acaed..98217b1487fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -508,7 +508,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   
>   	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>   			   num_hw_submission, amdgpu_job_hang_limit,
> -			   timeout, sched_score, ring->name);
> +			   timeout, sched_score, ring->name, adev->dev);
>   	if (r) {
>   		DRM_ERROR("Failed to create scheduler on ring %s.\n",
>   			  ring->name);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 19826e504efc..4240f2ae0ab3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -190,7 +190,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>   
>   	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> -			     msecs_to_jiffies(500), NULL, dev_name(gpu->dev));
> +			     msecs_to_jiffies(500), NULL, dev_name(gpu->dev), NULL);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ecf3267334ff..4b3a43a2b3e3 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -509,7 +509,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>   
>   	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>   			      lima_job_hang_limit, msecs_to_jiffies(timeout),
> -			      NULL, name);
> +			      NULL, name, NULL);
>   }
>   
>   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe) diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 2df3e999a38d..215709d61315 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -627,7 +627,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   		ret = drm_sched_init(&js->queue[j].sched,
>   				     &panfrost_sched_ops,
>   				     1, 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> -				     NULL, "pan_js");
> +				     NULL, "pan_js", NULL);


You can extract dev from pfdev  here so no reason to skip it. Please
see in other driver if it's also possible to do.

Andrey


>   		if (ret) {
>   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>   			goto err_sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 3e0bbc797eaa..4404af323321 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -489,7 +489,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   			if (r == -ENOENT)
>   				drm_sched_job_done(s_job);
>   			else if (r)
> -				DRM_ERROR("fence add callback failed (%d)\n",
> +				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
>   		} else
>   			drm_sched_job_done(s_job);
> @@ -815,7 +815,7 @@ static int drm_sched_main(void *param)
>   			if (r == -ENOENT)
>   				drm_sched_job_done(sched_job);
>   			else if (r)
> -				DRM_ERROR("fence add callback failed (%d)\n",
> +				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
>   			dma_fence_put(fence);
>   		} else {
> @@ -846,7 +846,7 @@ static int drm_sched_main(void *param)  int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
>   		   unsigned hw_submission, unsigned hang_limit, long timeout,
> -		   atomic_t *score, const char *name)
> +		   atomic_t *score, const char *name, struct device *dev)
>   {
>   	int i, ret;
>   	sched->ops = ops;
> @@ -855,6 +855,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->timeout = timeout;
>   	sched->hang_limit = hang_limit;
>   	sched->score = score ? score : &sched->_score;
> +	sched->dev = dev;
>   	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>   		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>   
> @@ -872,7 +873,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	if (IS_ERR(sched->thread)) {
>   		ret = PTR_ERR(sched->thread);
>   		sched->thread = NULL;
> -		DRM_ERROR("Failed to create scheduler for %s.\n", name);
> +		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n",
> +name);
>   		return ret;
>   	}
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c index 8992480c88fa..6d68b155c3cc 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -403,7 +403,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_bin_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms),
> -			     NULL, "v3d_bin");
> +			     NULL, "v3d_bin", NULL);
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
>   		return ret;
> @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_render_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms),
> -			     NULL, "v3d_render");
> +			     NULL, "v3d_render", NULL);
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
>   			ret);
> @@ -425,7 +425,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_tfu_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms),
> -			     NULL, "v3d_tfu");
> +			     NULL, "v3d_tfu", NULL);
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
>   			ret);
> @@ -438,7 +438,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     &v3d_csd_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms),
> -				     NULL, "v3d_csd");
> +				     NULL, "v3d_csd", NULL);
>   		if (ret) {
>   			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
>   				ret);
> @@ -450,7 +450,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     &v3d_cache_clean_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms),
> -				     NULL, "v3d_cache_clean");
> +				     NULL, "v3d_cache_clean", NULL);
>   		if (ret) {
>   			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
>   				ret);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h index d18af49fd009..38a479879fdb 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -302,12 +302,13 @@ struct drm_gpu_scheduler {
>   	atomic_t                        _score;
>   	bool				ready;
>   	bool				free_guilty;
> +	struct device			*dev;
>   };
>   
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
>   		   uint32_t hw_submission, unsigned hang_limit, long timeout,
> -		   atomic_t *score, const char *name);
> +		   atomic_t *score, const char *name, struct device *dev);
>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);  int drm_sched_job_init(struct drm_sched_job *job,
> --
> 2.17.1
