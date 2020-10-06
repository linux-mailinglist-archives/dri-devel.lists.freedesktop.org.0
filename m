Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB20285475
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 00:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCC86E5CC;
	Tue,  6 Oct 2020 22:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B836E5CC;
 Tue,  6 Oct 2020 22:23:25 +0000 (UTC)
IronPort-SDR: xIFuVpR05stgYmfsDXcZNrFnxMMoc4e+0rBwWRvJXAL2qM0cjuxVzMclYDq9BAyjBW1yzRlaj4
 tIToUPhrs7ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="163952474"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="163952474"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 15:23:25 -0700
IronPort-SDR: tq4bQ1VzttERd3UJhWxlgjvAIQFVYMbrOxqKl4gyst1e5fT0gsR1Arlmdo/EQmTeF5mzT35VJg
 irf7V7ZlJlRw==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="297338742"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 15:23:25 -0700
Date: Tue, 6 Oct 2020 15:23:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI
 ids
Message-ID: <20201006222324.GB2784854@mdroper-desk1.amr.corp.intel.com>
References: <20201001212435.269840-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20201001212435.269840-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20201002095856.GY6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002095856.GY6112@intel.com>
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
Cc: hariom.pandey@intel.com, james.ausmus@intel.com,
 intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 jose.souza@intel.com, dri-devel@lists.freedesktop.org,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 02, 2020 at 12:58:56PM +0300, Ville Syrj=E4l=E4 wrote:
> On Fri, Oct 02, 2020 at 02:54:34AM +0530, Tejas Upadhyay wrote:
> > Split the basic platform definition, macros, and PCI IDs to
> > differentiate between EHL and JSL platforms.
> > =

> > Changes since V2 :
> > 	- Added IS_EHL_JSL to replace IS_ELKHARTLAKE
> > 	- EHL/JSL PCI ids split added
> > Changes since V1 :
> > 	- IS_ELKHARTLAKE and IS_JASPERLAKE is replaced with
> >           HAS_PCH_MCC(EHL) and HAS_PCH_JSP(JSL) respectively
> > 	- Reverted EHL/JSL PCI ids split change
> > =

> > Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel=
.com>
> > ---
> >  drivers/gpu/drm/i915/display/icl_dsi.c         |  4 ++--
> >  drivers/gpu/drm/i915/display/intel_cdclk.c     |  4 ++--
> >  drivers/gpu/drm/i915/display/intel_combo_phy.c |  6 +++---
> >  drivers/gpu/drm/i915/display/intel_display.c   |  8 ++++----
> >  drivers/gpu/drm/i915/display/intel_dp.c        |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dpll_mgr.c  | 16 ++++++++--------
> >  drivers/gpu/drm/i915/gt/intel_sseu.c           |  2 +-
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c    |  2 +-
> >  drivers/gpu/drm/i915/i915_drv.h                |  5 +++--
> >  drivers/gpu/drm/i915/i915_pci.c                |  9 +++++++++
> >  drivers/gpu/drm/i915/intel_device_info.c       |  1 +
> >  drivers/gpu/drm/i915/intel_device_info.h       |  1 +
> >  drivers/gpu/drm/i915/intel_pch.c               |  6 +++---
> >  include/drm/i915_pciids.h                      |  9 ++++++---
> >  14 files changed, 45 insertions(+), 30 deletions(-)
> > =

> <snip>
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/=
drm/i915/gt/intel_workarounds.c
> > index 6c580d0d9ea8..5d81a55993e5 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -1839,7 +1839,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine=
, struct i915_wa_list *wal)
> >  			    GEN12_FF_TESSELATION_DOP_GATE_DISABLE);
> >  =

> >  		/* Wa_22010271021:ehl */
> > -		if (IS_ELKHARTLAKE(i915))
> > +		if (IS_EHL_JSL(i915))
> >  			wa_masked_en(wal,
> >  				     GEN9_CS_DEBUG_MODE1,
> >  				     FF_DOP_CLOCK_GATE_DISABLE);
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i91=
5_drv.h
> > index eef9a821c49c..2c75bcb76932 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1417,7 +1417,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i91=
5,
> >  #define IS_COMETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COMETLAKE)
> >  #define IS_CANNONLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_CANNONLAKE)
> >  #define IS_ICELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ICELAKE)
> > -#define IS_ELKHARTLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ELKHARTLA=
KE)
> =

> Why are we removing this? I would just keep it + add the IS_JASPERLAKE()
> too.

This is what we discussed before --- anywhere the driver might use
IS_ELKHARTLAKE() or IS_JASPERLAKE() by themselves would be a bug.  The
one and only place the two should be distinguished is in the vswing code
(since we're actually trying to match the board characteristics rather
than the GPU), so is we never create these macros in the first place it
will help prevent anyone from accidentally using them.  The vswing code
can just do an explicit IS_PLATFORM check with a comment explaining why
we treat the boards differently.


Matt

> =

> > +#define IS_EHL_JSL(dev_priv)	(IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE)=
 || \
> > +				IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))
> =

> A bit non-standard thing, but I guess it's fine. We already have the =

> oddball IS_GEN9_{LP,BC}() anyway.
> =

> But since JSL is the canonical name used by Bspec I would make that our
> "primary" name for this. Ie. I would call the macro IS_JSL_EHL(). And
> since I'm a bit ocd about ordering things I would generally make it so
> that JSL comes first, followed by EHL, everywhere.
> =

> >  #define IS_TIGERLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_TIGERLAKE)
> >  #define IS_ROCKETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ROCKETLAKE)
> >  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, INTEL_DG1)
> > @@ -1559,7 +1560,7 @@ extern const struct i915_rev_steppings kbl_revids=
[];
> >  #define EHL_REVID_A0            0x0
> >  =

> >  #define IS_EHL_REVID(p, since, until) \
> > -	(IS_ELKHARTLAKE(p) && IS_REVID(p, since, until))
> > +	(IS_EHL_JSL(p) && IS_REVID(p, since, until))
> =

> That is confusing. Either we want just IS_ELKHARTLAKE() here, or
> this macro should also be renamed to contain JSL in the name.
> =

> >  =

> >  enum {
> >  	TGL_REVID_A0,
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index 366ddfc8df6b..8690b69fcf33 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -846,6 +846,14 @@ static const struct intel_device_info ehl_info =3D=
 {
> >  	.ppgtt_size =3D 36,
> >  };
> >  =

> > +static const struct intel_device_info jsl_info =3D {
> > +	GEN11_FEATURES,
> > +	PLATFORM(INTEL_JASPERLAKE),
> > +	.require_force_probe =3D 1,
> > +	.platform_engine_mask =3D BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BIT(VEC=
S0),
> > +	.ppgtt_size =3D 36,
> > +};
> > +
> >  #define GEN12_FEATURES \
> >  	GEN11_FEATURES, \
> >  	GEN(12), \
> > @@ -985,6 +993,7 @@ static const struct pci_device_id pciidlist[] =3D {
> >  	INTEL_CNL_IDS(&cnl_info),
> >  	INTEL_ICL_11_IDS(&icl_info),
> >  	INTEL_EHL_IDS(&ehl_info),
> > +	INTEL_JSL_IDS(&jsl_info),
> >  	INTEL_TGL_12_IDS(&tgl_info),
> >  	INTEL_RKL_IDS(&rkl_info),
> >  	{0, 0, 0}
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm=
/i915/intel_device_info.c
> > index adc836f15fde..e67cec8fa2aa 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> > @@ -62,6 +62,7 @@ static const char * const platform_names[] =3D {
> >  	PLATFORM_NAME(CANNONLAKE),
> >  	PLATFORM_NAME(ICELAKE),
> >  	PLATFORM_NAME(ELKHARTLAKE),
> > +	PLATFORM_NAME(JASPERLAKE),
> >  	PLATFORM_NAME(TIGERLAKE),
> >  	PLATFORM_NAME(ROCKETLAKE),
> >  	PLATFORM_NAME(DG1),
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm=
/i915/intel_device_info.h
> > index 6a3d607218aa..d92fa041c700 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -79,6 +79,7 @@ enum intel_platform {
> >  	/* gen11 */
> >  	INTEL_ICELAKE,
> >  	INTEL_ELKHARTLAKE,
> > +	INTEL_JASPERLAKE,
> >  	/* gen12 */
> >  	INTEL_TIGERLAKE,
> >  	INTEL_ROCKETLAKE,
> > diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/in=
tel_pch.c
> > index 6c97192e9ca8..72ffb6d4d5fc 100644
> > --- a/drivers/gpu/drm/i915/intel_pch.c
> > +++ b/drivers/gpu/drm/i915/intel_pch.c
> > @@ -115,7 +115,7 @@ intel_pch_type(const struct drm_i915_private *dev_p=
riv, unsigned short id)
> >  		return PCH_ICP;
> >  	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
> >  		drm_dbg_kms(&dev_priv->drm, "Found Mule Creek Canyon PCH\n");
> > -		drm_WARN_ON(&dev_priv->drm, !IS_ELKHARTLAKE(dev_priv));
> > +		drm_WARN_ON(&dev_priv->drm, !IS_EHL_JSL(dev_priv));
> >  		return PCH_MCC;
> >  	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
> >  	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
> > @@ -126,7 +126,7 @@ intel_pch_type(const struct drm_i915_private *dev_p=
riv, unsigned short id)
> >  	case INTEL_PCH_JSP_DEVICE_ID_TYPE:
> >  	case INTEL_PCH_JSP2_DEVICE_ID_TYPE:
> >  		drm_dbg_kms(&dev_priv->drm, "Found Jasper Lake PCH\n");
> > -		drm_WARN_ON(&dev_priv->drm, !IS_ELKHARTLAKE(dev_priv));
> > +		drm_WARN_ON(&dev_priv->drm, !IS_EHL_JSL(dev_priv));
> >  		return PCH_JSP;
> >  	default:
> >  		return PCH_NONE;
> > @@ -157,7 +157,7 @@ intel_virt_detect_pch(const struct drm_i915_private=
 *dev_priv)
> >  =

> >  	if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv))
> >  		id =3D INTEL_PCH_TGP_DEVICE_ID_TYPE;
> > -	else if (IS_ELKHARTLAKE(dev_priv))
> > +	else if (IS_EHL_JSL(dev_priv))
> >  		id =3D INTEL_PCH_MCC_DEVICE_ID_TYPE;
> >  	else if (IS_ICELAKE(dev_priv))
> >  		id =3D INTEL_PCH_ICP_DEVICE_ID_TYPE;
> > diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> > index 7eeecb07c9a1..1b5e09cfa11e 100644
> > --- a/include/drm/i915_pciids.h
> > +++ b/include/drm/i915_pciids.h
> > @@ -579,15 +579,18 @@
> >  	INTEL_VGA_DEVICE(0x8A51, info), \
> >  	INTEL_VGA_DEVICE(0x8A5D, info)
> >  =

> > -/* EHL/JSL */
> > +/* EHL */
> >  #define INTEL_EHL_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x4500, info),	\
> >  	INTEL_VGA_DEVICE(0x4571, info), \
> >  	INTEL_VGA_DEVICE(0x4551, info), \
> >  	INTEL_VGA_DEVICE(0x4541, info), \
> > -	INTEL_VGA_DEVICE(0x4E71, info), \
> >  	INTEL_VGA_DEVICE(0x4557, info), \
> > -	INTEL_VGA_DEVICE(0x4555, info), \
> > +	INTEL_VGA_DEVICE(0x4555, info)
> > +
> > +/* JSL */
> > +#define INTEL_JSL_IDS(info) \
> > +	INTEL_VGA_DEVICE(0x4E71, info), \
> >  	INTEL_VGA_DEVICE(0x4E61, info), \
> >  	INTEL_VGA_DEVICE(0x4E57, info), \
> >  	INTEL_VGA_DEVICE(0x4E55, info), \
> > -- =

> > 2.28.0
> =

> -- =

> Ville Syrj=E4l=E4
> Intel

-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
