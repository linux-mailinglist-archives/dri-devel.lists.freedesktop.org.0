Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B783B2818
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393016E9FF;
	Thu, 24 Jun 2021 06:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBCE6E9F6;
 Thu, 24 Jun 2021 06:59:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id o22so2237247wms.0;
 Wed, 23 Jun 2021 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jLvdQLXGehJ4TiTYr/8LrPMxC+hyig3myx55lYgCxxM=;
 b=iH5WKGWJFIQwB3YYWgM3tGR/Vcem+Pi2vQObsoWERIyQXr9vBqKI9Lu/ESCtDNYoOH
 y7qmHdNx8INBxEfcYZWe/HnS98rjY6+VJrc/XHB18eCv5aAdiQYIUe9Jd62nEcltO+eX
 fGIvpjX/h6xyTwINy1aKVATNhg/OLNj3GKIpWzOeS27n0tKbg3qy2LtNcRLhMUQBxWtE
 QZP8Elw0sGHXH6pO7yEHDiR37yyzWUfmqCr4d1/rhbintK9lg/VbekBlM7SzCz8S2qcX
 epqc1zxz+qhVvT34Zi2wfUqWH/fvZophuRLRreZhQsGQOrD/iAp/vA/FO56fISqkIaZo
 +YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jLvdQLXGehJ4TiTYr/8LrPMxC+hyig3myx55lYgCxxM=;
 b=CoWq9nqBcqkW82nRmzudzYy60XKSSGK9LgHk3qoNQCfxunfSOZDIu1TJFKJs7PvtsE
 p7yWwYlQHBwkEzZariEaqs1EKUmQItvTzWff9EJRxhR40HKsaeMCrAdhscavj9FbSKrN
 eq9c12OkaqpTp0NidyMCc2T5nSOgj0kO7asxvWdRmWCPV0s/VvUdPEuTJmj1ly92tam4
 zCSqTPJ0ZdJ347+ZWniytXfBlDg8NZOtXQKafOMhk2g2oJbUmc8Q4HDoPcIqe+B6R2GD
 61R8A4Ck04kXu5xTrXQmcuQiNSEzRyEqBEgc5Zbu4jBakLtx+rXjXGvgQI5uz2X4yPHS
 s8Ag==
X-Gm-Message-State: AOAM532a1YKr/8GJzA4S7zRzrKVBLXaFH1PMHEp0dQ4TQBiwkqVvTDB9
 +M3gvqbJKTorb2CaSucbMAvgN2Yxna9NPxSkVrk=
X-Google-Smtp-Source: ABdhPJwNJTqEHOWMlgQ2jBbDr5Cn3wA4es4g8BDfdFGNrm3W7evXc7ZULgozTTGFw65yBny6XRV9gvVtcT5p4vZgBcs=
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr2457904wmc.23.1624517955270; 
 Wed, 23 Jun 2021 23:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-4-daniel.vetter@ffwll.ch>
 <20210623161955.3371466-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210623161955.3371466-1-daniel.vetter@ffwll.ch>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Jun 2021 16:59:03 +1000
Message-ID: <CAPM=9txhzghO6LUp7E6+hnjd7p8v_3bogQnkp4LyaAA9nx21nA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Document dma-buf implicit fencing/resv fencing
 rules
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jun 2021 at 02:20, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Docs for struct dma_resv are fairly clear:
>
> "A reservation object can have attached one exclusive fence (normally
> associated with write operations) or N shared fences (read
> operations)."
>
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#reservation-=
objects
>
> Furthermore a review across all of upstream.
>
> First of render drivers and how they set implicit fences:
>
> - nouveau follows this contract, see in validate_fini_no_ticket()
>
>                         nouveau_bo_fence(nvbo, fence, !!b->write_domains)=
;
>
>   and that last boolean controls whether the exclusive or shared fence
>   slot is used.
>
> - radeon follows this contract by setting
>
>                 p->relocs[i].tv.num_shared =3D !r->write_domain;
>
>   in radeon_cs_parser_relocs(), which ensures that the call to
>   ttm_eu_fence_buffer_objects() in radeon_cs_parser_fini() will do the
>   right thing.
>
> - vmwgfx seems to follow this contract with the shotgun approach of
>   always setting ttm_val_buf->num_shared =3D 0, which means
>   ttm_eu_fence_buffer_objects() will only use the exclusive slot.
>
> - etnaviv follows this contract, as can be trivially seen by looking
>   at submit_attach_object_fences()
>
> - i915 is a bit a convoluted maze with multiple paths leading to
>   i915_vma_move_to_active(). Which sets the exclusive flag if
>   EXEC_OBJECT_WRITE is set. This can either come as a buffer flag for
>   softpin mode, or through the write_domain when using relocations. It
>   follows this contract.
>
> - lima follows this contract, see lima_gem_submit() which sets the
>   exclusive fence when the LIMA_SUBMIT_BO_WRITE flag is set for that
>   bo
>
> - msm follows this contract, see msm_gpu_submit() which sets the
>   exclusive flag when the MSM_SUBMIT_BO_WRITE is set for that buffer
>
> - panfrost follows this contract with the shotgun approach of just
>   always setting the exclusive fence, see
>   panfrost_attach_object_fences(). Benefits of a single engine I guess
>
> - v3d follows this contract with the same shotgun approach in
>   v3d_attach_fences_and_unlock_reservation(), but it has at least an
>   XXX comment that maybe this should be improved
>
> - v4c uses the same shotgun approach of always setting an exclusive
>   fence, see vc4_update_bo_seqnos()
>
> - vgem also follows this contract, see vgem_fence_attach_ioctl() and
>   the VGEM_FENCE_WRITE. This is used in some igts to validate prime
>   sharing with i915.ko without the need of a 2nd gpu
>
> - vritio follows this contract again with the shotgun approach of
>   always setting an exclusive fence, see virtio_gpu_array_add_fence()
>
> This covers the setting of the exclusive fences when writing.
>
> Synchronizing against the exclusive fence is a lot more tricky, and I
> only spot checked a few:
>
> - i915 does it, with the optional EXEC_OBJECT_ASYNC to skip all
>   implicit dependencies (which is used by vulkan)
>
> - etnaviv does this. Implicit dependencies are collected in
>   submit_fence_sync(), again with an opt-out flag
>   ETNA_SUBMIT_NO_IMPLICIT. These are then picked up in
>   etnaviv_sched_dependency which is the
>   drm_sched_backend_ops->dependency callback.
>
> - v4c seems to not do much here, maybe gets away with it by not having
>   a scheduler and only a single engine. Since all newer broadcom chips th=
an
>   the OG vc4 use v3d for rendering, which follows this contract, the
>   impact of this issue is fairly small.
>
> - v3d does this using the drm_gem_fence_array_add_implicit() helper,
>   which then it's drm_sched_backend_ops->dependency callback
>   v3d_job_dependency() picks up.
>
> - panfrost is nice here and tracks the implicit fences in
>   panfrost_job->implicit_fences, which again the
>   drm_sched_backend_ops->dependency callback panfrost_job_dependency()
>   picks up. It is mildly questionable though since it only picks up
>   exclusive fences in panfrost_acquire_object_fences(), but not buggy
>   in practice because it also always sets the exclusive fence. It
>   should pick up both sets of fences, just in case there's ever going
>   to be a 2nd gpu in a SoC with a mali gpu. Or maybe a mali SoC with a
>   pcie port and a real gpu, which might actually happen eventually. A
>   bug, but easy to fix. Should probably use the
>   drm_gem_fence_array_add_implicit() helper.
>
> - lima is nice an easy, uses drm_gem_fence_array_add_implicit() and
>   the same schema as v3d.
>
> - msm is mildly entertaining. It also supports MSM_SUBMIT_NO_IMPLICIT,
>   but because it doesn't use the drm/scheduler it handles fences from
>   the wrong context with a synchronous dma_fence_wait. See
>   submit_fence_sync() leading to msm_gem_sync_object(). Investing into
>   a scheduler might be a good idea.
>
> - all the remaining drivers are ttm based, where I hope they do
>   appropriately obey implicit fences already. I didn't do the full
>   audit there because a) not follow the contract would confuse ttm
>   quite well and b) reading non-standard scheduler and submit code
>   which isn't based on drm/scheduler is a pain.
>
> Onwards to the display side.
>
> - Any driver using the drm_gem_plane_helper_prepare_fb() helper will
>   correctly. Overwhelmingly most drivers get this right, except a few
>   totally dont. I'll follow up with a patch to make this the default
>   and avoid a bunch of bugs.
>
> - I didn't audit the ttm drivers, but given that dma_resv started
>   there I hope they get this right.
>
> In conclusion this IS the contract, both as documented and
> overwhelmingly implemented, specically as implemented by all render
> drivers except amdgpu.
>
> Amdgpu tried to fix this already in
>
> commit 049aca4363d8af87cab8d53de5401602db3b9999
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:   Wed Sep 19 16:54:35 2018 +0200
>
>     drm/amdgpu: fix using shared fence for exported BOs v2
>
> but this fix falls short on a number of areas:
>
> - It's racy, by the time the buffer is shared it might be too late. To
>   make sure there's definitely never a problem we need to set the
>   fences correctly for any buffer that's potentially exportable.
>
> - It's breaking uapi, dma-buf fds support poll() and differentitiate
>   between, which was introduced in
>
>         commit 9b495a5887994a6d74d5c261d012083a92b94738
>         Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>         Date:   Tue Jul 1 12:57:43 2014 +0200
>
>             dma-buf: add poll support, v3
>
> - Christian K=C3=B6nig wants to nack new uapi building further on this
>   dma_resv contract because it breaks amdgpu, quoting
>
>   "Yeah, and that is exactly the reason why I will NAK this uAPI change.
>
>   "This doesn't works for amdgpu at all for the reasons outlined above."
>
>   https://lore.kernel.org/dri-devel/f2eb6751-2f82-9b23-f57e-548de5b729de@=
gmail.com/
>
>   Rejecting new development because your own driver is broken and
>   violates established cross driver contracts and uapi is really not
>   how upstream works.
>
> Now this patch will have a severe performance impact on anything that
> runs on multiple engines. So we can't just merge it outright, but need
> a bit a plan:
>
> - amdgpu needs a proper uapi for handling implicit fencing. The funny
>   thing is that to do it correctly, implicit fencing must be treated
>   as a very strange IPC mechanism for transporting fences, where both
>   setting the fence and dependency intercepts must be handled
>   explicitly. Current best practices is a per-bo flag to indicate
>   writes, and a per-bo flag to to skip implicit fencing in the CS
>   ioctl as a new chunk.
>
> - Since amdgpu has been shipping with broken behaviour we need an
>   opt-out flag from the butchered implicit fencing model to enable the
>   proper explicit implicit fencing model.
>
> - for kernel memory fences due to bo moves at least the i915 idea is
>   to use ttm_bo->moving. amdgpu probably needs the same.
>
> - since the current p2p dma-buf interface assumes the kernel memory
>   fence is in the exclusive dma_resv fence slot we need to add a new
>   fence slot for kernel fences, which must never be ignored. Since
>   currently only amdgpu supports this there's no real problem here
>   yet, until amdgpu gains a NO_IMPLICIT CS flag.
>
> - New userspace needs to ship in enough desktop distros so that users
>   wont notice the perf impact. I think we can ignore LTS distros who
>   upgrade their kernels but not their mesa3d snapshot.
>
> - Then when this is all in place we can merge this patch here.
>
> What is not a solution to this problem here is trying to make the
> dma_resv rules in the kernel more clever. The fundamental issue here
> is that the amdgpu CS uapi is the least expressive one across all
> drivers (only equalled by panfrost, which has an actual excuse) by not
> allowing any userspace control over how implicit sync is conducted.
>
> Until this is fixed it's completely pointless to make the kernel more
> clever to improve amdgpu, because all we're doing is papering over
> this uapi design issue. amdgpu needs to attain the status quo
> established by other drivers first, once that's achieved we can tackle
> the remaining issues in a consistent way across drivers.
>
> v2: Bas pointed me at AMDGPU_GEM_CREATE_EXPLICIT_SYNC, which I
> entirely missed.
>
> This is great because it means the amdgpu specific piece for proper
> implicit fence handling exists already, and that since a while. The
> only thing that's now missing is
> - fishing the implicit fences out of a shared object at the right time
> - setting the exclusive implicit fence slot at the right time.
>
> Jason has a patch series to fill that gap with a bunch of generic
> ioctl on the dma-buf fd:
>
> https://lore.kernel.org/dri-devel/20210520190007.534046-1-jason@jlekstran=
d.net/
>
> v3: Since Christian has fixed amdgpu now in
>
> commit 8c505bdc9c8b955223b054e34a0be9c3d841cd20 (drm-misc/drm-misc-next)
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:   Wed Jun 9 13:51:36 2021 +0200
>
>     drm/amdgpu: rework dma_resv handling v3
>
> Use the audit covered in this commit message as the excuse to update
> the dma-buf docs around dma_buf.resv usage across drivers.
>
> Since dynamic importers have different rules also hammer these in
> again while we're at it.
>
> v4:
> - Add the missing "through the device" in the dynamic section that I
>   overlooked.
> - Fix a kerneldoc markup mistake, the link didn't connect
>

This is pretty epic commit msg, thanks for the investment, the commit
msg should be required reading.

Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
