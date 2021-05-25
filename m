Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08343390912
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 20:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1586EAA6;
	Tue, 25 May 2021 18:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4196EAA6;
 Tue, 25 May 2021 18:37:03 +0000 (UTC)
IronPort-SDR: 6h9OClOWRySwELh7DzrwrAkqs3aeU+b49HHP5R+ml58JRX9Rdrvr8C98m4q8yg/cfm6PtuKYyn
 R0gUHaIqSIuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202023581"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="202023581"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 11:36:53 -0700
IronPort-SDR: YIjc8Hher8OoWXmGlzurGP3M4aPNFXcQ1UBBHURYued5lThXqUVYYQ5hc2WFlqRkqU8ha1nMHR
 Kl/mZ5u0mw+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="614634262"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 25 May 2021 11:36:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 25 May 2021 11:36:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 25 May 2021 11:36:46 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2242.008;
 Tue, 25 May 2021 11:36:46 -0700
From: "Tang, CQ" <cq.tang@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v4 14/17] drm/i915/pxp: User interface for
 Protected buffer
Thread-Topic: [Intel-gfx] [PATCH v4 14/17] drm/i915/pxp: User interface for
 Protected buffer
Thread-Index: AQHXUSmqkEdcZH4vbkuOYyljS1D7eqr0hR8w
Date: Tue, 25 May 2021 18:36:46 +0000
Message-ID: <728fa3c9e484402d82fb7fb124496bdb@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
 <20210525054803.7387-15-daniele.ceraolospurio@intel.com>
In-Reply-To: <20210525054803.7387-15-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kondapally Kalyan <kalyan.kondapally@intel.com>,
 Huang Sean Z <sean.z.huang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Daniele Ceraolo Spurio
> Sent: Monday, May 24, 2021 10:48 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: Vetter, Daniel <daniel.vetter@intel.com>; Huang Sean Z
> <sean.z.huang@intel.com>; dri-devel@lists.freedesktop.org; Chris Wilson
> <chris@chris-wilson.co.uk>; Kondapally Kalyan
> <kalyan.kondapally@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>
> Subject: [Intel-gfx] [PATCH v4 14/17] drm/i915/pxp: User interface for
> Protected buffer
>=20
> From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>=20
> This api allow user mode to create Protected buffers. Only contexts marke=
d
> as protected are allowed to operate on protected buffers.
>=20
> We only allow setting the flags at creation time.
>=20
> All protected objects that have backing storage will be considered invali=
d
> when the session is destroyed and they won't be usable anymore.

Then these protected objects will be hanging in the system till user call g=
em_close() to free them?
If the objects won't be usable anymore, why don't we automatically free the=
se objects when the session is destroyed?

How is a session started/destroyed?  From the code, intel_pxp_init() is cal=
led when loading i915 driver, so I think session lifetime is the same as i9=
15 driver lifetime.
Can we start multiple sessions after loading the driver?

--CQ

>=20
> Given that the PXP HW supports multiple modes (but we currently only care
> about one), a flag variable has been reserved in the structure used in th=
e
> create_ext ioctl for possible future updates.
>=20
> This is a rework of the original code by Bommu Krishnaiah. I've kept
> authorship unchanged since significant chunks have not been modified.
>=20
> v2: split context changes, fix defines and improve documentation (Chris),
>     add object invalidation logic
> v3: fix spinlock definition and usage, only validate objects when
>     they're first added to a context lut, only remove them once (Chris),
>     make protected context flag not mandatory in protected object execbuf
>     to avoid abuse (Lionel)
> v4: rebase to new gem_create_ext
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Telukuntla Sreedhar <sreedhar.telukuntla@intel.com>
> Cc: Kondapally Kalyan <kalyan.kondapally@intel.com>
> Cc: Gupta Anshuman <Anshuman.Gupta@intel.com>
> Cc: Huang Sean Z <sean.z.huang@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 26 ++++++++++++
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 +++++++
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 +++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    | 12 ++++++
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 13 ++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp.c          | 41 +++++++++++++++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp.h          | 13 ++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  5 +++
>  include/uapi/drm/i915_drm.h                   | 33 ++++++++++++++-
>  9 files changed, 163 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 548ddf39d853..c14be3882c35 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -6,6 +6,7 @@
>  #include "gem/i915_gem_ioctls.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_region.h"
> +#include "pxp/intel_pxp.h"
>=20
>  #include "i915_drv.h"
>  #include "i915_trace.h"
> @@ -99,7 +100,11 @@ i915_gem_setup(struct drm_i915_gem_object *obj,
> u64 size)
>=20
>  	GEM_BUG_ON(size !=3D obj->base.size);
>=20
> +	if (obj->user_flags & I915_GEM_OBJECT_PROTECTED)
> +		intel_pxp_object_add(obj);
> +
>  	trace_i915_gem_object_create(obj);
> +
>  	return 0;
>  }
>=20
> @@ -344,8 +349,29 @@ static int ext_set_placements(struct
> i915_user_extension __user *base,
>  	return set_placements(&ext, data);
>  }
>=20
> +static int ext_set_protected(struct i915_user_extension __user *base,
> +void *data) {
> +	struct drm_i915_gem_create_ext_protected_content ext;
> +	struct create_ext *ext_data =3D data;
> +
> +	if (copy_from_user(&ext, base, sizeof(ext)))
> +		return -EFAULT;
> +
> +	if (ext.flags)
> +		return -EINVAL;
> +
> +	if (!intel_pxp_is_enabled(&ext_data->i915->gt.pxp))
> +		return -ENODEV;
> +
> +	ext_data->vanilla_object->user_flags |=3D
> I915_GEM_OBJECT_PROTECTED;
> +
> +	return 0;
> +}
> +
> +
>  static const i915_user_extension_fn create_extensions[] =3D {
>  	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] =3D
> ext_set_placements,
> +	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] =3D
> ext_set_protected,
>  };
>=20
>  /**
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index c08e28847064..5dd813d04a9f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -839,6 +839,21 @@ static struct i915_vma *eb_lookup_vma(struct
> i915_execbuffer *eb, u32 handle)
>  		if (unlikely(!obj))
>  			return ERR_PTR(-ENOENT);
>=20
> +		/*
> +		 * If the user has opted-in for protected-object tracking,
> make
> +		 * sure the object encryption can be used.
> +		 * We only need to do this when the object is first used with
> +		 * this context, because the context itself will be banned
> when
> +		 * the protected objects become invalid.
> +		 */
> +		if (i915_gem_context_uses_protected_content(eb-
> >gem_context) &&
> +		    i915_gem_object_is_protected(obj)) {
> +			if (!intel_pxp_is_active(&vm->gt->pxp))
> +				return ERR_PTR(-ENODEV);
> +			if (!i915_gem_object_has_valid_protection(obj))
> +				return ERR_PTR(-ENOEXEC);
> +		}
> +
>  		vma =3D i915_vma_instance(obj, vm, NULL);
>  		if (IS_ERR(vma)) {
>  			i915_gem_object_put(obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 28144410df86..b47fa0a7b25a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -25,6 +25,7 @@
>  #include <linux/sched/mm.h>
>=20
>  #include "display/intel_frontbuffer.h"
> +#include "pxp/intel_pxp.h"
>  #include "i915_drv.h"
>  #include "i915_gem_clflush.h"
>  #include "i915_gem_context.h"
> @@ -70,6 +71,8 @@ void i915_gem_object_init(struct
> drm_i915_gem_object *obj,
>  	INIT_LIST_HEAD(&obj->lut_list);
>  	spin_lock_init(&obj->lut_lock);
>=20
> +	INIT_LIST_HEAD(&obj->pxp_link);
> +
>  	spin_lock_init(&obj->mmo.lock);
>  	obj->mmo.offsets =3D RB_ROOT;
>=20
> @@ -232,6 +235,9 @@ static void __i915_gem_free_objects(struct
> drm_i915_private *i915,
>  			spin_unlock(&obj->vma.lock);
>  		}
>=20
> +		if (i915_gem_object_has_valid_protection(obj))
> +			intel_pxp_object_remove(obj);
> +
>  		__i915_gem_object_free_mmaps(obj);
>=20
>  		GEM_BUG_ON(!list_empty(&obj->lut_list));
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 2ebd79537aea..61b101560352 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -288,6 +288,18 @@ i915_gem_object_never_mmap(const struct
> drm_i915_gem_object *obj)
>  	return i915_gem_object_type_has(obj,
> I915_GEM_OBJECT_NO_MMAP);  }
>=20
> +static inline bool
> +i915_gem_object_is_protected(const struct drm_i915_gem_object *obj) {
> +	return obj->user_flags & I915_GEM_OBJECT_PROTECTED; }
> +
> +static inline bool
> +i915_gem_object_has_valid_protection(const struct drm_i915_gem_object
> +*obj) {
> +	return i915_gem_object_is_protected(obj) &&
> +!list_empty(&obj->pxp_link); }
> +
>  static inline bool
>  i915_gem_object_is_framebuffer(const struct drm_i915_gem_object *obj)
> { diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 0727d0c76aa0..a698ad0ef7f6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -167,6 +167,11 @@ struct drm_i915_gem_object {
>  	} mmo;
>=20
>  	I915_SELFTEST_DECLARE(struct list_head st_link);
> +	/**
> +	 * @user_flags: small set of booleans set by the user
> +	 */
> +	unsigned long user_flags;
> +#define I915_GEM_OBJECT_PROTECTED BIT(0)
>=20
>  	unsigned long flags;
>  #define I915_BO_ALLOC_CONTIGUOUS BIT(0) @@ -294,6 +299,14 @@
> struct drm_i915_gem_object {
>  		bool dirty:1;
>  	} mm;
>=20
> +	/*
> +	 * When the PXP session is invalidated, we need to mark all
> protected
> +	 * objects as invalid. To easily do so we add them all to a list. The
> +	 * presence on the list is used to check if the encryption is valid or
> +	 * not.
> +	 */
> +	struct list_head pxp_link;
> +
>  	/** Record of address bit 17 of each page at last unbind. */
>  	unsigned long *bit_17;
>=20
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 2291c68fd3a0..e6a59eb05eae 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -69,6 +69,9 @@ void intel_pxp_init(struct intel_pxp *pxp)
>  	if (!HAS_PXP(gt->i915))
>  		return;
>=20
> +	spin_lock_init(&pxp->lock);
> +	INIT_LIST_HEAD(&pxp->protected_objects);
> +
>  	/*
>  	 * we'll use the completion to check if there is a termination pending,
>  	 * so we start it as completed and we reinit it when a termination
> @@ -177,11 +180,49 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp)
>  	intel_pxp_irq_disable(pxp);
>  }
>=20
> +int intel_pxp_object_add(struct drm_i915_gem_object *obj) {
> +	struct intel_pxp *pxp =3D &to_i915(obj->base.dev)->gt.pxp;
> +
> +	if (!intel_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	if (!list_empty(&obj->pxp_link))
> +		return -EEXIST;
> +
> +	spin_lock_irq(&pxp->lock);
> +	list_add(&obj->pxp_link, &pxp->protected_objects);
> +	spin_unlock_irq(&pxp->lock);
> +
> +	return 0;
> +}
> +
> +void intel_pxp_object_remove(struct drm_i915_gem_object *obj) {
> +	struct intel_pxp *pxp =3D &to_i915(obj->base.dev)->gt.pxp;
> +
> +	if (!intel_pxp_is_enabled(pxp))
> +		return;
> +
> +	spin_lock_irq(&pxp->lock);
> +	list_del_init(&obj->pxp_link);
> +	spin_unlock_irq(&pxp->lock);
> +}
> +
>  void intel_pxp_invalidate(struct intel_pxp *pxp)  {
>  	struct drm_i915_private *i915 =3D pxp_to_gt(pxp)->i915;
> +	struct drm_i915_gem_object *obj, *tmp;
>  	struct i915_gem_context *ctx, *cn;
>=20
> +	/* delete objects that have been used with the invalidated session
> */
> +	spin_lock_irq(&pxp->lock);
> +	list_for_each_entry_safe(obj, tmp, &pxp->protected_objects,
> pxp_link) {
> +		if (i915_gem_object_has_pages(obj))
> +			list_del_init(&obj->pxp_link);
> +	}
> +	spin_unlock_irq(&pxp->lock);
> +
>  	/* ban all contexts marked as protected */
>  	spin_lock_irq(&i915->gem.contexts.lock);
>  	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link)
> { diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 1f9871e64096..3500d7896058 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -9,6 +9,8 @@
>  #include "gt/intel_gt_types.h"
>  #include "intel_pxp_types.h"
>=20
> +struct drm_i915_gem_object;
> +
>  static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)  {
>  	return container_of(pxp, struct intel_gt, pxp); @@ -33,6 +35,9 @@
> void intel_pxp_fini_hw(struct intel_pxp *pxp);
>=20
>  void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);  int
> intel_pxp_start(struct intel_pxp *pxp);
> +
> +int intel_pxp_object_add(struct drm_i915_gem_object *obj); void
> +intel_pxp_object_remove(struct drm_i915_gem_object *obj);
>  void intel_pxp_invalidate(struct intel_pxp *pxp);  #else  static inline =
void
> intel_pxp_init(struct intel_pxp *pxp) @@ -47,6 +52,14 @@ static inline in=
t
> intel_pxp_start(struct intel_pxp *pxp)  {
>  	return 0;
>  }
> +
> +static inline int intel_pxp_object_add(struct drm_i915_gem_object *obj)
> +{
> +	return 0;
> +}
> +static inline void intel_pxp_object_remove(struct drm_i915_gem_object
> +*obj) { }
>  #endif
>=20
>  #endif /* __INTEL_PXP_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index b3ae49dd73a8..cc510416eac6 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -7,7 +7,9 @@
>  #define __INTEL_PXP_TYPES_H__
>=20
>  #include <linux/completion.h>
> +#include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>=20
> @@ -43,6 +45,9 @@ struct intel_pxp {
>  #define PXP_TERMINATION_REQUEST  BIT(0)  #define
> PXP_TERMINATION_COMPLETE BIT(1)
>  #define PXP_INVAL_REQUIRED       BIT(2)
> +
> +	spinlock_t lock; /* protects the objects list */
> +	struct list_head protected_objects;
>  };
>=20
>  #endif /* __INTEL_PXP_TYPES_H__ */
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 3cc33fcbf520..d39b8cb4bfc5 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1768,7 +1768,7 @@ struct drm_i915_gem_context_param {
>  	__u64 value;
>  };
>=20
> -/*
> +/**
>   * Context SSEU programming
>   *
>   * It may be necessary for either functional or performance reason to
> configure @@ -2669,8 +2669,12 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>  	 * struct drm_i915_gem_create_ext_memory_regions.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> +	 * struct drm_i915_gem_create_ext_protected_content.
>  	 */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>  	__u64 extensions;
>  };
>=20
> @@ -2728,6 +2732,33 @@ struct
> drm_i915_gem_create_ext_memory_regions {
>  	__u64 regions;
>  };
>=20
> +/**
> + * struct drm_i915_gem_create_ext_protected_content - The
> + * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
> + *
> + * If this extension is provided, buffer contents are expected to be
> + * protected by PXP encryption and requires decryption for scan out
> + * and processing. This is only possible on platforms that have PXP
> +enabled,
> + * on all other scenarios ysing this extension will cause the ioctl to
> +fail
> + * and return -ENODEV. The flags parameter is reserved for future
> +expansion and
> + * must currently be set to zero.
> + *
> + * The buffer contents are considered invalid after a PXP session teardo=
wn.
> + *
> + * The encryption is guaranteed to be processed correctly only if the
> +object
> + * is submitted with a context created using the
> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable
> +extra checks
> + * at submission time on the validity of the objects involved, which
> +can lead to
> + * the following errors being returned from the execbuf ioctl:
> + *
> + * -ENODEV: PXP session not currently active
> + * -ENOEXEC: buffer has become invalid after a teardown event  */
> +struct drm_i915_gem_create_ext_protected_content {
> +	struct i915_user_extension base;
> +	__u32 flags;
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is activ=
e
> */  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>=20
> --
> 2.29.2
>=20
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
