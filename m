Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C7F923F6B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 15:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB49610E283;
	Tue,  2 Jul 2024 13:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QhDDUx2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153E910E283
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 13:48:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2414A61B9D;
 Tue,  2 Jul 2024 13:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49193C116B1;
 Tue,  2 Jul 2024 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719928084;
 bh=POJpBLzMZtl3kVsUtAA1PJiP5FlqLS4DRvmTGZpjDXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QhDDUx2jnwbewWOnEtvAimQ1AOfa7YUwwYz98BP8HDl52MK7IiArBtlr3Kc0+dnyP
 7NQwv75ILJ47KxmHHD1tQ471mljWxTOY8ceiFgwIBiOpA+IXkIOw+3uii/zaAHHARY
 5ouBtksYlL9UzZIe5g49wS6LvUTDbi/DRnOBS92RkdkgjXgIKtILWJ+78RyctwG4LY
 ETMgr8TNaUFmrClTAP0393pkw4T3dUd2eBmUAkeb2BkuABmBgvHPv/0wB8MTAWMMuI
 ulyeOWaSQGINEeA3Wd8BpbEJwJqhlWBIPWMU44XjsankiWPOCjh7IrSq/fOga8wHVD
 +w/WjJedQ6RQQ==
Date: Tue, 2 Jul 2024 15:48:02 +0200
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
Subject: Re: [PATCH 07/11] drm/vc4: hdmi: Disable connector status polling
 during suspend
Message-ID: <20240702-qualified-archetypal-worm-416a2f@houat>
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-8-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6llmvbphtnayplvp"
Content-Disposition: inline
In-Reply-To: <20240630153652.318882-8-wahrenst@gmx.net>
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


--6llmvbphtnayplvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jun 30, 2024 at 05:36:48PM GMT, Stefan Wahren wrote:
> Suspend of VC4 HDMI will likely triggers a warning from
> vc4_hdmi_connector_detect_ctx() during poll of connector status.
> The power management will prevent the resume and keep the relevant
> power domain disabled.
>=20
> Since there is no reason to poll the connector status during
> suspend, the polling should be disabled during this.
>=20
> It not possible to use drm_mode_config_helper_suspend() here,
> because the callbacks might be called during bind phase and not all
> components are fully initialized.
>=20
> Link: https://lore.kernel.org/dri-devel/7003512d-7303-4f41-b0d6-a8af5bf8e=
497@gmx.net/
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index b3a42b709718..e80495cea6ac 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -3106,6 +3106,13 @@ static int vc5_hdmi_init_resources(struct drm_devi=
ce *drm,
>  static int vc4_hdmi_runtime_suspend(struct device *dev)
>  {
>  	struct vc4_hdmi *vc4_hdmi =3D dev_get_drvdata(dev);
> +	struct drm_device *drm =3D vc4_hdmi->connector.dev;
> +
> +	/*
> +	 * Don't disable polling if it was never initialized
> +	 */
> +	if (drm && drm->mode_config.poll_enabled)
> +		drm_kms_helper_poll_disable(drm);

Does it make sense to add it to runtime_suspend?

What if the board boots without a display connected, and only after a
while one is connected? Wouldn't that prevent the driver from detecting
it?

Maxime

--6llmvbphtnayplvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoQFEQAKCRDj7w1vZxhR
xUcYAP0YlWR0ZuDtA9KJMgk7F8lTvGRgIEvJmoavoyU/a9BZCgD/aDVTPguo0KhG
fL9qskoopigvTc4187S0uVSHehb/tgU=
=y7a7
-----END PGP SIGNATURE-----

--6llmvbphtnayplvp--
