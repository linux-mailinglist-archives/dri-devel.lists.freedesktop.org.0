Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EEBB59837
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 15:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B1110E371;
	Tue, 16 Sep 2025 13:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2saNWtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F5310E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758030778; x=1789566778;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=cr9wO0fOYw18I0lUVjyX6B9Z07yJeZdgQoCPVawhdkI=;
 b=n2saNWtUgqAn/DLa8DC4Cg+83d5Otv3q9+a7ObZJjU8JrJn+cE9xBfBF
 P9v+Z4k57QKZUguGeHJKS1pamVV1eh5s402dpj3t4cILfTHC6LQQKjlmo
 /J+LSkVQUm+isV+5ZktSZcqipfrmfGZ+GpCtkJ4zhSa2e5ZW9SSqJE17N
 Yqjc4e8lsbGyqbCERkNw69w/56e/FFNvJ+O0da9d+59XYHr1lBKjXZ47B
 jbS5+dwZsskh58cL6qgME+rVLbZSMbd2z3/uT5Xw+OKOT6G8CsoyF88eD
 SO6xN7JRSP5SufVeIOK15DnycYz+v8gu03NRQHdXQzn2Yo8MbRAEi3ls4 Q==;
X-CSE-ConnectionGUID: Z9uNDLGjQ86Szk/KPGFtmQ==
X-CSE-MsgGUID: 1ctov6PNTPaepxALBv/MFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60228257"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60228257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:52:58 -0700
X-CSE-ConnectionGUID: hK9coIDeS3+Y3MhRkmivdA==
X-CSE-MsgGUID: 4fSBMvp7QaCSVLCOfYC/GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="205729441"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.138])
 ([10.245.245.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:52:55 -0700
Message-ID: <ef1200d43e2ca8e56de7cd986b8340684adc6c6e.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: rename ttm_bo_put to _fini v3
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, Jani Nikula	
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue, 16 Sep 2025 15:52:51 +0200
In-Reply-To: <201ca522-a719-44af-950b-50c82758a3c0@amd.com>
References: <20250909144311.1927-1-christian.koenig@amd.com>
 <60ec3476-d141-4900-b87c-5135da6cfdd6@amd.com>
 <76698330f118d2747becab6615f4bfb5caf9e094.camel@linux.intel.com>
 <201ca522-a719-44af-950b-50c82758a3c0@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Tue, 2025-09-16 at 15:38 +0200, Christian K=C3=B6nig wrote:
> On 11.09.25 19:20, Thomas Hellstr=C3=B6m wrote:
> > Hi, Christian,
> >=20
> > On Thu, 2025-09-11 at 12:56 +0200, Christian K=C3=B6nig wrote:
> > > Gentle ping. Thomas can I get an ack on this?
> > >=20
> >=20
> > Sorry for the delay. When I initially saw it i decide to give it
> > some
> > time for CI but now I can't find it there.
> >=20
> > Anyway, for the xe driver
> > Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > The i915 driver maintainers probably want to ack this separately
> > for
> > the i915 driver.
>=20
> @People on CC can I get an ack to merge this through drm-misc-next?
>=20
> It's just a rename of the function without any intentional functional
> change.
>=20
> > I'll see if I can forward this so it's run on i915 and xe CI.
>=20
> Did that yielded any result? My educated guess is that the automated
> rename should always work, but better safe than sorry.

Yes, there were some errors but nothing related to this. So from CI
point of view OK to merge.

Thanks,
Thomas


>=20
> Thanks,
> Christian.
>=20
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > > It's just a rename with no intended technical change.
> > >=20
> > > Thanks,
> > > Christian.
> > >=20
> > > On 09.09.25 16:43, Christian K=C3=B6nig wrote:
> > > > Give TTM BOs a separate cleanup function.
> > > >=20
> > > > No funktional change, but the next step in removing the TTM BO
> > > > reference
> > > > counting and replacing it with the GEM object reference
> > > > counting.
> > > >=20
> > > > v2: move the code around a bit to make it clearer what's
> > > > happening
> > > > v3: fix nouveau_bo_fini as well
> > > >=20
> > > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/gpu/drm/drm_gem_vram_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +-
> > > > =C2=A0drivers/gpu/drm/i915/gem/i915_gem_ttm.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > =C2=A0drivers/gpu/drm/loongson/lsdc_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/gpu/drm/nouveau/nouveau_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/gpu/drm/nouveau/nouveau_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/gpu/drm/qxl/qxl_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-
> > > > =C2=A0drivers/gpu/drm/radeon/radeon_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/gpu/drm/ttm/tests/ttm_bo_test.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 12 ++--
> > > > =C2=A0.../gpu/drm/ttm/tests/ttm_bo_validate_test.c=C2=A0 | 60 +++++=
++++--
> > > > ----
> > > > ----
> > > > =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 =
+++--
> > > > =C2=A0drivers/gpu/drm/ttm/ttm_bo_internal.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> > > > =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A015 files changed, 59 insertions(+), 58 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > index 6626a6e64ff5..0a5b204086f3 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > @@ -198,7 +198,7 @@ static void amdgpu_gem_object_free(struct
> > > > drm_gem_object *gobj)
> > > > =C2=A0	struct amdgpu_bo *aobj =3D gem_to_amdgpu_bo(gobj);
> > > > =C2=A0
> > > > =C2=A0	amdgpu_hmm_unregister(aobj);
> > > > -	ttm_bo_put(&aobj->tbo);
> > > > +	ttm_bo_fini(&aobj->tbo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0int amdgpu_gem_object_create(struct amdgpu_device *adev,
> > > > unsigned
> > > > long size,
> > > > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > index b04cde4a60e7..90760d0ca071 100644
> > > > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > @@ -107,7 +107,7 @@ static const struct drm_gem_object_funcs
> > > > drm_gem_vram_object_funcs;
> > > > =C2=A0
> > > > =C2=A0static void drm_gem_vram_cleanup(struct drm_gem_vram_object
> > > > *gbo)
> > > > =C2=A0{
> > > > -	/* We got here via ttm_bo_put(), which means that the
> > > > +	/* We got here via ttm_bo_fini(), which means that the
> > > > =C2=A0	 * TTM buffer object in 'bo' has already been cleaned
> > > > =C2=A0	 * up; only release the GEM object.
> > > > =C2=A0	 */
> > > > @@ -234,11 +234,11 @@ EXPORT_SYMBOL(drm_gem_vram_create);
> > > > =C2=A0 * drm_gem_vram_put() - Releases a reference to a VRAM-backed
> > > > GEM
> > > > object
> > > > =C2=A0 * @gbo:	the GEM VRAM object
> > > > =C2=A0 *
> > > > - * See ttm_bo_put() for more information.
> > > > + * See ttm_bo_fini() for more information.
> > > > =C2=A0 */
> > > > =C2=A0void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
> > > > =C2=A0{
> > > > -	ttm_bo_put(&gbo->bo);
> > > > +	ttm_bo_fini(&gbo->bo);
> > > > =C2=A0}
> > > > =C2=A0EXPORT_SYMBOL(drm_gem_vram_put);
> > > > =C2=A0
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > index 1f4814968868..57bb111d65da 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > @@ -1029,7 +1029,7 @@ static void i915_ttm_delayed_free(struct
> > > > drm_i915_gem_object *obj)
> > > > =C2=A0{
> > > > =C2=A0	GEM_BUG_ON(!obj->ttm.created);
> > > > =C2=A0
> > > > -	ttm_bo_put(i915_gem_to_ttm(obj));
> > > > +	ttm_bo_fini(i915_gem_to_ttm(obj));
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
> > > > @@ -1325,7 +1325,7 @@ int __i915_gem_ttm_object_init(struct
> > > > intel_memory_region *mem,
> > > > =C2=A0	 * If this function fails, it will call the
> > > > destructor,
> > > > but
> > > > =C2=A0	 * our caller still owns the object. So no freeing in
> > > > the
> > > > =C2=A0	 * destructor until obj->ttm.created is true.
> > > > -	 * Similarly, in delayed_destroy, we can't call
> > > > ttm_bo_put()
> > > > +	 * Similarly, in delayed_destroy, we can't call
> > > > ttm_bo_fini()
> > > > =C2=A0	 * until successful initialization.
> > > > =C2=A0	 */
> > > > =C2=A0	ret =3D ttm_bo_init_reserved(&i915->bdev,
> > > > i915_gem_to_ttm(obj), bo_type,
> > > > diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c
> > > > b/drivers/gpu/drm/loongson/lsdc_gem.c
> > > > index a720d8f53209..22d0eced95da 100644
> > > > --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> > > > +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> > > > @@ -57,7 +57,7 @@ static void lsdc_gem_object_free(struct
> > > > drm_gem_object *obj)
> > > > =C2=A0	struct ttm_buffer_object *tbo =3D to_ttm_bo(obj);
> > > > =C2=A0
> > > > =C2=A0	if (tbo)
> > > > -		ttm_bo_put(tbo);
> > > > +		ttm_bo_fini(tbo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static int lsdc_gem_object_vmap(struct drm_gem_object *obj,
> > > > struct
> > > > iosys_map *map)
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h
> > > > b/drivers/gpu/drm/nouveau/nouveau_bo.h
> > > > index d59fd12268b9..6c26beeb427f 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
> > > > @@ -57,7 +57,7 @@ nouveau_bo(struct ttm_buffer_object *bo)
> > > > =C2=A0static inline void
> > > > =C2=A0nouveau_bo_fini(struct nouveau_bo *bo)
> > > > =C2=A0{
> > > > -	ttm_bo_put(&bo->bo);
> > > > +	ttm_bo_fini(&bo->bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0extern struct ttm_device_funcs nouveau_bo_driver;
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > index 690e10fbf0bd..395d92ab6271 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > @@ -87,7 +87,7 @@ nouveau_gem_object_del(struct drm_gem_object
> > > > *gem)
> > > > =C2=A0		return;
> > > > =C2=A0	}
> > > > =C2=A0
> > > > -	ttm_bo_put(&nvbo->bo);
> > > > +	ttm_bo_fini(&nvbo->bo);
> > > > =C2=A0
> > > > =C2=A0	pm_runtime_mark_last_busy(dev);
> > > > =C2=A0	pm_runtime_put_autosuspend(dev);
> > > > diff --git a/drivers/gpu/drm/qxl/qxl_gem.c
> > > > b/drivers/gpu/drm/qxl/qxl_gem.c
> > > > index fc5e3763c359..d26043424e95 100644
> > > > --- a/drivers/gpu/drm/qxl/qxl_gem.c
> > > > +++ b/drivers/gpu/drm/qxl/qxl_gem.c
> > > > @@ -39,7 +39,7 @@ void qxl_gem_object_free(struct
> > > > drm_gem_object
> > > > *gobj)
> > > > =C2=A0	qxl_surface_evict(qdev, qobj, false);
> > > > =C2=A0
> > > > =C2=A0	tbo =3D &qobj->tbo;
> > > > -	ttm_bo_put(tbo);
> > > > +	ttm_bo_fini(tbo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0int qxl_gem_object_create(struct qxl_device *qdev, int size,
> > > > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
> > > > b/drivers/gpu/drm/radeon/radeon_gem.c
> > > > index f86773f3db20..18ca1bcfd2f9 100644
> > > > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > > > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > > > @@ -86,7 +86,7 @@ static void radeon_gem_object_free(struct
> > > > drm_gem_object *gobj)
> > > > =C2=A0
> > > > =C2=A0	if (robj) {
> > > > =C2=A0		radeon_mn_unregister(robj);
> > > > -		ttm_bo_put(&robj->tbo);
> > > > +		ttm_bo_fini(&robj->tbo);
> > > > =C2=A0	}
> > > > =C2=A0}
> > > > =C2=A0
> > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > index 6c77550c51af..5426b435f702 100644
> > > > --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > @@ -379,7 +379,7 @@ static void ttm_bo_unreserve_bulk(struct
> > > > kunit
> > > > *test)
> > > > =C2=A0	dma_resv_fini(resv);
> > > > =C2=A0}
> > > > =C2=A0
> > > > -static void ttm_bo_put_basic(struct kunit *test)
> > > > +static void ttm_bo_fini_basic(struct kunit *test)
> > > > =C2=A0{
> > > > =C2=A0	struct ttm_test_devices *priv =3D test->priv;
> > > > =C2=A0	struct ttm_buffer_object *bo;
> > > > @@ -410,7 +410,7 @@ static void ttm_bo_put_basic(struct kunit
> > > > *test)
> > > > =C2=A0	dma_resv_unlock(bo->base.resv);
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, err, 0);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static const char *mock_name(struct dma_fence *f)
> > > > @@ -423,7 +423,7 @@ static const struct dma_fence_ops
> > > > mock_fence_ops =3D {
> > > > =C2=A0	.get_timeline_name =3D mock_name,
> > > > =C2=A0};
> > > > =C2=A0
> > > > -static void ttm_bo_put_shared_resv(struct kunit *test)
> > > > +static void ttm_bo_fini_shared_resv(struct kunit *test)
> > > > =C2=A0{
> > > > =C2=A0	struct ttm_test_devices *priv =3D test->priv;
> > > > =C2=A0	struct ttm_buffer_object *bo;
> > > > @@ -463,7 +463,7 @@ static void ttm_bo_put_shared_resv(struct
> > > > kunit
> > > > *test)
> > > > =C2=A0	bo->type =3D ttm_bo_type_device;
> > > > =C2=A0	bo->base.resv =3D external_resv;
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static void ttm_bo_pin_basic(struct kunit *test)
> > > > @@ -616,8 +616,8 @@ static struct kunit_case
> > > > ttm_bo_test_cases[] =3D
> > > > {
> > > > =C2=A0	KUNIT_CASE(ttm_bo_unreserve_basic),
> > > > =C2=A0	KUNIT_CASE(ttm_bo_unreserve_pinned),
> > > > =C2=A0	KUNIT_CASE(ttm_bo_unreserve_bulk),
> > > > -	KUNIT_CASE(ttm_bo_put_basic),
> > > > -	KUNIT_CASE(ttm_bo_put_shared_resv),
> > > > +	KUNIT_CASE(ttm_bo_fini_basic),
> > > > +	KUNIT_CASE(ttm_bo_fini_shared_resv),
> > > > =C2=A0	KUNIT_CASE(ttm_bo_pin_basic),
> > > > =C2=A0	KUNIT_CASE(ttm_bo_pin_unpin_resource),
> > > > =C2=A0	KUNIT_CASE(ttm_bo_multiple_pin_one_unpin),
> > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > > b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > > index 1bcc67977f48..3a1eef83190c 100644
> > > > --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > > @@ -144,7 +144,7 @@ static void
> > > > ttm_bo_init_reserved_sys_man(struct
> > > > kunit *test)
> > > > =C2=A0				=C2=A0 drm_mm_node_allocated(&bo-
> > > > > base.vma_node.vm_node));
> > > > =C2=A0
> > > > =C2=A0	ttm_resource_free(bo, &bo->resource);
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static void ttm_bo_init_reserved_mock_man(struct kunit *test)
> > > > @@ -186,7 +186,7 @@ static void
> > > > ttm_bo_init_reserved_mock_man(struct kunit *test)
> > > > =C2=A0				=C2=A0 drm_mm_node_allocated(&bo-
> > > > > base.vma_node.vm_node));
> > > > =C2=A0
> > > > =C2=A0	ttm_resource_free(bo, &bo->resource);
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0}
> > > > =C2=A0
> > > > @@ -221,7 +221,7 @@ static void
> > > > ttm_bo_init_reserved_resv(struct
> > > > kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
> > > > =C2=A0
> > > > =C2=A0	ttm_resource_free(bo, &bo->resource);
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static void ttm_bo_validate_basic(struct kunit *test)
> > > > @@ -265,7 +265,7 @@ static void ttm_bo_validate_basic(struct
> > > > kunit
> > > > *test)
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, bo->resource->placement,
> > > > =C2=A0			DRM_BUDDY_TOPDOWN_ALLOCATION);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> > > > =C2=A0}
> > > > =C2=A0
> > > > @@ -292,7 +292,7 @@ static void
> > > > ttm_bo_validate_invalid_placement(struct kunit *test)
> > > > =C2=A0
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static void ttm_bo_validate_failed_alloc(struct kunit *test)
> > > > @@ -321,7 +321,7 @@ static void
> > > > ttm_bo_validate_failed_alloc(struct
> > > > kunit *test)
> > > > =C2=A0
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0}
> > > > =C2=A0
> > > > @@ -353,7 +353,7 @@ static void ttm_bo_validate_pinned(struct
> > > > kunit
> > > > *test)
> > > > =C2=A0	ttm_bo_unpin(bo);
> > > > =C2=A0	dma_resv_unlock(bo->base.resv);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static const struct ttm_bo_validate_test_case
> > > > ttm_mem_type_cases[]
> > > > =3D {
> > > > @@ -403,7 +403,7 @@ static void
> > > > ttm_bo_validate_same_placement(struct kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, err, 0);
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0
> > > > =C2=A0	if (params->mem_type !=3D TTM_PL_SYSTEM)
> > > > =C2=A0		ttm_mock_manager_fini(priv->ttm_dev, params-
> > > > > mem_type);
> > > > @@ -452,7 +452,7 @@ static void
> > > > ttm_bo_validate_busy_placement(struct kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, bo->resource->mem_type,
> > > > snd_mem);
> > > > =C2=A0	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo-
> > > > > priority]));
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> > > > =C2=A0}
> > > > @@ -495,7 +495,7 @@ static void ttm_bo_validate_multihop(struct
> > > > kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, bo->resource->mem_type,
> > > > final_mem);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
> > > > @@ -567,7 +567,7 @@ static void
> > > > ttm_bo_validate_no_placement_signaled(struct kunit *test)
> > > > =C2=A0		KUNIT_ASSERT_TRUE(test, flags &
> > > > TTM_TT_FLAG_ZERO_ALLOC);
> > > > =C2=A0	}
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static int threaded_dma_resv_signal(void *arg)
> > > > @@ -635,7 +635,7 @@ static void
> > > > ttm_bo_validate_no_placement_not_signaled(struct kunit *test)
> > > > =C2=A0	/* Make sure we have an idle object at this point */
> > > > =C2=A0	dma_resv_wait_timeout(bo->base.resv, usage, false,
> > > > MAX_SCHEDULE_TIMEOUT);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static void ttm_bo_validate_move_fence_signaled(struct kunit
> > > > *test)
> > > > @@ -668,7 +668,7 @@ static void
> > > > ttm_bo_validate_move_fence_signaled(struct kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, bo->resource->mem_type,
> > > > mem_type);
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0	dma_fence_put(man->move);
> > > > =C2=A0}
> > > > =C2=A0
> > > > @@ -753,7 +753,7 @@ static void
> > > > ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
> > > > =C2=A0	else
> > > > =C2=A0		KUNIT_EXPECT_EQ(test, bo->resource->mem_type,
> > > > fst_mem);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> > > > =C2=A0}
> > > > @@ -807,8 +807,8 @@ static void
> > > > ttm_bo_validate_happy_evict(struct
> > > > kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, bos[1].resource->mem_type,
> > > > mem_type);
> > > > =C2=A0
> > > > =C2=A0	for (i =3D 0; i < bo_no; i++)
> > > > -		ttm_bo_put(&bos[i]);
> > > > -	ttm_bo_put(bo_val);
> > > > +		ttm_bo_fini(&bos[i]);
> > > > +	ttm_bo_fini(bo_val);
> > > > =C2=A0
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> > > > @@ -852,12 +852,12 @@ static void
> > > > ttm_bo_validate_all_pinned_evict(struct kunit *test)
> > > > =C2=A0
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo_small);
> > > > +	ttm_bo_fini(bo_small);
> > > > =C2=A0
> > > > =C2=A0	ttm_bo_reserve(bo_big, false, false, NULL);
> > > > =C2=A0	ttm_bo_unpin(bo_big);
> > > > =C2=A0	dma_resv_unlock(bo_big->base.resv);
> > > > -	ttm_bo_put(bo_big);
> > > > +	ttm_bo_fini(bo_big);
> > > > =C2=A0
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> > > > @@ -916,13 +916,13 @@ static void
> > > > ttm_bo_validate_allowed_only_evict(struct kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, bo_evictable->resource-
> > > > >mem_type,
> > > > mem_type_evict);
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2 +
> > > > BO_SIZE);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo);
> > > > -	ttm_bo_put(bo_evictable);
> > > > +	ttm_bo_fini(bo);
> > > > +	ttm_bo_fini(bo_evictable);
> > > > =C2=A0
> > > > =C2=A0	ttm_bo_reserve(bo_pinned, false, false, NULL);
> > > > =C2=A0	ttm_bo_unpin(bo_pinned);
> > > > =C2=A0	dma_resv_unlock(bo_pinned->base.resv);
> > > > -	ttm_bo_put(bo_pinned);
> > > > +	ttm_bo_fini(bo_pinned);
> > > > =C2=A0
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> > > > @@ -973,8 +973,8 @@ static void
> > > > ttm_bo_validate_deleted_evict(struct kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_NULL(test, bo_big->ttm);
> > > > =C2=A0	KUNIT_EXPECT_NULL(test, bo_big->resource);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo_small);
> > > > -	ttm_bo_put(bo_big);
> > > > +	ttm_bo_fini(bo_small);
> > > > +	ttm_bo_fini(bo_big);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0}
> > > > =C2=A0
> > > > @@ -1025,8 +1025,8 @@ static void
> > > > ttm_bo_validate_busy_domain_evict(struct kunit *test)
> > > > =C2=A0	KUNIT_EXPECT_EQ(test, bo_init->resource->mem_type,
> > > > mem_type);
> > > > =C2=A0	KUNIT_EXPECT_NULL(test, bo_val->resource);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo_init);
> > > > -	ttm_bo_put(bo_val);
> > > > +	ttm_bo_fini(bo_init);
> > > > +	ttm_bo_fini(bo_val);
> > > > =C2=A0
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0	ttm_bad_manager_fini(priv->ttm_dev, mem_type_evict);
> > > > @@ -1070,8 +1070,8 @@ static void
> > > > ttm_bo_validate_evict_gutting(struct kunit *test)
> > > > =C2=A0	KUNIT_ASSERT_NULL(test, bo_evict->resource);
> > > > =C2=A0	KUNIT_ASSERT_TRUE(test, bo_evict->ttm->page_flags &
> > > > TTM_TT_FLAG_ZERO_ALLOC);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo_evict);
> > > > -	ttm_bo_put(bo);
> > > > +	ttm_bo_fini(bo_evict);
> > > > +	ttm_bo_fini(bo);
> > > > =C2=A0
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0}
> > > > @@ -1128,9 +1128,9 @@ static void
> > > > ttm_bo_validate_recrusive_evict(struct kunit *test)
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > > =C2=A0	ttm_mock_manager_fini(priv->ttm_dev, mem_type_evict);
> > > > =C2=A0
> > > > -	ttm_bo_put(bo_val);
> > > > -	ttm_bo_put(bo_tt);
> > > > -	ttm_bo_put(bo_mock);
> > > > +	ttm_bo_fini(bo_val);
> > > > +	ttm_bo_fini(bo_tt);
> > > > +	ttm_bo_fini(bo_mock);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static struct kunit_case ttm_bo_validate_test_cases[] =3D {
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > index f4d9e68b21e7..9c9e132558d4 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > @@ -318,18 +318,17 @@ static void ttm_bo_release(struct kref
> > > > *kref)
> > > > =C2=A0	bo->destroy(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > -/**
> > > > - * ttm_bo_put
> > > > - *
> > > > - * @bo: The buffer object.
> > > > - *
> > > > - * Unreference a buffer object.
> > > > - */
> > > > +/* TODO: remove! */
> > > > =C2=A0void ttm_bo_put(struct ttm_buffer_object *bo)
> > > > =C2=A0{
> > > > =C2=A0	kref_put(&bo->kref, ttm_bo_release);
> > > > =C2=A0}
> > > > -EXPORT_SYMBOL(ttm_bo_put);
> > > > +
> > > > +void ttm_bo_fini(struct ttm_buffer_object *bo)
> > > > +{
> > > > +	ttm_bo_put(bo);
> > > > +}
> > > > +EXPORT_SYMBOL(ttm_bo_fini);
> > > > =C2=A0
> > > > =C2=A0static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object
> > > > *bo,
> > > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx
> > > > *ctx,
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h
> > > > b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> > > > index 9d8b747a34db..e0d48eac74b0 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> > > > @@ -55,4 +55,6 @@ ttm_bo_get_unless_zero(struct
> > > > ttm_buffer_object
> > > > *bo)
> > > > =C2=A0	return bo;
> > > > =C2=A0}
> > > > =C2=A0
> > > > +void ttm_bo_put(struct ttm_buffer_object *bo);
> > > > +
> > > > =C2=A0#endif
> > > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > index eedf1fe60be7..39f8c46550c2 100644
> > > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > @@ -37,7 +37,7 @@ static void vmw_gem_object_free(struct
> > > > drm_gem_object *gobj)
> > > > =C2=A0{
> > > > =C2=A0	struct ttm_buffer_object *bo =3D
> > > > drm_gem_ttm_of_gem(gobj);
> > > > =C2=A0	if (bo)
> > > > -		ttm_bo_put(bo);
> > > > +		ttm_bo_fini(bo);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static int vmw_gem_object_open(struct drm_gem_object *obj,
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 18f27da47a36..8830f0142881 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1668,7 +1668,7 @@ static void xe_gem_object_free(struct
> > > > drm_gem_object *obj)
> > > > =C2=A0	 * refcount directly if needed.
> > > > =C2=A0	 */
> > > > =C2=A0	__xe_bo_vunmap(gem_to_xe_bo(obj));
> > > > -	ttm_bo_put(container_of(obj, struct ttm_buffer_object,
> > > > base));
> > > > +	ttm_bo_fini(container_of(obj, struct
> > > > ttm_buffer_object,
> > > > base));
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static void xe_gem_object_close(struct drm_gem_object *obj,
> > > > diff --git a/include/drm/ttm/ttm_bo.h
> > > > b/include/drm/ttm/ttm_bo.h
> > > > index 479b7ed075c0..da5c2e4971dc 100644
> > > > --- a/include/drm/ttm/ttm_bo.h
> > > > +++ b/include/drm/ttm/ttm_bo.h
> > > > @@ -391,7 +391,7 @@ int ttm_bo_wait_ctx(struct
> > > > ttm_buffer_object
> > > > *bo,
> > > > =C2=A0int ttm_bo_validate(struct ttm_buffer_object *bo,
> > > > =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> > > > =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx);
> > > > -void ttm_bo_put(struct ttm_buffer_object *bo);
> > > > +void ttm_bo_fini(struct ttm_buffer_object *bo);
> > > > =C2=A0void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
> > > > =C2=A0			=C2=A0 struct ttm_lru_bulk_move *bulk);
> > > > =C2=A0bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> > >=20
> >=20
>=20

