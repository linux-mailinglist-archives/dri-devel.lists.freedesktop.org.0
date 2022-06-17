Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A4154F492
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 11:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87EB10E3F4;
	Fri, 17 Jun 2022 09:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6410E3F4;
 Fri, 17 Jun 2022 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655459214; x=1686995214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KXEnXgNDrAErlxD7j82RG9oulPM+b0QnUDgZk9UwHsw=;
 b=FRKGJgDiWKdzqm9S5EP3jhieyV5b96y81YJZwoAh2uQhR9yYzgHeGwgd
 wPnGqVYPAGSN0wAKfnIU+8VpNOz2IArzqkoaftUtkY81x9y9FgLZlokFA
 nQfDX14kkHJIhHF655P+pAegpMbpyFXQu97HOM4pCV01fetLQRNROtMmH
 VtFdch8mIeXAN7ZqoZHs9O7LOj82LnH9WT6vPUMvpIxvtte47KkYhcg0w
 VBAzPxtTDP9Jmm0XC4OayR0Y3srhAsiBT8zAc2/UqAemp6fUvMu/Nt9fZ
 GGtICxTIErnI4qzeZVcnrWpXKYyxQL4tDkjEyo6qleyhV4tFx+IYMrteW Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259318732"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259318732"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 02:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="613502086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 17 Jun 2022 02:46:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 02:46:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 02:46:52 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Fri, 17 Jun 2022 02:46:52 -0700
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/9] drm/i915/dgfx: OpRegion VRAM Self Refresh Support
Thread-Topic: [PATCH v2 1/9] drm/i915/dgfx: OpRegion VRAM Self Refresh Support
Thread-Index: AQHYgXjO0MNE6IglPkq8BShwksBCYq1Sc0kAgADn50A=
Date: Fri, 17 Jun 2022 09:46:52 +0000
Message-ID: <c61962481a694a2f93cfb16c5096b56b@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-2-anshuman.gupta@intel.com> <87a6acwyvt.fsf@intel.com>
In-Reply-To: <87a6acwyvt.fsf@intel.com>
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
Cc: "Tangudu, Tilak" <tilak.tangudu@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, "Ewins, Jon" <jon.ewins@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Thursday, June 16, 2022 6:26 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Ewins, Jon <jon.ewins@intel.com>; Vivi, Rodrig=
o
> <rodrigo.vivi@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>; Tan=
gudu,
> Tilak <tilak.tangudu@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: Re: [PATCH v2 1/9] drm/i915/dgfx: OpRegion VRAM Self Refresh
> Support
>=20
> On Thu, 16 Jun 2022, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > Intel DGFX cards provides a feature Video Ram Self Refrsh(VRSR).
> > DGFX VRSR can be enabled with runtime suspend D3Cold flow and with
> > opportunistic S0ix system wide suspend flow as well.
> >
> > Without VRSR enablement i915 has to evict the lmem objects to system
> > memory. Depending on some heuristics driver will evict lmem objects
> > without VRSR.
> >
> > VRSR feature requires Host BIOS support, VRSR will be enable/disable
> > by HOST BIOS using ACPI OpRegion.
> >
> > Adding OpRegion VRSR support in order to enable/disable VRSR on
> > discrete cards.
> >
> > BSpec: 53440
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_opregion.c | 62
> > ++++++++++++++++++-  drivers/gpu/drm/i915/display/intel_opregion.h |
> > 11 ++++
> >  2 files changed, 72 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c
> > b/drivers/gpu/drm/i915/display/intel_opregion.c
> > index 6876ba30d5a9..11d8c5bb23ac 100644
> > --- a/drivers/gpu/drm/i915/display/intel_opregion.c
> > +++ b/drivers/gpu/drm/i915/display/intel_opregion.c
> > @@ -53,6 +53,8 @@
> >  #define MBOX_ASLE_EXT		BIT(4)	/* Mailbox #5 */
> >  #define MBOX_BACKLIGHT		BIT(5)	/* Mailbox #2 (valid from v3.x)
> */
> >
> > +#define PCON_DGFX_BIOS_SUPPORTS_VRSR			BIT(11)
> > +#define PCON_DGFX_BIOS_SUPPORTS_VRSR_FIELD_VALID	BIT(12)
> >  #define PCON_HEADLESS_SKU	BIT(13)
> >
> >  struct opregion_header {
> > @@ -130,7 +132,8 @@ struct opregion_asle {
> >  	u64 rvda;	/* Physical (2.0) or relative from opregion (2.1+)
> >  			 * address of raw VBT data. */
> >  	u32 rvds;	/* Size of raw vbt data */
> > -	u8 rsvd[58];
> > +	u8 vrsr;	/* DGFX Video Ram Self Refresh */
> > +	u8 rsvd[57];
> >  } __packed;
> >
> >  /* OpRegion mailbox #5: ASLE ext */
> > @@ -201,6 +204,9 @@ struct opregion_asle_ext {
> >
> >  #define ASLE_PHED_EDID_VALID_MASK	0x3
> >
> > +/* VRAM SR */
> > +#define ASLE_VRSR_ENABLE		BIT(0)
> > +
> >  /* Software System Control Interrupt (SWSCI) */
> >  #define SWSCI_SCIC_INDICATOR		(1 << 0)
> >  #define SWSCI_SCIC_MAIN_FUNCTION_SHIFT	1
> > @@ -921,6 +927,8 @@ int intel_opregion_setup(struct drm_i915_private
> *dev_priv)
> >  		opregion->header->over.minor,
> >  		opregion->header->over.revision);
> >
> > +	drm_dbg(&dev_priv->drm, "OpRegion PCON values 0x%x\n",
> > +opregion->header->pcon);
> > +
> >  	mboxes =3D opregion->header->mboxes;
> >  	if (mboxes & MBOX_ACPI) {
> >  		drm_dbg(&dev_priv->drm, "Public ACPI methods supported\n");
> @@
> > -1246,3 +1254,55 @@ void intel_opregion_unregister(struct drm_i915_priv=
ate
> *i915)
> >  	opregion->vbt =3D NULL;
> >  	opregion->lid_state =3D NULL;
> >  }
> > +
> > +/**
> > + * intel_opregion_bios_supports_vram_sr() get HOST BIOS VRAM Self
> > + * Refresh capability support.
> > + * @i915: pointer to i915 device.
> > + *
> > + * It checks opregion pcon vram_sr fields to get HOST BIOS vram_sr
> > + * capability support. It is only applocable to DGFX.
> > + *
> > + * Returns:
> > + * true when bios supports vram_sr, or false if bios doesn't support.
> > + */
> > +bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private
> > +*i915) {
> > +	struct intel_opregion *opregion =3D &i915->opregion;
> > +
> > +	if (!IS_DGFX(i915))
> > +		return false;
> > +
> > +	if (!opregion)
>=20
> This is always true. You should check for !opregion->header.
>=20
> > +		return false;
> > +
> > +	if (opregion->header->pcon &
> PCON_DGFX_BIOS_SUPPORTS_VRSR_FIELD_VALID)
> > +		return opregion->header->pcon &
> PCON_DGFX_BIOS_SUPPORTS_VRSR;
> > +	else
> > +		return false;
> > +}
> > +
> > +/**
> > + * intel_opregion_vram_sr() - enable/disable VRAM Self Refresh.
> > + * @i915: pointer to i915 device.
> > + * @enable: Argument to enable/disable VRSR.
> > + *
> > + * It enables/disables vram_sr in opregion ASLE MBOX, based upon that
> > + * HOST BIOS will enables and disbales VRAM_SR during
> > + * ACPI _PS3/_OFF and _PS/_ON glue method.
> > + */
> > +void intel_opregion_vram_sr(struct drm_i915_private *i915, bool
> > +enable) {
> > +	struct intel_opregion *opregion =3D &i915->opregion;
> > +
> > +	if (!opregion)
>=20
> Same as above.
>=20
> > +		return;
> > +
> > +	if (drm_WARN(&i915->drm, !opregion->asle, "ASLE MAILBOX3 is not
> available\n"))
> > +		return;
>=20
> I'd just bundle !opregion->asle into the early return.
>=20
> > +
> > +	if (enable)
> > +		opregion->asle->vrsr |=3D ASLE_VRSR_ENABLE;
> > +	else
> > +		opregion->asle->vrsr &=3D ~ASLE_VRSR_ENABLE; }
> > diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h
> > b/drivers/gpu/drm/i915/display/intel_opregion.h
> > index 2f261f985400..73c9d81d5ee6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_opregion.h
> > +++ b/drivers/gpu/drm/i915/display/intel_opregion.h
> > @@ -75,6 +75,8 @@ int intel_opregion_notify_adapter(struct
> drm_i915_private *dev_priv,
> >  				  pci_power_t state);
> >  int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
> > struct edid *intel_opregion_get_edid(struct intel_connector
> > *connector);
> > +bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private
> > +*i915); void intel_opregion_vram_sr(struct drm_i915_private *i915,
> > +bool enable);
> >
> >  bool intel_opregion_headless_sku(struct drm_i915_private *i915);
> >
> > @@ -134,6 +136,15 @@ static inline bool intel_opregion_headless_sku(str=
uct
> drm_i915_private *i915)
> >  	return false;
> >  }
> >
> > +static bool intel_opregion_bios_supports_vram_sr(struct
> > +drm_i915_private *i915) {
> > +	return false;
> > +}
> > +
> > +static void intel_opregion_vram_sr(struct drm_i915_private *i915,
> > +bool enable) { }
> > +
>=20
> Both of these stubs need to be static inline.
Thanks for I will fix all of above comment.
Regards,
Anshuman Gupta.
>=20
> BR,
> Jani.
>=20
> >  #endif /* CONFIG_ACPI */
> >
> >  #endif
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
