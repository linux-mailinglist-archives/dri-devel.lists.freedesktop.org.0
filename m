Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A854F0EF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 08:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4183910F04B;
	Fri, 17 Jun 2022 06:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA4D10EBD3;
 Fri, 17 Jun 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655446218; x=1686982218;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5XQky/KEO73dI9jLWrvixRjFNbdY373PFwQhvIc/rOs=;
 b=j3qn+4jZSD+XP0do/XDXkBT094wv23A0acSgPhX4FJKOhSxCGQW6Ndzl
 M3iGnE47OpDZ9ewILZRUFC6Qd6zvL3r+AnwNWjEeAJlQKLiugsAGFZ+cj
 VrvY+Cu8MPEJo+DE/QyGd9VwAVblP5AfuwSVSWwTNRulLLZfqwMvLJwkf
 b6k8LaNyLFIH9ON1uJGiQ3XSw3c+ZlaSMJZyaVh3oRJOd6t9LaTSrQUzB
 fmYzallvEIC+UnKLYDbOXonGHP76+mUPyGuwTjeXjU79Yky2uxRNCLqs/
 DD9klXRLnmMbTnt8/BwFjnuxftZonQa+Vw8Y+ym8PEeipS5vy7ku3V58u Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259889589"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259889589"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 23:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="589983612"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2022 23:10:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 16 Jun 2022 23:10:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 16 Jun 2022 23:10:16 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Thu, 16 Jun 2022 23:10:16 -0700
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 3/9] drm/i915/dg2: Add DG2_NB_MBD subplatform
Thread-Topic: [PATCH v2 3/9] drm/i915/dg2: Add DG2_NB_MBD subplatform
Thread-Index: AQHYgXjTrMso0WaPBk+JWuds/eSZo61TMGWA///t51A=
Date: Fri, 17 Jun 2022 06:10:16 +0000
Message-ID: <466454a33e944bbcb8929e22d7e3ec30@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-4-anshuman.gupta@intel.com>
 <YqvHCa4j8QwMNrmd@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <YqvHCa4j8QwMNrmd@mdroper-desk1.amr.corp.intel.com>
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
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ewins,
 Jon" <jon.ewins@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Friday, June 17, 2022 5:43 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Nil=
awar,
> Badal <badal.nilawar@intel.com>; Ewins, Jon <jon.ewins@intel.com>; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.c=
om>;
> Tangudu, Tilak <tilak.tangudu@intel.com>
> Subject: Re: [PATCH v2 3/9] drm/i915/dg2: Add DG2_NB_MBD subplatform
>=20
> On Thu, Jun 16, 2022 at 05:31:00PM +0530, Anshuman Gupta wrote:
> > DG2 NB SKU need to distinguish between MBD and AIC to probe the VRAM
> > Self Refresh feature support. Adding those sub platform accordingly.
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
> >  drivers/gpu/drm/i915/intel_device_info.c | 21 +++++++++++++++++++++
> > drivers/gpu/drm/i915/intel_device_info.h | 11 +++++++----
> >  include/drm/i915_pciids.h                | 23 ++++++++++++++++-------
> >  4 files changed, 47 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h
> > b/drivers/gpu/drm/i915/i915_drv.h index a5bc6a774c5a..f1f8699eedfd
> > 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1007,10 +1007,13 @@ IS_SUBPLATFORM(const struct drm_i915_private
> > *i915,  #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv,
> > INTEL_PONTEVECCHIO)
> >
> >  #define IS_DG2_G10(dev_priv) \
> > +	IS_SUBPLATFORM(dev_priv, INTEL_DG2,
> INTEL_SUBPLATFORM_G10_NB_MBD) ||
> > +\
> >  	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10)
> #define
> > IS_DG2_G11(dev_priv) \
> > +	IS_SUBPLATFORM(dev_priv, INTEL_DG2,
> INTEL_SUBPLATFORM_G11_NB_MBD) ||
> > +\
> >  	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11)
> #define
> > IS_DG2_G12(dev_priv) \
> > +	IS_SUBPLATFORM(dev_priv, INTEL_DG2,
> INTEL_SUBPLATFORM_G12_NB_MBD) ||
> > +\
> >  	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12)
> #define
> > IS_ADLS_RPLS(dev_priv) \
> >  	IS_SUBPLATFORM(dev_priv, INTEL_ALDERLAKE_S,
> INTEL_SUBPLATFORM_RPL)
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c
> > b/drivers/gpu/drm/i915/intel_device_info.c
> > index f0bf23726ed8..93da555adc4e 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> > @@ -187,6 +187,18 @@ static const u16 subplatform_rpl_ids[] =3D {
> >  	INTEL_RPLP_IDS(0),
> >  };
> >
> > +static const u16 subplatform_g10_mb_mbd_ids[] =3D {
> > +	INTEL_DG2_G10_NB_MBD_IDS(0),
> > +};
> > +
> > +static const u16 subplatform_g11_mb_mbd_ids[] =3D {
> > +	INTEL_DG2_G11_NB_MBD_IDS(0),
> > +};
> > +
> > +static const u16 subplatform_g12_mb_mbd_ids[] =3D {
> > +	INTEL_DG2_G12_NB_MBD_IDS(0),
> > +};
>=20
> We only need a single MBD subplatform, not three new subplatforms.
> Unless I'm forgetting something, a single device ID can be assigned two t=
wo
> independent subplatforms at the same time.  So the decision about whether=
 to
> set the G10, G11, or G12 bit is one decision.  The decision about whether=
 to set
> the MBD bit is a completely separate decision that doesn't care about the
> G10/G11/G12 stuff.
>=20
> > +
> >  static const u16 subplatform_g10_ids[] =3D {
> >  	INTEL_DG2_G10_IDS(0),
> >  	INTEL_ATS_M150_IDS(0),
> > @@ -246,6 +258,15 @@ void intel_device_info_subplatform_init(struct
> drm_i915_private *i915)
> >  	} else if (find_devid(devid, subplatform_rpl_ids,
> >  			      ARRAY_SIZE(subplatform_rpl_ids))) {
> >  		mask =3D BIT(INTEL_SUBPLATFORM_RPL);
> > +	} else if (find_devid(devid, subplatform_g10_mb_mbd_ids,
> > +			      ARRAY_SIZE(subplatform_g10_mb_mbd_ids))) {
> > +		mask =3D BIT(INTEL_SUBPLATFORM_G10_NB_MBD);
> > +	} else if (find_devid(devid, subplatform_g11_mb_mbd_ids,
> > +			      ARRAY_SIZE(subplatform_g11_mb_mbd_ids))) {
> > +		mask =3D BIT(INTEL_SUBPLATFORM_G11_NB_MBD);
> > +	} else if (find_devid(devid, subplatform_g12_mb_mbd_ids,
> > +			      ARRAY_SIZE(subplatform_g12_mb_mbd_ids))) {
> > +		mask =3D BIT(INTEL_SUBPLATFORM_G12_NB_MBD);
>=20
> Assuming you consolidate MBD back down to just a single extra subplatform=
,
> the lookup and bit setting should happen in a separate 'if'
> statement (not an 'else' block).
>=20
>         if (find_devid(devid, subplatform_mbd_ids,
>                        ARRAY_SIZE(subplatform_mbd_ids)))
>                 mask |=3D BIT(INTEL_SUBPLATFORM_MBD);
Thanks Matt , Jani and Tvrtko for review comment,
I will create only INTEL_SUBPLATFORM_MBD and address it.
Regards,
Anshuman Gupta.
>=20
>=20
> Matt
>=20
> >  	} else if (find_devid(devid, subplatform_g10_ids,
> >  			      ARRAY_SIZE(subplatform_g10_ids))) {
> >  		mask =3D BIT(INTEL_SUBPLATFORM_G10);
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h
> > b/drivers/gpu/drm/i915/intel_device_info.h
> > index 08341174ee0a..c929e2d7e59c 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -97,7 +97,7 @@ enum intel_platform {
> >   * it is fine for the same bit to be used on multiple parent platforms=
.
> >   */
> >
> > -#define INTEL_SUBPLATFORM_BITS (3)
> > +#define INTEL_SUBPLATFORM_BITS (6)
> >  #define INTEL_SUBPLATFORM_MASK (BIT(INTEL_SUBPLATFORM_BITS) - 1)
> >
> >  /* HSW/BDW/SKL/KBL/CFL */
> > @@ -111,9 +111,12 @@ enum intel_platform {
> >  #define INTEL_SUBPLATFORM_UY	(0)
> >
> >  /* DG2 */
> > -#define INTEL_SUBPLATFORM_G10	0
> > -#define INTEL_SUBPLATFORM_G11	1
> > -#define INTEL_SUBPLATFORM_G12	2
> > +#define INTEL_SUBPLATFORM_G10_NB_MBD	0
> > +#define INTEL_SUBPLATFORM_G11_NB_MBD	1
> > +#define INTEL_SUBPLATFORM_G12_NB_MBD	2
> > +#define INTEL_SUBPLATFORM_G10	3
> > +#define INTEL_SUBPLATFORM_G11	4
> > +#define INTEL_SUBPLATFORM_G12	5
> >
> >  /* ADL */
> >  #define INTEL_SUBPLATFORM_RPL	0
> > diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> > index 4585fed4e41e..198be417bb2d 100644
> > --- a/include/drm/i915_pciids.h
> > +++ b/include/drm/i915_pciids.h
> > @@ -693,32 +693,41 @@
> >  	INTEL_VGA_DEVICE(0xA7A9, info)
> >
> >  /* DG2 */
> > -#define INTEL_DG2_G10_IDS(info) \
> > +#define INTEL_DG2_G10_NB_MBD_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x5690, info), \
> >  	INTEL_VGA_DEVICE(0x5691, info), \
> > -	INTEL_VGA_DEVICE(0x5692, info), \
> > +	INTEL_VGA_DEVICE(0x5692, info)
> > +
> > +#define INTEL_DG2_G11_NB_MBD_IDS(info) \
> > +	INTEL_VGA_DEVICE(0x5693, info), \
> > +	INTEL_VGA_DEVICE(0x5694, info), \
> > +	INTEL_VGA_DEVICE(0x5695, info)
> > +
> > +#define INTEL_DG2_G12_NB_MBD_IDS(info) \
> > +	INTEL_VGA_DEVICE(0x5696, info), \
> > +	INTEL_VGA_DEVICE(0x5697, info)
> > +
> > +#define INTEL_DG2_G10_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x56A0, info), \
> >  	INTEL_VGA_DEVICE(0x56A1, info), \
> >  	INTEL_VGA_DEVICE(0x56A2, info)
> >
> >  #define INTEL_DG2_G11_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x5693, info), \
> > -	INTEL_VGA_DEVICE(0x5694, info), \
> > -	INTEL_VGA_DEVICE(0x5695, info), \
> >  	INTEL_VGA_DEVICE(0x56A5, info), \
> >  	INTEL_VGA_DEVICE(0x56A6, info), \
> >  	INTEL_VGA_DEVICE(0x56B0, info), \
> >  	INTEL_VGA_DEVICE(0x56B1, info)
> >
> >  #define INTEL_DG2_G12_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x5696, info), \
> > -	INTEL_VGA_DEVICE(0x5697, info), \
> >  	INTEL_VGA_DEVICE(0x56A3, info), \
> >  	INTEL_VGA_DEVICE(0x56A4, info), \
> >  	INTEL_VGA_DEVICE(0x56B2, info), \
> >  	INTEL_VGA_DEVICE(0x56B3, info)
> >
> >  #define INTEL_DG2_IDS(info) \
> > +	INTEL_DG2_G10_NB_MBD_IDS(info), \
> > +	INTEL_DG2_G11_NB_MBD_IDS(info), \
> > +	INTEL_DG2_G12_NB_MBD_IDS(info), \
> >  	INTEL_DG2_G10_IDS(info), \
> >  	INTEL_DG2_G11_IDS(info), \
> >  	INTEL_DG2_G12_IDS(info)
> > --
> > 2.26.2
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
