Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B238C94F
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 16:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0606EC6F;
	Fri, 21 May 2021 14:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA5B6E9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 14:37:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j14so19567785wrq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=q5k5TUqOwJezqW/RWWJ3mU1YDowaAeJTsfTFmw8fHVo=;
 b=HGuE+jj3lgIHlAJ+5VFZcwsc5o4digjVged5RQ6AomWSzhJpBC12oN1HxVdZBdTDTy
 odXli86PiyfejhpwQ06sMD/ibRWrjXVelQdDWtQslY8EcgUrz3MavBws27caS6oocWMu
 Fy/rhX0PvbBSoP7Vt5iij/ne7RwDBF5B9PsJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q5k5TUqOwJezqW/RWWJ3mU1YDowaAeJTsfTFmw8fHVo=;
 b=tiAV6XNjPghWsgG6gSxiHeOZjiCRW7yDWGkSXuia5cGNXonDeEIGwp4/e3ju2Aal/3
 22DkdqKM/LpPR5EtjSPdQCqk9myAM/LyrKzqmmyxldf3rREgsEu8JuxMjbVk0jvDdUuS
 X7w52Hn6+6tYTiCK7xpOjCsNyOwZ/IiHhtbauD8zn8+gjh5IxZfB+NqpZeqLD2zrmFxK
 N8IDAoQ8UJAZ73H644aDXpNsDIINJRBNGaHLol6cGroTnHVUKcQ112P1GSN7hfcVYuts
 i/mESDrNRUE5GgpJMrTHl7IiWuX2WHWHMy2NjdM1Ar3yA0hEdSuHDG8ambMYLylwttHH
 pfKw==
X-Gm-Message-State: AOAM530ibCLXUeV7IksCM87FPYwpMwft+Bhn10EUXN7sQFuu/6JJ/4KT
 9HxnvFOlyEugGQ7TsdXwHFhDFMgNwAVCJQ==
X-Google-Smtp-Source: ABdhPJxh9/3d5I+JERLMCIwpKsuvy4PYSiktIpgL9+kYNzEUt8VH+VRCm6sJAEGCJZYTafuN7lqH8w==
X-Received: by 2002:a05:6000:1b0b:: with SMTP id
 f11mr10100397wrz.165.1621607853205; 
 Fri, 21 May 2021 07:37:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm2679227wrg.34.2021.05.21.07.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 07:37:32 -0700 (PDT)
Date: Fri, 21 May 2021 16:37:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: [PATCH 01/11] drm/amdgpu: Comply with implicit fencing rules
Message-ID: <YKfFqrlLrikGMn4K@phenom.ffwll.local>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 11:46:23AM +0200, Bas Nieuwenhuizen wrote:
> On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Docs for struct dma_resv are fairly clear:
> >
> > "A reservation object can have attached one exclusive fence (normally
> > associated with write operations) or N shared fences (read
> > operations)."
> >
> > https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#reservation-objects
> >
> > Furthermore a review across all of upstream.
> >
> > First of render drivers and how they set implicit fences:
> >
> > - nouveau follows this contract, see in validate_fini_no_ticket()
> >
> >                         nouveau_bo_fence(nvbo, fence, !!b->write_domains);
> >
> >   and that last boolean controls whether the exclusive or shared fence
> >   slot is used.
> >
> > - radeon follows this contract by setting
> >
> >                 p->relocs[i].tv.num_shared = !r->write_domain;
> >
> >   in radeon_cs_parser_relocs(), which ensures that the call to
> >   ttm_eu_fence_buffer_objects() in radeon_cs_parser_fini() will do the
> >   right thing.
> >
> > - vmwgfx seems to follow this contract with the shotgun approach of
> >   always setting ttm_val_buf->num_shared = 0, which means
> >   ttm_eu_fence_buffer_objects() will only use the exclusive slot.
> >
> > - etnaviv follows this contract, as can be trivially seen by looking
> >   at submit_attach_object_fences()
> >
> > - i915 is a bit a convoluted maze with multiple paths leading to
> >   i915_vma_move_to_active(). Which sets the exclusive flag if
> >   EXEC_OBJECT_WRITE is set. This can either come as a buffer flag for
> >   softpin mode, or through the write_domain when using relocations. It
> >   follows this contract.
> >
> > - lima follows this contract, see lima_gem_submit() which sets the
> >   exclusive fence when the LIMA_SUBMIT_BO_WRITE flag is set for that
> >   bo
> >
> > - msm follows this contract, see msm_gpu_submit() which sets the
> >   exclusive flag when the MSM_SUBMIT_BO_WRITE is set for that buffer
> >
> > - panfrost follows this contract with the shotgun approach of just
> >   always setting the exclusive fence, see
> >   panfrost_attach_object_fences(). Benefits of a single engine I guess
> >
> > - v3d follows this contract with the same shotgun approach in
> >   v3d_attach_fences_and_unlock_reservation(), but it has at least an
> >   XXX comment that maybe this should be improved
> >
> > - v4c uses the same shotgun approach of always setting an exclusive
> >   fence, see vc4_update_bo_seqnos()
> >
> > - vgem also follows this contract, see vgem_fence_attach_ioctl() and
> >   the VGEM_FENCE_WRITE. This is used in some igts to validate prime
> >   sharing with i915.ko without the need of a 2nd gpu
> >
> > - vritio follows this contract again with the shotgun approach of
> >   always setting an exclusive fence, see virtio_gpu_array_add_fence()
> >
> > This covers the setting of the exclusive fences when writing.
> >
> > Synchronizing against the exclusive fence is a lot more tricky, and I
> > only spot checked a few:
> >
> > - i915 does it, with the optional EXEC_OBJECT_ASYNC to skip all
> >   implicit dependencies (which is used by vulkan)
> >
> > - etnaviv does this. Implicit dependencies are collected in
> >   submit_fence_sync(), again with an opt-out flag
> >   ETNA_SUBMIT_NO_IMPLICIT. These are then picked up in
> >   etnaviv_sched_dependency which is the
> >   drm_sched_backend_ops->dependency callback.
> >
> > - v4c seems to not do much here, maybe gets away with it by not having
> >   a scheduler and only a single engine. Since all newer broadcom chips than
> >   the OG vc4 use v3d for rendering, which follows this contract, the
> >   impact of this issue is fairly small.
> >
> > - v3d does this using the drm_gem_fence_array_add_implicit() helper,
> >   which then it's drm_sched_backend_ops->dependency callback
> >   v3d_job_dependency() picks up.
> >
> > - panfrost is nice here and tracks the implicit fences in
> >   panfrost_job->implicit_fences, which again the
> >   drm_sched_backend_ops->dependency callback panfrost_job_dependency()
> >   picks up. It is mildly questionable though since it only picks up
> >   exclusive fences in panfrost_acquire_object_fences(), but not buggy
> >   in practice because it also always sets the exclusive fence. It
> >   should pick up both sets of fences, just in case there's ever going
> >   to be a 2nd gpu in a SoC with a mali gpu. Or maybe a mali SoC with a
> >   pcie port and a real gpu, which might actually happen eventually. A
> >   bug, but easy to fix. Should probably use the
> >   drm_gem_fence_array_add_implicit() helper.
> >
> > - lima is nice an easy, uses drm_gem_fence_array_add_implicit() and
> >   the same schema as v3d.
> >
> > - msm is mildly entertaining. It also supports MSM_SUBMIT_NO_IMPLICIT,
> >   but because it doesn't use the drm/scheduler it handles fences from
> >   the wrong context with a synchronous dma_fence_wait. See
> >   submit_fence_sync() leading to msm_gem_sync_object(). Investing into
> >   a scheduler might be a good idea.
> >
> > - all the remaining drivers are ttm based, where I hope they do
> >   appropriately obey implicit fences already. I didn't do the full
> >   audit there because a) not follow the contract would confuse ttm
> >   quite well and b) reading non-standard scheduler and submit code
> >   which isn't based on drm/scheduler is a pain.
> >
> > Onwards to the display side.
> >
> > - Any driver using the drm_gem_plane_helper_prepare_fb() helper will
> >   correctly. Overwhelmingly most drivers get this right, except a few
> >   totally dont. I'll follow up with a patch to make this the default
> >   and avoid a bunch of bugs.
> >
> > - I didn't audit the ttm drivers, but given that dma_resv started
> >   there I hope they get this right.
> >
> > In conclusion this IS the contract, both as documented and
> > overwhelmingly implemented, specically as implemented by all render
> > drivers except amdgpu.
> >
> > Amdgpu tried to fix this already in
> >
> > commit 049aca4363d8af87cab8d53de5401602db3b9999
> > Author: Christian König <christian.koenig@amd.com>
> > Date:   Wed Sep 19 16:54:35 2018 +0200
> >
> >     drm/amdgpu: fix using shared fence for exported BOs v2
> >
> > but this fix falls short on a number of areas:
> >
> > - It's racy, by the time the buffer is shared it might be too late. To
> >   make sure there's definitely never a problem we need to set the
> >   fences correctly for any buffer that's potentially exportable.
> >
> > - It's breaking uapi, dma-buf fds support poll() and differentitiate
> >   between, which was introduced in
> >
> >         commit 9b495a5887994a6d74d5c261d012083a92b94738
> >         Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> >         Date:   Tue Jul 1 12:57:43 2014 +0200
> >
> >             dma-buf: add poll support, v3
> >
> > - Christian König wants to nack new uapi building further on this
> >   dma_resv contract because it breaks amdgpu, quoting
> >
> >   "Yeah, and that is exactly the reason why I will NAK this uAPI change.
> >
> >   "This doesn't works for amdgpu at all for the reasons outlined above."
> >
> >   https://lore.kernel.org/dri-devel/f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com/
> >
> >   Rejecting new development because your own driver is broken and
> >   violates established cross driver contracts and uapi is really not
> >   how upstream works.
> >
> > Now this patch will have a severe performance impact on anything that
> > runs on multiple engines. So we can't just merge it outright, but need
> > a bit a plan:
> >
> > - amdgpu needs a proper uapi for handling implicit fencing. The funny
> >   thing is that to do it correctly, implicit fencing must be treated
> >   as a very strange IPC mechanism for transporting fences, where both
> >   setting the fence and dependency intercepts must be handled
> >   explicitly. Current best practices is a per-bo flag to indicate
> >   writes, and a per-bo flag to to skip implicit fencing in the CS
> >   ioctl as a new chunk.
> >
> > - Since amdgpu has been shipping with broken behaviour we need an
> >   opt-out flag from the butchered implicit fencing model to enable the
> >   proper explicit implicit fencing model.
> >
> > - for kernel memory fences due to bo moves at least the i915 idea is
> >   to use ttm_bo->moving. amdgpu probably needs the same.
> >
> > - since the current p2p dma-buf interface assumes the kernel memory
> >   fence is in the exclusive dma_resv fence slot we need to add a new
> >   fence slot for kernel fences, which must never be ignored. Since
> >   currently only amdgpu supports this there's no real problem here
> >   yet, until amdgpu gains a NO_IMPLICIT CS flag.
> >
> > - New userspace needs to ship in enough desktop distros so that users
> >   wont notice the perf impact. I think we can ignore LTS distros who
> >   upgrade their kernels but not their mesa3d snapshot.
> >
> > - Then when this is all in place we can merge this patch here.
> >
> > What is not a solution to this problem here is trying to make the
> > dma_resv rules in the kernel more clever. The fundamental issue here
> > is that the amdgpu CS uapi is the least expressive one across all
> > drivers (only equalled by panfrost, which has an actual excuse) by not
> > allowing any userspace control over how implicit sync is conducted.
> >
> > Until this is fixed it's completely pointless to make the kernel more
> > clever to improve amdgpu, because all we're doing is papering over
> > this uapi design issue. amdgpu needs to attain the status quo
> > established by other drivers first, once that's achieved we can tackle
> > the remaining issues in a consistent way across drivers.
> >
> > Cc: mesa-dev@lists.freedesktop.org
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Kristian H. Kristensen <hoegsberg@google.com>
> > Cc: Michel Dänzer <michel@daenzer.net>
> > Cc: Daniel Stone <daniels@collabora.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Deepak R Varma <mh12gx2825@gmail.com>
> > Cc: Chen Li <chenli@uniontech.com>
> > Cc: Kevin Wang <kevin1.wang@amd.com>
> > Cc: Dennis Li <Dennis.Li@amd.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > index 88a24a0b5691..cc8426e1e8a8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -617,8 +617,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
> >         amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> >                 struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
> >
> > -               /* Make sure we use the exclusive slot for shared BOs */
> > -               if (bo->prime_shared_count)
> > +               /* Make sure we use the exclusive slot for all potentially shared BOs */
> > +               if (!(bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID))
> >                         e->tv.num_shared = 0;
> 
> I think it also makes sense to skip this with
> AMDGPU_GEM_CREATE_EXPLICIT_SYNC? It can be shared but I don't think
> anyone expects implicit sync to happen with those.

Ah yes, I missed this entirely. So the "no implicit flag" is already
there, and the _only_ thing that's missing really is a way to fish out the
implicit fences, and set them.

https://lore.kernel.org/dri-devel/20210520190007.534046-1-jason@jlekstrand.net/

So I think all that's really needed in radv is not setting
RADEON_FLAG_IMPLICIT_SYNC for winsys buffers when Jason's dma-buf ioctl
are present (means you need to do some import/export and keep the fd
around for winsys buffers, but shouldn't be too bad), and then control the
implicit fences entirely explicitly like vk expects.

Are you bored enough to type this up for radv? I'll give Jason's kernel
stuff another review meanwhile.
-Daniel

> >                 e->bo_va = amdgpu_vm_bo_find(vm, bo);
> >         }
> > --
> > 2.31.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
