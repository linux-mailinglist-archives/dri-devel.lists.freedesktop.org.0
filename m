Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C228D624
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 23:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB6C6E953;
	Tue, 13 Oct 2020 21:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F986E951;
 Tue, 13 Oct 2020 21:08:22 +0000 (UTC)
IronPort-SDR: EU/6x8JXP1JeQdmc1RwDwkDqBm1sKDMWN/Go77a/YB2i4GZB9WK0cOItCLittkZQMpuX+VvKLi
 +snFgbt7jhfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="163347560"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="163347560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 14:08:21 -0700
IronPort-SDR: XXIJf7eXSvrKuVwzqNPA+bYuiStJ4WNSD8wAeei542LxJxHfwRDW/nx9ftqXO+aQNy4ykd86TX
 5bszanq5+FNA==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="318444033"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 14:08:21 -0700
Date: Tue, 13 Oct 2020 14:08:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [PATCH V2] drm/i915/jsl: Split EHL/JSL platform info and PCI ids
Message-ID: <20201013210819.GO3805439@mdroper-desk1.amr.corp.intel.com>
References: <20201013192948.63470-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013192948.63470-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 14, 2020 at 12:59:48AM +0530, Tejas Upadhyay wrote:
> Recently we came across requirement to identify EHL and JSL
> platform to program them differently. Thus Split the basic
> platform definition, macros, and PCI IDs to differentiate
> between EHL and JSL platforms. Also, IS_ELKHARTLAKE is replaced
> with IS_JSL_EHL everywhere.
> =

> Changes since V1 :
> 	- Rebased to avoid merge conflicts
> 	- Added missed check for jasperlake in intel_uc_fw.c
> =

> Cc : Matt Roper <matthew.d.roper@intel.com>
> Cc : Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.c=
om>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c         |  4 ++--
>  drivers/gpu/drm/i915/display/intel_cdclk.c     |  4 ++--
>  drivers/gpu/drm/i915/display/intel_combo_phy.c |  6 +++---
>  drivers/gpu/drm/i915/display/intel_ddi.c       | 12 ++++++------
>  drivers/gpu/drm/i915/display/intel_display.c   |  8 ++++----
>  drivers/gpu/drm/i915/display/intel_dp.c        |  2 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c  | 16 ++++++++--------
>  drivers/gpu/drm/i915/gt/intel_sseu.c           |  2 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c    |  4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c       |  1 +
>  drivers/gpu/drm/i915/i915_drv.h                |  7 ++++---
>  drivers/gpu/drm/i915/i915_pci.c                |  9 +++++++++
>  drivers/gpu/drm/i915/intel_device_info.c       |  1 +
>  drivers/gpu/drm/i915/intel_device_info.h       |  1 +
>  drivers/gpu/drm/i915/intel_pch.c               |  6 +++---
>  include/drm/i915_pciids.h                      |  9 ++++++---
>  16 files changed, 54 insertions(+), 38 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i91=
5/display/icl_dsi.c
> index 4400e83f783f..096652921453 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -455,7 +455,7 @@ static void gen11_dsi_config_phy_lanes_sequence(struc=
t intel_encoder *encoder)
>  		intel_de_write(dev_priv, ICL_PORT_TX_DW2_GRP(phy), tmp);
>  =

>  		/* For EHL, TGL, set latency optimization for PCS_DW1 lanes */
> -		if (IS_ELKHARTLAKE(dev_priv) || (INTEL_GEN(dev_priv) >=3D 12)) {
> +		if (IS_JSL_EHL(dev_priv) || (INTEL_GEN(dev_priv) >=3D 12)) {
>  			tmp =3D intel_de_read(dev_priv,
>  					    ICL_PORT_PCS_DW1_AUX(phy));
>  			tmp &=3D ~LATENCY_OPTIM_MASK;
> @@ -612,7 +612,7 @@ gen11_dsi_setup_dphy_timings(struct intel_encoder *en=
coder,
>  		}
>  	}
>  =

> -	if (IS_ELKHARTLAKE(dev_priv)) {
> +	if (IS_JSL_EHL(dev_priv)) {
>  		for_each_dsi_phy(phy, intel_dsi->phys) {
>  			tmp =3D intel_de_read(dev_priv, ICL_DPHY_CHKN(phy));
>  			tmp |=3D ICL_DPHY_CHKN_AFE_OVER_PPI_STRAP;
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 7dbf153279fb..7b46330fa69c 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2588,7 +2588,7 @@ static int intel_compute_max_dotclk(struct drm_i915=
_private *dev_priv)
>   */
>  void intel_update_max_cdclk(struct drm_i915_private *dev_priv)
>  {
> -	if (IS_ELKHARTLAKE(dev_priv)) {
> +	if (IS_JSL_EHL(dev_priv)) {
>  		if (dev_priv->cdclk.hw.ref =3D=3D 24000)
>  			dev_priv->max_cdclk_freq =3D 552000;
>  		else
> @@ -2829,7 +2829,7 @@ void intel_init_cdclk_hooks(struct drm_i915_private=
 *dev_priv)
>  		dev_priv->display.modeset_calc_cdclk =3D bxt_modeset_calc_cdclk;
>  		dev_priv->display.calc_voltage_level =3D tgl_calc_voltage_level;
>  		dev_priv->cdclk.table =3D icl_cdclk_table;
> -	} else if (IS_ELKHARTLAKE(dev_priv)) {
> +	} else if (IS_JSL_EHL(dev_priv)) {
>  		dev_priv->display.set_cdclk =3D bxt_set_cdclk;
>  		dev_priv->display.bw_calc_min_cdclk =3D skl_bw_calc_min_cdclk;
>  		dev_priv->display.modeset_calc_cdclk =3D bxt_modeset_calc_cdclk;
> diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu=
/drm/i915/display/intel_combo_phy.c
> index 932265f1ac90..d5ad61e4083e 100644
> --- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
> @@ -188,7 +188,7 @@ static bool has_phy_misc(struct drm_i915_private *i91=
5, enum phy phy)
>  	 * PHY-B and may not even have instances of the register for the
>  	 * other combo PHY's.
>  	 */
> -	if (IS_ELKHARTLAKE(i915) ||
> +	if (IS_JSL_EHL(i915) ||
>  	    IS_ROCKETLAKE(i915) ||
>  	    IS_DG1(i915))
>  		return phy < PHY_C;
> @@ -283,7 +283,7 @@ static bool icl_combo_phy_verify_state(struct drm_i91=
5_private *dev_priv,
>  		ret &=3D check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW8(phy),
>  				     IREFGEN, IREFGEN);
>  =

> -		if (IS_ELKHARTLAKE(dev_priv)) {
> +		if (IS_JSL_EHL(dev_priv)) {
>  			if (ehl_vbt_ddi_d_present(dev_priv))
>  				expected_val =3D ICL_PHY_MISC_MUX_DDID;
>  =

> @@ -377,7 +377,7 @@ static void icl_combo_phys_init(struct drm_i915_priva=
te *dev_priv)
>  		 * "internal" child devices.
>  		 */
>  		val =3D intel_de_read(dev_priv, ICL_PHY_MISC(phy));
> -		if (IS_ELKHARTLAKE(dev_priv) && phy =3D=3D PHY_A) {
> +		if (IS_JSL_EHL(dev_priv) && phy =3D=3D PHY_A) {
>  			val &=3D ~ICL_PHY_MISC_MUX_DDID;
>  =

>  			if (ehl_vbt_ddi_d_present(dev_priv))
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 35edbd826443..bb0b9930958f 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2363,7 +2363,7 @@ static u8 intel_ddi_dp_voltage_max(struct intel_dp =
*intel_dp,
>  		else
>  			tgl_get_dkl_buf_trans(encoder, crtc_state, &n_entries);
>  	} else if (INTEL_GEN(dev_priv) =3D=3D 11) {
> -		if (IS_ELKHARTLAKE(dev_priv))
> +		if (IS_JSL_EHL(dev_priv))
>  			ehl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
>  		else if (intel_phy_is_combo(dev_priv, phy))
>  			icl_get_combo_buf_trans(encoder, crtc_state, &n_entries);
> @@ -2544,7 +2544,7 @@ static void icl_ddi_combo_vswing_program(struct int=
el_encoder *encoder,
>  =

>  	if (INTEL_GEN(dev_priv) >=3D 12)
>  		ddi_translations =3D tgl_get_combo_buf_trans(encoder, crtc_state, &n_e=
ntries);
> -	else if (IS_ELKHARTLAKE(dev_priv))
> +	else if (IS_JSL_EHL(dev_priv))
>  		ddi_translations =3D ehl_get_combo_buf_trans(encoder, crtc_state, &n_e=
ntries);
>  	else
>  		ddi_translations =3D icl_get_combo_buf_trans(encoder, crtc_state, &n_e=
ntries);
> @@ -3135,7 +3135,7 @@ static void intel_ddi_clk_select(struct intel_encod=
er *encoder,
>  		if (!intel_phy_is_combo(dev_priv, phy))
>  			intel_de_write(dev_priv, DDI_CLK_SEL(port),
>  				       icl_pll_to_ddi_clk_sel(encoder, crtc_state));
> -		else if (IS_ELKHARTLAKE(dev_priv) && port >=3D PORT_C)
> +		else if (IS_JSL_EHL(dev_priv) && port >=3D PORT_C)
>  			/*
>  			 * MG does not exist but the programming is required
>  			 * to ungate DDIC and DDID
> @@ -3184,7 +3184,7 @@ static void intel_ddi_clk_disable(struct intel_enco=
der *encoder)
>  =

>  	if (INTEL_GEN(dev_priv) >=3D 11) {
>  		if (!intel_phy_is_combo(dev_priv, phy) ||
> -		    (IS_ELKHARTLAKE(dev_priv) && port >=3D PORT_C))
> +		    (IS_JSL_EHL(dev_priv) && port >=3D PORT_C))
>  			intel_de_write(dev_priv, DDI_CLK_SEL(port),
>  				       DDI_CLK_SEL_NONE);
>  	} else if (IS_CANNONLAKE(dev_priv)) {
> @@ -4328,7 +4328,7 @@ void intel_ddi_compute_min_voltage_level(struct drm=
_i915_private *dev_priv,
>  {
>  	if (INTEL_GEN(dev_priv) >=3D 12 && crtc_state->port_clock > 594000)
>  		crtc_state->min_voltage_level =3D 2;
> -	else if (IS_ELKHARTLAKE(dev_priv) && crtc_state->port_clock > 594000)
> +	else if (IS_JSL_EHL(dev_priv) && crtc_state->port_clock > 594000)
>  		crtc_state->min_voltage_level =3D 3;
>  	else if (INTEL_GEN(dev_priv) >=3D 11 && crtc_state->port_clock > 594000)
>  		crtc_state->min_voltage_level =3D 1;
> @@ -5199,7 +5199,7 @@ void intel_ddi_init(struct drm_i915_private *dev_pr=
iv, enum port port)
>  		encoder->hpd_pin =3D rkl_hpd_pin(dev_priv, port);
>  	else if (INTEL_GEN(dev_priv) >=3D 12)
>  		encoder->hpd_pin =3D tgl_hpd_pin(dev_priv, port);
> -	else if (IS_ELKHARTLAKE(dev_priv))
> +	else if (IS_JSL_EHL(dev_priv))
>  		encoder->hpd_pin =3D ehl_hpd_pin(dev_priv, port);
>  	else if (IS_GEN(dev_priv, 11))
>  		encoder->hpd_pin =3D icl_hpd_pin(dev_priv, port);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index cf1417ff54d7..c016b5d9561e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7331,7 +7331,7 @@ bool intel_phy_is_combo(struct drm_i915_private *de=
v_priv, enum phy phy)
>  		return false;
>  	else if (IS_ROCKETLAKE(dev_priv))
>  		return phy <=3D PHY_D;
> -	else if (IS_ELKHARTLAKE(dev_priv))
> +	else if (IS_JSL_EHL(dev_priv))
>  		return phy <=3D PHY_C;
>  	else if (INTEL_GEN(dev_priv) >=3D 11)
>  		return phy <=3D PHY_B;
> @@ -7345,7 +7345,7 @@ bool intel_phy_is_tc(struct drm_i915_private *dev_p=
riv, enum phy phy)
>  		return false;
>  	else if (INTEL_GEN(dev_priv) >=3D 12)
>  		return phy >=3D PHY_D && phy <=3D PHY_I;
> -	else if (INTEL_GEN(dev_priv) >=3D 11 && !IS_ELKHARTLAKE(dev_priv))
> +	else if (INTEL_GEN(dev_priv) >=3D 11 && !IS_JSL_EHL(dev_priv))
>  		return phy >=3D PHY_C && phy <=3D PHY_F;
>  	else
>  		return false;
> @@ -7355,7 +7355,7 @@ enum phy intel_port_to_phy(struct drm_i915_private =
*i915, enum port port)
>  {
>  	if (IS_ROCKETLAKE(i915) && port >=3D PORT_D)
>  		return (enum phy)port - 1;
> -	else if (IS_ELKHARTLAKE(i915) && port =3D=3D PORT_D)
> +	else if (IS_JSL_EHL(i915) && port =3D=3D PORT_D)
>  		return PHY_A;
>  =

>  	return (enum phy)port;
> @@ -17119,7 +17119,7 @@ static void intel_setup_outputs(struct drm_i915_p=
rivate *dev_priv)
>  		intel_ddi_init(dev_priv, PORT_H);
>  		intel_ddi_init(dev_priv, PORT_I);
>  		icl_dsi_init(dev_priv);
> -	} else if (IS_ELKHARTLAKE(dev_priv)) {
> +	} else if (IS_JSL_EHL(dev_priv)) {
>  		intel_ddi_init(dev_priv, PORT_A);
>  		intel_ddi_init(dev_priv, PORT_B);
>  		intel_ddi_init(dev_priv, PORT_C);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 4f8266c3ed43..0902a9aeeda1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -332,7 +332,7 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
>  		size =3D ARRAY_SIZE(cnl_rates);
>  		if (IS_GEN(dev_priv, 10))
>  			max_rate =3D cnl_max_source_rate(intel_dp);
> -		else if (IS_ELKHARTLAKE(dev_priv))
> +		else if (IS_JSL_EHL(dev_priv))
>  			max_rate =3D ehl_max_source_rate(intel_dp);
>  		else
>  			max_rate =3D icl_max_source_rate(intel_dp);
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/=
drm/i915/display/intel_dpll_mgr.c
> index 2cc0e84e41ea..48c30c50a301 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -152,7 +152,7 @@ intel_combo_pll_enable_reg(struct drm_i915_private *i=
915,
>  			   struct intel_shared_dpll *pll)
>  {
>  =

> -	if (IS_ELKHARTLAKE(i915) && (pll->info->id =3D=3D DPLL_ID_EHL_DPLL4))
> +	if (IS_JSL_EHL(i915) && (pll->info->id =3D=3D DPLL_ID_EHL_DPLL4))
>  		return MG_PLL_ENABLE(0);
>  =

>  	return CNL_DPLL_ENABLE(pll->info->id);
> @@ -3551,7 +3551,7 @@ static bool icl_get_combo_phy_dpll(struct intel_ato=
mic_state *state,
>  			BIT(DPLL_ID_EHL_DPLL4) |
>  			BIT(DPLL_ID_ICL_DPLL1) |
>  			BIT(DPLL_ID_ICL_DPLL0);
> -	} else if (IS_ELKHARTLAKE(dev_priv) && port !=3D PORT_A) {
> +	} else if (IS_JSL_EHL(dev_priv) && port !=3D PORT_A) {
>  		dpll_mask =3D
>  			BIT(DPLL_ID_EHL_DPLL4) |
>  			BIT(DPLL_ID_ICL_DPLL1) |
> @@ -3853,7 +3853,7 @@ static bool icl_pll_get_hw_state(struct drm_i915_pr=
ivate *dev_priv,
>  		hw_state->cfgcr1 =3D intel_de_read(dev_priv,
>  						 TGL_DPLL_CFGCR1(id));
>  	} else {
> -		if (IS_ELKHARTLAKE(dev_priv) && id =3D=3D DPLL_ID_EHL_DPLL4) {
> +		if (IS_JSL_EHL(dev_priv) && id =3D=3D DPLL_ID_EHL_DPLL4) {
>  			hw_state->cfgcr0 =3D intel_de_read(dev_priv,
>  							 ICL_DPLL_CFGCR0(4));
>  			hw_state->cfgcr1 =3D intel_de_read(dev_priv,
> @@ -3902,7 +3902,7 @@ static void icl_dpll_write(struct drm_i915_private =
*dev_priv,
>  		cfgcr0_reg =3D TGL_DPLL_CFGCR0(id);
>  		cfgcr1_reg =3D TGL_DPLL_CFGCR1(id);
>  	} else {
> -		if (IS_ELKHARTLAKE(dev_priv) && id =3D=3D DPLL_ID_EHL_DPLL4) {
> +		if (IS_JSL_EHL(dev_priv) && id =3D=3D DPLL_ID_EHL_DPLL4) {
>  			cfgcr0_reg =3D ICL_DPLL_CFGCR0(4);
>  			cfgcr1_reg =3D ICL_DPLL_CFGCR1(4);
>  		} else {
> @@ -4076,7 +4076,7 @@ static void combo_pll_enable(struct drm_i915_privat=
e *dev_priv,
>  {
>  	i915_reg_t enable_reg =3D intel_combo_pll_enable_reg(dev_priv, pll);
>  =

> -	if (IS_ELKHARTLAKE(dev_priv) &&
> +	if (IS_JSL_EHL(dev_priv) &&
>  	    pll->info->id =3D=3D DPLL_ID_EHL_DPLL4) {
>  =

>  		/*
> @@ -4189,7 +4189,7 @@ static void combo_pll_disable(struct drm_i915_priva=
te *dev_priv,
>  =

>  	icl_pll_disable(dev_priv, pll, enable_reg);
>  =

> -	if (IS_ELKHARTLAKE(dev_priv) &&
> +	if (IS_JSL_EHL(dev_priv) &&
>  	    pll->info->id =3D=3D DPLL_ID_EHL_DPLL4)
>  		intel_display_power_put(dev_priv, POWER_DOMAIN_DPLL_DC_OFF,
>  					pll->wakeref);
> @@ -4356,7 +4356,7 @@ void intel_shared_dpll_init(struct drm_device *dev)
>  		dpll_mgr =3D &rkl_pll_mgr;
>  	else if (INTEL_GEN(dev_priv) >=3D 12)
>  		dpll_mgr =3D &tgl_pll_mgr;
> -	else if (IS_ELKHARTLAKE(dev_priv))
> +	else if (IS_JSL_EHL(dev_priv))
>  		dpll_mgr =3D &ehl_pll_mgr;
>  	else if (INTEL_GEN(dev_priv) >=3D 11)
>  		dpll_mgr =3D &icl_pll_mgr;
> @@ -4498,7 +4498,7 @@ static void readout_dpll_hw_state(struct drm_i915_p=
rivate *i915,
>  	pll->on =3D pll->info->funcs->get_hw_state(i915, pll,
>  						 &pll->state.hw_state);
>  =

> -	if (IS_ELKHARTLAKE(i915) && pll->on &&
> +	if (IS_JSL_EHL(i915) && pll->on &&
>  	    pll->info->id =3D=3D DPLL_ID_EHL_DPLL4) {
>  		pll->wakeref =3D intel_display_power_get(i915,
>  						       POWER_DOMAIN_DPLL_DC_OFF);
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/=
gt/intel_sseu.c
> index f1c039e1b5ad..8a72e0fe34ca 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
> @@ -169,7 +169,7 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
>  	u8 eu_en;
>  	u8 s_en;
>  =

> -	if (IS_ELKHARTLAKE(gt->i915))
> +	if (IS_JSL_EHL(gt->i915))
>  		intel_sseu_set_info(sseu, 1, 4, 8);
>  	else
>  		intel_sseu_set_info(sseu, 1, 8, 8);
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/dr=
m/i915/gt/intel_workarounds.c
> index 78c5480c6401..c6433b72f5e9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1212,7 +1212,7 @@ icl_gt_workarounds_init(struct drm_i915_private *i9=
15, struct i915_wa_list *wal)
>  =

>  	/* Wa_1607087056:icl,ehl,jsl */
>  	if (IS_ICELAKE(i915) ||
> -	    IS_EHL_REVID(i915, EHL_REVID_A0, EHL_REVID_A0)) {
> +		IS_JSL_EHL_REVID(i915, EHL_REVID_A0, EHL_REVID_A0)) {
>  		wa_write_or(wal,
>  			    SLICE_UNIT_LEVEL_CLKGATE,
>  			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
> @@ -1839,7 +1839,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, =
struct i915_wa_list *wal)
>  			    GEN12_FF_TESSELATION_DOP_GATE_DISABLE);
>  =

>  		/* Wa_22010271021:ehl */
> -		if (IS_ELKHARTLAKE(i915))
> +		if (IS_JSL_EHL(i915))
>  			wa_masked_en(wal,
>  				     GEN9_CS_DEBUG_MODE1,
>  				     FF_DOP_CLOCK_GATE_DISABLE);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i=
915/gt/uc/intel_uc_fw.c
> index 80e8b6c3bc8c..037bcaf3c8b5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -53,6 +53,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_f=
w,
>  #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
>  	fw_def(ROCKETLAKE,  0, guc_def(tgl, 35, 2, 0), huc_def(tgl,  7, 5, 0)) \
>  	fw_def(TIGERLAKE,   0, guc_def(tgl, 35, 2, 0), huc_def(tgl,  7, 5, 0)) \
> +	fw_def(JASPERLAKE,  0, guc_def(ehl, 33, 0, 4), huc_def(ehl,  9, 0, 0)) \
>  	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 33, 0, 4), huc_def(ehl,  9, 0, 0)) \
>  	fw_def(ICELAKE,     0, guc_def(icl, 33, 0, 0), huc_def(icl,  9, 0, 0)) \
>  	fw_def(COMETLAKE,   5, guc_def(cml, 33, 0, 0), huc_def(cml,  4, 0, 0)) \
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 9c2672c56cc1..c95db2d5485c 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1417,7 +1417,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define IS_COMETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COMETLAKE)
>  #define IS_CANNONLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_CANNONLAKE)
>  #define IS_ICELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ICELAKE)
> -#define IS_ELKHARTLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE)
> +#define IS_JSL_EHL(dev_priv)	(IS_PLATFORM(dev_priv, INTEL_JASPERLAKE) ||=
 \
> +				IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
>  #define IS_TIGERLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_TIGERLAKE)
>  #define IS_ROCKETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ROCKETLAKE)
>  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, INTEL_DG1)
> @@ -1558,8 +1559,8 @@ extern const struct i915_rev_steppings kbl_revids[];
>  =

>  #define EHL_REVID_A0            0x0
>  =

> -#define IS_EHL_REVID(p, since, until) \
> -	(IS_ELKHARTLAKE(p) && IS_REVID(p, since, until))
> +#define IS_JSL_EHL_REVID(p, since, until) \
> +	(IS_JSL_EHL(p) && IS_REVID(p, since, until))
>  =

>  enum {
>  	TGL_REVID_A0,
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index 249730561b6c..16d4e72bed09 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -846,6 +846,14 @@ static const struct intel_device_info ehl_info =3D {
>  	.ppgtt_size =3D 36,
>  };
>  =

> +static const struct intel_device_info jsl_info =3D {
> +	GEN11_FEATURES,
> +	PLATFORM(INTEL_JASPERLAKE),
> +	.require_force_probe =3D 1,
> +	.platform_engine_mask =3D BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BIT(VECS0=
),
> +	.ppgtt_size =3D 36,
> +};
> +
>  #define GEN12_FEATURES \
>  	GEN11_FEATURES, \
>  	GEN(12), \
> @@ -985,6 +993,7 @@ static const struct pci_device_id pciidlist[] =3D {
>  	INTEL_CNL_IDS(&cnl_info),
>  	INTEL_ICL_11_IDS(&icl_info),
>  	INTEL_EHL_IDS(&ehl_info),
> +	INTEL_JSL_IDS(&jsl_info),
>  	INTEL_TGL_12_IDS(&tgl_info),
>  	INTEL_RKL_IDS(&rkl_info),
>  	{0, 0, 0}
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i=
915/intel_device_info.c
> index adc836f15fde..e67cec8fa2aa 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -62,6 +62,7 @@ static const char * const platform_names[] =3D {
>  	PLATFORM_NAME(CANNONLAKE),
>  	PLATFORM_NAME(ICELAKE),
>  	PLATFORM_NAME(ELKHARTLAKE),
> +	PLATFORM_NAME(JASPERLAKE),
>  	PLATFORM_NAME(TIGERLAKE),
>  	PLATFORM_NAME(ROCKETLAKE),
>  	PLATFORM_NAME(DG1),
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i=
915/intel_device_info.h
> index 6a3d607218aa..d92fa041c700 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -79,6 +79,7 @@ enum intel_platform {
>  	/* gen11 */
>  	INTEL_ICELAKE,
>  	INTEL_ELKHARTLAKE,
> +	INTEL_JASPERLAKE,
>  	/* gen12 */
>  	INTEL_TIGERLAKE,
>  	INTEL_ROCKETLAKE,
> diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/inte=
l_pch.c
> index 6c97192e9ca8..f31c0dabd0cc 100644
> --- a/drivers/gpu/drm/i915/intel_pch.c
> +++ b/drivers/gpu/drm/i915/intel_pch.c
> @@ -115,7 +115,7 @@ intel_pch_type(const struct drm_i915_private *dev_pri=
v, unsigned short id)
>  		return PCH_ICP;
>  	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
>  		drm_dbg_kms(&dev_priv->drm, "Found Mule Creek Canyon PCH\n");
> -		drm_WARN_ON(&dev_priv->drm, !IS_ELKHARTLAKE(dev_priv));
> +		drm_WARN_ON(&dev_priv->drm, !IS_JSL_EHL(dev_priv));
>  		return PCH_MCC;
>  	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
>  	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
> @@ -126,7 +126,7 @@ intel_pch_type(const struct drm_i915_private *dev_pri=
v, unsigned short id)
>  	case INTEL_PCH_JSP_DEVICE_ID_TYPE:
>  	case INTEL_PCH_JSP2_DEVICE_ID_TYPE:
>  		drm_dbg_kms(&dev_priv->drm, "Found Jasper Lake PCH\n");
> -		drm_WARN_ON(&dev_priv->drm, !IS_ELKHARTLAKE(dev_priv));
> +		drm_WARN_ON(&dev_priv->drm, !IS_JSL_EHL(dev_priv));
>  		return PCH_JSP;
>  	default:
>  		return PCH_NONE;
> @@ -157,7 +157,7 @@ intel_virt_detect_pch(const struct drm_i915_private *=
dev_priv)
>  =

>  	if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv))
>  		id =3D INTEL_PCH_TGP_DEVICE_ID_TYPE;
> -	else if (IS_ELKHARTLAKE(dev_priv))
> +	else if (IS_JSL_EHL(dev_priv))
>  		id =3D INTEL_PCH_MCC_DEVICE_ID_TYPE;
>  	else if (IS_ICELAKE(dev_priv))
>  		id =3D INTEL_PCH_ICP_DEVICE_ID_TYPE;
> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> index 095463ff7cb9..a05ef6375c83 100644
> --- a/include/drm/i915_pciids.h
> +++ b/include/drm/i915_pciids.h
> @@ -579,15 +579,18 @@
>  	INTEL_VGA_DEVICE(0x8A51, info), \
>  	INTEL_VGA_DEVICE(0x8A5D, info)
>  =

> -/* EHL/JSL */
> +/* EHL */
>  #define INTEL_EHL_IDS(info) \
>  	INTEL_VGA_DEVICE(0x4500, info),	\
>  	INTEL_VGA_DEVICE(0x4571, info), \
>  	INTEL_VGA_DEVICE(0x4551, info), \
>  	INTEL_VGA_DEVICE(0x4541, info), \
> -	INTEL_VGA_DEVICE(0x4E71, info), \
>  	INTEL_VGA_DEVICE(0x4557, info), \
> -	INTEL_VGA_DEVICE(0x4555, info), \
> +	INTEL_VGA_DEVICE(0x4555, info)
> +
> +/* JSL */
> +#define INTEL_JSL_IDS(info) \
> +	INTEL_VGA_DEVICE(0x4E71, info), \
>  	INTEL_VGA_DEVICE(0x4E61, info), \
>  	INTEL_VGA_DEVICE(0x4E57, info), \
>  	INTEL_VGA_DEVICE(0x4E55, info), \
> -- =

> 2.28.0
> =


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
