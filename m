Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA40359715
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FC86E486;
	Fri,  9 Apr 2021 08:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C036E486
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:03:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30C26AF2F;
 Fri,  9 Apr 2021 08:03:39 +0000 (UTC)
Subject: Re: [PATCH 02/18] drm/bridge: Add HDMI output fmt helper
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-3-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e716dec6-684e-6091-d102-6aba95d3ea53@suse.de>
Date: Fri, 9 Apr 2021 10:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-3-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1354250868=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1354250868==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0zFA220L3eojdVoAKiNPCswZkSl7UL5Zt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0zFA220L3eojdVoAKiNPCswZkSl7UL5Zt
Content-Type: multipart/mixed; boundary="QJhSAaumYmQq0wXzicO0RL753df37VPeo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Message-ID: <e716dec6-684e-6091-d102-6aba95d3ea53@suse.de>
Subject: Re: [PATCH 02/18] drm/bridge: Add HDMI output fmt helper
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-3-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-3-maxime@cerno.tech>

--QJhSAaumYmQq0wXzicO0RL753df37VPeo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The atomic_get_output_bus_fmts bridge callback is there to list the
> available formats for output by decreasing order of preference.
>=20
> On HDMI controllers, we have a fairly static list that will depend on
> what the HDMI sink is capable of and the BPC our controller can output.=

>=20
> The dw-hdmi driver already has that code done in a fairly generic
> manner, so let's turn that code into an helper for all the HDMI
> controllers to reuse.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 127 ---------------------=
-
>   drivers/gpu/drm/drm_bridge.c              | 118 ++++++++++++++++++++
>   include/drm/drm_bridge.h                  |   6 +
>   3 files changed, 124 insertions(+), 127 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-hdmi.c
> index dda4fa9a1a08..d010c9c525d9 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2514,133 +2514,6 @@ static int dw_hdmi_connector_create(struct dw_h=
dmi *hdmi)
>    * DRM Bridge Operations
>    */
>  =20
> -/*
> - * Possible output formats :
> - * - MEDIA_BUS_FMT_UYYVYY16_0_5X48,
> - * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
> - * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
> - * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> - * - MEDIA_BUS_FMT_YUV16_1X48,
> - * - MEDIA_BUS_FMT_RGB161616_1X48,
> - * - MEDIA_BUS_FMT_UYVY12_1X24,
> - * - MEDIA_BUS_FMT_YUV12_1X36,
> - * - MEDIA_BUS_FMT_RGB121212_1X36,
> - * - MEDIA_BUS_FMT_UYVY10_1X20,
> - * - MEDIA_BUS_FMT_YUV10_1X30,
> - * - MEDIA_BUS_FMT_RGB101010_1X30,
> - * - MEDIA_BUS_FMT_UYVY8_1X16,
> - * - MEDIA_BUS_FMT_YUV8_1X24,
> - * - MEDIA_BUS_FMT_RGB888_1X24,
> - */
> -
> -/* Can return a maximum of 11 possible output formats for a mode/conne=
ctor */
> -#define MAX_OUTPUT_SEL_FORMATS	11
> -
> -static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridg=
e *bridge,
> -					struct drm_bridge_state *bridge_state,
> -					struct drm_crtc_state *crtc_state,
> -					struct drm_connector_state *conn_state,
> -					unsigned int *num_output_fmts)
> -{
> -	struct drm_connector *conn =3D conn_state->connector;
> -	struct drm_display_info *info =3D &conn->display_info;
> -	struct drm_display_mode *mode =3D &crtc_state->mode;
> -	u8 max_bpc =3D conn_state->max_requested_bpc;
> -	bool is_hdmi2_sink =3D info->hdmi.scdc.supported ||
> -			     (info->color_formats & DRM_COLOR_FORMAT_YCRCB420);
> -	u32 *output_fmts;
> -	unsigned int i =3D 0;
> -
> -	*num_output_fmts =3D 0;
> -
> -	output_fmts =3D kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),=

> -			      GFP_KERNEL);
> -	if (!output_fmts)
> -		return NULL;
> -
> -	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */=

> -	if (list_is_singular(&bridge->encoder->bridge_chain)) {
> -		*num_output_fmts =3D 1;
> -		output_fmts[0] =3D MEDIA_BUS_FMT_FIXED;
> -
> -		return output_fmts;
> -	}
> -
> -	/*
> -	 * If the current mode enforces 4:2:0, force the output but format
> -	 * to 4:2:0 and do not add the YUV422/444/RGB formats
> -	 */
> -	if (conn->ycbcr_420_allowed &&
> -	    (drm_mode_is_420_only(info, mode) ||
> -	     (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
> -
> -		/* Order bus formats from 16bit to 8bit if supported */
> -		if (max_bpc >=3D 16 && info->bpc =3D=3D 16 &&
> -		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48))
> -			output_fmts[i++] =3D MEDIA_BUS_FMT_UYYVYY16_0_5X48;
> -
> -		if (max_bpc >=3D 12 && info->bpc >=3D 12 &&
> -		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36))
> -			output_fmts[i++] =3D MEDIA_BUS_FMT_UYYVYY12_0_5X36;
> -
> -		if (max_bpc >=3D 10 && info->bpc >=3D 10 &&
> -		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30))
> -			output_fmts[i++] =3D MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> -
> -		/* Default 8bit fallback */
> -		output_fmts[i++] =3D MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> -
> -		*num_output_fmts =3D i;
> -
> -		return output_fmts;
> -	}
> -
> -	/*
> -	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
> -	 * if supported. In any case the default RGB888 format is added
> -	 */
> -
> -	if (max_bpc >=3D 16 && info->bpc =3D=3D 16) {
> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> -			output_fmts[i++] =3D MEDIA_BUS_FMT_YUV16_1X48;
> -
> -		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB161616_1X48;
> -	}
> -
> -	if (max_bpc >=3D 12 && info->bpc >=3D 12) {
> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> -			output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY12_1X24;
> -
> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> -			output_fmts[i++] =3D MEDIA_BUS_FMT_YUV12_1X36;
> -
> -		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB121212_1X36;
> -	}
> -
> -	if (max_bpc >=3D 10 && info->bpc >=3D 10) {
> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> -			output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY10_1X20;
> -
> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> -			output_fmts[i++] =3D MEDIA_BUS_FMT_YUV10_1X30;
> -
> -		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
> -	}
> -
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> -		output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
> -
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> -		output_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
> -
> -	/* Default 8bit RGB fallback */
> -	output_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
> -
> -	*num_output_fmts =3D i;
> -
> -	return output_fmts;
> -}
> -
>   /*
>    * Possible input formats :
>    * - MEDIA_BUS_FMT_RGB888_1X24
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.=
c
> index 64f0effb52ac..253cbca1c19e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1035,6 +1035,124 @@ int drm_atomic_bridge_chain_check(struct drm_br=
idge *bridge,
>   }
>   EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
>  =20
> +/* Can return a maximum of 11 possible output formats for a mode/conne=
ctor */
> +#define MAX_OUTPUT_SEL_FORMATS	11

Where does this number come from? In patch 1, there are 13 formats. Now=20
there are only 11.

> +
> +/**
> + * drm_bridge_helper_hdmi_atomic_get_output_bus_fmts() - Lists the out=
put formats for an HDMI sink
> + * @bridge: bridge control structure
> + * @bridge_state: bridge state
> + * @crtc_state: CRTC state
> + * @conn_state: connector state
> + * @num_output_fmts: number of formats returned
> + *
> + * Returns the supported bus formats on the output end of an HDMI
> + * bridge. The returned array is allocated with kmalloc and will thus
> + * need to be freed. Formats will be listed in decreasing preference
> + * order, the framework eventually picking the highest preference
> + * available across all the bridges.
> + *
> + * RETURNS:
> + * an array of MEDIA_FMT_* on success, NULL on failure
> + */
> +u32 *drm_atomic_helper_bridge_hdmi_get_output_bus_fmts(struct drm_brid=
ge *bridge,
> +						       struct drm_bridge_state *bridge_state,
> +						       struct drm_crtc_state *crtc_state,
> +						       struct drm_connector_state *conn_state,
> +						       unsigned int *num_output_fmts)
> +{
> +	struct drm_connector *conn =3D conn_state->connector;
> +	struct drm_display_info *info =3D &conn->display_info;
> +	struct drm_display_mode *mode =3D &crtc_state->mode;
> +	u8 max_bpc =3D conn_state->max_requested_bpc;
> +	bool is_hdmi2_sink =3D info->hdmi.scdc.supported ||
> +			     (info->color_formats & DRM_COLOR_FORMAT_YCRCB420);
> +	u32 *output_fmts;
> +	unsigned int i =3D 0;
> +
> +	*num_output_fmts =3D 0;
> +
> +	output_fmts =3D kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),=

> +			      GFP_KERNEL);
> +	if (!output_fmts)
> +		return NULL;
> +
> +	/*
> +	 * If the current mode enforces 4:2:0, force the output but format
> +	 * to 4:2:0 and do not add the YUV422/444/RGB formats
> +	 */
> +	if (conn->ycbcr_420_allowed &&
> +	    (drm_mode_is_420_only(info, mode) ||
> +	     (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
> +
> +		/* Order bus formats from 16bit to 8bit if supported */
> +		if (max_bpc >=3D 16 && info->bpc =3D=3D 16 &&
> +		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48))
> +			output_fmts[i++] =3D MEDIA_BUS_FMT_UYYVYY16_0_5X48;
> +
> +		if (max_bpc >=3D 12 && info->bpc >=3D 12 &&
> +		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36))
> +			output_fmts[i++] =3D MEDIA_BUS_FMT_UYYVYY12_0_5X36;
> +
> +		if (max_bpc >=3D 10 && info->bpc >=3D 10 &&
> +		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30))
> +			output_fmts[i++] =3D MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +
> +		/* Default 8bit fallback */
> +		output_fmts[i++] =3D MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +
> +		*num_output_fmts =3D i;
> +
> +		return output_fmts;
> +	}
> +
> +	/*
> +	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
> +	 * if supported. In any case the default RGB888 format is added
> +	 */
> +
> +	if (max_bpc >=3D 16 && info->bpc =3D=3D 16) {
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> +			output_fmts[i++] =3D MEDIA_BUS_FMT_YUV16_1X48;
> +
> +		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB161616_1X48;
> +	}
> +
> +	if (max_bpc >=3D 12 && info->bpc >=3D 12) {
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> +			output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY12_1X24;
> +
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> +			output_fmts[i++] =3D MEDIA_BUS_FMT_YUV12_1X36;
> +
> +		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB121212_1X36;
> +	}
> +
> +	if (max_bpc >=3D 10 && info->bpc >=3D 10) {
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> +			output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY10_1X20;
> +
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> +			output_fmts[i++] =3D MEDIA_BUS_FMT_YUV10_1X30;
> +
> +		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
> +	}
> +
> +	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> +		output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
> +
> +	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> +		output_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
> +
> +	/* Default 8bit RGB fallback */
> +	output_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	*num_output_fmts =3D i;
> +
> +	return output_fmts;
> +}
> +EXPORT_SYMBOL_GPL(drm_atomic_helper_bridge_hdmi_get_output_bus_fmts);
> +
>   /**
>    * drm_bridge_detect - check if anything is attached to the bridge ou=
tput
>    * @bridge: bridge control structure
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa289d2..1d801d77e90a 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -868,6 +868,12 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct =
drm_bridge *bridge,
>   					u32 output_fmt,
>   					unsigned int *num_input_fmts);
>  =20
> +u32 *drm_atomic_helper_bridge_hdmi_get_output_bus_fmts(struct drm_brid=
ge *bridge,
> +						       struct drm_bridge_state *bridge_state,
> +						       struct drm_crtc_state *crtc_state,
> +						       struct drm_connector_state *conn_state,
> +						       unsigned int *num_output_fmts);
> +
>   enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge=
);
>   int drm_bridge_get_modes(struct drm_bridge *bridge,
>   			 struct drm_connector *connector);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--QJhSAaumYmQq0wXzicO0RL753df37VPeo--

--0zFA220L3eojdVoAKiNPCswZkSl7UL5Zt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBwClkFAwAAAAAACgkQlh/E3EQov+CB
+xAAzX/4lch/1TGmNqHqKJF6uOYWaMDOd1usOxCGOfh6d1aC2jr6tFeJLa9uFZan7/DIr9nzDxPo
2NQEhRHvNv7cUjwzvG7pwLxavm/x9L9pgDIWY1rtcEY3YWEtmdvwGDwLzqvd5AvTG8zXHVI+oFq/
wnWRi8EiNjekr2GawYxNnZFovIlx3gVS5+1jDPQ7bLud4EpV+fenH2drHCGFN3TbELH9xB4jTaWt
nQTu4kdyOJIWAs9HIs6MAX51uB2XOQKjkEjEaGJuOzDhDzVQ8XSmPqV95uHjbgroz8Z0aFPZZS1A
woTFQPUPVeg6c3KghbyYgMCRf3mNWSfEbNZrKyWCP15+PAKS7bD2fEJK2YUgP6GB+rS+O5rY+QlJ
SDTKkUQQd5opMGRxBnDaqKSbeu6CJWjbvWm/wRH7a4ZbiDO4tiadtr1kj69r0ZKTh4tTHwFVTYyp
mGYOMDA/stF0039CHLMLkKNsLl+D7NmPHReMKfZuMADLqaXwfEJ6t+qsGo183oKS+3gOWV3IPO6z
vC2osyDe/vtyHxpFI6QpZT/ZRPaCzVZTZCffs0bWt7rWfWOqAzEfRMFXlkdlPkYZoMkO8NP6xBcl
D0CjUSDsAHN7oAqv1JWR24bNj/l4zsZdyB+7wzkCB/PmKfjFbHbbF8Q9/igP1BjL8T3ZcslnmMM4
XN8=
=EQbe
-----END PGP SIGNATURE-----

--0zFA220L3eojdVoAKiNPCswZkSl7UL5Zt--

--===============1354250868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1354250868==--
