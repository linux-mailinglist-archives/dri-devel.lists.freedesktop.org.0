Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F12923F72
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 15:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3129A10E284;
	Tue,  2 Jul 2024 13:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YuHPUAcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C2A10E5F2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 13:49:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 807D761D3B;
 Tue,  2 Jul 2024 13:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D32C116B1;
 Tue,  2 Jul 2024 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719928140;
 bh=VCPpptoX1lcwq96YppGpSXnQWpM75LfIS4wYd/aLFic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YuHPUAcOv0zJ88c4w282ikL5+HjfDYySsZqWzZ6z4k8bucULdTOueiT8Xt39ZZsSy
 FckqcvS8VSOY8AoToQB0wbAFVBCVrYULGeHHHRZb9TKivukD9/05lqDeRYoJTj2a3c
 O6qwOWl/iStS9qA74fMtQppXoYNuW54FKVMi3IhSX+IHKMwNNQ13UH4jwxsA+8Y3MB
 L6V7Amly/uTRECMB4TQpjCWMHtWt7DXgCf9If/tcQ9Tuaxi9UiJY9o++fTpsYn8M1C
 JCtZt3EbrnWiT/+jSZgFaKzeFaaUvf3qa9rhHcZ9hAKRkYuUo7Z/VpvBZQmTGnOJ6S
 dILkiHwJ99P1A==
Date: Tue, 2 Jul 2024 15:48:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>, 
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org, 
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-list@raspberrypi.com
Subject: Re: [PATCH 06/11] drm/vc4: hdmi: Handle error case of
 pm_runtime_resume_and_get
Message-ID: <20240702-mysterious-excellent-hyena-0ff24f@houat>
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-7-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2tl7zqzcymelkodz"
Content-Disposition: inline
In-Reply-To: <20240630153652.318882-7-wahrenst@gmx.net>
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


--2tl7zqzcymelkodz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 05:36:47PM GMT, Stefan Wahren wrote:
> The commit 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is
> powered in detect") introduced the necessary power management handling
> to avoid register access while controller is powered down.
> Unfortunately it just print a warning if pm_runtime_resume_and_get()
> fails and proceed anyway.
>=20
> This could happen during suspend to idle. So we must assume it is unsafe
> to access the HDMI register. So bail out properly.
>=20
> Fixes: 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is powered =
in detect")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index d57c4a5948c8..b3a42b709718 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -429,6 +429,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_c=
onnector *connector,
>  {
>  	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
>  	enum drm_connector_status status =3D connector_status_disconnected;
> +	int ret;
>=20
>  	/*
>  	 * NOTE: This function should really take vc4_hdmi->mutex, but
> @@ -441,7 +442,11 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_=
connector *connector,
>  	 * the lock for now.
>  	 */
>=20
> -	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
> +	ret =3D pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
> +	if (ret) {
> +		DRM_ERROR("Failed to retain HDMI power domain: %d\n", ret);

We need to use drm_err here

Maxime

--2tl7zqzcymelkodz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoQFSAAKCRDj7w1vZxhR
xR4/AQDlMoVj1zwSuHz/bCYLp1ELUmStN8Gur4k7nkQPa0OGXwEAwA9Q9GmP0gCm
VfIDlBnxh2bhtPw45TXbzLBN26P30w8=
=U+hE
-----END PGP SIGNATURE-----

--2tl7zqzcymelkodz--
