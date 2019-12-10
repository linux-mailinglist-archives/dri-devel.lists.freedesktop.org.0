Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CED118C76
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 16:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C875E6E11C;
	Tue, 10 Dec 2019 15:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8336E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 15:26:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1EAC1AC3E;
 Tue, 10 Dec 2019 15:26:28 +0000 (UTC)
Subject: Re: [PATCH] drm: remove drm_bridge->dev
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
 <20191210151111.21510-1-mihail.atanassov@arm.com>
 <03fe8874-a969-8c82-6a29-aca0d6754ee7@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <8b61418b-c41b-ca2f-b230-ce8cb7bc691a@suse.de>
Date: Tue, 10 Dec 2019 16:26:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <03fe8874-a969-8c82-6a29-aca0d6754ee7@suse.de>
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
Cc: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0279982663=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0279982663==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tvJaUMtivJLXKj0faQf5IftUJiZueSbey"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tvJaUMtivJLXKj0faQf5IftUJiZueSbey
Content-Type: multipart/mixed; boundary="9e7UktxUwPOJzu0QgsVxegY2pN3qh4DvN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: nd <nd@arm.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Senna Tschudin
 <peter.senna@gmail.com>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Message-ID: <8b61418b-c41b-ca2f-b230-ce8cb7bc691a@suse.de>
Subject: Re: [PATCH] drm: remove drm_bridge->dev
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
 <20191210151111.21510-1-mihail.atanassov@arm.com>
 <03fe8874-a969-8c82-6a29-aca0d6754ee7@suse.de>
In-Reply-To: <03fe8874-a969-8c82-6a29-aca0d6754ee7@suse.de>

--9e7UktxUwPOJzu0QgsVxegY2pN3qh4DvN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 10.12.19 um 16:25 schrieb Thomas Zimmermann:
>=20
>=20
> Am 10.12.19 um 16:11 schrieb Mihail Atanassov:
>> As suggested in [1], the 'dev' field is a bit repetitive, since it 1:1=

>> follows the setting and NULLing of the 'encoder' field. Therefore, use=

>> drm_bridge->encoder->dev in place of drm_bridge->dev.
>>
>> [1] https://patchwork.freedesktop.org/patch/343824/
>>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
>=20
> Nice.
>=20
> Acked-by: Thomas Zimmermann

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
>> ---
>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c           |  2 +-
>>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c     |  2 +-
>>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c     |  2 +-
>>  drivers/gpu/drm/bridge/cdns-dsi.c                      |  2 +-
>>  drivers/gpu/drm/bridge/dumb-vga-dac.c                  |  2 +-
>>  .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  2 +-
>>  drivers/gpu/drm/bridge/nxp-ptn3460.c                   |  2 +-
>>  drivers/gpu/drm/bridge/panel.c                         |  2 +-
>>  drivers/gpu/drm/bridge/parade-ps8622.c                 |  2 +-
>>  drivers/gpu/drm/bridge/sii902x.c                       |  6 +++---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c              |  6 +++---
>>  drivers/gpu/drm/bridge/tc358764.c                      |  4 ++--
>>  drivers/gpu/drm/bridge/tc358767.c                      |  6 +++---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                  |  2 +-
>>  drivers/gpu/drm/bridge/ti-tfp410.c                     |  6 +++---
>>  drivers/gpu/drm/drm_bridge.c                           | 10 ++++-----=
-
>>  drivers/gpu/drm/i2c/tda998x_drv.c                      |  2 +-
>>  drivers/gpu/drm/mcde/mcde_dsi.c                        |  2 +-
>>  drivers/gpu/drm/msm/edp/edp_bridge.c                   |  2 +-
>>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                 |  4 ++--
>>  drivers/gpu/drm/rcar-du/rcar_lvds.c                    |  3 ++-
>>  include/drm/drm_bridge.h                               |  2 --
>>  22 files changed, 35 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gp=
u/drm/bridge/adv7511/adv7511_drv.c
>> index 9e13e466e72c..009cf1fef8d4 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> @@ -863,7 +863,7 @@ static int adv7511_bridge_attach(struct drm_bridge=
 *bridge)
>>  		adv->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT |
>>  				DRM_CONNECTOR_POLL_DISCONNECT;
>> =20
>> -	ret =3D drm_connector_init(bridge->dev, &adv->connector,
>> +	ret =3D drm_connector_init(bridge->encoder->dev, &adv->connector,
>>  				 &adv7511_connector_funcs,
>>  				 DRM_MODE_CONNECTOR_HDMIA);
>>  	if (ret) {
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/driv=
ers/gpu/drm/bridge/analogix/analogix-anx6345.c
>> index 9917ce0d86a0..5b806d23fcb3 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
>> @@ -541,7 +541,7 @@ static int anx6345_bridge_attach(struct drm_bridge=
 *bridge)
>>  		return err;
>>  	}
>> =20
>> -	err =3D drm_connector_init(bridge->dev, &anx6345->connector,
>> +	err =3D drm_connector_init(bridge->encoder->dev, &anx6345->connector=
,
>>  				 &anx6345_connector_funcs,
>>  				 DRM_MODE_CONNECTOR_eDP);
>>  	if (err) {
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/driv=
ers/gpu/drm/bridge/analogix/analogix-anx78xx.c
>> index 41867be03751..7463537950cb 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
>> @@ -908,7 +908,7 @@ static int anx78xx_bridge_attach(struct drm_bridge=
 *bridge)
>>  		return err;
>>  	}
>> =20
>> -	err =3D drm_connector_init(bridge->dev, &anx78xx->connector,
>> +	err =3D drm_connector_init(bridge->encoder->dev, &anx78xx->connector=
,
>>  				 &anx78xx_connector_funcs,
>>  				 DRM_MODE_CONNECTOR_DisplayPort);
>>  	if (err) {
>> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridg=
e/cdns-dsi.c
>> index 3a5bd4e7fd1e..32863e3ad537 100644
>> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
>> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
>> @@ -651,7 +651,7 @@ static int cdns_dsi_bridge_attach(struct drm_bridg=
e *bridge)
>>  	struct cdns_dsi *dsi =3D input_to_dsi(input);
>>  	struct cdns_dsi_output *output =3D &dsi->output;
>> =20
>> -	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
>> +	if (!drm_core_check_feature(bridge->encoder->dev, DRIVER_ATOMIC)) {
>>  		dev_err(dsi->base.dev,
>>  			"cdns-dsi driver is only compatible with DRM devices supporting at=
omic updates");
>>  		return -ENOTSUPP;
>> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/b=
ridge/dumb-vga-dac.c
>> index cc33dc411b9e..67ad6cecf68d 100644
>> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
>> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
>> @@ -112,7 +112,7 @@ static int dumb_vga_attach(struct drm_bridge *brid=
ge)
>> =20
>>  	drm_connector_helper_add(&vga->connector,
>>  				 &dumb_vga_con_helper_funcs);
>> -	ret =3D drm_connector_init_with_ddc(bridge->dev, &vga->connector,
>> +	ret =3D drm_connector_init_with_ddc(bridge->encoder->dev, &vga->conn=
ector,
>>  					  &dumb_vga_con_funcs,
>>  					  DRM_MODE_CONNECTOR_VGA,
>>  					  vga->ddc);
>> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c =
b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>> index e8a49f6146c6..c914f01e4707 100644
>> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>> @@ -223,7 +223,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge=
 *bridge)
>>  	drm_connector_helper_add(connector,
>>  				 &ge_b850v3_lvds_connector_helper_funcs);
>> =20
>> -	ret =3D drm_connector_init(bridge->dev, connector,
>> +	ret =3D drm_connector_init(bridge->encoder->dev, connector,
>>  				 &ge_b850v3_lvds_connector_funcs,
>>  				 DRM_MODE_CONNECTOR_DisplayPort);
>>  	if (ret) {
>> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/br=
idge/nxp-ptn3460.c
>> index 57ff01339559..3999bb864eb9 100644
>> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
>> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
>> @@ -247,7 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge=
 *bridge)
>>  	}
>> =20
>>  	ptn_bridge->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
>> -	ret =3D drm_connector_init(bridge->dev, &ptn_bridge->connector,
>> +	ret =3D drm_connector_init(bridge->encoder->dev, &ptn_bridge->connec=
tor,
>>  			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
>>  	if (ret) {
>>  		DRM_ERROR("Failed to initialize connector with drm\n");
>> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/p=
anel.c
>> index f66777e24968..4ba4e9d9537a 100644
>> --- a/drivers/gpu/drm/bridge/panel.c
>> +++ b/drivers/gpu/drm/bridge/panel.c
>> @@ -67,7 +67,7 @@ static int panel_bridge_attach(struct drm_bridge *br=
idge)
>>  	drm_connector_helper_add(connector,
>>  				 &panel_bridge_connector_helper_funcs);
>> =20
>> -	ret =3D drm_connector_init(bridge->dev, connector,
>> +	ret =3D drm_connector_init(bridge->encoder->dev, connector,
>>  				 &panel_bridge_connector_funcs,
>>  				 panel_bridge->connector_type);
>>  	if (ret) {
>> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/=
bridge/parade-ps8622.c
>> index 10c47c008b40..c32af9c2bbcc 100644
>> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
>> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
>> @@ -487,7 +487,7 @@ static int ps8622_attach(struct drm_bridge *bridge=
)
>>  	}
>> =20
>>  	ps8622->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
>> -	ret =3D drm_connector_init(bridge->dev, &ps8622->connector,
>> +	ret =3D drm_connector_init(bridge->encoder->dev, &ps8622->connector,=

>>  			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
>>  	if (ret) {
>>  		DRM_ERROR("Failed to initialize connector with drm\n");
>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge=
/sii902x.c
>> index b70e8c5cf2e1..6ca297d78a26 100644
>> --- a/drivers/gpu/drm/bridge/sii902x.c
>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>> @@ -402,7 +402,7 @@ static void sii902x_bridge_mode_set(struct drm_bri=
dge *bridge,
>>  static int sii902x_bridge_attach(struct drm_bridge *bridge)
>>  {
>>  	struct sii902x *sii902x =3D bridge_to_sii902x(bridge);
>> -	struct drm_device *drm =3D bridge->dev;
>> +	struct drm_device *drm =3D bridge->encoder->dev;
>>  	int ret;
>> =20
>>  	drm_connector_helper_add(&sii902x->connector,
>> @@ -820,8 +820,8 @@ static irqreturn_t sii902x_interrupt(int irq, void=
 *data)
>> =20
>>  	mutex_unlock(&sii902x->mutex);
>> =20
>> -	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
>> -		drm_helper_hpd_irq_event(sii902x->bridge.dev);
>> +	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.encoder)
>> +		drm_helper_hpd_irq_event(sii902x->bridge.encoder->dev);
>> =20
>>  	return IRQ_HANDLED;
>>  }
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi.c
>> index dbe38a54870b..99274ca0fdf6 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2346,7 +2346,7 @@ static int dw_hdmi_bridge_attach(struct drm_brid=
ge *bridge)
>> =20
>>  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs)=
;
>> =20
>> -	drm_connector_init_with_ddc(bridge->dev, connector,
>> +	drm_connector_init_with_ddc(bridge->encoder->dev, connector,
>>  				    &dw_hdmi_connector_funcs,
>>  				    DRM_MODE_CONNECTOR_HDMIA,
>>  				    hdmi->ddc);
>> @@ -2554,8 +2554,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *de=
v_id)
>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>>  		dev_dbg(hdmi->dev, "EVENT=3D%s\n",
>>  			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
>> -		if (hdmi->bridge.dev)
>> -			drm_helper_hpd_irq_event(hdmi->bridge.dev);
>> +		if (hdmi->bridge.encoder)
>> +			drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
>>  	}
>> =20
>>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
>> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridg=
e/tc358764.c
>> index 96207fcfde19..e35e17b1f396 100644
>> --- a/drivers/gpu/drm/bridge/tc358764.c
>> +++ b/drivers/gpu/drm/bridge/tc358764.c
>> @@ -352,7 +352,7 @@ static void tc358764_enable(struct drm_bridge *bri=
dge)
>>  static int tc358764_attach(struct drm_bridge *bridge)
>>  {
>>  	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
>> -	struct drm_device *drm =3D bridge->dev;
>> +	struct drm_device *drm =3D bridge->encoder->dev;
>>  	int ret;
>> =20
>>  	ctx->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
>> @@ -378,7 +378,7 @@ static int tc358764_attach(struct drm_bridge *brid=
ge)
>>  static void tc358764_detach(struct drm_bridge *bridge)
>>  {
>>  	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
>> -	struct drm_device *drm =3D bridge->dev;
>> +	struct drm_device *drm =3D bridge->encoder->dev;
>> =20
>>  	drm_connector_unregister(&ctx->connector);
>>  	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector);=

>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridg=
e/tc358767.c
>> index 3709e5ace724..ab1524c00777 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -1407,7 +1407,7 @@ static int tc_bridge_attach(struct drm_bridge *b=
ridge)
>>  {
>>  	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
>>  	struct tc_data *tc =3D bridge_to_tc(bridge);
>> -	struct drm_device *drm =3D bridge->dev;
>> +	struct drm_device *drm =3D bridge->encoder->dev;
>>  	int ret;
>> =20
>>  	/* Create DP/eDP connector */
>> @@ -1514,7 +1514,7 @@ static irqreturn_t tc_irq_handler(int irq, void =
*arg)
>>  		dev_err(tc->dev, "syserr %x\n", stat);
>>  	}
>> =20
>> -	if (tc->hpd_pin >=3D 0 && tc->bridge.dev) {
>> +	if (tc->hpd_pin >=3D 0 && tc->bridge.encoder) {
>>  		/*
>>  		 * H is triggered when the GPIO goes high.
>>  		 *
>> @@ -1528,7 +1528,7 @@ static irqreturn_t tc_irq_handler(int irq, void =
*arg)
>>  			h ? "H" : "", lc ? "LC" : "");
>> =20
>>  		if (h || lc)
>> -			drm_kms_helper_hotplug_event(tc->bridge.dev);
>> +			drm_kms_helper_hotplug_event(tc->bridge.encoder->dev);
>>  	}
>> =20
>>  	regmap_write(tc->regmap, INTSTS_G, val);
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/b=
ridge/ti-sn65dsi86.c
>> index 9a2dd986afa5..8a4e64cfca1e 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -275,7 +275,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *=
bridge)
>>  						   .node =3D NULL,
>>  						 };
>> =20
>> -	ret =3D drm_connector_init(bridge->dev, &pdata->connector,
>> +	ret =3D drm_connector_init(bridge->encoder->dev, &pdata->connector,
>>  				 &ti_sn_bridge_connector_funcs,
>>  				 DRM_MODE_CONNECTOR_eDP);
>>  	if (ret) {
>> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/brid=
ge/ti-tfp410.c
>> index aa3198dc9903..76229367e2f4 100644
>> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
>> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
>> @@ -135,7 +135,7 @@ static int tfp410_attach(struct drm_bridge *bridge=
)
>> =20
>>  	drm_connector_helper_add(&dvi->connector,
>>  				 &tfp410_con_helper_funcs);
>> -	ret =3D drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
>> +	ret =3D drm_connector_init_with_ddc(bridge->encoder->dev, &dvi->conn=
ector,
>>  					  &tfp410_con_funcs,
>>  					  dvi->connector_type,
>>  					  dvi->ddc);
>> @@ -179,8 +179,8 @@ static void tfp410_hpd_work_func(struct work_struc=
t *work)
>> =20
>>  	dvi =3D container_of(work, struct tfp410, hpd_work.work);
>> =20
>> -	if (dvi->bridge.dev)
>> -		drm_helper_hpd_irq_event(dvi->bridge.dev);
>> +	if (dvi->bridge.encoder)
>> +		drm_helper_hpd_irq_event(dvi->bridge.encoder->dev);
>>  }
>> =20
>>  static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge=
=2Ec
>> index c2cf0c90fa26..eaa20804b038 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -119,13 +119,12 @@ int drm_bridge_attach(struct drm_encoder *encode=
r, struct drm_bridge *bridge,
>>  	if (!encoder || !bridge)
>>  		return -EINVAL;
>> =20
>> -	if (previous && (!previous->dev || previous->encoder !=3D encoder))
>> +	if (previous && (previous->encoder !=3D encoder))
>>  		return -EINVAL;
>> =20
>> -	if (bridge->dev)
>> +	if (bridge->encoder)
>>  		return -EBUSY;
>> =20
>> -	bridge->dev =3D encoder->dev;
>>  	bridge->encoder =3D encoder;
>> =20
>>  	if (previous)
>> @@ -137,7 +136,6 @@ int drm_bridge_attach(struct drm_encoder *encoder,=
 struct drm_bridge *bridge,
>>  		ret =3D bridge->funcs->attach(bridge);
>>  		if (ret < 0) {
>>  			list_del(&bridge->chain_node);
>> -			bridge->dev =3D NULL;
>>  			bridge->encoder =3D NULL;
>>  			return ret;
>>  		}
>> @@ -152,14 +150,14 @@ void drm_bridge_detach(struct drm_bridge *bridge=
)
>>  	if (WARN_ON(!bridge))
>>  		return;
>> =20
>> -	if (WARN_ON(!bridge->dev))
>> +	if (WARN_ON(!bridge->encoder))
>>  		return;
>> =20
>>  	if (bridge->funcs->detach)
>>  		bridge->funcs->detach(bridge);
>> =20
>>  	list_del(&bridge->chain_node);
>> -	bridge->dev =3D NULL;
>> +	bridge->encoder =3D NULL;
>>  }
>> =20
>>  /**
>> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/t=
da998x_drv.c
>> index a63790d32d75..17a66ef3dfd4 100644
>> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
>> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
>> @@ -1360,7 +1360,7 @@ static int tda998x_bridge_attach(struct drm_brid=
ge *bridge)
>>  {
>>  	struct tda998x_priv *priv =3D bridge_to_tda998x_priv(bridge);
>> =20
>> -	return tda998x_connector_init(priv, bridge->dev);
>> +	return tda998x_connector_init(priv, bridge->encoder->dev);
>>  }
>> =20
>>  static void tda998x_bridge_detach(struct drm_bridge *bridge)
>> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mc=
de_dsi.c
>> index 42fff811653e..c08d7ede9fb8 100644
>> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
>> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
>> @@ -846,7 +846,7 @@ static void mcde_dsi_bridge_disable(struct drm_bri=
dge *bridge)
>>  static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
>>  {
>>  	struct mcde_dsi *d =3D bridge_to_mcde_dsi(bridge);
>> -	struct drm_device *drm =3D bridge->dev;
>> +	struct drm_device *drm =3D bridge->encoder->dev;
>>  	int ret;
>> =20
>>  	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
>> diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/ms=
m/edp/edp_bridge.c
>> index b65b5cc2dba2..301dd7a80bde 100644
>> --- a/drivers/gpu/drm/msm/edp/edp_bridge.c
>> +++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
>> @@ -47,7 +47,7 @@ static void edp_bridge_mode_set(struct drm_bridge *b=
ridge,
>>  		const struct drm_display_mode *mode,
>>  		const struct drm_display_mode *adjusted_mode)
>>  {
>> -	struct drm_device *dev =3D bridge->dev;
>> +	struct drm_device *dev =3D bridge->encoder->dev;
>>  	struct drm_connector *connector;
>>  	struct edp_bridge *edp_bridge =3D to_edp_bridge(bridge);
>>  	struct msm_edp *edp =3D edp_bridge->edp;
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/=
msm/hdmi/hdmi_bridge.c
>> index ba81338a9bf8..07c098dce310 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> @@ -20,7 +20,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *brid=
ge)
>> =20
>>  static void msm_hdmi_power_on(struct drm_bridge *bridge)
>>  {
>> -	struct drm_device *dev =3D bridge->dev;
>> +	struct drm_device *dev =3D bridge->encoder->dev;
>>  	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
>>  	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
>>  	const struct hdmi_platform_config *config =3D hdmi->config;
>> @@ -56,7 +56,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bri=
dge)
>> =20
>>  static void power_off(struct drm_bridge *bridge)
>>  {
>> -	struct drm_device *dev =3D bridge->dev;
>> +	struct drm_device *dev =3D bridge->encoder->dev;
>>  	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
>>  	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
>>  	const struct hdmi_platform_config *config =3D hdmi->config;
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rca=
r-du/rcar_lvds.c
>> index 2cf44b91853c..83538125a722 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> @@ -622,7 +622,8 @@ static int rcar_lvds_attach(struct drm_bridge *bri=
dge)
>>  	if (!lvds->panel)
>>  		return 0;
>> =20
>> -	ret =3D drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_f=
uncs,
>> +	ret =3D drm_connector_init(bridge->encoder->dev, connector,
>> +				 &rcar_lvds_conn_funcs,
>>  				 DRM_MODE_CONNECTOR_LVDS);
>>  	if (ret < 0)
>>  		return ret;
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 694e153a7531..695d0898df38 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -380,8 +380,6 @@ struct drm_bridge_timings {
>>   * struct drm_bridge - central DRM bridge control structure
>>   */
>>  struct drm_bridge {
>> -	/** @dev: DRM device this bridge belongs to */
>> -	struct drm_device *dev;
>>  	/** @encoder: encoder to which this bridge is connected */
>>  	struct drm_encoder *encoder;
>>  	/** @chain_node: used to form a bridge chain */
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9e7UktxUwPOJzu0QgsVxegY2pN3qh4DvN--

--tvJaUMtivJLXKj0faQf5IftUJiZueSbey
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3vuSIACgkQaA3BHVML
eiN22gf+N4qC56Yr7GCph5bvGBpvfvLkOEwo6vnn7id0H5NKnfuzy6gOdU+ViPEw
n3gjI9j7ujLEI8KMvMQJCEPvpfeD7QXmNED5yKzKJf0j0DST40Rw4zDklhNO8t3M
N1iu7p+LtqVR3eAKJ6lb+04FWneRYXI6XKvfNXeEjwtZR5QCM0FaBYUJuzjU09k7
mf2jhXmksd4N6CutH/lfZFiBKYwswt2J1u+x55k+UuZja+NEYoMxUDDfbD1EBJGP
7po+GCTm7tUG7JAIM1lY0Wk5RgmSrau7gO1Nh3knhWVAxapuc9u3/H8MxCFPW82E
5LZHXys1RmWnIp670mRONHWvcZWXWg==
=EB56
-----END PGP SIGNATURE-----

--tvJaUMtivJLXKj0faQf5IftUJiZueSbey--

--===============0279982663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0279982663==--
