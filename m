Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C1ACEF73
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C48E10E89E;
	Thu,  5 Jun 2025 12:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="pVSTaLFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D500A10E278
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=zEGbwu8CAS5JLPO6lzSDuFQRGHhN4eZGAp30aub2LVY=; b=pVSTaLFQN70Jt+PegzbmdZ87ZC
 2BAAllzSeLXD15J2UJWzsl/RjHCLLfJ4115xKArCsliXQUiON3EKtAoOzaMKaRkoeefXHwqlPquqs
 kkrCWJFyQ6D6DyNHRdCpAqnACnmi+QsEMveXqFGyCWdbFeTlS2pxyHN8T+SypZ7t5r2Gmlg8/p/SM
 mpNpvPZfHAoW0nEfrwzFP+vkFXOLjkpPhEcvbMgiRcexKkwkRQSGTRjd9ZARL2c8HEhh1mkzscaGu
 QswcuPfOixwfF2jihGbI3/xjqBwB8ACDwwm2OidgTE0MDWemE/DVXGVdeCBoJwPN2XsGi28YTgCld
 F4a3qogw==;
Received: from i53875ad6.versanet.de ([83.135.90.214] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uN9yr-0001m5-GX; Thu, 05 Jun 2025 14:46:01 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 Diederik de Haas <didi.debian@cknow.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, javierm@redhat.com,
 megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 3/4] drm/panel: himax-hx8394: Add Support for Huiling
 hl055fhav028c
Date: Thu, 05 Jun 2025 14:46:00 +0200
Message-ID: <2932680.yaVYbkx8dN@diego>
In-Reply-To: <DAEKVTXT0FHB.TOVX7BU9ZYXA@cknow.org>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-4-macroalpha82@gmail.com>
 <DAEKVTXT0FHB.TOVX7BU9ZYXA@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Donnerstag, 5. Juni 2025, 13:54:50 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Diederik de Haas:
> On Tue Jun 3, 2025 at 9:39 PM CEST, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Add support for the Huiling hl055fhav028c panel as used on the
> > Gameforce Ace handheld gaming console. This panel uses a Himax HX8399C
> > display controller and requires a sparsely documented vendor provided
> > init sequence. The display resolution is 1080x1920 and is 70mm by 127mm
> > as stated in the manufacturer's documentation.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx8394.c | 142 +++++++++++++++++++++
> >  1 file changed, 142 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/d=
rm/panel/panel-himax-hx8394.c
> > index ff994bf0e3cc..16e450b156b7 100644
> > --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> > +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> > @@ -477,6 +477,147 @@ static const struct hx8394_panel_desc mchp_ac40t0=
8a_desc =3D {
> >  	.init_sequence =3D mchp_ac40t08a_init_sequence,
> >  };
> > <snip>
> > +
> > +static const struct drm_display_mode hl055fhav028c_mode =3D {
> > +	.hdisplay	=3D 1080,
> > +	.hsync_start	=3D 1080 + 32,
> > +	.hsync_end	=3D 1080 + 32 + 8,
> > +	.htotal		=3D 1080 + 32 + 8 + 32,
> > +	.vdisplay	=3D 1920,
> > +	.vsync_start	=3D 1920 + 16,
> > +	.vsync_end	=3D 1920 + 16 + 2,
> > +	.vtotal		=3D 1920 + 16 + 2 + 14,
>=20
> Shouldn't this be 's/14/16/' ?

Could you give a reason for why you think so please, so that we
don't dance around the perceived problem too long :-) .

The front-porch / back-porch values are not generally identical
that is more a random event.

Grabbing a random panel like the panel-leadtek-ltk050h3146w.c
you'll see the values not matching.

So those timing values are specific to the panel and in the common
case not identical.


Heiko

>=20
> Cheers,
>   Diederik
>=20
> > +	.clock		=3D 134920,
> > +	.flags		=3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +	.width_mm	=3D 70,
> > +	.height_mm	=3D 127,
> > +};
> > +
> > +static const struct hx8394_panel_desc hl055fhav028c_desc =3D {
> > +	.mode =3D &hl055fhav028c_mode,
> > +	.lanes =3D 4,
> > +	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
> > +	.format =3D MIPI_DSI_FMT_RGB888,
> > +	.init_sequence =3D hl055fhav028c_init_sequence,
> > +};
> > +
> >  static int hx8394_enable(struct drm_panel *panel)
> >  {
> >  	struct hx8394 *ctx =3D panel_to_hx8394(panel);
> > @@ -683,6 +824,7 @@ static void hx8394_remove(struct mipi_dsi_device *d=
si)
> > =20
> >  static const struct of_device_id hx8394_of_match[] =3D {
> >  	{ .compatible =3D "hannstar,hsd060bhw4", .data =3D &hsd060bhw4_desc },
> > +	{ .compatible =3D "huiling,hl055fhav028c", .data =3D &hl055fhav028c_d=
esc },
> >  	{ .compatible =3D "powkiddy,x55-panel", .data =3D &powkiddy_x55_desc =
},
> >  	{ .compatible =3D "microchip,ac40t08a-mipi-panel", .data =3D &mchp_ac=
40t08a_desc },
> >  	{ /* sentinel */ }
>=20
>=20




