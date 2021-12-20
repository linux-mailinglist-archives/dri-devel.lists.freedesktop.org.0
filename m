Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9540E47A495
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 06:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC66E10F834;
	Mon, 20 Dec 2021 05:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3447D10F445;
 Mon, 20 Dec 2021 05:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mL7dR+XnFSGLHUc1uxjf0VzK5Ed3e0wdkig3uLEpFvFFEQpadsHvqhcodBJsm2tUOznPN8vB7RXlFioF4Pre/AXBbxDXjLxROuRDqdNEmh11gN3ZLDusvrbnMTMGvFBy94FPHfbbg2EAeF6IhDbJugMuGK1os19ZuiIXj16l9utQWF1tDF+bgOwy2Gh2JmmCnB9CqesChLveY6b9A5PKhOEV176CgoLeVyhXAXY14TPlRo+hKzGgKMAY0oCAJia6k4kadH+xSxzKWk9hSxpOgOLr6Rsa2JQgvKy89JR8paLBylMCHgCSWJK9pnpW/9jwvhDpVEFVaQMCi22IkMp6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q/UBM/7B0GXrE8f78UuzhJ6RQ73qLUK7KLSYcS0XN0=;
 b=ZvtBn2qaL9S9rP9B1AdNAxljDtCbeUPtP9WrPYnBlFJ2SPUBB+/0l1Bk2iDUMVwqCqB50MjAuQe2mxyXhRDKxur8mqH3vj0IrtKhtZEhGCTEhgZNn8QltXe8bfhqfEc5FWXgTd2tFbRrUJ/PRRoH8ObtauU0WjhZ7iDoYgE/Rm24LB1YvivkmXRq1Mz0Ci+A3SnAW1K6HY+Nne4qZjPGs67QAAkDesJcb32PYHrSKocgSC22jrEH+uUUGzzJBf4qqD9ajdITS45p8HjliNSHS4/RZ5bIVlPtaBGBp43egmQY/pPWSret49ZgyUv3YkC6SJaflwgZDLsD/2rN6x2h8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Q/UBM/7B0GXrE8f78UuzhJ6RQ73qLUK7KLSYcS0XN0=;
 b=APc7mgX2n9Xb5u33XIFCAANjm1XvaPN7Oi+hBqczkUCa7BrHTXEZbRFQc89vUcwSnv4b8k7NXykE1GG/wf8OFilH/9aBiisop0ocp1jexD6UV+fTyYED9PdI8YN/EhaGnXgLxwg+RuxEPd6a/qxtv6obvBoau4/+U6cMFRURQWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM5PR1201MB0218.namprd12.prod.outlook.com (2603:10b6:4:4d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.15; Mon, 20 Dec 2021 05:31:17 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 05:31:17 +0000
Date: Mon, 20 Dec 2021 13:30:54 +0800
From: Huang Rui <ray.huang@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH 3/3] drm: fix the warnning of string style for scheduler
 trace.
Message-ID: <YcAVDjwCe+c24YwG@amd.com>
References: <20211213063422.2232155-1-ray.huang@amd.com>
 <20211213063422.2232155-3-ray.huang@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213063422.2232155-3-ray.huang@amd.com>
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1bee310-5c9e-477b-8cff-08d9c379f1d5
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0218:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0218F8305F9A14FB0E25B6E6EC7B9@DM5PR1201MB0218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1bjkfHuelBiZQwxWKzd6ASZvO9gvI1il+P/OLYAvwBPjZNWVy7CkluHzwD+WIMF0ekHeQqRRezdsLaCiIxGe0WBLaeq85+3RDBwMkhwFCG654apOyrxnkq045AzyWdypds6gxIgNMQXyF4ivrdaBg9g4gyAGpqz/5fXZv9rBTz3PVPIetxnClxbkWCYcZSUpQsdGqkP6d51al/U81Q80d5wpklAuW1m+lrYBCHR9OafATSaMSPCbTCM69ItqK+BvmmXh6T2vJZYpGeM7GyFDD+ghNZ3sglWnxjcRUJV0oLJdDogIQjmbie57sLvGlfy6eVutlQNXnAC8x1Pxibu0OaOMnOs9tOz41ZsaW28OZDrhcRRwPFiAyPtN4V+DA+9vR8wz4djeOk2XPW3cNuP5UvXEQOVrlD+mEhryxVmE0Tg/6xGA5GyRxdXoxaLLWeMU2tg/U6UbiH2dhaHqBIyADtPdtXcVAg1f6qQB00DazA9lv25riyM5SCo4snBo8lLJFEODctm+ZDKdRbJW0J/KwLF1jqVfn5LS+e77vPmnlyJxd/hTKWZitljBQBvcHKTd3Ry9GHLIY+YEY5jrG/pfaogj3HTVQ9MQUUo9eAKECZbaqlOXck+Vx0B9eTtYSWVCOjzB1dqs6hGqoG21begCKNuuteKCd7V3+nvo/NggiYW6CmwINLLRDu0brawsy42lUhweav2STKtBvOm0CC4Aiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(6486002)(316002)(54906003)(508600001)(8936002)(8676002)(5660300002)(110136005)(26005)(6666004)(6506007)(36756003)(2616005)(186003)(83380400001)(6512007)(4326008)(66946007)(66476007)(66556008)(38100700002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B4YEW3Fik92gxr/maVBGXikvM14vTolYQcxSoxeVgtR0XZ3R+nDQzWHadol4?=
 =?us-ascii?Q?JGAAZAGAa3AfY8v1r8vgkTR7LgSPgycjYZWlNPQeuDaBW7ZO2X6x+uQvY2rt?=
 =?us-ascii?Q?Lld+y2CmdxqFe/zEneiLUYDIq7yD7jtZqHyErsDiUBb18ch+hQdQeaFXYYcs?=
 =?us-ascii?Q?2nYDiDc9GeogDbZquGOnl3utROki+Ot6x+LxpxggJvhiYtdk8P02eKVDYO5e?=
 =?us-ascii?Q?jJEvHWavkbv5GukB+mxOpAYD9lxm+mUN/CTOX0kJgMjpbeH2dS1Sk5poAy+v?=
 =?us-ascii?Q?S1aoYQiFSKXB4fh/PdOKa+u3bwJ27Bduah16sIfUrxjAsFG26OVTgOslAzuI?=
 =?us-ascii?Q?qTTdPHEUrZklltz+O6vODX+1RmSq5ci1zP1QquoUi9UOUGrP++xm1cA2/tiz?=
 =?us-ascii?Q?TnE/zWKzbi4RtHpqS3BudSGG8k119XXjulvpGI4lhe5ltwy6KjcXfDeJeg4P?=
 =?us-ascii?Q?+N4lsxX8NNOUISI4kvbT9frW3RAnrNBtWkpRJSyBzvXbzUABvPZ+2y2bN0d4?=
 =?us-ascii?Q?1VuY2Wq2SvaRBEH/ApYNqEOppPULwbGDWEQA2e6WRFazUNHEizXN8/W/jMaz?=
 =?us-ascii?Q?aE3te+yKlJI0imVv73RLhvwcxR8GxCe/qJuC3bwuI9Skt0vLKDPBA70H56oN?=
 =?us-ascii?Q?1l7yw83efSjQI9h4/9J1KQEocvtxern0IAa1yhtBw+vjfgIx50QMUvl0e2Q6?=
 =?us-ascii?Q?WH70xEk8oWq7TVL7lS7uUoJGWEKRcy7v2xJB0yvg0YCk/LK76pqa4lUy6SOM?=
 =?us-ascii?Q?AmVhPqPE2Au2PTghnrCQWuBnttcEIHXepu4fXw6xnG4tx37G+gGUiUTGmXX2?=
 =?us-ascii?Q?w07jgh8hDDPh/UbA8Dd0fOTW93A5qi9elkPaP5IRf7kDJOU/tuwPxkqkVj09?=
 =?us-ascii?Q?x2pwU/iBT6I5RoVFjo81gePFnKhqChjzBGjkuKsOtcHXipCWtssvp9R6zS8E?=
 =?us-ascii?Q?fEBDxFrYE4Xkrugkuc2nJ0hBrICSFlyK3hYq/c/YANETsWHyA4+Rg6u1L4m/?=
 =?us-ascii?Q?19BS8hs7IjJOchLDdkyDtAqty6TGN2Ra32yMj+Y7qoGl4PyZPlaY8x4+A1Qs?=
 =?us-ascii?Q?bh1x9uu3DlqRwLAWoidjJ4FfNJpeCQx52eSoW/rcThhAyYmTusxcHg3UJ+4r?=
 =?us-ascii?Q?9PDZFgI3bgBNFhONEal8zCoFWEhxEEnpiTpka4/Yknc7927kgaTdGSH1wrh0?=
 =?us-ascii?Q?96lfI1+UUi8yFTSq/GApvvglnodujftzmvvwdl5rSVB73ulEeLRB0AjbqZ7p?=
 =?us-ascii?Q?NoySyp0YTHxcVKo2VBxl8Znnmy6/R97lpokSmLxe/6blVCbgaOPJRM0pW6eu?=
 =?us-ascii?Q?7OKmAyZW0uBT4OOc/UXU2hycZges1T8AceYrtPLGHqfHakY7CoDCrWaU3LH1?=
 =?us-ascii?Q?WyeDfHBCsq0P0Hg6ictiZcywOtGn94pZ21avYni2tFGTmTntz5HS1OCM2oO9?=
 =?us-ascii?Q?a4kX8+APi4It349KD4rs7zM5Pr6XyPT+Z2k9+e+n+By4hUBEl5CMwfKPwnoS?=
 =?us-ascii?Q?7jhS9r8Nx21xKIytBtxZmsuuZ+OmxAuZTc+5oZFZ62UM5wKnflhjgGarubZT?=
 =?us-ascii?Q?Bdgs2dj6Im2OJgrs/dkAbcM883rHTpTIyY9Sy5YPyqWmw3ts5Sbnc/4J2OP4?=
 =?us-ascii?Q?ka5CETCY9OXNeRtqVN7tAdo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bee310-5c9e-477b-8cff-08d9c379f1d5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:31:16.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nG1qmtzqfqENPHcgjTm3dUA0feeB5iKThmuQ0clYu32F+7kNeR4Xqo5hd7oZmAGyVotOiNPjcYgHaOWtqeU4Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0218
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A soft reminder. May I know any comments of this patch, just a minor
warning fix?

Thanks,
Ray

On Mon, Dec 13, 2021 at 02:34:22PM +0800, Huang, Ray wrote:
> Use __string(), __assign_str() and __get_str() helpers in the TRACE_EVENT()
> instead of string definitions in gpu scheduler trace.
> 
> [  158.890890] ------------[ cut here ]------------
> [  158.890899] fmt: 'entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d
>                ' current_buffer: '            Xorg-1588    [001] .....   149.391136: drm_sched_job: entity=0000000076f0d517, id=1, fence=000000008dd56028, ring='
> [  158.890910] WARNING: CPU: 6 PID: 1617 at kernel/trace/trace.c:3830 trace_check_vprintf+0x481/0x4a0
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 877ce9b127f1..4e397790c195 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -38,6 +38,7 @@ TRACE_EVENT(drm_sched_job,
>  	    TP_STRUCT__entry(
>  			     __field(struct drm_sched_entity *, entity)
>  			     __field(struct dma_fence *, fence)
> +			     __string(name, sched_job->sched->name)
>  			     __field(const char *, name)
>  			     __field(uint64_t, id)
>  			     __field(u32, job_count)
> @@ -48,14 +49,14 @@ TRACE_EVENT(drm_sched_job,
>  			   __entry->entity = entity;
>  			   __entry->id = sched_job->id;
>  			   __entry->fence = &sched_job->s_fence->finished;
> -			   __entry->name = sched_job->sched->name;
> +			   __assign_str(name, sched_job->sched->name);
>  			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>  			   __entry->hw_job_count = atomic_read(
>  				   &sched_job->sched->hw_rq_count);
>  			   ),
>  	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>  		      __entry->entity, __entry->id,
> -		      __entry->fence, __entry->name,
> +		      __entry->fence, __get_str(name),
>  		      __entry->job_count, __entry->hw_job_count)
>  );
>  
> @@ -65,7 +66,7 @@ TRACE_EVENT(drm_run_job,
>  	    TP_STRUCT__entry(
>  			     __field(struct drm_sched_entity *, entity)
>  			     __field(struct dma_fence *, fence)
> -			     __field(const char *, name)
> +			     __string(name, sched_job->sched->name)
>  			     __field(uint64_t, id)
>  			     __field(u32, job_count)
>  			     __field(int, hw_job_count)
> @@ -75,14 +76,14 @@ TRACE_EVENT(drm_run_job,
>  			   __entry->entity = entity;
>  			   __entry->id = sched_job->id;
>  			   __entry->fence = &sched_job->s_fence->finished;
> -			   __entry->name = sched_job->sched->name;
> +			   __assign_str(name, sched_job->sched->name);
>  			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>  			   __entry->hw_job_count = atomic_read(
>  				   &sched_job->sched->hw_rq_count);
>  			   ),
>  	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>  		      __entry->entity, __entry->id,
> -		      __entry->fence, __entry->name,
> +		      __entry->fence, __get_str(name),
>  		      __entry->job_count, __entry->hw_job_count)
>  );
>  
> @@ -103,7 +104,7 @@ TRACE_EVENT(drm_sched_job_wait_dep,
>  	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
>  	    TP_ARGS(sched_job, fence),
>  	    TP_STRUCT__entry(
> -			     __field(const char *,name)
> +			     __string(name, sched_job->sched->name)
>  			     __field(uint64_t, id)
>  			     __field(struct dma_fence *, fence)
>  			     __field(uint64_t, ctx)
> @@ -111,14 +112,14 @@ TRACE_EVENT(drm_sched_job_wait_dep,
>  			     ),
>  
>  	    TP_fast_assign(
> -			   __entry->name = sched_job->sched->name;
> +			   __assign_str(name, sched_job->sched->name);
>  			   __entry->id = sched_job->id;
>  			   __entry->fence = fence;
>  			   __entry->ctx = fence->context;
>  			   __entry->seqno = fence->seqno;
>  			   ),
>  	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
> -		      __entry->name, __entry->id,
> +		      __get_str(name), __entry->id,
>  		      __entry->fence, __entry->ctx,
>  		      __entry->seqno)
>  );
> -- 
> 2.25.1
> 
