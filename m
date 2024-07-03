Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABE92651F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209A10E992;
	Wed,  3 Jul 2024 15:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hXhNPn/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7543810E992
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=co5S1O+nFAYKtqyTTwGI+aZ5Bvnu6ro8vic3Pze64Ak=; b=hXhNPn/+lkbZRPItbNfq+b9Nh4
 9vGFru9h6lePd1yC51pcTGVupFoLZmZfFsf0PVAAEpUSCmLeWfbFKU0an5KtEOXhy+dQRQeGXMyfA
 1xrVrSpmhBu3jDfh8xTJhb5tZvh19L2wlV1b9f4rIo7/ObF/aSRHOE4QIVoUXhfYPg6BYLf+ugF6X
 o5nNUseDPUomYKRPOCQNL8uW4b2B3zjNRc9QTI4KhRmM+QBqQZk7/6Y/RBB42lEU3hOWkTFjM3hhT
 kQhmk4RTHo1yzIrMLQVZwwG63TyZlc/Tcr+eDVnte7P5JsMMohqN7VY/YT7ax9qKfOzlF8cubSdb2
 U6kpwEsA==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sP26g-00AlZu-4w; Wed, 03 Jul 2024 17:41:18 +0200
Message-ID: <d509317e-3b85-4ce5-95a5-081697d7253f@igalia.com>
Date: Wed, 3 Jul 2024 12:41:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/doc: document some tracepoints as uAPI
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
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

Hi Pierre,

On 6/14/24 05:16, Pierre-Eric Pelloux-Prayer wrote:
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

I would write it:

"See Documentation/trace/tracepoints.rst for information about using
Linux Kernel Tracepoints."

> +In the drm subsystem, some events are considered stable uAPI to avoid

Super small nit: s/drm/DRM

> +breaking tools (eg: gpuvis, umr) relying on them. Stable means that fields

Super small nit:

1. s/eg:/e.g.:
2. s/gpuvis/GPUVis (maybe a URL to it?)
3. Maybe a URL to umr?


> +cannot be removed, nor their formatting updated. Adding new fields is
> +possible, under the normal uAPI requirements.
> +
> +Stable uAPI events
> +------------------
> +
> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Super small nit: from the rest of the file, I see that a title was never
needed. Do we need it here?

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

Super small nit again, but I believe we should format function names
with ``foo()``, if I understood kerneldoc documentation correctly.

Apart from all those nits, I completely agree with Lucas, it is great to
see this improvement.

Acked-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

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
