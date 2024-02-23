Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B77860DF6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 10:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B0E10EB50;
	Fri, 23 Feb 2024 09:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="C6IxXPhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F7E10EB50
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708680519;
 bh=wTpfui4xoHbPEHkxv2GPcszGmmWFoZWfeiHfDCcNavQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C6IxXPhAMwX+aS+H7Qut/Jt3rp8+i/2gnBnBSgZEn7X8DvkOmLFtsxG2oHa8DUE3o
 RkQdNNysrDkz5akxEfGexX+5bk+/8NBg2YqeEjxqgonbtar4Uo7RQKdX5NfIRKy1YM
 lUnHO7XlfVUSxMSc61kLAd2kgIDd+yXpp13Hs3aXrBZcidu/+8sKUeAGIwUY0tSZxX
 QlrstOeqtzzwOJWYNDdlwVnWsumwNSzplqmA4rxIbwUpZkktcX4jY6Lyr81TbR5ykD
 9Gove+kgutYvYbzEZBM2gHxuyU+JLshqKn5GfuAu7rs0Sj/imEb2DtvNdDC6q162UX
 mBHEi0oAyKFXA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 47DB937820D3;
 Fri, 23 Feb 2024 09:28:38 +0000 (UTC)
Date: Fri, 23 Feb 2024 11:28:37 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240223112837.7c0394d7.pekka.paalanen@collabora.com>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qC0FmXmaLo63nT+K/5dVjke";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qC0FmXmaLo63nT+K/5dVjke
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Feb 2024 19:14:07 +0100
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
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv      |  1 -
>  drivers/gpu/drm/drm_atomic.c              |  2 +
>  drivers/gpu/drm/drm_atomic_state_helper.c |  4 +-
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_connector.c           | 89 +++++++++++++++++++++++++=
++++++
>  include/drm/drm_connector.h               | 36 +++++++++++++
>  6 files changed, 134 insertions(+), 2 deletions(-)

...

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 591d2d500f61..6ffe59d01698 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1212,6 +1212,29 @@ static const u32 dp_colorspaces =3D
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
>  static const char * const output_format_str[] =3D {
>  	[HDMI_COLORSPACE_RGB]		=3D "RGB",
>  	[HDMI_COLORSPACE_YUV420]	=3D "YUV 4:2:0",
> @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
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
> + *      it's one of the YCbCr variant, it will be ignored and the output=
 will
> + *      use a limited quantization range.
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

This piece of doc looks good to me, so

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/qC0FmXmaLo63nT+K/5dVjke
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXYZUUACgkQI1/ltBGq
qqc6GA//Ud3yE7PjLhvaODOa4aypDtfd94RID6Fc+CEV+uagiJ2GdwpCdy/M3Cna
AkrAJVW4WkOp0WMA9AX06ddqwhX6oxf6kFwFsSFjrWn63QygVBMTPmk6cgSwLKJG
xmL7r67C6NYM94M7hT5WGX6XO4AFqAaCwDRI/LAiNhQMPSxriZ5XSmewgHQzBqHl
x05HjtZeldFXddI7OHlWblkg2aZabwetqnDt2ZJy+AzlE0uStg0p0PWdGCkUoVjm
+D+sf0IDPydZjSyalnCufA4xYRROGWGTQWDJm4VnLvw+b+yVpAWeY/Vq7hp7DL2Y
wXKgj1ZsimreV/AUimJRAMMcyXYyw/onxha6sDPpF8he/+sKmoZBggu88h8Sdn29
vFdLhrWFyVc3I9MlmQG63kL0vxIcSRN++5fmMLYO6xWulal/7AoucAdJ3pPwj1P2
eOfzqmKgzEanTlwZNGaGqe/XZV1WDsRiXU7HTgwhU8XAnxgTDMGypz7QTcUORtUb
RJrie0sp33kd1CpFG81x2hQLgOVS0KQQ0tOOhwmDSshHH4f0DQO9tJZeOSXeImsn
NXO3G5RzKvotOG1AOyB/V3XhUybmbswHidEUBMozmFdbsewcfaLwZlig+9m6/xK7
a7to0wCNbJPXbcPcPpAn7ijTbTzF91i0LPtOZbnL1BGUtf/p2FE=
=dJZd
-----END PGP SIGNATURE-----

--Sig_/qC0FmXmaLo63nT+K/5dVjke--
