Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307477A92B5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F2310E584;
	Thu, 21 Sep 2023 08:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D732010E584
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:39:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50300141a64so1338564e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695285569; x=1695890369; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=do13wE1NZGvZdh+vY8gzmZTIIEx/P59A/WkG5M6tfxM=;
 b=dN/pQgy6f5M4aHzsvyLtO0tzyeuwnfediyDoGJetslUQuZbzC9Gbf+K+1OTBUNr25h
 2+84teb4fENUJ5xa0eRoCZvck4F/jSiXNOO5kwgSc+lsKHo9Yx9uDbAVtVQkrESBcemd
 QJJspbo2FxswAvkHo/ZkoeqWn3m5Wmwzwn9UQK/5M/j7TFHvNBm5ifG+O2b370g3AV9C
 DTdyicCXrfAXYvF/BVpCNYKjkb2EY9mje7/SYZbWRMz5nX0a48hWRb3+mJQ0pP0JEIoS
 egr79E+O1o+61x+tTJfu/2UaXhJZqykSq4hIkAIAYAoJCPBTPSPkPDiNxZiQSDOoyRpc
 6oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695285569; x=1695890369;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=do13wE1NZGvZdh+vY8gzmZTIIEx/P59A/WkG5M6tfxM=;
 b=vk5m8rl0HV2SBPmieE5XkPfiMYXIy/bMouB6ld8/rWxstSkEORkXM60lavu/LYhuyn
 lRghILG7+wDOVKgu1HucHEvYgzthnwOkef71eUgn2xJyPivYRydAubWMQqnTCO3MHKPu
 e1eX/hOvl1WQSLCvd4rPSiXyKNuu0h9xeDO/+eLaf/DscGAxyJ5nPgmWb6BI2Ujl1QhU
 fkAC5XQiVJHoqjS24Du7CsHbOY8FaiKD0QJ1v5gJBMkU3lFCE34dOipKpt0+TfcbJnd+
 7HHxy8rnjj4hrUKhx0O5GBbn2n2lzYkdnTiKYGZNE0rXhcX+iwsFv2iDy+UREsDc5T1X
 iK2w==
X-Gm-Message-State: AOJu0YwtDBJVLQf4vrmdb56Q7YBn45efzlC+rmPnztiziyq5QsB6NIKy
 RvwUvHXzM8dpQOpI2JbsuKw=
X-Google-Smtp-Source: AGHT+IEg+Q5URv4DOIHpsqZ5z/w2kZYXI9iypMN4HV1bJyRLV6UA2HEdGUB18nSebb4ZlpNiEyGH2w==
X-Received: by 2002:a2e:8ed4:0:b0:2bf:fa16:2787 with SMTP id
 e20-20020a2e8ed4000000b002bffa162787mr3966289ljl.39.1695285568444; 
 Thu, 21 Sep 2023 01:39:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a24-20020a05651c011800b002b9de06f119sm224076ljb.67.2023.09.21.01.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 01:39:27 -0700 (PDT)
Date: Thu, 21 Sep 2023 11:39:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC v2 03/37] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <20230921113911.7799583d@eldfell>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-3-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
 <20230920-kms-hdmi-connector-state-v2-3-17932daddd7d@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/whNYN0BaPvA7+2Dd9n3sm9G";
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/whNYN0BaPvA7+2Dd9n3sm9G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Sep 2023 16:35:18 +0200
Maxime Ripard <mripard@kernel.org> wrote:

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
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv      |  1 -
>  drivers/gpu/drm/drm_atomic.c              |  5 +++
>  drivers/gpu/drm/drm_atomic_state_helper.c | 17 +++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_connector.c           | 74 +++++++++++++++++++++++++=
++++++
>  include/drm/drm_connector.h               | 39 ++++++++++++++++
>  6 files changed, 139 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms=
-properties.csv
> index 0f9590834829..caef14c532d4 100644
> --- a/Documentation/gpu/kms-properties.csv
> +++ b/Documentation/gpu/kms-properties.csv
> @@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Property =
Values,Object attached,De
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

Hi,

have a look at this old doc for the property, and...

>  ,,=E2=80=9Caudio=E2=80=9D,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on=
"" }",Connector,TBD
>  ,SDVO-TV,=E2=80=9Cmode=E2=80=9D,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_4=
43"", ""PAL_B"" } etc.",Connector,TBD
>  ,,"""left_margin""",RANGE,"Min=3D0, Max=3D SDVO dependent",Connector,TBD

...

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index d9a7e101e4e5..b45471d540ac 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1174,6 +1174,29 @@ static const u32 dp_colorspaces =3D
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
> +		return NULL;
> +
> +	return broadcast_rgb_names[broadcast_rgb].name;
> +}
> +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> +
>  /**
>   * DOC: standard connector properties
>   *
> @@ -1640,6 +1663,24 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
>  /**
>   * DOC: HDMI connector properties
>   *
> + * Broadcast RGB (HDMI Specific):
> + *      Indicates the RGB Range (Full vs Limited) used.
> + *
> + *      The value of this property can be one of the following:
> + *
> + *      Automatic:
> + *              RGB Range is selected automatically based on the mode
> + *              according to the HDMI specifications.
> + *
> + *      Full:
> + *              Full RGB Range is forced.
> + *
> + *      Limited 16:235:
> + *              Limited RGB Range is forced.
> + *
> + *      Drivers can set up this property by calling
> + *      drm_connector_attach_broadcast_rgb_property().

...compare it to this. There is one crucial detail lost: setting this
property does two or three things: it clips conversion input values to
[0.0, 1.0] range, programs a conversion matrix to convert full-range
RGB to destination RGB, and sends infoframes to indicate the chosen
destination RGB.

The distinction is important, because use cases like PLUGE calibration
(Rec. ITU-R BT.814-4) rely on indicating limited range while pixel
values are still able to carry sub-black values. Other procedures might
also want to use super-whites. This is impossible with the existing
"Broadcast RGB" property, but that is a different matter.

The old doc didn't exactly say it sets the infoframe fields either, but
I presume it does.

I feel the documentation needs to be much more explicit here.

> + *
>   * content type (HDMI specific):
>   *	Indicates content type setting to be used in HDMI infoframes to indic=
ate
>   *	content type for the external device, so that it adjusts its display
> @@ -2500,6 +2541,39 @@ int drm_connector_attach_hdr_output_metadata_prope=
rty(struct drm_connector *conn
>  }
>  EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
> =20
> +/**
> + * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" =
property
> + * @connector: connector to attach max bpc property on.

"max bpc" pasta.

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
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 5961f2ad48b1..fdcf64ab91a9 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -368,6 +368,33 @@ enum drm_panel_orientation {
>  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
> =20
> +/**
> + * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for a @drm_hdmi=
_connector
> + *
> + * This enum is used to track broadcast RGB selection. There are no
> + * separate #defines for the uapi!

Why the "no separate defines" comment? That's the norm.

The KMS property UAPI works by string names for enum values. Some enum
properties might expose C enums for the values, but that is an
exception that cannot be fixed due to stable UAPI.


Thanks,
pq

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

--Sig_/whNYN0BaPvA7+2Dd9n3sm9G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUMAS8ACgkQI1/ltBGq
qqc3XA/9ECTVC9T0gCqODWNk5wpTe/rrNuuHwqZsSzh3lDAK8NrTGSnuIuMXWGSj
vljtNwo3HH3V9o/dn5AsgBH6W2TQkFAeth05KqFVSXbcNO4eNSNNxmFlWl+fZ8HA
ePTbRN2FWZ1FWujVDZEWBetPxs3a662dH7YOjZrhh6dMxU0PbgKgOaUVoUrimRht
Lh3VJUfi3utYySd2kHSqO7/yaT8M7hC2wVfSk1OcD3PNb9w6ntBMAfzDQ/Nubo6V
nNGZsB+DrKkSYa7q7LDienXuonsPyVpLw9e90tZJcHmzD6gUYDymEoTdy4rv6u2N
Gn2kTUbPFPCNlEuBpe0lQhRrTJcl2oqF19zllvRSrEgwBX1c8PSx8C6RUlqd0l7c
btRB6rNODtr52ySQLOHWUjaQ/xAT8pbswadOilUFRJFrNJHSkXxR2Ij21L7TbLpb
KstqX3IAk33IVQzafw5fdXfofU/PvUvLiFYJV/5nsbSeU409buZu+p7kCjvNaG5R
385N6MTELzTD5fjvZn7OtAjdmsRlb2opYASo5vU9F4zw/NqDUFEqzRj3IeOZ7SAe
orEitPwAzPSsS4+6D4bJbzutcvHLpScQ8go7iZzeY/idr2BcsCkpNGlDZ89uk6Lu
wIH7tiRHk8r/2akYDa2Sl1zPnU/ELxUrbbWCWyjJSeE1CF5LZpc=
=A8/v
-----END PGP SIGNATURE-----

--Sig_/whNYN0BaPvA7+2Dd9n3sm9G--
