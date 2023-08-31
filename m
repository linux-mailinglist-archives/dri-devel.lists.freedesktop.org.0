Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A094D78EA41
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 12:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8787010E638;
	Thu, 31 Aug 2023 10:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F7010E605;
 Thu, 31 Aug 2023 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693478052; x=1725014052;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fuHZPJibogaIl4+E7aByWPT5rz6EBSpY43AQE/mztLk=;
 b=V0rF6XygUJ0OJxsMj1xcByox4EZyU02cYNEtVCOCTd9pc46tXofEEgKO
 aL5X6sWPuCEru8n/qBj6wg6X3UtgVJcv5ef0oqboA9oP8bYoDyHwc/cg0
 Q1F6t2k4nbtWMct/3wMfT5zbeD6fxweKynfPatSsOYRiL/q3jj9XRqkmS
 nR3wh3PlLqBD+gH/I8PjV/Atfa0RUMhE2vCL79nEvfCpjTJ4QSJV44PgO
 D6T9Yu957p5kZo9AxWB1iFms9n4HruoaaK8I/WVN9PaZIeHi1lFwJh4Hi
 1KU3oqwuS3Lzz3rcRWquBOpIl1p/t066CEBSmsvQPMqBwDq8HPjbABUuV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439844605"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="439844605"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="913180699"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="913180699"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:34:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 10/12] drm/i915/hdmi: Nuke hdmi->ddc_bus
In-Reply-To: <20230829113920.13713-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-11-ville.syrjala@linux.intel.com>
Date: Thu, 31 Aug 2023 13:34:07 +0300
Message-ID: <87jztbjyao.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Remove the mostly redundant hdmi->ddc_bus. The only thing that needs
> it anymore is get_encoder_by_ddc_bus(), but that can be replaced with
> a slight detour through attached_connector+intel_gmbus_get_adapter().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h |  1 -
>  drivers/gpu/drm/i915/display/intel_hdmi.c          | 13 +++++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index c62f4ec315e8..363b6573a5f9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1581,7 +1581,6 @@ struct intel_watermark_params {
>=20=20
>  struct intel_hdmi {
>  	i915_reg_t hdmi_reg;
> -	int ddc_bus;
>  	struct {
>  		enum drm_dp_dual_mode_type type;
>  		int max_tmds_clock;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index efa9bb93cfb1..6b8754290304 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2900,13 +2900,17 @@ get_encoder_by_ddc_pin(struct intel_encoder *enco=
der, u8 ddc_pin)
>  	struct intel_encoder *other;
>=20=20
>  	for_each_intel_encoder(&i915->drm, other) {
> +		struct intel_connector *connector;
> +
>  		if (other =3D=3D encoder)
>  			continue;
>=20=20
>  		if (!intel_encoder_is_dig_port(other))
>  			continue;
>=20=20
> -		if (enc_to_dig_port(other)->hdmi.ddc_bus =3D=3D ddc_pin)
> +		connector =3D enc_to_dig_port(other)->hdmi.attached_connector;
> +
> +		if (connector && connector->base.ddc =3D=3D intel_gmbus_get_adapter(i9=
15, ddc_pin))
>  			return other;
>  	}
>=20=20
> @@ -3000,6 +3004,7 @@ void intel_hdmi_init_connector(struct intel_digital=
_port *dig_port,
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	enum port port =3D intel_encoder->port;
>  	struct cec_connector_info conn_info;
> +	u8 ddc_pin;
>=20=20
>  	drm_dbg_kms(&dev_priv->drm,
>  		    "Adding HDMI connector on [ENCODER:%d:%s]\n",
> @@ -3014,14 +3019,14 @@ void intel_hdmi_init_connector(struct intel_digit=
al_port *dig_port,
>  		     intel_encoder->base.name))
>  		return;
>=20=20
> -	intel_hdmi->ddc_bus =3D intel_hdmi_ddc_pin(intel_encoder);
> -	if (!intel_hdmi->ddc_bus)
> +	ddc_pin =3D intel_hdmi_ddc_pin(intel_encoder);
> +	if (!ddc_pin)
>  		return;
>=20=20
>  	drm_connector_init_with_ddc(dev, connector,
>  				    &intel_hdmi_connector_funcs,
>  				    DRM_MODE_CONNECTOR_HDMIA,
> -				    intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus));
> +				    intel_gmbus_get_adapter(dev_priv, ddc_pin));
>=20=20
>  	drm_connector_helper_add(connector, &intel_hdmi_connector_helper_funcs);

--=20
Jani Nikula, Intel Open Source Graphics Center
