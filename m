Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445C118490
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B03F6E887;
	Tue, 10 Dec 2019 10:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596E66E887
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:12:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a15so19295014wrf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 02:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=uUp6A4dcMF4MnqmqNq7ikD49ABT9vyor4bzovf5Kpzo=;
 b=XOxlckcc6e/iQyWQQoWHlDXLjg0rXzGYsdfvF2+5Pa2MnE4VYD0ZCxPP7blVPaR3UI
 SdZr+GWa3ITeJtyfuhAgdnMpmWkRntEmf0kb/chcW9ZzEOkfQn0qO0M8NBGGTvmI1p5O
 CE3AwBd+OUqXANSxQGKebeXim7VVcQaLV85yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=uUp6A4dcMF4MnqmqNq7ikD49ABT9vyor4bzovf5Kpzo=;
 b=nL/SeIPhlXstAyLg5eox/duC8T/ol7+C+s6w/MOyak6rfTyVyUhGScRt9UTtpzhmIE
 TFgzeZ68h8oclK2teTFYMK6KNMgv6wRU2IOLQrXca0A+dJXF8jg+jm7rprVWKnGdZJGF
 3JRZ4hzIjpoy3wtiY0G3kYHY4A6uTs9SXw2bUg9YWXbsj8FkD2KwXxZkSjuHXWjbIYIb
 ObSKedjJ3p1gfFX6sI0FLboSRPkd9AykLct8edOUrwJG87D/9Ot1hfM19t9W4DnJGOB8
 Ac3iCw/dK/vOnhT/tXjUKyrEYl7Aj2Ogxzzl0R3YychShiQenhG39qMA0KbjFOhXIgqw
 LN3A==
X-Gm-Message-State: APjAAAUBTBH7TwPJPmKxeyCKl1TyGxWYIdowmrIm/Ou2qSPjsaqm4ouH
 +23Nb3c0kQ4tSWn+VyWDoFc8yA==
X-Google-Smtp-Source: APXvYqx4NEwblgnL6xz2aC0kX1UnAqngIUEEkD6lyH4eqAZE0Fxj1dv03nrL4C2q9Vul6Cv4eXXYXQ==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr2157083wrw.391.1575972773829; 
 Tue, 10 Dec 2019 02:12:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id n188sm2730642wme.14.2019.12.10.02.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 02:12:52 -0800 (PST)
Date: Tue, 10 Dec 2019 11:12:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Rename drm_bridge->dev to drm
Message-ID: <20191210101250.GQ624164@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 nd <nd@arm.com>
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
 <e73974c0-19ae-1592-ed37-26f386f37a2f@suse.de>
 <2561507.RTQXCEk2uY@e123338-lin>
 <55bdd2ef-1033-9ae4-f033-bf6c3984cc95@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55bdd2ef-1033-9ae4-f033-bf6c3984cc95@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, nd <nd@arm.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 06, 2019 at 12:59:04PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 06.12.19 um 12:25 schrieb Mihail Atanassov:
> > Hallo Thomas,
> > =

> > On Thursday, 5 December 2019 18:20:06 GMT Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 05.12.19 um 17:30 schrieb Mihail Atanassov:
> >>> The 'dev' name causes some confusion with 'struct device' [1][2], so =
use
> >>> 'drm' instead since this seems to be the prevalent name for 'struct
> >>> drm_device' members.
> >>>
> >>> [1] https://patchwork.freedesktop.org/patch/342472/?series=3D70039&re=
v=3D1
> >>> [2] https://patchwork.freedesktop.org/patch/343643/?series=3D70432&re=
v=3D1
> >>
> >> I read through the provided links, but can't see why is it called 'drm=
'.
> >> That sounds like a reference to a DRM driver structure to me.
> > =

> > There are about 550 hits on 'struct drm_device *drm', so I gathered that
> > it's the most common alternative to just naming it 'dev' (at about 4.5k
> > hits in the codebase). There's also 'ddev', 'drm_dev', 'drmdev' with
> > few hits.
> > =

> >>
> >> What about attached_dev or consumer_dev or encoder_dev?
> > =

> > Those would be more descriptive, if you think it's worth sidestepping
> > the above convention a bit. I don't mind either way.
> =

> Well, I don't have a say on these things, but it's worth considering a
> more descriptive name IMHO.
> =

> I also wonder why that field is there in the first place. Invoking
> drm_bridge_attach() sets the encoder and its dev field for the bridge.
> [1] Could the dev field be removed and all users refer to encoder->dev
> instead? If so, it seems like the better way to go.

That sounds like a pretty neat idea (if possible) ...
-Daniel

> =

> Best regards
> Thomas
> =

> [1]
> https://elixir.bootlin.com/linux/v5.4.2/source/drivers/gpu/drm/drm_bridge=
.c#L128
> =

> > =

> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> >>> ---
> >>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c         |  2 +-
> >>>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c   |  2 +-
> >>>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c   |  2 +-
> >>>  drivers/gpu/drm/bridge/cdns-dsi.c                    |  2 +-
> >>>  drivers/gpu/drm/bridge/dumb-vga-dac.c                |  2 +-
> >>>  .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  2 +-
> >>>  drivers/gpu/drm/bridge/nxp-ptn3460.c                 |  2 +-
> >>>  drivers/gpu/drm/bridge/panel.c                       |  2 +-
> >>>  drivers/gpu/drm/bridge/parade-ps8622.c               |  2 +-
> >>>  drivers/gpu/drm/bridge/sii902x.c                     |  6 +++---
> >>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c            |  6 +++---
> >>>  drivers/gpu/drm/bridge/tc358764.c                    |  4 ++--
> >>>  drivers/gpu/drm/bridge/tc358767.c                    |  6 +++---
> >>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                |  2 +-
> >>>  drivers/gpu/drm/bridge/ti-tfp410.c                   |  6 +++---
> >>>  drivers/gpu/drm/drm_bridge.c                         | 12 ++++++----=
--
> >>>  drivers/gpu/drm/i2c/tda998x_drv.c                    |  2 +-
> >>>  drivers/gpu/drm/mcde/mcde_dsi.c                      |  2 +-
> >>>  drivers/gpu/drm/msm/edp/edp_bridge.c                 |  2 +-
> >>>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c               |  4 ++--
> >>>  drivers/gpu/drm/rcar-du/rcar_lvds.c                  |  2 +-
> >>>  include/drm/drm_bridge.h                             |  4 ++--
> >>>  22 files changed, 38 insertions(+), 38 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/g=
pu/drm/bridge/adv7511/adv7511_drv.c
> >>> index 9e13e466e72c..db7d01cb0923 100644
> >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> @@ -863,7 +863,7 @@ static int adv7511_bridge_attach(struct drm_bridg=
e *bridge)
> >>>  		adv->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT |
> >>>  				DRM_CONNECTOR_POLL_DISCONNECT;
> >>>  =

> >>> -	ret =3D drm_connector_init(bridge->dev, &adv->connector,
> >>> +	ret =3D drm_connector_init(bridge->drm, &adv->connector,
> >>>  				 &adv7511_connector_funcs,
> >>>  				 DRM_MODE_CONNECTOR_HDMIA);
> >>>  	if (ret) {
> >>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/dri=
vers/gpu/drm/bridge/analogix/analogix-anx6345.c
> >>> index b4f3a923a52a..0e3508aeaa6c 100644
> >>> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> >>> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> >>> @@ -541,7 +541,7 @@ static int anx6345_bridge_attach(struct drm_bridg=
e *bridge)
> >>>  		return err;
> >>>  	}
> >>>  =

> >>> -	err =3D drm_connector_init(bridge->dev, &anx6345->connector,
> >>> +	err =3D drm_connector_init(bridge->drm, &anx6345->connector,
> >>>  				 &anx6345_connector_funcs,
> >>>  				 DRM_MODE_CONNECTOR_eDP);
> >>>  	if (err) {
> >>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/dri=
vers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> >>> index 41867be03751..d5722bc28933 100644
> >>> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> >>> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> >>> @@ -908,7 +908,7 @@ static int anx78xx_bridge_attach(struct drm_bridg=
e *bridge)
> >>>  		return err;
> >>>  	}
> >>>  =

> >>> -	err =3D drm_connector_init(bridge->dev, &anx78xx->connector,
> >>> +	err =3D drm_connector_init(bridge->drm, &anx78xx->connector,
> >>>  				 &anx78xx_connector_funcs,
> >>>  				 DRM_MODE_CONNECTOR_DisplayPort);
> >>>  	if (err) {
> >>> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/brid=
ge/cdns-dsi.c
> >>> index 3a5bd4e7fd1e..f6d7e97de66e 100644
> >>> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> >>> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> >>> @@ -651,7 +651,7 @@ static int cdns_dsi_bridge_attach(struct drm_brid=
ge *bridge)
> >>>  	struct cdns_dsi *dsi =3D input_to_dsi(input);
> >>>  	struct cdns_dsi_output *output =3D &dsi->output;
> >>>  =

> >>> -	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
> >>> +	if (!drm_core_check_feature(bridge->drm, DRIVER_ATOMIC)) {
> >>>  		dev_err(dsi->base.dev,
> >>>  			"cdns-dsi driver is only compatible with DRM devices supporting a=
tomic updates");
> >>>  		return -ENOTSUPP;
> >>> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/=
bridge/dumb-vga-dac.c
> >>> index cc33dc411b9e..30b5e54df381 100644
> >>> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> >>> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> >>> @@ -112,7 +112,7 @@ static int dumb_vga_attach(struct drm_bridge *bri=
dge)
> >>>  =

> >>>  	drm_connector_helper_add(&vga->connector,
> >>>  				 &dumb_vga_con_helper_funcs);
> >>> -	ret =3D drm_connector_init_with_ddc(bridge->dev, &vga->connector,
> >>> +	ret =3D drm_connector_init_with_ddc(bridge->drm, &vga->connector,
> >>>  					  &dumb_vga_con_funcs,
> >>>  					  DRM_MODE_CONNECTOR_VGA,
> >>>  					  vga->ddc);
> >>> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c=
 b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> >>> index e8a49f6146c6..ab06394cfff7 100644
> >>> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> >>> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> >>> @@ -223,7 +223,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridg=
e *bridge)
> >>>  	drm_connector_helper_add(connector,
> >>>  				 &ge_b850v3_lvds_connector_helper_funcs);
> >>>  =

> >>> -	ret =3D drm_connector_init(bridge->dev, connector,
> >>> +	ret =3D drm_connector_init(bridge->drm, connector,
> >>>  				 &ge_b850v3_lvds_connector_funcs,
> >>>  				 DRM_MODE_CONNECTOR_DisplayPort);
> >>>  	if (ret) {
> >>> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/b=
ridge/nxp-ptn3460.c
> >>> index 57ff01339559..714cb954522a 100644
> >>> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> >>> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> >>> @@ -247,7 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridg=
e *bridge)
> >>>  	}
> >>>  =

> >>>  	ptn_bridge->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> >>> -	ret =3D drm_connector_init(bridge->dev, &ptn_bridge->connector,
> >>> +	ret =3D drm_connector_init(bridge->drm, &ptn_bridge->connector,
> >>>  			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> >>>  	if (ret) {
> >>>  		DRM_ERROR("Failed to initialize connector with drm\n");
> >>> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/=
panel.c
> >>> index f4e293e7cf64..7ed3b3e85f03 100644
> >>> --- a/drivers/gpu/drm/bridge/panel.c
> >>> +++ b/drivers/gpu/drm/bridge/panel.c
> >>> @@ -67,7 +67,7 @@ static int panel_bridge_attach(struct drm_bridge *b=
ridge)
> >>>  	drm_connector_helper_add(connector,
> >>>  				 &panel_bridge_connector_helper_funcs);
> >>>  =

> >>> -	ret =3D drm_connector_init(bridge->dev, connector,
> >>> +	ret =3D drm_connector_init(bridge->drm, connector,
> >>>  				 &panel_bridge_connector_funcs,
> >>>  				 panel_bridge->connector_type);
> >>>  	if (ret) {
> >>> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm=
/bridge/parade-ps8622.c
> >>> index b7a72dfdcac3..18cc693734b3 100644
> >>> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> >>> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> >>> @@ -487,7 +487,7 @@ static int ps8622_attach(struct drm_bridge *bridg=
e)
> >>>  	}
> >>>  =

> >>>  	ps8622->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> >>> -	ret =3D drm_connector_init(bridge->dev, &ps8622->connector,
> >>> +	ret =3D drm_connector_init(bridge->drm, &ps8622->connector,
> >>>  			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> >>>  	if (ret) {
> >>>  		DRM_ERROR("Failed to initialize connector with drm\n");
> >>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridg=
e/sii902x.c
> >>> index b70e8c5cf2e1..3d8b3e1eb0aa 100644
> >>> --- a/drivers/gpu/drm/bridge/sii902x.c
> >>> +++ b/drivers/gpu/drm/bridge/sii902x.c
> >>> @@ -402,7 +402,7 @@ static void sii902x_bridge_mode_set(struct drm_br=
idge *bridge,
> >>>  static int sii902x_bridge_attach(struct drm_bridge *bridge)
> >>>  {
> >>>  	struct sii902x *sii902x =3D bridge_to_sii902x(bridge);
> >>> -	struct drm_device *drm =3D bridge->dev;
> >>> +	struct drm_device *drm =3D bridge->drm;
> >>>  	int ret;
> >>>  =

> >>>  	drm_connector_helper_add(&sii902x->connector,
> >>> @@ -820,8 +820,8 @@ static irqreturn_t sii902x_interrupt(int irq, voi=
d *data)
> >>>  =

> >>>  	mutex_unlock(&sii902x->mutex);
> >>>  =

> >>> -	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
> >>> -		drm_helper_hpd_irq_event(sii902x->bridge.dev);
> >>> +	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.drm)
> >>> +		drm_helper_hpd_irq_event(sii902x->bridge.drm);
> >>>  =

> >>>  	return IRQ_HANDLED;
> >>>  }
> >>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-hdmi.c
> >>> index dbe38a54870b..7a549cce8536 100644
> >>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >>> @@ -2346,7 +2346,7 @@ static int dw_hdmi_bridge_attach(struct drm_bri=
dge *bridge)
> >>>  =

> >>>  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs=
);
> >>>  =

> >>> -	drm_connector_init_with_ddc(bridge->dev, connector,
> >>> +	drm_connector_init_with_ddc(bridge->drm, connector,
> >>>  				    &dw_hdmi_connector_funcs,
> >>>  				    DRM_MODE_CONNECTOR_HDMIA,
> >>>  				    hdmi->ddc);
> >>> @@ -2554,8 +2554,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *d=
ev_id)
> >>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> >>>  		dev_dbg(hdmi->dev, "EVENT=3D%s\n",
> >>>  			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
> >>> -		if (hdmi->bridge.dev)
> >>> -			drm_helper_hpd_irq_event(hdmi->bridge.dev);
> >>> +		if (hdmi->bridge.drm)
> >>> +			drm_helper_hpd_irq_event(hdmi->bridge.drm);
> >>>  	}
> >>>  =

> >>>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> >>> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/brid=
ge/tc358764.c
> >>> index db298f550a5a..1744d7daa534 100644
> >>> --- a/drivers/gpu/drm/bridge/tc358764.c
> >>> +++ b/drivers/gpu/drm/bridge/tc358764.c
> >>> @@ -352,7 +352,7 @@ static void tc358764_enable(struct drm_bridge *br=
idge)
> >>>  static int tc358764_attach(struct drm_bridge *bridge)
> >>>  {
> >>>  	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
> >>> -	struct drm_device *drm =3D bridge->dev;
> >>> +	struct drm_device *drm =3D bridge->drm;
> >>>  	int ret;
> >>>  =

> >>>  	ctx->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> >>> @@ -378,7 +378,7 @@ static int tc358764_attach(struct drm_bridge *bri=
dge)
> >>>  static void tc358764_detach(struct drm_bridge *bridge)
> >>>  {
> >>>  	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
> >>> -	struct drm_device *drm =3D bridge->dev;
> >>> +	struct drm_device *drm =3D bridge->drm;
> >>>  =

> >>>  	drm_connector_unregister(&ctx->connector);
> >>>  	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector);
> >>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/brid=
ge/tc358767.c
> >>> index 8029478ffebb..fccacd12bb53 100644
> >>> --- a/drivers/gpu/drm/bridge/tc358767.c
> >>> +++ b/drivers/gpu/drm/bridge/tc358767.c
> >>> @@ -1407,7 +1407,7 @@ static int tc_bridge_attach(struct drm_bridge *=
bridge)
> >>>  {
> >>>  	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> >>>  	struct tc_data *tc =3D bridge_to_tc(bridge);
> >>> -	struct drm_device *drm =3D bridge->dev;
> >>> +	struct drm_device *drm =3D bridge->drm;
> >>>  	int ret;
> >>>  =

> >>>  	/* Create DP/eDP connector */
> >>> @@ -1514,7 +1514,7 @@ static irqreturn_t tc_irq_handler(int irq, void=
 *arg)
> >>>  		dev_err(tc->dev, "syserr %x\n", stat);
> >>>  	}
> >>>  =

> >>> -	if (tc->hpd_pin >=3D 0 && tc->bridge.dev) {
> >>> +	if (tc->hpd_pin >=3D 0 && tc->bridge.drm) {
> >>>  		/*
> >>>  		 * H is triggered when the GPIO goes high.
> >>>  		 *
> >>> @@ -1528,7 +1528,7 @@ static irqreturn_t tc_irq_handler(int irq, void=
 *arg)
> >>>  			h ? "H" : "", lc ? "LC" : "");
> >>>  =

> >>>  		if (h || lc)
> >>> -			drm_kms_helper_hotplug_event(tc->bridge.dev);
> >>> +			drm_kms_helper_hotplug_event(tc->bridge.drm);
> >>>  	}
> >>>  =

> >>>  	regmap_write(tc->regmap, INTSTS_G, val);
> >>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/=
bridge/ti-sn65dsi86.c
> >>> index 43abf01ebd4c..23576c3fac9f 100644
> >>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >>> @@ -275,7 +275,7 @@ static int ti_sn_bridge_attach(struct drm_bridge =
*bridge)
> >>>  						   .node =3D NULL,
> >>>  						 };
> >>>  =

> >>> -	ret =3D drm_connector_init(bridge->dev, &pdata->connector,
> >>> +	ret =3D drm_connector_init(bridge->drm, &pdata->connector,
> >>>  				 &ti_sn_bridge_connector_funcs,
> >>>  				 DRM_MODE_CONNECTOR_eDP);
> >>>  	if (ret) {
> >>> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bri=
dge/ti-tfp410.c
> >>> index aa3198dc9903..cae9fd584ff1 100644
> >>> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> >>> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> >>> @@ -135,7 +135,7 @@ static int tfp410_attach(struct drm_bridge *bridg=
e)
> >>>  =

> >>>  	drm_connector_helper_add(&dvi->connector,
> >>>  				 &tfp410_con_helper_funcs);
> >>> -	ret =3D drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
> >>> +	ret =3D drm_connector_init_with_ddc(bridge->drm, &dvi->connector,
> >>>  					  &tfp410_con_funcs,
> >>>  					  dvi->connector_type,
> >>>  					  dvi->ddc);
> >>> @@ -179,8 +179,8 @@ static void tfp410_hpd_work_func(struct work_stru=
ct *work)
> >>>  =

> >>>  	dvi =3D container_of(work, struct tfp410, hpd_work.work);
> >>>  =

> >>> -	if (dvi->bridge.dev)
> >>> -		drm_helper_hpd_irq_event(dvi->bridge.dev);
> >>> +	if (dvi->bridge.drm)
> >>> +		drm_helper_hpd_irq_event(dvi->bridge.drm);
> >>>  }
> >>>  =

> >>>  static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
> >>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridg=
e.c
> >>> index cba537c99e43..80f7a1aa969e 100644
> >>> --- a/drivers/gpu/drm/drm_bridge.c
> >>> +++ b/drivers/gpu/drm/drm_bridge.c
> >>> @@ -119,19 +119,19 @@ int drm_bridge_attach(struct drm_encoder *encod=
er, struct drm_bridge *bridge,
> >>>  	if (!encoder || !bridge)
> >>>  		return -EINVAL;
> >>>  =

> >>> -	if (previous && (!previous->dev || previous->encoder !=3D encoder))
> >>> +	if (previous && (!previous->drm || previous->encoder !=3D encoder))
> >>>  		return -EINVAL;
> >>>  =

> >>> -	if (bridge->dev)
> >>> +	if (bridge->drm)
> >>>  		return -EBUSY;
> >>>  =

> >>> -	bridge->dev =3D encoder->dev;
> >>> +	bridge->drm =3D encoder->dev;
> >>>  	bridge->encoder =3D encoder;
> >>>  =

> >>>  	if (bridge->funcs->attach) {
> >>>  		ret =3D bridge->funcs->attach(bridge);
> >>>  		if (ret < 0) {
> >>> -			bridge->dev =3D NULL;
> >>> +			bridge->drm =3D NULL;
> >>>  			bridge->encoder =3D NULL;
> >>>  			return ret;
> >>>  		}
> >>> @@ -151,13 +151,13 @@ void drm_bridge_detach(struct drm_bridge *bridg=
e)
> >>>  	if (WARN_ON(!bridge))
> >>>  		return;
> >>>  =

> >>> -	if (WARN_ON(!bridge->dev))
> >>> +	if (WARN_ON(!bridge->drm))
> >>>  		return;
> >>>  =

> >>>  	if (bridge->funcs->detach)
> >>>  		bridge->funcs->detach(bridge);
> >>>  =

> >>> -	bridge->dev =3D NULL;
> >>> +	bridge->drm =3D NULL;
> >>>  }
> >>>  =

> >>>  /**
> >>> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/=
tda998x_drv.c
> >>> index a63790d32d75..fa430e43f5ad 100644
> >>> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> >>> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> >>> @@ -1360,7 +1360,7 @@ static int tda998x_bridge_attach(struct drm_bri=
dge *bridge)
> >>>  {
> >>>  	struct tda998x_priv *priv =3D bridge_to_tda998x_priv(bridge);
> >>>  =

> >>> -	return tda998x_connector_init(priv, bridge->dev);
> >>> +	return tda998x_connector_init(priv, bridge->drm);
> >>>  }
> >>>  =

> >>>  static void tda998x_bridge_detach(struct drm_bridge *bridge)
> >>> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/m=
cde_dsi.c
> >>> index 42fff811653e..4ef14d5cdcb6 100644
> >>> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> >>> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> >>> @@ -846,7 +846,7 @@ static void mcde_dsi_bridge_disable(struct drm_br=
idge *bridge)
> >>>  static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
> >>>  {
> >>>  	struct mcde_dsi *d =3D bridge_to_mcde_dsi(bridge);
> >>> -	struct drm_device *drm =3D bridge->dev;
> >>> +	struct drm_device *drm =3D bridge->drm;
> >>>  	int ret;
> >>>  =

> >>>  	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
> >>> diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/m=
sm/edp/edp_bridge.c
> >>> index 2950bba4aca9..a329c7a79d8d 100644
> >>> --- a/drivers/gpu/drm/msm/edp/edp_bridge.c
> >>> +++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
> >>> @@ -47,7 +47,7 @@ static void edp_bridge_mode_set(struct drm_bridge *=
bridge,
> >>>  		const struct drm_display_mode *mode,
> >>>  		const struct drm_display_mode *adjusted_mode)
> >>>  {
> >>> -	struct drm_device *dev =3D bridge->dev;
> >>> +	struct drm_device *dev =3D bridge->drm;
> >>>  	struct drm_connector *connector;
> >>>  	struct edp_bridge *edp_bridge =3D to_edp_bridge(bridge);
> >>>  	struct msm_edp *edp =3D edp_bridge->edp;
> >>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm=
/msm/hdmi/hdmi_bridge.c
> >>> index ba81338a9bf8..0add3c88a13e 100644
> >>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> >>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> >>> @@ -20,7 +20,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bri=
dge)
> >>>  =

> >>>  static void msm_hdmi_power_on(struct drm_bridge *bridge)
> >>>  {
> >>> -	struct drm_device *dev =3D bridge->dev;
> >>> +	struct drm_device *dev =3D bridge->drm;
> >>>  	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
> >>>  	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
> >>>  	const struct hdmi_platform_config *config =3D hdmi->config;
> >>> @@ -56,7 +56,7 @@ static void msm_hdmi_power_on(struct drm_bridge *br=
idge)
> >>>  =

> >>>  static void power_off(struct drm_bridge *bridge)
> >>>  {
> >>> -	struct drm_device *dev =3D bridge->dev;
> >>> +	struct drm_device *dev =3D bridge->drm;
> >>>  	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
> >>>  	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
> >>>  	const struct hdmi_platform_config *config =3D hdmi->config;
> >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rc=
ar-du/rcar_lvds.c
> >>> index 8c6c172bbf2e..12fcfbf31968 100644
> >>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> >>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> >>> @@ -622,7 +622,7 @@ static int rcar_lvds_attach(struct drm_bridge *br=
idge)
> >>>  	if (!lvds->panel)
> >>>  		return 0;
> >>>  =

> >>> -	ret =3D drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_=
funcs,
> >>> +	ret =3D drm_connector_init(bridge->drm, connector, &rcar_lvds_conn_=
funcs,
> >>>  				 DRM_MODE_CONNECTOR_LVDS);
> >>>  	if (ret < 0)
> >>>  		return ret;
> >>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> >>> index c0a2286a81e9..795860200ebf 100644
> >>> --- a/include/drm/drm_bridge.h
> >>> +++ b/include/drm/drm_bridge.h
> >>> @@ -376,8 +376,8 @@ struct drm_bridge_timings {
> >>>   * struct drm_bridge - central DRM bridge control structure
> >>>   */
> >>>  struct drm_bridge {
> >>> -	/** @dev: DRM device this bridge belongs to */
> >>> -	struct drm_device *dev;
> >>> +	/** @drm: DRM device this bridge belongs to */
> >>> +	struct drm_device *drm;
> >>>  	/** @encoder: encoder to which this bridge is connected */
> >>>  	struct drm_encoder *encoder;
> >>>  	/** @next: the next bridge in the encoder chain */
> >>>
> >>
> >>
> > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
