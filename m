Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D43E3C5C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 21:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130A289815;
	Sun,  8 Aug 2021 19:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F95289815
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 19:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628449579;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Ph63Qh30809dBH/5EQDxkHXYUXDc9VS30qBNrtFYs7c=;
 b=com14pJTNi3S7rg4JEhF9C14/jt6kBV5mgqiVRT2DA/Dh73TCzu3ru1T5R/76aX0Zg
 uv1MboYxb/ulunMI4/S0JHGGsl+kkHtvw8pr7wtb0EQGUcZ53C9fVd0dvqZgKv6PeGvH
 rpue0ONjg5nxSet0uJkoUIaFjlmkzfY5TybVbRrisDazTqrt0/RylvyQXHaD99kMfohC
 aW3bckHyjQ5VwYpMbI2bxNI3byRUixMFux2T2PJGAs+NWiotGoLGGqUkj0mESf09iHq2
 ZA1Pykw2Q9GgNEQfPzgwmGY9afN39jtrQtWTRARLz8tapMhE73jMcQY1KBlxHgoomRyb
 pR/A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u3mM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x78J6IGbf
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 8 Aug 2021 21:06:18 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 8/8] drm/ingenic: Attach bridge chain to encoders
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <4OBJXQ.DA6PDYNSVNYV1@crapouillou.net>
Date: Sun, 8 Aug 2021 21:06:18 +0200
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C83670F-3586-435B-8374-C3CC1C791391@goldelico.com>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-9-paul@crapouillou.net>
 <2AEC5953-FE54-4DD5-88B7-783C4D9E23B2@goldelico.com>
 <4OBJXQ.DA6PDYNSVNYV1@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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



> Am 08.08.2021 um 21:04 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le dim., ao=C3=BBt 8 2021 at 20:57:09 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>> all other patches apply cleanly but this one fails on top of =
v5.14-rc4.
>> What base are you using?
>> BR and thanks,
>> Nikolaus
>=20
> The base is drm-misc (https://cgit.freedesktop.org/drm/drm-misc), =
branch drm-misc-next.

Ok, fine!

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>=20
>>> Am 08.08.2021 um 15:45 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Attach a top-level bridge to each encoder, which will be used for
>>> negociating the bus format and flags.
>>> All the bridges are now attached with =
DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>> ---
>>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 92 =
+++++++++++++++++------
>>> 1 file changed, 70 insertions(+), 22 deletions(-)
>>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =
b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> index 7ae48ead3ab6..09d5dd298078 100644
>>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> @@ -21,6 +21,7 @@
>>> #include <drm/drm_atomic.h>
>>> #include <drm/drm_atomic_helper.h>
>>> #include <drm/drm_bridge.h>
>>> +#include <drm/drm_bridge_connector.h>
>>> #include <drm/drm_color_mgmt.h>
>>> #include <drm/drm_crtc.h>
>>> #include <drm/drm_crtc_helper.h>
>>> @@ -107,6 +108,19 @@ struct ingenic_drm {
>>> 	struct drm_private_obj private_obj;
>>> };
>>> +struct ingenic_drm_bridge {
>>> +	struct drm_encoder encoder;
>>> +	struct drm_bridge bridge, *next_bridge;
>>> +
>>> +	struct drm_bus_cfg bus_cfg;
>>> +};
>>> +
>>> +static inline struct ingenic_drm_bridge *
>>> +to_ingenic_drm_bridge(struct drm_encoder *encoder)
>>> +{
>>> +	return container_of(encoder, struct ingenic_drm_bridge, =
encoder);
>>> +}
>>> +
>>> static inline struct ingenic_drm_private_state *
>>> to_ingenic_drm_priv_state(struct drm_private_state *state)
>>> {
>>> @@ -679,11 +693,10 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>> {
>>> 	struct ingenic_drm *priv =3D drm_device_get_priv(encoder->dev);
>>> 	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>>> -	struct drm_connector *conn =3D conn_state->connector;
>>> -	struct drm_display_info *info =3D &conn->display_info;
>>> +	struct ingenic_drm_bridge *bridge =3D =
to_ingenic_drm_bridge(encoder);
>>> 	unsigned int cfg, rgbcfg =3D 0;
>>> -	priv->panel_is_sharp =3D info->bus_flags & =
DRM_BUS_FLAG_SHARP_SIGNALS;
>>> +	priv->panel_is_sharp =3D bridge->bus_cfg.flags & =
DRM_BUS_FLAG_SHARP_SIGNALS;
>>> 	if (priv->panel_is_sharp) {
>>> 		cfg =3D JZ_LCD_CFG_MODE_SPECIAL_TFT_1 | =
JZ_LCD_CFG_REV_POLARITY;
>>> @@ -696,19 +709,19 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>> 		cfg |=3D JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>>> 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>> 		cfg |=3D JZ_LCD_CFG_VSYNC_ACTIVE_LOW;
>>> -	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>>> +	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
>>> 		cfg |=3D JZ_LCD_CFG_DE_ACTIVE_LOW;
>>> -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>>> +	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>>> 		cfg |=3D JZ_LCD_CFG_PCLK_FALLING_EDGE;
>>> 	if (!priv->panel_is_sharp) {
>>> -		if (conn->connector_type =3D=3D DRM_MODE_CONNECTOR_TV) {
>>> +		if (conn_state->connector->connector_type =3D=3D =
DRM_MODE_CONNECTOR_TV) {
>>> 			if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>> 				cfg |=3D JZ_LCD_CFG_MODE_TV_OUT_I;
>>> 			else
>>> 				cfg |=3D JZ_LCD_CFG_MODE_TV_OUT_P;
>>> 		} else {
>>> -			switch (*info->bus_formats) {
>>> +			switch (bridge->bus_cfg.format) {
>>> 			case MEDIA_BUS_FMT_RGB565_1X16:
>>> 				cfg |=3D JZ_LCD_CFG_MODE_GENERIC_16BIT;
>>> 				break;
>>> @@ -734,20 +747,29 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>> 	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
>>> }
>>> -static int ingenic_drm_encoder_atomic_check(struct drm_encoder =
*encoder,
>>> -					    struct drm_crtc_state =
*crtc_state,
>>> -					    struct drm_connector_state =
*conn_state)
>>> +static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
>>> +				     enum drm_bridge_attach_flags flags)
>>> +{
>>> +	struct ingenic_drm_bridge *ib =3D =
to_ingenic_drm_bridge(bridge->encoder);
>>> +
>>> +	return drm_bridge_attach(bridge->encoder, ib->next_bridge,
>>> +				 &ib->bridge, flags);
>>> +}
>>> +
>>> +static int ingenic_drm_bridge_atomic_check(struct drm_bridge =
*bridge,
>>> +					   struct drm_bridge_state =
*bridge_state,
>>> +					   struct drm_crtc_state =
*crtc_state,
>>> +					   struct drm_connector_state =
*conn_state)
>>> {
>>> -	struct drm_display_info *info =3D =
&conn_state->connector->display_info;
>>> 	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>>> +	struct ingenic_drm_bridge *ib =3D =
to_ingenic_drm_bridge(bridge->encoder);
>>> -	if (info->num_bus_formats !=3D 1)
>>> -		return -EINVAL;
>>> +	ib->bus_cfg =3D bridge_state->output_bus_cfg;
>>> 	if (conn_state->connector->connector_type =3D=3D =
DRM_MODE_CONNECTOR_TV)
>>> 		return 0;
>>> -	switch (*info->bus_formats) {
>>> +	switch (bridge_state->output_bus_cfg.format) {
>>> 	case MEDIA_BUS_FMT_RGB888_3X8:
>>> 	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
>>> 		/*
>>> @@ -911,8 +933,16 @@ static const struct drm_crtc_helper_funcs =
ingenic_drm_crtc_helper_funcs =3D {
>>> };
>>> static const struct drm_encoder_helper_funcs =
ingenic_drm_encoder_helper_funcs =3D {
>>> -	.atomic_mode_set	=3D ingenic_drm_encoder_atomic_mode_set,
>>> -	.atomic_check		=3D ingenic_drm_encoder_atomic_check,
>>> +	.atomic_mode_set        =3D ingenic_drm_encoder_atomic_mode_set,
>>> +};
>>> +
>>> +static const struct drm_bridge_funcs ingenic_drm_bridge_funcs =3D {
>>> +	.attach			=3D ingenic_drm_bridge_attach,
>>> +	.atomic_check		=3D ingenic_drm_bridge_atomic_check,
>>> +	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
>>> +	.atomic_duplicate_state	=3D =
drm_atomic_helper_bridge_duplicate_state,
>>> +	.atomic_destroy_state	=3D =
drm_atomic_helper_bridge_destroy_state,
>>> +	.atomic_get_input_bus_fmts =3D =
drm_atomic_helper_bridge_propagate_bus_fmt,
>>> };
>>> static const struct drm_mode_config_funcs =
ingenic_drm_mode_config_funcs =3D {
>>> @@ -958,7 +988,9 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
>>> 	struct drm_plane *primary;
>>> 	struct drm_bridge *bridge;
>>> 	struct drm_panel *panel;
>>> +	struct drm_connector *connector;
>>> 	struct drm_encoder *encoder;
>>> +	struct ingenic_drm_bridge *ib;
>>> 	struct drm_device *drm;
>>> 	void __iomem *base;
>>> 	long parent_rate;
>>> @@ -1146,20 +1178,36 @@ static int ingenic_drm_bind(struct device =
*dev, bool has_components)
>>> 			bridge =3D devm_drm_panel_bridge_add_typed(dev, =
panel,
>>> 								 =
DRM_MODE_CONNECTOR_DPI);
>>> -		encoder =3D drmm_plain_encoder_alloc(drm, NULL, =
DRM_MODE_ENCODER_DPI, NULL);
>>> -		if (IS_ERR(encoder)) {
>>> -			ret =3D PTR_ERR(encoder);
>>> +		ib =3D drmm_encoder_alloc(drm, struct =
ingenic_drm_bridge, encoder,
>>> +					NULL, DRM_MODE_ENCODER_DPI, =
NULL);
>>> +		if (IS_ERR(ib)) {
>>> +			ret =3D PTR_ERR(ib);
>>> 			dev_err(dev, "Failed to init encoder: %d\n", =
ret);
>>> 			return ret;
>>> 		}
>>> -		encoder->possible_crtcs =3D 1;
>>> +		encoder =3D &ib->encoder;
>>> +		encoder->possible_crtcs =3D drm_crtc_mask(&priv->crtc);
>>> 		drm_encoder_helper_add(encoder, =
&ingenic_drm_encoder_helper_funcs);
>>> -		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
>>> -		if (ret)
>>> +		ib->bridge.funcs =3D &ingenic_drm_bridge_funcs;
>>> +		ib->next_bridge =3D bridge;
>>> +
>>> +		ret =3D drm_bridge_attach(encoder, &ib->bridge, NULL,
>>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>> +		if (ret) {
>>> +			dev_err(dev, "Unable to attach bridge\n");
>>> 			return ret;
>>> +		}
>>> +
>>> +		connector =3D drm_bridge_connector_init(drm, encoder);
>>> +		if (IS_ERR(connector)) {
>>> +			dev_err(dev, "Unable to init connector\n");
>>> +			return PTR_ERR(connector);
>>> +		}
>>> +
>>> +		drm_connector_attach_encoder(connector, encoder);
>>> 	}
>>> 	drm_for_each_encoder(encoder, drm) {
>>> --
>>> 2.30.2
>=20
>=20

