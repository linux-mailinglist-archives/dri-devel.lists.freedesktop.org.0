Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300445E813
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 07:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B4B6E5C8;
	Fri, 26 Nov 2021 06:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB146E5BF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 06:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVf775xkQCx63+qeSyqQg0WVjU71XPGiGlRT+kCayIbiEdvb+mwHqN1HqscocxEkhFz6DVW00xcObZ3B5WnromC9wMTCIDXPvXXWsCTf2ix4chOpFjFzxyidWMLF1fcfHEIYoA+X9hidhwOJhfSOphFc5RtxwNfaEaf0VHCcmXCLaaCAeyEund7glQIZxmqkWgXmOr06jVJnHlzMgv8U97HkRMl/it1+yGV1G+Of4C7wJPEuclaykPtRUe3w1vXvwXfZ9URWn4n/8Qpmb2/C2PM6thnUPtVd+OI/UQvlZniDg/DtpiU9XG/rjd8go9A/MwY1+59LTjlLTeHbxbB7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7OkhV1WOZDp0PnNXSxqCNIIc/zj8n8KqoDU9oweqho=;
 b=HnFUF1PPSPIMe/2b8HajkPRqY2m2DowP6wO/G+AN6k5yeLjXfnnn5SDaqaHcp4OX237IhO8X1JVGsaAwPVYhiwuxqpPhUsYPssO4rfWxFrseRRpzGlZkZjpUEnr9voZ0Gdtgb9haIqi9Yla5aPM31lJAvhp1PXNOuZRd6h9UhktWdYTqeBkHYUhzKgT5Kw+7sQOxRTe66xn1glCwm/mag4dI9LBvBiyERCKvr27ubDwrf+J7jj+eRGAXnFsRY1wldNrf2ShCAb1VMLJthe3Avsf67tnUF70SnkrU0/xFJ+I25OiTIxZQr+BgfWHxkKfZbKnUUe6JIGmQD72gc3Jliw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7OkhV1WOZDp0PnNXSxqCNIIc/zj8n8KqoDU9oweqho=;
 b=DwzQu4tyz4jGKAqoJOl3d98CsKAM6lKV8mocoa+YSTxsWMKF1yuVchtOrerZhzlqYmSG3EAWCm1UsA4yKlabV0f19qzjUBerdIxiEXsPeK4fxlDEVlRv7jAbuz8k8+NQTUix9l3e4qSMTStv1FdTQEay6UOnB3mZTHwuVKRLsEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 by BY5PR12MB3924.namprd12.prod.outlook.com (2603:10b6:a03:1af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Fri, 26 Nov
 2021 06:48:32 +0000
Received: from BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193]) by BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193%6]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 06:48:31 +0000
Date: Fri, 26 Nov 2021 14:48:03 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 01/12] drm/ttm: add ttm_resource_fini
Message-ID: <YaCDI8Ck5V7JBFkM@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124124430.20859-2-christian.koenig@amd.com>
X-ClientProxiedBy: HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::24) To BY5PR12MB4918.namprd12.prod.outlook.com
 (2603:10b6:a03:1df::22)
MIME-Version: 1.0
Received: from amd.com (165.204.134.251) by
 HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.9 via Frontend Transport; Fri, 26 Nov 2021 06:48:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 299ab8e7-a67e-432d-0e21-08d9b0a8c28d
X-MS-TrafficTypeDiagnostic: BY5PR12MB3924:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3924ED58F52AF4F1ACBAB75CEC639@BY5PR12MB3924.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FKIOY5WIcrnbZjsG38UzwR3zNd/rB5+cM4EoeXBbJ/2yoToatA4bw0takghfp/N+cHAZULom9ywyOYWzQMY2BMY+TDfKKjZq9cs5LjiaBg4peFwsRUt2rTJ/beLqB0Tf/3ULs+ZdT7lJ5E7Os23e5aLFtueVs6AEmgLq6fm4CMR3XpnsZAo2k+nimAvjMFC9huutgXEgN/OneH8KP+YwXWbkOSx9oyVQxlEhcQotpCN+fTPUqSqTIhyKJYzz3VtqRU7lA3QYy0qvRUzJ+2OfquleT4mdljIMw8T5SkcK6Ge103wTWl2nQt03kH7xhONyqvKiNg3yXb1ibngeoeKGbRK/a2lcExA3IL0Gs4DypwM6PN7B0FCfvXZFxn5NMAh1UQ1DtfnmxvFiAHtV5Tf2j/Ezx3Ic28YOEZNBdRWCp7qzmkmwphH0CKmkkD0ejaDPj8ggPMJmMPGk9ZgGOYnIPxiMy8b0k7AJ7qs2ZeZv3wrgOqyvEeCaNEzeHlTuMu+yltOGLoHopFilyfFBPoDb63REVRKUNLnA0JRI0q6mKm0yMcmL/jxzcGMnOY9Hy6JjhMdHP4qLGRHSzGC5pQRoM8lK+mlW6msyhplJvfwqncvy3PW+YktgDj3Or6eF7dxmb2t1MO4jPilZlzVNBQQndw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4918.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016003)(66556008)(66476007)(86362001)(6666004)(26005)(36756003)(2906002)(38100700002)(8676002)(6916009)(83380400001)(66574015)(2616005)(316002)(956004)(186003)(4326008)(8936002)(66946007)(54906003)(8886007)(7696005)(508600001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fWg0fs39RL2bBn3DuKSmCU+ScTk3cPXYVohMGDRlSn+e6CayyOJOzM9Rbr?=
 =?iso-8859-1?Q?Ii7y1czR+XD9zWP6Bayn6qVJ/giB+p/ppi3mI6vqXllhafmTml8vsQLEuP?=
 =?iso-8859-1?Q?obzhq7kw1yZtM7qHUjT/rOtZAeT+t8/GEIFMlea/gzlkpR9jPspoZaL64m?=
 =?iso-8859-1?Q?Vtio6H2bXsBIUr0CjxvQD+ZzESqVH6aRD0r990f+/zWimSvDVl06xIuNZT?=
 =?iso-8859-1?Q?uOUPK8EtZbzy7gvMSkJnPrlXs80nbVxa+HInQxAFHM1EtMKb+boEtxZnMV?=
 =?iso-8859-1?Q?s0UgWzHkT/itnYOW9STfPTT4nnCZkmNA/393JaE8d9xL+LopE2oUPVUtRG?=
 =?iso-8859-1?Q?w/diRD4TV2CGFNZ7VaNgBbQDPYpNu8ESmUOSGQef3068Nh6xp90FtRN/xp?=
 =?iso-8859-1?Q?TnSfcnWrwRHFugIpqBD8O2Iq+COmnQCU1Z9PykV/P+L1cM5r2b+0sgySfs?=
 =?iso-8859-1?Q?sBDR5S1nynlCS3R1WEdIXPFjVQqlN7xwcdHGNHI5VDWVgm//Dh6no1l+ux?=
 =?iso-8859-1?Q?cOSvWcOuW26NS4HHFRfKmfyYzoyaxp4MPc1qtmlUt++7sN9uJq6brJ/wk8?=
 =?iso-8859-1?Q?9zK6lPhNMqEAb8k8CKSkfFQ/ZIPWGW3c8klUbhOGAJdno5Q/Ibk5VakFc2?=
 =?iso-8859-1?Q?DrdAVhZNbOB/gnaFgOMo3Ui3G/L9UHywGvMID0kXOehWagx25TZGLb0s2L?=
 =?iso-8859-1?Q?ax+ytJY03EnXXtjdTb6oactNGdE0BNEzrKieUrZYOBr3Xkas1SXPhVlVIQ?=
 =?iso-8859-1?Q?rdMVxJhCTvIrHEdGb1E9LibajjqjRn/Wb6Ad5A8wH81s7+rrhchpguTDZy?=
 =?iso-8859-1?Q?r9ysjWY/nn4UoI8DagVw72rFwKNeRLdQq1QV/9RcE37xK3lNuidQABfRvE?=
 =?iso-8859-1?Q?bDrw+ZHr2VtgKPlX/tDyV7jfcO+ZtFakb2YacqNmGhZ5HvItl609u3A9/S?=
 =?iso-8859-1?Q?gnSHMWQZRu/g1qgQ+cybxqHd9RXUr1qtfm3ApXYwQERJq/qXRBKqBT6jAb?=
 =?iso-8859-1?Q?t4OMJ9HEo+YjUIB7xYNmwxjTyj0mEbhFbK3klXCVcxk0JIsiU9TJKm0kD0?=
 =?iso-8859-1?Q?xSsHoQk0bE69FQiC4NvXSXjTXsKuQ0pmSGcgOmCIaPXWlOQmw3FK1mxtc1?=
 =?iso-8859-1?Q?IuSDcTjQJP0yr3PbKaeeKSTwI2imd9cPaGv+6C6T0namFOfI/tyNa7OUjM?=
 =?iso-8859-1?Q?89A4Uw2upsxvR/OceF1EC+C+OVyUQ5jpd4JqB0s3z+EhLkZ9mEHQcRYIMd?=
 =?iso-8859-1?Q?+MSt6Tq1Wi++m5f4O0xdd6La1BLCQDGas1D4b2HZIhgCVymr7O2VtVySZ6?=
 =?iso-8859-1?Q?iekjEKYWCnkpIheuw72rGW5cFcgTei/brvjPhkDvXuzWzBi2zBhSEN4lqN?=
 =?iso-8859-1?Q?PByT8IrhdlRbQqwVzGDadfdDj/jJXis4BRI6LnLI4c7HUPw25HLDsq5YfB?=
 =?iso-8859-1?Q?gV4450lal3Hp17T4110KC0a3yyeA++CCRaBOcKHn203ZyoHOBeoGqoQb67?=
 =?iso-8859-1?Q?6mpthtiIE5EPVZToF1tSKsfkc1mKNIlrFeCruE4rbVph7WH4cc4P6x2CiC?=
 =?iso-8859-1?Q?q3ouQJebqmIwH+t+mz0FFByfixxy4gqlkrCLeNX1Hsl6tAov8uVASg9Gfv?=
 =?iso-8859-1?Q?H40c6Xkiuu+T46pKI42FnFxgVzowzEbYbPrKBYjpkLkPn9tfGcmWWdGeN3?=
 =?iso-8859-1?Q?90w1q4mkow5ardNqYGs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299ab8e7-a67e-432d-0e21-08d9b0a8c28d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4918.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 06:48:31.7213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUMgR72bIViWyBry/BQS+p44Jzow/C0A1qhJnD9/mBTrEODqV9saOUDsLRlZEtyTpImjtKaqCezLiNmshZ4QGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3924
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 08:44:19PM +0800, Christian König wrote:
> Make sure we call the common cleanup function in all
> implementations of the resource manager.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     | 2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    | 2 ++
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   | 1 +
>  drivers/gpu/drm/nouveau/nouveau_mem.c           | 3 ++-
>  drivers/gpu/drm/nouveau/nouveau_mem.h           | 3 ++-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c           | 9 +++++----
>  drivers/gpu/drm/ttm/ttm_range_manager.c         | 2 ++
>  drivers/gpu/drm/ttm/ttm_resource.c              | 6 ++++++
>  drivers/gpu/drm/ttm/ttm_sys_manager.c           | 1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   | 2 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c             | 3 ++-
>  include/drm/ttm/ttm_resource.h                  | 3 +++
>  13 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 675a72ef305d..ea5470c8c921 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -169,6 +169,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>  	return 0;
>  
>  err_free:
> +	ttm_resource_fini(man, &node->base.base);
>  	kfree(node);
>  
>  err_out:
> @@ -200,6 +201,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>  	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
>  		atomic64_sub(res->num_pages, &mgr->used);
>  
> +	ttm_resource_fini(man, res);
>  	kfree(node);
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> index d02c8637f909..ffddec08e931 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> @@ -95,6 +95,7 @@ static void amdgpu_preempt_mgr_del(struct ttm_resource_manager *man,
>  	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>  
>  	atomic64_sub(res->num_pages, &mgr->used);
> +	ttm_resource_fini(man, res);
>  	kfree(res);
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7b2b0980ec41..55d68408951d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -476,6 +476,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>  	while (i--)
>  		drm_mm_remove_node(&node->mm_nodes[i]);
>  	spin_unlock(&mgr->lock);
> +	ttm_resource_fini(man, &node->base);
>  	kvfree(node);
>  
>  error_sub:
> @@ -515,6 +516,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>  	atomic64_sub(usage, &mgr->usage);
>  	atomic64_sub(vis_usage, &mgr->vis_usage);
>  
> +	ttm_resource_fini(man, res);
>  	kvfree(node);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index d59fbb019032..ca3ca1f7f850 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -123,6 +123,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>  	i915_buddy_free_list(&bman->mm, &bman_res->blocks);
>  	mutex_unlock(&bman->lock);
>  
> +	ttm_resource_fini(man, res);
>  	kfree(bman_res);
>  }
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index 2ca3207c13fc..2e517cdc24c9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -162,11 +162,12 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>  }
>  
>  void
> -nouveau_mem_del(struct ttm_resource *reg)
> +nouveau_mem_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
>  {
>  	struct nouveau_mem *mem = nouveau_mem(reg);
>  
>  	nouveau_mem_fini(mem);
> +	ttm_resource_fini(man, reg);
>  	kfree(mem);
>  }
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
> index 2c01166a90f2..325551eba5cd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
> @@ -23,7 +23,8 @@ nouveau_mem(struct ttm_resource *reg)
>  
>  int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
>  		    struct ttm_resource **);
> -void nouveau_mem_del(struct ttm_resource *);
> +void nouveau_mem_del(struct ttm_resource_manager *man,
> +		     struct ttm_resource *);
>  int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
>  int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
>  void nouveau_mem_fini(struct nouveau_mem *);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 2ca9d9a9e5d5..91ef33f8f22c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -36,9 +36,10 @@
>  #include <core/tegra.h>
>  
>  static void
> -nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
> +nouveau_manager_del(struct ttm_resource_manager *man,
> +		    struct ttm_resource *reg)
>  {
> -	nouveau_mem_del(reg);
> +	nouveau_mem_del(man, reg);
>  }
>  
>  static int
> @@ -62,7 +63,7 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
>  
>  	ret = nouveau_mem_vram(*res, nvbo->contig, nvbo->page);
>  	if (ret) {
> -		nouveau_mem_del(*res);
> +		nouveau_mem_del(man, *res);
>  		return ret;
>  	}
>  
> @@ -118,7 +119,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
>  	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
>  			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
>  	if (ret) {
> -		nouveau_mem_del(*res);
> +		nouveau_mem_del(man, *res);
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 67d68a4a8640..25fcf0d63c2d 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -89,6 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>  	spin_unlock(&rman->lock);
>  
>  	if (unlikely(ret)) {
> +		ttm_resource_fini(man, *res);
>  		kfree(node);
>  		return ret;
>  	}
> @@ -108,6 +109,7 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
>  	drm_mm_remove_node(&node->mm_nodes[0]);
>  	spin_unlock(&rman->lock);
>  
> +	ttm_resource_fini(man, res);
>  	kfree(node);
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 035d71332d18..89bcfe22a0ca 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -44,6 +44,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_resource_init);
>  
> +void ttm_resource_fini(struct ttm_resource_manager *man,
> +		       struct ttm_resource *res)
> +{

Maybe we should clean up the res data here. E.X. memset(res, 0, sizeof(*res).
The previous data should invalid while we call fini.

Thanks,
Ray

> +}
> +EXPORT_SYMBOL(ttm_resource_fini);
> +
>  int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
>  		       struct ttm_resource **res_ptr)
> diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> index 63aca52f75e1..135394dcca95 100644
> --- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> @@ -23,6 +23,7 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
>  static void ttm_sys_man_free(struct ttm_resource_manager *man,
>  			     struct ttm_resource *res)
>  {
> +	ttm_resource_fini(man, res);
>  	kfree(res);
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index b2c4af331c9d..bfd686bb8d19 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -116,6 +116,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
>  	gman->used_gmr_pages -= (*res)->num_pages;
>  	spin_unlock(&gman->lock);
>  	ida_free(&gman->gmr_ida, id);
> +	ttm_resource_fini(man, *res);
>  	kfree(*res);
>  	return -ENOSPC;
>  }
> @@ -129,6 +130,7 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
>  	spin_lock(&gman->lock);
>  	gman->used_gmr_pages -= res->num_pages;
>  	spin_unlock(&gman->lock);
> +	ttm_resource_fini(man, res);
>  	kfree(res);
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index 2a3d3468e4e0..4fcbd94ccc11 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -104,6 +104,7 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
>  	spin_unlock(&rman->lock);
>  
>  	if (unlikely(ret)) {
> +		ttm_resource_fini(man, &node->base);
>  		kfree(node);
>  	} else {
>  		node->base.start = node->mm_nodes[0].start;
> @@ -122,7 +123,7 @@ static void vmw_thp_put_node(struct ttm_resource_manager *man,
>  	spin_lock(&rman->lock);
>  	drm_mm_remove_node(&node->mm_nodes[0]);
>  	spin_unlock(&rman->lock);
> -
> +	ttm_resource_fini(man, res);
>  	kfree(node);
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 5952051091cd..df1f06b7b504 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -261,6 +261,9 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  void ttm_resource_init(struct ttm_buffer_object *bo,
>                         const struct ttm_place *place,
>                         struct ttm_resource *res);
> +void ttm_resource_fini(struct ttm_resource_manager *man,
> +		       struct ttm_resource *res);
> +
>  int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
>  		       struct ttm_resource **res);
> -- 
> 2.25.1
> 
