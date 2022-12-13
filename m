Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C52964B32E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535EA10E2F7;
	Tue, 13 Dec 2022 10:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9788810E2F7;
 Tue, 13 Dec 2022 10:23:48 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j4so4228305lfk.0;
 Tue, 13 Dec 2022 02:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NvbL2YYnz/CC11farnlOokoblWgU/4wTQmv24wS84to=;
 b=YNEam+iTWQsp02SdikSUzJtWKjWxCYLznOJnuxwquFZgMXDWWpQ3Fmj6hvbyw0p8mM
 kAB1s2ragMm33DBm3W3FpWkAxda5BJtjFO5AFePq3nV6gqU1K87JV6i/TlYlvkqul2A1
 bdGyDVeQktW5KJLMSPNYfB7bEskBcZedcr/H1Od04ZGt5CQ9+kLHfor9iYf/YZT7ylIg
 Leh+nSRj2cXqi84S48yDudJChyCBPEg+Ai8QWEM9vESmTVo7lnPpeYTMmCjSEW73duar
 VFfOLUYz6wPH6v8Os/1n8Gr2ihtgwXCluSq6gLPMrAt7ZPIpb2gI32kVdBYjQXHWZ91Q
 BKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NvbL2YYnz/CC11farnlOokoblWgU/4wTQmv24wS84to=;
 b=QYo2zUAC7OuWdHEGVsf3C5CaQ1K619+R/YjZhlwV6vZL6VDXIOKMylKQ5gxFTIwnYU
 hSGsMqL2Ib94pjF+MLDiJpj2i04CYzubDTtV3KWcBlHdFwEwYdb2wtqrKpUHhbh5xqV+
 l0GB2aSuxbKbI5Od4eIM+xmnFDIuVNxxhPVJzqVSUib/y6y3c7IxpCOXN89EcpdogSAf
 x4UyGO6jtYKbZwViq/LqPHYYER3dFw3SG3+9r8GL9NfD0/IA5b3lKdpllei5YOS/R9NH
 KhyDcMj1yIJ9/g/HPg80jjyKR08mKXTbPhKCi8VvbyrYZeJH83fHA+pZf90YfslEAC18
 oebQ==
X-Gm-Message-State: ANoB5pnKVre6YEy3wGdfXLTpVWFqE3tsLlWhdmTUdQTANxnZZQO6SAxb
 6Y5CIPC/SCqIrfeArShThZg=
X-Google-Smtp-Source: AA0mqf4Ulih/woN7wkFoRUIa0raNduGIQNM4MA6u6wfSMbBRXdVkTUeZWNFzUI0Mzu1Nini1MTGGtg==
X-Received: by 2002:a05:6512:a92:b0:4b5:1b4a:efb7 with SMTP id
 m18-20020a0565120a9200b004b51b4aefb7mr6399012lfu.61.1670927026630; 
 Tue, 13 Dec 2022 02:23:46 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y28-20020a19915c000000b00492dba3c85asm303158lfj.220.2022.12.13.02.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 02:23:45 -0800 (PST)
Date: Tue, 13 Dec 2022 12:23:42 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 06/16] drm/connector: Allow drivers to pass list of
 supported colorspaces
Message-ID: <20221213122342.548631bf@eldfell>
In-Reply-To: <20221212182137.374625-7-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-7-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FTVaDld26.p.TXzh3KAz7gp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/FTVaDld26.p.TXzh3KAz7gp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Dec 2022 13:21:27 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> Drivers might not support all colorspaces defined in
> dp_colorspaces and hdmi_colorspaces. This results in
> undefined behavior when userspace is setting an
> unsupported colorspace.
>=20
> Allow drivers to pass the list of supported colorspaces
> when creating the colorspace property.

Hi Harry,

what is there for drivers to support? Isn't this just infoframe data
that shall be sent down to the sink as-is with no other effect?

Is the driver confusing colorimetry with color-representation (the
RGB-YCbCr conversion)? Or is this property defining both?

I feel that the documentation of "Colorspace" KMS connector property
needs clarification, and a list of potentially available values with
explanations, more than just a reference to CTA-816-H which it does not
even do yet.

Perhaps a table, where for each enum drm_colorspace entry has a row explain=
ing:


Thanks,
pq


> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_connector.c               | 140 +++++++++---------
>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>  include/drm/drm_connector.h                   |   8 +-
>  4 files changed, 83 insertions(+), 71 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index ddba0b9fcc17..0df5db3e4fec 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1012,64 +1012,57 @@ static const struct drm_prop_enum_list drm_dp_sub=
connector_enum_list[] =3D {
>  DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>  		 drm_dp_subconnector_enum_list)
> =20
> -static const struct drm_prop_enum_list hdmi_colorspaces[] =3D {
> -	/* For Default case, driver will set the colorspace */
> -	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
> -	/* Standard Definition Colorimetry based on CEA 861 */
> -	{ DRM_MODE_COLORIMETRY_SMPTE_170M_YCC, "SMPTE_170M_YCC" },
> -	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> -	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
> -	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
> -	/* High Definition Colorimetry based on IEC 61966-2-4 */
> -	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
> -	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
> -	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
> -	/* Colorimetry based on IEC 61966-2-5 [33] */
> -	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
> -	/* Colorimetry based on IEC 61966-2-5 */
> -	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> -	/* Added as part of Additional Colorimetry Extension in 861.G */
> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
> +static const char * const colorspace_names[] =3D {
> +	[DRM_MODE_COLORIMETRY_DEFAULT] =3D "Default",
> +	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] =3D "SMPTE_170M_YCC",
> +	[DRM_MODE_COLORIMETRY_BT709_YCC] =3D "BT709_YCC",
> +	[DRM_MODE_COLORIMETRY_XVYCC_601] =3D "XVYCC_601",
> +	[DRM_MODE_COLORIMETRY_XVYCC_709] =3D "XVYCC_709",
> +	[DRM_MODE_COLORIMETRY_SYCC_601] =3D "SYCC_601",
> +	[DRM_MODE_COLORIMETRY_OPYCC_601] =3D "opYCC_601",
> +	[DRM_MODE_COLORIMETRY_OPRGB] =3D "opRGB",
> +	[DRM_MODE_COLORIMETRY_BT2020_CYCC] =3D "BT2020_CYCC",
> +	[DRM_MODE_COLORIMETRY_BT2020_RGB] =3D "BT2020_RGB",
> +	[DRM_MODE_COLORIMETRY_BT2020_YCC] =3D "BT2020_YCC",
> +	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65] =3D "P3_RGB_D65",
> +	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER] =3D "P3_RGB_Theater",
> +	[DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED] =3D "RGB_WIDE_FIXED",
> +	[DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT] =3D "RGB_WIDE_FLOAT",
> +	[DRM_MODE_COLORIMETRY_BT601_YCC] =3D "BT601_YCC",
>  };
> =20
> +static const u32 hdmi_colorspaces =3D
> +	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
> +	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
> +
>  /*
>   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Col=
orimetry
>   * Format Table 2-120
>   */
> -static const struct drm_prop_enum_list dp_colorspaces[] =3D {
> -	/* For Default case, driver will set the colorspace */
> -	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
> -	{ DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED, "RGB_Wide_Gamut_Fixed_Point" },
> -	/* Colorimetry based on scRGB (IEC 61966-2-2) */
> -	{ DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT, "RGB_Wide_Gamut_Floating_Point" =
},
> -	/* Colorimetry based on IEC 61966-2-5 */
> -	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
> -	/* Colorimetry based on SMPTE RP 431-2 */
> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> -	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
> -	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> -	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
> -	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
> -	/* High Definition Colorimetry based on IEC 61966-2-4 */
> -	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
> -	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
> -	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
> -	/* Colorimetry based on IEC 61966-2-5 [33] */
> -	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> -};
> +static const u32 dp_colorspaces =3D
> +	BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED) |
> +	BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT) |
> +	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
> +	BIT(DRM_MODE_COLORIMETRY_BT601_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
> +	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> =20
>  /**
>   * DOC: standard connector properties
> @@ -1972,21 +1965,34 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_proper=
ty);
>   */
> =20
>  static int drm_mode_create_colorspace_property(struct drm_connector *con=
nector,
> -					const struct drm_prop_enum_list *colorspaces,
> -					int size)
> +					u32 supported_colorspaces)
>  {
>  	struct drm_device *dev =3D connector->dev;
> +	u32 colorspaces =3D supported_colorspaces | BIT(DRM_MODE_COLORIMETRY_DE=
FAULT);
> +	struct drm_prop_enum_list enum_list[DRM_MODE_COLORIMETRY_MAX];
> +	int i, len;
> =20
>  	if (connector->colorspace_property)
>  		return 0;
> =20
> -	if (!colorspaces)
> -		return 0;
> +	if (WARN_ON(supported_colorspaces =3D=3D 0 ||
> +		    (supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_MAX)) !=3D 0))
> +		return -EINVAL;
> +
> +	len =3D 0;
> +	for (i =3D 0; i < DRM_MODE_COLORIMETRY_MAX; i++) {
> +		if ((colorspaces & BIT(i)) =3D=3D 0)
> +			continue;
> +
> +		enum_list[len].type =3D i;
> +		enum_list[len].name =3D colorspace_names[i];
> +		len++;
> +	}
> =20
>  	connector->colorspace_property =3D
>  		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colorspace",
> -					colorspaces,
> -					size);
> +					enum_list,
> +					len);
> =20
>  	if (!connector->colorspace_property)
>  		return -ENOMEM;
> @@ -2003,11 +2009,12 @@ static int drm_mode_create_colorspace_property(st=
ruct drm_connector *connector,
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> -int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor)
> +int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor,
> +					     u32 supported_colorspaces)
>  {
> -	return drm_mode_create_colorspace_property(connector,
> -						   hdmi_colorspaces,
> -						   ARRAY_SIZE(hdmi_colorspaces));
> +	u32 colorspaces =3D supported_colorspaces & hdmi_colorspaces;
> +
> +	return drm_mode_create_colorspace_property(connector, colorspaces);
>  }
>  EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
> =20
> @@ -2021,11 +2028,12 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_pro=
perty);
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> -int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or)
> +int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or,
> +					   u32 supported_colorspaces)
>  {
> -	return drm_mode_create_colorspace_property(connector,
> -						   dp_colorspaces,
> -						   ARRAY_SIZE(dp_colorspaces));
> +	u32 colorspaces =3D supported_colorspaces & dp_colorspaces;
> +
> +	return drm_mode_create_colorspace_property(connector, colorspaces);
>  }
>  EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu=
/drm/i915/display/intel_connector.c
> index 1dcc268927a2..6e7cef58a626 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -283,13 +283,13 @@ intel_attach_aspect_ratio_property(struct drm_conne=
ctor *connector)
>  void
>  intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
>  {
> -	if (!drm_mode_create_hdmi_colorspace_property(connector))
> +	if (!drm_mode_create_hdmi_colorspace_property(connector, 0xffffffff))
>  		drm_connector_attach_colorspace_property(connector);
>  }
> =20
>  void
>  intel_attach_dp_colorspace_property(struct drm_connector *connector)
>  {
> -	if (!drm_mode_create_dp_colorspace_property(connector))
> +	if (!drm_mode_create_dp_colorspace_property(connector, 0xffffffff))
>  		drm_connector_attach_colorspace_property(connector);
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 6ab83296b0e4..8d08d6a36f37 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -416,7 +416,7 @@ static int vc4_hdmi_connector_init(struct drm_device =
*dev,
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D drm_mode_create_hdmi_colorspace_property(connector);
> +	ret =3D drm_mode_create_hdmi_colorspace_property(connector, 0xffffffff);
>  	if (ret)
>  		return ret;
> =20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index edef65388c29..5825c6ab969b 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -30,6 +30,7 @@
>  #include <linux/notifier.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_util.h>
> +#include <drm/drm_property.h>
> =20
>  #include <uapi/drm/drm_mode.h>
> =20
> @@ -393,6 +394,7 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
>  	DRM_MODE_COLORIMETRY_BT601_YCC,
> +	DRM_MODE_COLORIMETRY_MAX
>  };
> =20
>  /**
> @@ -1818,8 +1820,10 @@ int drm_connector_attach_hdr_output_metadata_prope=
rty(struct drm_connector *conn
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state =
*old_state,
>  					     struct drm_connector_state *new_state);
>  int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
> -int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor);
> -int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or);
> +int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor,
> +					     u32 supported_colorspaces);
> +int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or,
> +					   u32 supported_colorspaces);
>  int drm_mode_create_content_type_property(struct drm_device *dev);
>  int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
> =20


--Sig_/FTVaDld26.p.TXzh3KAz7gp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOYUq4ACgkQI1/ltBGq
qqemKBAAky0ol0I51eLvShIcbIwTQbQEls9xIbBZh+KGqKCkGvxvBN/g4UwXnHCD
gA6omhk5NQr81wdn3LXXnTf0HDWwxdu7ngX7KHg2Gq+uaVR1ktKD6bxSs96XLoub
7tJhnIgcFDyg3Q8iX7/vamPVdyZTKpCwkkgWUiF6pyOoPta+g+Fsj9ZqkLSfS75u
AAFtaM9z8OWSo5JN050rPbZor0vrHpKNPMuoMckusc+vn4xodzWVr2CPrrQepysc
uZjJfiG8rVAR0UFExy/AsFL2V1JlrfsyEB5YGgz972N7FidNfHmLCpERLxXtIFA4
bKHRk4yhgHPpRO8dX7gDW28bBIMgDZ5pkTgzPkUlddAZb0Yx8KSVForYfIy/uDTM
wh8SPeU1PyAY7qyu66LT1rUbWVk/lFitk0QtHg5xmJ8m1qVJRrp+F6UOK+JZ0lmD
vVD9svhBegYVagX+fvlz2KuGortEkjMzpF0vWUQq75Giv6i1TQkIFtleySYEJ1XP
ebbfmxlDPGyhLx/kG4CtsIxGJqGBJC4kT2XXeFtyMd4mbdgtmlvI/7DoaWqakKU4
7dDzmBbJakTIPdUoYeDaONc6zEmN1/o8cROQPZtPaOsPUGyqPH8vNrVCb0mW3r5a
EIaFYr8yFQWxEPRxCPJ0Fd6xwuBWdtd6TxuVJ0FN9X2WwQI3ZQg=
=QWYY
-----END PGP SIGNATURE-----

--Sig_/FTVaDld26.p.TXzh3KAz7gp--
