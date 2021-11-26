Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEC245E8D8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0896EAA3;
	Fri, 26 Nov 2021 07:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB176EAA3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K07muZzyz40q2fN1aAG3fG0Nl1DamIovdHzhFyrhH25J+Uyrz1HlYZ+le0BUHnCjXrVxu5hqqlhylIgRhiWimP0wldR7i2W7m3l+ceqj5ZwpJD15Ln7PPFUXRbd4jPIFU6BIJJaW/+xCE8QJAU93BnxYAK9zACZZ4DWnyQUKHYWUYLJ3xTKNRmFa+pZNKpu/EZ8ITozTBQffr6a8dIZJ+6VBqshIAYUm4cloqmQtsvnGjuaATYMvmW8AuAaQXA+RASCwDhdxyQeEhMRvFJHHRKRKTsr8wxL18vcDuFPOuqlWKTHNOItVyERj1pgu5RXUzsfJJ49acx9tKwdOAOBRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWCGI3nWPiBN4yNOz7cTGuGA58ViC/ANX/GQDKqPQGk=;
 b=WZbFeq4pK/1fxyOV+l7BlL7yvwBSe1fgR/c5C7AYjLmyrwsqF6F7d5G68BWTdUrhq4pbhlk1uqSFzLRE1kzqzrNArK/2lZpp8NOpwE+bDOPM46M9ioao9cQ8W7ivVbeX6q+Y17zIJq646p/FCz/VRS4wR8GBybkT3RI+46S8kcOYjFimXggnsCLdg781oNkfxEhgVKmxmSf4EUE96EOpbGEjfylpuRUsEspkQjpjRSk/gqYWlbhFZWhuhYEOzSR8X2bgJTdBV4MY38OWBTbKXidVQnqpUK3+xHkmBwqARGPn8UpP69wq3KBDqZgsUe3QrEfv9NHimJB2C/TMSfX+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWCGI3nWPiBN4yNOz7cTGuGA58ViC/ANX/GQDKqPQGk=;
 b=GNgjDHXwJC8J+TfuFnbJjWUNmvC8UzEm+nX6Hz8z/tQxHcF2eCryRESp+Y2OaXM91ay1Hb1ceVrKgEZjCjqMo+8H+zXOvZ12v7WNiu9Uagl9T4DD3248+Za5KLlNMOWxI5pNJmH99uN8YLe0FRabkb4ebCGXwHG4FDkAYuN8KBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 by BY5PR12MB4802.namprd12.prod.outlook.com (2603:10b6:a03:1fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:47:42 +0000
Received: from BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193]) by BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193%6]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:47:42 +0000
Date: Fri, 26 Nov 2021 15:47:23 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 01/12] drm/ttm: add ttm_resource_fini
Message-ID: <YaCRC3G50oTFSeNE@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-2-christian.koenig@amd.com>
 <YaCDI8Ck5V7JBFkM@amd.com>
 <db952696-e45f-bc20-983e-ed7cbe7a1321@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db952696-e45f-bc20-983e-ed7cbe7a1321@gmail.com>
X-ClientProxiedBy: HK2PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:202:17::16) To BY5PR12MB4918.namprd12.prod.outlook.com
 (2603:10b6:a03:1df::22)
MIME-Version: 1.0
Received: from amd.com (165.204.134.251) by
 HK2PR03CA0046.apcprd03.prod.outlook.com (2603:1096:202:17::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.13 via Frontend Transport; Fri, 26 Nov 2021 07:47:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00408b29-caf2-49e2-ed23-08d9b0b1072f
X-MS-TrafficTypeDiagnostic: BY5PR12MB4802:
X-Microsoft-Antispam-PRVS: <BY5PR12MB48025A2311F8747933F2F918EC639@BY5PR12MB4802.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/AumTaK6tqoDdNPQFxD4+RX2cuD6j773pv+06i9Ak93kzc7IdWyg1OS3Zg+cMXIcc/qO3cG1HZQihxrWDwoBbXbo77ExGxJM8fg6P7V8IUCP49poA2itBGV8nalGueD3+hv5VCdxwueIPHJVyS+M9U2NQig/GZcFlZycptorUNf6SRdJjI3hcijLMoQrHEdPv2DTSwSk8jkv2zISzzKW8ls/q1H6AXvc09kiFLxz41gUhxkL3dhRFlHBjN3bUkB1VCTa/srTBmsVE6+4UWDcnTHmGNomk9ePJlMoL4aer7Nn34wOAsxDlhTvowfXShzpJ1XXR5v6OEFFUHi70LAw/Eq6BCurZon0S0UJZe5HdVh0nJs1dx7FlZjJOdJGv5fyLhYiciCmq16mjr6yehlNBdge0nnFgCG4tDmwLxikfaIfVWXqnBbTP1GAHn/kGSgdX0em1xfm4lsKGMHnK50BHf/+ngSokh4bIt2SJJuRqigsE30NlUQVbsIgEgNtsAXMQc7JXPmoc5BX5Vvs3pMrj61wspeEVShoO3OKtUhne4rnuuHEH6N4IEv8G+z4dFBMhPmCBho+NDnz+IzeATXENzbjvf1L8doedrDnlVqTHbTO0vLz6fOuYHZH+Vft8sbZRIG0VDvH/RgvtEIl1nMrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4918.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(2906002)(54906003)(7696005)(86362001)(66574015)(956004)(2616005)(316002)(186003)(66476007)(66556008)(5660300002)(66946007)(8936002)(8886007)(26005)(4326008)(8676002)(6666004)(6916009)(36756003)(55016003)(30864003)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MN0mJn70EtGWvSuVbfME2Vthzr3FQvuqpvAP89bT4wnGz9nNgBGEypCMEh?=
 =?iso-8859-1?Q?lbV4Lf4ofeZrVFfx5CFjZEzJJPsm9Vjt8hRMI56CIGVIr5pJk+CIPQ5e3z?=
 =?iso-8859-1?Q?mBlL3dcLckLfLLkFlzu/6TgKcbLbweSzIagFxNTU1LlIGi8X1kepsufhaz?=
 =?iso-8859-1?Q?8FdDqAgiX9Y5fJQ9IzhNqiJoV04szJwE7T7KJMlkj26xTI1XavIOU+ZPxB?=
 =?iso-8859-1?Q?B1vT13mGmju41EecaO/0xD4ojmmkzc0pqPCMxw0RJMvVHvTJQkm8cJUIJE?=
 =?iso-8859-1?Q?n0VTsAbZ95RGQq0ZqBguWWJ/PWXnYGzLLnBi/x+phCLsVUn6Smx03r17NO?=
 =?iso-8859-1?Q?2cQ4tAOLiDHNTTZLNeLZfCD9tKdDU3M/bTPMqzBLvjgTwbpSAMp+TRpavM?=
 =?iso-8859-1?Q?+Tf+BpwSf5gTAfJMCxyJKFG7/ACBDL2IfRoX2HoYVs5tBuGCfA4yJqNvwU?=
 =?iso-8859-1?Q?LNThjC/uA3fxg1PJCFrcj53/3zbKr3dBd7xjo4rch326p1/QQHkOPP4+44?=
 =?iso-8859-1?Q?HJ193zDdWRHu+5N90OOv8ZsCOd/M9m4l4ySVd7xXaeIFaql0OM7P9FReWp?=
 =?iso-8859-1?Q?52BE9W3vktCFgzqYRS71ECFeKZtukaUi1INEAddeFSGGHYV8sYKzKiNyp7?=
 =?iso-8859-1?Q?OtKJs0/XK+yTf62f9DB8E69t7YR2MtJylO/EMpPQS578ULX05kM/e+9VDY?=
 =?iso-8859-1?Q?JDlAsYrLtGVj1DfeYHBzE9+VMmECY7QkChf8fOPn7YhKSDWBTfXN+VjHud?=
 =?iso-8859-1?Q?tkhuBzDEETWxggU0pL2ubaqWaVj4wKUW2gGnSx5KNsQpfRUr3frYq8uTyJ?=
 =?iso-8859-1?Q?VksQLHug9BMj3ssggkYasNMEl/7HHVDAP4BIsZHwKtoJmVtMCOAwth5W8h?=
 =?iso-8859-1?Q?AudWSNkCBasQJpB3BSasDhAvYmLoGR9KJi6oYx6H/CspOl/BImQu/qBfn3?=
 =?iso-8859-1?Q?PoTTkRilmHir2e1dmagOMCI1wbQG4Wp7+BytEzN07/q8F6hSt6MgmiWR3/?=
 =?iso-8859-1?Q?7Hwzjt1fFvOe6KZ6qWBwNzJP3J/4F591Sn2Yl8oaMWWYSNhxgYXfvGAfGv?=
 =?iso-8859-1?Q?8l9AQzsaZdftox/7WL8llwB7J6l7D9udYHTLJD4F/ys0I9EqBsrg9ffvMp?=
 =?iso-8859-1?Q?O9l556mbE+1sM4rJccNMPkuaRXwOOjn+HfEgUeDS2FJ/Jo1o9M6MS0t0Em?=
 =?iso-8859-1?Q?TxiSjJ3u9kTOio6lHE2+g1Vj2Uw3pFjPvdcI1GgbBStJTmDXkPjiugDAQi?=
 =?iso-8859-1?Q?75Xz9ySa4nGOizoym/HxeOD7qn75rfgJPNxaIyWEaLhl+4N4u/EIotmeRB?=
 =?iso-8859-1?Q?KDbe17LCrKzTqRDY7CXQ00UMJ2GvQ4Mt+97F6qp8Urj6w0FV3Rl/Ts2l7r?=
 =?iso-8859-1?Q?v7zfE4R8GvKgZsfDVJe5oH59D/pxt4iZRjjwcV3e7ZTZmKV+wsteertl0s?=
 =?iso-8859-1?Q?l5BiDB1kyYsHdFi7WN4Bno5CjGTqqAB/DW0R+CNfe5nmyxOd/zzgUCtjnA?=
 =?iso-8859-1?Q?szpAxjF6bmzLNvGe5qTL4t/qermTpdJSpye4x18ddfyM5q35+be1HXmvII?=
 =?iso-8859-1?Q?XIUU6gl1m5O6cFYeXC0v4CODt6Z+E7GuxRAxtZl72znqOwQa7LO2iymCYF?=
 =?iso-8859-1?Q?/r/O9q+1o4P01NAkM6BYFdU1Ixbt9vga6/mwoump709yOEGVJAtzsUYTlu?=
 =?iso-8859-1?Q?kXUFbsxO+C4vXZsVjJ0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00408b29-caf2-49e2-ed23-08d9b0b1072f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4918.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:47:42.7828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QrBM3oY7weKUVn9A5dXcJAbtz8T9Bzmh1JmBY3Bk9iBGLDTLkZJjSs/5xcCn7VTxKcO7FoxDYX3/0HPU5MSsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4802
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

On Fri, Nov 26, 2021 at 03:39:30PM +0800, Christian König wrote:
> Am 26.11.21 um 07:48 schrieb Huang Rui:
> > On Wed, Nov 24, 2021 at 08:44:19PM +0800, Christian König wrote:
> >> Make sure we call the common cleanup function in all
> >> implementations of the resource manager.
> >>
> >> Signed-off-by: Christian König <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     | 2 ++
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 1 +
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    | 2 ++
> >>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   | 1 +
> >>   drivers/gpu/drm/nouveau/nouveau_mem.c           | 3 ++-
> >>   drivers/gpu/drm/nouveau/nouveau_mem.h           | 3 ++-
> >>   drivers/gpu/drm/nouveau/nouveau_ttm.c           | 9 +++++----
> >>   drivers/gpu/drm/ttm/ttm_range_manager.c         | 2 ++
> >>   drivers/gpu/drm/ttm/ttm_resource.c              | 6 ++++++
> >>   drivers/gpu/drm/ttm/ttm_sys_manager.c           | 1 +
> >>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   | 2 ++
> >>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c             | 3 ++-
> >>   include/drm/ttm/ttm_resource.h                  | 3 +++
> >>   13 files changed, 31 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> >> index 675a72ef305d..ea5470c8c921 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> >> @@ -169,6 +169,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
> >>   	return 0;
> >>   
> >>   err_free:
> >> +	ttm_resource_fini(man, &node->base.base);
> >>   	kfree(node);
> >>   
> >>   err_out:
> >> @@ -200,6 +201,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
> >>   	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
> >>   		atomic64_sub(res->num_pages, &mgr->used);
> >>   
> >> +	ttm_resource_fini(man, res);
> >>   	kfree(node);
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> index d02c8637f909..ffddec08e931 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> @@ -95,6 +95,7 @@ static void amdgpu_preempt_mgr_del(struct ttm_resource_manager *man,
> >>   	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
> >>   
> >>   	atomic64_sub(res->num_pages, &mgr->used);
> >> +	ttm_resource_fini(man, res);
> >>   	kfree(res);
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> >> index 7b2b0980ec41..55d68408951d 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> >> @@ -476,6 +476,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
> >>   	while (i--)
> >>   		drm_mm_remove_node(&node->mm_nodes[i]);
> >>   	spin_unlock(&mgr->lock);
> >> +	ttm_resource_fini(man, &node->base);
> >>   	kvfree(node);
> >>   
> >>   error_sub:
> >> @@ -515,6 +516,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
> >>   	atomic64_sub(usage, &mgr->usage);
> >>   	atomic64_sub(vis_usage, &mgr->vis_usage);
> >>   
> >> +	ttm_resource_fini(man, res);
> >>   	kvfree(node);
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> >> index d59fbb019032..ca3ca1f7f850 100644
> >> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> >> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> >> @@ -123,6 +123,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
> >>   	i915_buddy_free_list(&bman->mm, &bman_res->blocks);
> >>   	mutex_unlock(&bman->lock);
> >>   
> >> +	ttm_resource_fini(man, res);
> >>   	kfree(bman_res);
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> >> index 2ca3207c13fc..2e517cdc24c9 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> >> @@ -162,11 +162,12 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
> >>   }
> >>   
> >>   void
> >> -nouveau_mem_del(struct ttm_resource *reg)
> >> +nouveau_mem_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
> >>   {
> >>   	struct nouveau_mem *mem = nouveau_mem(reg);
> >>   
> >>   	nouveau_mem_fini(mem);
> >> +	ttm_resource_fini(man, reg);
> >>   	kfree(mem);
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
> >> index 2c01166a90f2..325551eba5cd 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_mem.h
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
> >> @@ -23,7 +23,8 @@ nouveau_mem(struct ttm_resource *reg)
> >>   
> >>   int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
> >>   		    struct ttm_resource **);
> >> -void nouveau_mem_del(struct ttm_resource *);
> >> +void nouveau_mem_del(struct ttm_resource_manager *man,
> >> +		     struct ttm_resource *);
> >>   int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
> >>   int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
> >>   void nouveau_mem_fini(struct nouveau_mem *);
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> >> index 2ca9d9a9e5d5..91ef33f8f22c 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> >> @@ -36,9 +36,10 @@
> >>   #include <core/tegra.h>
> >>   
> >>   static void
> >> -nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
> >> +nouveau_manager_del(struct ttm_resource_manager *man,
> >> +		    struct ttm_resource *reg)
> >>   {
> >> -	nouveau_mem_del(reg);
> >> +	nouveau_mem_del(man, reg);
> >>   }
> >>   
> >>   static int
> >> @@ -62,7 +63,7 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
> >>   
> >>   	ret = nouveau_mem_vram(*res, nvbo->contig, nvbo->page);
> >>   	if (ret) {
> >> -		nouveau_mem_del(*res);
> >> +		nouveau_mem_del(man, *res);
> >>   		return ret;
> >>   	}
> >>   
> >> @@ -118,7 +119,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
> >>   	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
> >>   			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
> >>   	if (ret) {
> >> -		nouveau_mem_del(*res);
> >> +		nouveau_mem_del(man, *res);
> >>   		return ret;
> >>   	}
> >>   
> >> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> >> index 67d68a4a8640..25fcf0d63c2d 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> >> @@ -89,6 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
> >>   	spin_unlock(&rman->lock);
> >>   
> >>   	if (unlikely(ret)) {
> >> +		ttm_resource_fini(man, *res);
> >>   		kfree(node);
> >>   		return ret;
> >>   	}
> >> @@ -108,6 +109,7 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
> >>   	drm_mm_remove_node(&node->mm_nodes[0]);
> >>   	spin_unlock(&rman->lock);
> >>   
> >> +	ttm_resource_fini(man, res);
> >>   	kfree(node);
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> >> index 035d71332d18..89bcfe22a0ca 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> >> @@ -44,6 +44,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
> >>   }
> >>   EXPORT_SYMBOL(ttm_resource_init);
> >>   
> >> +void ttm_resource_fini(struct ttm_resource_manager *man,
> >> +		       struct ttm_resource *res)
> >> +{
> > Maybe we should clean up the res data here. E.X. memset(res, 0, sizeof(*res).
> > The previous data should invalid while we call fini.
> 
> Nah, calling _fini means the resource structure is about to be freed.
> 
> memset in this situation doesn't make much sense.
> 

But we already have ttm_resource_free() to free resource structure. If the
fini is pairing with ttm_resource_init, it should clean up the data of the
resource structure.

Thanks,
Ray

> Christian.
> 
> >
> > Thanks,
> > Ray
> >
> >> +}
> >> +EXPORT_SYMBOL(ttm_resource_fini);
> >> +
> >>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
> >>   		       const struct ttm_place *place,
> >>   		       struct ttm_resource **res_ptr)
> >> diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> >> index 63aca52f75e1..135394dcca95 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> >> @@ -23,6 +23,7 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
> >>   static void ttm_sys_man_free(struct ttm_resource_manager *man,
> >>   			     struct ttm_resource *res)
> >>   {
> >> +	ttm_resource_fini(man, res);
> >>   	kfree(res);
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> >> index b2c4af331c9d..bfd686bb8d19 100644
> >> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> >> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> >> @@ -116,6 +116,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
> >>   	gman->used_gmr_pages -= (*res)->num_pages;
> >>   	spin_unlock(&gman->lock);
> >>   	ida_free(&gman->gmr_ida, id);
> >> +	ttm_resource_fini(man, *res);
> >>   	kfree(*res);
> >>   	return -ENOSPC;
> >>   }
> >> @@ -129,6 +130,7 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
> >>   	spin_lock(&gman->lock);
> >>   	gman->used_gmr_pages -= res->num_pages;
> >>   	spin_unlock(&gman->lock);
> >> +	ttm_resource_fini(man, res);
> >>   	kfree(res);
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> >> index 2a3d3468e4e0..4fcbd94ccc11 100644
> >> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> >> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> >> @@ -104,6 +104,7 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
> >>   	spin_unlock(&rman->lock);
> >>   
> >>   	if (unlikely(ret)) {
> >> +		ttm_resource_fini(man, &node->base);
> >>   		kfree(node);
> >>   	} else {
> >>   		node->base.start = node->mm_nodes[0].start;
> >> @@ -122,7 +123,7 @@ static void vmw_thp_put_node(struct ttm_resource_manager *man,
> >>   	spin_lock(&rman->lock);
> >>   	drm_mm_remove_node(&node->mm_nodes[0]);
> >>   	spin_unlock(&rman->lock);
> >> -
> >> +	ttm_resource_fini(man, res);
> >>   	kfree(node);
> >>   }
> >>   
> >> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> >> index 5952051091cd..df1f06b7b504 100644
> >> --- a/include/drm/ttm/ttm_resource.h
> >> +++ b/include/drm/ttm/ttm_resource.h
> >> @@ -261,6 +261,9 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
> >>   void ttm_resource_init(struct ttm_buffer_object *bo,
> >>                          const struct ttm_place *place,
> >>                          struct ttm_resource *res);
> >> +void ttm_resource_fini(struct ttm_resource_manager *man,
> >> +		       struct ttm_resource *res);
> >> +
> >>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
> >>   		       const struct ttm_place *place,
> >>   		       struct ttm_resource **res);
> >> -- 
> >> 2.25.1
> >>
> 
