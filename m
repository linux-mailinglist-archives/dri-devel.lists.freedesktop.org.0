Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50209259EB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E1410E1ED;
	Wed,  3 Jul 2024 10:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA7910E1ED
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:52:21 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOxar-0003Df-8E; Wed, 03 Jul 2024 12:52:09 +0200
Message-ID: <e8887d436ba230c9fe521158721f56da4df56a30.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/4] drm/doc: document some tracepoints as uAPI
From: Lucas Stach <l.stach@pengutronix.de>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, Pierre-Eric
 Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,  ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,  rostedt@goodmis.org,
 matt.coster@imgtec.com, frank.binns@imgtec.com,  yuq825@gmail.com,
 robdclark@gmail.com, kherbst@redhat.com, lyude@redhat.com, 
 boris.brezillon@collabora.com, steven.price@arm.com, mwen@igalia.com, 
 mcanal@igalia.com, thomas.hellstrom@linux.intel.com
Date: Wed, 03 Jul 2024 12:52:05 +0200
In-Reply-To: <fd37bd66-4a34-452c-98fe-2ef808590c2e@damsy.net>
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-5-pierre-eric.pelloux-prayer@amd.com>
 <fd37bd66-4a34-452c-98fe-2ef808590c2e@damsy.net>
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

Hi Pierre-Eric,

Am Montag, dem 01.07.2024 um 14:44 +0200 schrieb Pierre-Eric Pelloux-
Prayer:
> [adding more people to this thread based on the drivers using gpu_schedul=
er]
>=20
> Hi,
>=20
> Christian's comment on patch 1/5 will be addressed in v6, but before=20
> pushing another version I'd like to know if there's a consensus among=20
> the drivers maintainers regarding the changes proposed in this series.
>=20
I absolutely agree with the changes done in this series. The pointer
values in the existing tracepoints are close to useless. Being able to
tie events together through a stable representation of the fences is a
very welcome improvement.

Acked-by: Lucas Stach <l.stach@pengutronix.de>

Regards,
Lucas

> Thanks!
> Pierre-Eric
>=20
>=20
> Le 14/06/2024 =C3=A0 10:16, Pierre-Eric Pelloux-Prayer a =C3=A9crit=C2=A0=
:
> > This commit adds a document section in drm-uapi.rst about tracepoints,
> > and mark the events gpu_scheduler_trace.h as stable uAPI.
> >=20
> > The goal is to explicitly state that tools can rely on the fields,
> > formats and semantics of these events.
> >=20
> > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@a=
md.com>
> > ---
> >   Documentation/gpu/drm-uapi.rst                | 19 ++++++++++++++++
> >   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 22 ++++++++++++++++++=
+
> >   2 files changed, 41 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 370d820be248..78496793a8f0 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -570,3 +570,22 @@ dma-buf interoperability
> >  =20
> >   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
> >   information on how dma-buf is integrated and exposed within DRM.
> > +
> > +
> > +Trace events
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +See Documentation/trace/tracepoints.rst for the tracepoints documentat=
ion.
> > +In the drm subsystem, some events are considered stable uAPI to avoid
> > +breaking tools (eg: gpuvis, umr) relying on them. Stable means that fi=
elds
> > +cannot be removed, nor their formatting updated. Adding new fields is
> > +possible, under the normal uAPI requirements.
> > +
> > +Stable uAPI events
> > +------------------
> > +
> > +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > +   :doc: uAPI trace events
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/=
gpu/drm/scheduler/gpu_scheduler_trace.h
> > index 0abcad26839c..63113803cdd5 100644
> > --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > @@ -33,6 +33,28 @@
> >   #define TRACE_SYSTEM gpu_scheduler
> >   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
> >  =20
> > +
> > +/**
> > + * DOC: uAPI trace events
> > + *
> > + * ``drm_sched_job``, ``drm_run_job``, ``drm_sched_process_job``,
> > + * and ``drm_sched_job_wait_dep`` are considered stable uAPI.
> > + *
> > + * Common trace events attributes:
> > + *
> > + * * ``id``    - this is &drm_sched_job->id. It uniquely idenfies a jo=
b
> > + *   inside a &struct drm_gpu_scheduler.
> > + *
> > + * * ``dev``   - the dev_name() of the device running the job.
> > + *
> > + * * ``ring``  - the hardware ring running the job. Together with ``de=
v`` it
> > + *   uniquely identifies where the job is going to be executed.
> > + *
> > + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
> > + *   &drm_sched_fence.finished
> > + *
> > + */
> > +
> >   #ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> >   #define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> >   /* Similar to trace_print_array_seq but for fences. */

