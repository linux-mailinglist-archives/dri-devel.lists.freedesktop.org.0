Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB33AEDB53
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DF010E418;
	Mon, 30 Jun 2025 11:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fnUK5hf6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4569310E20A;
 Mon, 30 Jun 2025 11:40:12 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bW42t4Wpjz9sHY;
 Mon, 30 Jun 2025 13:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751283606; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ju0QeUWE/pTZSASzdUg/CQZA1o0fNNC1gAV/nZ05ak=;
 b=fnUK5hf6zI62w7f1WfC9vtfGSBkblJizWYsyytVw8Pjqhx+wBgeiKZ+9Hmfb27IMMd2652
 bDCcAH4B/no8/CqfX/j6FX6fEkK9rWY57Xbf7p9Gx21ojomNZDubM22m01DBnTp9TB308k
 XNNpbmrny9LdAyP2JEv5tUhib2zgWPRMNh1d3CAELd9U8XDYHCSucAexodzjSGcXV2Joks
 PEpvtwnsf/Kb9wr60M4gRtxy8iY2Le3SUwTyoOXQvEclRzxWouL/tkwLMA7QA7zg8kbmz7
 zb/TnDlGoNIIhwui7J67CYE/9+yo3xsBQDjbwmyGLOZxi2MMLa5t5iYFuaD8lQ==
Message-ID: <8a1603dad58b7de0cf91c5279bf4d6cfc09a4e50.camel@mailbox.org>
Subject: Re: [PATCH v3 1/8] drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to
 DRM_GPU_SCHED_STAT_RESET
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Min Ma
 <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>,  Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Qiang Yu <yuq825@gmail.com>,  Lyude Paul
 <lyude@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Mon, 30 Jun 2025 13:39:54 +0200
In-Reply-To: <20250618-sched-skip-reset-v3-1-8be5cca2725d@igalia.com>
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-1-8be5cca2725d@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 905fbe356730b3969e0
X-MBO-RS-META: 1nj9bgjwk9pyr5ccirrznzqoriyuu5f7
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-06-18 at 11:47 -0300, Ma=C3=ADra Canal wrote:
> Among the scheduler's statuses, the only one that indicates an error
> is
> DRM_GPU_SCHED_STAT_ENODEV. Any status other than
> DRM_GPU_SCHED_STAT_ENODEV
> signifies that the operation succeeded and the GPU is in a nominal
> state.
>=20
> However, to provide more information about the GPU's status, it is
> needed
> to convey more information than just "OK".
>=20
> Therefore, rename DRM_GPU_SCHED_STAT_NOMINAL to
> DRM_GPU_SCHED_STAT_RESET, which betters communicates the meaning of

s/betters/better

I could fix that when applying, in case you don't go to a v4.

> this
> status. The status DRM_GPU_SCHED_STAT_RESET indicates that the GPU
> has
> hung, but it has been successfully reset and is now in a nominal
> state
> again.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

>=20
> ---
> To: Min Ma <min.ma@amd.com>
> To: Lizhi Hou <lizhi.hou@amd.com>
> To: Oded Gabbay <ogabbay@kernel.org>
> To: Frank Binns <frank.binns@imgtec.com>
> To: Matt Coster <matt.coster@imgtec.com>
> To: Qiang Yu <yuq825@gmail.com>
> To: Lyude Paul <lyude@redhat.com>
> To: Alex Deucher <alexander.deucher@amd.com>
> To: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/accel/amdxdna/aie2_ctx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
> =C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 2 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++-=
--
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 ++--
> =C2=A015 files changed, 26 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c
> b/drivers/accel/amdxdna/aie2_ctx.c
> index
> f20999f2d66864fd4a6b7069e866727c37befb39..2cff5419bd2facb59ff5df6388a
> ba0512fd45d5c 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -361,7 +361,7 @@ aie2_sched_job_timedout(struct drm_sched_job
> *sched_job)
> =C2=A0	aie2_hwctx_restart(xdna, hwctx);
> =C2=A0	mutex_unlock(&xdna->dev_lock);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct drm_sched_backend_ops sched_ops =3D {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index
> 1e24590ae1449f49e4632fbf2b931e04c03af8d5..58fd1d1f8571a869ad5d7594ea4
> bb2599a459113 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -200,7 +200,7 @@ static enum drm_gpu_sched_stat
> amdgpu_job_timedout(struct drm_sched_job *s_job)
> =C2=A0
> =C2=A0exit:
> =C2=A0	drm_dev_exit(idx);
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm
> *vm,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index
> 76a3a3e517d8d9f654fb6b9e98e72910795cfc7a..7146069a98492f5fab2a49d96e2
> 054f649e1fe3d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -86,11 +86,11 @@ static enum drm_gpu_sched_stat
> etnaviv_sched_timedout_job(struct drm_sched_job
> =C2=A0	drm_sched_resubmit_jobs(&gpu->sched);
> =C2=A0
> =C2=A0	drm_sched_start(&gpu->sched, 0);
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0
> =C2=A0out_no_timeout:
> =C2=A0	list_add(&sched_job->list, &sched_job->sched->pending_list);
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> b/drivers/gpu/drm/imagination/pvr_queue.c
> index
> 5a41ee79fed646a86344cd16e78efdb45ff02e43..fc415dd0d7a73631bd4144c9f35
> b9b294c625a12 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -803,7 +803,7 @@ static void pvr_queue_start(struct pvr_queue
> *queue)
> =C2=A0 * the scheduler, and re-assign parent fences in the middle.
> =C2=A0 *
> =C2=A0 * Return:
> - *=C2=A0 * DRM_GPU_SCHED_STAT_NOMINAL.
> + *=C2=A0 * DRM_GPU_SCHED_STAT_RESET.
> =C2=A0 */
> =C2=A0static enum drm_gpu_sched_stat
> =C2=A0pvr_queue_timedout_job(struct drm_sched_job *s_job)
> @@ -854,7 +854,7 @@ pvr_queue_timedout_job(struct drm_sched_job
> *s_job)
> =C2=A0
> =C2=A0	drm_sched_start(sched, 0);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/lima/lima_sched.c
> b/drivers/gpu/drm/lima/lima_sched.c
> index
> 954f4325b859b2977a2cc608a99a6ebb642f1000..739e8c6c6d909aa4263bad8a12e
> c07f0c6607bb2 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -412,7 +412,7 @@ static enum drm_gpu_sched_stat
> lima_sched_timedout_job(struct drm_sched_job *job
> =C2=A0	 */
> =C2=A0	if (dma_fence_is_signaled(task->fence)) {
> =C2=A0		DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0	}
> =C2=A0
> =C2=A0	/*
> @@ -429,7 +429,7 @@ static enum drm_gpu_sched_stat
> lima_sched_timedout_job(struct drm_sched_job *job
> =C2=A0
> =C2=A0	if (dma_fence_is_signaled(task->fence)) {
> =C2=A0		DRM_WARN("%s unexpectedly high interrupt latency\n",
> lima_ip_name(ip));
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0	}
> =C2=A0
> =C2=A0	/*
> @@ -467,7 +467,7 @@ static enum drm_gpu_sched_stat
> lima_sched_timedout_job(struct drm_sched_job *job
> =C2=A0	drm_sched_resubmit_jobs(&pipe->base);
> =C2=A0	drm_sched_start(&pipe->base, 0);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static void lima_sched_free_job(struct drm_sched_job *job)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c
> b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index
> 41b7c608c9054869ddadfe17c96100266e44c254..edbbda78bac90432c4877aa39a9
> 587cf976705c7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -189,7 +189,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
> =C2=A0	NV_PRINTK(warn, job->cli, "job timeout, channel %d
> killed!\n",
> =C2=A0		=C2=A0 chan->chid);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct nouveau_job_ops nouveau_exec_job_ops =3D {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index
> 460a5fb024129a0557f2b55008278e1378019d89..e60f7892f5ce9aff0c5fa1908c1
> a0445891927ed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -371,7 +371,7 @@ nouveau_sched_timedout_job(struct drm_sched_job
> *sched_job)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched =3D sched_job->sched;
> =C2=A0	struct nouveau_job *job =3D to_nouveau_job(sched_job);
> -	enum drm_gpu_sched_stat stat =3D DRM_GPU_SCHED_STAT_NOMINAL;
> +	enum drm_gpu_sched_stat stat =3D DRM_GPU_SCHED_STAT_RESET;
> =C2=A0
> =C2=A0	drm_sched_stop(sched, sched_job);
> =C2=A0
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> b/drivers/gpu/drm/panfrost/panfrost_job.c
> index
> 5657106c2f7d0a0ca6162850767f58f3200cce13..afcffe7f8fe9e11f84e4ab7e8f5
> a72f7bf583690 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -755,7 +755,7 @@ static enum drm_gpu_sched_stat
> panfrost_job_timedout(struct drm_sched_job
> =C2=A0	 * spurious. Bail out.
> =C2=A0	 */
> =C2=A0	if (dma_fence_is_signaled(job->done_fence))
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Panfrost IRQ handler may take a long time to process an
> interrupt
> @@ -770,7 +770,7 @@ static enum drm_gpu_sched_stat
> panfrost_job_timedout(struct drm_sched_job
> =C2=A0
> =C2=A0	if (dma_fence_is_signaled(job->done_fence)) {
> =C2=A0		dev_warn(pfdev->dev, "unexpectedly high interrupt
> latency\n");
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0	}
> =C2=A0
> =C2=A0	dev_err(pfdev->dev, "gpu sched timeout, js=3D%d, config=3D0x%x,
> status=3D0x%x, head=3D0x%x, tail=3D0x%x, sched_job=3D%p",
> @@ -786,7 +786,7 @@ static enum drm_gpu_sched_stat
> panfrost_job_timedout(struct drm_sched_job
> =C2=A0	atomic_set(&pfdev->reset.pending, 1);
> =C2=A0	panfrost_reset(pfdev, sched_job);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static void panfrost_reset_work(struct work_struct *work)
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> b/drivers/gpu/drm/panthor/panthor_mmu.c
> index
> b39ea6acc6a9681f2ffa7d52248b6d2c119d1f1b..d0ae462015510bd0c25aaffc059
> d28084e600372 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2270,7 +2270,7 @@ static enum drm_gpu_sched_stat
> =C2=A0panthor_vm_bind_timedout_job(struct drm_sched_job *sched_job)
> =C2=A0{
> =C2=A0	WARN(1, "VM_BIND ops are synchronous for now, there should
> be no timeout!");
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct drm_sched_backend_ops panthor_vm_bind_ops =3D {
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> b/drivers/gpu/drm/panthor/panthor_sched.c
> index
> a2248f692a030c1c84869b9a1948ad1cb0c0b490..8f17394cc82aad9eaf01e473cd9
> d3dea46fa3d61 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3241,7 +3241,7 @@ queue_timedout_job(struct drm_sched_job
> *sched_job)
> =C2=A0
> =C2=A0	queue_start(queue);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static void queue_free_job(struct drm_sched_job *sched_job)
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index
> c63543132f9de177f93889f9528158b9cfadfd4d..fb6d9eddf5b378910b66d456f36
> 10ff2ca7c0f41 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -541,7 +541,7 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched;
> =C2=A0	struct drm_sched_job *job;
> -	enum drm_gpu_sched_stat status =3D DRM_GPU_SCHED_STAT_NOMINAL;
> +	enum drm_gpu_sched_stat status =3D DRM_GPU_SCHED_STAT_RESET;
> =C2=A0
> =C2=A0	sched =3D container_of(work, struct drm_gpu_scheduler,
> work_tdr.work);
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index
> 7f947ab9d32259d72186a6c0bff0b666fdee1821..27383a260a48d7b63d0c9d31067
> ecef9bbe1273f 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -207,7 +207,7 @@ mock_sched_timedout_job(struct drm_sched_job
> *sched_job)
> =C2=A0
> =C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_TIMEDOUT;
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static void mock_sched_free_job(struct drm_sched_job *sched_job)
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index
> 35f131a46d0701cc8040d3b9654595a2bc260eab..e2b7f24d528e773968daea0f5b3
> 1c869584bb692 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -741,7 +741,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d,
> struct drm_sched_job *sched_job)
> =C2=A0
> =C2=A0	mutex_unlock(&v3d->reset_lock);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static void
> @@ -773,7 +773,7 @@ v3d_cl_job_timedout(struct drm_sched_job
> *sched_job, enum v3d_queue q,
> =C2=A0		*timedout_ctra =3D ctra;
> =C2=A0
> =C2=A0		v3d_sched_skip_reset(sched_job);
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0	}
> =C2=A0
> =C2=A0	return v3d_gpu_reset_for_timeout(v3d, sched_job);
> @@ -819,7 +819,7 @@ v3d_csd_job_timedout(struct drm_sched_job
> *sched_job)
> =C2=A0		job->timedout_batches =3D batches;
> =C2=A0
> =C2=A0		v3d_sched_skip_reset(sched_job);
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0	}
> =C2=A0
> =C2=A0	return v3d_gpu_reset_for_timeout(v3d, sched_job);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index
> 4a9ada5edbca4facfbd3ba82082dc9c3af4fc191..9c7e445b9ea7ce7e3610eadca02
> 3e6d810e683e9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1082,7 +1082,7 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> =C2=A0		xe_sched_add_pending_job(sched, job);
> =C2=A0		xe_sched_submission_start(sched);
> =C2=A0
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Kill the run_job entry point */
> @@ -1251,7 +1251,7 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> =C2=A0	/* Start fence signaling */
> =C2=A0	xe_hw_fence_irq_start(q->fence_irq);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0
> =C2=A0sched_enable:
> =C2=A0	enable_scheduling(q);
> @@ -1264,7 +1264,7 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> =C2=A0	xe_sched_add_pending_job(sched, job);
> =C2=A0	xe_sched_submission_start(sched);
> =C2=A0
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
> +	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> =C2=A0static void __guc_exec_queue_fini_async(struct work_struct *w)
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index
> e62a7214e05217d72de5c6e5168544d47099090a..83e5c00d8dd9a83ab20547a93d6
> fc572de97616e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -391,12 +391,12 @@ struct drm_sched_job {
> =C2=A0 * enum drm_gpu_sched_stat - the scheduler's status
> =C2=A0 *
> =C2=A0 * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> - * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> + * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
> =C2=A0 * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> anymore.
> =C2=A0 */
> =C2=A0enum drm_gpu_sched_stat {
> =C2=A0	DRM_GPU_SCHED_STAT_NONE,
> -	DRM_GPU_SCHED_STAT_NOMINAL,
> +	DRM_GPU_SCHED_STAT_RESET,
> =C2=A0	DRM_GPU_SCHED_STAT_ENODEV,
> =C2=A0};
> =C2=A0
>=20

