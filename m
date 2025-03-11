Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA89A5C6F9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566F210E5B8;
	Tue, 11 Mar 2025 15:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AXAjj4A6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E821910E5B8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:30:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13A755C64DF;
 Tue, 11 Mar 2025 15:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39623C4CEE9;
 Tue, 11 Mar 2025 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741707016;
 bh=gnsDuxEK7ajjvA8C8lxp+hRGEr56RnksDKUW21yjdJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AXAjj4A6QLLWeMy5JZK+kDw9L8FhsPKnSoO/Jm1HXmmXxi3HVzkgs/R69t5nCbO5D
 Iyi/34sJl+BjKG/hr2Nkg2BCXBetjhM/YwQ/Jg5YqxID9s+BjdW5OZuOUimU2vgNo6
 NKPDQkgtViERWssCds13y55IcYy5dM1/8ORo/8K1yM1qP8P7C/WEBxKx1MLDLCZQHT
 4bRvoibOOnJg+E7H+4THhVRPCTn7e6xd2xX6UKiiL+izWj14nLe+MRrx1GMdxx+/lk
 URSwW9Z9NhgDw0pDh2aAQe9a1UqOy7zpo7fN1l5tXacDWMwe3N6VDsli8SCvX4RWu5
 UzkSZ89ZpMQVg==
Date: Tue, 11 Mar 2025 16:30:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] drm/connector: hdmi: Add support for YUV420
 format verification
Message-ID: <20250311-spectral-utopian-poodle-4feadb@houat>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-2-fbdb94f02562@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qeeroqqbm4g4zr6w"
Content-Disposition: inline
In-Reply-To: <20250311-hdmi-conn-yuv-v2-2-fbdb94f02562@collabora.com>
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


--qeeroqqbm4g4zr6w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/7] drm/connector: hdmi: Add support for YUV420
 format verification
MIME-Version: 1.0

On Tue, Mar 11, 2025 at 12:57:34PM +0200, Cristian Ciocaltea wrote:
> Provide the necessary constraints verification in
> sink_supports_format_bpc() in order to support handling of YUV420
> output format.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 40 +++++++++++++++++++=
++++--
>  1 file changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 6bc96d5d1ab9115989e208d9899e16cd22254fb6..e99d868edc1854eddc5ebf869=
2ccffb9e2338268 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -3,6 +3,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_modes.h>
>  #include <drm/drm_print.h>
> =20
>  #include <drm/display/drm_hdmi_audio_helper.h>
> @@ -115,6 +116,12 @@ sink_supports_format_bpc(const struct drm_connector =
*connector,
>  		return false;
>  	}
> =20
> +	if (drm_mode_is_420_only(info, mode) && format !=3D HDMI_COLORSPACE_YUV=
420) {
> +		drm_dbg_kms(dev, "%s format unsupported by the sink for VIC%u.\n",
> +			    drm_hdmi_connector_get_output_format_name(format), vic);

We don't necessarily have a VIC for the mode we pass, so it's not super
useful to pass it. I'd rather mention that the mode is supposed to be
YUV420 only, but the format isn't YUV420.

> +		return false;
> +	}
> +
>  	switch (format) {
>  	case HDMI_COLORSPACE_RGB:
>  		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
> @@ -145,9 +152,36 @@ sink_supports_format_bpc(const struct drm_connector =
*connector,
>  		return true;
> =20
>  	case HDMI_COLORSPACE_YUV420:
> -		/* TODO: YUV420 is unsupported at the moment. */
> -		drm_dbg_kms(dev, "YUV420 format isn't supported yet.\n");
> -		return false;
> +		drm_dbg_kms(dev, "YUV420 format, checking the constraints.\n");
> +
> +		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR420)) {
> +			drm_dbg_kms(dev, "Sink doesn't support YUV420.\n");
> +			return false;
> +		}
> +
> +		if (!drm_mode_is_420(info, mode)) {
> +			drm_dbg_kms(dev, "Sink doesn't support YUV420 for VIC%u.\n", vic);

Again, we shouldn't print the VIC here. There's a printk format we can
use to print drm_display_mode if you want to, but we should keep things
consistent.

Maxime

--qeeroqqbm4g4zr6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9BXBQAKCRDj7w1vZxhR
xbfmAP4tQ/0s+jugmqqicuWqzhQXNIyH7ZrdXDlGGkGZfCQLSgEAsEV7mz0+n8kO
AogCOF3vgOw9AG7FwornHV+UipTxEAk=
=EgXU
-----END PGP SIGNATURE-----

--qeeroqqbm4g4zr6w--
