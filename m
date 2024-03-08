Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96145876345
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EEC113869;
	Fri,  8 Mar 2024 11:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="ZGmCMHSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133D9113869
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 11:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1709897175; x=1741433175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3XEDr/u0bX7GLSURb+lX54qKf7q5lzFuBl44pcpwkWk=;
 b=ZGmCMHSU5XHUK/WRiDgkwIdzOuB8Y7OhCi/HuoV9u/aqNAhIEcrhRPZR
 lKRZ9z6zIiALzy5qgPqJcwTSwFMqb1v+UvaWTlCZS3MA7V3NrGrru8dEb
 AkhkdWLrNjTzmhEQuWw5XNkUqj8yXX05s5PtuyNzDRvGP78gfPP26O4if
 Rn8wV8py5GOg7qGTdMoZl9VIJUT04uUp3MYX/iSJcO9dXigjuxg3EPXTj
 TLCsPy86aDOCAuCQGsq890zL0WVw57aS+uxdo73/u0nBVOJrjgAJF7bYn
 rKdzqym6YXEZiWdldTgDr6o02hCO9T0yNJoV69x/O/AEYa60bmFTRERyg g==;
X-IronPort-AV: E=Sophos;i="6.07,109,1708383600"; d="scan'208";a="35807667"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Mar 2024 12:26:13 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7AA7928007C;
 Fri,  8 Mar 2024 12:26:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v8 16/27] drm/connector: hdmi: Add Broadcast RGB property
Date: Fri, 08 Mar 2024 12:26:14 +0100
Message-ID: <2599919.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240307-kms-hdmi-connector-state-v8-16-ef6a6f31964b@kernel.org>
References: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
 <20240307-kms-hdmi-connector-state-v8-16-ef6a6f31964b@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am Donnerstag, 7. M=C3=A4rz 2024, 14:38:43 CET schrieb Maxime Ripard:
> The i915 driver has a property to force the RGB range of an HDMI output.
> The vc4 driver then implemented the same property with the same
> semantics. KWin has support for it, and a PR for mutter is also there to
> support it.
>=20
> Both drivers implementing the same property with the same semantics,
> plus the userspace having support for it, is proof enough that it's
> pretty much a de-facto standard now and we can provide helpers for it.
>=20
> Let's plumb it into the newly created HDMI connector.
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv      |  1 -
>  drivers/gpu/drm/drm_atomic.c              |  2 +
>  drivers/gpu/drm/drm_atomic_state_helper.c |  4 +-
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_connector.c           | 88 +++++++++++++++++++++++++=
++++++
>  include/drm/drm_connector.h               | 36 +++++++++++++
>  6 files changed, 133 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms=
=2Dproperties.csv
> index 0f9590834829..caef14c532d4 100644
> --- a/Documentation/gpu/kms-properties.csv
> +++ b/Documentation/gpu/kms-properties.csv
> @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type,Propert=
y Values,Object attached,De
>  ,,=E2=80=9Csaturation=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connector,TBD
>  ,,=E2=80=9Chue=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connector,TBD
>  ,Virtual GPU,=E2=80=9Csuggested X=E2=80=9D,RANGE,"Min=3D0, Max=3D0xfffff=
fff",Connector,property to suggest an X offset for a connector
>  ,,=E2=80=9Csuggested Y=E2=80=9D,RANGE,"Min=3D0, Max=3D0xffffffff",Connec=
tor,property to suggest an Y offset for a connector
>  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Conn=
ector,TDB
> -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limi=
ted 16:235"" }",Connector,"When this property is set to Limited 16:235 and =
CTM is set, the hardware will be programmed with the result of the multipli=
cation of CTM by the limited range matrix to ensure the pixels normally in =
the range 0..1.0 are remapped to the range 16/255..235/255."
>  ,,=E2=80=9Caudio=E2=80=9D,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on=
"" }",Connector,TBD
>  ,SDVO-TV,=E2=80=9Cmode=E2=80=9D,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_4=
43"", ""PAL_B"" } etc.",Connector,TBD
>  ,,"""left_margin""",RANGE,"Min=3D0, Max=3D SDVO dependent",Connector,TBD
>  ,,"""right_margin""",RANGE,"Min=3D0, Max=3D SDVO dependent",Connector,TBD
>  ,,"""top_margin""",RANGE,"Min=3D0, Max=3D SDVO dependent",Connector,TBD
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 26f9e525c0a0..3e57d98d8418 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1143,10 +1143,12 @@ static void drm_atomic_connector_print_state(stru=
ct drm_printer *p,
>  	drm_printf(p, "\tmax_requested_bpc=3D%d\n", state->max_requested_bpc);
>  	drm_printf(p, "\tcolorspace=3D%s\n", drm_get_colorspace_name(state->col=
orspace));
> =20
>  	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
>  	    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
> +		drm_printf(p, "\tbroadcast_rgb=3D%s\n",
> +			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rg=
b));
>  		drm_printf(p, "\toutput_bpc=3D%u\n", state->hdmi.output_bpc);
>  		drm_printf(p, "\toutput_format=3D%s\n",
>  			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_forma=
t));
>  		drm_printf(p, "\ttmds_char_rate=3D%llu\n", state->hdmi.tmds_char_rate);
>  	}
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index 9f517599f117..0e8fb653965a 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -587,10 +587,11 @@ void __drm_atomic_helper_connector_hdmi_reset(struc=
t drm_connector *connector,
>  {
>  	unsigned int max_bpc =3D connector->max_bpc;
> =20
>  	new_state->max_bpc =3D max_bpc;
>  	new_state->max_requested_bpc =3D max_bpc;
> +	new_state->hdmi.broadcast_rgb =3D DRM_HDMI_BROADCAST_RGB_AUTO;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> =20
>  /**
>   * drm_atomic_helper_connector_tv_check - Validate an analog TV connecto=
r state
> @@ -911,11 +912,12 @@ int drm_atomic_helper_connector_hdmi_check(struct d=
rm_connector *connector,
> =20
>  	ret =3D hdmi_compute_config(connector, new_state, mode);
>  	if (ret)
>  		return ret;
> =20
> -	if (old_state->hdmi.output_bpc !=3D new_state->hdmi.output_bpc ||
> +	if (old_state->hdmi.broadcast_rgb !=3D new_state->hdmi.broadcast_rgb ||
> +	    old_state->hdmi.output_bpc !=3D new_state->hdmi.output_bpc ||
>  	    old_state->hdmi.output_format !=3D new_state->hdmi.output_format) {
>  		struct drm_crtc *crtc =3D new_state->crtc;
>  		struct drm_crtc_state *crtc_state;
> =20
>  		crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 29d4940188d4..2b415b4ed506 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -774,10 +774,12 @@ static int drm_atomic_connector_set_property(struct=
 drm_connector *connector,
>  						   fence_ptr);
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		state->max_requested_bpc =3D val;
>  	} else if (property =3D=3D connector->privacy_screen_sw_state_property)=
 {
>  		state->privacy_screen_sw_state =3D val;
> +	} else if (property =3D=3D connector->broadcast_rgb_property) {
> +		state->hdmi.broadcast_rgb =3D val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
>  	} else {
>  		drm_dbg_atomic(connector->dev,
> @@ -857,10 +859,12 @@ drm_atomic_connector_get_property(struct drm_connec=
tor *connector,
>  		*val =3D 0;
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		*val =3D state->max_requested_bpc;
>  	} else if (property =3D=3D connector->privacy_screen_sw_state_property)=
 {
>  		*val =3D state->privacy_screen_sw_state;
> +	} else if (property =3D=3D connector->broadcast_rgb_property) {
> +		*val =3D state->hdmi.broadcast_rgb;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
>  	} else {
>  		drm_dbg_atomic(dev,
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 591d2d500f61..0272e1d05cc6 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1210,10 +1210,33 @@ static const u32 dp_colorspaces =3D
>  	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
>  	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
>  	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
>  	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> =20
> +static const struct drm_prop_enum_list broadcast_rgb_names[] =3D {
> +	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
> +	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
> +	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
> +};
> +
> +/*
> + * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI =
connector RGB broadcast selection
> + * @broadcast_rgb: Broadcast RGB selection to compute name of
> + *
> + * Returns: the name of the Broadcast RGB selection, or NULL if the type
> + * is not valid.
> + */
> +const char *
> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb br=
oadcast_rgb)
> +{
> +	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)

I don't know if this was brought up before. IMHO it's easier to read checki=
ng:
 if (broadcast_rgb > ARRAY_SIZE(broadcast_rgb_names)

Best regards,
Alexander

> +		return NULL;
> +
> +	return broadcast_rgb_names[broadcast_rgb].name;
> +}
> +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> +
>  static const char * const output_format_str[] =3D {
>  	[HDMI_COLORSPACE_RGB]		=3D "RGB",
>  	[HDMI_COLORSPACE_YUV420]	=3D "YUV 4:2:0",
>  	[HDMI_COLORSPACE_YUV422]	=3D "YUV 4:2:2",
>  	[HDMI_COLORSPACE_YUV444]	=3D "YUV 4:4:4",
> @@ -1706,10 +1729,42 @@ void drm_connector_attach_dp_subconnector_propert=
y(struct drm_connector *connect
>  EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> =20
>  /**
>   * DOC: HDMI connector properties
>   *
> + * Broadcast RGB (HDMI specific)
> + *      Indicates the Quantization Range (Full vs Limited) used. The col=
or
> + *      processing pipeline will be adjusted to match the value of the
> + *      property, and the Infoframes will be generated and sent accordin=
gly.
> + *
> + *      This property is only relevant if the HDMI output format is RGB.=
 If
> + *      it's one of the YCbCr variant, it will be ignored.
> + *
> + *      The CRTC attached to the connector must be configured by user-sp=
ace to
> + *      always produce full-range pixels.
> + *
> + *      The value of this property can be one of the following:
> + *
> + *      Automatic:
> + *              The quantization range is selected automatically based o=
n the
> + *              mode according to the HDMI specifications (HDMI 1.4b - S=
ection
> + *              6.6 - Video Quantization Ranges).
> + *
> + *      Full:
> + *              Full quantization range is forced.
> + *
> + *      Limited 16:235:
> + *              Limited quantization range is forced. Unlike the name su=
ggests,
> + *              this works for any number of bits-per-component.
> + *
> + *      Property values other than Automatic can result in colors being =
off (if
> + *      limited is selected but the display expects full), or a black sc=
reen
> + *      (if full is selected but the display expects limited).
> + *
> + *      Drivers can set up this property by calling
> + *      drm_connector_attach_broadcast_rgb_property().
> + *
>   * content type (HDMI specific):
>   *	Indicates content type setting to be used in HDMI infoframes to indic=
ate
>   *	content type for the external device, so that it adjusts its display
>   *	settings accordingly.
>   *
> @@ -2568,10 +2623,43 @@ int drm_connector_attach_hdr_output_metadata_prop=
erty(struct drm_connector *conn
> =20
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
> =20
> +/**
> + * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" =
property
> + * @connector: connector to attach the property on.
> + *
> + * This is used to add support for forcing the RGB range on a connector
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *co=
nnector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D connector->broadcast_rgb_property;
> +	if (!prop) {
> +		prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> +						"Broadcast RGB",
> +						broadcast_rgb_names,
> +						ARRAY_SIZE(broadcast_rgb_names));
> +		if (!prop)
> +			return -EINVAL;
> +
> +		connector->broadcast_rgb_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop,
> +				   DRM_HDMI_BROADCAST_RGB_AUTO);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_broadcast_rgb_property);
> +
>  /**
>   * drm_connector_attach_colorspace_property - attach "Colorspace" proper=
ty
>   * @connector: connector to attach the property on.
>   *
>   * This is used to allow the userspace to signal the output colorspace
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8cda902934cd..bb6b6a36ade3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -367,10 +367,33 @@ enum drm_panel_orientation {
>  	DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP,
>  	DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
>  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
> =20
> +/**
> + * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for an HDMI @dr=
m_connector
> + */
> +enum drm_hdmi_broadcast_rgb {
> +	/**
> +	 * @DRM_HDMI_BROADCAST_RGB_AUTO: The RGB range is selected
> +	 * automatically based on the mode.
> +	 */
> +	DRM_HDMI_BROADCAST_RGB_AUTO,
> +
> +	/**
> +	 * @DRM_HDMI_BROADCAST_RGB_FULL: Full range RGB is forced.
> +	 */
> +	DRM_HDMI_BROADCAST_RGB_FULL,
> +
> +	/**
> +	 * @DRM_HDMI_BROADCAST_RGB_LIMITED: Limited range RGB is forced.
> +	 */
> +	DRM_HDMI_BROADCAST_RGB_LIMITED,
> +};
> +
> +const char *
> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb br=
oadcast_rgb);
>  const char *
>  drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt);
> =20
>  /**
>   * struct drm_monitor_range_info - Panel's Monitor range in EDID for
> @@ -1039,10 +1062,16 @@ struct drm_connector_state {
>  	/**
>  	 * @hdmi: HDMI-related variable and properties. Filled by
>  	 * @drm_atomic_helper_connector_hdmi_check().
>  	 */
>  	struct {
> +		/**
> +		 * @broadcast_rgb: Connector property to pass the
> +		 * Broadcast RGB selection value.
> +		 */
> +		enum drm_hdmi_broadcast_rgb broadcast_rgb;
> +
>  		/**
>  		 * @output_bpc: Bits per color channel to output.
>  		 */
>  		unsigned int output_bpc;
> =20
> @@ -1751,10 +1780,16 @@ struct drm_connector {
>  	 * @privacy_screen_hw_state_property: Optional atomic property for the
>  	 * connector to report the actual integrated privacy screen state.
>  	 */
>  	struct drm_property *privacy_screen_hw_state_property;
> =20
> +	/**
> +	 * @broadcast_rgb_property: Connector property to set the
> +	 * Broadcast RGB selection to output with.
> +	 */
> +	struct drm_property *broadcast_rgb_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> =20
>  	/**
> @@ -2090,10 +2125,11 @@ int drm_mode_create_scaling_mode_property(struct =
drm_device *dev);
>  int drm_connector_attach_content_type_property(struct drm_connector *dev=
);
>  int drm_connector_attach_scaling_mode_property(struct drm_connector *con=
nector,
>  					       u32 scaling_mode_mask);
>  int drm_connector_attach_vrr_capable_property(
>  		struct drm_connector *connector);
> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *co=
nnector);
>  int drm_connector_attach_colorspace_property(struct drm_connector *conne=
ctor);
>  int drm_connector_attach_hdr_output_metadata_property(struct drm_connect=
or *connector);
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state =
*old_state,
>  					     struct drm_connector_state *new_state);
>  int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


