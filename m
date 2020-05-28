Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD381E6296
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535A96E56A;
	Thu, 28 May 2020 13:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Thu, 28 May 2020 13:44:45 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5371C6E560
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:44:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SDcZ4Q088040;
 Thu, 28 May 2020 08:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590673115;
 bh=AoFM0B1yBfXfmzb0IFosimxy1E+gGucRV6xiu7gFdY4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=HUkmQO8D4iOtis6/+Vl5MWtuSXHkhOoyNQ+b3ucNRENQscCPCpTX/tG1qyV7qQmzt
 yAVHHV++J1CQr6XfBOKNB7Ezs+42sDOyrOBvhwo5SQ/VwI+HD84ITzRdRpDX9MTtz3
 lRkcgj9dzV5uSJz3Zyi8gBvg2o1WWJZwPFiFt6J0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04SDcZJS089321
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 May 2020 08:38:35 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 08:38:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 08:38:34 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SDcTF9110515;
 Thu, 28 May 2020 08:38:29 -0500
Subject: Re: [PATCH v2 16/16] backlight: use backlight_is_blank() in all
 backlight drivers
To: Sam Ravnborg <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>, Jingoo
 Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-17-sam@ravnborg.org>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <58537a62-1188-d846-75de-165ee3dcf389@ti.com>
Date: Thu, 28 May 2020 16:39:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200517190139.740249-17-sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="------------E7C06763366503FDD27B3678"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, patches@opensource.cirrus.com,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------E7C06763366503FDD27B3678
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On 17/05/2020 22.01, Sam Ravnborg wrote:
> Replaces the open-coded checks of the state etc.,
> with the backlight_is_blank() helper.
> This increases readability of the code and align
> the functionality across the drivers.

Thanks for the cleanup in with the series!

Checked gpio/pwm/led backlight drivers mostly:
Reviewed-by: Peter Ujfalusi <peter.ujflausi@ti.com>

> v2:
>   - Fixed so changelog is readable
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Support Opensource <support.opensource@diasemi.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-pwm@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: patches@opensource.cirrus.com
> ---
>  drivers/video/backlight/88pm860x_bl.c    |  8 +-------
>  drivers/video/backlight/adp5520_bl.c     |  5 +----
>  drivers/video/backlight/adp8860_bl.c     |  5 +----
>  drivers/video/backlight/adp8870_bl.c     |  5 +----
>  drivers/video/backlight/as3711_bl.c      |  8 +++-----
>  drivers/video/backlight/bd6107.c         |  4 +---
>  drivers/video/backlight/corgi_lcd.c      |  5 +----
>  drivers/video/backlight/cr_bllcd.c       | 22 +++++++---------------
>  drivers/video/backlight/da903x_bl.c      |  8 +-------
>  drivers/video/backlight/ep93xx_bl.c      |  3 +--
>  drivers/video/backlight/gpio_backlight.c |  4 +---
>  drivers/video/backlight/hp680_bl.c       |  4 +---
>  drivers/video/backlight/jornada720_bl.c  |  2 +-
>  drivers/video/backlight/kb3886_bl.c      |  4 +---
>  drivers/video/backlight/led_bl.c         |  4 +---
>  drivers/video/backlight/lm3533_bl.c      |  4 +---
>  drivers/video/backlight/locomolcd.c      |  4 +---
>  drivers/video/backlight/lv5207lp.c       |  4 +---
>  drivers/video/backlight/max8925_bl.c     |  8 +-------
>  drivers/video/backlight/pwm_bl.c         |  4 +---
>  drivers/video/backlight/qcom-wled.c      |  4 +---
>  drivers/video/backlight/tps65217_bl.c    |  4 +---
>  drivers/video/backlight/wm831x_bl.c      |  8 +-------
>  23 files changed, 31 insertions(+), 100 deletions(-)
>=20
> diff --git a/drivers/video/backlight/88pm860x_bl.c b/drivers/video/back=
light/88pm860x_bl.c
> index 20d96a5ac384..162c83ab0f5a 100644
> --- a/drivers/video/backlight/88pm860x_bl.c
> +++ b/drivers/video/backlight/88pm860x_bl.c
> @@ -123,13 +123,7 @@ static int pm860x_backlight_update_status(struct b=
acklight_device *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return pm860x_backlight_set(bl, brightness);
> diff --git a/drivers/video/backlight/adp5520_bl.c b/drivers/video/backl=
ight/adp5520_bl.c
> index 0f63f76723a5..d817b0d95c9d 100644
> --- a/drivers/video/backlight/adp5520_bl.c
> +++ b/drivers/video/backlight/adp5520_bl.c
> @@ -67,10 +67,7 @@ static int adp5520_bl_update_status(struct backlight=
_device *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return adp5520_bl_set(bl, brightness);
> diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backl=
ight/adp8860_bl.c
> index 19968104fc47..a0ce2a3701fa 100644
> --- a/drivers/video/backlight/adp8860_bl.c
> +++ b/drivers/video/backlight/adp8860_bl.c
> @@ -363,10 +363,7 @@ static int adp8860_bl_update_status(struct backlig=
ht_device *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return adp8860_bl_set(bl, brightness);
> diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backl=
ight/adp8870_bl.c
> index 4c0032010cfe..ae4269fdb189 100644
> --- a/drivers/video/backlight/adp8870_bl.c
> +++ b/drivers/video/backlight/adp8870_bl.c
> @@ -401,10 +401,7 @@ static int adp8870_bl_update_status(struct backlig=
ht_device *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return adp8870_bl_set(bl, brightness);
> diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backli=
ght/as3711_bl.c
> index 33f0f0f2e8b3..7fa76008c7bf 100644
> --- a/drivers/video/backlight/as3711_bl.c
> +++ b/drivers/video/backlight/as3711_bl.c
> @@ -107,13 +107,11 @@ static int as3711_bl_update_status(struct backlig=
ht_device *bl)
>  	int brightness =3D bl->props.brightness;
>  	int ret =3D 0;
> =20
> -	dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, blank %x, state %x\n"=
,
> +	dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, state %x\n",
>  		__func__, bl->props.brightness, bl->props.power,
> -		bl->props.fb_blank, bl->props.state);
> +		bl->props.state);
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	if (data->type =3D=3D AS3711_BL_SU1) {
> diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight=
/bd6107.c
> index d5d5fb457e78..f6a5c1dba3bc 100644
> --- a/drivers/video/backlight/bd6107.c
> +++ b/drivers/video/backlight/bd6107.c
> @@ -84,9 +84,7 @@ static int bd6107_backlight_update_status(struct back=
light_device *backlight)
>  	struct bd6107 *bd =3D bl_get_data(backlight);
>  	int brightness =3D backlight->props.brightness;
> =20
> -	if (backlight->props.power !=3D FB_BLANK_UNBLANK ||
> -	    backlight->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> -	    backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> +	if (backlight_is_blank(backlight))
>  		brightness =3D 0;
> =20
>  	if (brightness) {
> diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backli=
ght/corgi_lcd.c
> index 25ef0cbd7583..c9adf4e26355 100644
> --- a/drivers/video/backlight/corgi_lcd.c
> +++ b/drivers/video/backlight/corgi_lcd.c
> @@ -422,10 +422,7 @@ static int corgi_bl_update_status(struct backlight=
_device *bd)
>  	struct corgi_lcd *lcd =3D bl_get_data(bd);
>  	int intensity =3D bd->props.brightness;
> =20
> -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> -		intensity =3D 0;
> -
> -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bd))
>  		intensity =3D 0;
> =20
>  	if (corgibl_flags & CORGIBL_SUSPENDED)
> diff --git a/drivers/video/backlight/cr_bllcd.c b/drivers/video/backlig=
ht/cr_bllcd.c
> index 4624b7b7c6a6..d5ab7675f55c 100644
> --- a/drivers/video/backlight/cr_bllcd.c
> +++ b/drivers/video/backlight/cr_bllcd.c
> @@ -59,26 +59,18 @@ struct cr_panel {
> =20
>  static int cr_backlight_set_intensity(struct backlight_device *bd)
>  {
> -	int intensity =3D bd->props.brightness;
>  	u32 addr =3D gpio_bar + CRVML_PANEL_PORT;
>  	u32 cur =3D inl(addr);
> =20
> -	if (bd->props.power =3D=3D FB_BLANK_UNBLANK)
> -		intensity =3D FB_BLANK_UNBLANK;
> -	if (bd->props.fb_blank =3D=3D FB_BLANK_UNBLANK)
> -		intensity =3D FB_BLANK_UNBLANK;
> -	if (bd->props.power =3D=3D FB_BLANK_POWERDOWN)
> -		intensity =3D FB_BLANK_POWERDOWN;
> -	if (bd->props.fb_blank =3D=3D FB_BLANK_POWERDOWN)
> -		intensity =3D FB_BLANK_POWERDOWN;
> -
> -	if (intensity =3D=3D FB_BLANK_UNBLANK) { /* FULL ON */
> -		cur &=3D ~CRVML_BACKLIGHT_OFF;
> -		outl(cur, addr);
> -	} else if (intensity =3D=3D FB_BLANK_POWERDOWN) { /* OFF */
> +	if (backlight_is_blank(bd)) {
> +		/* OFF */
>  		cur |=3D CRVML_BACKLIGHT_OFF;
>  		outl(cur, addr);
> -	} /* anything else, don't bother */
> +	} else {
> +		/* FULL ON */
> +		cur &=3D ~CRVML_BACKLIGHT_OFF;
> +		outl(cur, addr);
> +	}
> =20
>  	return 0;
>  }
> diff --git a/drivers/video/backlight/da903x_bl.c b/drivers/video/backli=
ght/da903x_bl.c
> index 62540e4bdedb..ca351badfdcf 100644
> --- a/drivers/video/backlight/da903x_bl.c
> +++ b/drivers/video/backlight/da903x_bl.c
> @@ -79,13 +79,7 @@ static int da903x_backlight_update_status(struct bac=
klight_device *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return da903x_backlight_set(bl, brightness);
> diff --git a/drivers/video/backlight/ep93xx_bl.c b/drivers/video/backli=
ght/ep93xx_bl.c
> index 4149e0b2f83c..491185df1411 100644
> --- a/drivers/video/backlight/ep93xx_bl.c
> +++ b/drivers/video/backlight/ep93xx_bl.c
> @@ -38,8 +38,7 @@ static int ep93xxbl_update_status(struct backlight_de=
vice *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return ep93xxbl_set(bl, brightness);
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/b=
acklight/gpio_backlight.c
> index 75409ddfba3e..94b65e4d2aa0 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -25,9 +25,7 @@ static int gpio_backlight_get_next_brightness(struct =
backlight_device *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return brightness;
> diff --git a/drivers/video/backlight/hp680_bl.c b/drivers/video/backlig=
ht/hp680_bl.c
> index 8ea42b8d9bc8..01d805ca8415 100644
> --- a/drivers/video/backlight/hp680_bl.c
> +++ b/drivers/video/backlight/hp680_bl.c
> @@ -35,9 +35,7 @@ static void hp680bl_send_intensity(struct backlight_d=
evice *bd)
>  	u16 v;
>  	int intensity =3D bd->props.brightness;
> =20
> -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> -		intensity =3D 0;
> -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bd))
>  		intensity =3D 0;
>  	if (hp680bl_suspended)
>  		intensity =3D 0;
> diff --git a/drivers/video/backlight/jornada720_bl.c b/drivers/video/ba=
cklight/jornada720_bl.c
> index f0385f9cf9da..996f7ba3b373 100644
> --- a/drivers/video/backlight/jornada720_bl.c
> +++ b/drivers/video/backlight/jornada720_bl.c
> @@ -54,7 +54,7 @@ static int jornada_bl_update_status(struct backlight_=
device *bd)
>  	jornada_ssp_start();
> =20
>  	/* If backlight is off then really turn it off */
> -	if ((bd->props.power !=3D FB_BLANK_UNBLANK) || (bd->props.fb_blank !=3D=
 FB_BLANK_UNBLANK)) {
> +	if (backlight_is_blank(bd)) {
>  		ret =3D jornada_ssp_byte(BRIGHTNESSOFF);
>  		if (ret !=3D TXDUMMY) {
>  			dev_info(&bd->dev, "brightness off timeout\n");
> diff --git a/drivers/video/backlight/kb3886_bl.c b/drivers/video/backli=
ght/kb3886_bl.c
> index 1dfe13c18925..a0fd5d3d82f5 100644
> --- a/drivers/video/backlight/kb3886_bl.c
> +++ b/drivers/video/backlight/kb3886_bl.c
> @@ -89,9 +89,7 @@ static int kb3886bl_send_intensity(struct backlight_d=
evice *bd)
>  {
>  	int intensity =3D bd->props.brightness;
> =20
> -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> -		intensity =3D 0;
> -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bd))
>  		intensity =3D 0;
>  	if (kb3886bl_flags & KB3886BL_SUSPENDED)
>  		intensity =3D 0;
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight=
/led_bl.c
> index 3f66549997c8..c655ddd99cfb 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -56,9 +56,7 @@ static int led_bl_update_status(struct backlight_devi=
ce *bl)
>  	struct led_bl_data *priv =3D bl_get_data(bl);
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.state & BL_CORE_FBBLANK)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	if (brightness > 0)
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backli=
ght/lm3533_bl.c
> index ee09d1bd02b9..476146b62c4e 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -41,9 +41,7 @@ static int lm3533_bl_update_status(struct backlight_d=
evice *bd)
>  	struct lm3533_bl *bl =3D bl_get_data(bd);
>  	int brightness =3D bd->props.brightness;
> =20
> -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bd))
>  		brightness =3D 0;
> =20
>  	return lm3533_ctrlbank_set_brightness(&bl->cb, (u8)brightness);
> diff --git a/drivers/video/backlight/locomolcd.c b/drivers/video/backli=
ght/locomolcd.c
> index cdc02e04f89d..8064cad8d683 100644
> --- a/drivers/video/backlight/locomolcd.c
> +++ b/drivers/video/backlight/locomolcd.c
> @@ -113,9 +113,7 @@ static int locomolcd_set_intensity(struct backlight=
_device *bd)
>  {
>  	int intensity =3D bd->props.brightness;
> =20
> -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> -		intensity =3D 0;
> -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(bd))
>  		intensity =3D 0;
>  	if (locomolcd_flags & LOCOMOLCD_SUSPENDED)
>  		intensity =3D 0;
> diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlig=
ht/lv5207lp.c
> index c6ad73a784e2..ef8aa9803577 100644
> --- a/drivers/video/backlight/lv5207lp.c
> +++ b/drivers/video/backlight/lv5207lp.c
> @@ -48,9 +48,7 @@ static int lv5207lp_backlight_update_status(struct ba=
cklight_device *backlight)
>  	struct lv5207lp *lv =3D bl_get_data(backlight);
>  	int brightness =3D backlight->props.brightness;
> =20
> -	if (backlight->props.power !=3D FB_BLANK_UNBLANK ||
> -	    backlight->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> -	    backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> +	if (backlight_is_blank(backlight))
>  		brightness =3D 0;
> =20
>  	if (brightness) {
> diff --git a/drivers/video/backlight/max8925_bl.c b/drivers/video/backl=
ight/max8925_bl.c
> index 97cc260ff9d1..b8af2c6407d3 100644
> --- a/drivers/video/backlight/max8925_bl.c
> +++ b/drivers/video/backlight/max8925_bl.c
> @@ -66,13 +66,7 @@ static int max8925_backlight_update_status(struct ba=
cklight_device *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return max8925_backlight_set(bl, brightness);
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight=
/pwm_bl.c
> index 82b8d7594701..7d0ffcd37f07 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -111,9 +111,7 @@ static int pwm_backlight_update_status(struct backl=
ight_device *bl)
>  	int brightness =3D bl->props.brightness;
>  	struct pwm_state state;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.state & BL_CORE_FBBLANK)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	if (pb->notify)
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backli=
ght/qcom-wled.c
> index 3d276b30a78c..9600f5d58ece 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -261,9 +261,7 @@ static int wled_update_status(struct backlight_devi=
ce *bl)
>  	u16 brightness =3D bl->props.brightness;
>  	int rc =3D 0;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.state & BL_CORE_FBBLANK)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	mutex_lock(&wled->lock);
> diff --git a/drivers/video/backlight/tps65217_bl.c b/drivers/video/back=
light/tps65217_bl.c
> index 762e3feed097..1041e5e62ee3 100644
> --- a/drivers/video/backlight/tps65217_bl.c
> +++ b/drivers/video/backlight/tps65217_bl.c
> @@ -82,9 +82,7 @@ static int tps65217_bl_update_status(struct backlight=
_device *bl)
>  	if (bl->props.state & BL_CORE_SUSPENDED)
>  		brightness =3D 0;
> =20
> -	if ((bl->props.power !=3D FB_BLANK_UNBLANK) ||
> -		(bl->props.fb_blank !=3D FB_BLANK_UNBLANK))
> -		/* framebuffer in low power mode or blanking active */
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	if (brightness > 0) {
> diff --git a/drivers/video/backlight/wm831x_bl.c b/drivers/video/backli=
ght/wm831x_bl.c
> index e55977d54c15..dc2ab6c8b7f9 100644
> --- a/drivers/video/backlight/wm831x_bl.c
> +++ b/drivers/video/backlight/wm831x_bl.c
> @@ -93,13 +93,7 @@ static int wm831x_backlight_update_status(struct bac=
klight_device *bl)
>  {
>  	int brightness =3D bl->props.brightness;
> =20
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> -		brightness =3D 0;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> +	if (backlight_is_blank(bl))
>  		brightness =3D 0;
> =20
>  	return wm831x_backlight_set(bl, brightness);
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--------------E7C06763366503FDD27B3678
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFki4nsBCAD3BM+Ogt951JlaDloruEjoZk/Z+/37CjP0fY2mqLhBOzkpx95u
X1Fquf0KfVk+ZzCd25XGOZEtpZNlXfbxRr2iRWPS5RW2FeLYGvg2TTJCpSr+ugKu
OOec6KECCUotGbGhpYwBrbarJNEwDcAzPK7UJYa1rhWOmkpZJ1hXF1hUghB84q35
8DmN4sGLcsIbVdRFZ1tWFh4vGBFV9LsoDZIrnnANb6/XMX78s+tr3RG3GZBaFPl8
jO5IIv0UIGNUKaYlNVFYthjGCzOqtstHchWuK9eQkR7m1+Vc+ezh1qK0VJydIcjn
OtoMZZL7RAz13LB9vmcJjbQPnI7dJojz/M7zABEBAAG0JlBldGVyIFVqZmFsdXNp
IDxwZXRlci51amZhbHVzaUB0aS5jb20+iQFOBBMBCAA4FiEE+dBcpRFvJjZw+uta
LCayis85LN4FAlki4nsCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQLCay
is85LN4QjggAzxxxXqiWpA3vuj9yrlGLft3BeGKWqF8+RzdeRvshtNdpGeIFf+r5
AJVR71R1w89Qeb4DGXus7qsKiafdFGG7yxbuhw8a5wUm+ZncBXA+ETn3OyVtl8g8
r/ZcPX420jClBNTVuL0sSnyqDFDrt5f+uAFOIwsnHdpns174Zu9QhgYxdvdZ+jMh
Psb745O9EVeNvdfUIRdrVjb4IhJKNIzkb0Tulsz5xeCJReUYpxZU1jzEq3YZqIou
+fi+oS4wlJuSoxKKTmIXtSeEy/weStF1XHMo6vLYqzaK4FyIuclqeuYUYSVy2425
7TMXugaI+O85AEI6KW8MCcu1NucSfAWUabkBDQRZIuJ7AQgAypKq8iIugpHxWA2c
Ck6MQdPBT6cOEVK0tjeHaHAVOUPiw9Pq+ssMifdIkDdqXNZ3RLH/X2svYvd8c81C
egqshfB8nkJ5EKmQc9d7s0EwnYT8OwsoVb3c2WXnsdcKEyu2nHgyeJEUpPpMPyLc
+PWhoREifttab4sOPktepdnUbvrDK/gkjHmiG6+L2owSn637N+Apo3/eQuDajfEu
kybxK19ReRcp6dbqWSBGSeNB32c/zv1ka37bTMNVUY39Rl+/8lA/utLfrMeACHRO
FGO1BexMASKUdmlB0v9n4BaJFGrAJYAFJBNHLCDemqkU7gjaiimuHSjwuP0Wk7Ct
KQJfVQARAQABiQE2BBgBCAAgFiEE+dBcpRFvJjZw+utaLCayis85LN4FAlki4nsC
GwwACgkQLCayis85LN7kCwgAoy9r3ZQfJNOXO1q/YQfpEELHn0p8LpwliSDUS1xL
sswyxtZS8LlW8PjlTXuBLu38Vfr0vGav7oyV7TkhnKT3oBOLXanyZqwgyZSKNEGB
PB4v3Fo7YTzpfSofiwuz03uyfjTxiMGjonxSb+YxM7HBHfzjrOKKlg02fK+lWNZo
m5lXugeWD7U6JJguNdYfr+U4zYIblelUImcIE+wnR0oLzUEVDIWSpVrl/OqS3Rzo
mw8wBsHksTHrbgUnKL0SCzYc90BTeKbyjEBnVDr+dlfbxRxkB8h9RMPMdjodvXzS
Gfsa9V/k4XAsh7iX9EUVBbnmjA61ySxU/w98h96jMuteTg=3D=3D
=3DeQmw
-----END PGP PUBLIC KEY BLOCK-----

--------------E7C06763366503FDD27B3678
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------E7C06763366503FDD27B3678--
