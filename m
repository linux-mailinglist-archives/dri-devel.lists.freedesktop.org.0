Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170FFCF41B2
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 15:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A5110E3F7;
	Mon,  5 Jan 2026 14:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RT/UiyYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B50910E3F7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 14:29:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BD74D1A2665;
 Mon,  5 Jan 2026 14:29:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8967F60726;
 Mon,  5 Jan 2026 14:29:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9BBD0103C847C; Mon,  5 Jan 2026 15:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767623388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=m5a1q4+8KZ4VroTl8szIeT6DJLUnWji0vwzjJmPKVOY=;
 b=RT/UiyYEF8zOufF/RMp090pHJ3IBWOd4IbiXaTokdETQKrMOwK8Q8S2nZIFEcm1q63CHmV
 D08ZN1O3K/1Gs2xV+uE0bMucI+rbX1RqVtgt4MGGMn1AKSPqPRLs70HaBBQngw0tzHvfu0
 HUCwqMdkoZAydUqDN8ELrpazP6u4KUikTiPLwzPa1erGGDWdFePyrme9KN5cFNkjFRSC//
 NLlAMhDAxUNe/HzKmbxJnsGtmrWZInP+yWvx2+ecE05TJs/pIWEzfNTB3CCWUIyRXq7lmb
 7IpkvtZ1mpV3oOH4G5j0pzoFUC7DGbNC4qX92galMenfSPV+eKwOd+p3R0prog==
Date: Mon, 5 Jan 2026 15:29:39 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260105152939.49642d0a@kmaincent-XPS-13-7390>
In-Reply-To: <DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
 <DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Luca,

Thank you for your full review on this series!

On Wed, 17 Dec 2025 15:23:26 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> > +config DRM_TILCDC_PANEL_LEGACY
> > +	bool "Support device tree blobs using TI LCDC Panel binding"
> > +	default n =20
>=20
> 'default' defaults to 'n', you can drop this line.
>=20
> However I think it should instead be enabled by default. You propose to
> entirely remove the tilcdc panel driver in the next patch, so any users
> without DRM_TILCDC_PANEL_LEGACY in their defconfig would be broken. For
> this reason, I propose to enable DRM_TILCDC_PANEL_LEGACY in all cases whe=
re
> the tilcdc_panel was compiled in, which I guess means:
>=20
>     default DRM_TILCDC
>=20
> Except I think if DRM_TILCDC=3Dm, DRM_TILCDC_PANEL_LEGACY should be =3Dy.=
 I
> don't know how to do that in Kconfig. But I'm not really sure about this
> last topic.

Just setting default to 'y' works for both cases TILCDC as a module or buil=
tin.=20

> > +	depends on DRM_TILCDC
> > +        depends on OF
> > +        depends on BACKLIGHT_CLASS_DEVICE
> > +        depends on PM
> > +	select OF_OVERLAY
> > +	select DRM_PANEL_SIMPLE
> > +	help
> > +	  Choose this option if you need a kernel that is compatible
> > +	  with device tree blobs using the obsolete "ti,tilcdc,panel"
> > +	  binding. If you find "ti,tilcdc,panel"-string from your DTB,
> > +	  you probably need this. Otherwise you do not. =20
>=20
> Maybe mention here what it does?
>=20
> For example, rewording your commit message:
>=20
>   Modifies the live device tree at early boot to convert the legacy
>   "ti,tilcdc,panel" devicetree node to the standard panel-dpi node.  This
>   allows to maintain backward compatibility for boards which were using t=
he
>   deprecated tilcdc_panel driver.

Ack, I will update it.

...

> > +static int __init tilcdc_panel_copy_props(struct device_node *old_pane=
l,
> > +					  struct device_node *new_panel)
> > +{
> > +	struct device_node *child, *old_timing, *new_timing, *panel_info;
> > +	u32 invert_pxl_clk =3D 0, sync_edge =3D 0;
> > +	struct property *prop;
> > +
> > +	/* Copy all panel properties to the new panel node */
> > +	for_each_property_of_node(old_panel, prop) {
> > +		if (!strncmp(prop->name, "compatible",
> > sizeof("compatible")))
> > +			continue;
> > +
> > +		tilcdc_panel_update_prop(new_panel, prop->name,
> > +					 prop->value, prop->length);
> > +	}
> > +
> > +	child =3D of_get_child_by_name(old_panel, "display-timings"); =20
>=20
> There's some housekeeping code in this function to ensure you put all the
> device_node refs. It would be simpler and less error prone to use a clean=
up
> action. E.g.:
>=20
> -	struct device_node *child, *old_timing, *new_timing, *panel_info;
>=20
> -	child =3D of_get_child_by_name(old_panel, "display-timings");
> +	struct device_node *child __free(device_node) =3D
> of_get_child_by_name(old_panel, "display-timings");

I am not used to this __free() macro and even some subsystem (net) are avoi=
ding
it but ok I will move to it. I don't know what are the pros and cons.

...

> > +	/* Copy all panel timing property to the new panel node */
> > +	for_each_property_of_node(old_timing, prop)
> > +		tilcdc_panel_update_prop(new_timing, prop->name,
> > +					 prop->value, prop->length);
> > +
> > +	panel_info =3D of_get_child_by_name(old_panel, "panel-info");
> > +	if (!panel_info)
> > +		return -EINVAL; =20
>=20
> tilcdc_panel_update_prop() has previously done various allocations which
> will not be freed if you return here. You shoudl probably do all the
> of_get_*() at the top, and if they all succeed start copying data along
> with with the needed allocations.

Ok.

...

> > +	ret =3D tilcdc_panel_copy_props(panel, new_panel);
> > +	if (ret)
> > +		goto overlay_remove;
> > +
> > +	/* Remove compatible property to avoid any driver compatible match
> > */
> > +	of_remove_property(panel, of_find_property(panel, "compatible",
> > +						   NULL));
> > +overlay_remove:
> > +	of_overlay_remove(&ovcs_id); =20
>=20
> Is it correct to remove the overlay here? Won't it remove what you have
> just added?

Indeed this should be only in the error path. That's weird that it was still
working during my tests.=20

>=20
> > +out:
> > +	of_node_put(new_panel);
> > +	of_node_put(panel);
> > +	of_node_put(lcdc); =20
>=20
> Here too you can use cleanup actions, even though the current code is
> slightly simpler than tilcdc_panel_copy_props as far as of_node_put() is
> concerned.

Ack.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
