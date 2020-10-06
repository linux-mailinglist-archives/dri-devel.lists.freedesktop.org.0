Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678DD28494A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 11:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410986E161;
	Tue,  6 Oct 2020 09:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F946E161
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 09:24:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h7so8992645wre.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=o1oQeOes9auyibSGLXo8ZIE36Pi1CzyzP6scWb4qzTc=;
 b=eKVC0u8hJXjZMTXhie+O/TYutmQJVGOz1kEzN1UhIZCxxcfwdgB05Bgkek0qRGxBto
 ikU7lB6ASL1J0jQgDNZ6yk+BYUH1TJg8z4S2TiyfnHo8ki1PN6yYuvf/npcvShVHqYiQ
 mL7N5nG2Fh11hxSWSPktqyee7Gw4+YMWfPkXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=o1oQeOes9auyibSGLXo8ZIE36Pi1CzyzP6scWb4qzTc=;
 b=U7q0Va9pSaJWVIEjE4zFUO4ksB8OUFJjCqcNpEFUUfZpDpb2ZZSD+8cV/XXqgT6Y2k
 JK12yXGp9KEaUgr3YR+ujF32q5Bt3MiIA7JWvxaiJMKb7aSZ8DomFuwUu0ILH+vPAQRC
 kb77tL+fUnqYTU7vQj3rrLN2dQlzj/6uY2SIYLB9c+ff588s1+iC0+0bLdrHJhkReIK2
 B9sEga2fMZ7Ms3duEvfGbF5o8K0jHUkn6hTWu+l/SnH8H3enaXbBE6sd8xqcwyIPUAfx
 O2ZM0PcKZA7OVCcuOHGaktALVHSQ6cZb4g1vUCy8S0hEB/DsnHQjh68Cfwl5EAV1wV44
 3wlA==
X-Gm-Message-State: AOAM5338rf7qwD5HcWfe+6a5UVFxuAI1+43cv899NuivbZ9wdBbY4v1F
 z3HjnH1y4uJ2dm6Oq9w7AAoP6A==
X-Google-Smtp-Source: ABdhPJxYVlzlW4ynvIqM0BxSmg2wgYJ8ydde2iISfhpnOmAuL59p8UTE9Lke2Xhaa2rbSuU/SBT9mg==
X-Received: by 2002:adf:912e:: with SMTP id j43mr3769544wrj.325.1601976289027; 
 Tue, 06 Oct 2020 02:24:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q20sm2935963wmc.39.2020.10.06.02.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 02:24:48 -0700 (PDT)
Date: Tue, 6 Oct 2020 11:24:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm: device naming cleanup
Message-ID: <20201006092446.GY438822@phenom.ffwll.local>
References: <20201002084707.2203-1-christian.koenig@amd.com>
 <CAPM=9tx-2p53V7oU3eeWL0NV2XfiwRYF+R5o4=yC1unNOQsrnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tx-2p53V7oU3eeWL0NV2XfiwRYF+R5o4=yC1unNOQsrnQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 10:15:44AM +1000, Dave Airlie wrote:
> On Fri, 2 Oct 2020 at 18:47, Christian K=F6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Rename ttm_bo_device to ttm_device.
> > Rename ttm_bo_driver to ttm_device_funcs.
> > Rename ttm_bo_global to ttm_global.
> >
> > Move global and device related functions to ttm_device.[ch].
> =

> I've a problem with doing this now, since we are churning a lot of
> stuff into drm-misc-next this will make reverts a lot messier than
> required in order to faciliate regression testing.
> =

> I've already burned 2-3 days on vmwgfx regressions and I'm not really
> wanting to add major renames or restructures until we have settled
> things down a bit more.
> =

> I'm not sure when would be a good time, and maybe the global one would
> be a lot less of impact vs the ttm_bo_device->ttm_Device one.

Well 10 years of ttm refactoring in 2 months is maybe a bit rough :-)

What about waiting until -rc2, backmerging that, and then landing the next
round of churn? Should at least give us another month or so for fixing
issues and people testing stuff.

Aside from that I don't think the pain can be avoided since we don't have
a massive hw ci like mesa.
-Daniel

> =

> Dave.
> >
> > No functional change.
> >
> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +-
> >  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   6 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c      |   2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  24 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   8 +-
> >  drivers/gpu/drm/drm_gem_vram_helper.c         |  14 +-
> >  drivers/gpu/drm/nouveau/nouveau_bo.c          |  18 +-
> >  drivers/gpu/drm/nouveau/nouveau_bo.h          |   2 +-
> >  drivers/gpu/drm/nouveau/nouveau_drv.h         |   2 +-
> >  drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   6 +-
> >  drivers/gpu/drm/nouveau/nouveau_ttm.c         |   4 +-
> >  drivers/gpu/drm/nouveau/nouveau_ttm.h         |   8 +-
> >  drivers/gpu/drm/qxl/qxl_drv.h                 |   4 +-
> >  drivers/gpu/drm/qxl/qxl_release.c             |   6 +-
> >  drivers/gpu/drm/qxl/qxl_ttm.c                 |  16 +-
> >  drivers/gpu/drm/radeon/radeon.h               |   6 +-
> >  drivers/gpu/drm/radeon/radeon_ttm.c           |  34 +-
> >  drivers/gpu/drm/ttm/Makefile                  |   2 +-
> >  drivers/gpu/drm/ttm/ttm_agp_backend.c         |   2 +-
> >  drivers/gpu/drm/ttm/ttm_bo.c                  | 308 +++------------
> >  drivers/gpu/drm/ttm/ttm_bo_util.c             |  24 +-
> >  drivers/gpu/drm/ttm/ttm_bo_vm.c               |  24 +-
> >  drivers/gpu/drm/ttm/ttm_device.c              | 222 +++++++++++
> >  drivers/gpu/drm/ttm/ttm_execbuf_util.c        |   8 +-
> >  drivers/gpu/drm/ttm/ttm_memory.c              |   2 +-
> >  drivers/gpu/drm/ttm/ttm_range_manager.c       |   4 +-
> >  drivers/gpu/drm/ttm/ttm_resource.c            |   4 +-
> >  drivers/gpu/drm/ttm/ttm_tt.c                  |  26 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c          |   4 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |   4 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   6 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |   4 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   2 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |  14 +-
> >  include/drm/drm_gem_vram_helper.h             |   6 +-
> >  include/drm/ttm/ttm_bo_api.h                  |  44 +--
> >  include/drm/ttm/ttm_bo_driver.h               | 357 +----------------
> >  include/drm/ttm/ttm_device.h                  | 366 ++++++++++++++++++
> >  include/drm/ttm/ttm_resource.h                |   4 +-
> >  include/drm/ttm/ttm_tt.h                      |  12 +-
> >  41 files changed, 833 insertions(+), 780 deletions(-)
> >  create mode 100644 drivers/gpu/drm/ttm/ttm_device.c
> >  create mode 100644 include/drm/ttm/ttm_device.h
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu.h
> > index 4009d2e30727..a03f9bd3ea4b 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -999,7 +999,7 @@ static inline struct drm_device *adev_to_drm(struct=
 amdgpu_device *adev)
> >         return &adev->ddev;
> >  }
> >
> > -static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_devi=
ce *bdev)
> > +static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_device =
*bdev)
> >  {
> >         return container_of(bdev, struct amdgpu_device, mman.bdev);
> >  }
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> > index 3107b9575929..5af464933976 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> > @@ -40,13 +40,13 @@ static atomic_t fence_seq =3D ATOMIC_INIT(0);
> >   * All the BOs in a process share an eviction fence. When process X wa=
nts
> >   * to map VRAM memory but TTM can't find enough space, TTM will attemp=
t to
> >   * evict BOs from its LRU list. TTM checks if the BO is valuable to ev=
ict
> > - * by calling ttm_bo_driver->eviction_valuable().
> > + * by calling ttm_device_funcs->eviction_valuable().
> >   *
> > - * ttm_bo_driver->eviction_valuable() - will return false if the BO be=
longs
> > + * ttm_device_funcs->eviction_valuable() - will return false if the BO=
 belongs
> >   *  to process X. Otherwise, it will return true to indicate BO can be
> >   *  evicted by TTM.
> >   *
> > - * If ttm_bo_driver->eviction_valuable returns true, then TTM will con=
tinue
> > + * If ttm_device_funcs->eviction_valuable returns true, then TTM will =
continue
> >   * the evcition process for that BO by calling ttm_bo_evict --> amdgpu=
_bo_move
> >   * --> amdgpu_copy_buffer(). This sets up job in GPU scheduler.
> >   *
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_gart.c
> > index e01e681d2a60..7f25f2c0de38 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> > @@ -71,7 +71,7 @@
> >   */
> >  static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
> >  {
> > -       struct page *dummy_page =3D ttm_bo_glob.dummy_read_page;
> > +       struct page *dummy_page =3D ttm_glob.dummy_read_page;
> >
> >         if (adev->dummy_page_addr)
> >                 return 0;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 8cdec58b9106..088dcfce6bca 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -63,7 +63,7 @@
> >
> >  #define AMDGPU_TTM_VRAM_MAX_DW_READ    (size_t)128
> >
> > -static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
> > +static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
> >                                    struct ttm_tt *ttm,
> >                                    struct ttm_resource *bo_mem);
> >
> > @@ -735,7 +735,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object =
*bo, bool evict,
> >   *
> >   * Called by ttm_mem_io_reserve() ultimately via ttm_bo_vm_fault()
> >   */
> > -static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struc=
t ttm_resource *mem)
> > +static int amdgpu_ttm_io_mem_reserve(struct ttm_device *bdev, struct t=
tm_resource *mem)
> >  {
> >         struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
> >         struct drm_mm_node *mm_node =3D mem->mm_node;
> > @@ -982,7 +982,7 @@ void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *tt=
m, struct page **pages)
> >   *
> >   * Called by amdgpu_ttm_backend_bind()
> >   **/
> > -static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
> > +static int amdgpu_ttm_tt_pin_userptr(struct ttm_device *bdev,
> >                                      struct ttm_tt *ttm)
> >  {
> >         struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
> > @@ -1019,7 +1019,7 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_b=
o_device *bdev,
> >  /**
> >   * amdgpu_ttm_tt_unpin_userptr - Unpin and unmap userptr pages
> >   */
> > -static void amdgpu_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev,
> > +static void amdgpu_ttm_tt_unpin_userptr(struct ttm_device *bdev,
> >                                         struct ttm_tt *ttm)
> >  {
> >         struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
> > @@ -1103,7 +1103,7 @@ static int amdgpu_ttm_gart_bind(struct amdgpu_dev=
ice *adev,
> >   * Called by ttm_tt_bind() on behalf of ttm_bo_handle_move_mem().
> >   * This handles binding GTT memory to the device address space.
> >   */
> > -static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
> > +static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
> >                                    struct ttm_tt *ttm,
> >                                    struct ttm_resource *bo_mem)
> >  {
> > @@ -1238,7 +1238,7 @@ int amdgpu_ttm_recover_gart(struct ttm_buffer_obj=
ect *tbo)
> >   * Called by ttm_tt_unbind() on behalf of ttm_bo_move_ttm() and
> >   * ttm_tt_destroy().
> >   */
> > -static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
> > +static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
> >                                       struct ttm_tt *ttm)
> >  {
> >         struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
> > @@ -1263,7 +1263,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_=
bo_device *bdev,
> >         gtt->bound =3D false;
> >  }
> >
> > -static void amdgpu_ttm_backend_destroy(struct ttm_bo_device *bdev,
> > +static void amdgpu_ttm_backend_destroy(struct ttm_device *bdev,
> >                                        struct ttm_tt *ttm)
> >  {
> >         struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
> > @@ -1316,7 +1316,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct=
 ttm_buffer_object *bo,
> >   * Map the pages of a ttm_tt object to an address space visible
> >   * to the underlying device.
> >   */
> > -static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
> > +static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
> >                                   struct ttm_tt *ttm,
> >                                   struct ttm_operation_ctx *ctx)
> >  {
> > @@ -1371,7 +1371,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_d=
evice *bdev,
> >   * Unmaps pages of a ttm_tt object from the device address space and
> >   * unpopulates the page array backing it.
> >   */
> > -static void amdgpu_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struc=
t ttm_tt *ttm)
> > +static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev, struct t=
tm_tt *ttm)
> >  {
> >         struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
> >         struct amdgpu_device *adev;
> > @@ -1697,7 +1697,7 @@ static int amdgpu_ttm_access_memory(struct ttm_bu=
ffer_object *bo,
> >         return ret;
> >  }
> >
> > -static struct ttm_bo_driver amdgpu_bo_driver =3D {
> > +static struct ttm_device_funcs amdgpu_bo_driver =3D {
> >         .ttm_tt_create =3D &amdgpu_ttm_tt_create,
> >         .ttm_tt_populate =3D &amdgpu_ttm_tt_populate,
> >         .ttm_tt_unpopulate =3D &amdgpu_ttm_tt_unpopulate,
> > @@ -1881,7 +1881,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
> >         mutex_init(&adev->mman.gtt_window_lock);
> >
> >         /* No others user of address space so set it to 0 */
> > -       r =3D ttm_bo_device_init(&adev->mman.bdev,
> > +       r =3D ttm_device_init(&adev->mman.bdev,
> >                                &amdgpu_bo_driver,
> >                                adev_to_drm(adev)->anon_inode->i_mapping,
> >                                adev_to_drm(adev)->vma_offset_manager,
> > @@ -2036,7 +2036,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
> >         ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
> >         ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GWS);
> >         ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_OA);
> > -       ttm_bo_device_release(&adev->mman.bdev);
> > +       ttm_device_release(&adev->mman.bdev);
> >         adev->mman.initialized =3D false;
> >         DRM_INFO("amdgpu: ttm finalized\n");
> >  }
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.h
> > index a87951b2f06d..e5d612415eff 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> > @@ -53,7 +53,7 @@ struct amdgpu_gtt_mgr {
> >  };
> >
> >  struct amdgpu_mman {
> > -       struct ttm_bo_device            bdev;
> > +       struct ttm_device               bdev;
> >         bool                            mem_global_referenced;
> >         bool                            initialized;
> >         void __iomem                    *aper_base_kaddr;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 3e6243623082..dfbb9b025654 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -638,15 +638,15 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_dev=
ice *adev,
> >         struct amdgpu_vm_bo_base *bo_base;
> >
> >         if (vm->bulk_moveable) {
> > -               spin_lock(&ttm_bo_glob.lru_lock);
> > +               spin_lock(&ttm_glob.lru_lock);
> >                 ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
> > -               spin_unlock(&ttm_bo_glob.lru_lock);
> > +               spin_unlock(&ttm_glob.lru_lock);
> >                 return;
> >         }
> >
> >         memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
> >
> > -       spin_lock(&ttm_bo_glob.lru_lock);
> > +       spin_lock(&ttm_glob.lru_lock);
> >         list_for_each_entry(bo_base, &vm->idle, vm_status) {
> >                 struct amdgpu_bo *bo =3D bo_base->bo;
> >
> > @@ -658,7 +658,7 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_devic=
e *adev,
> >                         ttm_bo_move_to_lru_tail(&bo->shadow->tbo,
> >                                                 &vm->lru_bulk_move);
> >         }
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >
> >         vm->bulk_moveable =3D true;
> >  }
> > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> > index b9c0ea720efd..f7a027123975 100644
> > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > @@ -187,7 +187,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(str=
uct drm_device *dev,
> >         struct drm_gem_vram_object *gbo;
> >         struct drm_gem_object *gem;
> >         struct drm_vram_mm *vmm =3D dev->vram_mm;
> > -       struct ttm_bo_device *bdev;
> > +       struct ttm_device *bdev;
> >         int ret;
> >         size_t acc_size;
> >
> > @@ -555,7 +555,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *=
file,
> >  EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
> >
> >  /*
> > - * Helpers for struct ttm_bo_driver
> > + * Helpers for struct ttm_device_funcs
> >   */
> >
> >  static bool drm_is_gem_vram(struct ttm_buffer_object *bo)
> > @@ -886,7 +886,7 @@ static const struct drm_gem_object_funcs drm_gem_vr=
am_object_funcs =3D {
> >   * TTM TT
> >   */
> >
> > -static void bo_driver_ttm_tt_destroy(struct ttm_bo_device *bdev, struc=
t ttm_tt *tt)
> > +static void bo_driver_ttm_tt_destroy(struct ttm_device *bdev, struct t=
tm_tt *tt)
> >  {
> >         ttm_tt_destroy_common(bdev, tt);
> >         ttm_tt_fini(tt);
> > @@ -947,7 +947,7 @@ static void bo_driver_move_notify(struct ttm_buffer=
_object *bo,
> >         drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
> >  }
> >
> > -static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
> > +static int bo_driver_io_mem_reserve(struct ttm_device *bdev,
> >                                     struct ttm_resource *mem)
> >  {
> >         struct drm_vram_mm *vmm =3D drm_vram_mm_of_bdev(bdev);
> > @@ -967,7 +967,7 @@ static int bo_driver_io_mem_reserve(struct ttm_bo_d=
evice *bdev,
> >         return 0;
> >  }
> >
> > -static struct ttm_bo_driver bo_driver =3D {
> > +static struct ttm_device_funcs bo_driver =3D {
> >         .ttm_tt_create =3D bo_driver_ttm_tt_create,
> >         .ttm_tt_destroy =3D bo_driver_ttm_tt_destroy,
> >         .eviction_valuable =3D ttm_bo_eviction_valuable,
> > @@ -1017,7 +1017,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *v=
mm, struct drm_device *dev,
> >         vmm->vram_base =3D vram_base;
> >         vmm->vram_size =3D vram_size;
> >
> > -       ret =3D ttm_bo_device_init(&vmm->bdev, &bo_driver,
> > +       ret =3D ttm_device_init(&vmm->bdev, &bo_driver,
> >                                  dev->anon_inode->i_mapping,
> >                                  dev->vma_offset_manager,
> >                                  true);
> > @@ -1035,7 +1035,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *v=
mm, struct drm_device *dev,
> >  static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
> >  {
> >         ttm_range_man_fini(&vmm->bdev, TTM_PL_VRAM);
> > -       ttm_bo_device_release(&vmm->bdev);
> > +       ttm_device_release(&vmm->bdev);
> >  }
> >
> >  /*
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index b37dfd12c7b9..912bc3204c4e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -44,7 +44,7 @@
> >  #include <nvif/if500b.h>
> >  #include <nvif/if900b.h>
> >
> > -static int nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_=
tt *ttm,
> > +static int nouveau_ttm_tt_bind(struct ttm_device *bdev, struct ttm_tt =
*ttm,
> >                                struct ttm_resource *reg);
> >
> >  /*
> > @@ -674,7 +674,7 @@ nouveau_ttm_tt_create(struct ttm_buffer_object *bo,=
 uint32_t page_flags)
> >  }
> >
> >  static int
> > -nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
> > +nouveau_ttm_tt_bind(struct ttm_device *bdev, struct ttm_tt *ttm,
> >                     struct ttm_resource *reg)
> >  {
> >  #if IS_ENABLED(CONFIG_AGP)
> > @@ -690,7 +690,7 @@ nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, str=
uct ttm_tt *ttm,
> >  }
> >
> >  static void
> > -nouveau_ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> > +nouveau_ttm_tt_unbind(struct ttm_device *bdev, struct ttm_tt *ttm)
> >  {
> >  #if IS_ENABLED(CONFIG_AGP)
> >         struct nouveau_drm *drm =3D nouveau_bdev(bdev);
> > @@ -1101,7 +1101,7 @@ nouveau_ttm_io_mem_free_locked(struct nouveau_drm=
 *drm,
> >  }
> >
> >  static int
> > -nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso=
urce *reg)
> > +nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resourc=
e *reg)
> >  {
> >         struct nouveau_drm *drm =3D nouveau_bdev(bdev);
> >         struct nvkm_device *device =3D nvxx_device(&drm->client.device);
> > @@ -1210,7 +1210,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *=
bdev, struct ttm_resource *reg)
> >  }
> >
> >  static void
> > -nouveau_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_resourc=
e *reg)
> > +nouveau_ttm_io_mem_free(struct ttm_device *bdev, struct ttm_resource *=
reg)
> >  {
> >         struct nouveau_drm *drm =3D nouveau_bdev(bdev);
> >
> > @@ -1270,7 +1270,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struc=
t ttm_buffer_object *bo)
> >  }
> >
> >  static int
> > -nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
> > +nouveau_ttm_tt_populate(struct ttm_device *bdev,
> >                         struct ttm_tt *ttm, struct ttm_operation_ctx *c=
tx)
> >  {
> >         struct ttm_dma_tt *ttm_dma =3D (void *)ttm;
> > @@ -1307,7 +1307,7 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bde=
v,
> >  }
> >
> >  static void
> > -nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
> > +nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
> >                           struct ttm_tt *ttm)
> >  {
> >         struct ttm_dma_tt *ttm_dma =3D (void *)ttm;
> > @@ -1339,7 +1339,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *b=
dev,
> >  }
> >
> >  static void
> > -nouveau_ttm_tt_destroy(struct ttm_bo_device *bdev,
> > +nouveau_ttm_tt_destroy(struct ttm_device *bdev,
> >                        struct ttm_tt *ttm)
> >  {
> >  #if IS_ENABLED(CONFIG_AGP)
> > @@ -1365,7 +1365,7 @@ nouveau_bo_fence(struct nouveau_bo *nvbo, struct =
nouveau_fence *fence, bool excl
> >                 dma_resv_add_shared_fence(resv, &fence->base);
> >  }
> >
> > -struct ttm_bo_driver nouveau_bo_driver =3D {
> > +struct ttm_device_funcs nouveau_bo_driver =3D {
> >         .ttm_tt_create =3D &nouveau_ttm_tt_create,
> >         .ttm_tt_populate =3D &nouveau_ttm_tt_populate,
> >         .ttm_tt_unpopulate =3D &nouveau_ttm_tt_unpopulate,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nou=
veau/nouveau_bo.h
> > index 641ef6298a0e..2fee7d50ef09 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
> > @@ -70,7 +70,7 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau=
_bo **pnvbo)
> >         return 0;
> >  }
> >
> > -extern struct ttm_bo_driver nouveau_bo_driver;
> > +extern struct ttm_device_funcs nouveau_bo_driver;
> >
> >  void nouveau_bo_move_init(struct nouveau_drm *);
> >  struct nouveau_bo *nouveau_bo_alloc(struct nouveau_cli *, u64 *size, i=
nt *align,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/no=
uveau/nouveau_drv.h
> > index b8025507a9e4..0cde16211e40 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > @@ -153,7 +153,7 @@ struct nouveau_drm {
> >
> >         /* TTM interface support */
> >         struct {
> > -               struct ttm_bo_device bdev;
> > +               struct ttm_device bdev;
> >                 atomic_t validate_sequence;
> >                 int (*move)(struct nouveau_channel *,
> >                             struct ttm_buffer_object *,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/=
nouveau/nouveau_sgdma.c
> > index cd6fdebae795..0400bb43fac5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > @@ -16,7 +16,7 @@ struct nouveau_sgdma_be {
> >  };
> >
> >  void
> > -nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> > +nouveau_sgdma_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
> >  {
> >         struct nouveau_sgdma_be *nvbe =3D (struct nouveau_sgdma_be *)tt=
m;
> >
> > @@ -29,7 +29,7 @@ nouveau_sgdma_destroy(struct ttm_bo_device *bdev, str=
uct ttm_tt *ttm)
> >  }
> >
> >  int
> > -nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, str=
uct ttm_resource *reg)
> > +nouveau_sgdma_bind(struct ttm_device *bdev, struct ttm_tt *ttm, struct=
 ttm_resource *reg)
> >  {
> >         struct nouveau_sgdma_be *nvbe =3D (struct nouveau_sgdma_be *)tt=
m;
> >         struct nouveau_drm *drm =3D nouveau_bdev(bdev);
> > @@ -56,7 +56,7 @@ nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct=
 ttm_tt *ttm, struct ttm_re
> >  }
> >
> >  void
> > -nouveau_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> > +nouveau_sgdma_unbind(struct ttm_device *bdev, struct ttm_tt *ttm)
> >  {
> >         struct nouveau_sgdma_be *nvbe =3D (struct nouveau_sgdma_be *)tt=
m;
> >         if (nvbe->mem) {
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/no=
uveau/nouveau_ttm.c
> > index edf3bb89a47f..2fb127da0208 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > @@ -315,7 +315,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
> >                 drm->agp.cma =3D pci->agp.cma;
> >         }
> >
> > -       ret =3D ttm_bo_device_init(&drm->ttm.bdev,
> > +       ret =3D ttm_device_init(&drm->ttm.bdev,
> >                                   &nouveau_bo_driver,
> >                                   dev->anon_inode->i_mapping,
> >                                   dev->vma_offset_manager,
> > @@ -369,7 +369,7 @@ nouveau_ttm_fini(struct nouveau_drm *drm)
> >         nouveau_ttm_fini_vram(drm);
> >         nouveau_ttm_fini_gtt(drm);
> >
> > -       ttm_bo_device_release(&drm->ttm.bdev);
> > +       ttm_device_release(&drm->ttm.bdev);
> >
> >         arch_phys_wc_del(drm->ttm.mtrr);
> >         drm->ttm.mtrr =3D 0;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.h b/drivers/gpu/drm/no=
uveau/nouveau_ttm.h
> > index 69552049bb96..dbf6dc238efd 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_ttm.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.h
> > @@ -3,7 +3,7 @@
> >  #define __NOUVEAU_TTM_H__
> >
> >  static inline struct nouveau_drm *
> > -nouveau_bdev(struct ttm_bo_device *bd)
> > +nouveau_bdev(struct ttm_device *bd)
> >  {
> >         return container_of(bd, struct nouveau_drm, ttm.bdev);
> >  }
> > @@ -22,7 +22,7 @@ int  nouveau_ttm_mmap(struct file *, struct vm_area_s=
truct *);
> >  int  nouveau_ttm_global_init(struct nouveau_drm *);
> >  void nouveau_ttm_global_release(struct nouveau_drm *);
> >
> > -int nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,=
 struct ttm_resource *reg);
> > -void nouveau_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *t=
tm);
> > -void nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *=
ttm);
> > +int nouveau_sgdma_bind(struct ttm_device *bdev, struct ttm_tt *ttm, st=
ruct ttm_resource *reg);
> > +void nouveau_sgdma_unbind(struct ttm_device *bdev, struct ttm_tt *ttm);
> > +void nouveau_sgdma_destroy(struct ttm_device *bdev, struct ttm_tt *ttm=
);
> >  #endif
> > diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_dr=
v.h
> > index 3602e8b34189..78c0969e0403 100644
> > --- a/drivers/gpu/drm/qxl/qxl_drv.h
> > +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> > @@ -123,7 +123,7 @@ struct qxl_output {
> >  #define drm_encoder_to_qxl_output(x) container_of(x, struct qxl_output=
, enc)
> >
> >  struct qxl_mman {
> > -       struct ttm_bo_device            bdev;
> > +       struct ttm_device               bdev;
> >  };
> >
> >  struct qxl_memslot {
> > @@ -348,7 +348,7 @@ int qxl_mode_dumb_mmap(struct drm_file *filp,
> >  /* qxl ttm */
> >  int qxl_ttm_init(struct qxl_device *qdev);
> >  void qxl_ttm_fini(struct qxl_device *qdev);
> > -int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> > +int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
> >                            struct ttm_resource *mem);
> >
> >  /* qxl image */
> > diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qx=
l_release.c
> > index e75e364655b8..9a90f4e33f08 100644
> > --- a/drivers/gpu/drm/qxl/qxl_release.c
> > +++ b/drivers/gpu/drm/qxl/qxl_release.c
> > @@ -429,7 +429,7 @@ void qxl_release_unmap(struct qxl_device *qdev,
> >  void qxl_release_fence_buffer_objects(struct qxl_release *release)
> >  {
> >         struct ttm_buffer_object *bo;
> > -       struct ttm_bo_device *bdev;
> > +       struct ttm_device *bdev;
> >         struct ttm_validate_buffer *entry;
> >         struct qxl_device *qdev;
> >
> > @@ -450,7 +450,7 @@ void qxl_release_fence_buffer_objects(struct qxl_re=
lease *release)
> >                        release->id | 0xf0000000, release->base.seqno);
> >         trace_dma_fence_emit(&release->base);
> >
> > -       spin_lock(&ttm_bo_glob.lru_lock);
> > +       spin_lock(&ttm_glob.lru_lock);
> >
> >         list_for_each_entry(entry, &release->bos, head) {
> >                 bo =3D entry->bo;
> > @@ -459,7 +459,7 @@ void qxl_release_fence_buffer_objects(struct qxl_re=
lease *release)
> >                 ttm_bo_move_to_lru_tail(bo, NULL);
> >                 dma_resv_unlock(bo->base.resv);
> >         }
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >         ww_acquire_fini(&release->ticket);
> >  }
> >
> > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_tt=
m.c
> > index d535e836be72..9b707af7dfd0 100644
> > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > @@ -38,7 +38,7 @@
> >  #include "qxl_drv.h"
> >  #include "qxl_object.h"
> >
> > -static struct qxl_device *qxl_get_qdev(struct ttm_bo_device *bdev)
> > +static struct qxl_device *qxl_get_qdev(struct ttm_device *bdev)
> >  {
> >         struct qxl_mman *mman;
> >         struct qxl_device *qdev;
> > @@ -71,7 +71,7 @@ static void qxl_evict_flags(struct ttm_buffer_object =
*bo,
> >         *placement =3D qbo->placement;
> >  }
> >
> > -int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> > +int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
> >                            struct ttm_resource *mem)
> >  {
> >         struct qxl_device *qdev =3D qxl_get_qdev(bdev);
> > @@ -106,7 +106,7 @@ struct qxl_ttm_tt {
> >         u64                             offset;
> >  };
> >
> > -static int qxl_ttm_backend_bind(struct ttm_bo_device *bdev,
> > +static int qxl_ttm_backend_bind(struct ttm_device *bdev,
> >                                 struct ttm_tt *ttm,
> >                                 struct ttm_resource *bo_mem)
> >  {
> > @@ -121,13 +121,13 @@ static int qxl_ttm_backend_bind(struct ttm_bo_dev=
ice *bdev,
> >         return -1;
> >  }
> >
> > -static void qxl_ttm_backend_unbind(struct ttm_bo_device *bdev,
> > +static void qxl_ttm_backend_unbind(struct ttm_device *bdev,
> >                                    struct ttm_tt *ttm)
> >  {
> >         /* Not implemented */
> >  }
> >
> > -static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
> > +static void qxl_ttm_backend_destroy(struct ttm_device *bdev,
> >                                     struct ttm_tt *ttm)
> >  {
> >         struct qxl_ttm_tt *gtt =3D (void *)ttm;
> > @@ -189,7 +189,7 @@ static void qxl_bo_move_notify(struct ttm_buffer_ob=
ject *bo,
> >                 qxl_surface_evict(qdev, qbo, new_mem ? true : false);
> >  }
> >
> > -static struct ttm_bo_driver qxl_bo_driver =3D {
> > +static struct ttm_device_funcs qxl_bo_driver =3D {
> >         .ttm_tt_create =3D &qxl_ttm_tt_create,
> >         .ttm_tt_bind =3D &qxl_ttm_backend_bind,
> >         .ttm_tt_destroy =3D &qxl_ttm_backend_destroy,
> > @@ -214,7 +214,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
> >         int num_io_pages; /* !=3D rom->num_io_pages, we include surface=
0 */
> >
> >         /* No others user of address space so set it to 0 */
> > -       r =3D ttm_bo_device_init(&qdev->mman.bdev,
> > +       r =3D ttm_device_init(&qdev->mman.bdev,
> >                                &qxl_bo_driver,
> >                                qdev->ddev.anon_inode->i_mapping,
> >                                qdev->ddev.vma_offset_manager,
> > @@ -249,7 +249,7 @@ void qxl_ttm_fini(struct qxl_device *qdev)
> >  {
> >         ttm_range_man_fini(&qdev->mman.bdev, TTM_PL_VRAM);
> >         ttm_range_man_fini(&qdev->mman.bdev, TTM_PL_PRIV);
> > -       ttm_bo_device_release(&qdev->mman.bdev);
> > +       ttm_device_release(&qdev->mman.bdev);
> >         DRM_INFO("qxl: ttm finalized\n");
> >  }
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/r=
adeon.h
> > index 5d54bccebd4d..775576470e78 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -452,7 +452,7 @@ struct radeon_surface_reg {
> >   * TTM.
> >   */
> >  struct radeon_mman {
> > -       struct ttm_bo_device            bdev;
> > +       struct ttm_device               bdev;
> >         bool                            initialized;
> >
> >  #if defined(CONFIG_DEBUG_FS)
> > @@ -2819,7 +2819,7 @@ extern int radeon_ttm_tt_set_userptr(struct radeo=
n_device *rdev,
> >                                      uint32_t flags);
> >  extern bool radeon_ttm_tt_has_userptr(struct radeon_device *rdev, stru=
ct ttm_tt *ttm);
> >  extern bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev, stru=
ct ttm_tt *ttm);
> > -bool radeon_ttm_tt_is_bound(struct ttm_bo_device *bdev, struct ttm_tt =
*ttm);
> > +bool radeon_ttm_tt_is_bound(struct ttm_device *bdev, struct ttm_tt *tt=
m);
> >  extern void radeon_vram_location(struct radeon_device *rdev, struct ra=
deon_mc *mc, u64 base);
> >  extern void radeon_gtt_location(struct radeon_device *rdev, struct rad=
eon_mc *mc);
> >  extern int radeon_resume_kms(struct drm_device *dev, bool resume, bool=
 fbcon);
> > @@ -2829,7 +2829,7 @@ extern void radeon_ttm_set_active_vram_size(struc=
t radeon_device *rdev, u64 size
> >  extern void radeon_program_register_sequence(struct radeon_device *rde=
v,
> >                                              const u32 *registers,
> >                                              const u32 array_size);
> > -struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev);
> > +struct radeon_device *radeon_get_rdev(struct ttm_device *bdev);
> >
> >  /*
> >   * vm
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> > index d6f42fbc81f4..3835c9457c06 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -56,11 +56,11 @@
> >  static int radeon_ttm_debugfs_init(struct radeon_device *rdev);
> >  static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
> >
> > -static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
> > +static int radeon_ttm_tt_bind(struct ttm_device *bdev,
> >                               struct ttm_tt *ttm,
> >                               struct ttm_resource *bo_mem);
> >
> > -struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
> > +struct radeon_device *radeon_get_rdev(struct ttm_device *bdev)
> >  {
> >         struct radeon_mman *mman;
> >         struct radeon_device *rdev;
> > @@ -351,7 +351,7 @@ static int radeon_bo_move(struct ttm_buffer_object =
*bo, bool evict,
> >         return 0;
> >  }
> >
> > -static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struc=
t ttm_resource *mem)
> > +static int radeon_ttm_io_mem_reserve(struct ttm_device *bdev, struct t=
tm_resource *mem)
> >  {
> >         struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> >         size_t bus_size =3D (size_t)mem->num_pages << PAGE_SHIFT;
> > @@ -418,7 +418,7 @@ struct radeon_ttm_tt {
> >  };
> >
> >  /* prepare the sg table with the user pages */
> > -static int radeon_ttm_tt_pin_userptr(struct ttm_bo_device *bdev, struc=
t ttm_tt *ttm)
> > +static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct t=
tm_tt *ttm)
> >  {
> >         struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> >         struct radeon_ttm_tt *gtt =3D (void *)ttm;
> > @@ -479,7 +479,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_=
device *bdev, struct ttm_tt *
> >         return r;
> >  }
> >
> > -static void radeon_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev, st=
ruct ttm_tt *ttm)
> > +static void radeon_ttm_tt_unpin_userptr(struct ttm_device *bdev, struc=
t ttm_tt *ttm)
> >  {
> >         struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> >         struct radeon_ttm_tt *gtt =3D (void *)ttm;
> > @@ -515,7 +515,7 @@ static bool radeon_ttm_backend_is_bound(struct ttm_=
tt *ttm)
> >         return (gtt->bound);
> >  }
> >
> > -static int radeon_ttm_backend_bind(struct ttm_bo_device *bdev,
> > +static int radeon_ttm_backend_bind(struct ttm_device *bdev,
> >                                    struct ttm_tt *ttm,
> >                                    struct ttm_resource *bo_mem)
> >  {
> > @@ -551,7 +551,7 @@ static int radeon_ttm_backend_bind(struct ttm_bo_de=
vice *bdev,
> >         return 0;
> >  }
> >
> > -static void radeon_ttm_backend_unbind(struct ttm_bo_device *bdev, stru=
ct ttm_tt *ttm)
> > +static void radeon_ttm_backend_unbind(struct ttm_device *bdev, struct =
ttm_tt *ttm)
> >  {
> >         struct radeon_ttm_tt *gtt =3D (void *)ttm;
> >         struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> > @@ -566,7 +566,7 @@ static void radeon_ttm_backend_unbind(struct ttm_bo=
_device *bdev, struct ttm_tt
> >         gtt->bound =3D false;
> >  }
> >
> > -static void radeon_ttm_backend_destroy(struct ttm_bo_device *bdev, str=
uct ttm_tt *ttm)
> > +static void radeon_ttm_backend_destroy(struct ttm_device *bdev, struct=
 ttm_tt *ttm)
> >  {
> >         struct radeon_ttm_tt *gtt =3D (void *)ttm;
> >
> > @@ -627,7 +627,7 @@ static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(s=
truct radeon_device *rdev,
> >         return container_of(ttm, struct radeon_ttm_tt, ttm.ttm);
> >  }
> >
> > -static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
> > +static int radeon_ttm_tt_populate(struct ttm_device *bdev,
> >                                   struct ttm_tt *ttm,
> >                                   struct ttm_operation_ctx *ctx)
> >  {
> > @@ -667,7 +667,7 @@ static int radeon_ttm_tt_populate(struct ttm_bo_dev=
ice *bdev,
> >         return ttm_populate_and_map_pages(rdev->dev, &gtt->ttm, ctx);
> >  }
> >
> > -static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struc=
t ttm_tt *ttm)
> > +static void radeon_ttm_tt_unpopulate(struct ttm_device *bdev, struct t=
tm_tt *ttm)
> >  {
> >         struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> >         struct radeon_ttm_tt *gtt =3D radeon_ttm_tt_to_gtt(rdev, ttm);
> > @@ -714,7 +714,7 @@ int radeon_ttm_tt_set_userptr(struct radeon_device =
*rdev,
> >         return 0;
> >  }
> >
> > -bool radeon_ttm_tt_is_bound(struct ttm_bo_device *bdev,
> > +bool radeon_ttm_tt_is_bound(struct ttm_device *bdev,
> >                             struct ttm_tt *ttm)
> >  {
> >  #if IS_ENABLED(CONFIG_AGP)
> > @@ -725,7 +725,7 @@ bool radeon_ttm_tt_is_bound(struct ttm_bo_device *b=
dev,
> >         return radeon_ttm_backend_is_bound(ttm);
> >  }
> >
> > -static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
> > +static int radeon_ttm_tt_bind(struct ttm_device *bdev,
> >                               struct ttm_tt *ttm,
> >                               struct ttm_resource *bo_mem)
> >  {
> > @@ -743,7 +743,7 @@ static int radeon_ttm_tt_bind(struct ttm_bo_device =
*bdev,
> >         return radeon_ttm_backend_bind(bdev, ttm, bo_mem);
> >  }
> >
> > -static void radeon_ttm_tt_unbind(struct ttm_bo_device *bdev,
> > +static void radeon_ttm_tt_unbind(struct ttm_device *bdev,
> >                                  struct ttm_tt *ttm)
> >  {
> >  #if IS_ENABLED(CONFIG_AGP)
> > @@ -757,7 +757,7 @@ static void radeon_ttm_tt_unbind(struct ttm_bo_devi=
ce *bdev,
> >         radeon_ttm_backend_unbind(bdev, ttm);
> >  }
> >
> > -static void radeon_ttm_tt_destroy(struct ttm_bo_device *bdev,
> > +static void radeon_ttm_tt_destroy(struct ttm_device *bdev,
> >                                   struct ttm_tt *ttm)
> >  {
> >  #if IS_ENABLED(CONFIG_AGP)
> > @@ -795,7 +795,7 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device=
 *rdev,
> >         return !!(gtt->userflags & RADEON_GEM_USERPTR_READONLY);
> >  }
> >
> > -static struct ttm_bo_driver radeon_bo_driver =3D {
> > +static struct ttm_device_funcs radeon_bo_driver =3D {
> >         .ttm_tt_create =3D &radeon_ttm_tt_create,
> >         .ttm_tt_populate =3D &radeon_ttm_tt_populate,
> >         .ttm_tt_unpopulate =3D &radeon_ttm_tt_unpopulate,
> > @@ -815,7 +815,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
> >         int r;
> >
> >         /* No others user of address space so set it to 0 */
> > -       r =3D ttm_bo_device_init(&rdev->mman.bdev,
> > +       r =3D ttm_device_init(&rdev->mman.bdev,
> >                                &radeon_bo_driver,
> >                                rdev->ddev->anon_inode->i_mapping,
> >                                rdev->ddev->vma_offset_manager,
> > @@ -885,7 +885,7 @@ void radeon_ttm_fini(struct radeon_device *rdev)
> >         }
> >         ttm_range_man_fini(&rdev->mman.bdev, TTM_PL_VRAM);
> >         ttm_range_man_fini(&rdev->mman.bdev, TTM_PL_TT);
> > -       ttm_bo_device_release(&rdev->mman.bdev);
> > +       ttm_device_release(&rdev->mman.bdev);
> >         radeon_gart_fini(rdev);
> >         rdev->mman.initialized =3D false;
> >         DRM_INFO("radeon: ttm finalized\n");
> > diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> > index 90c0da88cc98..7a474e88d47e 100644
> > --- a/drivers/gpu/drm/ttm/Makefile
> > +++ b/drivers/gpu/drm/ttm/Makefile
> > @@ -5,7 +5,7 @@
> >  ttm-y :=3D ttm_memory.o ttm_tt.o ttm_bo.o \
> >         ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
> >         ttm_execbuf_util.o ttm_page_alloc.o ttm_range_manager.o \
> > -       ttm_resource.o
> > +       ttm_resource.o ttm_device.o
> >  ttm-$(CONFIG_AGP) +=3D ttm_agp_backend.o
> >  ttm-$(CONFIG_DRM_TTM_DMA_PAGE_POOL) +=3D ttm_page_alloc_dma.o
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/tt=
m/ttm_agp_backend.c
> > index 4f76c9287159..b382d91414a1 100644
> > --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > @@ -51,7 +51,7 @@ struct ttm_agp_backend {
> >  int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
> >  {
> >         struct ttm_agp_backend *agp_be =3D container_of(ttm, struct ttm=
_agp_backend, ttm);
> > -       struct page *dummy_read_page =3D ttm_bo_glob.dummy_read_page;
> > +       struct page *dummy_read_page =3D ttm_glob.dummy_read_page;
> >         struct drm_mm_node *node =3D bo_mem->mm_node;
> >         struct agp_memory *mem;
> >         int ret, cached =3D ttm->caching =3D=3D ttm_cached;
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 2fe4cbefde28..40d1ac91c9bf 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -43,21 +43,6 @@
> >  #include <linux/atomic.h>
> >  #include <linux/dma-resv.h>
> >
> > -static void ttm_bo_global_kobj_release(struct kobject *kobj);
> > -
> > -/**
> > - * ttm_global_mutex - protecting the global BO state
> > - */
> > -DEFINE_MUTEX(ttm_global_mutex);
> > -unsigned ttm_bo_glob_use_count;
> > -struct ttm_bo_global ttm_bo_glob;
> > -EXPORT_SYMBOL(ttm_bo_glob);
> > -
> > -static struct attribute ttm_bo_count =3D {
> > -       .name =3D "bo_count",
> > -       .mode =3D S_IRUGO
> > -};
> > -
> >  /* default destructor */
> >  static void ttm_bo_default_destroy(struct ttm_buffer_object *bo)
> >  {
> > @@ -83,36 +68,10 @@ static void ttm_bo_mem_space_debug(struct ttm_buffe=
r_object *bo,
> >         }
> >  }
> >
> > -static ssize_t ttm_bo_global_show(struct kobject *kobj,
> > -                                 struct attribute *attr,
> > -                                 char *buffer)
> > -{
> > -       struct ttm_bo_global *glob =3D
> > -               container_of(kobj, struct ttm_bo_global, kobj);
> > -
> > -       return snprintf(buffer, PAGE_SIZE, "%d\n",
> > -                               atomic_read(&glob->bo_count));
> > -}
> > -
> > -static struct attribute *ttm_bo_global_attrs[] =3D {
> > -       &ttm_bo_count,
> > -       NULL
> > -};
> > -
> > -static const struct sysfs_ops ttm_bo_global_ops =3D {
> > -       .show =3D &ttm_bo_global_show
> > -};
> > -
> > -static struct kobj_type ttm_bo_glob_kobj_type  =3D {
> > -       .release =3D &ttm_bo_global_kobj_release,
> > -       .sysfs_ops =3D &ttm_bo_global_ops,
> > -       .default_attrs =3D ttm_bo_global_attrs
> > -};
> > -
> >  static void ttm_bo_add_mem_to_lru(struct ttm_buffer_object *bo,
> >                                   struct ttm_resource *mem)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct ttm_resource_manager *man;
> >
> >         if (!list_empty(&bo->lru) || bo->pin_count)
> > @@ -124,13 +83,13 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffe=
r_object *bo,
> >         if (man->use_tt && bo->ttm &&
> >             !(bo->ttm->page_flags & (TTM_PAGE_FLAG_SG |
> >                                      TTM_PAGE_FLAG_SWAPPED))) {
> > -               list_add_tail(&bo->swap, &ttm_bo_glob.swap_lru[bo->prio=
rity]);
> > +               list_add_tail(&bo->swap, &ttm_glob.swap_lru[bo->priorit=
y]);
> >         }
> >  }
> >
> >  static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         bool notify =3D false;
> >
> >         if (!list_empty(&bo->swap)) {
> > @@ -142,8 +101,8 @@ static void ttm_bo_del_from_lru(struct ttm_buffer_o=
bject *bo)
> >                 notify =3D true;
> >         }
> >
> > -       if (notify && bdev->driver->del_from_lru_notify)
> > -               bdev->driver->del_from_lru_notify(bo);
> > +       if (notify && bdev->funcs->del_from_lru_notify)
> > +               bdev->funcs->del_from_lru_notify(bo);
> >  }
> >
> >  static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
> > @@ -223,7 +182,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_=
move *bulk)
> >                 dma_resv_assert_held(pos->first->base.resv);
> >                 dma_resv_assert_held(pos->last->base.resv);
> >
> > -               lru =3D &ttm_bo_glob.swap_lru[i];
> > +               lru =3D &ttm_glob.swap_lru[i];
> >                 list_bulk_move_tail(lru, &pos->first->swap, &pos->last-=
>swap);
> >         }
> >  }
> > @@ -233,7 +192,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
> >                                   struct ttm_resource *mem, bool evict,
> >                                   struct ttm_operation_ctx *ctx)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct ttm_resource_manager *old_man =3D ttm_manager_type(bdev,=
 bo->mem.mem_type);
> >         struct ttm_resource_manager *new_man =3D ttm_manager_type(bdev,=
 mem->mem_type);
> >         int ret;
> > @@ -263,8 +222,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
> >                 }
> >         }
> >
> > -       if (bdev->driver->move_notify)
> > -               bdev->driver->move_notify(bo, evict, mem);
> > +       if (bdev->funcs->move_notify)
> > +               bdev->funcs->move_notify(bo, evict, mem);
> >
> >         if (old_man->use_tt && new_man->use_tt) {
> >                 if (bo->mem.mem_type =3D=3D TTM_PL_SYSTEM) {
> > @@ -272,16 +231,16 @@ static int ttm_bo_handle_move_mem(struct ttm_buff=
er_object *bo,
> >                         ret =3D 0;
> >                 } else
> >                         ret =3D ttm_bo_move_ttm(bo, ctx, mem);
> > -       } else if (bdev->driver->move) {
> > -               ret =3D bdev->driver->move(bo, evict, ctx, mem);
> > +       } else if (bdev->funcs->move) {
> > +               ret =3D bdev->funcs->move(bo, evict, ctx, mem);
> >         } else {
> >                 ret =3D ttm_bo_move_memcpy(bo, ctx, mem);
> >         }
> >
> >         if (ret) {
> > -               if (bdev->driver->move_notify) {
> > +               if (bdev->funcs->move_notify) {
> >                         swap(*mem, bo->mem);
> > -                       bdev->driver->move_notify(bo, false, mem);
> > +                       bdev->funcs->move_notify(bo, false, mem);
> >                         swap(*mem, bo->mem);
> >                 }
> >
> > @@ -309,8 +268,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
> >
> >  static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
> >  {
> > -       if (bo->bdev->driver->move_notify)
> > -               bo->bdev->driver->move_notify(bo, false, NULL);
> > +       if (bo->bdev->funcs->move_notify)
> > +               bo->bdev->funcs->move_notify(bo, false, NULL);
> >
> >         ttm_bo_tt_destroy(bo);
> >         ttm_resource_free(bo, &bo->mem);
> > @@ -335,9 +294,9 @@ static int ttm_bo_individualize_resv(struct ttm_buf=
fer_object *bo)
> >                  * reference it any more. The only tricky case is the t=
rylock on
> >                  * the resv object while holding the lru_lock.
> >                  */
> > -               spin_lock(&ttm_bo_glob.lru_lock);
> > +               spin_lock(&ttm_glob.lru_lock);
> >                 bo->base.resv =3D &bo->base._resv;
> > -               spin_unlock(&ttm_bo_glob.lru_lock);
> > +               spin_unlock(&ttm_glob.lru_lock);
> >         }
> >
> >         return r;
> > @@ -395,7 +354,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
> >
> >                 if (unlock_resv)
> >                         dma_resv_unlock(bo->base.resv);
> > -               spin_unlock(&ttm_bo_glob.lru_lock);
> > +               spin_unlock(&ttm_glob.lru_lock);
> >
> >                 lret =3D dma_resv_wait_timeout_rcu(resv, true, interrup=
tible,
> >                                                  30 * HZ);
> > @@ -405,7 +364,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
> >                 else if (lret =3D=3D 0)
> >                         return -EBUSY;
> >
> > -               spin_lock(&ttm_bo_glob.lru_lock);
> > +               spin_lock(&ttm_glob.lru_lock);
> >                 if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
> >                         /*
> >                          * We raced, and lost, someone else holds the r=
eservation now,
> > @@ -415,7 +374,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
> >                          * delayed destruction would succeed, so just r=
eturn success
> >                          * here.
> >                          */
> > -                       spin_unlock(&ttm_bo_glob.lru_lock);
> > +                       spin_unlock(&ttm_glob.lru_lock);
> >                         return 0;
> >                 }
> >                 ret =3D 0;
> > @@ -424,13 +383,13 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_=
object *bo,
> >         if (ret || unlikely(list_empty(&bo->ddestroy))) {
> >                 if (unlock_resv)
> >                         dma_resv_unlock(bo->base.resv);
> > -               spin_unlock(&ttm_bo_glob.lru_lock);
> > +               spin_unlock(&ttm_glob.lru_lock);
> >                 return ret;
> >         }
> >
> >         ttm_bo_del_from_lru(bo);
> >         list_del_init(&bo->ddestroy);
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >         ttm_bo_cleanup_memtype_use(bo);
> >
> >         if (unlock_resv)
> > @@ -445,9 +404,9 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
> >   * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
> >   * encountered buffers.
> >   */
> > -static bool ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool rem=
ove_all)
> > +bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
> >  {
> > -       struct ttm_bo_global *glob =3D &ttm_bo_glob;
> > +       struct ttm_global *glob =3D &ttm_glob;
> >         struct list_head removed;
> >         bool empty;
> >
> > @@ -486,21 +445,11 @@ static bool ttm_bo_delayed_delete(struct ttm_bo_d=
evice *bdev, bool remove_all)
> >         return empty;
> >  }
> >
> > -static void ttm_bo_delayed_workqueue(struct work_struct *work)
> > -{
> > -       struct ttm_bo_device *bdev =3D
> > -           container_of(work, struct ttm_bo_device, wq.work);
> > -
> > -       if (!ttm_bo_delayed_delete(bdev, false))
> > -               schedule_delayed_work(&bdev->wq,
> > -                                     ((HZ / 100) < 1) ? 1 : HZ / 100);
> > -}
> > -
> >  static void ttm_bo_release(struct kref *kref)
> >  {
> >         struct ttm_buffer_object *bo =3D
> >             container_of(kref, struct ttm_buffer_object, kref);
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         size_t acc_size =3D bo->acc_size;
> >         int ret;
> >
> > @@ -514,8 +463,8 @@ static void ttm_bo_release(struct kref *kref)
> >                                                   30 * HZ);
> >                 }
> >
> > -               if (bo->bdev->driver->release_notify)
> > -                       bo->bdev->driver->release_notify(bo);
> > +               if (bo->bdev->funcs->release_notify)
> > +                       bo->bdev->funcs->release_notify(bo);
> >
> >                 drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_=
node);
> >                 ttm_mem_io_free(bdev, &bo->mem);
> > @@ -527,7 +476,7 @@ static void ttm_bo_release(struct kref *kref)
> >                 ttm_bo_flush_all_fences(bo);
> >                 bo->deleted =3D true;
> >
> > -               spin_lock(&ttm_bo_glob.lru_lock);
> > +               spin_lock(&ttm_glob.lru_lock);
> >
> >                 /*
> >                  * Make pinned bos immediately available to
> > @@ -542,22 +491,22 @@ static void ttm_bo_release(struct kref *kref)
> >
> >                 kref_init(&bo->kref);
> >                 list_add_tail(&bo->ddestroy, &bdev->ddestroy);
> > -               spin_unlock(&ttm_bo_glob.lru_lock);
> > +               spin_unlock(&ttm_glob.lru_lock);
> >
> >                 schedule_delayed_work(&bdev->wq,
> >                                       ((HZ / 100) < 1) ? 1 : HZ / 100);
> >                 return;
> >         }
> >
> > -       spin_lock(&ttm_bo_glob.lru_lock);
> > +       spin_lock(&ttm_glob.lru_lock);
> >         ttm_bo_del_from_lru(bo);
> >         list_del(&bo->ddestroy);
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >
> >         ttm_bo_cleanup_memtype_use(bo);
> >         dma_resv_unlock(bo->base.resv);
> >
> > -       atomic_dec(&ttm_bo_glob.bo_count);
> > +       atomic_dec(&ttm_glob.bo_count);
> >         dma_fence_put(bo->moving);
> >         if (!ttm_bo_uses_embedded_gem_object(bo))
> >                 dma_resv_fini(&bo->base._resv);
> > @@ -571,13 +520,13 @@ void ttm_bo_put(struct ttm_buffer_object *bo)
> >  }
> >  EXPORT_SYMBOL(ttm_bo_put);
> >
> > -int ttm_bo_lock_delayed_workqueue(struct ttm_bo_device *bdev)
> > +int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev)
> >  {
> >         return cancel_delayed_work_sync(&bdev->wq);
> >  }
> >  EXPORT_SYMBOL(ttm_bo_lock_delayed_workqueue);
> >
> > -void ttm_bo_unlock_delayed_workqueue(struct ttm_bo_device *bdev, int r=
esched)
> > +void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resc=
hed)
> >  {
> >         if (resched)
> >                 schedule_delayed_work(&bdev->wq,
> > @@ -588,7 +537,7 @@ EXPORT_SYMBOL(ttm_bo_unlock_delayed_workqueue);
> >  static int ttm_bo_evict(struct ttm_buffer_object *bo,
> >                         struct ttm_operation_ctx *ctx)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct ttm_resource evict_mem;
> >         struct ttm_placement placement;
> >         int ret =3D 0;
> > @@ -597,7 +546,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *b=
o,
> >
> >         placement.num_placement =3D 0;
> >         placement.num_busy_placement =3D 0;
> > -       bdev->driver->evict_flags(bo, &placement);
> > +       bdev->funcs->evict_flags(bo, &placement);
> >
> >         if (!placement.num_placement && !placement.num_busy_placement) {
> >                 ttm_bo_wait(bo, false, false);
> > @@ -712,7 +661,7 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffe=
r_object *busy_bo,
> >         return r =3D=3D -EDEADLK ? -EBUSY : r;
> >  }
> >
> > -int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> > +int ttm_mem_evict_first(struct ttm_device *bdev,
> >                         struct ttm_resource_manager *man,
> >                         const struct ttm_place *place,
> >                         struct ttm_operation_ctx *ctx,
> > @@ -723,7 +672,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> >         unsigned i;
> >         int ret;
> >
> > -       spin_lock(&ttm_bo_glob.lru_lock);
> > +       spin_lock(&ttm_glob.lru_lock);
> >         for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> >                 list_for_each_entry(bo, &man->lru[i], lru) {
> >                         bool busy;
> > @@ -736,7 +685,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> >                                 continue;
> >                         }
> >
> > -                       if (place && !bdev->driver->eviction_valuable(b=
o,
> > +                       if (place && !bdev->funcs->eviction_valuable(bo,
> >                                                                       p=
lace)) {
> >                                 if (locked)
> >                                         dma_resv_unlock(bo->base.resv);
> > @@ -760,7 +709,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> >         if (!bo) {
> >                 if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> >                         busy_bo =3D NULL;
> > -               spin_unlock(&ttm_bo_glob.lru_lock);
> > +               spin_unlock(&ttm_glob.lru_lock);
> >                 ret =3D ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
> >                 if (busy_bo)
> >                         ttm_bo_put(busy_bo);
> > @@ -774,7 +723,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> >                 return ret;
> >         }
> >
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >
> >         ret =3D ttm_bo_evict(bo, ctx);
> >         if (locked)
> > @@ -829,7 +778,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer=
_object *bo,
> >                                   struct ttm_resource *mem,
> >                                   struct ttm_operation_ctx *ctx)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct ttm_resource_manager *man =3D ttm_manager_type(bdev, mem=
->mem_type);
> >         struct ww_acquire_ctx *ticket;
> >         int ret;
> > @@ -866,7 +815,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_o=
bject *bo,
> >                                 struct ttm_resource *mem,
> >                                 struct ttm_operation_ctx *ctx)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct ttm_resource_manager *man;
> >
> >         man =3D ttm_manager_type(bdev, place->mem_type);
> > @@ -876,10 +825,10 @@ static int ttm_bo_mem_placement(struct ttm_buffer=
_object *bo,
> >         mem->mem_type =3D place->mem_type;
> >         mem->placement =3D place->flags;
> >
> > -       spin_lock(&ttm_bo_glob.lru_lock);
> > +       spin_lock(&ttm_glob.lru_lock);
> >         ttm_bo_del_from_lru(bo);
> >         ttm_bo_add_mem_to_lru(bo, mem);
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >
> >         return 0;
> >  }
> > @@ -897,7 +846,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
> >                         struct ttm_resource *mem,
> >                         struct ttm_operation_ctx *ctx)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         bool type_found =3D false;
> >         int i, ret;
> >
> > @@ -1074,7 +1023,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
> >  }
> >  EXPORT_SYMBOL(ttm_bo_validate);
> >
> > -int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
> > +int ttm_bo_init_reserved(struct ttm_device *bdev,
> >                          struct ttm_buffer_object *bo,
> >                          unsigned long size,
> >                          enum ttm_bo_type type,
> > @@ -1146,7 +1095,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bd=
ev,
> >                 dma_resv_init(&bo->base._resv);
> >                 drm_vma_node_reset(&bo->base.vma_node);
> >         }
> > -       atomic_inc(&ttm_bo_glob.bo_count);
> > +       atomic_inc(&ttm_glob.bo_count);
> >
> >         /*
> >          * For ttm_bo_type_device buffers, allocate
> > @@ -1182,7 +1131,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bd=
ev,
> >  }
> >  EXPORT_SYMBOL(ttm_bo_init_reserved);
> >
> > -int ttm_bo_init(struct ttm_bo_device *bdev,
> > +int ttm_bo_init(struct ttm_device *bdev,
> >                 struct ttm_buffer_object *bo,
> >                 unsigned long size,
> >                 enum ttm_bo_type type,
> > @@ -1210,7 +1159,7 @@ int ttm_bo_init(struct ttm_bo_device *bdev,
> >  }
> >  EXPORT_SYMBOL(ttm_bo_init);
> >
> > -size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
> > +size_t ttm_bo_dma_acc_size(struct ttm_device *bdev,
> >                            unsigned long bo_size,
> >                            unsigned struct_size)
> >  {
> > @@ -1224,7 +1173,7 @@ size_t ttm_bo_dma_acc_size(struct ttm_bo_device *=
bdev,
> >  }
> >  EXPORT_SYMBOL(ttm_bo_dma_acc_size);
> >
> > -int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
> > +int ttm_bo_evict_mm(struct ttm_device *bdev, unsigned mem_type)
> >  {
> >         struct ttm_resource_manager *man =3D ttm_manager_type(bdev, mem=
_type);
> >
> > @@ -1242,154 +1191,13 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev=
, unsigned mem_type)
> >  }
> >  EXPORT_SYMBOL(ttm_bo_evict_mm);
> >
> > -static void ttm_bo_global_kobj_release(struct kobject *kobj)
> > -{
> > -       struct ttm_bo_global *glob =3D
> > -               container_of(kobj, struct ttm_bo_global, kobj);
> > -
> > -       __free_page(glob->dummy_read_page);
> > -}
> > -
> > -static void ttm_bo_global_release(void)
> > -{
> > -       struct ttm_bo_global *glob =3D &ttm_bo_glob;
> > -
> > -       mutex_lock(&ttm_global_mutex);
> > -       if (--ttm_bo_glob_use_count > 0)
> > -               goto out;
> > -
> > -       kobject_del(&glob->kobj);
> > -       kobject_put(&glob->kobj);
> > -       ttm_mem_global_release(&ttm_mem_glob);
> > -       memset(glob, 0, sizeof(*glob));
> > -out:
> > -       mutex_unlock(&ttm_global_mutex);
> > -}
> > -
> > -static int ttm_bo_global_init(void)
> > -{
> > -       struct ttm_bo_global *glob =3D &ttm_bo_glob;
> > -       int ret =3D 0;
> > -       unsigned i;
> > -
> > -       mutex_lock(&ttm_global_mutex);
> > -       if (++ttm_bo_glob_use_count > 1)
> > -               goto out;
> > -
> > -       ret =3D ttm_mem_global_init(&ttm_mem_glob);
> > -       if (ret)
> > -               goto out;
> > -
> > -       spin_lock_init(&glob->lru_lock);
> > -       glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
> > -
> > -       if (unlikely(glob->dummy_read_page =3D=3D NULL)) {
> > -               ret =3D -ENOMEM;
> > -               goto out;
> > -       }
> > -
> > -       for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> > -               INIT_LIST_HEAD(&glob->swap_lru[i]);
> > -       INIT_LIST_HEAD(&glob->device_list);
> > -       atomic_set(&glob->bo_count, 0);
> > -
> > -       ret =3D kobject_init_and_add(
> > -               &glob->kobj, &ttm_bo_glob_kobj_type, ttm_get_kobj(), "b=
uffer_objects");
> > -       if (unlikely(ret !=3D 0))
> > -               kobject_put(&glob->kobj);
> > -out:
> > -       mutex_unlock(&ttm_global_mutex);
> > -       return ret;
> > -}
> > -
> > -int ttm_bo_device_release(struct ttm_bo_device *bdev)
> > -{
> > -       struct ttm_bo_global *glob =3D &ttm_bo_glob;
> > -       int ret =3D 0;
> > -       unsigned i;
> > -       struct ttm_resource_manager *man;
> > -
> > -       man =3D ttm_manager_type(bdev, TTM_PL_SYSTEM);
> > -       ttm_resource_manager_set_used(man, false);
> > -       ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> > -
> > -       mutex_lock(&ttm_global_mutex);
> > -       list_del(&bdev->device_list);
> > -       mutex_unlock(&ttm_global_mutex);
> > -
> > -       cancel_delayed_work_sync(&bdev->wq);
> > -
> > -       if (ttm_bo_delayed_delete(bdev, true))
> > -               pr_debug("Delayed destroy list was clean\n");
> > -
> > -       spin_lock(&glob->lru_lock);
> > -       for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> > -               if (list_empty(&man->lru[0]))
> > -                       pr_debug("Swap list %d was clean\n", i);
> > -       spin_unlock(&glob->lru_lock);
> > -
> > -       if (!ret)
> > -               ttm_bo_global_release();
> > -
> > -       return ret;
> > -}
> > -EXPORT_SYMBOL(ttm_bo_device_release);
> > -
> > -static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
> > -{
> > -       struct ttm_resource_manager *man =3D &bdev->sysman;
> > -
> > -       /*
> > -        * Initialize the system memory buffer type.
> > -        * Other types need to be driver / IOCTL initialized.
> > -        */
> > -       man->use_tt =3D true;
> > -
> > -       ttm_resource_manager_init(man, 0);
> > -       ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
> > -       ttm_resource_manager_set_used(man, true);
> > -}
> > -
> > -int ttm_bo_device_init(struct ttm_bo_device *bdev,
> > -                      struct ttm_bo_driver *driver,
> > -                      struct address_space *mapping,
> > -                      struct drm_vma_offset_manager *vma_manager,
> > -                      bool need_dma32)
> > -{
> > -       struct ttm_bo_global *glob =3D &ttm_bo_glob;
> > -       int ret;
> > -
> > -       if (WARN_ON(vma_manager =3D=3D NULL))
> > -               return -EINVAL;
> > -
> > -       ret =3D ttm_bo_global_init();
> > -       if (ret)
> > -               return ret;
> > -
> > -       bdev->driver =3D driver;
> > -
> > -       ttm_bo_init_sysman(bdev);
> > -
> > -       bdev->vma_manager =3D vma_manager;
> > -       INIT_DELAYED_WORK(&bdev->wq, ttm_bo_delayed_workqueue);
> > -       INIT_LIST_HEAD(&bdev->ddestroy);
> > -       bdev->dev_mapping =3D mapping;
> > -       bdev->need_dma32 =3D need_dma32;
> > -       mutex_lock(&ttm_global_mutex);
> > -       list_add_tail(&bdev->device_list, &glob->device_list);
> > -       mutex_unlock(&ttm_global_mutex);
> > -
> > -       return 0;
> > -}
> > -EXPORT_SYMBOL(ttm_bo_device_init);
> > -
> >  /*
> >   * buffer object vm functions.
> >   */
> >
> >  void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >
> >         drm_vma_node_unmap(&bo->base.vma_node, bdev->dev_mapping);
> >         ttm_mem_io_free(bdev, &bo->mem);
> > @@ -1425,7 +1233,7 @@ EXPORT_SYMBOL(ttm_bo_wait);
> >   * A buffer object shrink method that tries to swap out the first
> >   * buffer object on the bo_global::swap_lru list.
> >   */
> > -int ttm_bo_swapout(struct ttm_bo_global *glob, struct ttm_operation_ct=
x *ctx)
> > +int ttm_bo_swapout(struct ttm_global *glob, struct ttm_operation_ctx *=
ctx)
> >  {
> >         struct ttm_buffer_object *bo;
> >         int ret =3D -EBUSY;
> > @@ -1499,8 +1307,8 @@ int ttm_bo_swapout(struct ttm_bo_global *glob, st=
ruct ttm_operation_ctx *ctx)
> >          * anyone tries to access a ttm page.
> >          */
> >
> > -       if (bo->bdev->driver->swap_notify)
> > -               bo->bdev->driver->swap_notify(bo);
> > +       if (bo->bdev->funcs->swap_notify)
> > +               bo->bdev->funcs->swap_notify(bo);
> >
> >         ret =3D ttm_tt_swapout(bo->bdev, bo->ttm);
> >  out:
> > @@ -1524,7 +1332,7 @@ void ttm_bo_swapout_all(void)
> >                 .no_wait_gpu =3D false
> >         };
> >
> > -       while (ttm_bo_swapout(&ttm_bo_glob, &ctx) =3D=3D 0);
> > +       while (ttm_bo_swapout(&ttm_glob, &ctx) =3D=3D 0);
> >  }
> >  EXPORT_SYMBOL(ttm_bo_swapout_all);
> >
> > @@ -1539,10 +1347,10 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object=
 *bo)
> >
> >  int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *=
mem)
> >  {
> > -       return bo->bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
> > +       return bo->bdev->funcs->ttm_tt_bind(bo->bdev, bo->ttm, mem);
> >  }
> >
> >  void ttm_bo_tt_unbind(struct ttm_buffer_object *bo)
> >  {
> > -       bo->bdev->driver->ttm_tt_unbind(bo->bdev, bo->ttm);
> > +       bo->bdev->funcs->ttm_tt_unbind(bo->bdev, bo->ttm);
> >  }
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/tt=
m_bo_util.c
> > index ba7ab5ed85d0..17903f0e211f 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -88,33 +88,33 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
> >  }
> >  EXPORT_SYMBOL(ttm_bo_move_ttm);
> >
> > -int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
> > +int ttm_mem_io_reserve(struct ttm_device *bdev,
> >                        struct ttm_resource *mem)
> >  {
> >         if (mem->bus.offset || mem->bus.addr)
> >                 return 0;
> >
> >         mem->bus.is_iomem =3D false;
> > -       if (!bdev->driver->io_mem_reserve)
> > +       if (!bdev->funcs->io_mem_reserve)
> >                 return 0;
> >
> > -       return bdev->driver->io_mem_reserve(bdev, mem);
> > +       return bdev->funcs->io_mem_reserve(bdev, mem);
> >  }
> >
> > -void ttm_mem_io_free(struct ttm_bo_device *bdev,
> > +void ttm_mem_io_free(struct ttm_device *bdev,
> >                      struct ttm_resource *mem)
> >  {
> >         if (!mem->bus.offset && !mem->bus.addr)
> >                 return;
> >
> > -       if (bdev->driver->io_mem_free)
> > -               bdev->driver->io_mem_free(bdev, mem);
> > +       if (bdev->funcs->io_mem_free)
> > +               bdev->funcs->io_mem_free(bdev, mem);
> >
> >         mem->bus.offset =3D 0;
> >         mem->bus.addr =3D NULL;
> >  }
> >
> > -static int ttm_resource_ioremap(struct ttm_bo_device *bdev,
> > +static int ttm_resource_ioremap(struct ttm_device *bdev,
> >                                struct ttm_resource *mem,
> >                                void **virtual)
> >  {
> > @@ -144,7 +144,7 @@ static int ttm_resource_ioremap(struct ttm_bo_devic=
e *bdev,
> >         return 0;
> >  }
> >
> > -static void ttm_resource_iounmap(struct ttm_bo_device *bdev,
> > +static void ttm_resource_iounmap(struct ttm_device *bdev,
> >                                 struct ttm_resource *mem,
> >                                 void *virtual)
> >  {
> > @@ -214,7 +214,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
> >                        struct ttm_operation_ctx *ctx,
> >                        struct ttm_resource *new_mem)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct ttm_resource_manager *man =3D ttm_manager_type(bdev, new=
_mem->mem_type);
> >         struct ttm_tt *ttm =3D bo->ttm;
> >         struct ttm_resource *old_mem =3D &bo->mem;
> > @@ -355,7 +355,7 @@ static int ttm_buffer_object_transfer(struct ttm_bu=
ffer_object *bo,
> >          * TODO: Explicit member copy would probably be better here.
> >          */
> >
> > -       atomic_inc(&ttm_bo_glob.bo_count);
> > +       atomic_inc(&ttm_glob.bo_count);
> >         INIT_LIST_HEAD(&fbo->base.ddestroy);
> >         INIT_LIST_HEAD(&fbo->base.lru);
> >         INIT_LIST_HEAD(&fbo->base.swap);
> > @@ -584,7 +584,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_o=
bject *bo,
> >  static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
> >                                        struct dma_fence *fence)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct ttm_resource_manager *from =3D ttm_manager_type(bdev, bo=
->mem.mem_type);
> >
> >         /**
> > @@ -610,7 +610,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_obj=
ect *bo,
> >                               bool pipeline,
> >                               struct ttm_resource *new_mem)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct ttm_resource_manager *from =3D ttm_manager_type(bdev, bo=
->mem.mem_type);
> >         struct ttm_resource_manager *man =3D ttm_manager_type(bdev, new=
_mem->mem_type);
> >         int ret =3D 0;
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> > index eeaca5d1efe3..697c088d1063 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -96,10 +96,10 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_b=
uffer_object *bo,
> >  static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
> >                                        unsigned long page_offset)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >
> > -       if (bdev->driver->io_mem_pfn)
> > -               return bdev->driver->io_mem_pfn(bo, page_offset);
> > +       if (bdev->funcs->io_mem_pfn)
> > +               return bdev->funcs->io_mem_pfn(bo, page_offset);
> >
> >         return (bo->mem.bus.offset >> PAGE_SHIFT) + page_offset;
> >  }
> > @@ -217,7 +217,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_f=
ault *vmf,
> >                         if (page_to_pfn(ttm->pages[page_offset + i]) !=
=3D pfn + i)
> >                                 goto out_fallback;
> >                 }
> > -       } else if (bo->bdev->driver->io_mem_pfn) {
> > +       } else if (bo->bdev->funcs->io_mem_pfn) {
> >                 for (i =3D 1; i < fault_page_size; ++i) {
> >                         if (ttm_bo_io_mem_pfn(bo, page_offset + i) !=3D=
 pfn + i)
> >                                 goto out_fallback;
> > @@ -279,7 +279,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault=
 *vmf,
> >  {
> >         struct vm_area_struct *vma =3D vmf->vma;
> >         struct ttm_buffer_object *bo =3D vma->vm_private_data;
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         unsigned long page_offset;
> >         unsigned long page_last;
> >         unsigned long pfn;
> > @@ -490,8 +490,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, un=
signed long addr,
> >                 ret =3D ttm_bo_vm_access_kmap(bo, offset, buf, len, wri=
te);
> >                 break;
> >         default:
> > -               if (bo->bdev->driver->access_memory)
> > -                       ret =3D bo->bdev->driver->access_memory(
> > +               if (bo->bdev->funcs->access_memory)
> > +                       ret =3D bo->bdev->funcs->access_memory(
> >                                 bo, offset, buf, len, write);
> >                 else
> >                         ret =3D -EIO;
> > @@ -510,7 +510,7 @@ static const struct vm_operations_struct ttm_bo_vm_=
ops =3D {
> >         .access =3D ttm_bo_vm_access,
> >  };
> >
> > -static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_bo_device=
 *bdev,
> > +static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_device *b=
dev,
> >                                                   unsigned long offset,
> >                                                   unsigned long pages)
> >  {
> > @@ -557,9 +557,8 @@ static void ttm_bo_mmap_vma_setup(struct ttm_buffer=
_object *bo, struct vm_area_s
> >  }
> >
> >  int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
> > -               struct ttm_bo_device *bdev)
> > +               struct ttm_device *bdev)
> >  {
> > -       struct ttm_bo_driver *driver;
> >         struct ttm_buffer_object *bo;
> >         int ret;
> >
> > @@ -570,12 +569,11 @@ int ttm_bo_mmap(struct file *filp, struct vm_area=
_struct *vma,
> >         if (unlikely(!bo))
> >                 return -EINVAL;
> >
> > -       driver =3D bo->bdev->driver;
> > -       if (unlikely(!driver->verify_access)) {
> > +       if (unlikely(!bo->bdev->funcs->verify_access)) {
> >                 ret =3D -EPERM;
> >                 goto out_unref;
> >         }
> > -       ret =3D driver->verify_access(bo, filp);
> > +       ret =3D bo->bdev->funcs->verify_access(bo, filp);
> >         if (unlikely(ret !=3D 0))
> >                 goto out_unref;
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm=
_device.c
> > new file mode 100644
> > index 000000000000..65aa6e4f5c6c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -0,0 +1,222 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > +
> > +/*
> > + * Copyright (c) 2006-2009 VMware, Inc., Palo Alto, CA., USA
> > + * Copyright 2020 Advanced Micro Devices, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * Authors: Christian K=F6nig
> > + */
> > +
> > +#define pr_fmt(fmt) "[TTM DEVICE] " fmt
> > +
> > +#include <drm/ttm/ttm_module.h>
> > +#include <drm/ttm/ttm_device.h>
> > +#include <drm/ttm/ttm_memory.h>
> > +#include <drm/ttm/ttm_placement.h>
> > +
> > +/**
> > + * ttm_global_mutex - protecting the global state
> > + */
> > +DEFINE_MUTEX(ttm_global_mutex);
> > +unsigned ttm_glob_use_count;
> > +struct ttm_global ttm_glob;
> > +EXPORT_SYMBOL(ttm_glob);
> > +
> > +static struct attribute ttm_bo_count =3D {
> > +       .name =3D "bo_count",
> > +       .mode =3D S_IRUGO
> > +};
> > +
> > +static void ttm_global_kobj_release(struct kobject *kobj);
> > +
> > +static ssize_t ttm_global_show(struct kobject *kobj, struct attribute =
*attr,
> > +                              char *buffer)
> > +{
> > +       struct ttm_global *glob =3D container_of(kobj, struct ttm_globa=
l, kobj);
> > +
> > +       return snprintf(buffer, PAGE_SIZE, "%d\n",
> > +                               atomic_read(&glob->bo_count));
> > +}
> > +
> > +static struct attribute *ttm_global_attrs[] =3D {
> > +       &ttm_bo_count,
> > +       NULL
> > +};
> > +
> > +static const struct sysfs_ops ttm_global_ops =3D {
> > +       .show =3D &ttm_global_show
> > +};
> > +
> > +static struct kobj_type ttm_glob_kobj_type  =3D {
> > +       .release =3D &ttm_global_kobj_release,
> > +       .sysfs_ops =3D &ttm_global_ops,
> > +       .default_attrs =3D ttm_global_attrs
> > +};
> > +
> > +static void ttm_global_kobj_release(struct kobject *kobj)
> > +{
> > +       struct ttm_global *glob =3D
> > +               container_of(kobj, struct ttm_global, kobj);
> > +
> > +       __free_page(glob->dummy_read_page);
> > +}
> > +
> > +static void ttm_global_release(void)
> > +{
> > +       struct ttm_global *glob =3D &ttm_glob;
> > +
> > +       mutex_lock(&ttm_global_mutex);
> > +       if (--ttm_glob_use_count > 0)
> > +               goto out;
> > +
> > +       kobject_del(&glob->kobj);
> > +       kobject_put(&glob->kobj);
> > +       ttm_mem_global_release(&ttm_mem_glob);
> > +       memset(glob, 0, sizeof(*glob));
> > +out:
> > +       mutex_unlock(&ttm_global_mutex);
> > +}
> > +
> > +static int ttm_global_init(void)
> > +{
> > +       struct ttm_global *glob =3D &ttm_glob;
> > +       int ret =3D 0;
> > +       unsigned i;
> > +
> > +       mutex_lock(&ttm_global_mutex);
> > +       if (++ttm_glob_use_count > 1)
> > +               goto out;
> > +
> > +       ret =3D ttm_mem_global_init(&ttm_mem_glob);
> > +       if (ret)
> > +               goto out;
> > +
> > +       spin_lock_init(&glob->lru_lock);
> > +       glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
> > +
> > +       if (unlikely(glob->dummy_read_page =3D=3D NULL)) {
> > +               ret =3D -ENOMEM;
> > +               goto out;
> > +       }
> > +
> > +       for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> > +               INIT_LIST_HEAD(&glob->swap_lru[i]);
> > +       INIT_LIST_HEAD(&glob->device_list);
> > +       atomic_set(&glob->bo_count, 0);
> > +
> > +       ret =3D kobject_init_and_add(
> > +               &glob->kobj, &ttm_glob_kobj_type, ttm_get_kobj(), "buff=
er_objects");
> > +       if (unlikely(ret !=3D 0))
> > +               kobject_put(&glob->kobj);
> > +out:
> > +       mutex_unlock(&ttm_global_mutex);
> > +       return ret;
> > +}
> > +
> > +static void ttm_init_sysman(struct ttm_device *bdev)
> > +{
> > +       struct ttm_resource_manager *man =3D &bdev->sysman;
> > +
> > +       /*
> > +        * Initialize the system memory buffer type.
> > +        * Other types need to be driver / IOCTL initialized.
> > +        */
> > +       man->use_tt =3D true;
> > +
> > +       ttm_resource_manager_init(man, 0);
> > +       ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
> > +       ttm_resource_manager_set_used(man, true);
> > +}
> > +
> > +static void ttm_device_delayed_workqueue(struct work_struct *work)
> > +{
> > +       struct ttm_device *bdev =3D
> > +               container_of(work, struct ttm_device, wq.work);
> > +
> > +       if (!ttm_bo_delayed_delete(bdev, false))
> > +               schedule_delayed_work(&bdev->wq,
> > +                                     ((HZ / 100) < 1) ? 1 : HZ / 100);
> > +}
> > +
> > +int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *=
funcs,
> > +                   struct address_space *mapping,
> > +                   struct drm_vma_offset_manager *vma_manager,
> > +                   bool need_dma32)
> > +{
> > +       struct ttm_global *glob =3D &ttm_glob;
> > +       int ret;
> > +
> > +       if (WARN_ON(vma_manager =3D=3D NULL))
> > +               return -EINVAL;
> > +
> > +       ret =3D ttm_global_init();
> > +       if (ret)
> > +               return ret;
> > +
> > +       bdev->funcs =3D funcs;
> > +
> > +       ttm_init_sysman(bdev);
> > +
> > +       bdev->vma_manager =3D vma_manager;
> > +       INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> > +       INIT_LIST_HEAD(&bdev->ddestroy);
> > +       bdev->dev_mapping =3D mapping;
> > +       bdev->need_dma32 =3D need_dma32;
> > +       mutex_lock(&ttm_global_mutex);
> > +       list_add_tail(&bdev->device_list, &glob->device_list);
> > +       mutex_unlock(&ttm_global_mutex);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL(ttm_device_init);
> > +
> > +int ttm_device_release(struct ttm_device *bdev)
> > +{
> > +       struct ttm_global *glob =3D &ttm_glob;
> > +       struct ttm_resource_manager *man;
> > +       int ret =3D 0;
> > +       unsigned i;
> > +
> > +       man =3D ttm_manager_type(bdev, TTM_PL_SYSTEM);
> > +       ttm_resource_manager_set_used(man, false);
> > +       ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> > +
> > +       mutex_lock(&ttm_global_mutex);
> > +       list_del(&bdev->device_list);
> > +       mutex_unlock(&ttm_global_mutex);
> > +
> > +       cancel_delayed_work_sync(&bdev->wq);
> > +
> > +       if (ttm_bo_delayed_delete(bdev, true))
> > +               pr_debug("Delayed destroy list was clean\n");
> > +
> > +       spin_lock(&glob->lru_lock);
> > +       for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> > +               if (list_empty(&man->lru[0]))
> > +                       pr_debug("Swap list %d was clean\n", i);
> > +       spin_unlock(&glob->lru_lock);
> > +
> > +       if (!ret)
> > +               ttm_global_release();
> > +
> > +       return ret;
> > +}
> > +EXPORT_SYMBOL(ttm_device_release);
> > diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/t=
tm/ttm_execbuf_util.c
> > index 8a8f1a6a83a6..b98eb4c1e5ec 100644
> > --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> > @@ -51,14 +51,14 @@ void ttm_eu_backoff_reservation(struct ww_acquire_c=
tx *ticket,
> >         if (list_empty(list))
> >                 return;
> >
> > -       spin_lock(&ttm_bo_glob.lru_lock);
> > +       spin_lock(&ttm_glob.lru_lock);
> >         list_for_each_entry(entry, list, head) {
> >                 struct ttm_buffer_object *bo =3D entry->bo;
> >
> >                 ttm_bo_move_to_lru_tail(bo, NULL);
> >                 dma_resv_unlock(bo->base.resv);
> >         }
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >
> >         if (ticket)
> >                 ww_acquire_fini(ticket);
> > @@ -154,7 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_=
ctx *ticket,
> >         if (list_empty(list))
> >                 return;
> >
> > -       spin_lock(&ttm_bo_glob.lru_lock);
> > +       spin_lock(&ttm_glob.lru_lock);
> >         list_for_each_entry(entry, list, head) {
> >                 struct ttm_buffer_object *bo =3D entry->bo;
> >
> > @@ -165,7 +165,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_=
ctx *ticket,
> >                 ttm_bo_move_to_lru_tail(bo, NULL);
> >                 dma_resv_unlock(bo->base.resv);
> >         }
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >         if (ticket)
> >                 ww_acquire_fini(ticket);
> >  }
> > diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm=
_memory.c
> > index 89d50f38c0f2..6a6c1072d831 100644
> > --- a/drivers/gpu/drm/ttm/ttm_memory.c
> > +++ b/drivers/gpu/drm/ttm/ttm_memory.c
> > @@ -275,7 +275,7 @@ static void ttm_shrink(struct ttm_mem_global *glob,=
 bool from_wq,
> >
> >         while (ttm_zones_above_swap_target(glob, from_wq, extra)) {
> >                 spin_unlock(&glob->lock);
> > -               ret =3D ttm_bo_swapout(&ttm_bo_glob, ctx);
> > +               ret =3D ttm_bo_swapout(&ttm_glob, ctx);
> >                 spin_lock(&glob->lock);
> >                 if (unlikely(ret !=3D 0))
> >                         break;
> > diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/=
ttm/ttm_range_manager.c
> > index 1da0e277c511..bd3c6c6b4328 100644
> > --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> > +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> > @@ -112,7 +112,7 @@ static void ttm_range_man_free(struct ttm_resource_=
manager *man,
> >
> >  static const struct ttm_resource_manager_func ttm_range_manager_func;
> >
> > -int ttm_range_man_init(struct ttm_bo_device *bdev,
> > +int ttm_range_man_init(struct ttm_device *bdev,
> >                        unsigned type, bool use_tt,
> >                        unsigned long p_size)
> >  {
> > @@ -139,7 +139,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
> >  }
> >  EXPORT_SYMBOL(ttm_range_man_init);
> >
> > -int ttm_range_man_fini(struct ttm_bo_device *bdev,
> > +int ttm_range_man_fini(struct ttm_device *bdev,
> >                        unsigned type)
> >  {
> >         struct ttm_resource_manager *man =3D ttm_manager_type(bdev, typ=
e);
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/t=
tm_resource.c
> > index b325b9264203..7faa4a6ae28f 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -83,7 +83,7 @@ EXPORT_SYMBOL(ttm_resource_manager_init);
> >   * Force all the objects out of a memory manager until clean.
> >   * Part of memory manager cleanup sequence.
> >   */
> > -int ttm_resource_manager_force_list_clean(struct ttm_bo_device *bdev,
> > +int ttm_resource_manager_force_list_clean(struct ttm_device *bdev,
> >                                           struct ttm_resource_manager *=
man)
> >  {
> >         struct ttm_operation_ctx ctx =3D {
> > @@ -91,7 +91,7 @@ int ttm_resource_manager_force_list_clean(struct ttm_=
bo_device *bdev,
> >                 .no_wait_gpu =3D false,
> >                 .flags =3D TTM_OPT_FLAG_FORCE_ALLOC
> >         };
> > -       struct ttm_bo_global *glob =3D &ttm_bo_glob;
> > +       struct ttm_global *glob =3D &ttm_glob;
> >         struct dma_fence *fence;
> >         int ret;
> >         unsigned i;
> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> > index 3e5dd6271d4c..95dffee8299d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -44,7 +44,7 @@
> >   */
> >  int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         uint32_t page_flags =3D 0;
> >
> >         dma_resv_assert_held(bo->base.resv);
> > @@ -73,7 +73,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool =
zero_alloc)
> >                 return -EINVAL;
> >         }
> >
> > -       bo->ttm =3D bdev->driver->ttm_tt_create(bo, page_flags);
> > +       bo->ttm =3D bdev->funcs->ttm_tt_create(bo, page_flags);
> >         if (unlikely(bo->ttm =3D=3D NULL))
> >                 return -ENOMEM;
> >
> > @@ -114,7 +114,7 @@ static int ttm_sg_tt_alloc_page_directory(struct tt=
m_dma_tt *ttm)
> >         return 0;
> >  }
> >
> > -void ttm_tt_destroy_common(struct ttm_bo_device *bdev, struct ttm_tt *=
ttm)
> > +void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
> >  {
> >         ttm_tt_unpopulate(bdev, ttm);
> >
> > @@ -125,9 +125,9 @@ void ttm_tt_destroy_common(struct ttm_bo_device *bd=
ev, struct ttm_tt *ttm)
> >  }
> >  EXPORT_SYMBOL(ttm_tt_destroy_common);
> >
> > -void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> > +void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
> >  {
> > -       bdev->driver->ttm_tt_destroy(bdev, ttm);
> > +       bdev->funcs->ttm_tt_destroy(bdev, ttm);
> >  }
> >
> >  static void ttm_tt_init_fields(struct ttm_tt *ttm,
> > @@ -258,7 +258,7 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
> >         return ret;
> >  }
> >
> > -int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> > +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm)
> >  {
> >         struct address_space *swap_space;
> >         struct file *swap_storage;
> > @@ -308,7 +308,7 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, stru=
ct ttm_tt *ttm)
> >         return ret;
> >  }
> >
> > -static void ttm_tt_add_mapping(struct ttm_bo_device *bdev, struct ttm_=
tt *ttm)
> > +static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt =
*ttm)
> >  {
> >         pgoff_t i;
> >
> > @@ -319,7 +319,7 @@ static void ttm_tt_add_mapping(struct ttm_bo_device=
 *bdev, struct ttm_tt *ttm)
> >                 ttm->pages[i]->mapping =3D bdev->dev_mapping;
> >  }
> >
> > -int ttm_tt_populate(struct ttm_bo_device *bdev,
> > +int ttm_tt_populate(struct ttm_device *bdev,
> >                     struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
> >  {
> >         int ret;
> > @@ -330,8 +330,8 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
> >         if (ttm_tt_is_populated(ttm))
> >                 return 0;
> >
> > -       if (bdev->driver->ttm_tt_populate)
> > -               ret =3D bdev->driver->ttm_tt_populate(bdev, ttm, ctx);
> > +       if (bdev->funcs->ttm_tt_populate)
> > +               ret =3D bdev->funcs->ttm_tt_populate(bdev, ttm, ctx);
> >         else
> >                 ret =3D ttm_pool_populate(ttm, ctx);
> >         if (!ret)
> > @@ -354,15 +354,15 @@ static void ttm_tt_clear_mapping(struct ttm_tt *t=
tm)
> >         }
> >  }
> >
> > -void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
> > +void ttm_tt_unpopulate(struct ttm_device *bdev,
> >                        struct ttm_tt *ttm)
> >  {
> >         if (!ttm_tt_is_populated(ttm))
> >                 return;
> >
> >         ttm_tt_clear_mapping(ttm);
> > -       if (bdev->driver->ttm_tt_unpopulate)
> > -               bdev->driver->ttm_tt_unpopulate(bdev, ttm);
> > +       if (bdev->funcs->ttm_tt_unpopulate)
> > +               bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
> >         else
> >                 ttm_pool_unpopulate(ttm);
> >  }
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmw=
gfx/vmwgfx_blit.c
> > index f21881e087db..d0228eb16147 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> > @@ -465,13 +465,13 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
> >                 dma_resv_assert_held(src->base.resv);
> >
> >         if (!ttm_tt_is_populated(dst->ttm)) {
> > -               ret =3D dst->bdev->driver->ttm_tt_populate(dst->bdev, d=
st->ttm, &ctx);
> > +               ret =3D dst->bdev->funcs->ttm_tt_populate(dst->bdev, ds=
t->ttm, &ctx);
> >                 if (ret)
> >                         return ret;
> >         }
> >
> >         if (!ttm_tt_is_populated(src->ttm)) {
> > -               ret =3D src->bdev->driver->ttm_tt_populate(src->bdev, s=
rc->ttm, &ctx);
> > +               ret =3D src->bdev->funcs->ttm_tt_populate(src->bdev, sr=
c->ttm, &ctx);
> >                 if (ret)
> >                         return ret;
> >         }
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_bo.c
> > index 9a66ba254326..cf8d9f1145de 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> > @@ -546,7 +546,7 @@ int vmw_bo_init(struct vmw_private *dev_priv,
> >                 void (*bo_free)(struct ttm_buffer_object *bo))
> >  {
> >         struct ttm_operation_ctx ctx =3D { interruptible, false };
> > -       struct ttm_bo_device *bdev =3D &dev_priv->bdev;
> > +       struct ttm_device *bdev =3D &dev_priv->bdev;
> >         size_t acc_size;
> >         int ret;
> >         bool user =3D (bo_free =3D=3D &vmw_user_bo_destroy);
> > @@ -1058,7 +1058,7 @@ int vmw_user_bo_reference(struct ttm_object_file =
*tfile,
> >  void vmw_bo_fence_single(struct ttm_buffer_object *bo,
> >                          struct vmw_fence_obj *fence)
> >  {
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >
> >         struct vmw_private *dev_priv =3D
> >                 container_of(bdev, struct vmw_private, bdev);
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_drv.c
> > index bdb7a5e96560..fcda3b76e0df 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > @@ -872,7 +872,7 @@ static int vmw_driver_load(struct drm_device *dev, =
unsigned long chipset)
> >         drm_vma_offset_manager_init(&dev_priv->vma_manager,
> >                                     DRM_FILE_PAGE_OFFSET_START,
> >                                     DRM_FILE_PAGE_OFFSET_SIZE);
> > -       ret =3D ttm_bo_device_init(&dev_priv->bdev,
> > +       ret =3D ttm_device_init(&dev_priv->bdev,
> >                                  &vmw_bo_driver,
> >                                  dev->anon_inode->i_mapping,
> >                                  &dev_priv->vma_manager,
> > @@ -993,7 +993,7 @@ static int vmw_driver_load(struct drm_device *dev, =
unsigned long chipset)
> >                 vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
> >         vmw_vram_manager_fini(dev_priv);
> >  out_no_vram:
> > -       (void)ttm_bo_device_release(&dev_priv->bdev);
> > +       (void)ttm_device_release(&dev_priv->bdev);
> >  out_no_bdev:
> >         vmw_fence_manager_takedown(dev_priv->fman);
> >  out_no_fman:
> > @@ -1045,7 +1045,7 @@ static void vmw_driver_unload(struct drm_device *=
dev)
> >         if (dev_priv->has_mob)
> >                 vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
> >         vmw_vram_manager_fini(dev_priv);
> > -       (void) ttm_bo_device_release(&dev_priv->bdev);
> > +       (void) ttm_device_release(&dev_priv->bdev);
> >         drm_vma_offset_manager_destroy(&dev_priv->vma_manager);
> >         vmw_release_device_late(dev_priv);
> >         vmw_fence_manager_takedown(dev_priv->fman);
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwg=
fx/vmwgfx_drv.h
> > index b45becbb00f8..c8d3e3eeed40 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > @@ -490,7 +490,7 @@ enum vmw_sm_type {
> >  };
> >
> >  struct vmw_private {
> > -       struct ttm_bo_device bdev;
> > +       struct ttm_device bdev;
> >
> >         struct vmw_fifo_state fifo;
> >
> > @@ -1014,7 +1014,7 @@ extern struct ttm_placement vmw_evictable_placeme=
nt;
> >  extern struct ttm_placement vmw_srf_placement;
> >  extern struct ttm_placement vmw_mob_placement;
> >  extern struct ttm_placement vmw_nonfixed_placement;
> > -extern struct ttm_bo_driver vmw_bo_driver;
> > +extern struct ttm_device_funcs vmw_bo_driver;
> >  extern const struct vmw_sg_table *
> >  vmw_bo_sg_table(struct ttm_buffer_object *bo);
> >  extern int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_resource.c
> > index 5e922d9d5f2c..205424017e23 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > @@ -858,7 +858,7 @@ void vmw_query_move_notify(struct ttm_buffer_object=
 *bo,
> >                            struct ttm_resource *mem)
> >  {
> >         struct vmw_buffer_object *dx_query_mob;
> > -       struct ttm_bo_device *bdev =3D bo->bdev;
> > +       struct ttm_device *bdev =3D bo->bdev;
> >         struct vmw_private *dev_priv;
> >
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> > index 975d06c2e35e..81aecd72a971 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > @@ -489,7 +489,7 @@ const struct vmw_sg_table *vmw_bo_sg_table(struct t=
tm_buffer_object *bo)
> >  }
> >
> >
> > -static int vmw_ttm_bind(struct ttm_bo_device *bdev,
> > +static int vmw_ttm_bind(struct ttm_device *bdev,
> >                         struct ttm_tt *ttm, struct ttm_resource *bo_mem)
> >  {
> >         struct vmw_ttm_tt *vmw_be =3D
> > @@ -533,7 +533,7 @@ static int vmw_ttm_bind(struct ttm_bo_device *bdev,
> >         return ret;
> >  }
> >
> > -static void vmw_ttm_unbind(struct ttm_bo_device *bdev,
> > +static void vmw_ttm_unbind(struct ttm_device *bdev,
> >                            struct ttm_tt *ttm)
> >  {
> >         struct vmw_ttm_tt *vmw_be =3D
> > @@ -559,7 +559,7 @@ static void vmw_ttm_unbind(struct ttm_bo_device *bd=
ev,
> >  }
> >
> >
> > -static void vmw_ttm_destroy(struct ttm_bo_device *bdev, struct ttm_tt =
*ttm)
> > +static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *tt=
m)
> >  {
> >         struct vmw_ttm_tt *vmw_be =3D
> >                 container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
> > @@ -579,7 +579,7 @@ static void vmw_ttm_destroy(struct ttm_bo_device *b=
dev, struct ttm_tt *ttm)
> >  }
> >
> >
> > -static int vmw_ttm_populate(struct ttm_bo_device *bdev,
> > +static int vmw_ttm_populate(struct ttm_device *bdev,
> >                             struct ttm_tt *ttm, struct ttm_operation_ct=
x *ctx)
> >  {
> >         struct vmw_ttm_tt *vmw_tt =3D
> > @@ -608,7 +608,7 @@ static int vmw_ttm_populate(struct ttm_bo_device *b=
dev,
> >         return ret;
> >  }
> >
> > -static void vmw_ttm_unpopulate(struct ttm_bo_device *bdev,
> > +static void vmw_ttm_unpopulate(struct ttm_device *bdev,
> >                                struct ttm_tt *ttm)
> >  {
> >         struct vmw_ttm_tt *vmw_tt =3D container_of(ttm, struct vmw_ttm_=
tt,
> > @@ -675,7 +675,7 @@ static int vmw_verify_access(struct ttm_buffer_obje=
ct *bo, struct file *filp)
> >         return vmw_user_bo_verify_access(bo, tfile);
> >  }
> >
> > -static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct t=
tm_resource *mem)
> > +static int vmw_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_=
resource *mem)
> >  {
> >         struct vmw_private *dev_priv =3D container_of(bdev, struct vmw_=
private, bdev);
> >
> > @@ -727,7 +727,7 @@ static void vmw_swap_notify(struct ttm_buffer_objec=
t *bo)
> >  }
> >
> >
> > -struct ttm_bo_driver vmw_bo_driver =3D {
> > +struct ttm_device_funcs vmw_bo_driver =3D {
> >         .ttm_tt_create =3D &vmw_ttm_tt_create,
> >         .ttm_tt_populate =3D &vmw_ttm_populate,
> >         .ttm_tt_unpopulate =3D &vmw_ttm_unpopulate,
> > diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> > index 128f88174d32..5e92d7014125 100644
> > --- a/include/drm/drm_gem_vram_helper.h
> > +++ b/include/drm/drm_gem_vram_helper.h
> > @@ -172,19 +172,19 @@ struct drm_vram_mm {
> >         uint64_t vram_base;
> >         size_t vram_size;
> >
> > -       struct ttm_bo_device bdev;
> > +       struct ttm_device bdev;
> >  };
> >
> >  /**
> >   * drm_vram_mm_of_bdev() - \
> > -       Returns the container of type &struct ttm_bo_device for field b=
dev.
> > +       Returns the container of type &struct ttm_device for field bdev.
> >   * @bdev:      the TTM BO device
> >   *
> >   * Returns:
> >   * The containing instance of &struct drm_vram_mm
> >   */
> >  static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
> > -       struct ttm_bo_device *bdev)
> > +       struct ttm_device *bdev)
> >  {
> >         return container_of(bdev, struct drm_vram_mm, bdev);
> >  }
> > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > index c96a25d571c8..a02935e0d121 100644
> > --- a/include/drm/ttm/ttm_bo_api.h
> > +++ b/include/drm/ttm/ttm_bo_api.h
> > @@ -44,9 +44,9 @@
> >
> >  #include "ttm_resource.h"
> >
> > -struct ttm_bo_global;
> > +struct ttm_global;
> >
> > -struct ttm_bo_device;
> > +struct ttm_device;
> >
> >  struct drm_mm_node;
> >
> > @@ -120,7 +120,7 @@ struct ttm_buffer_object {
> >          * Members constant at init.
> >          */
> >
> > -       struct ttm_bo_device *bdev;
> > +       struct ttm_device *bdev;
> >         enum ttm_bo_type type;
> >         void (*destroy) (struct ttm_buffer_object *);
> >         unsigned long num_pages;
> > @@ -310,7 +310,7 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
> >   * @bulk: optional bulk move structure to remember BO positions
> >   *
> >   * Move this BO to the tail of all lru lists used to lookup and reserv=
e an
> > - * object. This function must be called with struct ttm_bo_global::lru=
_lock
> > + * object. This function must be called with struct ttm_global::lru_lo=
ck
> >   * held, and is used to make a BO less likely to be considered for evi=
ction.
> >   */
> >  void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
> > @@ -322,7 +322,7 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_obje=
ct *bo,
> >   * @bulk: bulk move structure
> >   *
> >   * Bulk move BOs to the LRU tail, only valid to use when driver makes =
sure that
> > - * BO order never changes. Should be called with ttm_bo_global::lru_lo=
ck held.
> > + * BO order never changes. Should be called with ttm_global::lru_lock =
held.
> >   */
> >  void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
> >
> > @@ -333,14 +333,14 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bul=
k_move *bulk);
> >   * Returns
> >   * True if the workqueue was queued at the time
> >   */
> > -int ttm_bo_lock_delayed_workqueue(struct ttm_bo_device *bdev);
> > +int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev);
> >
> >  /**
> >   * ttm_bo_unlock_delayed_workqueue
> >   *
> >   * Allows the delayed workqueue to run.
> >   */
> > -void ttm_bo_unlock_delayed_workqueue(struct ttm_bo_device *bdev, int r=
esched);
> > +void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resc=
hed);
> >
> >  /**
> >   * ttm_bo_eviction_valuable
> > @@ -353,14 +353,14 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_b=
o_device *bdev, int resched);
> >  bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> >                               const struct ttm_place *place);
> >
> > -size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
> > +size_t ttm_bo_dma_acc_size(struct ttm_device *bdev,
> >                            unsigned long bo_size,
> >                            unsigned struct_size);
> >
> >  /**
> >   * ttm_bo_init_reserved
> >   *
> > - * @bdev: Pointer to a ttm_bo_device struct.
> > + * @bdev: Pointer to a ttm_device struct.
> >   * @bo: Pointer to a ttm_buffer_object to be initialized.
> >   * @size: Requested size of buffer object.
> >   * @type: Requested type of buffer object.
> > @@ -392,7 +392,7 @@ size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bd=
ev,
> >   * -ERESTARTSYS: Interrupted by signal while sleeping waiting for reso=
urces.
> >   */
> >
> > -int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
> > +int ttm_bo_init_reserved(struct ttm_device *bdev,
> >                          struct ttm_buffer_object *bo,
> >                          unsigned long size,
> >                          enum ttm_bo_type type,
> > @@ -407,7 +407,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
> >  /**
> >   * ttm_bo_init
> >   *
> > - * @bdev: Pointer to a ttm_bo_device struct.
> > + * @bdev: Pointer to a ttm_device struct.
> >   * @bo: Pointer to a ttm_buffer_object to be initialized.
> >   * @size: Requested size of buffer object.
> >   * @type: Requested type of buffer object.
> > @@ -441,7 +441,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
> >   * -EINVAL: Invalid placement flags.
> >   * -ERESTARTSYS: Interrupted by signal while sleeping waiting for reso=
urces.
> >   */
> > -int ttm_bo_init(struct ttm_bo_device *bdev, struct ttm_buffer_object *=
bo,
> > +int ttm_bo_init(struct ttm_device *bdev, struct ttm_buffer_object *bo,
> >                 unsigned long size, enum ttm_bo_type type,
> >                 struct ttm_placement *placement,
> >                 uint32_t page_alignment, bool interrubtible, size_t acc=
_size,
> > @@ -451,7 +451,7 @@ int ttm_bo_init(struct ttm_bo_device *bdev, struct =
ttm_buffer_object *bo,
> >  /**
> >   * ttm_bo_evict_mm
> >   *
> > - * @bdev: Pointer to a ttm_bo_device struct.
> > + * @bdev: Pointer to a ttm_device struct.
> >   * @mem_type: The memory type.
> >   *
> >   * Evicts all buffers on the lru list of the memory type.
> > @@ -459,14 +459,14 @@ int ttm_bo_init(struct ttm_bo_device *bdev, struc=
t ttm_buffer_object *bo,
> >   * out-of-memory-space-due-to-fragmentation handler.
> >   * The caller must make sure that there are no other processes
> >   * currently validating buffers, and can do that by taking the
> > - * struct ttm_bo_device::ttm_lock in write mode.
> > + * struct ttm_device::ttm_lock in write mode.
> >   *
> >   * Returns:
> >   * -EINVAL: Invalid or uninitialized memory type.
> >   * -ERESTARTSYS: The call was interrupted by a signal while waiting to
> >   * evict a buffer.
> >   */
> > -int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type);
> > +int ttm_bo_evict_mm(struct ttm_device *bdev, unsigned mem_type);
> >
> >  /**
> >   * ttm_kmap_obj_virtual
> > @@ -529,18 +529,18 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, s=
truct ttm_buffer_object *bo);
> >   *
> >   * @filp:      filp as input from the mmap method.
> >   * @vma:       vma as input from the mmap method.
> > - * @bdev:      Pointer to the ttm_bo_device with the address space man=
ager.
> > + * @bdev:      Pointer to the ttm_device with the address space manage=
r.
> >   *
> >   * This function is intended to be called by the device mmap method.
> >   * if the device address space is to be backed by the bo manager.
> >   */
> >  int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
> > -               struct ttm_bo_device *bdev);
> > +               struct ttm_device *bdev);
> >
> >  /**
> >   * ttm_bo_io
> >   *
> > - * @bdev:      Pointer to the struct ttm_bo_device.
> > + * @bdev:      Pointer to the struct ttm_device.
> >   * @filp:      Pointer to the struct file attempting to read / write.
> >   * @wbuf:      User-space pointer to address of buffer to write. NULL =
on read.
> >   * @rbuf:      User-space pointer to address of buffer to read into.
> > @@ -557,12 +557,11 @@ int ttm_bo_mmap(struct file *filp, struct vm_area=
_struct *vma,
> >   * the function may return -ERESTARTSYS if
> >   * interrupted by a signal.
> >   */
> > -ssize_t ttm_bo_io(struct ttm_bo_device *bdev, struct file *filp,
> > +ssize_t ttm_bo_io(struct ttm_device *bdev, struct file *filp,
> >                   const char __user *wbuf, char __user *rbuf,
> >                   size_t count, loff_t *f_pos, bool write);
> >
> > -int ttm_bo_swapout(struct ttm_bo_global *glob,
> > -                       struct ttm_operation_ctx *ctx);
> > +int ttm_bo_swapout(struct ttm_global *glob, struct ttm_operation_ctx *=
ctx);
> >  void ttm_bo_swapout_all(void);
> >
> >  /**
> > @@ -609,7 +608,7 @@ static inline void ttm_bo_unpin(struct ttm_buffer_o=
bject *bo)
> >         --bo->pin_count;
> >  }
> >
> > -int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> > +int ttm_mem_evict_first(struct ttm_device *bdev,
> >                         struct ttm_resource_manager *man,
> >                         const struct ttm_place *place,
> >                         struct ttm_operation_ctx *ctx,
> > @@ -634,5 +633,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
> >
> >  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >                      void *buf, int len, int write);
> > +bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
> >
> >  #endif
> > diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> > index a028b418c6b4..63801fa9e993 100644
> > --- a/include/drm/ttm/ttm_bo_driver.h
> > +++ b/include/drm/ttm/ttm_bo_driver.h
> > @@ -37,331 +37,14 @@
> >  #include <linux/spinlock.h>
> >  #include <linux/dma-resv.h>
> >
> > +#include <drm/ttm/ttm_device.h>
> > +
> >  #include "ttm_bo_api.h"
> >  #include "ttm_memory.h"
> >  #include "ttm_module.h"
> >  #include "ttm_placement.h"
> >  #include "ttm_tt.h"
> >
> > -/**
> > - * struct ttm_bo_driver
> > - *
> > - * @create_ttm_backend_entry: Callback to create a struct ttm_backend.
> > - * @evict_flags: Callback to obtain placement flags when a buffer is e=
victed.
> > - * @move: Callback for a driver to hook in accelerated functions to
> > - * move a buffer.
> > - * If set to NULL, a potentially slow memcpy() move is used.
> > - */
> > -
> > -struct ttm_bo_driver {
> > -       /**
> > -        * ttm_tt_create
> > -        *
> > -        * @bo: The buffer object to create the ttm for.
> > -        * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX fl=
ags.
> > -        *
> > -        * Create a struct ttm_tt to back data with system memory pages.
> > -        * No pages are actually allocated.
> > -        * Returns:
> > -        * NULL: Out of memory.
> > -        */
> > -       struct ttm_tt *(*ttm_tt_create)(struct ttm_buffer_object *bo,
> > -                                       uint32_t page_flags);
> > -
> > -       /**
> > -        * ttm_tt_populate
> > -        *
> > -        * @ttm: The struct ttm_tt to contain the backing pages.
> > -        *
> > -        * Allocate all backing pages
> > -        * Returns:
> > -        * -ENOMEM: Out of memory.
> > -        */
> > -       int (*ttm_tt_populate)(struct ttm_bo_device *bdev,
> > -                              struct ttm_tt *ttm,
> > -                              struct ttm_operation_ctx *ctx);
> > -
> > -       /**
> > -        * ttm_tt_unpopulate
> > -        *
> > -        * @ttm: The struct ttm_tt to contain the backing pages.
> > -        *
> > -        * Free all backing page
> > -        */
> > -       void (*ttm_tt_unpopulate)(struct ttm_bo_device *bdev, struct tt=
m_tt *ttm);
> > -
> > -       /**
> > -        * ttm_tt_bind
> > -        *
> > -        * @bdev: Pointer to a ttm device
> > -        * @ttm: Pointer to a struct ttm_tt.
> > -        * @bo_mem: Pointer to a struct ttm_resource describing the
> > -        * memory type and location for binding.
> > -        *
> > -        * Bind the backend pages into the aperture in the location
> > -        * indicated by @bo_mem. This function should be able to handle
> > -        * differences between aperture and system page sizes.
> > -        */
> > -       int (*ttm_tt_bind)(struct ttm_bo_device *bdev, struct ttm_tt *t=
tm, struct ttm_resource *bo_mem);
> > -
> > -       /**
> > -        * ttm_tt_unbind
> > -        *
> > -        * @bdev: Pointer to a ttm device
> > -        * @ttm: Pointer to a struct ttm_tt.
> > -        *
> > -        * Unbind previously bound backend pages. This function should =
be
> > -        * able to handle differences between aperture and system page =
sizes.
> > -        */
> > -       void (*ttm_tt_unbind)(struct ttm_bo_device *bdev, struct ttm_tt=
 *ttm);
> > -
> > -       /**
> > -        * ttm_tt_destroy
> > -        *
> > -        * @bdev: Pointer to a ttm device
> > -        * @ttm: Pointer to a struct ttm_tt.
> > -        *
> > -        * Destroy the backend. This will be call back from ttm_tt_dest=
roy so
> > -        * don't call ttm_tt_destroy from the callback or infinite loop.
> > -        */
> > -       void (*ttm_tt_destroy)(struct ttm_bo_device *bdev, struct ttm_t=
t *ttm);
> > -
> > -       /**
> > -        * struct ttm_bo_driver member eviction_valuable
> > -        *
> > -        * @bo: the buffer object to be evicted
> > -        * @place: placement we need room for
> > -        *
> > -        * Check with the driver if it is valuable to evict a BO to mak=
e room
> > -        * for a certain placement.
> > -        */
> > -       bool (*eviction_valuable)(struct ttm_buffer_object *bo,
> > -                                 const struct ttm_place *place);
> > -       /**
> > -        * struct ttm_bo_driver member evict_flags:
> > -        *
> > -        * @bo: the buffer object to be evicted
> > -        *
> > -        * Return the bo flags for a buffer which is not mapped to the =
hardware.
> > -        * These will be placed in proposed_flags so that when the move=
 is
> > -        * finished, they'll end up in bo->mem.flags
> > -        */
> > -
> > -       void (*evict_flags)(struct ttm_buffer_object *bo,
> > -                           struct ttm_placement *placement);
> > -
> > -       /**
> > -        * struct ttm_bo_driver member move:
> > -        *
> > -        * @bo: the buffer to move
> > -        * @evict: whether this motion is evicting the buffer from
> > -        * the graphics address space
> > -        * @ctx: context for this move with parameters
> > -        * @new_mem: the new memory region receiving the buffer
> > -        *
> > -        * Move a buffer between two memory regions.
> > -        */
> > -       int (*move)(struct ttm_buffer_object *bo, bool evict,
> > -                   struct ttm_operation_ctx *ctx,
> > -                   struct ttm_resource *new_mem);
> > -
> > -       /**
> > -        * struct ttm_bo_driver_member verify_access
> > -        *
> > -        * @bo: Pointer to a buffer object.
> > -        * @filp: Pointer to a struct file trying to access the object.
> > -        *
> > -        * Called from the map / write / read methods to verify that the
> > -        * caller is permitted to access the buffer object.
> > -        * This member may be set to NULL, which will refuse this kind =
of
> > -        * access for all buffer objects.
> > -        * This function should return 0 if access is granted, -EPERM o=
therwise.
> > -        */
> > -       int (*verify_access)(struct ttm_buffer_object *bo,
> > -                            struct file *filp);
> > -
> > -       /**
> > -        * Hook to notify driver about a driver move so it
> > -        * can do tiling things and book-keeping.
> > -        *
> > -        * @evict: whether this move is evicting the buffer from the gr=
aphics
> > -        * address space
> > -        */
> > -       void (*move_notify)(struct ttm_buffer_object *bo,
> > -                           bool evict,
> > -                           struct ttm_resource *new_mem);
> > -
> > -       /**
> > -        * notify the driver that we're about to swap out this bo
> > -        */
> > -       void (*swap_notify)(struct ttm_buffer_object *bo);
> > -
> > -       /**
> > -        * Driver callback on when mapping io memory (for bo_move_memcpy
> > -        * for instance). TTM will take care to call io_mem_free whenev=
er
> > -        * the mapping is not use anymore. io_mem_reserve & io_mem_free
> > -        * are balanced.
> > -        */
> > -       int (*io_mem_reserve)(struct ttm_bo_device *bdev,
> > -                             struct ttm_resource *mem);
> > -       void (*io_mem_free)(struct ttm_bo_device *bdev,
> > -                           struct ttm_resource *mem);
> > -
> > -       /**
> > -        * Return the pfn for a given page_offset inside the BO.
> > -        *
> > -        * @bo: the BO to look up the pfn for
> > -        * @page_offset: the offset to look up
> > -        */
> > -       unsigned long (*io_mem_pfn)(struct ttm_buffer_object *bo,
> > -                                   unsigned long page_offset);
> > -
> > -       /**
> > -        * Read/write memory buffers for ptrace access
> > -        *
> > -        * @bo: the BO to access
> > -        * @offset: the offset from the start of the BO
> > -        * @buf: pointer to source/destination buffer
> > -        * @len: number of bytes to copy
> > -        * @write: whether to read (0) from or write (non-0) to BO
> > -        *
> > -        * If successful, this function should return the number of
> > -        * bytes copied, -EIO otherwise. If the number of bytes
> > -        * returned is < len, the function may be called again with
> > -        * the remainder of the buffer to copy.
> > -        */
> > -       int (*access_memory)(struct ttm_buffer_object *bo, unsigned lon=
g offset,
> > -                            void *buf, int len, int write);
> > -
> > -       /**
> > -        * struct ttm_bo_driver member del_from_lru_notify
> > -        *
> > -        * @bo: the buffer object deleted from lru
> > -        *
> > -        * notify driver that a BO was deleted from LRU.
> > -        */
> > -       void (*del_from_lru_notify)(struct ttm_buffer_object *bo);
> > -
> > -       /**
> > -        * Notify the driver that we're about to release a BO
> > -        *
> > -        * @bo: BO that is about to be released
> > -        *
> > -        * Gives the driver a chance to do any cleanup, including
> > -        * adding fences that may force a delayed delete
> > -        */
> > -       void (*release_notify)(struct ttm_buffer_object *bo);
> > -};
> > -
> > -/**
> > - * struct ttm_bo_global - Buffer object driver global data.
> > - *
> > - * @dummy_read_page: Pointer to a dummy page used for mapping requests
> > - * of unpopulated pages.
> > - * @shrink: A shrink callback object used for buffer object swap.
> > - * @device_list_mutex: Mutex protecting the device list.
> > - * This mutex is held while traversing the device list for pm options.
> > - * @lru_lock: Spinlock protecting the bo subsystem lru lists.
> > - * @device_list: List of buffer object devices.
> > - * @swap_lru: Lru list of buffer objects used for swapping.
> > - */
> > -
> > -extern struct ttm_bo_global {
> > -
> > -       /**
> > -        * Constant after init.
> > -        */
> > -
> > -       struct kobject kobj;
> > -       struct page *dummy_read_page;
> > -       spinlock_t lru_lock;
> > -
> > -       /**
> > -        * Protected by ttm_global_mutex.
> > -        */
> > -       struct list_head device_list;
> > -
> > -       /**
> > -        * Protected by the lru_lock.
> > -        */
> > -       struct list_head swap_lru[TTM_MAX_BO_PRIORITY];
> > -
> > -       /**
> > -        * Internal protection.
> > -        */
> > -       atomic_t bo_count;
> > -} ttm_bo_glob;
> > -
> > -
> > -#define TTM_NUM_MEM_TYPES 8
> > -
> > -/**
> > - * struct ttm_bo_device - Buffer object driver device-specific data.
> > - *
> > - * @driver: Pointer to a struct ttm_bo_driver struct setup by the driv=
er.
> > - * @man: An array of resource_managers.
> > - * @vma_manager: Address space manager (pointer)
> > - * lru_lock: Spinlock that protects the buffer+device lru lists and
> > - * ddestroy lists.
> > - * @dev_mapping: A pointer to the struct address_space representing the
> > - * device address space.
> > - * @wq: Work queue structure for the delayed delete workqueue.
> > - * @no_retry: Don't retry allocation if it fails
> > - *
> > - */
> > -
> > -struct ttm_bo_device {
> > -
> > -       /*
> > -        * Constant after bo device init / atomic.
> > -        */
> > -       struct list_head device_list;
> > -       struct ttm_bo_driver *driver;
> > -       /*
> > -        * access via ttm_manager_type.
> > -        */
> > -       struct ttm_resource_manager sysman;
> > -       struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
> > -       /*
> > -        * Protected by internal locks.
> > -        */
> > -       struct drm_vma_offset_manager *vma_manager;
> > -
> > -       /*
> > -        * Protected by the global:lru lock.
> > -        */
> > -       struct list_head ddestroy;
> > -
> > -       /*
> > -        * Protected by load / firstopen / lastclose /unload sync.
> > -        */
> > -
> > -       struct address_space *dev_mapping;
> > -
> > -       /*
> > -        * Internal protection.
> > -        */
> > -
> > -       struct delayed_work wq;
> > -
> > -       bool need_dma32;
> > -
> > -       bool no_retry;
> > -};
> > -
> > -static inline struct ttm_resource_manager *ttm_manager_type(struct ttm=
_bo_device *bdev,
> > -                                                           int mem_typ=
e)
> > -{
> > -       return bdev->man_drv[mem_type];
> > -}
> > -
> > -static inline void ttm_set_driver_manager(struct ttm_bo_device *bdev,
> > -                                         int type,
> > -                                         struct ttm_resource_manager *=
manager)
> > -{
> > -       bdev->man_drv[type] =3D manager;
> > -}
> > -
> >  /**
> >   * struct ttm_lru_bulk_move_pos
> >   *
> > @@ -418,30 +101,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
> >                      struct ttm_resource *mem,
> >                      struct ttm_operation_ctx *ctx);
> >
> > -int ttm_bo_device_release(struct ttm_bo_device *bdev);
> > -
> > -/**
> > - * ttm_bo_device_init
> > - *
> > - * @bdev: A pointer to a struct ttm_bo_device to initialize.
> > - * @glob: A pointer to an initialized struct ttm_bo_global.
> > - * @driver: A pointer to a struct ttm_bo_driver set up by the caller.
> > - * @mapping: The address space to use for this bo.
> > - * @vma_manager: A pointer to a vma manager.
> > - * @file_page_offset: Offset into the device address space that is ava=
ilable
> > - * for buffer data. This ensures compatibility with other users of the
> > - * address space.
> > - *
> > - * Initializes a struct ttm_bo_device:
> > - * Returns:
> > - * !0: Failure.
> > - */
> > -int ttm_bo_device_init(struct ttm_bo_device *bdev,
> > -                      struct ttm_bo_driver *driver,
> > -                      struct address_space *mapping,
> > -                      struct drm_vma_offset_manager *vma_manager,
> > -                      bool need_dma32);
> > -
> >  /**
> >   * ttm_bo_unmap_virtual
> >   *
> > @@ -531,9 +190,9 @@ static inline int ttm_bo_reserve_slowpath(struct tt=
m_buffer_object *bo,
> >
> >  static inline void ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_=
object *bo)
> >  {
> > -       spin_lock(&ttm_bo_glob.lru_lock);
> > +       spin_lock(&ttm_glob.lru_lock);
> >         ttm_bo_move_to_lru_tail(bo, NULL);
> > -       spin_unlock(&ttm_bo_glob.lru_lock);
> > +       spin_unlock(&ttm_glob.lru_lock);
> >  }
> >
> >  static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
> > @@ -576,9 +235,9 @@ static inline void ttm_bo_unreserve(struct ttm_buff=
er_object *bo)
> >   * ttm_bo_util.c
> >   */
> >
> > -int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
> > +int ttm_mem_io_reserve(struct ttm_device *bdev,
> >                        struct ttm_resource *mem);
> > -void ttm_mem_io_free(struct ttm_bo_device *bdev,
> > +void ttm_mem_io_free(struct ttm_device *bdev,
> >                      struct ttm_resource *mem);
> >  /**
> >   * ttm_bo_move_ttm
> > @@ -706,7 +365,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo=
);
> >   * Initialise a generic range manager for the selected memory type.
> >   * The range manager is installed for this device in the type slot.
> >   */
> > -int ttm_range_man_init(struct ttm_bo_device *bdev,
> > +int ttm_range_man_init(struct ttm_device *bdev,
> >                        unsigned type, bool use_tt,
> >                        unsigned long p_size);
> >
> > @@ -718,7 +377,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
> >   *
> >   * Remove the generic range manager from a slot and tear it down.
> >   */
> > -int ttm_range_man_fini(struct ttm_bo_device *bdev,
> > +int ttm_range_man_fini(struct ttm_device *bdev,
> >                        unsigned type);
> >
> >  #endif
> > diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> > new file mode 100644
> > index 000000000000..75fedd378e8f
> > --- /dev/null
> > +++ b/include/drm/ttm/ttm_device.h
> > @@ -0,0 +1,366 @@
> > +/*
> > + * Copyright 2020 Advanced Micro Devices, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * Authors: Christian K=F6nig
> > + */
> > +
> > +#ifndef _TTM_DEVICE_H_
> > +#define _TTM_DEVICE_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +#include <drm/ttm/ttm_resource.h>
> > +
> > +#define TTM_NUM_MEM_TYPES 8
> > +
> > +struct ttm_device;
> > +struct ttm_resource;
> > +struct ttm_placement;
> > +struct ttm_buffer_object;
> > +struct ttm_operation_ctx;
> > +
> > +/**
> > + * struct ttm_bo_global - Buffer object driver global data.
> > + *
> > + * @dummy_read_page: Pointer to a dummy page used for mapping requests
> > + * of unpopulated pages.
> > + * @shrink: A shrink callback object used for buffer object swap.
> > + * @device_list_mutex: Mutex protecting the device list.
> > + * This mutex is held while traversing the device list for pm options.
> > + * @lru_lock: Spinlock protecting the bo subsystem lru lists.
> > + * @device_list: List of buffer object devices.
> > + * @swap_lru: Lru list of buffer objects used for swapping.
> > + */
> > +extern struct ttm_global {
> > +
> > +       /**
> > +        * Constant after init.
> > +        */
> > +
> > +       struct kobject kobj;
> > +       struct page *dummy_read_page;
> > +       spinlock_t lru_lock;
> > +
> > +       /**
> > +        * Protected by ttm_global_mutex.
> > +        */
> > +       struct list_head device_list;
> > +
> > +       /**
> > +        * Protected by the lru_lock.
> > +        */
> > +       struct list_head swap_lru[TTM_MAX_BO_PRIORITY];
> > +
> > +       /**
> > +        * Internal protection.
> > +        */
> > +       atomic_t bo_count;
> > +} ttm_glob;
> > +
> > +struct ttm_device_funcs {
> > +       /**
> > +        * ttm_tt_create
> > +        *
> > +        * @bo: The buffer object to create the ttm for.
> > +        * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX fl=
ags.
> > +        *
> > +        * Create a struct ttm_tt to back data with system memory pages.
> > +        * No pages are actually allocated.
> > +        * Returns:
> > +        * NULL: Out of memory.
> > +        */
> > +       struct ttm_tt *(*ttm_tt_create)(struct ttm_buffer_object *bo,
> > +                                       uint32_t page_flags);
> > +
> > +       /**
> > +        * ttm_tt_populate
> > +        *
> > +        * @ttm: The struct ttm_tt to contain the backing pages.
> > +        *
> > +        * Allocate all backing pages
> > +        * Returns:
> > +        * -ENOMEM: Out of memory.
> > +        */
> > +       int (*ttm_tt_populate)(struct ttm_device *bdev,
> > +                              struct ttm_tt *ttm,
> > +                              struct ttm_operation_ctx *ctx);
> > +
> > +       /**
> > +        * ttm_tt_unpopulate
> > +        *
> > +        * @ttm: The struct ttm_tt to contain the backing pages.
> > +        *
> > +        * Free all backing page
> > +        */
> > +       void (*ttm_tt_unpopulate)(struct ttm_device *bdev,
> > +                                 struct ttm_tt *ttm);
> > +
> > +       /**
> > +        * ttm_tt_bind
> > +        *
> > +        * @bdev: Pointer to a ttm device
> > +        * @ttm: Pointer to a struct ttm_tt.
> > +        * @bo_mem: Pointer to a struct ttm_resource describing the
> > +        * memory type and location for binding.
> > +        *
> > +        * Bind the backend pages into the aperture in the location
> > +        * indicated by @bo_mem. This function should be able to handle
> > +        * differences between aperture and system page sizes.
> > +        */
> > +       int (*ttm_tt_bind)(struct ttm_device *bdev, struct ttm_tt *ttm,
> > +                          struct ttm_resource *bo_mem);
> > +
> > +       /**
> > +        * ttm_tt_unbind
> > +        *
> > +        * @bdev: Pointer to a ttm device
> > +        * @ttm: Pointer to a struct ttm_tt.
> > +        *
> > +        * Unbind previously bound backend pages. This function should =
be
> > +        * able to handle differences between aperture and system page =
sizes.
> > +        */
> > +       void (*ttm_tt_unbind)(struct ttm_device *bdev, struct ttm_tt *t=
tm);
> > +
> > +       /**
> > +        * ttm_tt_destroy
> > +        *
> > +        * @bdev: Pointer to a ttm device
> > +        * @ttm: Pointer to a struct ttm_tt.
> > +        *
> > +        * Destroy the backend. This will be call back from ttm_tt_dest=
roy so
> > +        * don't call ttm_tt_destroy from the callback or infinite loop.
> > +        */
> > +       void (*ttm_tt_destroy)(struct ttm_device *bdev, struct ttm_tt *=
ttm);
> > +
> > +       /**
> > +        * struct ttm_bo_driver member eviction_valuable
> > +        *
> > +        * @bo: the buffer object to be evicted
> > +        * @place: placement we need room for
> > +        *
> > +        * Check with the driver if it is valuable to evict a BO to mak=
e room
> > +        * for a certain placement.
> > +        */
> > +       bool (*eviction_valuable)(struct ttm_buffer_object *bo,
> > +                                 const struct ttm_place *place);
> > +       /**
> > +        * struct ttm_bo_driver member evict_flags:
> > +        *
> > +        * @bo: the buffer object to be evicted
> > +        *
> > +        * Return the bo flags for a buffer which is not mapped to the =
hardware.
> > +        * These will be placed in proposed_flags so that when the move=
 is
> > +        * finished, they'll end up in bo->mem.flags
> > +        */
> > +
> > +       void (*evict_flags)(struct ttm_buffer_object *bo,
> > +                           struct ttm_placement *placement);
> > +
> > +       /**
> > +        * struct ttm_bo_driver member move:
> > +        *
> > +        * @bo: the buffer to move
> > +        * @evict: whether this motion is evicting the buffer from
> > +        * the graphics address space
> > +        * @ctx: context for this move with parameters
> > +        * @new_mem: the new memory region receiving the buffer
> > +        *
> > +        * Move a buffer between two memory regions.
> > +        */
> > +       int (*move)(struct ttm_buffer_object *bo, bool evict,
> > +                   struct ttm_operation_ctx *ctx,
> > +                   struct ttm_resource *new_mem);
> > +
> > +       /**
> > +        * struct ttm_bo_driver_member verify_access
> > +        *
> > +        * @bo: Pointer to a buffer object.
> > +        * @filp: Pointer to a struct file trying to access the object.
> > +        *
> > +        * Called from the map / write / read methods to verify that the
> > +        * caller is permitted to access the buffer object.
> > +        * This member may be set to NULL, which will refuse this kind =
of
> > +        * access for all buffer objects.
> > +        * This function should return 0 if access is granted, -EPERM o=
therwise.
> > +        */
> > +       int (*verify_access)(struct ttm_buffer_object *bo,
> > +                            struct file *filp);
> > +
> > +       /**
> > +        * Hook to notify driver about a driver move so it
> > +        * can do tiling things and book-keeping.
> > +        *
> > +        * @evict: whether this move is evicting the buffer from the gr=
aphics
> > +        * address space
> > +        */
> > +       void (*move_notify)(struct ttm_buffer_object *bo,
> > +                           bool evict,
> > +                           struct ttm_resource *new_mem);
> > +
> > +       /**
> > +        * notify the driver that we're about to swap out this bo
> > +        */
> > +       void (*swap_notify)(struct ttm_buffer_object *bo);
> > +
> > +       /**
> > +        * Driver callback on when mapping io memory (for bo_move_memcpy
> > +        * for instance). TTM will take care to call io_mem_free whenev=
er
> > +        * the mapping is not use anymore. io_mem_reserve & io_mem_free
> > +        * are balanced.
> > +        */
> > +       int (*io_mem_reserve)(struct ttm_device *bdev,
> > +                             struct ttm_resource *mem);
> > +       void (*io_mem_free)(struct ttm_device *bdev,
> > +                           struct ttm_resource *mem);
> > +
> > +       /**
> > +        * Return the pfn for a given page_offset inside the BO.
> > +        *
> > +        * @bo: the BO to look up the pfn for
> > +        * @page_offset: the offset to look up
> > +        */
> > +       unsigned long (*io_mem_pfn)(struct ttm_buffer_object *bo,
> > +                                   unsigned long page_offset);
> > +
> > +       /**
> > +        * Read/write memory buffers for ptrace access
> > +        *
> > +        * @bo: the BO to access
> > +        * @offset: the offset from the start of the BO
> > +        * @buf: pointer to source/destination buffer
> > +        * @len: number of bytes to copy
> > +        * @write: whether to read (0) from or write (non-0) to BO
> > +        *
> > +        * If successful, this function should return the number of
> > +        * bytes copied, -EIO otherwise. If the number of bytes
> > +        * returned is < len, the function may be called again with
> > +        * the remainder of the buffer to copy.
> > +        */
> > +       int (*access_memory)(struct ttm_buffer_object *bo, unsigned lon=
g offset,
> > +                            void *buf, int len, int write);
> > +
> > +       /**
> > +        * struct ttm_bo_driver member del_from_lru_notify
> > +        *
> > +        * @bo: the buffer object deleted from lru
> > +        *
> > +        * notify driver that a BO was deleted from LRU.
> > +        */
> > +       void (*del_from_lru_notify)(struct ttm_buffer_object *bo);
> > +
> > +       /**
> > +        * Notify the driver that we're about to release a BO
> > +        *
> > +        * @bo: BO that is about to be released
> > +        *
> > +        * Gives the driver a chance to do any cleanup, including
> > +        * adding fences that may force a delayed delete
> > +        */
> > +       void (*release_notify)(struct ttm_buffer_object *bo);
> > +};
> > +
> > +/**
> > + * struct ttm_device - Buffer object driver device-specific data.
> > + *
> > + * @driver: Pointer to a struct ttm_bo_driver struct setup by the driv=
er.
> > + * @man: An array of resource_managers.
> > + * @vma_manager: Address space manager (pointer)
> > + * lru_lock: Spinlock that protects the buffer+device lru lists and
> > + * ddestroy lists.
> > + * @dev_mapping: A pointer to the struct address_space representing the
> > + * device address space.
> > + * @wq: Work queue structure for the delayed delete workqueue.
> > + * @no_retry: Don't retry allocation if it fails
> > + *
> > + */
> > +struct ttm_device {
> > +
> > +       /*
> > +        * Constant after bo device init / atomic.
> > +        */
> > +       struct list_head device_list;
> > +       struct ttm_device_funcs *funcs;
> > +
> > +       /*
> > +        * access via ttm_manager_type.
> > +        */
> > +       struct ttm_resource_manager sysman;
> > +       struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
> > +
> > +       /*
> > +        * Protected by internal locks.
> > +        */
> > +       struct drm_vma_offset_manager *vma_manager;
> > +
> > +       /*
> > +        * Protected by the global:lru lock.
> > +        */
> > +       struct list_head ddestroy;
> > +
> > +       /*
> > +        * Protected by load / firstopen / lastclose /unload sync.
> > +        */
> > +
> > +       struct address_space *dev_mapping;
> > +
> > +       /*
> > +        * Internal protection.
> > +        */
> > +
> > +       struct delayed_work wq;
> > +
> > +       bool need_dma32;
> > +       bool no_retry;
> > +};
> > +
> > +static inline struct ttm_resource_manager *
> > +ttm_manager_type(struct ttm_device *bdev, int mem_type)
> > +{
> > +       return bdev->man_drv[mem_type];
> > +}
> > +
> > +static inline void
> > +ttm_set_driver_manager(struct ttm_device *bdev, int type,
> > +                      struct ttm_resource_manager *manager)
> > +{
> > +       bdev->man_drv[type] =3D manager;
> > +}
> > +
> > +/**
> > + * ttm_device_init
> > + *
> > + * @bdev: A pointer to a struct ttm_device to initialize.
> > + * @funcs: A pointer to a struct ttm_bo_driver set up by the caller.
> > + * @mapping: The address space to use for this bo.
> > + * @vma_manager: A pointer to a vma manager.
> > + * @need_dma32: if page allocations should use DMA32
> > + *
> > + * Initializes a struct ttm_device:
> > + * Returns:
> > + * !0: Failure.
> > + */
> > +int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *=
funcs,
> > +                   struct address_space *mapping,
> > +                   struct drm_vma_offset_manager *vma_manager,
> > +                   bool need_dma32);
> > +int ttm_device_release(struct ttm_device *bdev);
> > +
> > +#endif
> > diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resou=
rce.h
> > index 91b67cecc6b6..a60ffe409b60 100644
> > --- a/include/drm/ttm/ttm_resource.h
> > +++ b/include/drm/ttm/ttm_resource.h
> > @@ -33,7 +33,7 @@
> >
> >  #define TTM_MAX_BO_PRIORITY    4U
> >
> > -struct ttm_bo_device;
> > +struct ttm_device;
> >  struct ttm_resource_manager;
> >  struct ttm_resource;
> >  struct ttm_place;
> > @@ -230,7 +230,7 @@ void ttm_resource_free(struct ttm_buffer_object *bo=
, struct ttm_resource *res);
> >  void ttm_resource_manager_init(struct ttm_resource_manager *man,
> >                                unsigned long p_size);
> >
> > -int ttm_resource_manager_force_list_clean(struct ttm_bo_device *bdev,
> > +int ttm_resource_manager_force_list_clean(struct ttm_device *bdev,
> >                                           struct ttm_resource_manager *=
man);
> >
> >  void ttm_resource_manager_debug(struct ttm_resource_manager *man,
> > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > index e042dec5e6c1..a56067819a58 100644
> > --- a/include/drm/ttm/ttm_tt.h
> > +++ b/include/drm/ttm/ttm_tt.h
> > @@ -48,7 +48,7 @@ struct ttm_operation_ctx;
> >   *
> >   * @pages: Array of pages backing the data.
> >   * @num_pages: Number of pages in the page array.
> > - * @bdev: Pointer to the current struct ttm_bo_device.
> > + * @bdev: Pointer to the current struct ttm_device.
> >   * @be: Pointer to the ttm backend.
> >   * @swap_storage: Pointer to shmem struct file for swap storage.
> >   * @caching_state: The current caching state of the pages.
> > @@ -147,14 +147,14 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma);
> >   *
> >   * Unbind, unpopulate and destroy common struct ttm_tt.
> >   */
> > -void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
> > +void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm);
> >
> >  /**
> >   * ttm_tt_destroy_common:
> >   *
> >   * Called from driver to destroy common path.
> >   */
> > -void ttm_tt_destroy_common(struct ttm_bo_device *bdev, struct ttm_tt *=
ttm);
> > +void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm=
);
> >
> >  /**
> >   * ttm_tt_swapin:
> > @@ -164,7 +164,7 @@ void ttm_tt_destroy_common(struct ttm_bo_device *bd=
ev, struct ttm_tt *ttm);
> >   * Swap in a previously swap out ttm_tt.
> >   */
> >  int ttm_tt_swapin(struct ttm_tt *ttm);
> > -int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
> > +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm);
> >
> >  /**
> >   * ttm_tt_populate - allocate pages for a ttm
> > @@ -173,7 +173,7 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, stru=
ct ttm_tt *ttm);
> >   *
> >   * Calls the driver method to allocate pages for a ttm
> >   */
> > -int ttm_tt_populate(struct ttm_bo_device *bdev, struct ttm_tt *ttm, st=
ruct ttm_operation_ctx *ctx);
> > +int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struc=
t ttm_operation_ctx *ctx);
> >
> >  /**
> >   * ttm_tt_unpopulate - free pages from a ttm
> > @@ -182,7 +182,7 @@ int ttm_tt_populate(struct ttm_bo_device *bdev, str=
uct ttm_tt *ttm, struct ttm_o
> >   *
> >   * Calls the driver method to free all pages from a ttm
> >   */
> > -void ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
> > +void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
> >
> >  #if IS_ENABLED(CONFIG_AGP)
> >  #include <linux/agp_backend.h>
> > --
> > 2.17.1
> >

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
