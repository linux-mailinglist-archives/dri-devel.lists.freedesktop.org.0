Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CFDA81F29
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D70610E800;
	Wed,  9 Apr 2025 08:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="H9kbCebU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F012F10E800;
 Wed,  9 Apr 2025 08:03:44 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZXb711qMBz9t4w;
 Wed,  9 Apr 2025 10:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744185821; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fqznLAyvHu/jJ9za6hfLAeZqCvQ3xojCZMtgLC3XYw=;
 b=H9kbCebUZR1c7HOrQgYjPIYBVEFAXQSWcq6/p1UyaFsQL5RVW8qDJPZJDp+qC3GjKNVxRt
 DRZL0n/rENniKePXYZaCqEJY0i7wRIVO8nj1NZnDeePrW2Dn3W1dB+9XWKWpB33dMcfYJ9
 J2f7juccWHrQ6rBYVzSeuDhek0t6v0Y1omaNC+VbHOyOLNiRNHXjOlg+v77wj55CLq6kZe
 I8GCkSKnPB7VGieK0t/tUrz6+VwPURjf1eHIX/aqKevwbGEZET2BfNY4v4zU1C5ZKlQMsV
 q1BjHRuzslbwi9G5yJVXKkWQP5uTYc6Ftpwgx9gaAtErlzy1rplwxy1+/krYeg==
Message-ID: <2486e9eba3806f8e7fc3df724e916929a627fac7.camel@mailbox.org>
Subject: Re: [PATCH v8 00/10] Improve gpu_scheduler trace events + UAPI
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, Pierre-Eric
 Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Philipp Stanner <phasta@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, lima@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, nouveau@lists.freedesktop.org
Date: Wed, 09 Apr 2025 10:03:34 +0200
In-Reply-To: <f3416edf-46f8-4296-86bd-600ab629fe60@damsy.net>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
 <f3416edf-46f8-4296-86bd-600ab629fe60@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ac77wnkq97cnh7ipc437xrje46qmhgfq
X-MBO-RS-ID: 890d0c8e5ddfbadb243
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

On Wed, 2025-04-09 at 09:52 +0200, Pierre-Eric Pelloux-Prayer wrote:
> Hi,
>=20
> I've rebased the series on top of drm-next, applied the minor tweaks
> suggested by Tvrtko on v8 and=20
> the R-b tags. The result can be found on gitlab.fdo:
>=20
> https://gitlab.freedesktop.org/pepp/linux/-/commits/improve_gpu_scheduler=
_trace_v9
>=20
> I believe it's ready to be merged, unless I've missed something?

Has slipped my radar for a while, sorry.

I browsed over the series=20

Can you pro forma send the v9 (with the scheduler maintainers also in
the cover letter's CC) with the changelog, please?

Then I'd ACK and someone (probably me?) can take it in.

Thanks
P.

>=20
> Thanks,
> Pierre-Eric
>=20
> Le 20/03/2025 =C3=A0 10:57, Pierre-Eric Pelloux-Prayer a =C3=A9crit=C2=A0=
:
> > Hi,
> >=20
> > The initial goal of this series was to improve the drm and amdgpu
> > trace events to be able to expose more of the inner workings of
> > the scheduler and drivers to developers via tools.
> >=20
> > Then, the series evolved to become focused only on gpu_scheduler.
> > The changes around vblank events will be part of a different
> > series, as well as the amdgpu ones.
> >=20
> > Moreover Sima suggested to make some trace events stable uAPI,
> > so tools can rely on them long term.
> >=20
> > The first patches extend and cleanup the gpu scheduler events,
> > then add a documentation entry in drm-uapi.rst.
> >=20
> > The last 2 patches are new in v8. One is based on a suggestion
> > from Tvrtko and gets rid of drm_sched_job::id. The other is a
> > cleanup of amdgpu trace events to use the fence=3D%llu:%llu format.
> >=20
> > The drm_sched_job patches don't affect gpuvis which has code to
> > parse
> > the gpu_scheduler events but these events are not enabled.
> >=20
> > Changes since v7:
> > * uint64_t -> u64
> > * reworked dependencies tracing (Tvrtko)
> > * use common name prefix for all events (Tvrtko)
> > * dropped drm_sched_job::id (Tvrtko)
> >=20
> > Useful links:
> > - userspace tool using the updated events:
> > https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> > - v7:
> > https://lists.freedesktop.org/archives/dri-devel/2025-January/488117.ht=
ml
> >=20
> > Pierre-Eric Pelloux-Prayer (10):
> > =C2=A0=C2=A0 drm/debugfs: output client_id in in drm_clients_info
> > =C2=A0=C2=A0 drm/sched: store the drm client_id in drm_sched_fence
> > =C2=A0=C2=A0 drm/sched: add device name to the drm_sched_process_job ev=
ent
> > =C2=A0=C2=A0 drm/sched: cleanup gpu_scheduler trace events
> > =C2=A0=C2=A0 drm/sched: trace dependencies for gpu jobs
> > =C2=A0=C2=A0 drm/sched: add the drm_client_id to the drm_sched_run/exec=
_job
> > events
> > =C2=A0=C2=A0 drm/sched: cleanup event names
> > =C2=A0=C2=A0 drm/doc: document some tracepoints as uAPI
> > =C2=A0=C2=A0 drm: get rid of drm_sched_job::id
> > =C2=A0=C2=A0 drm/amdgpu: update trace format to match gpu_scheduler_tra=
ce
> >=20
> > =C2=A0 Documentation/gpu/drm-uapi.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++++
> > =C2=A0 drivers/accel/amdxdna/aie2_ctx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 32 ++----
> > =C2=A0 drivers/gpu/drm/drm_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 =
+-
> > =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c=C2=A0 |=C2=A0=C2=A0=
 2 +-
> > =C2=A0 drivers/gpu/drm/imagination/pvr_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/lima/lima_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0 drivers/gpu/drm/lima/lima_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/msm/msm_gem_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/panfrost/panfrost_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 .../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 103
> > +++++++++++++-----
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 16 ++-
> > =C2=A0 drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0 drivers/gpu/drm/scheduler/sched_internal.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +-
> > =C2=A0 drivers/gpu/drm/v3d/v3d_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 13 ++-
> > =C2=A0 30 files changed, 186 insertions(+), 96 deletions(-)
> >=20

