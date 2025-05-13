Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD9AB5635
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 15:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3316510E3A8;
	Tue, 13 May 2025 13:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tDlE6BHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D809110E3A8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 13:35:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7C4C961F1D;
 Tue, 13 May 2025 13:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DAAC4CEE4;
 Tue, 13 May 2025 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747143339;
 bh=b7LHb4Pmxiyc7l5hvh5otR4XT6HHh2SBDPcCv+MjmRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tDlE6BHf80VL2UxT3Z5Rci9OLasSa1LxRRIyYbmCc1IhM4CIT9/EBiUdn3FwlQWd0
 fzQia6mwz5uABgIB4L0UATk3NUIm8zqhVabu8rcMWyZnRob3k67WsoNxxDOcYCk5Jg
 4DlciWciZskwdmVNV9+05XnEsmm5BVHweQPY4pzcd2nPH2sRLhXuviEmh4MockgMMd
 erYQ6npHu1N9iOkLwD/TBeA1Zak1UYWEbhHwX6+JJjs3FdbVudPXAhDNzvP9Llv4+e
 eqKJ3w1SkZV9k/8hUy0AHuwY/spi4EggWkVfvAL8voi5D3toyH4gLmjopndD4n1Wmr
 KV9cqsEKfycSg==
Date: Tue, 13 May 2025 15:35:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
Message-ID: <amnwcb3sxo7nbfobag3v2ojowqvrpqqkqykg3qfhxwxzp5olur@fibxgdcs2mee>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-6-5e55e2aaa3fa@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="a6hlm72fbua64am5"
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-6-5e55e2aaa3fa@collabora.com>
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


--a6hlm72fbua64am5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
MIME-Version: 1.0

Hi,

On Fri, Apr 25, 2025 at 01:26:57PM +0300, Cristian Ciocaltea wrote:
> Try to make use of YUV420 when computing the best output format and
> RGB cannot be supported for any of the available color depths.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 22 +++++++++++++++++--=
---
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 9e0a468073acbb2477eff1abef1c09d63620afaa..1fba10b92a6baa49150b6ff1e=
96bf2c2739bf269 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -648,14 +648,26 @@ hdmi_compute_config(const struct drm_connector *con=
nector,
>  				       8, connector->max_bpc);
>  	int ret;
> =20
> -	/*
> -	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
> -	 * devices, for modes that only support YCbCr420.
> -	 */
>  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
>  				      HDMI_COLORSPACE_RGB);
> +	if (!ret)
> +		return 0;

Sorry, I missed it on the previous iteration, but this condition
inversion compared to the rest of the function is throwing me off :)

I believe something like

If (ret) {
   if (connector->ycbcr_420_allowed) {
      hdmi_compute_format_bpc(..., HDMI_COLORSPACE_YUV420)
   } else {
     drm_dbg_kms("Can't use YUV420")
   }
}

Would be more natural

Maxime

--a6hlm72fbua64am5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCNKpwAKCRAnX84Zoj2+
dt8XAYCOK4IaWG7FU/T+LFNtb5zU7MH+Hu374lCyL9mTlGlP2QdW+T+sRNb1X9mu
ATM7X3MBf2D94Re1pgtxyZAB5MMOeacGQm8l6wb01iw06zEDVYH/Nbe7mUwLP03+
WQsWb4+KbQ==
=NAym
-----END PGP SIGNATURE-----

--a6hlm72fbua64am5--
