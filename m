Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA51EA414
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 14:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206D96E083;
	Mon,  1 Jun 2020 12:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6966D6E083
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 12:39:42 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6B82820026;
 Mon,  1 Jun 2020 14:39:36 +0200 (CEST)
Date: Mon, 1 Jun 2020 14:39:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3 13/13] backlight: use backlight_is_blank() in all
 backlight drivers
Message-ID: <20200601123934.GA7560@ravnborg.org>
References: <20200601065207.492614-1-sam@ravnborg.org>
 <20200601065207.492614-14-sam@ravnborg.org>
 <fedbbee9-e8c3-d460-cd2d-f2388675d1a4@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fedbbee9-e8c3-d460-cd2d-f2388675d1a4@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=X3a0BiUdAAAA:8 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=Hz_N3PfyXqQW7AwsI2gA:9 a=wPNLvfGTeEIA:10
 a=aeg5Gbbo78KNqacMgKqU:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22 a=oVHKYsEdi7-vN-J5QA_j:22
 a=aWu3muFgq6otJbhCXpL5:22 a=AjGcO6oz07-iQ99wixmX:22
 a=YXXWInSmI4Sqt1AkVdoW:22
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 01, 2020 at 03:28:01PM +0300, Peter Ujfalusi wrote:
> =

> =

> On 01/06/2020 9.52, Sam Ravnborg wrote:
> > Replaces the open-coded checks of the state etc.,
> > with the backlight_is_blank() helper.
> > This increases readability of the code and align
> > the functionality across the drivers.
> =

> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Thanks, I missed your previsous r-b. Sorry.

	Sam

> =

> > v3:
> >   - Dropped as3711_bl, it will be modified in another patch
> > =

> > v2:
> >   - Fixed so changelog is readable
> > =

> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Michael Hennerich <michael.hennerich@analog.com>
> > Cc: Support Opensource <support.opensource@diasemi.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengutronix.de>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: linux-pwm@vger.kernel.org
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: patches@opensource.cirrus.com
> > ---
> >  drivers/video/backlight/88pm860x_bl.c    |  8 +-------
> >  drivers/video/backlight/adp5520_bl.c     |  5 +----
> >  drivers/video/backlight/adp8860_bl.c     |  5 +----
> >  drivers/video/backlight/adp8870_bl.c     |  5 +----
> >  drivers/video/backlight/bd6107.c         |  4 +---
> >  drivers/video/backlight/corgi_lcd.c      |  5 +----
> >  drivers/video/backlight/cr_bllcd.c       | 22 +++++++---------------
> >  drivers/video/backlight/da903x_bl.c      |  8 +-------
> >  drivers/video/backlight/ep93xx_bl.c      |  3 +--
> >  drivers/video/backlight/gpio_backlight.c |  4 +---
> >  drivers/video/backlight/hp680_bl.c       |  4 +---
> >  drivers/video/backlight/jornada720_bl.c  |  2 +-
> >  drivers/video/backlight/kb3886_bl.c      |  4 +---
> >  drivers/video/backlight/led_bl.c         |  4 +---
> >  drivers/video/backlight/lm3533_bl.c      |  4 +---
> >  drivers/video/backlight/locomolcd.c      |  4 +---
> >  drivers/video/backlight/lv5207lp.c       |  4 +---
> >  drivers/video/backlight/max8925_bl.c     |  8 +-------
> >  drivers/video/backlight/pwm_bl.c         |  4 +---
> >  drivers/video/backlight/qcom-wled.c      |  4 +---
> >  drivers/video/backlight/tps65217_bl.c    |  4 +---
> >  drivers/video/backlight/wm831x_bl.c      |  8 +-------
> >  22 files changed, 28 insertions(+), 95 deletions(-)
> > =

> > diff --git a/drivers/video/backlight/88pm860x_bl.c b/drivers/video/back=
light/88pm860x_bl.c
> > index 20d96a5ac384..162c83ab0f5a 100644
> > --- a/drivers/video/backlight/88pm860x_bl.c
> > +++ b/drivers/video/backlight/88pm860x_bl.c
> > @@ -123,13 +123,7 @@ static int pm860x_backlight_update_status(struct b=
acklight_device *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.state & BL_CORE_SUSPENDED)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return pm860x_backlight_set(bl, brightness);
> > diff --git a/drivers/video/backlight/adp5520_bl.c b/drivers/video/backl=
ight/adp5520_bl.c
> > index 0f63f76723a5..d817b0d95c9d 100644
> > --- a/drivers/video/backlight/adp5520_bl.c
> > +++ b/drivers/video/backlight/adp5520_bl.c
> > @@ -67,10 +67,7 @@ static int adp5520_bl_update_status(struct backlight=
_device *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return adp5520_bl_set(bl, brightness);
> > diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backl=
ight/adp8860_bl.c
> > index 19968104fc47..a0ce2a3701fa 100644
> > --- a/drivers/video/backlight/adp8860_bl.c
> > +++ b/drivers/video/backlight/adp8860_bl.c
> > @@ -363,10 +363,7 @@ static int adp8860_bl_update_status(struct backlig=
ht_device *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return adp8860_bl_set(bl, brightness);
> > diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backl=
ight/adp8870_bl.c
> > index 4c0032010cfe..ae4269fdb189 100644
> > --- a/drivers/video/backlight/adp8870_bl.c
> > +++ b/drivers/video/backlight/adp8870_bl.c
> > @@ -401,10 +401,7 @@ static int adp8870_bl_update_status(struct backlig=
ht_device *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return adp8870_bl_set(bl, brightness);
> > diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight=
/bd6107.c
> > index d5d5fb457e78..f6a5c1dba3bc 100644
> > --- a/drivers/video/backlight/bd6107.c
> > +++ b/drivers/video/backlight/bd6107.c
> > @@ -84,9 +84,7 @@ static int bd6107_backlight_update_status(struct back=
light_device *backlight)
> >  	struct bd6107 *bd =3D bl_get_data(backlight);
> >  	int brightness =3D backlight->props.brightness;
> >  =

> > -	if (backlight->props.power !=3D FB_BLANK_UNBLANK ||
> > -	    backlight->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> > -	    backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> > +	if (backlight_is_blank(backlight))
> >  		brightness =3D 0;
> >  =

> >  	if (brightness) {
> > diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backli=
ght/corgi_lcd.c
> > index 25ef0cbd7583..c9adf4e26355 100644
> > --- a/drivers/video/backlight/corgi_lcd.c
> > +++ b/drivers/video/backlight/corgi_lcd.c
> > @@ -422,10 +422,7 @@ static int corgi_bl_update_status(struct backlight=
_device *bd)
> >  	struct corgi_lcd *lcd =3D bl_get_data(bd);
> >  	int intensity =3D bd->props.brightness;
> >  =

> > -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> > -		intensity =3D 0;
> > -
> > -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bd))
> >  		intensity =3D 0;
> >  =

> >  	if (corgibl_flags & CORGIBL_SUSPENDED)
> > diff --git a/drivers/video/backlight/cr_bllcd.c b/drivers/video/backlig=
ht/cr_bllcd.c
> > index 4624b7b7c6a6..d5ab7675f55c 100644
> > --- a/drivers/video/backlight/cr_bllcd.c
> > +++ b/drivers/video/backlight/cr_bllcd.c
> > @@ -59,26 +59,18 @@ struct cr_panel {
> >  =

> >  static int cr_backlight_set_intensity(struct backlight_device *bd)
> >  {
> > -	int intensity =3D bd->props.brightness;
> >  	u32 addr =3D gpio_bar + CRVML_PANEL_PORT;
> >  	u32 cur =3D inl(addr);
> >  =

> > -	if (bd->props.power =3D=3D FB_BLANK_UNBLANK)
> > -		intensity =3D FB_BLANK_UNBLANK;
> > -	if (bd->props.fb_blank =3D=3D FB_BLANK_UNBLANK)
> > -		intensity =3D FB_BLANK_UNBLANK;
> > -	if (bd->props.power =3D=3D FB_BLANK_POWERDOWN)
> > -		intensity =3D FB_BLANK_POWERDOWN;
> > -	if (bd->props.fb_blank =3D=3D FB_BLANK_POWERDOWN)
> > -		intensity =3D FB_BLANK_POWERDOWN;
> > -
> > -	if (intensity =3D=3D FB_BLANK_UNBLANK) { /* FULL ON */
> > -		cur &=3D ~CRVML_BACKLIGHT_OFF;
> > -		outl(cur, addr);
> > -	} else if (intensity =3D=3D FB_BLANK_POWERDOWN) { /* OFF */
> > +	if (backlight_is_blank(bd)) {
> > +		/* OFF */
> >  		cur |=3D CRVML_BACKLIGHT_OFF;
> >  		outl(cur, addr);
> > -	} /* anything else, don't bother */
> > +	} else {
> > +		/* FULL ON */
> > +		cur &=3D ~CRVML_BACKLIGHT_OFF;
> > +		outl(cur, addr);
> > +	}
> >  =

> >  	return 0;
> >  }
> > diff --git a/drivers/video/backlight/da903x_bl.c b/drivers/video/backli=
ght/da903x_bl.c
> > index 62540e4bdedb..ca351badfdcf 100644
> > --- a/drivers/video/backlight/da903x_bl.c
> > +++ b/drivers/video/backlight/da903x_bl.c
> > @@ -79,13 +79,7 @@ static int da903x_backlight_update_status(struct bac=
klight_device *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.state & BL_CORE_SUSPENDED)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return da903x_backlight_set(bl, brightness);
> > diff --git a/drivers/video/backlight/ep93xx_bl.c b/drivers/video/backli=
ght/ep93xx_bl.c
> > index 4149e0b2f83c..491185df1411 100644
> > --- a/drivers/video/backlight/ep93xx_bl.c
> > +++ b/drivers/video/backlight/ep93xx_bl.c
> > @@ -38,8 +38,7 @@ static int ep93xxbl_update_status(struct backlight_de=
vice *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return ep93xxbl_set(bl, brightness);
> > diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/b=
acklight/gpio_backlight.c
> > index 75409ddfba3e..94b65e4d2aa0 100644
> > --- a/drivers/video/backlight/gpio_backlight.c
> > +++ b/drivers/video/backlight/gpio_backlight.c
> > @@ -25,9 +25,7 @@ static int gpio_backlight_get_next_brightness(struct =
backlight_device *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return brightness;
> > diff --git a/drivers/video/backlight/hp680_bl.c b/drivers/video/backlig=
ht/hp680_bl.c
> > index 8ea42b8d9bc8..01d805ca8415 100644
> > --- a/drivers/video/backlight/hp680_bl.c
> > +++ b/drivers/video/backlight/hp680_bl.c
> > @@ -35,9 +35,7 @@ static void hp680bl_send_intensity(struct backlight_d=
evice *bd)
> >  	u16 v;
> >  	int intensity =3D bd->props.brightness;
> >  =

> > -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> > -		intensity =3D 0;
> > -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bd))
> >  		intensity =3D 0;
> >  	if (hp680bl_suspended)
> >  		intensity =3D 0;
> > diff --git a/drivers/video/backlight/jornada720_bl.c b/drivers/video/ba=
cklight/jornada720_bl.c
> > index f0385f9cf9da..996f7ba3b373 100644
> > --- a/drivers/video/backlight/jornada720_bl.c
> > +++ b/drivers/video/backlight/jornada720_bl.c
> > @@ -54,7 +54,7 @@ static int jornada_bl_update_status(struct backlight_=
device *bd)
> >  	jornada_ssp_start();
> >  =

> >  	/* If backlight is off then really turn it off */
> > -	if ((bd->props.power !=3D FB_BLANK_UNBLANK) || (bd->props.fb_blank !=
=3D FB_BLANK_UNBLANK)) {
> > +	if (backlight_is_blank(bd)) {
> >  		ret =3D jornada_ssp_byte(BRIGHTNESSOFF);
> >  		if (ret !=3D TXDUMMY) {
> >  			dev_info(&bd->dev, "brightness off timeout\n");
> > diff --git a/drivers/video/backlight/kb3886_bl.c b/drivers/video/backli=
ght/kb3886_bl.c
> > index 1dfe13c18925..a0fd5d3d82f5 100644
> > --- a/drivers/video/backlight/kb3886_bl.c
> > +++ b/drivers/video/backlight/kb3886_bl.c
> > @@ -89,9 +89,7 @@ static int kb3886bl_send_intensity(struct backlight_d=
evice *bd)
> >  {
> >  	int intensity =3D bd->props.brightness;
> >  =

> > -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> > -		intensity =3D 0;
> > -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bd))
> >  		intensity =3D 0;
> >  	if (kb3886bl_flags & KB3886BL_SUSPENDED)
> >  		intensity =3D 0;
> > diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight=
/led_bl.c
> > index 3f66549997c8..c655ddd99cfb 100644
> > --- a/drivers/video/backlight/led_bl.c
> > +++ b/drivers/video/backlight/led_bl.c
> > @@ -56,9 +56,7 @@ static int led_bl_update_status(struct backlight_devi=
ce *bl)
> >  	struct led_bl_data *priv =3D bl_get_data(bl);
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.state & BL_CORE_FBBLANK)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	if (brightness > 0)
> > diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backli=
ght/lm3533_bl.c
> > index ee09d1bd02b9..476146b62c4e 100644
> > --- a/drivers/video/backlight/lm3533_bl.c
> > +++ b/drivers/video/backlight/lm3533_bl.c
> > @@ -41,9 +41,7 @@ static int lm3533_bl_update_status(struct backlight_d=
evice *bd)
> >  	struct lm3533_bl *bl =3D bl_get_data(bd);
> >  	int brightness =3D bd->props.brightness;
> >  =

> > -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bd))
> >  		brightness =3D 0;
> >  =

> >  	return lm3533_ctrlbank_set_brightness(&bl->cb, (u8)brightness);
> > diff --git a/drivers/video/backlight/locomolcd.c b/drivers/video/backli=
ght/locomolcd.c
> > index cdc02e04f89d..8064cad8d683 100644
> > --- a/drivers/video/backlight/locomolcd.c
> > +++ b/drivers/video/backlight/locomolcd.c
> > @@ -113,9 +113,7 @@ static int locomolcd_set_intensity(struct backlight=
_device *bd)
> >  {
> >  	int intensity =3D bd->props.brightness;
> >  =

> > -	if (bd->props.power !=3D FB_BLANK_UNBLANK)
> > -		intensity =3D 0;
> > -	if (bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > +	if (backlight_is_blank(bd))
> >  		intensity =3D 0;
> >  	if (locomolcd_flags & LOCOMOLCD_SUSPENDED)
> >  		intensity =3D 0;
> > diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlig=
ht/lv5207lp.c
> > index c6ad73a784e2..ef8aa9803577 100644
> > --- a/drivers/video/backlight/lv5207lp.c
> > +++ b/drivers/video/backlight/lv5207lp.c
> > @@ -48,9 +48,7 @@ static int lv5207lp_backlight_update_status(struct ba=
cklight_device *backlight)
> >  	struct lv5207lp *lv =3D bl_get_data(backlight);
> >  	int brightness =3D backlight->props.brightness;
> >  =

> > -	if (backlight->props.power !=3D FB_BLANK_UNBLANK ||
> > -	    backlight->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> > -	    backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> > +	if (backlight_is_blank(backlight))
> >  		brightness =3D 0;
> >  =

> >  	if (brightness) {
> > diff --git a/drivers/video/backlight/max8925_bl.c b/drivers/video/backl=
ight/max8925_bl.c
> > index 97cc260ff9d1..b8af2c6407d3 100644
> > --- a/drivers/video/backlight/max8925_bl.c
> > +++ b/drivers/video/backlight/max8925_bl.c
> > @@ -66,13 +66,7 @@ static int max8925_backlight_update_status(struct ba=
cklight_device *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.state & BL_CORE_SUSPENDED)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return max8925_backlight_set(bl, brightness);
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight=
/pwm_bl.c
> > index 82b8d7594701..7d0ffcd37f07 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -111,9 +111,7 @@ static int pwm_backlight_update_status(struct backl=
ight_device *bl)
> >  	int brightness =3D bl->props.brightness;
> >  	struct pwm_state state;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.state & BL_CORE_FBBLANK)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	if (pb->notify)
> > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backli=
ght/qcom-wled.c
> > index 3d276b30a78c..9600f5d58ece 100644
> > --- a/drivers/video/backlight/qcom-wled.c
> > +++ b/drivers/video/backlight/qcom-wled.c
> > @@ -261,9 +261,7 @@ static int wled_update_status(struct backlight_devi=
ce *bl)
> >  	u16 brightness =3D bl->props.brightness;
> >  	int rc =3D 0;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> > -	    bl->props.state & BL_CORE_FBBLANK)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	mutex_lock(&wled->lock);
> > diff --git a/drivers/video/backlight/tps65217_bl.c b/drivers/video/back=
light/tps65217_bl.c
> > index 762e3feed097..1041e5e62ee3 100644
> > --- a/drivers/video/backlight/tps65217_bl.c
> > +++ b/drivers/video/backlight/tps65217_bl.c
> > @@ -82,9 +82,7 @@ static int tps65217_bl_update_status(struct backlight=
_device *bl)
> >  	if (bl->props.state & BL_CORE_SUSPENDED)
> >  		brightness =3D 0;
> >  =

> > -	if ((bl->props.power !=3D FB_BLANK_UNBLANK) ||
> > -		(bl->props.fb_blank !=3D FB_BLANK_UNBLANK))
> > -		/* framebuffer in low power mode or blanking active */
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	if (brightness > 0) {
> > diff --git a/drivers/video/backlight/wm831x_bl.c b/drivers/video/backli=
ght/wm831x_bl.c
> > index e55977d54c15..dc2ab6c8b7f9 100644
> > --- a/drivers/video/backlight/wm831x_bl.c
> > +++ b/drivers/video/backlight/wm831x_bl.c
> > @@ -93,13 +93,7 @@ static int wm831x_backlight_update_status(struct bac=
klight_device *bl)
> >  {
> >  	int brightness =3D bl->props.brightness;
> >  =

> > -	if (bl->props.power !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.fb_blank !=3D FB_BLANK_UNBLANK)
> > -		brightness =3D 0;
> > -
> > -	if (bl->props.state & BL_CORE_SUSPENDED)
> > +	if (backlight_is_blank(bl))
> >  		brightness =3D 0;
> >  =

> >  	return wm831x_backlight_set(bl, brightness);
> > =

> =

> - P=E9ter
> =

> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
