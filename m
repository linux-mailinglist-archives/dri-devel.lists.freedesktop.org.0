Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E507B6210C6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEAC10E070;
	Tue,  8 Nov 2022 12:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633E310E070;
 Tue,  8 Nov 2022 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667910753; x=1699446753;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+39OAQURUX8cMLgj7lTx6DwoJmguJS2ss7+gqowHun0=;
 b=bjzx5K/FZRPSGIFXCKXCyYWqqpszzA6WRgOdsSuiaTEAz3izLn+1bgCe
 VK4MriVKAhph11IYPWtoC7nlpaf9UnQHl4+8ajVX34L+40y51Y5z+rNKD
 AXDvOmFPPl9aRW60xIauUqBwQHr1B++EHfNX0v4/haFT36VkX3A4CPezQ
 O8X+zvs/7VHj3IXuF9sPS3bP2Dnfg2IakJeZ8OdKuMgvWhuV+t/dO9EHO
 If8+abyGSdjf242mSOJDZ0HRaMMYeaX5lCNdT1w128QAQxwJeWrCidLsu
 kELNqnMhfdDlJyRip4h6KgKphu+NSPtMSQ5QPc/QvXg6/8eUDhp9+rI5p w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="309390436"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="309390436"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:32:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="667571486"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="667571486"
Received: from smoriord-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.110])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:32:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915: Partial abandonment of legacy DRM logging
 macros
In-Reply-To: <20221108122608.2196810-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221108114950.2017869-1-tvrtko.ursulin@linux.intel.com>
 <20221108122608.2196810-1-tvrtko.ursulin@linux.intel.com>
Date: Tue, 08 Nov 2022 14:32:27 +0200
Message-ID: <87leol8w4k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Nov 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Convert some usages of legacy DRM logging macros into versions which tell
> us on which device have the events occurred.

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> v2:
>  * Don't have struct drm_device as local. (Jani, Ville)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 26 +++++++----
>  .../drm/i915/gt/intel_execlists_submission.c  | 13 +++---
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  4 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c            |  4 +-
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  8 ++--
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  6 ++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 43 +++++++++++--------
>  .../gpu/drm/i915/gt/intel_workarounds_types.h |  4 ++
>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
>  drivers/gpu/drm/i915/i915_debugfs.c           |  4 +-
>  drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>  drivers/gpu/drm/i915/i915_getparam.c          |  2 +-
>  drivers/gpu/drm/i915/i915_irq.c               | 12 +++---
>  drivers/gpu/drm/i915/i915_perf.c              | 14 +++---
>  drivers/gpu/drm/i915/i915_query.c             | 12 +++---
>  drivers/gpu/drm/i915/i915_sysfs.c             |  3 +-
>  drivers/gpu/drm/i915/i915_vma.c               | 16 ++++---
>  drivers/gpu/drm/i915/intel_uncore.c           | 21 +++++----
>  19 files changed, 119 insertions(+), 81 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.c
> index 01402f3c58f6..7f2831efc798 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -546,7 +546,7 @@ set_proto_ctx_engines_bond(struct i915_user_extension=
 __user *base, void *data)
>  	}
>=20=20
>  	if (intel_engine_uses_guc(master)) {
> -		DRM_DEBUG("bonding extension not supported with GuC submission");
> +		drm_dbg(&i915->drm, "bonding extension not supported with GuC submissi=
on");
>  		return -ENODEV;
>  	}
>=20=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 1160723c9d2d..f65fd03f7cf2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2148,7 +2148,8 @@ static int eb_move_to_gpu(struct i915_execbuffer *e=
b)
>  	return err;
>  }
>=20=20
> -static int i915_gem_check_execbuffer(struct drm_i915_gem_execbuffer2 *ex=
ec)
> +static int i915_gem_check_execbuffer(struct drm_i915_private *i915,
> +				     struct drm_i915_gem_execbuffer2 *exec)
>  {
>  	if (exec->flags & __I915_EXEC_ILLEGAL_FLAGS)
>  		return -EINVAL;
> @@ -2161,7 +2162,7 @@ static int i915_gem_check_execbuffer(struct drm_i91=
5_gem_execbuffer2 *exec)
>  	}
>=20=20
>  	if (exec->DR4 =3D=3D 0xffffffff) {
> -		DRM_DEBUG("UXA submitting garbage DR4, fixing up\n");
> +		drm_dbg(&i915->drm, "UXA submitting garbage DR4, fixing up\n");
>  		exec->DR4 =3D 0;
>  	}
>  	if (exec->DR1 || exec->DR4)
> @@ -2799,7 +2800,8 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>=20=20
>  		syncobj =3D drm_syncobj_find(eb->file, user_fence.handle);
>  		if (!syncobj) {
> -			DRM_DEBUG("Invalid syncobj handle provided\n");
> +			drm_dbg(&eb->i915->drm,
> +				"Invalid syncobj handle provided\n");
>  			return -ENOENT;
>  		}
>=20=20
> @@ -2807,7 +2809,8 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>=20=20
>  		if (!fence && user_fence.flags &&
>  		    !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
> -			DRM_DEBUG("Syncobj handle has no fence\n");
> +			drm_dbg(&eb->i915->drm,
> +				"Syncobj handle has no fence\n");
>  			drm_syncobj_put(syncobj);
>  			return -EINVAL;
>  		}
> @@ -2816,7 +2819,9 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>  			err =3D dma_fence_chain_find_seqno(&fence, point);
>=20=20
>  		if (err && !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
> -			DRM_DEBUG("Syncobj handle missing requested point %llu\n", point);
> +			drm_dbg(&eb->i915->drm,
> +				"Syncobj handle missing requested point %llu\n",
> +				point);
>  			dma_fence_put(fence);
>  			drm_syncobj_put(syncobj);
>  			return err;
> @@ -2842,7 +2847,8 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>  			 * 0) would break the timeline.
>  			 */
>  			if (user_fence.flags & I915_EXEC_FENCE_WAIT) {
> -				DRM_DEBUG("Trying to wait & signal the same timeline point.\n");
> +				drm_dbg(&eb->i915->drm,
> +					"Trying to wait & signal the same timeline point.\n");
>  				dma_fence_put(fence);
>  				drm_syncobj_put(syncobj);
>  				return -EINVAL;
> @@ -2913,14 +2919,16 @@ static int add_fence_array(struct i915_execbuffer=
 *eb)
>=20=20
>  		syncobj =3D drm_syncobj_find(eb->file, user_fence.handle);
>  		if (!syncobj) {
> -			DRM_DEBUG("Invalid syncobj handle provided\n");
> +			drm_dbg(&eb->i915->drm,
> +				"Invalid syncobj handle provided\n");
>  			return -ENOENT;
>  		}
>=20=20
>  		if (user_fence.flags & I915_EXEC_FENCE_WAIT) {
>  			fence =3D drm_syncobj_fence_get(syncobj);
>  			if (!fence) {
> -				DRM_DEBUG("Syncobj handle has no fence\n");
> +				drm_dbg(&eb->i915->drm,
> +					"Syncobj handle has no fence\n");
>  				drm_syncobj_put(syncobj);
>  				return -EINVAL;
>  			}
> @@ -3515,7 +3523,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, =
void *data,
>  		return -EINVAL;
>  	}
>=20=20
> -	err =3D i915_gem_check_execbuffer(args);
> +	err =3D i915_gem_check_execbuffer(i915, args);
>  	if (err)
>  		return err;
>=20=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drive=
rs/gpu/drm/i915/gt/intel_execlists_submission.c
> index 0187bc72310d..d92512780467 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3921,6 +3921,7 @@ static struct intel_context *
>  execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int=
 count,
>  			 unsigned long flags)
>  {
> +	struct drm_i915_private *i915 =3D siblings[0]->i915;
>  	struct virtual_engine *ve;
>  	unsigned int n;
>  	int err;
> @@ -3929,7 +3930,7 @@ execlists_create_virtual(struct intel_engine_cs **s=
iblings, unsigned int count,
>  	if (!ve)
>  		return ERR_PTR(-ENOMEM);
>=20=20
> -	ve->base.i915 =3D siblings[0]->i915;
> +	ve->base.i915 =3D i915;
>  	ve->base.gt =3D siblings[0]->gt;
>  	ve->base.uncore =3D siblings[0]->uncore;
>  	ve->base.id =3D -1;
> @@ -3988,8 +3989,9 @@ execlists_create_virtual(struct intel_engine_cs **s=
iblings, unsigned int count,
>=20=20
>  		GEM_BUG_ON(!is_power_of_2(sibling->mask));
>  		if (sibling->mask & ve->base.mask) {
> -			DRM_DEBUG("duplicate %s entry in load balancer\n",
> -				  sibling->name);
> +			drm_dbg(&i915->drm,
> +				"duplicate %s entry in load balancer\n",
> +				sibling->name);
>  			err =3D -EINVAL;
>  			goto err_put;
>  		}
> @@ -4023,8 +4025,9 @@ execlists_create_virtual(struct intel_engine_cs **s=
iblings, unsigned int count,
>  		 */
>  		if (ve->base.class !=3D OTHER_CLASS) {
>  			if (ve->base.class !=3D sibling->class) {
> -				DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
> -					  sibling->class, ve->base.class);
> +				drm_dbg(&i915->drm,
> +					"invalid mixing of engine class, sibling %d, already %d\n",
> +					sibling->class, ve->base.class);
>  				err =3D -EINVAL;
>  				goto err_put;
>  			}
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/d=
rm/i915/gt/intel_ggtt_fencing.c
> index ea775e601686..995082d45cb2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> @@ -816,8 +816,8 @@ i915_gem_object_save_bit_17_swizzle(struct drm_i915_g=
em_object *obj,
>  	if (obj->bit_17 =3D=3D NULL) {
>  		obj->bit_17 =3D bitmap_zalloc(page_count, GFP_KERNEL);
>  		if (obj->bit_17 =3D=3D NULL) {
> -			DRM_ERROR("Failed to allocate memory for bit 17 "
> -				  "record\n");
> +			drm_err(&to_i915(obj->base.dev)->drm,
> +				"Failed to allocate memory for bit 17 record\n");
>  			return;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt=
/intel_gt.c
> index 8e914c4066ed..0ba7d6f36b28 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -190,7 +190,7 @@ int intel_gt_init_hw(struct intel_gt *gt)
>=20=20
>  	ret =3D i915_ppgtt_init_hw(gt);
>  	if (ret) {
> -		DRM_ERROR("Enabling PPGTT failed (%d)\n", ret);
> +		drm_err(&i915->drm, "Enabling PPGTT failed (%d)\n", ret);
>  		goto out;
>  	}
>=20=20
> @@ -262,7 +262,7 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>  		 * some errors might have become stuck,
>  		 * mask them.
>  		 */
> -		DRM_DEBUG_DRIVER("EIR stuck: 0x%08x, masking\n", eir);
> +		drm_dbg(&gt->i915->drm, "EIR stuck: 0x%08x, masking\n", eir);
>  		rmw_set(uncore, EMR, eir);
>  		intel_uncore_write(uncore, GEN2_IIR,
>  				   I915_MASTER_ERROR_INTERRUPT);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i91=
5/gt/intel_gt_irq.c
> index b197f0e9794f..4c8ddd074b78 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -44,8 +44,9 @@ gen11_gt_engine_identity(struct intel_gt *gt,
>  		 !time_after32(local_clock() >> 10, timeout_ts));
>=20=20
>  	if (unlikely(!(ident & GEN11_INTR_DATA_VALID))) {
> -		DRM_ERROR("INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> -			  bank, bit, ident);
> +		drm_err(&gt->i915->drm,
> +			"INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> +			bank, bit, ident);
>  		return 0;
>  	}
>=20=20
> @@ -364,7 +365,8 @@ void gen6_gt_irq_handler(struct intel_gt *gt, u32 gt_=
iir)
>  	if (gt_iir & (GT_BLT_CS_ERROR_INTERRUPT |
>  		      GT_BSD_CS_ERROR_INTERRUPT |
>  		      GT_CS_MASTER_ERROR_INTERRUPT))
> -		DRM_DEBUG("Command parser error, gt_iir 0x%08x\n", gt_iir);
> +		drm_dbg(&gt->i915->drm, "Command parser error, gt_iir 0x%08x\n",
> +			gt_iir);
>=20=20
>  	if (gt_iir & GT_PARITY_ERROR(gt->i915))
>  		gen7_parity_error_irq_handler(gt, gt_iir);
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/g=
t/intel_rps.c
> index 6c34a83c24b3..effe60ac22cd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -430,7 +430,8 @@ static int __gen5_rps_set(struct intel_rps *rps, u8 v=
al)
>=20=20
>  	rgvswctl =3D intel_uncore_read16(uncore, MEMSWCTL);
>  	if (rgvswctl & MEMCTL_CMD_STS) {
> -		DRM_DEBUG("gpu busy, RCS change rejected\n");
> +		drm_dbg(&rps_to_i915(rps)->drm,
> +			"gpu busy, RCS change rejected\n");
>  		return -EBUSY; /* still busy with another command */
>  	}
>=20=20
> @@ -1953,7 +1954,8 @@ void gen6_rps_irq_handler(struct intel_rps *rps, u3=
2 pm_iir)
>  		intel_engine_cs_irq(gt->engine[VECS0], pm_iir >> 10);
>=20=20
>  	if (pm_iir & PM_VEBOX_CS_ERROR_INTERRUPT)
> -		DRM_DEBUG("Command parser error, pm_iir 0x%08x\n", pm_iir);
> +		drm_dbg(&rps_to_i915(rps)->drm,
> +			"Command parser error, pm_iir 0x%08x\n", pm_iir);
>  }
>=20=20
>  void gen5_rps_irq_handler(struct intel_rps *rps)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/dr=
m/i915/gt/intel_workarounds.c
> index 3cdf5c24dbc5..2af97d954fc4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -55,8 +55,11 @@
>   * - Public functions to init or apply the given workaround type.
>   */
>=20=20
> -static void wa_init_start(struct i915_wa_list *wal, const char *name, co=
nst char *engine_name)
> +static void wa_init_start(struct i915_wa_list *wal,
> +			  struct drm_i915_private *i915,
> +			  const char *name, const char *engine_name)
>  {
> +	wal->i915 =3D i915;
>  	wal->name =3D name;
>  	wal->engine_name =3D engine_name;
>  }
> @@ -80,13 +83,14 @@ static void wa_init_finish(struct i915_wa_list *wal)
>  	if (!wal->count)
>  		return;
>=20=20
> -	DRM_DEBUG_DRIVER("Initialized %u %s workarounds on %s\n",
> -			 wal->wa_count, wal->name, wal->engine_name);
> +	drm_dbg(&wal->i915->drm, "Initialized %u %s workarounds on %s\n",
> +		wal->wa_count, wal->name, wal->engine_name);
>  }
>=20=20
>  static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
>  {
>  	unsigned int addr =3D i915_mmio_reg_offset(wa->reg);
> +	struct drm_i915_private *i915 =3D wal->i915;
>  	unsigned int start =3D 0, end =3D wal->count;
>  	const unsigned int grow =3D WA_LIST_CHUNK;
>  	struct i915_wa *wa_;
> @@ -99,7 +103,7 @@ static void _wa_add(struct i915_wa_list *wal, const st=
ruct i915_wa *wa)
>  		list =3D kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*wa),
>  				     GFP_KERNEL);
>  		if (!list) {
> -			DRM_ERROR("No space for workaround init!\n");
> +			drm_err(&i915->drm, "No space for workaround init!\n");
>  			return;
>  		}
>=20=20
> @@ -122,9 +126,10 @@ static void _wa_add(struct i915_wa_list *wal, const =
struct i915_wa *wa)
>  			wa_ =3D &wal->list[mid];
>=20=20
>  			if ((wa->clr | wa_->clr) && !(wa->clr & ~wa_->clr)) {
> -				DRM_ERROR("Discarding overwritten w/a for reg %04x (clear: %08x, set=
: %08x)\n",
> -					  i915_mmio_reg_offset(wa_->reg),
> -					  wa_->clr, wa_->set);
> +				drm_err(&i915->drm,
> +					"Discarding overwritten w/a for reg %04x (clear: %08x, set: %08x)\n=
",
> +					i915_mmio_reg_offset(wa_->reg),
> +					wa_->clr, wa_->set);
>=20=20
>  				wa_->set &=3D ~wa->clr;
>  			}
> @@ -826,7 +831,7 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs *en=
gine,
>  {
>  	struct drm_i915_private *i915 =3D engine->i915;
>=20=20
> -	wa_init_start(wal, name, engine->name);
> +	wa_init_start(wal, i915, name, engine->name);
>=20=20
>  	/* Applies to all engines */
>  	/*
> @@ -1676,7 +1681,7 @@ void intel_gt_init_workarounds(struct intel_gt *gt)
>  {
>  	struct i915_wa_list *wal =3D &gt->wa_list;
>=20=20
> -	wa_init_start(wal, "GT", "global");
> +	wa_init_start(wal, gt->i915, "GT", "global");
>  	gt_init_workarounds(gt, wal);
>  	wa_init_finish(wal);
>  }
> @@ -1698,12 +1703,14 @@ wal_get_fw_for_rmw(struct intel_uncore *uncore, c=
onst struct i915_wa_list *wal)
>  }
>=20=20
>  static bool
> -wa_verify(const struct i915_wa *wa, u32 cur, const char *name, const cha=
r *from)
> +wa_verify(struct drm_i915_private *i915, const struct i915_wa *wa, u32 c=
ur,
> +	  const char *name, const char *from)
>  {
>  	if ((cur ^ wa->set) & wa->read) {
> -		DRM_ERROR("%s workaround lost on %s! (reg[%x]=3D0x%x, relevant bits we=
re 0x%x vs expected 0x%x)\n",
> -			  name, from, i915_mmio_reg_offset(wa->reg),
> -			  cur, cur & wa->read, wa->set & wa->read);
> +		drm_err(&i915->drm,
> +			"%s workaround lost on %s! (reg[%x]=3D0x%x, relevant bits were 0x%x v=
s expected 0x%x)\n",
> +			name, from, i915_mmio_reg_offset(wa->reg),
> +			cur, cur & wa->read, wa->set & wa->read);
>=20=20
>  		return false;
>  	}
> @@ -1749,7 +1756,7 @@ wa_list_apply(struct intel_gt *gt, const struct i91=
5_wa_list *wal)
>  				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>  				intel_uncore_read_fw(uncore, wa->reg);
>=20=20
> -			wa_verify(wa, val, wal->name, "application");
> +			wa_verify(wal->i915, wa, val, wal->name, "application");
>  		}
>  	}
>=20=20
> @@ -1779,7 +1786,7 @@ static bool wa_list_verify(struct intel_gt *gt,
>  	intel_uncore_forcewake_get__locked(uncore, fw);
>=20=20
>  	for (i =3D 0, wa =3D wal->list; i < wal->count; i++, wa++)
> -		ok &=3D wa_verify(wa, wa->is_mcr ?
> +		ok &=3D wa_verify(wal->i915, wa, wa->is_mcr ?
>  				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>  				intel_uncore_read_fw(uncore, wa->reg),
>  				wal->name, from);
> @@ -2127,7 +2134,7 @@ void intel_engine_init_whitelist(struct intel_engin=
e_cs *engine)
>  	struct drm_i915_private *i915 =3D engine->i915;
>  	struct i915_wa_list *w =3D &engine->whitelist;
>=20=20
> -	wa_init_start(w, "whitelist", engine->name);
> +	wa_init_start(w, i915, "whitelist", engine->name);
>=20=20
>  	if (IS_PONTEVECCHIO(i915))
>  		pvc_whitelist_build(engine);
> @@ -3012,7 +3019,7 @@ void intel_engine_init_workarounds(struct intel_eng=
ine_cs *engine)
>  	if (GRAPHICS_VER(engine->i915) < 4)
>  		return;
>=20=20
> -	wa_init_start(wal, "engine", engine->name);
> +	wa_init_start(wal, engine->i915, "engine", engine->name);
>  	engine_init_workarounds(engine, wal);
>  	wa_init_finish(wal);
>  }
> @@ -3193,7 +3200,7 @@ static int engine_wa_list_verify(struct intel_conte=
xt *ce,
>  		if (mcr_range(rq->engine->i915, i915_mmio_reg_offset(wa->reg)))
>  			continue;
>=20=20
> -		if (!wa_verify(wa, results[i], wal->name, from))
> +		if (!wa_verify(wal->i915, wa, results[i], wal->name, from))
>  			err =3D -ENXIO;
>  	}
>=20=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/=
gpu/drm/i915/gt/intel_workarounds_types.h
> index 7c8b01d00043..7e51e0219a5d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> @@ -10,6 +10,8 @@
>=20=20
>  #include "i915_reg_defs.h"
>=20=20
> +struct drm_i915_private;
> +
>  struct i915_wa {
>  	union {
>  		i915_reg_t	reg;
> @@ -24,6 +26,8 @@ struct i915_wa {
>  };
>=20=20
>  struct i915_wa_list {
> +	struct drm_i915_private *i915;
> +
>  	const char	*name;
>  	const char	*engine_name;
>  	struct i915_wa	*list;
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu=
/drm/i915/gt/selftest_workarounds.c
> index 21b1edc052f8..3dd761a690d7 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -66,14 +66,14 @@ reference_lists_init(struct intel_gt *gt, struct wa_l=
ists *lists)
>=20=20
>  	memset(lists, 0, sizeof(*lists));
>=20=20
> -	wa_init_start(&lists->gt_wa_list, "GT_REF", "global");
> +	wa_init_start(&lists->gt_wa_list, gt->i915, "GT_REF", "global");
>  	gt_init_workarounds(gt, &lists->gt_wa_list);
>  	wa_init_finish(&lists->gt_wa_list);
>=20=20
>  	for_each_engine(engine, gt, id) {
>  		struct i915_wa_list *wal =3D &lists->engine[id].wa_list;
>=20=20
> -		wa_init_start(wal, "REF", engine->name);
> +		wa_init_start(wal, gt->i915, "REF", engine->name);
>  		engine_init_workarounds(engine, wal);
>  		wa_init_finish(wal);
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i=
915_debugfs.c
> index ae987e92251d..6c7ac73b69a5 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -688,8 +688,8 @@ i915_drop_caches_set(void *data, u64 val)
>  	unsigned int flags;
>  	int ret;
>=20=20
> -	DRM_DEBUG("Dropping caches: 0x%08llx [0x%08llx]\n",
> -		  val, val & DROP_ALL);
> +	drm_dbg(&i915->drm, "Dropping caches: 0x%08llx [0x%08llx]\n",
> +		val, val & DROP_ALL);
>=20=20
>  	ret =3D gt_drop_caches(to_gt(i915), val);
>  	if (ret)
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_=
gem.c
> index 299f94a9fb87..8132743ca87e 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1286,7 +1286,7 @@ int i915_gem_open(struct drm_i915_private *i915, st=
ruct drm_file *file)
>  	struct i915_drm_client *client;
>  	int ret =3D -ENOMEM;
>=20=20
> -	DRM_DEBUG("\n");
> +	drm_dbg(&i915->drm, "\n");
>=20=20
>  	file_priv =3D kzalloc(sizeof(*file_priv), GFP_KERNEL);
>  	if (!file_priv)
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/=
i915_getparam.c
> index 3047e80e1163..61ef2d9cfa62 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -179,7 +179,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void =
*data,
>  		value =3D i915_perf_oa_timestamp_frequency(i915);
>  		break;
>  	default:
> -		DRM_DEBUG("Unknown parameter %d\n", param->param);
> +		drm_dbg(&i915->drm, "Unknown parameter %d\n", param->param);
>  		return -EINVAL;
>  	}
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index b0180ea38de0..6c20817f8967 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -1086,8 +1086,9 @@ static void ivb_parity_work(struct work_struct *wor=
k)
>  		kobject_uevent_env(&dev_priv->drm.primary->kdev->kobj,
>  				   KOBJ_CHANGE, parity_event);
>=20=20
> -		DRM_DEBUG("Parity error: Slice =3D %d, Row =3D %d, Bank =3D %d, Sub ba=
nk =3D %d.\n",
> -			  slice, row, bank, subbank);
> +		drm_dbg(&dev_priv->drm,
> +			"Parity error: Slice =3D %d, Row =3D %d, Bank =3D %d, Sub bank =3D %d=
.\n",
> +			slice, row, bank, subbank);
>=20=20
>  		kfree(parity_event[4]);
>  		kfree(parity_event[3]);
> @@ -2774,7 +2775,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *a=
rg)
>  		master_ctl =3D raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
>  		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
>  	} else {
> -		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
> +		drm_err(&i915->drm, "Tile not supported: 0x%08x\n",
> +			master_tile_ctl);
>  		dg1_master_intr_enable(regs);
>  		return IRQ_NONE;
>  	}
> @@ -3940,7 +3942,7 @@ static void i8xx_error_irq_ack(struct drm_i915_priv=
ate *i915,
>  static void i8xx_error_irq_handler(struct drm_i915_private *dev_priv,
>  				   u16 eir, u16 eir_stuck)
>  {
> -	DRM_DEBUG("Master Error: EIR 0x%04x\n", eir);
> +	drm_dbg(&dev_priv->drm, "Master Error: EIR 0x%04x\n", eir);
>=20=20
>  	if (eir_stuck)
>  		drm_dbg(&dev_priv->drm, "EIR stuck: 0x%04x, masked\n",
> @@ -3975,7 +3977,7 @@ static void i9xx_error_irq_ack(struct drm_i915_priv=
ate *dev_priv,
>  static void i9xx_error_irq_handler(struct drm_i915_private *dev_priv,
>  				   u32 eir, u32 eir_stuck)
>  {
> -	DRM_DEBUG("Master Error, EIR 0x%08x\n", eir);
> +	drm_dbg(&dev_priv->drm, "Master Error, EIR 0x%08x\n", eir);
>=20=20
>  	if (eir_stuck)
>  		drm_dbg(&dev_priv->drm, "EIR stuck: 0x%08x, masked\n",
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915=
_perf.c
> index 0dd597a7a11f..9e6f060592d8 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -530,9 +530,9 @@ static bool oa_buffer_check_unlocked(struct i915_perf=
_stream *stream)
>=20=20
>  		if (OA_TAKEN(hw_tail, tail) > report_size &&
>  		    __ratelimit(&stream->perf->tail_pointer_race))
> -			DRM_NOTE("unlanded report(s) head=3D0x%x "
> -				 "tail=3D0x%x hw_tail=3D0x%x\n",
> -				 head, tail, hw_tail);
> +			drm_notice(&stream->uncore->i915->drm,
> +				   "unlanded report(s) head=3D0x%x tail=3D0x%x hw_tail=3D0x%x\n",
> +				   head, tail, hw_tail);
>=20=20
>  		stream->oa_buffer.tail =3D gtt_offset + tail;
>  		stream->oa_buffer.aging_tail =3D gtt_offset + hw_tail;
> @@ -1015,7 +1015,8 @@ static int gen7_append_oa_reports(struct i915_perf_=
stream *stream,
>  		 */
>  		if (report32[0] =3D=3D 0) {
>  			if (__ratelimit(&stream->perf->spurious_report_rs))
> -				DRM_NOTE("Skipping spurious, invalid OA report\n");
> +				drm_notice(&uncore->i915->drm,
> +					   "Skipping spurious, invalid OA report\n");
>  			continue;
>  		}
>=20=20
> @@ -1602,8 +1603,9 @@ static void i915_oa_stream_destroy(struct i915_perf=
_stream *stream)
>  	free_noa_wait(stream);
>=20=20
>  	if (perf->spurious_report_rs.missed) {
> -		DRM_NOTE("%d spurious OA report notices suppressed due to ratelimiting=
\n",
> -			 perf->spurious_report_rs.missed);
> +		drm_notice(&gt->i915->drm,
> +			   "%d spurious OA report notices suppressed due to ratelimiting\n",
> +			   perf->spurious_report_rs.missed);
>  	}
>  }
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i91=
5_query.c
> index 6ec9c9fb7b0d..00871ef99792 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -250,8 +250,9 @@ static int query_perf_config_data(struct drm_i915_pri=
vate *i915,
>  		return total_size;
>=20=20
>  	if (query_item->length < total_size) {
> -		DRM_DEBUG("Invalid query config data item size=3D%u expected=3D%u\n",
> -			  query_item->length, total_size);
> +		drm_dbg(&i915->drm,
> +			"Invalid query config data item size=3D%u expected=3D%u\n",
> +			query_item->length, total_size);
>  		return -EINVAL;
>  	}
>=20=20
> @@ -418,9 +419,10 @@ static int query_perf_config_list(struct drm_i915_pr=
ivate *i915,
>  	} while (n_configs > alloc);
>=20=20
>  	if (query_item->length < sizeof_perf_config_list(n_configs)) {
> -		DRM_DEBUG("Invalid query config list item size=3D%u expected=3D%zu\n",
> -			  query_item->length,
> -			  sizeof_perf_config_list(n_configs));
> +		drm_dbg(&i915->drm,
> +			"Invalid query config list item size=3D%u expected=3D%zu\n",
> +			query_item->length,
> +			sizeof_perf_config_list(n_configs));
>  		kfree(oa_config_ids);
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i91=
5_sysfs.c
> index 1e2750210831..595e8b574990 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -218,7 +218,8 @@ static const struct bin_attribute error_state_attr =
=3D {
>  static void i915_setup_error_capture(struct device *kdev)
>  {
>  	if (sysfs_create_bin_file(&kdev->kobj, &error_state_attr))
> -		DRM_ERROR("error_state sysfs setup failed\n");
> +		drm_err(&kdev_minor_to_i915(kdev)->drm,
> +			"error_state sysfs setup failed\n");
>  }
>=20=20
>  static void i915_teardown_error_capture(struct device *kdev)
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_=
vma.c
> index c39488eb9eeb..3b969d679c1e 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -73,14 +73,16 @@ static void vma_print_allocator(struct i915_vma *vma,=
 const char *reason)
>  	char buf[512];
>=20=20
>  	if (!vma->node.stack) {
> -		DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: unknown owner\n",
> -				 vma->node.start, vma->node.size, reason);
> +		drm_dbg(&to_i915(vma->obj->base.dev)->drm
> +			"vma.node [%08llx + %08llx] %s: unknown owner\n",
> +			vma->node.start, vma->node.size, reason);
>  		return;
>  	}
>=20=20
>  	stack_depot_snprint(vma->node.stack, buf, sizeof(buf), 0);
> -	DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: inserted at %s\n",
> -			 vma->node.start, vma->node.size, reason, buf);
> +	drm_dbg(&to_i915(vma->obj->base.dev)->drm,
> +		"vma.node [%08llx + %08llx] %s: inserted at %s\n",
> +		vma->node.start, vma->node.size, reason, buf);
>  }
>=20=20
>  #else
> @@ -782,9 +784,9 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem=
_ww_ctx *ww,
>  	 * attempt to find space.
>  	 */
>  	if (size > end) {
> -		DRM_DEBUG("Attempting to bind an object larger than the aperture: requ=
est=3D%llu > %s aperture=3D%llu\n",
> -			  size, flags & PIN_MAPPABLE ? "mappable" : "total",
> -			  end);
> +		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
> +			"Attempting to bind an object larger than the aperture: request=3D%ll=
u > %s aperture=3D%llu\n",
> +			size, flags & PIN_MAPPABLE ? "mappable" : "total", end);
>  		return -ENOSPC;
>  	}
>=20=20
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/i=
ntel_uncore.c
> index 2a3e2869fe71..6c25c9e7090a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -178,8 +178,9 @@ static inline void
>  fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
>  {
>  	if (wait_ack_clear(d, FORCEWAKE_KERNEL)) {
> -		DRM_ERROR("%s: timed out waiting for forcewake ack to clear.\n",
> -			  intel_uncore_forcewake_domain_to_str(d->id));
> +		drm_err(&d->uncore->i915->drm,
> +			"%s: timed out waiting for forcewake ack to clear.\n",
> +			intel_uncore_forcewake_domain_to_str(d->id));
>  		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>  	}
>  }
> @@ -226,11 +227,12 @@ fw_domain_wait_ack_with_fallback(const struct intel=
_uncore_forcewake_domain *d,
>  		fw_clear(d, FORCEWAKE_KERNEL_FALLBACK);
>  	} while (!ack_detected && pass++ < 10);
>=20=20
> -	DRM_DEBUG_DRIVER("%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> -			 intel_uncore_forcewake_domain_to_str(d->id),
> -			 type =3D=3D ACK_SET ? "set" : "clear",
> -			 fw_ack(d),
> -			 pass);
> +	drm_dbg(&d->uncore->i915->drm,
> +		"%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> +		intel_uncore_forcewake_domain_to_str(d->id),
> +		type =3D=3D ACK_SET ? "set" : "clear",
> +		fw_ack(d),
> +		pass);
>=20=20
>  	return ack_detected ? 0 : -ETIMEDOUT;
>  }
> @@ -255,8 +257,9 @@ static inline void
>  fw_domain_wait_ack_set(const struct intel_uncore_forcewake_domain *d)
>  {
>  	if (wait_ack_set(d, FORCEWAKE_KERNEL)) {
> -		DRM_ERROR("%s: timed out waiting for forcewake ack request.\n",
> -			  intel_uncore_forcewake_domain_to_str(d->id));
> +		drm_err(&d->uncore->i915->drm,
> +			"%s: timed out waiting for forcewake ack request.\n",
> +			intel_uncore_forcewake_domain_to_str(d->id));
>  		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>  	}
>  }

--=20
Jani Nikula, Intel Open Source Graphics Center
