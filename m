Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D05542DA4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 12:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4F510E373;
	Wed,  8 Jun 2022 10:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3EA10E182;
 Wed,  8 Jun 2022 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654684247; x=1686220247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jqF9jU5P7g97ANyjHG2YiqzPJANo8jrNFo3dcZwjCe0=;
 b=LsDmC315HQ3wP3SDkjGDCyCO31ylhXR+jdxrVYagF+dLPA8Zd3g0pfvB
 MYMhSaipIIvieZOOkVnfMGf1/PsiU+ba4zj8rQNwkbvyb6Nf4DJhWMq64
 xlaJkw/Ynj/zgZemq5rzWIQMrOfHjbKkS0JCHyM5strcQK9l8Ta9OIx5+
 h/51hcOQ5f9b1eWcOEccOFGzgFbPPOcfIwaqJerH4C/MhS1xDhOlTirEo
 vlOKwjojrweQpvHsGys/xqEuCU2X+PRIJYWfrGgqQqD9TFQwyLAChvck8
 7RmCyi+Ls4UgxwDJKpn0IXSxEDdIF9Y3VL+CK5/H5QxHlBbTmqclWQn7G g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="260005299"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="260005299"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 03:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="636738311"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jun 2022 03:30:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 03:30:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 03:30:45 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Wed, 8 Jun 2022 03:30:45 -0700
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: More PVC+DG2 workarounds
Thread-Topic: [PATCH] drm/i915: More PVC+DG2 workarounds
Thread-Index: AQHYetHZvaDmsimpXkewkkVgEw8ccq1FRZBw
Date: Wed, 8 Jun 2022 10:30:45 +0000
Message-ID: <c3ad73d5f88b4616b1c4c1799e722583@intel.com>
References: <20220608005108.3717895-1-matthew.d.roper@intel.com>
In-Reply-To: <20220608005108.3717895-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
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
Cc: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, June 8, 2022 6:21 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Roper, Matthew D
> <matthew.d.roper@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> Kumar Valsan, Prathap <prathap.kumar.valsan@intel.com>
> Subject: [PATCH] drm/i915: More PVC+DG2 workarounds
>=20
> A new PVC+DG2 workaround has appeared recently:
>  - Wa_16015675438
>=20
> And a couple existing DG2 workarounds have been extended to PVC:
>  - Wa_14015795083
>  - Wa_18018781329
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Regards,
Anshuman Gupta.
>=20
> Note that Wa_16015675438 asks us to program a register that is in the 0x2=
xxx
> range typically associated with the RCS engine, even though PVC does not =
have
> an RCS.  By default the GuC will think we've made a mistake and throw an
> exception when it sees this register on a CCS engine's save/restore list,=
 so we
> need to pass an extra GuC control flag to tell it that this is expected a=
nd not a
> problem.
>=20
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 24 +++++++++++++++------
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c      |  4 ++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  1 +
>  4 files changed, 23 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index c8129a351731..226557018037 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -140,6 +140,7 @@
>  #define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
>  #define   GEN9_TSG_BARRIER_ACK_DISABLE		(1 << 8)
>  #define   GEN9_POOLED_EU_LOAD_BALANCING_FIX_DISABLE	(1 << 10)
> +#define   GEN12_PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
>=20
>  #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 1e7ca3863f20..e1e70eff9aac 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1491,13 +1491,20 @@ dg2_gt_workarounds_init(struct intel_gt *gt, stru=
ct
> i915_wa_list *wal)
>  	wa_write_clr(wal, GEN7_MISCCPCTL,
> GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>  }
>=20
> +static void
> +pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> +{
> +	/* Wa_14015795083 */
> +	wa_write_clr(wal, GEN7_MISCCPCTL,
> GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> +}
> +
>  static void
>  gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)  {
>  	struct drm_i915_private *i915 =3D gt->i915;
>=20
>  	if (IS_PONTEVECCHIO(i915))
> -		; /* none yet */
> +		pvc_gt_workarounds_init(gt, wal);
>  	else if (IS_DG2(i915))
>  		dg2_gt_workarounds_init(gt, wal);
>  	else if (IS_XEHPSDV(i915))
> @@ -2082,12 +2089,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine,
> struct i915_wa_list *wal)
>  		 * performance guide section.
>  		 */
>  		wa_write_or(wal, XEHP_L3SCQREG7,
> BLEND_FILL_CACHING_OPT_DIS);
> -
> -		/* Wa_18018781329:dg2 */
> -		wa_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
>  	}
>=20
>  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) { @@ -
> 2700,6 +2701,15 @@ general_render_compute_wa_init(struct intel_engine_cs
> *engine, struct i915_wa_li
>=20
>  		/* Wa_22014226127:dg2,pvc */
>  		wa_write_or(wal, LSC_CHICKEN_BIT_0,
> DISABLE_D8_D16_COASLESCE);
> +
> +		/* Wa_16015675438:dg2,pvc */
> +		wa_masked_en(wal, FF_SLICE_CS_CHICKEN2,
> +GEN12_PERF_FIX_BALANCING_CFE_DISABLE);
> +
> +		/* Wa_18018781329:dg2,pvc */
> +		wa_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
>  	}
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 2c4ad4a65089..35887cb53201 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -327,6 +327,10 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>  	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_FOREVER))
>  		flags |=3D GUC_WA_CONTEXT_ISOLATION;
>=20
> +	/* Wa_16015675438 */
> +	if (!RCS_MASK(gt))
> +		flags |=3D GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
> +
>  	return flags;
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 42cb7a9a6199..b3c9a9327f76 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -105,6 +105,7 @@
>  #define   GUC_WA_PRE_PARSER		BIT(14)
>  #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
>  #define   GUC_WA_POLLCS			BIT(18)
> +#define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
>=20
>  #define GUC_CTL_FEATURE			2
>  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> --
> 2.35.3

