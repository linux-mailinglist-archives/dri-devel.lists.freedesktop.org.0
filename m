Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD32871E0F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536DA10E115;
	Tue,  5 Mar 2024 11:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FfTm6qAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFAF10E115
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709638655;
 bh=udS6MVqi6M+NbBoodIGwer026GYV2oRTj0s8uMTFaVA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FfTm6qAOwp8UxYbnHOt7pzBU6T0gJ87JT6Cfaw9WT8jwuiQQh0q+s7p1r0+f7Olun
 OA4uVmxZkHxJMgapXtvD1nqH9VrzHuqbtXM7XeJMsJP+DQK3UzXj6cZ/nKF3+zHhWA
 TZohih7NeL4vWxXExso5hz7EhAL984OXrnXpX4vrPuXzP7yFPQf1fkbrpPdfIV842d
 ft6gpO7Yuesdxb9KyCHCWMuNz19dxoNC8Op81iPDSqbhZyhhwvXkhwLkUtdWL6iCSn
 goAcsc+Eu78vDQDXW6LeMyauwUNNelkJvo5y/7JwW3FxfAjT91+k9YbZccihQ+pwPg
 mESpBq83QAQWA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 927E53780C1F;
 Tue,  5 Mar 2024 11:37:34 +0000 (UTC)
Date: Tue, 5 Mar 2024 13:37:26 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/drm_connector: Document Colorspace property variants
Message-ID: <20240305133726.2ebe81b8.pekka.paalanen@collabora.com>
In-Reply-To: <20240304174512.145862-1-sebastian.wick@redhat.com>
References: <20240304174512.145862-1-sebastian.wick@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3wNpkWjzQ/jrIs+Uneuc7Lj";
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

--Sig_/3wNpkWjzQ/jrIs+Uneuc7Lj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  4 Mar 2024 18:45:08 +0100
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
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++---------
>  include/drm/drm_connector.h     |  8 ----
>  2 files changed, 49 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index b0516505f7ae..1c4ce7f90a76 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2147,24 +2147,55 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_proper=
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
> + *	This property selects the colorimetry and transfer characteristics us=
er
> + *	space configured the CRTC to produce.

Rather than "selects", how about "informs the sink"?

To avoid implying that this changes CRTC pixel operations.

> + *	The transfer characteristics might get overwritten by the
> + *	HDR_OUTPUT_METADATA property.
> + *	The quantization range is always full (see the Broadcast RGB property=
).

This reads like infoframe data sent to the sink will always indicate
full range. What you meant instead is, userspace configures plane and
CRTC DEGAMMA/CTM/GAMMA to always produce full range regardless of what
is actually sent to the sink, is it not?

Can we refer to DEGAMMA/CTM/GAMMA etc. as "pixel operation properties"
or something? To avoid having to list them (incorrectly) everywhere.

> + *
> + *	The driver is expected to send the right metadata to the sink which c=
an
> + *	depend on the property value, the output mode and the output format.
> + *	It's also responsible for converting to the output format, taking into
> + *	account YCbCr conversion and quantization range.
> + *
> + *	For historical reasons this property exposes a number of variants whi=
ch
> + *	result in undefined behavior.
> + *
> + *	Default:
> + *		The behavior is driver-specific.
> + *	BT2020_RGB:
> + *	BT2020_YCC:
> + *		User space configures the state such that the CRTC produces RGB
> + *		content with Rec. ITU-R BT.2020 colorimetry, Rec. ITU-R BT.2020
> + *		(Table 4, RGB) transfer characteristics and full quantization
> + *		range.
> + *		User space can use the HDR_OUTPUT_METADATA property to set the
> + *		transfer characteristics to PQ (Rec. ITU-R BT.2100 Table 4) or
> + *		HLG (Rec. ITU-R BT.2100 Table 5) in which case, user space
> + *		configures the CRTC to produce content with the respective
> + *		transfer characteristics.
> + *		Drivers can configure the sink to use an RGB format, tell the
> + *		sink to expect Rec. ITU-R BT.2020 R'G'B' colorimetry and convert
> + *		to the appropriate quantization range.
> + *		Drivers can configure the sink to use a YCbCr format, tell the
> + *		sink to expect Rec. ITU-R BT.2020 Y'C'BC'R colorimetry, convert
> + *		to YCbCr using the Rec. ITU-R BT.2020 non-constant luminance
> + *		conversion matrix and convert to the appropriate quantization
> + *		range.

To avoid misunderstandings, since you have a nice paragraph split
between RGB and YCC, maybe this should underline that BT2020_RGB and
BT2020_YCC are equivalent from userspace perspective, and the driver
chooses between RGB and YCC on its own.

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

Overall, I like this patch.


Thanks,
pq

--Sig_/3wNpkWjzQ/jrIs+Uneuc7Lj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXnA/YACgkQI1/ltBGq
qqdfYRAAqTbQd4kkaCLgasq5EMW2jnMluFnuCjROdSOoGuTFYu/fiC+r4rvh4KE/
hzo2pFfzPKhvPUaOjJkghhRs3TeImAzsl8wiViMyq+URqsq6/jtK/kh0hR47pyeS
3s+IeH40XcdasfaiB4RJEDi53tXhwRWjQMF/8GQ78cXUnCkFtWuR+dmbjrNfZKWv
UWEjN/BcGi/i7IyDwR7chwAuzxF7+yatv9kx1Ny0sqTQAsn6jKMQPJWDDuMILSXt
QyN0QQ6fFGWcjcLDr1sRpexxFtzq/+M0Fle2JfqC0r0XsonzuAJPPR2NiOJyVktB
KXfkk2M1BLQQMqOUKwFsb/68/ZGtT/G4TdeTBrMvcFtqUjSCBp2DtbwDs9io6JC7
430Sa/HEHj+JG0MDCBK1bKtkaI3wd53JbPVfChSm030hOhE+OLGIwqh1wShzX7x9
Jk+49ps4IzXvAMjHeY5ZIPVSUoofnvJO2W/Hnd1qNG+0j5wpOc8Obp7jSZPB7I3H
x/QLm3kNqxGSUwW6HyHsVIjEb4jsbBkl/YQJN8xNd2uXXdqNFAyPKbvFN1fcCXbQ
SvODGD+/9GYbi8caG9lq5RzLNqvGKt1rCZN3kl3YjQeKaNGz7hMuvUnDHmdO7LeD
qZmLikh0WRN5YJk3d6GH00EdFmKkRP/n+eeKv50nJayn1OPX7p0=
=Ri/v
-----END PGP SIGNATURE-----

--Sig_/3wNpkWjzQ/jrIs+Uneuc7Lj--
