Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5462527D77B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 22:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D2F897C5;
	Tue, 29 Sep 2020 20:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA2D897C5;
 Tue, 29 Sep 2020 20:02:08 +0000 (UTC)
IronPort-SDR: MSZ2+eLq45TLjCWUrnJ/U18NBcO7kNOjPsTEA9lFoMTB6ZhZHZdRkjh3c2rlicwewp8q+WappG
 9CVzIUAwfzpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="223877762"
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="223877762"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 13:02:05 -0700
IronPort-SDR: 9z9X6VaJx8AlDQInaJ3yFeQp/5d6gyC5P8SI91dQoMEIts3viNWijLN8CATsuwU3WPp61Z9xLV
 Uhwp2am1Y19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="312336123"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 29 Sep 2020 13:02:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Sep 2020 23:02:01 +0300
Date: Tue, 29 Sep 2020 23:02:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Message-ID: <20200929200201.GH6112@intel.com>
References: <20200929121127.254086-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <d235e6f34182e327d8bb46383f6c3ef518b5fc23.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d235e6f34182e327d8bb46383f6c3ef518b5fc23.camel@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 07:33:45PM +0000, Souza, Jose wrote:
> On Tue, 2020-09-29 at 17:41 +0530, Tejas Upadhyay wrote:
> > JSL has update in vswing table for eDP
> =

> Would be nice to mention in the commit description why PCH is being used,=
 that would avoid Ville's question.

If the thing has nothing to do PCH then it should not use the PCH type
for the the check. Instead we should just do the EHL/JSL split.

> =

> > =

> > BSpec: 21257
> > =

> > Changes since V1 : =

> > 	- IS_ELKHARTLAKE and IS_JASPERLAKE is replaced with
> >           HAS_PCH_MCC(EHL) and HAS_PCH_JSP(JSL) respectively
> > 	- Reverted EHL/JSL PCI ids split change
> > =

> > Signed-off-by: Tejas Upadhyay <
> > tejaskumarx.surendrakumar.upadhyay@intel.com
> > >
> > ---
> >  drivers/gpu/drm/i915/display/intel_ddi.c | 67 ++++++++++++++++++++++--
> >  1 file changed, 64 insertions(+), 3 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm=
/i915/display/intel_ddi.c
> > index 4d06178cd76c..e6e93d01d0ce 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -582,6 +582,34 @@ static const struct cnl_ddi_buf_trans ehl_combo_ph=
y_ddi_translations_dp[] =3D {
> >  	{ 0x6, 0x7F, 0x3F, 0x00, 0x00 },	/* 900   900      0.0   */
> >  };
> >  =

> > +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_e=
dp_hbr[] =3D {
> > +						/* NT mV Trans mV db    */
> > +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   200      0.0   */
> > +	{ 0x8, 0x7F, 0x38, 0x00, 0x07 },	/* 200   250      1.9   */
> > +	{ 0x1, 0x7F, 0x33, 0x00, 0x0C },	/* 200   300      3.5   */
> > +	{ 0xA, 0x35, 0x36, 0x00, 0x09 },	/* 200   350      4.9   */
> > +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   250      0.0   */
> > +	{ 0x1, 0x7F, 0x38, 0x00, 0x07 },	/* 250   300      1.6   */
> > +	{ 0xA, 0x35, 0x35, 0x00, 0x0A },	/* 250   350      2.9   */
> > +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 300   300      0.0   */
> > +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 300   350      1.3   */
> > +	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },	/* 350   350      0.0   */
> > +};
> > +
> > +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_e=
dp_hbr2[] =3D {
> > +						/* NT mV Trans mV db    */
> > +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   200      0.0   */
> > +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   250      1.9   */
> > +	{ 0x1, 0x7F, 0x3D, 0x00, 0x02 },	/* 200   300      3.5   */
> > +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 200   350      4.9   */
> > +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   250      0.0   */
> > +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   300      1.6   */
> > +	{ 0xA, 0x35, 0x3A, 0x00, 0x05 },	/* 250   350      2.9   */
> > +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 300   300      0.0   */
> > +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 300   350      1.3   */
> > +	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },	/* 350   350      0.0   */
> > +};
> =

> Tables matches specification.
> =

> > +
> >  struct icl_mg_phy_ddi_buf_trans {
> >  	u32 cri_txdeemph_override_11_6;
> >  	u32 cri_txdeemph_override_5_0;
> > @@ -1069,7 +1097,6 @@ icl_get_mg_buf_trans(struct intel_encoder *encode=
r, int type, int rate,
> >  	*n_entries =3D ARRAY_SIZE(icl_mg_phy_ddi_translations_rbr_hbr);
> >  	return icl_mg_phy_ddi_translations_rbr_hbr;
> >  }
> > -
> =

> Probably not intentional.
> =

> Reviewed-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> =

> Will push with this line fixed as soon as CI finish testing.
> =

> =

> >  static const struct cnl_ddi_buf_trans *
> >  ehl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int r=
ate,
> >  			int *n_entries)
> > @@ -1098,6 +1125,34 @@ ehl_get_combo_buf_trans(struct intel_encoder *en=
coder, int type, int rate,
> >  	}
> >  }
> >  =

> > +static const struct cnl_ddi_buf_trans *
> > +jsl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int r=
ate,
> > +			int *n_entries)
> > +{
> > +	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> > +
> > +	switch (type) {
> > +	case INTEL_OUTPUT_HDMI:
> > +		*n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_hdmi);
> > +		return icl_combo_phy_ddi_translations_hdmi;
> > +	case INTEL_OUTPUT_EDP:
> > +		if (dev_priv->vbt.edp.low_vswing) {
> > +			if (rate > 270000) {
> > +				*n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr2);
> > +				return jsl_combo_phy_ddi_translations_edp_hbr2;
> > +			} else {
> > +				*n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr);
> > +				return jsl_combo_phy_ddi_translations_edp_hbr;
> > +			}
> > +		}
> > +		/* fall through */
> > +	default:
> > +		/* All combo DP and eDP ports that do not support low_vswing */
> > +		*n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_dp_hbr2);
> > +		return icl_combo_phy_ddi_translations_dp_hbr2;
> > +	}
> > +}
> > +
> >  static const struct cnl_ddi_buf_trans *
> >  tgl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int r=
ate,
> >  			int *n_entries)
> > @@ -2265,7 +2320,10 @@ static u8 intel_ddi_dp_voltage_max(struct intel_=
dp *intel_dp)
> >  			tgl_get_dkl_buf_trans(encoder, encoder->type,
> >  					      intel_dp->link_rate, &n_entries);
> >  	} else if (INTEL_GEN(dev_priv) =3D=3D 11) {
> > -		if (IS_ELKHARTLAKE(dev_priv))
> > +		if (HAS_PCH_JSP(dev_priv))
> > +			jsl_get_combo_buf_trans(encoder, encoder->type,
> > +						intel_dp->link_rate, &n_entries);
> > +		else if (HAS_PCH_MCC(dev_priv))
> >  			ehl_get_combo_buf_trans(encoder, encoder->type,
> >  						intel_dp->link_rate, &n_entries);
> >  		else if (intel_phy_is_combo(dev_priv, phy))
> > @@ -2454,7 +2512,10 @@ static void icl_ddi_combo_vswing_program(struct =
intel_encoder *encoder,
> >  	if (INTEL_GEN(dev_priv) >=3D 12)
> >  		ddi_translations =3D tgl_get_combo_buf_trans(encoder, type, rate,
> >  							   &n_entries);
> > -	else if (IS_ELKHARTLAKE(dev_priv))
> > +	else if (HAS_PCH_JSP(dev_priv))
> > +		ddi_translations =3D jsl_get_combo_buf_trans(encoder, type, rate,
> > +							   &n_entries);
> > +	else if (HAS_PCH_MCC(dev_priv))
> >  		ddi_translations =3D ehl_get_combo_buf_trans(encoder, type, rate,
> >  							   &n_entries);
> >  	else
> > =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
