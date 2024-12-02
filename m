Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067799DFFD9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 12:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8776210E6C5;
	Mon,  2 Dec 2024 11:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iQLL42vR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A27810E6C5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 11:11:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12D895C5FD9;
 Mon,  2 Dec 2024 11:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7300DC4CED1;
 Mon,  2 Dec 2024 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733137903;
 bh=JIk+/rOoMqitU5DAC4H1Lz/H4l2OqXEvQwoMMX4VIWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iQLL42vRehf9GQwzUc1jq6gUi5Uek6EQ4z1BoqUIXkcrZjBCn31TIyj0M1VrQq9jI
 XAreBypESlQT0fEVkJuG1EAEbFSEoHY/+QcBLUlYpWNLlHPVBItkL6c2KYSPj8Argd
 2FxcVmjPNflShq1SuARBEjNmF5zpkgirNNFm81Opd9Z+2MXQV3tkOpKecTRFJDFV+b
 EukjrkZwbT57WsRpEF6vr6b0RgZQVRo4o3uJF5KZqkfKm1dGEUpuZHcbn5RGJjunOs
 otvImV2bO6y0YjBi0XtWtzv8expTlQe5+JyNV0eZIX6FIFyGxHj0OY33TH3JhDSNn7
 AB2yVwlTayvEw==
Date: Mon, 2 Dec 2024 12:11:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/connector: hdmi: Use YUV420 output format as an
 RGB fallback
Message-ID: <20241202-tangible-ibis-from-sirius-464b60@houat>
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
 <20241130-hdmi-conn-yuv-v1-3-254279a08671@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="r72hxnc5h2m3ceyw"
Content-Disposition: inline
In-Reply-To: <20241130-hdmi-conn-yuv-v1-3-254279a08671@collabora.com>
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


--r72hxnc5h2m3ceyw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] drm/connector: hdmi: Use YUV420 output format as an
 RGB fallback
MIME-Version: 1.0

On Sat, Nov 30, 2024 at 01:56:34AM +0200, Cristian Ciocaltea wrote:
> Introduce the switch to YUV420 when computing the best output format and
> RGB cannot be supported for a given color depth.
>=20
> While at it, add a minor improvement to the debug message indicating the
> supported format.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 3a55881a544a519bb1254968db891c814f831a0f..b4e865e0680f35fd2d8495367=
89f6c1f98a48258 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -304,7 +304,7 @@ hdmi_try_format_bpc(const struct drm_connector *conne=
ctor,
>  		return false;
>  	}
> =20
> -	drm_dbg_kms(dev, "%s output format supported with %u (TMDS char rate: %=
llu Hz)\n",
> +	drm_dbg_kms(dev, "%s output format supported with %u bpc (TMDS char rat=
e: %llu Hz)\n",
>  		    drm_hdmi_connector_get_output_format_name(fmt),
>  		    bpc, conn_state->hdmi.tmds_char_rate);
> =20
> @@ -319,15 +319,16 @@ hdmi_compute_format(const struct drm_connector *con=
nector,
>  {
>  	struct drm_device *dev =3D connector->dev;
> =20
> -	/*
> -	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
> -	 * devices, for modes that only support YCbCr420.
> -	 */

It's something that I had in the back of my mind for a while, but we're
at the point where we need to discuss this I guess :)

Not all HDMI controllers are HDMI2.0+ compliant, and we need to gatekeep
this to the fact the controller supports it.

This will also be useful for things like scrambling support. And
probably to provide some TMDS rate check based on the standard a given
controller supports, since most of the drivers have that check
duplicated everywhere.

I don't really have an opinion on how to do this, so I guess it's really
up for debate. The alternatives I could think of are either to add a new
parameter to the init function, or to create a new callback to query the
driver for its capabilities.

The former doesn't seem great since the parameters set is pretty
extensive already. The latter doesn't seem super idiomatic in KMS, but
it's a common pattern in the rest of the kernel, so maybe it's a good
idea still.

>  	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPA=
CE_RGB)) {
>  		conn_state->hdmi.output_format =3D HDMI_COLORSPACE_RGB;
>  		return 0;
>  	}
> =20
> +	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPA=
CE_YUV420)) {
> +		conn_state->hdmi.output_format =3D HDMI_COLORSPACE_YUV420;
> +		return 0;
> +	}
> +

During our discussions when we merged this infrastructure, the goal was
to align our behaviour to Intel's. The discussion also pointed out that
we want to degrade the bpc before falling back to a YUV format.

So we need to first try RGB with any bpc, and then try YUV with any BPC
if it didn't work.

We also need plenty of tests based on whether the source supports
YUV420, the sink has YUV420-only modes, that the fallback occurs
properly, etc.

Maxime

--r72hxnc5h2m3ceyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02V7AAKCRAnX84Zoj2+
dobDAYDS5UgEopPvn02PuX0bEE1KUKtDnkquD2Ys6RIj/0RkBSu8OeZBnV6S0nKj
ppV2qNQBgL4e2azwWes+p7MtbpzkwFK+pOhXHwdl1UBPAbF0jqMAkNLK7Mgoe8s+
w1MfBYboUQ==
=7Cpf
-----END PGP SIGNATURE-----

--r72hxnc5h2m3ceyw--
