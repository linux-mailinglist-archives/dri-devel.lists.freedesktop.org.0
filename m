Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A54944AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 01:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D8D10EF04;
	Thu, 20 Jan 2022 00:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9B010E77E;
 Thu, 20 Jan 2022 00:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXxuKXh0WHl3iUsD0A+NdUlOv+p3SOGTVlbeJwCOcy6h3RG0OzM7WFSvi7N7mZFO6y3kI4LwvVAnzq0Ia/rX0I7F1KBW24lSx7maDc4RywXLIxxXFgCGW8horaueze29jL03UXRUBWvP11WeoYQrVr7PKMp6zxmGN48okpuydHZfmgyFU9wZZzDJixmyjQri2ylsdeESw06eRGNTNYHkoLhu5ysO8toKARD7RDtNq+bvL/SMeHkxzrqDS33o08ZE+C/X8RshL2BvuNfrBUKGdvv4jlWflHYaf4VjCyXkbmhdbd2OdsGYrc42vHJ2Lue4ez1qIBfC5yfkY4kWGciizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgD4HQPtHtJX9aHU2NrXQ3y6kke5zH2iprm7trFuYD0=;
 b=GRxSghr566WY0RgwbTgvz7f5fk7Bct2w80PYZLGXj3PMkmaFC86osehM1rntyDYzQCfVHgjM72ZqYf+7kRJZWErCnHCRZqwNe8rTUAU/+FpAn6/Gt55pd4zxsoZSDodWC7W5WmtHcDywO2cd/nwbdvQVF0W7pDw34MjXj04356sibmcoZ4UqDopkNd09MF/jrxHa9jXue4Gk0jqBT9odAfoWWw0xDVIxGaulSOXp8UVuzspyefdHvVtEAEEDx4V7D5SdBeR6rCnmWhr58c1V6AqBgzTigE1p2XUhCfGe0Vef3F3PbYw3DzlbtPDe1rT+fGUdcj+aLVKeHmABYKBOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgD4HQPtHtJX9aHU2NrXQ3y6kke5zH2iprm7trFuYD0=;
 b=4gz4ooxWxu3Fl7iXPm0+ngHfe9eJTIGat/gjnesC1EdLfyJ5Fnd1qojiAIRrv7mCjR0dXuXkUqVIXb1uqKRLbNNTCGSH0iLga9Ne5shtRu/tq9rQ3a7s/XepFik/Ui0sdnO39vkAWRMqvu6MzOZ5RCDLyYAfqEA5S0hQRhFY4cA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM6PR12MB4529.namprd12.prod.outlook.com (2603:10b6:5:2ab::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Thu, 20 Jan 2022 00:31:36 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::f02e:2cba:7c63:e368]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::f02e:2cba:7c63:e368%4]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 00:31:36 +0000
Date: Thu, 20 Jan 2022 08:31:15 +0800
From: Huang Rui <ray.huang@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH 3/3] drm: fix the warnning of string style for scheduler
 trace.
Message-ID: <YeitU8lQnKHMZfFM@amd.com>
References: <20211213063422.2232155-1-ray.huang@amd.com>
 <20211213063422.2232155-3-ray.huang@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213063422.2232155-3-ray.huang@amd.com>
X-ClientProxiedBy: HKAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:203:d0::13) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bea6853-3de7-4842-3776-08d9dbac3754
X-MS-TrafficTypeDiagnostic: DM6PR12MB4529:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB45290D0C76508090AE6BE4B0EC5A9@DM6PR12MB4529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1b4NaBcHLH/R6GWAaDHdBim/+19PmpF3Iiubq8cpHnlTK0LaBlL7yAxFOebJ1EWdhX38lzwKjPbMh2S9wdw5Q8rnasMVv4LqnA025O5g4lZbE5jj1Zg2IaHgCu5d3ucYC3Nj3cWjpBH7dwYxUhAC6xWGMP0u28DE6h1N/WUbxBen3pF101qlXt2Q5QsT1iC92QCHHZzJjF4k0w3JPNqZlk3dJr7pMhRJm9uB4TmrD0+oCtTEJ2nIfHdxlkG1DUDgdDCP+IT0r4LdE5QXHkDurYtKTvBBNbVjFhxFU3NcPSi8m4teSXvTyT+PV4danDFxI2iE3zRIPLNu/c0pp0Pxf3HucUJAkGo3oEhmHOs253Wx1WNBn0isKUd/EklzujLAWUDXHByGrot3hcb8MePmwdoUNivsbVUFcsIP4G4p7cgHGItpNv7l0MIDlvs1J5uYKGWSR+o0FN7oz+WrY8eK1FhXjCIxy6RyPC3o0XTPHlkQcCNc3qndz8pnjw43TFKUphXUwD+z91DLTxGEZ6YNVYf7jLjY9SKDvTHYM/SZg7Q1P/tNyY6jMJAjlsm+NSikPZDmo5OHG2kdKumeADnvUkt1Gi1vducLJKeFT4j7/dyTYmnn85wlLE1SOgRzQKumlZC4T90dBVw0V5t/gYbD5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(6506007)(5660300002)(83380400001)(4326008)(316002)(6636002)(66476007)(66556008)(2906002)(38100700002)(86362001)(66946007)(8936002)(6486002)(26005)(508600001)(6512007)(2616005)(6666004)(186003)(8676002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FOPLTJ4TycnIGA2ndlpeKTccfzbnuaVpuVfGbKAczvA9j/m8Vtuy86RU2laT?=
 =?us-ascii?Q?eP1qcjhdBKU46mcY+RvJZPniDW+0bfdrgIs1yFUIFqCdq0Fo3wY/jzbZpzic?=
 =?us-ascii?Q?QbZYGs90cYZDPFfCximCe/9Yo0yElkJuWesPra612i1o0agkQCbyQdgO4lK6?=
 =?us-ascii?Q?H0IpJl73rIOfbRxyVeRDV5vWj/c4b767lhPrWa3msRsF6Z3U0PSNfD/W7Upu?=
 =?us-ascii?Q?yk+h0Q6twu45VP9vPPBPUQ/x7yKU0dZLf9Qq5/g4YM+K1zPVhKaFOkIH1NAz?=
 =?us-ascii?Q?6ist+4gP8DzO3O7CpNTgwEvHadHMV6snpBauv8UWkQmw2sTcFoO9CB6/vksH?=
 =?us-ascii?Q?rDUjxeV6DS+SGlJPizKv6jgppRyoTvS6Go6YoM9ewDlqZ6CIBuHeGc0YA1Q9?=
 =?us-ascii?Q?1NwqH76hO1Oaj4jsxKg2fZ7pFhd208apAeUE69AWotWU3tmLp4yhNcWEb5CL?=
 =?us-ascii?Q?LfS11KtEPB3C95PgCL/UzHIxMEe8svqcHkcXecwZ7HXMv5HD91f2ZVIijdQ4?=
 =?us-ascii?Q?SnQwj9zeQBbtrTIod1AgJ36d1EegA8PDlbzmZlxVkpzCSJWbpLvc/e7zOMXz?=
 =?us-ascii?Q?qVIy3RLJGbubL+K1haJ1JWH/lRA+QW6axJIoulZ4X0Gh2jT7HCZJXlpIuUkA?=
 =?us-ascii?Q?Khvzwpftw5bHvMZ4Y94NRElZqbRhVICLuwoO4QoaP0elht5Vq+wkykL4gkfa?=
 =?us-ascii?Q?/U778hS4OTDXKHjZgBAYkUFtX0O2NapCcV0xVOA9JhXc3Xca8m2N5j2GKTHe?=
 =?us-ascii?Q?gs0+CZVJyWeYYb1+KdoVh+pOeoJZlon/vUrzTuk+2ysr2wmmUcqLJ6OuRe5f?=
 =?us-ascii?Q?F0IHNMuMsF8EPuve5J7+D2Fzeb1kyWIG6H2Q8VvfO298JHSI/mi31tfwP6S7?=
 =?us-ascii?Q?VL+aFC/jQ4B7z/JxM5zcihIkon0RRuluVgmVA3W8YT/jdAOB0gL9QqWSkOFT?=
 =?us-ascii?Q?Ri5GzYoxSyHjz5gHZYOrYUbIQnd3Xijf9vuKJ7Cyowt9wQkoKcAl0A5XvIsF?=
 =?us-ascii?Q?Zvo05v3b3UMRB5SAE7bkT4Eav2hDqqNAe7nymv+wqdrhtFGUfZqkVSZT1EPn?=
 =?us-ascii?Q?L5NjES9XO6bbZyr2lx2jZb5Ih9LDTIot+tRmM4vuuwk2jAxyQ/YqbDjf6i7c?=
 =?us-ascii?Q?KatyzzW+/g1IcjUliy6PVkdFYk1NJnBDVzqyC2SMygiviUn+g0FnyoZ27Rya?=
 =?us-ascii?Q?lnm3S78x1iXu0E7vAJMJz9M9LbxIU4iftUe4pmPchygbPxGysbbDzMTGpTn1?=
 =?us-ascii?Q?n1hgoyb5dxW5Q9IPzo3nsf7lLi0DszqPgHWF9aRbmR0/Zg4Rj6Uy2si8wsNd?=
 =?us-ascii?Q?pZBXSulhYz+Te2OpunB5NucB5v7J4gCboLiEGkO8mUpQueKv7SAcy72Gah5C?=
 =?us-ascii?Q?Cz5oLJaH0P2lL4sJkdFg58SYNax087brT2cALZsIx9RoU3EEnjITrjuY/3oG?=
 =?us-ascii?Q?rdAtRDwdpd2HBXGKRXUMBJddQeVPWq9Iii6oRJmlHxS5N18zE6NyqR+4Hrs7?=
 =?us-ascii?Q?I+3aNDmsAUPgXkmvyqENc/G3pJr4dZ9NjwqJZxudM0ofiZEu7LVyJCufYFaf?=
 =?us-ascii?Q?6l3iRBdUJkCZjJ85KhRBtwPAOkCZGkLLECIMXXapV6vEG9+gC8QeNouyqNqp?=
 =?us-ascii?Q?WZDu/UgbxORE/RLeODfJlGI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bea6853-3de7-4842-3776-08d9dbac3754
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 00:31:36.2353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saWvVgeOsI868nlRVFUhBakafb9+gIHmqQtOP1iFm0lFf+Edk5cbI90D9xex52+dYc56qPrF0arB0ONVfuUBUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4529
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

Ping~

Seems this patch is missed.

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
