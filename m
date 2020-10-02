Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6C2810B0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 12:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5286E922;
	Fri,  2 Oct 2020 10:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580896E0BC;
 Fri,  2 Oct 2020 10:43:56 +0000 (UTC)
IronPort-SDR: YR0G4Lyukg/1hGS8wZSAicx2Zw41FmHZ1VGgX8ZUzq5D32TKoQ1TqvBM+3ldyUt6SIB+AKC+lt
 lIaKt/RsTUGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="163046163"
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; d="scan'208";a="163046163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 03:43:50 -0700
IronPort-SDR: R3gCt58Th0m/YwIkhYe6MdrwVt5boGwZp2nA26TKDzDmy5pDa0MU+Pdd9NqICkFR8pkfwWWOH8
 3Z/do//+EKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; d="scan'208";a="313469387"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 02 Oct 2020 03:43:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Oct 2020 13:43:45 +0300
Date: Fri, 2 Oct 2020 13:43:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [PATCH v3 2/2] drm/i915/edp/jsl: Update vswing table for HBR and
 HBR2
Message-ID: <20201002104345.GZ6112@intel.com>
References: <20201001212435.269840-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20201001212435.269840-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001212435.269840-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
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
Cc: hariom.pandey@intel.com, james.ausmus@intel.com,
 intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 jose.souza@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 02, 2020 at 02:54:35AM +0530, Tejas Upadhyay wrote:
> JSL has update in vswing table for eDP.
> =

> BSpec: 21257
> =

> Changes since V2 :
> 	- Added IS_EHL_JSL to replace IS_ELKHARTLAKE
> 	- EHL/JSL PCI ids split added
> 	- Changes rebased as per new drm top commit
> =

> Changes since V1 :
>             - IS_ELKHARTLAKE and IS_JASPERLAKE is replaced with
>               HAS_PCH_MCC(EHL) and HAS_PCH_JSP(JSL) respectively
>             - Reverted EHL/JSL PCI ids split change
> =

> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.c=
om>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 95 ++++++++++++++++++++++--
>  1 file changed, 89 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index b4c520348b3b..6c67232247ec 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -582,6 +582,34 @@ static const struct cnl_ddi_buf_trans ehl_combo_phy_=
ddi_translations_dp[] =3D {
>  	{ 0x6, 0x7F, 0x3F, 0x00, 0x00 },	/* 900   900      0.0   */
>  };
>  =

> +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp=
_hbr[] =3D {
> +						/* NT mV Trans mV db    */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   200      0.0   */
> +	{ 0x8, 0x7F, 0x38, 0x00, 0x07 },	/* 200   250      1.9   */
> +	{ 0x1, 0x7F, 0x33, 0x00, 0x0C },	/* 200   300      3.5   */
> +	{ 0xA, 0x35, 0x36, 0x00, 0x09 },	/* 200   350      4.9   */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   250      0.0   */
> +	{ 0x1, 0x7F, 0x38, 0x00, 0x07 },	/* 250   300      1.6   */
> +	{ 0xA, 0x35, 0x35, 0x00, 0x0A },	/* 250   350      2.9   */
> +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 300   300      0.0   */
> +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 300   350      1.3   */
> +	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },	/* 350   350      0.0   */
> +};
> +
> +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp=
_hbr2[] =3D {
> +						/* NT mV Trans mV db    */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   200      0.0   */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   250      1.9   */
> +	{ 0x1, 0x7F, 0x3D, 0x00, 0x02 },	/* 200   300      3.5   */
> +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 200   350      4.9   */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   250      0.0   */
> +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   300      1.6   */
> +	{ 0xA, 0x35, 0x3A, 0x00, 0x05 },	/* 250   350      2.9   */
> +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 300   300      0.0   */
> +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 300   350      1.3   */
> +	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },	/* 350   350      0.0   */
> +};
> +
>  struct icl_mg_phy_ddi_buf_trans {
>  	u32 cri_txdeemph_override_11_6;
>  	u32 cri_txdeemph_override_5_0;
> @@ -1167,6 +1195,57 @@ ehl_get_combo_buf_trans(struct intel_encoder *enco=
der,
>  		return ehl_get_combo_buf_trans_dp(encoder, crtc_state, n_entries);
>  }
>  =

> +static const struct cnl_ddi_buf_trans *
> +jsl_get_combo_buf_trans_hdmi(struct intel_encoder *encoder,
> +			     const struct intel_crtc_state *crtc_state,
> +			     int *n_entries)
> +{
> +	*n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_hdmi);
> +	return icl_combo_phy_ddi_translations_hdmi;
> +}
> +
> +static const struct cnl_ddi_buf_trans *
> +jsl_get_combo_buf_trans_dp(struct intel_encoder *encoder,
> +			   const struct intel_crtc_state *crtc_state,
> +			   int *n_entries)
> +{
> +	*n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_dp_hbr2);
> +	return icl_combo_phy_ddi_translations_dp_hbr2;
> +}
> +
> +static const struct cnl_ddi_buf_trans *
> +jsl_get_combo_buf_trans_edp(struct intel_encoder *encoder,
> +			    const struct intel_crtc_state *crtc_state,
> +			    int *n_entries)
> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> +
> +	if (dev_priv->vbt.edp.low_vswing) {
> +		if (crtc_state->port_clock > 270000) {
> +			*n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr2);
> +			return jsl_combo_phy_ddi_translations_edp_hbr2;
> +		} else {
> +			*n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr);
> +			return jsl_combo_phy_ddi_translations_edp_hbr;
> +		}
> +	}
> +
> +	return jsl_get_combo_buf_trans_dp(encoder, crtc_state, n_entries);
> +}
> +
> +static const struct cnl_ddi_buf_trans *
> +jsl_get_combo_buf_trans(struct intel_encoder *encoder,
> +			const struct intel_crtc_state *crtc_state,
> +			int *n_entries)
> +{
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
> +		return jsl_get_combo_buf_trans_hdmi(encoder, crtc_state, n_entries);
> +	else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
> +		return jsl_get_combo_buf_trans_edp(encoder, crtc_state, n_entries);
> +	else
> +		return jsl_get_combo_buf_trans_dp(encoder, crtc_state, n_entries);
> +}
> +
>  static const struct cnl_ddi_buf_trans *
>  tgl_get_combo_buf_trans_hdmi(struct intel_encoder *encoder,
>  			     const struct intel_crtc_state *crtc_state,
> @@ -2368,8 +2447,10 @@ static u8 intel_ddi_dp_voltage_max(struct intel_dp=
 *intel_dp,
>  		else
>  			tgl_get_dkl_buf_trans(encoder, crtc_state, &n_entries);
>  	} else if (INTEL_GEN(dev_priv) =3D=3D 11) {
> -		if (IS_ELKHARTLAKE(dev_priv))

Your first patch seems to have missed a bunch of things. Did you not use
eg. sed or cocci to do the conversion?

> +		if (IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
>  			ehl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
> +		else if (IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
> +			jsl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
>  		else if (intel_phy_is_combo(dev_priv, phy))
>  			icl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
>  		else
> @@ -2549,8 +2630,10 @@ static void icl_ddi_combo_vswing_program(struct in=
tel_encoder *encoder,
>  =

>  	if (INTEL_GEN(dev_priv) >=3D 12)
>  		ddi_translations =3D tgl_get_combo_buf_trans(encoder, crtc_state, &n_e=
ntries);
> -	else if (IS_ELKHARTLAKE(dev_priv))
> +	else if (IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
>  		ddi_translations =3D ehl_get_combo_buf_trans(encoder, crtc_state, &n_e=
ntries);
> +	else if (IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))
> +		ddi_translations =3D jsl_get_combo_buf_trans(encoder, crtc_state, &n_e=
ntries);
>  	else
>  		ddi_translations =3D icl_get_combo_buf_trans(encoder, crtc_state, &n_e=
ntries);
>  	if (!ddi_translations)
> @@ -3140,7 +3223,7 @@ static void intel_ddi_clk_select(struct intel_encod=
er *encoder,
>  		if (!intel_phy_is_combo(dev_priv, phy))
>  			intel_de_write(dev_priv, DDI_CLK_SEL(port),
>  				       icl_pll_to_ddi_clk_sel(encoder, crtc_state));
> -		else if (IS_ELKHARTLAKE(dev_priv) && port >=3D PORT_C)
> +		else if (IS_EHL_JSL(dev_priv) && port >=3D PORT_C)
>  			/*
>  			 * MG does not exist but the programming is required
>  			 * to ungate DDIC and DDID
> @@ -3189,7 +3272,7 @@ static void intel_ddi_clk_disable(struct intel_enco=
der *encoder)
>  =

>  	if (INTEL_GEN(dev_priv) >=3D 11) {
>  		if (!intel_phy_is_combo(dev_priv, phy) ||
> -		    (IS_ELKHARTLAKE(dev_priv) && port >=3D PORT_C))
> +		    (IS_EHL_JSL(dev_priv) && port >=3D PORT_C))
>  			intel_de_write(dev_priv, DDI_CLK_SEL(port),
>  				       DDI_CLK_SEL_NONE);
>  	} else if (IS_CANNONLAKE(dev_priv)) {
> @@ -4334,7 +4417,7 @@ void intel_ddi_compute_min_voltage_level(struct drm=
_i915_private *dev_priv,
>  {
>  	if (INTEL_GEN(dev_priv) >=3D 12 && crtc_state->port_clock > 594000)
>  		crtc_state->min_voltage_level =3D 2;
> -	else if (IS_ELKHARTLAKE(dev_priv) && crtc_state->port_clock > 594000)
> +	else if (IS_EHL_JSL(dev_priv) && crtc_state->port_clock > 594000)
>  		crtc_state->min_voltage_level =3D 3;
>  	else if (INTEL_GEN(dev_priv) >=3D 11 && crtc_state->port_clock > 594000)
>  		crtc_state->min_voltage_level =3D 1;
> @@ -5186,7 +5269,7 @@ void intel_ddi_init(struct drm_i915_private *dev_pr=
iv, enum port port)
>  		encoder->hpd_pin =3D rkl_hpd_pin(dev_priv, port);
>  	else if (INTEL_GEN(dev_priv) >=3D 12)
>  		encoder->hpd_pin =3D tgl_hpd_pin(dev_priv, port);
> -	else if (IS_ELKHARTLAKE(dev_priv))
> +	else if (IS_EHL_JSL(dev_priv))
>  		encoder->hpd_pin =3D ehl_hpd_pin(dev_priv, port);
>  	else if (IS_GEN(dev_priv, 11))
>  		encoder->hpd_pin =3D icl_hpd_pin(dev_priv, port);
> -- =

> 2.28.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
