Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6685577524
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 10:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5665B10EAAB;
	Sun, 17 Jul 2022 08:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Sun, 17 Jul 2022 08:53:05 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7412610EADF
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:53:05 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id A19441C0003; Sun, 17 Jul 2022 10:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1658047603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4f64FZhtfQR2a3FCAYRr0ogYWj/q8DKyVYT+VvicBeQ=;
 b=X/BFAsMq23/Z925NfDrqcBTa1+NMdOyKTvWC/jcKDAR6LqTUqqHZoUtcXNlv78JOtxgGnV
 KEEYsSPoUk1QuhIMUdjyfj3xzKKwVS0zAwbCUcypphXNu5ux3xhohdBfmM7V0g4XNKdvZk
 vtsZgzTGRnv3Kh57WLG7g5U2h7I81C8=
Date: Sun, 17 Jul 2022 10:46:43 +0200
From: Pavel Machek <pavel@ucw.cz>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v5 11/13] leds: mt6370: Add MediaTek MT6370 current sink
 type LED Indicator support
Message-ID: <20220717084643.GA14285@duo.ucw.cz>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-12-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20220715112607.591-12-peterwu.pub@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 alice_chen@richtek.com, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, cy_huang@richtek.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, szunichen@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>=20
> In MediaTek MT6370, there are four channel current-sink RGB LEDs that
> support hardware pattern for constant current, PWM, and breath mode.
> Isink4 channel can also be used as a CHG_VIN power good indicator.
>=20
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

> index a49979f..71bacb5 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -244,6 +244,20 @@ config LEDS_MT6323
>  	  This option enables support for on-chip LED drivers found on
>  	  Mediatek MT6323 PMIC.
> =20
> +config LEDS_MT6370_RGB
> +	tristate "LED Support for MediaTek MT6370 PMIC"
> +	depends on LEDS_CLASS
> +	depends on MFD_MT6370
> +	select LINEAR_RANGE
> +	help
> +	  Say Y here to enable support for MT6370_RGB LED device.
> +	  In MT6370, there are four channel current-sink LED drivers that
> +	  support hardware pattern for constant current, PWM, and breath mode.
> +	  Isink4 channel can also be used as a CHG_VIN power good

Should this go to leds/rgb directory, and should it depend on
multicolor framework?

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYtPMcwAKCRAw5/Bqldv6
8kpOAJ9ibEmS72bgf9dapQwzhfeNWkBoRACdEEQFY+HUneM6yUqd3lRjlWgYdx0=
=17QR
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
