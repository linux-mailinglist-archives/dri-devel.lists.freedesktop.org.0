Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642DB11501B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 12:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C270E6F9DF;
	Fri,  6 Dec 2019 11:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257656F9DE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 11:59:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D268BA2F;
 Fri,  6 Dec 2019 11:59:10 +0000 (UTC)
Subject: Re: [PATCH] drm: Rename drm_bridge->dev to drm
To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
 <e73974c0-19ae-1592-ed37-26f386f37a2f@suse.de>
 <2561507.RTQXCEk2uY@e123338-lin>
From: Thomas Zimmermann <tzimmermann@suse.de>
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
Message-ID: <55bdd2ef-1033-9ae4-f033-bf6c3984cc95@suse.de>
Date: Fri, 6 Dec 2019 12:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <2561507.RTQXCEk2uY@e123338-lin>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: multipart/mixed; boundary="===============0868573998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0868573998==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nYV7oBj0RViXUm2TpS8qZ7TWfv9oNbiMp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nYV7oBj0RViXUm2TpS8qZ7TWfv9oNbiMp
Content-Type: multipart/mixed; boundary="MA2H7vYLQMiDcRnMQp0AspZcg5Koj0lqG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman
 <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Message-ID: <55bdd2ef-1033-9ae4-f033-bf6c3984cc95@suse.de>
Subject: Re: [PATCH] drm: Rename drm_bridge->dev to drm
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
 <e73974c0-19ae-1592-ed37-26f386f37a2f@suse.de>
 <2561507.RTQXCEk2uY@e123338-lin>
In-Reply-To: <2561507.RTQXCEk2uY@e123338-lin>

--MA2H7vYLQMiDcRnMQp0AspZcg5Koj0lqG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.12.19 um 12:25 schrieb Mihail Atanassov:
> Hallo Thomas,
>=20
> On Thursday, 5 December 2019 18:20:06 GMT Thomas Zimmermann wrote:
>> Hi
>>
>> Am 05.12.19 um 17:30 schrieb Mihail Atanassov:
>>> The 'dev' name causes some confusion with 'struct device' [1][2], so =
use
>>> 'drm' instead since this seems to be the prevalent name for 'struct
>>> drm_device' members.
>>>
>>> [1] https://patchwork.freedesktop.org/patch/342472/?series=3D70039&re=
v=3D1
>>> [2] https://patchwork.freedesktop.org/patch/343643/?series=3D70432&re=
v=3D1
>>
>> I read through the provided links, but can't see why is it called 'drm=
'.
>> That sounds like a reference to a DRM driver structure to me.
>=20
> There are about 550 hits on 'struct drm_device *drm', so I gathered tha=
t
> it's the most common alternative to just naming it 'dev' (at about 4.5k=

> hits in the codebase). There's also 'ddev', 'drm_dev', 'drmdev' with
> few hits.
>=20
>>
>> What about attached_dev or consumer_dev or encoder_dev?
>=20
> Those would be more descriptive, if you think it's worth sidestepping
> the above convention a bit. I don't mind either way.

Well, I don't have a say on these things, but it's worth considering a
more descriptive name IMHO.

I also wonder why that field is there in the first place. Invoking
drm_bridge_attach() sets the encoder and its dev field for the bridge.
[1] Could the dev field be removed and all users refer to encoder->dev
instead? If so, it seems like the better way to go.

Best regards
Thomas

[1]
https://elixir.bootlin.com/linux/v5.4.2/source/drivers/gpu/drm/drm_bridge=
=2Ec#L128

>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
>>> ---
>>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c         |  2 +-
>>>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c   |  2 +-
>>>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c   |  2 +-
>>>  drivers/gpu/drm/bridge/cdns-dsi.c                    |  2 +-
>>>  drivers/gpu/drm/bridge/dumb-vga-dac.c                |  2 +-
>>>  .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  2 +-
>>>  drivers/gpu/drm/bridge/nxp-ptn3460.c                 |  2 +-
>>>  drivers/gpu/drm/bridge/panel.c                       |  2 +-
>>>  drivers/gpu/drm/bridge/parade-ps8622.c               |  2 +-
>>>  drivers/gpu/drm/bridge/sii902x.c                     |  6 +++---
>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c            |  6 +++---
>>>  drivers/gpu/drm/bridge/tc358764.c                    |  4 ++--
>>>  drivers/gpu/drm/bridge/tc358767.c                    |  6 +++---
>>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                |  2 +-
>>>  drivers/gpu/drm/bridge/ti-tfp410.c                   |  6 +++---
>>>  drivers/gpu/drm/drm_bridge.c                         | 12 ++++++----=
--
>>>  drivers/gpu/drm/i2c/tda998x_drv.c                    |  2 +-
>>>  drivers/gpu/drm/mcde/mcde_dsi.c                      |  2 +-
>>>  drivers/gpu/drm/msm/edp/edp_bridge.c                 |  2 +-
>>>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c               |  4 ++--
>>>  drivers/gpu/drm/rcar-du/rcar_lvds.c                  |  2 +-
>>>  include/drm/drm_bridge.h                             |  4 ++--
>>>  22 files changed, 38 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/g=
pu/drm/bridge/adv7511/adv7511_drv.c
>>> index 9e13e466e72c..db7d01cb0923 100644
>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>> @@ -863,7 +863,7 @@ static int adv7511_bridge_attach(struct drm_bridg=
e *bridge)
>>>  		adv->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT |
>>>  				DRM_CONNECTOR_POLL_DISCONNECT;
>>> =20
>>> -	ret =3D drm_connector_init(bridge->dev, &adv->connector,
>>> +	ret =3D drm_connector_init(bridge->drm, &adv->connector,
>>>  				 &adv7511_connector_funcs,
>>>  				 DRM_MODE_CONNECTOR_HDMIA);
>>>  	if (ret) {
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/dri=
vers/gpu/drm/bridge/analogix/analogix-anx6345.c
>>> index b4f3a923a52a..0e3508aeaa6c 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
>>> @@ -541,7 +541,7 @@ static int anx6345_bridge_attach(struct drm_bridg=
e *bridge)
>>>  		return err;
>>>  	}
>>> =20
>>> -	err =3D drm_connector_init(bridge->dev, &anx6345->connector,
>>> +	err =3D drm_connector_init(bridge->drm, &anx6345->connector,
>>>  				 &anx6345_connector_funcs,
>>>  				 DRM_MODE_CONNECTOR_eDP);
>>>  	if (err) {
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/dri=
vers/gpu/drm/bridge/analogix/analogix-anx78xx.c
>>> index 41867be03751..d5722bc28933 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
>>> @@ -908,7 +908,7 @@ static int anx78xx_bridge_attach(struct drm_bridg=
e *bridge)
>>>  		return err;
>>>  	}
>>> =20
>>> -	err =3D drm_connector_init(bridge->dev, &anx78xx->connector,
>>> +	err =3D drm_connector_init(bridge->drm, &anx78xx->connector,
>>>  				 &anx78xx_connector_funcs,
>>>  				 DRM_MODE_CONNECTOR_DisplayPort);
>>>  	if (err) {
>>> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/brid=
ge/cdns-dsi.c
>>> index 3a5bd4e7fd1e..f6d7e97de66e 100644
>>> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
>>> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
>>> @@ -651,7 +651,7 @@ static int cdns_dsi_bridge_attach(struct drm_brid=
ge *bridge)
>>>  	struct cdns_dsi *dsi =3D input_to_dsi(input);
>>>  	struct cdns_dsi_output *output =3D &dsi->output;
>>> =20
>>> -	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
>>> +	if (!drm_core_check_feature(bridge->drm, DRIVER_ATOMIC)) {
>>>  		dev_err(dsi->base.dev,
>>>  			"cdns-dsi driver is only compatible with DRM devices supporting a=
tomic updates");
>>>  		return -ENOTSUPP;
>>> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/=
bridge/dumb-vga-dac.c
>>> index cc33dc411b9e..30b5e54df381 100644
>>> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> @@ -112,7 +112,7 @@ static int dumb_vga_attach(struct drm_bridge *bri=
dge)
>>> =20
>>>  	drm_connector_helper_add(&vga->connector,
>>>  				 &dumb_vga_con_helper_funcs);
>>> -	ret =3D drm_connector_init_with_ddc(bridge->dev, &vga->connector,
>>> +	ret =3D drm_connector_init_with_ddc(bridge->drm, &vga->connector,
>>>  					  &dumb_vga_con_funcs,
>>>  					  DRM_MODE_CONNECTOR_VGA,
>>>  					  vga->ddc);
>>> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c=
 b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>>> index e8a49f6146c6..ab06394cfff7 100644
>>> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>>> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>>> @@ -223,7 +223,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridg=
e *bridge)
>>>  	drm_connector_helper_add(connector,
>>>  				 &ge_b850v3_lvds_connector_helper_funcs);
>>> =20
>>> -	ret =3D drm_connector_init(bridge->dev, connector,
>>> +	ret =3D drm_connector_init(bridge->drm, connector,
>>>  				 &ge_b850v3_lvds_connector_funcs,
>>>  				 DRM_MODE_CONNECTOR_DisplayPort);
>>>  	if (ret) {
>>> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/b=
ridge/nxp-ptn3460.c
>>> index 57ff01339559..714cb954522a 100644
>>> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
>>> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
>>> @@ -247,7 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridg=
e *bridge)
>>>  	}
>>> =20
>>>  	ptn_bridge->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
>>> -	ret =3D drm_connector_init(bridge->dev, &ptn_bridge->connector,
>>> +	ret =3D drm_connector_init(bridge->drm, &ptn_bridge->connector,
>>>  			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
>>>  	if (ret) {
>>>  		DRM_ERROR("Failed to initialize connector with drm\n");
>>> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/=
panel.c
>>> index f4e293e7cf64..7ed3b3e85f03 100644
>>> --- a/drivers/gpu/drm/bridge/panel.c
>>> +++ b/drivers/gpu/drm/bridge/panel.c
>>> @@ -67,7 +67,7 @@ static int panel_bridge_attach(struct drm_bridge *b=
ridge)
>>>  	drm_connector_helper_add(connector,
>>>  				 &panel_bridge_connector_helper_funcs);
>>> =20
>>> -	ret =3D drm_connector_init(bridge->dev, connector,
>>> +	ret =3D drm_connector_init(bridge->drm, connector,
>>>  				 &panel_bridge_connector_funcs,
>>>  				 panel_bridge->connector_type);
>>>  	if (ret) {
>>> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm=
/bridge/parade-ps8622.c
>>> index b7a72dfdcac3..18cc693734b3 100644
>>> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
>>> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
>>> @@ -487,7 +487,7 @@ static int ps8622_attach(struct drm_bridge *bridg=
e)
>>>  	}
>>> =20
>>>  	ps8622->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
>>> -	ret =3D drm_connector_init(bridge->dev, &ps8622->connector,
>>> +	ret =3D drm_connector_init(bridge->drm, &ps8622->connector,
>>>  			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
>>>  	if (ret) {
>>>  		DRM_ERROR("Failed to initialize connector with drm\n");
>>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridg=
e/sii902x.c
>>> index b70e8c5cf2e1..3d8b3e1eb0aa 100644
>>> --- a/drivers/gpu/drm/bridge/sii902x.c
>>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>>> @@ -402,7 +402,7 @@ static void sii902x_bridge_mode_set(struct drm_br=
idge *bridge,
>>>  static int sii902x_bridge_attach(struct drm_bridge *bridge)
>>>  {
>>>  	struct sii902x *sii902x =3D bridge_to_sii902x(bridge);
>>> -	struct drm_device *drm =3D bridge->dev;
>>> +	struct drm_device *drm =3D bridge->drm;
>>>  	int ret;
>>> =20
>>>  	drm_connector_helper_add(&sii902x->connector,
>>> @@ -820,8 +820,8 @@ static irqreturn_t sii902x_interrupt(int irq, voi=
d *data)
>>> =20
>>>  	mutex_unlock(&sii902x->mutex);
>>> =20
>>> -	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
>>> -		drm_helper_hpd_irq_event(sii902x->bridge.dev);
>>> +	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.drm)
>>> +		drm_helper_hpd_irq_event(sii902x->bridge.drm);
>>> =20
>>>  	return IRQ_HANDLED;
>>>  }
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-hdmi.c
>>> index dbe38a54870b..7a549cce8536 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -2346,7 +2346,7 @@ static int dw_hdmi_bridge_attach(struct drm_bri=
dge *bridge)
>>> =20
>>>  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs=
);
>>> =20
>>> -	drm_connector_init_with_ddc(bridge->dev, connector,
>>> +	drm_connector_init_with_ddc(bridge->drm, connector,
>>>  				    &dw_hdmi_connector_funcs,
>>>  				    DRM_MODE_CONNECTOR_HDMIA,
>>>  				    hdmi->ddc);
>>> @@ -2554,8 +2554,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *d=
ev_id)
>>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>>>  		dev_dbg(hdmi->dev, "EVENT=3D%s\n",
>>>  			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
>>> -		if (hdmi->bridge.dev)
>>> -			drm_helper_hpd_irq_event(hdmi->bridge.dev);
>>> +		if (hdmi->bridge.drm)
>>> +			drm_helper_hpd_irq_event(hdmi->bridge.drm);
>>>  	}
>>> =20
>>>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
>>> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/brid=
ge/tc358764.c
>>> index db298f550a5a..1744d7daa534 100644
>>> --- a/drivers/gpu/drm/bridge/tc358764.c
>>> +++ b/drivers/gpu/drm/bridge/tc358764.c
>>> @@ -352,7 +352,7 @@ static void tc358764_enable(struct drm_bridge *br=
idge)
>>>  static int tc358764_attach(struct drm_bridge *bridge)
>>>  {
>>>  	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
>>> -	struct drm_device *drm =3D bridge->dev;
>>> +	struct drm_device *drm =3D bridge->drm;
>>>  	int ret;
>>> =20
>>>  	ctx->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
>>> @@ -378,7 +378,7 @@ static int tc358764_attach(struct drm_bridge *bri=
dge)
>>>  static void tc358764_detach(struct drm_bridge *bridge)
>>>  {
>>>  	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
>>> -	struct drm_device *drm =3D bridge->dev;
>>> +	struct drm_device *drm =3D bridge->drm;
>>> =20
>>>  	drm_connector_unregister(&ctx->connector);
>>>  	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector)=
;
>>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/brid=
ge/tc358767.c
>>> index 8029478ffebb..fccacd12bb53 100644
>>> --- a/drivers/gpu/drm/bridge/tc358767.c
>>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>>> @@ -1407,7 +1407,7 @@ static int tc_bridge_attach(struct drm_bridge *=
bridge)
>>>  {
>>>  	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
>>>  	struct tc_data *tc =3D bridge_to_tc(bridge);
>>> -	struct drm_device *drm =3D bridge->dev;
>>> +	struct drm_device *drm =3D bridge->drm;
>>>  	int ret;
>>> =20
>>>  	/* Create DP/eDP connector */
>>> @@ -1514,7 +1514,7 @@ static irqreturn_t tc_irq_handler(int irq, void=
 *arg)
>>>  		dev_err(tc->dev, "syserr %x\n", stat);
>>>  	}
>>> =20
>>> -	if (tc->hpd_pin >=3D 0 && tc->bridge.dev) {
>>> +	if (tc->hpd_pin >=3D 0 && tc->bridge.drm) {
>>>  		/*
>>>  		 * H is triggered when the GPIO goes high.
>>>  		 *
>>> @@ -1528,7 +1528,7 @@ static irqreturn_t tc_irq_handler(int irq, void=
 *arg)
>>>  			h ? "H" : "", lc ? "LC" : "");
>>> =20
>>>  		if (h || lc)
>>> -			drm_kms_helper_hotplug_event(tc->bridge.dev);
>>> +			drm_kms_helper_hotplug_event(tc->bridge.drm);
>>>  	}
>>> =20
>>>  	regmap_write(tc->regmap, INTSTS_G, val);
>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/=
bridge/ti-sn65dsi86.c
>>> index 43abf01ebd4c..23576c3fac9f 100644
>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> @@ -275,7 +275,7 @@ static int ti_sn_bridge_attach(struct drm_bridge =
*bridge)
>>>  						   .node =3D NULL,
>>>  						 };
>>> =20
>>> -	ret =3D drm_connector_init(bridge->dev, &pdata->connector,
>>> +	ret =3D drm_connector_init(bridge->drm, &pdata->connector,
>>>  				 &ti_sn_bridge_connector_funcs,
>>>  				 DRM_MODE_CONNECTOR_eDP);
>>>  	if (ret) {
>>> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bri=
dge/ti-tfp410.c
>>> index aa3198dc9903..cae9fd584ff1 100644
>>> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
>>> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
>>> @@ -135,7 +135,7 @@ static int tfp410_attach(struct drm_bridge *bridg=
e)
>>> =20
>>>  	drm_connector_helper_add(&dvi->connector,
>>>  				 &tfp410_con_helper_funcs);
>>> -	ret =3D drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
>>> +	ret =3D drm_connector_init_with_ddc(bridge->drm, &dvi->connector,
>>>  					  &tfp410_con_funcs,
>>>  					  dvi->connector_type,
>>>  					  dvi->ddc);
>>> @@ -179,8 +179,8 @@ static void tfp410_hpd_work_func(struct work_stru=
ct *work)
>>> =20
>>>  	dvi =3D container_of(work, struct tfp410, hpd_work.work);
>>> =20
>>> -	if (dvi->bridge.dev)
>>> -		drm_helper_hpd_irq_event(dvi->bridge.dev);
>>> +	if (dvi->bridge.drm)
>>> +		drm_helper_hpd_irq_event(dvi->bridge.drm);
>>>  }
>>> =20
>>>  static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridg=
e.c
>>> index cba537c99e43..80f7a1aa969e 100644
>>> --- a/drivers/gpu/drm/drm_bridge.c
>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>> @@ -119,19 +119,19 @@ int drm_bridge_attach(struct drm_encoder *encod=
er, struct drm_bridge *bridge,
>>>  	if (!encoder || !bridge)
>>>  		return -EINVAL;
>>> =20
>>> -	if (previous && (!previous->dev || previous->encoder !=3D encoder))=

>>> +	if (previous && (!previous->drm || previous->encoder !=3D encoder))=

>>>  		return -EINVAL;
>>> =20
>>> -	if (bridge->dev)
>>> +	if (bridge->drm)
>>>  		return -EBUSY;
>>> =20
>>> -	bridge->dev =3D encoder->dev;
>>> +	bridge->drm =3D encoder->dev;
>>>  	bridge->encoder =3D encoder;
>>> =20
>>>  	if (bridge->funcs->attach) {
>>>  		ret =3D bridge->funcs->attach(bridge);
>>>  		if (ret < 0) {
>>> -			bridge->dev =3D NULL;
>>> +			bridge->drm =3D NULL;
>>>  			bridge->encoder =3D NULL;
>>>  			return ret;
>>>  		}
>>> @@ -151,13 +151,13 @@ void drm_bridge_detach(struct drm_bridge *bridg=
e)
>>>  	if (WARN_ON(!bridge))
>>>  		return;
>>> =20
>>> -	if (WARN_ON(!bridge->dev))
>>> +	if (WARN_ON(!bridge->drm))
>>>  		return;
>>> =20
>>>  	if (bridge->funcs->detach)
>>>  		bridge->funcs->detach(bridge);
>>> =20
>>> -	bridge->dev =3D NULL;
>>> +	bridge->drm =3D NULL;
>>>  }
>>> =20
>>>  /**
>>> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/=
tda998x_drv.c
>>> index a63790d32d75..fa430e43f5ad 100644
>>> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
>>> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
>>> @@ -1360,7 +1360,7 @@ static int tda998x_bridge_attach(struct drm_bri=
dge *bridge)
>>>  {
>>>  	struct tda998x_priv *priv =3D bridge_to_tda998x_priv(bridge);
>>> =20
>>> -	return tda998x_connector_init(priv, bridge->dev);
>>> +	return tda998x_connector_init(priv, bridge->drm);
>>>  }
>>> =20
>>>  static void tda998x_bridge_detach(struct drm_bridge *bridge)
>>> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/m=
cde_dsi.c
>>> index 42fff811653e..4ef14d5cdcb6 100644
>>> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
>>> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
>>> @@ -846,7 +846,7 @@ static void mcde_dsi_bridge_disable(struct drm_br=
idge *bridge)
>>>  static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
>>>  {
>>>  	struct mcde_dsi *d =3D bridge_to_mcde_dsi(bridge);
>>> -	struct drm_device *drm =3D bridge->dev;
>>> +	struct drm_device *drm =3D bridge->drm;
>>>  	int ret;
>>> =20
>>>  	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
>>> diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/m=
sm/edp/edp_bridge.c
>>> index 2950bba4aca9..a329c7a79d8d 100644
>>> --- a/drivers/gpu/drm/msm/edp/edp_bridge.c
>>> +++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
>>> @@ -47,7 +47,7 @@ static void edp_bridge_mode_set(struct drm_bridge *=
bridge,
>>>  		const struct drm_display_mode *mode,
>>>  		const struct drm_display_mode *adjusted_mode)
>>>  {
>>> -	struct drm_device *dev =3D bridge->dev;
>>> +	struct drm_device *dev =3D bridge->drm;
>>>  	struct drm_connector *connector;
>>>  	struct edp_bridge *edp_bridge =3D to_edp_bridge(bridge);
>>>  	struct msm_edp *edp =3D edp_bridge->edp;
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm=
/msm/hdmi/hdmi_bridge.c
>>> index ba81338a9bf8..0add3c88a13e 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>>> @@ -20,7 +20,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bri=
dge)
>>> =20
>>>  static void msm_hdmi_power_on(struct drm_bridge *bridge)
>>>  {
>>> -	struct drm_device *dev =3D bridge->dev;
>>> +	struct drm_device *dev =3D bridge->drm;
>>>  	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
>>>  	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
>>>  	const struct hdmi_platform_config *config =3D hdmi->config;
>>> @@ -56,7 +56,7 @@ static void msm_hdmi_power_on(struct drm_bridge *br=
idge)
>>> =20
>>>  static void power_off(struct drm_bridge *bridge)
>>>  {
>>> -	struct drm_device *dev =3D bridge->dev;
>>> +	struct drm_device *dev =3D bridge->drm;
>>>  	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
>>>  	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
>>>  	const struct hdmi_platform_config *config =3D hdmi->config;
>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rc=
ar-du/rcar_lvds.c
>>> index 8c6c172bbf2e..12fcfbf31968 100644
>>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> @@ -622,7 +622,7 @@ static int rcar_lvds_attach(struct drm_bridge *br=
idge)
>>>  	if (!lvds->panel)
>>>  		return 0;
>>> =20
>>> -	ret =3D drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_=
funcs,
>>> +	ret =3D drm_connector_init(bridge->drm, connector, &rcar_lvds_conn_=
funcs,
>>>  				 DRM_MODE_CONNECTOR_LVDS);
>>>  	if (ret < 0)
>>>  		return ret;
>>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>>> index c0a2286a81e9..795860200ebf 100644
>>> --- a/include/drm/drm_bridge.h
>>> +++ b/include/drm/drm_bridge.h
>>> @@ -376,8 +376,8 @@ struct drm_bridge_timings {
>>>   * struct drm_bridge - central DRM bridge control structure
>>>   */
>>>  struct drm_bridge {
>>> -	/** @dev: DRM device this bridge belongs to */
>>> -	struct drm_device *dev;
>>> +	/** @drm: DRM device this bridge belongs to */
>>> +	struct drm_device *drm;
>>>  	/** @encoder: encoder to which this bridge is connected */
>>>  	struct drm_encoder *encoder;
>>>  	/** @next: the next bridge in the encoder chain */
>>>
>>
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--MA2H7vYLQMiDcRnMQp0AspZcg5Koj0lqG--

--nYV7oBj0RViXUm2TpS8qZ7TWfv9oNbiMp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3qQo0ACgkQaA3BHVML
eiN+6ggAiNntyhQJuDSfztkDYKUIxOlwWvbsOaJHTdsnv8QiJx5q6vNO4lgOcy95
sfN/yYZR2/Ej+nbamSaOB15hvVevbKuq/thDlgS1rGi9/WJKXCSdavlm6lOfQYdS
TSJHLYftNv+NBOr0xEJG8Xg8rDWybieZ/fFMcuM4+0iXAZ7BNb25fhV/2VJlgvZx
fVrPTLlHow9Ema40KtRGqXAzrogJdp3u4FgXZuqLT6xFh2Th/93dh3VSChrvEyJQ
q27F38TtSRwyTJm+ZWwaZSyw7/82s5qF1aSrm/sBvLSepUOHo7yjD5zZlZDymQCN
Cb3HA36y3SMy8glwZt7OuxqmUyyNXA==
=K6OS
-----END PGP SIGNATURE-----

--nYV7oBj0RViXUm2TpS8qZ7TWfv9oNbiMp--

--===============0868573998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0868573998==--
