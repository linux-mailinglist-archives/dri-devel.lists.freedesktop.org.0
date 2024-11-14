Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED899C88F0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 12:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B518910E1A5;
	Thu, 14 Nov 2024 11:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5F110E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 11:30:32 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tBY3D-0007a0-6s; Thu, 14 Nov 2024 12:30:15 +0100
Message-ID: <37f5814a6f3b5539b01f1137740eb132c3f88500.camel@pengutronix.de>
Subject: Re: [PATCH v6 7/7] drm/doc: document some tracepoints as uAPI
From: Lucas Stach <l.stach@pengutronix.de>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,  rostedt@goodmis.org,
 matt.coster@imgtec.com, frank.binns@imgtec.com,  yuq825@gmail.com,
 robdclark@gmail.com, kherbst@redhat.com, lyude@redhat.com, 
 boris.brezillon@collabora.com, steven.price@arm.com, mwen@igalia.com, 
 mcanal@igalia.com, thomas.hellstrom@linux.intel.com,
 tvrtko.ursulin@igalia.com
Date: Thu, 14 Nov 2024 12:30:09 +0100
In-Reply-To: <20241114100113.150647-8-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-8-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi,

Am Donnerstag, dem 14.11.2024 um 11:01 +0100 schrieb Pierre-Eric
Pelloux-Prayer:
> This commit adds a document section in drm-uapi.rst about tracepoints,
> and mark the events gpu_scheduler_trace.h as stable uAPI.
>=20
> The goal is to explicitly state that tools can rely on the fields,
> formats and semantics of these events.
>=20
> Acked-by: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> ---
>  Documentation/gpu/drm-uapi.rst                | 19 ++++++++++++++++
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 22 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index b75cc9a70d1f..9603ac0f4c09 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -583,3 +583,22 @@ dma-buf interoperability
> =20
>  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>  information on how dma-buf is integrated and exposed within DRM.
> +
> +
> +Trace events
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +See Documentation/trace/tracepoints.rst for information about using
> +Linux Kernel Tracepoints.
> +In the DRM subsystem, some events are considered stable uAPI to avoid
> +breaking tools (e.g.: GPUVis, umr) relying on them. Stable means that fi=
elds
> +cannot be removed, nor their formatting updated. Adding new fields is
> +possible, under the normal uAPI requirements.
> +
> +Stable uAPI events
> +------------------
> +
> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> +
> +.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +   :doc: uAPI trace events
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gp=
u/drm/scheduler/gpu_scheduler_trace.h
> index 8340c7c0c6b6..ec230e558961 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -33,6 +33,28 @@
>  #define TRACE_SYSTEM gpu_scheduler
>  #define TRACE_INCLUDE_FILE gpu_scheduler_trace
> =20
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
> + * * ``ring``  - the hardware ring running the job. Together with ``dev`=
` it
> + *   uniquely identifies where the job is going to be executed.
> + *
It might be nitpicky, but as we change the format of the tracepoints
anyway and are about to declare them a ABI: I don't really like the
ring name. Yes, in most hardware implementations today the mechanism to
queue jobs is a ring buffer, but there are other mechanisms to schedule
jobs (see for example the lima driver). Maybe we could rename this to
something a bit more generic like "dev_queue" or something like that?

Regards,
Lucas

> + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
> + *   &drm_sched_fence.finished
> + *
> + */
> +
>  #ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>  #define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>  /* Similar to trace_print_array_seq but for fences. */

