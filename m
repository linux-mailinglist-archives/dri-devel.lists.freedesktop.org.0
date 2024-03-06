Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634DC8730AF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88AB112FDB;
	Wed,  6 Mar 2024 08:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="vyBV9R/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F84112FE4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709713650;
 bh=GUs3uHvAGC9bBm7LYYG/cTtW+74CUXVTW/Lt/a1nkps=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vyBV9R/JaQoXYN91O8rqCG/snQb7W9j87hyzAMOpWP/uQu4mumN5l9j52N09Be4Ao
 84QIe4JUX9sdWo4g0lakMm1tLcd+ok5rHzIQu0kHXc8PToXmiFnDH/MBO6FiH7cuJy
 QFSaUPhZpsE2V2q6mcFeCXpSTCtYpyAGyV0WTnhFip23uNa+WHDr0ceB6geADLC0Av
 r/muvZqd3mAmYyC+sLUorynr1Z176NMiAG8Rb9WyX93WIgZc/BaZhDd4V+F/oy/K7w
 XSaaT7WJukF7owDr31nSxp7BZ1VpN4DMbjEKOWg/kYGV4DGNhiwjEJ802I982qu+NY
 tkiEiZZE7LRbw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C87DA37820D0;
 Wed,  6 Mar 2024 08:27:29 +0000 (UTC)
Date: Wed, 6 Mar 2024 10:27:21 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Xaver Hugl <xaver.hugl@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/drm_connector: Document Colorspace property
 variants
Message-ID: <20240306102721.3c9c3785.pekka.paalanen@collabora.com>
In-Reply-To: <20240305135155.231687-1-sebastian.wick@redhat.com>
References: <20240305135155.231687-1-sebastian.wick@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3QkxdKtNXlImHvMA8AAjo0J";
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

--Sig_/3QkxdKtNXlImHvMA8AAjo0J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  5 Mar 2024 14:51:49 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> The initial idea of the Colorspace prop was that this maps 1:1 to
> InfoFrames/SDP but KMS does not give user space enough information nor
> control over the output format to figure out which variants can be used
> for a given KMS commit. At the same time, properties like Broadcast RGB
> expect full range quantization range being produced by user space from
> the CRTC and drivers to convert to the range expected by the sink for
> the chosen output format, mode, InfoFrames, etc.
>=20
> This change documents the reality of the Colorspace property. The
> Default variant unfortunately is very much driver specific and not
> reflected by the EDID. The BT2020 variants are in active use by generic
> compositors which have expectations from the driver about the
> conversions it has to do when selecting certain output formats.
>=20
> Everything else is also marked as undefined. Coming up with valid
> behavior that makes it usable from user space and consistent with other
> KMS properties for those variants is left as an exercise for whoever
> wants to use them.
>=20
> v2:
>  * Talk about "pixel operation properties" that user space configures
>  * Mention that user space is responsible for checking the EDID for sink
>    support
>  * Make it clear that drivers can choose between RGB and YCbCr on their
>    own
>=20
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 79 +++++++++++++++++++++++++--------
>  include/drm/drm_connector.h     |  8 ----
>  2 files changed, 61 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index b0516505f7ae..65cdcc7d22db 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2147,24 +2147,67 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_proper=
ty);
>   * DOC: standard connector properties
>   *
>   * Colorspace:
> - *     This property helps select a suitable colorspace based on the sink
> - *     capability. Modern sink devices support wider gamut like BT2020.
> - *     This helps switch to BT2020 mode if the BT2020 encoded video stre=
am
> - *     is being played by the user, same for any other colorspace. There=
by
> - *     giving a good visual experience to users.
> - *
> - *     The expectation from userspace is that it should parse the EDID
> - *     and get supported colorspaces. Use this property and switch to the
> - *     one supported. Sink supported colorspaces should be retrieved by
> - *     userspace from EDID and driver will not explicitly expose them.
> - *
> - *     Basically the expectation from userspace is:
> - *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> - *        colorspace
> - *      - Set this new property to let the sink know what it
> - *        converted the CRTC output to.
> - *      - This property is just to inform sink what colorspace
> - *        source is trying to drive.
> + *	This property is used to inform the driver about the color encoding
> + *	user space configured the pixel operation properties to produce.
> + *	The variants set the colorimetry, transfer characteristics, and which
> + *	YCbCr conversion should be used when necessary.
> + *	The transfer characteristics from HDR_OUTPUT_METADATA takes precedence
> + *	over this property.
> + *	User space always configures the pixel operation properties to produce
> + *	full quantization range data (see the Broadcast RGB property).
> + *
> + *	Drivers inform the sink about what colorimetry, transfer
> + *	characteristics, YCbCr conversion, and quantization range to expect
> + *	(this can depend on the output mode, output format and other
> + *	properties). Drivers also convert the user space provided data to what
> + *	the sink expects.

Hi Sebastian,

should it be more explicit that drivers are allowed to do only
RGB->YCbCr and quantization range conversions, but not TF nor gamut
conversions?

That is, if the driver cannot pick the TF implied by "Colorspace"
property for the sink, then it cannot pick another TF for the sink and
silently convert. It think this should apply to all options including
the undefined ones. Or is that too much to guess?

> + *
> + *	User space has to check if the sink supports all of the possible
> + *	colorimetries that the driver is allowed to pick by parsing the EDID.

All? Rather than at least one?

Is this how it has been implemented for BT2020, that userspace picked
colorimetry and driver picked color model and quantization are
completely independent, and drivers do not check the combination
against EDID?

If so, "all" it is. Would be good to explain this in the commit message.

> + *
> + *	For historical reasons this property exposes a number of variants whi=
ch
> + *	result in undefined behavior.
> + *
> + *	Default:
> + *		The behavior is driver-specific.
> + *	BT2020_RGB:
> + *	BT2020_YCC:
> + *		User space configures the pixel operation properties to produce
> + *		RGB content with Rec. ITU-R BT.2020 colorimetry, Rec.
> + *		ITU-R BT.2020 (Table 4, RGB) transfer characteristics and full
> + *		quantization range.
> + *		User space can use the HDR_OUTPUT_METADATA property to set the
> + *		transfer characteristics to PQ (Rec. ITU-R BT.2100 Table 4) or
> + *		HLG (Rec. ITU-R BT.2100 Table 5) in which case, user space
> + *		configures pixel operation properties to produce content with
> + *		the respective transfer characteristics.
> + *		User space has to make sure the sink supports Rec.
> + *		ITU-R BT.2020 R'G'B' and Rec. ITU-R BT.2020 Y'C'BC'R
> + *		colorimetry.
> + *		Drivers can configure the sink to use an RGB format, tell the
> + *		sink to expect Rec. ITU-R BT.2020 R'G'B' colorimetry and convert
> + *		to the appropriate quantization range.
> + *		Drivers can configure the sink to use a YCbCr format, tell the
> + *		sink to expect Rec. ITU-R BT.2020 Y'C'BC'R colorimetry, convert
> + *		to YCbCr using the Rec. ITU-R BT.2020 non-constant luminance
> + *		conversion matrix and convert to the appropriate quantization
> + *		range.
> + *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
> + *		driver chooses between RGB and YCbCr on its own.
> + *	SMPTE_170M_YCC:
> + *	BT709_YCC:
> + *	XVYCC_601:
> + *	XVYCC_709:
> + *	SYCC_601:
> + *	opYCC_601:
> + *	opRGB:
> + *	BT2020_CYCC:
> + *	DCI-P3_RGB_D65:
> + *	DCI-P3_RGB_Theater:
> + *	RGB_WIDE_FIXED:
> + *	RGB_WIDE_FLOAT:
> + *	BT601_YCC:
> + *		The behavior is undefined.
>   *
>   * Because between HDMI and DP have different colorspaces,
>   * drm_mode_create_hdmi_colorspace_property() is used for HDMI connector=
 and
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f..02c42b01a3a7 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -437,14 +437,6 @@ enum drm_privacy_screen_status {
>   *
>   * DP definitions come from the DP v2.0 spec
>   * HDMI definitions come from the CTA-861-H spec
> - *
> - * A note on YCC and RGB variants:
> - *
> - * Since userspace is not aware of the encoding on the wire
> - * (RGB or YCbCr), drivers are free to pick the appropriate
> - * variant, regardless of what userspace selects. E.g., if
> - * BT2020_RGB is selected by userspace a driver will pick
> - * BT2020_YCC if the encoding on the wire is YUV444 or YUV420.
>    *
>   * @DRM_MODE_COLORIMETRY_DEFAULT:
>   *   Driver specific behavior.

This looks really good. This also makes me need to revisit the Weston
series I've been brewing that adds "Colorspace" KMS support.

I think the two questions I had may be slightly too much in the
direction of improving rather than just documenting this property, so
I'll already give

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/3QkxdKtNXlImHvMA8AAjo0J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXoKOkACgkQI1/ltBGq
qqfA/w/+LIwCUVDJdC5PspLw6WVjn+g4XFquENK3PiWt648RpFZhqVuyCHXVmkZu
RaWzUUJe4rq3l0X0yaLGvaETunODP+xCsiCSWfJBPyuDOzEvAe7tByRhG7H/uS04
/z0w2iiClM8yxg2oBxptTMSOiHQ6/dfnUcWlVnURbromiSomw3W6pXBUXqBEr5zu
XEQsfmaDpq2/Zy2Kvtf2GZkcZI4eVdNo/k7KZ1TSKe7vj1rnenBUdu3c6b+/BIJD
AiVglMfJUiXwuZRPmqBYdMW0s3YIpBjmzAJN9iblY3ER59O/zg6VaQYFqWGMpGvJ
2YybJMjIt8mHYnVKss9Ym4NrWf5+rxyBHQTMs6rbnomDLUNni3G8k6n/OZKEGkTl
UJ32HYXBwAcJkBW6nDR5fi4IPp3YV5mItwm/uZ794qEO4qpSJiSpwqq0kEu9B1Xw
hNPJNVUxDVV4hVjm3xeAiZYuP0VSTGwWjzxIezgEVx70+s7j2cwBSM34ArGK5g4N
Y6rpR34ySTeiGM/k3MEHF9sl1yaI6szWR7RJvFzs/YbdSmQNDq3ZdiWtjSBTGXDq
J1htThoY1IF+Hz0mkp1FZMstloNP3465LiLw6f7w2QU6SdtjXWK+84tlmALGmOB3
DPN+IyLhftJHED3CfUE80lfyPx79oOHyCBjxazMNQ3tKsDfGHQ0=
=WTYo
-----END PGP SIGNATURE-----

--Sig_/3QkxdKtNXlImHvMA8AAjo0J--
