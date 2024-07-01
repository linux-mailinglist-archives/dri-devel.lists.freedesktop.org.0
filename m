Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5D91DFCE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 14:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD6010E3F8;
	Mon,  1 Jul 2024 12:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="P2nbg+m4";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="/63k5Lj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bunu.damsy.net (bunu.damsy.net [51.159.160.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA67010E3F8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1719837981;
 bh=eVPpYLv5mLVoqUsXp7bnXHv
 3KDaDKta5hFDMS8AUyTg=; b=P2nbg+m4xqOez6gywczJeSpOe87uU3Oi3XUPnCzSTUyRpEe8uy
 qBodeLeOe6tjxJme9zTjDZ89YHVclNgt4GaiYSb469HSeOfgeYhGkzl4w6Mm0b3BDVkfovKInbC
 4vtQ4uUZKdnIBfbqXI+Jir7ioYsqRxRHRHPDI3qJ2x5JAodHOoKwkq8rAye8iuoL4k1bzAg6RJE
 vyItcRr/lwa+fsksE907dIve//QCsc3NiXSkWPcqVbytirDB2+VeEEzp0W2CO1m5O9mdsktfWTI
 CHpN+uOzSd9V5uh6E+0yk6hhBpqxhS2r+pmYbRduPLOhqeQAT6m5y+LzKbQ/XrEM/pg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1719837981; bh=eVPpYLv5mLVoqUsXp7bnXHv
 3KDaDKta5hFDMS8AUyTg=; b=/63k5Lj5nzcb/mbpsNZ5UiQoRvot6t2Wyd3L7bARiGwoyZ2XgP
 qHWaqdp05QlikKc2hDdJR0oID8q76AKWuxDg==;
Message-ID: <fd37bd66-4a34-452c-98fe-2ef808590c2e@damsy.net>
Date: Mon, 1 Jul 2024 14:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/doc: document some tracepoints as uAPI
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org, l.stach@pengutronix.de, matt.coster@imgtec.com,
 frank.binns@imgtec.com, yuq825@gmail.com, robdclark@gmail.com,
 kherbst@redhat.com, lyude@redhat.com, boris.brezillon@collabora.com,
 steven.price@arm.com, mwen@igalia.com, mcanal@igalia.com,
 thomas.hellstrom@linux.intel.com
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20240614081657.408397-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

[adding more people to this thread based on the drivers using gpu_scheduler]

Hi,

Christian's comment on patch 1/5 will be addressed in v6, but before 
pushing another version I'd like to know if there's a consensus among 
the drivers maintainers regarding the changes proposed in this series.

Thanks!
Pierre-Eric


Le 14/06/2024 à 10:16, Pierre-Eric Pelloux-Prayer a écrit :
> This commit adds a document section in drm-uapi.rst about tracepoints,
> and mark the events gpu_scheduler_trace.h as stable uAPI.
> 
> The goal is to explicitly state that tools can rely on the fields,
> formats and semantics of these events.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   Documentation/gpu/drm-uapi.rst                | 19 ++++++++++++++++
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 22 +++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 370d820be248..78496793a8f0 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -570,3 +570,22 @@ dma-buf interoperability
>   
>   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>   information on how dma-buf is integrated and exposed within DRM.
> +
> +
> +Trace events
> +============
> +
> +See Documentation/trace/tracepoints.rst for the tracepoints documentation.
> +In the drm subsystem, some events are considered stable uAPI to avoid
> +breaking tools (eg: gpuvis, umr) relying on them. Stable means that fields
> +cannot be removed, nor their formatting updated. Adding new fields is
> +possible, under the normal uAPI requirements.
> +
> +Stable uAPI events
> +------------------
> +
> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +   :doc: uAPI trace events
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 0abcad26839c..63113803cdd5 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -33,6 +33,28 @@
>   #define TRACE_SYSTEM gpu_scheduler
>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>   
> +
> +/**
> + * DOC: uAPI trace events
> + *
> + * ``drm_sched_job``, ``drm_run_job``, ``drm_sched_process_job``,
> + * and ``drm_sched_job_wait_dep`` are considered stable uAPI.
> + *
> + * Common trace events attributes:
> + *
> + * * ``id``    - this is &drm_sched_job->id. It uniquely idenfies a job
> + *   inside a &struct drm_gpu_scheduler.
> + *
> + * * ``dev``   - the dev_name() of the device running the job.
> + *
> + * * ``ring``  - the hardware ring running the job. Together with ``dev`` it
> + *   uniquely identifies where the job is going to be executed.
> + *
> + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
> + *   &drm_sched_fence.finished
> + *
> + */
> +
>   #ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>   #define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>   /* Similar to trace_print_array_seq but for fences. */
