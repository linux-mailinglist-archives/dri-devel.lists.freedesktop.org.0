Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4F8AB6BD2
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 14:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD81710E632;
	Wed, 14 May 2025 12:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="HNR9i4K6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83110E631
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:53:28 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZyCv90K1mz9tHh;
 Wed, 14 May 2025 14:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747227205; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lm/MiXf4ihAaUzAEA46o1hoZuKLtMGGmVsS5HYc+ftY=;
 b=HNR9i4K6g4d8AIbT72lAahbjubd4mU4WEI0EoZJba/Wkj8pOgiE7EGE+WmfOzG7MRYinOP
 JPHyc/Rzc9OUyQJCXigpzzvt2v2v2l9q9TFsmTzZkRrS3YiwITrUz+yTj51djjqcWZ+MPH
 Az59TrdqUI14isAdxFeLnnpuLLtAtzSAEuygcLSGII7P5z4Tu+CG0Ti1DU9SbwKIIbSoyj
 hK7PiVOsUnuwz79nWch6JnMA5tTcufEK1YqqrgpLlrP9tjqnQbWkA8dOve1eiGAumsCCOH
 TrartWS8kn4VlkP2cl2zE3hoYdP3Uba25A411/1lx8E+wIiX5S5LDMIM6r5n6g==
Message-ID: <27825c551adeda28f4b329f44c316ad2ab67fa5d.camel@mailbox.org>
Subject: Re: [PATCH v9 09/10] drm/doc: document some tracepoints as uAPI
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Matthew Brost <matthew.brost@intel.com>,  Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 14 May 2025 14:53:17 +0200
In-Reply-To: <20250424083834.15518-10-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-10-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: acfe79c786622b263c1
X-MBO-RS-META: t1hfj4zih9aibaphwnzyumj39wajigan
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

On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer wrote:
> This commit adds a document section in drm-uapi.rst about
> tracepoints,
> and mark the events gpu_scheduler_trace.h as stable uAPI.
>=20
> The goal is to explicitly state that tools can rely on the fields,
> formats and semantics of these events.
>=20
> Acked-by: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0Documentation/gpu/drm-uapi.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19
> +++++++++++++++++++
> =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 19
> +++++++++++++++++++
> =C2=A02 files changed, 38 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-
> uapi.rst
> index 69f72e71a96e..4863a4deb0ee 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -693,3 +693,22 @@ dma-buf interoperability
> =C2=A0
> =C2=A0Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst
> for
> =C2=A0information on how dma-buf is integrated and exposed within DRM.
> +
> +
> +Trace events
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +See Documentation/trace/tracepoints.rst for information about using
> +Linux Kernel Tracepoints.
> +In the DRM subsystem, some events are considered stable uAPI to
> avoid
> +breaking tools (e.g.: GPUVis, umr) relying on them. Stable means
> that fields
> +cannot be removed, nor their formatting updated. Adding new fields
> is
> +possible, under the normal uAPI requirements.
> +
> +Stable uAPI events
> +------------------
> +
> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> +
> +.. kernel-doc::=C2=A0 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +=C2=A0=C2=A0 :doc: uAPI trace events
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 781b20349389..7e840d08ef39 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -32,6 +32,25 @@
> =C2=A0#define TRACE_SYSTEM gpu_scheduler
> =C2=A0#define TRACE_INCLUDE_FILE gpu_scheduler_trace
> =C2=A0
> +/**
> + * DOC: uAPI trace events
> + *
> + * ``drm_sched_job_queue``, ``drm_sched_job_run``,
> ``drm_sched_job_add_dep``,
> + * ``drm_sched_job_done`` and ``drm_sched_job_unschedulable`` are
> considered
> + * stable uAPI.
> + *
> + * Common trace events attributes:
> + *
> + * * ``dev``=C2=A0=C2=A0 - the dev_name() of the device running the job.
> + *
> + * * ``ring``=C2=A0 - the hardware ring running the job. Together with
> ``dev`` it
> + *=C2=A0=C2=A0 uniquely identifies where the job is going to be executed=
.
> + *
> + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
> + *=C2=A0=C2=A0 &drm_sched_fence.finished
> + *
> + */

For my understanding, why do you use the double apostrophes here?

Also, the linking for the docu afair here two requires you to write

&struct dma_fence.seqno

If I am not mistaken

https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#highlights=
-and-cross-references


P.

> +
> =C2=A0DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct drm_sched_job *sched_job, struc=
t
> drm_sched_entity *entity),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(sched_job, entity),

