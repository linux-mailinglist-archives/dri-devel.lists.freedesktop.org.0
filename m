Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B3A9EA69
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 10:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4E310E3CA;
	Mon, 28 Apr 2025 08:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RIIz6Av2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A233810E3C7;
 Mon, 28 Apr 2025 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745827987;
 bh=beJkwrV6TisbUGrQN7EcPUBdDayWVsKLkYJimHxMWtA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RIIz6Av2knAEeatmbGr9tFj0H6j0YvT85Wh/T+td1pXTAW9/Gvqj49FzCaRXhizYb
 uoExxNZTyNnRwrCJf4yAPl4O2W/qXWQ88gE+/Kq6H0o+VE2EL10sMbCXUvWSrQgSnD
 nt6ZHAy/VKefJ+WZuZ7j3i+k1MIY3C4ezVhVwbNvXKTF/nxBVcNx3bpVgrFSVkWHAB
 wW5X9tvN0iUUq0vBU8GR5S3trl1MX+qx/L5lU3b5xstx2LAeZMeCJfn3w8ptodhLgI
 99Ubtii04bugEiMdkxVUYrdnG0ADioz111aSBsjTrwxr/n6UazKYRnWGgT0S97l6v7
 m4y8fgtQ3jD1g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6EC1717E0F93;
 Mon, 28 Apr 2025 10:13:06 +0200 (CEST)
Date: Mon, 28 Apr 2025 10:13:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, lima@lists.freedesktop.org, Qiang Yu
 <yuq825@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Christian Koenig
 <christian.koenig@amd.com>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH] drm/doc: Start documenting aspects specific to
 tile-based renderers
Message-ID: <20250428101302.2df2f9cb@collabora.com>
In-Reply-To: <123343432f17913452ba9cbef6161837cc3c07d8.camel@igalia.com>
References: <20250418122524.410448-1-boris.brezillon@collabora.com>
 <123343432f17913452ba9cbef6161837cc3c07d8.camel@igalia.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Hi Iago,

On Mon, 28 Apr 2025 08:55:07 +0200
Iago Toral <itoral@igalia.com> wrote:

> Hi,
>=20
> Pitching in to describe the situation for v3d:

Thanks for chiming in.

>=20
> El vie, 18-04-2025 a las 14:25 +0200, Boris Brezillon escribi=C3=B3:
>=20
> (...)
> > +For all these reasons, the tiler usually allocates memory
> > dynamically, but
> > +DRM has not been designed with this use case in mind. Drivers will
> > address
> > +these problems differently based on the functionality provided by
> > their
> > +hardware, but all of them almost certainly have to deal with this
> > somehow.
> > +
> > +The easy solution is to statically allocate a huge buffer to pick
> > from when
> > +tiler memory is needed, and fail the rendering when this buffer is
> > depleted.
> > +Some drivers try to be smarter to avoid reserving a lot of memory
> > upfront.
> > +Instead, they start with an almost empty buffer and progressively
> > populate it
> > +when the GPU faults on an address sitting in the tiler buffer range.
> > This
> > +works okay most of the time but it falls short when the system is
> > under
> > +memory pressure, because the memory request is not guaranteed to be
> > satisfied.
> > +In that case, the driver either fails the rendering, or, if the
> > hardware
> > +allows it, it tries to flush the primitives that have been processed
> > and
> > +triggers a fragment job that will consume those primitives and free
> > up some
> > +memory to be recycled and make further progress on the tiling step.
> > This is
> > +usually referred as partial/incremental rendering (it might have
> > other names). =20
>=20
> In our case, user space allocates some memory up front hoping to avoid
> running out of memory during tiling, but if the tiler does run out of
> memory we get an interrupt and the tiler hw will stop and wait for the
> kernel driver to write back an address where more memory is made
> available (via register write), which we will try to allocate at that
> point. This can happen any number of times until the tiler job
> completes

Sounds very much like how new Mali-CSF works, except Mali-CSF also has
a fallback for when the allocation can't be satisfied.

>=20
> I am not sure that we are handling allocation failure on this path=20
> nicely at the moment since we don't try to fail and cancel the job,
> that's maybe something we should fix, although I don't personally
> recall any reports of us running into this situation either.

Yeah, I'd say you're pretty much in the same place Panfrost/Panthor are
at the moment: we're not playing by the dma_fence rules, but no user
complained so far. BTW, that doesn't necessarily mean the problem
doesn't occur, just that it's not been identified as being a KMD issue
:-).

>=20
>=20
> > +
> > +Compute based emulation of geometry stages
> > +------------------------------------------
> > +
> > +More and more hardware vendors don't bother providing hardware
> > support for
> > +geometry/tesselation/mesh stages, since those can be emulated with
> > compute
> > +shaders. But the same problem we have with tiler memory exists with
> > those
> > +intermediate compute-emulated stages, because transient data shared
> > between
> > +stages need to be stored in memory for the next stage to consume,
> > and this
> > +bubbles up until the tiling stage is reached, because ultimately,
> > what the
> > +tiling stage will need to process is a set of vertices it can turn
> > into
> > +primitives, like would happen if the application had emulated the
> > geometry,
> > +tesselation or mesh stages with compute.
> > +
> > +Unlike tiling, where the hardware can provide a fallback to recycle
> > memory,
> > +there is no way the intermediate primitives can be flushed up to the
> > framebuffer,
> > +because it's a purely software emulation here. This being said, the
> > same
> > +"start small, grow on-demand" can be applied to avoid over-
> > allocating memory
> > +upfront. =20
>=20
> FWIW, v3d has geometry and tessellation hardware.

Yep, Alyssa mentioned that. I'll change this section to specifically
mention Arm/Mali as being the outlier here.

>=20
>=20
> > +
> > +On-demand memory allocation
> > +---------------------------
> > +
> > +As explained in previous sections, on-demand allocation is a central
> > piece
> > +of tile-based renderer if we don't want to over-allocate, which is
> > bad for
> > +integrated GPUs who share their memory with the rest of the system.
> > +
> > +The problem with on-demand allocation is that suddenly, GPU accesses
> > can
> > +fail on OOM, and the DRM components (drm_gpu_scheduler and drm_gem
> > mostly)
> > +were not designed for that. Those are assuming that buffers memory
> > is
> > +populated at job submission time, and will stay around for the job
> > lifetime.
> > +If a GPU fault happens, it's the user fault, and the context can be
> > flagged
> > +unusable. On-demand allocation is usually implemented as allocation-
> > on-fault,
> > +and the dma_fence contract prevents us from blocking on allocations
> > in that
> > +path (GPU fault handlers are in the dma-fence signalling path). =20
>=20
> As I described above, v3d is not quite an allocation-on-fault mechanism
> but rather, we get a dedicated interrupt from the hw when it needs more
> memory, which I believe happens a bit before it completely runs out of
> memory actually. Maybe that changes the picture since we don't exactly
> use a fault handler?

Not really. Any mechanism relying on on-demand allocation in the
dma_fence signalling path is problematic. The fact it's based on a
fault handler might add extra problems on top, but both designs violate
the dma_fence contract stating that no non-fallible allocation should
be done in the dma_fence signalling path (that is, any allocation
happening between the moment the job was queued to the
drm_sched_entity, and the moment the job fence is signalled).

Given, the description you made, I think we can add v3d to the list of
problematic drivers :-(.

Regards,

Boris
