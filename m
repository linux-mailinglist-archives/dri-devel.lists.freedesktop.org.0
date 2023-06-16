Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D0732CA3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0521F10E596;
	Fri, 16 Jun 2023 10:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607DE10E596
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:01:33 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686909691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9X5WQIES+6mq7XGo7uf4HLjXsHKtnf4NLzPOksl9SVk=;
 b=LgRQEufPhj+l9+E7vgGPxDm3rkY2NdCq6QYoro45KxB6Rs/lxfvhxQAWpuX50I6XRWgOrc
 H3DW9aT6nubsEk1XukvYEN6zDQFI6bqDfOkNEP4wqwJYc1Lz3Q6t+3eRjy/IzXshpUMSg4
 3NiuVMqTBELN74GdcpEmgQg5j4hVBrRQ5byTendTvCec6MRH9Et2drrWrS7d7w4Gn11bpM
 jn/nD758w8UEx0ofmq09mmBSMySd7rpidY6o74jwSdPsBMfNkL/3r30CcFJEXjEITPyi4Y
 se3O1PEj/yXBbbry+vG7NHT/Lmp3DOKKtjd1wOLhVSfM+7kqFnvrwD8grBuA+w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CE8E20009;
 Fri, 16 Jun 2023 10:01:29 +0000 (UTC)
Date: Fri, 16 Jun 2023 12:01:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 6/7] drm/panel: sitronix-st7789v: Add EDT ET028013DMA
 panel support
Message-ID: <20230616120129.75fb00b3@xps-13>
In-Reply-To: <tr2rmz375jwkwjufhgvb7vbxwqik2w6i276yshh2tbo6dcfhh7@llvt6bigivfy>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-7-miquel.raynal@bootlin.com>
 <tr2rmz375jwkwjufhgvb7vbxwqik2w6i276yshh2tbo6dcfhh7@llvt6bigivfy>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

mripard@kernel.org wrote on Mon, 12 Jun 2023 10:51:09 +0200:

> On Fri, Jun 09, 2023 at 04:59:50PM +0200, Miquel Raynal wrote:
> > This panel from Emerging Display Technologies Corporation features an
> > ST7789V2 panel inside which is almost identical to what the Sitronix
> > panel driver supports.
> >=20
> > In practice, the module physical size is specific, and experiments show
> > that the display will malfunction if any of the following situation
> > occurs:
> > * Pixel clock is above 3MHz
> > * Pixel clock is not inverted
> > I could not properly identify the reasons behind these failures, scope
> > captures show valid input signals.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 34 +++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/g=
pu/drm/panel/panel-sitronix-st7789v.c
> > index 212bccc31804..7de192a3a8aa 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > @@ -30,7 +30,8 @@
> >  #define ST7789V_RGBCTRL_RCM(n)			(((n) & 3) << 5)
> >  #define ST7789V_RGBCTRL_VSYNC_HIGH		BIT(3)
> >  #define ST7789V_RGBCTRL_HSYNC_HIGH		BIT(2)
> > -#define ST7789V_RGBCTRL_PCLK_HIGH		BIT(1)
> > +#define ST7789V_RGBCTRL_PCLK_FALLING		BIT(1)
> > +#define ST7789V_RGBCTRL_PCLK_RISING		0
> >  #define ST7789V_RGBCTRL_VBP(n)			((n) & 0x7f)
> >  #define ST7789V_RGBCTRL_HBP(n)			((n) & 0x1f)
> > =20
> > @@ -117,6 +118,7 @@ struct st7789v_panel_info {
> >  	u16 width_mm;
> >  	u16 height_mm;
> >  	u32 bus_format;
> > +	u32 bus_flags;
> >  };
> > =20
> >  struct st7789v {
> > @@ -175,6 +177,18 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vtotal =3D 320 + 8 + 4 + 4,
> >  };
> > =20
> > +static const struct drm_display_mode slow_mode =3D {
> > +	.clock =3D 3000,
> > +	.hdisplay =3D 240,
> > +	.hsync_start =3D 240 + 38,
> > +	.hsync_end =3D 240 + 38 + 10,
> > +	.htotal =3D 240 + 38 + 10 + 10,
> > +	.vdisplay =3D 320,
> > +	.vsync_start =3D 320 + 8,
> > +	.vsync_end =3D 320 + 8 + 4,
> > +	.vtotal =3D 320 + 8 + 4 + 4,
> > +}; =20
>=20
> Why is it supposed to be slow (and compared to what)? It looks like a
> fairly normal mode to me? Or is it because it's refreshed at 30Hz?

The initial support was using 60Hz and for a reason that I do not
understand (scope capture look right), the panel I use is highly
unstable at whatever frequency above 30Hz, so for me it was "slow" :-)
But of course I'll use the panel name to qualify the mode.

> Either way, the ST7789V is a panel controller and can be connected to a
> wide range of panels depending on the model, so it would be better to
> just use the model name there.

Sure.

> >  static int st7789v_get_modes(struct drm_panel *panel,
> >  			     struct drm_connector *connector)
> >  {
> > @@ -197,6 +211,7 @@ static int st7789v_get_modes(struct drm_panel *pane=
l,
> > =20
> >  	connector->display_info.width_mm =3D panel_info->width_mm;
> >  	connector->display_info.height_mm =3D panel_info->height_mm;
> > +	connector->display_info.bus_flags =3D panel_info->bus_flags;
> >  	drm_display_info_set_bus_formats(&connector->display_info,
> >  					 &panel_info->bus_format, 1);
> > =20
> > @@ -206,8 +221,13 @@ static int st7789v_get_modes(struct drm_panel *pan=
el,
> >  static int st7789v_prepare(struct drm_panel *panel)
> >  {
> >  	struct st7789v *ctx =3D panel_to_st7789v(panel);
> > +	const struct st7789v_panel_info *panel_info =3D ctx->panel_info;
> > +	u8 pck =3D ST7789V_RGBCTRL_PCLK_FALLING;
> >  	int ret;
> > =20
> > +	if (panel_info->bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > +		pck =3D ST7789V_RGBCTRL_PCLK_RISING;
> > + =20
>=20
> I guess it could be in a separate commit

I will rebase on top of Sebastian's series who already addressed that
point (as well as many others).

[...]

> > =20
> > +static const struct st7789v_panel_info et028013dma_info =3D {
> > +	.display_mode =3D &slow_mode,
> > +	.width_mm =3D 43,
> > +	.height_mm =3D 58,
> > +	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> > +	.bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
> > +};
> > +
> >  static const struct of_device_id st7789v_of_match[] =3D {
> >  	{ .compatible =3D "sitronix,st7789v", .data =3D &st7789v_info },
> > +	{ .compatible =3D "edt,et028013dma", .data =3D &et028013dma_info }, =
=20
>=20
> We should sort them by alphabetical order
>=20
> Maxime

Ok!

Thanks,
Miqu=C3=A8l
