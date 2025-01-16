Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88199A139EC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 13:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D739D10E0F6;
	Thu, 16 Jan 2025 12:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DLPD4Ick";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534EC10E0F6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 12:26:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69F14A4163B;
 Thu, 16 Jan 2025 12:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C86C4CEDD;
 Thu, 16 Jan 2025 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737030388;
 bh=X91orxokhmepb4LxZVJk6zfnJISlTwLAQL8tWTUFeNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DLPD4IckMAhoNpOTuvvDGrFE5LIZpYpg1YR1p50xlUPf8ayvIdfjaVppeIi6D/UTZ
 QvAYan4lXsCZ39qfdWZaLck5niLRjtGZ2BEeLdomXmdr4NkMdD8BzZVfyP0v9Q7c9M
 DByaFe/SdChPdnsMFToDRiHGr1nmrc5r0gucWAKBSeW7LEkKWPdO2/yrk7tJ/mPG0F
 AkdOlt8flgAieo3ucllxjemHkZQSMN58vAqnNqaZzUSlZePHMgcPzaLpkDbmh3xBYN
 6cDEQRF3HYwKlZkG1rGDp+mnwHu0mrc3kOtuE1tMTpSPPLSh+LXxuw8+Gv0gLxhcKy
 c8mNQsPbavPhg==
Date: Thu, 16 Jan 2025 13:26:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <20250116-brave-feathered-dormouse-8ea4cf@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fa4eowenzfyqst36"
Content-Disposition: inline
In-Reply-To: <20250116113236.39ba876a@booty>
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


--fa4eowenzfyqst36
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
MIME-Version: 1.0

Hi Luca,

On Thu, Jan 16, 2025 at 11:32:36AM +0100, Luca Ceresoli wrote:
> Hello Dmitry, Maxime, All,
>=20
> On Fri, 10 Jan 2025 11:58:19 +0100
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>=20
> > Hi Dmitry,
> >=20
> > On Thu, 2 Jan 2025 13:01:49 +0100
> > Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> >=20
> > > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/=
drm/bridge/samsung-dsim.c
> > > > > index f8b4fb8357659018ec0db65374ee5d05330639ae..c4d1563fd32019efd=
e523dfc0863be044c05a826 100644
> > > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > @@ -1705,6 +1705,7 @@ static int samsung_dsim_host_attach(struct =
mipi_dsi_host *host,
> > > > >  	struct device *dev =3D dsi->dev;
> > > > >  	struct device_node *np =3D dev->of_node;
> > > > >  	struct device_node *remote;
> > > > > +	struct drm_bridge *out_bridge;
> > > > >  	struct drm_panel *panel;
> > > > >  	int ret;
> > > > > =20
> > > > > @@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struc=
t mipi_dsi_host *host,
> > > > > =20
> > > > >  	panel =3D of_drm_find_panel(remote);
> > > > >  	if (!IS_ERR(panel)) {
> > > > > -		dsi->out_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> > > > > +		out_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> > > > >  	} else {
> > > > > -		dsi->out_bridge =3D of_drm_find_bridge(remote);
> > > > > -		if (!dsi->out_bridge)
> > > > > -			dsi->out_bridge =3D ERR_PTR(-EINVAL);
> > > > > +		out_bridge =3D of_drm_find_bridge(remote);
> > > > > +		if (!out_bridge)
> > > > > +			out_bridge =3D ERR_PTR(-EINVAL);
> > > > >  	}     =20
> > > >=20
> > > > While looking at this patch, I think we should migrate the driver to
> > > > drm_of_find_panel_or_bridge().   =20
> > >=20
> > > Indeed, the code here is duplicating drm_of_find_panel_or_bridge(). I=
'm
> > > going to convert it. =20
>=20
> I've been struggling to find a good way to handle the panel bridge
> lifetime, and still haven't found a way that looks totally good.
> Here's my analysis and some possible ways forward.
>=20
> For "normal" bridges there is a device driver that probes, allocates a
> struct drm_bridge and registers it via drm_bridge_add() and at that
> point the bridge can be found by other drivers, such as the previous
> bridge or the encoder. Those "other drivers" will obtain a pointer to
> the struct drm_bridge and with refcounting they need to
> drm_bridge_put() it.
>=20
> So there are two clearly separate roles: the provider (bridge driver)
> and the consumers (which gets/puts a pointer). So far so good.

Yeah, we agree so far :)

> And there are panels, which probe similarly as far as I can see.

Indeed.

> And then there is the panel bridge. My understanding (which I'd love to
> get clarified in case it is not accurate) is that DRM bridges expect to
> always interact with "the next bridge", which cannot work for the last
> bridge of course, and so the panel bridge wraps the panel pretending it
> is a bridge.
>=20
> This software structure is clearly not accurately modeling the
> hardware (panel is not bridge),

We don't have a proper definition of what a bridge is, so as far as I'm
concerned, everything is a bridge :)

The name came from "external signal converters", but the API got reused
to support so many hardware components it's not meaningful anymore.

> but it has been serving us so far. However now I'm definitely hitting
> some troubles due to how the panel bridge is created.
>=20
> First: when the panel probes, no panel bridge is created. So other
> bridges cannot find it as they would find other bridges, using
> of_drm_find_bridge().
>=20
> Second: to circumvent this, we have {drmm,devm_drm}_of_get_bridge()
> which do (not counting error cases):
>=20
>  1. call drm_of_find_panel_or_bridge() which returns:
>     - a panel pointer, if found
>     - otherwise a bridge pointer, if one already exists
>  2. if a panel was found, it is assumed that no bridge exists yet (*)
>     so one is created:
>     2.1) call {drmm,devm_drm}_panel_bridge_add: a new panel bridge is
>          allocated and its pointer returned
>  3. the bridge obtained at 1 or 2 is returned
>=20
> So, the pointer returned by {drmm,devm_drm}_of_get_bridge() can be a)
> pre-existing or b) a panel bridge allocated automagically if there is a
> panel. However the caller has no way to know whether a) or b) happened.
> Yet a) and b) have different implications for the panel bridge lifetime
> management and require that the returned pointer is disposed of in a
> different way.
>=20
> The fundamental design choice that is problematic with respect to
> hotplugging is that the panel bridge (which is a struct drm_bridge
> after all) is not created by the provider (the panel driver) but on the
> fly by the first consumer that happens to need it. And the consumer is
> not aware of this: it obtains a struct drm_bridge pointer and doesn't
> know whether it was a) pre-existing or b) created on the fly.

I'm not entirely sure why it matters? The only thing the consumer should
care about is that the bridge pointer it got is valid between the calls
to drmm_of_get_bridge() and drm_bridge_put(). As long as that statement
is true, why should we care about what or how that bridge was created?

> So far this approach has been working because devm and drmm ensure the
> panel bridge would be dealloacted at some point. However the devm and drmm
> release actions are associated to the consumer struct device (the panel
> bridge consumer), so if the panel bridge is removed and the consumer is
> not, deallocation won't happen.

Oh, right, if one doesn't call drm_bridge_put(), that will result in a
memory leak. The general topic we discuss and try to address here is
memory safety, and a memory leak is considered safe. It's also going to
get allocated only a couple of times anyway, so it's not a *huge*
concern.

And about how to actually fix it, there's two ways to go about it:

  * Either we do a coccinelle script and try to put all those
    drm_bridge_put() everywhere;

  * Or we create a devm/drmm action and drop the reference
    automatically.

The latter is obviously less intrusive, we would need to deprecate
devm_of_get_bridge() for it to be safe, and I'm not entirely sure it
would be enough, but it might just work.

> For hotplugging we cannot use drmm and devm and instead we use get/put,
> to let the "next bridge" disappear with the previous one still present.
> So the trivial idea is to add a drm_of_get_bridge(), similar to
> {drmm,devm_drm}_of_get_bridge() except it uses plain
> drm_panel_bridge_add() instead of devm/drmm variants. But then the
> caller (which is the panel consumer) will have to dispose of the struct
> drm_bridge pointer by calling:
>=20
>  - drm_bridge_put() in case a)
>  - drm_panel_bridge_remove in case b)
>=20
> And that's the problem I need to solve.

I'm not sure the problem is limited to panel_bridge. Your question is
essentially: how do I make sure a driver-specific init is properly freed
at drm_bridge_put time. This was done so far mostly at bridge remove
time, but we obviously can't do that anymore.

But we'd have the same issue if, say, we needed to remove a workqueue
=66rom a driver.

I think we need a destroy() hook for bridges, just like we have for
connectors for example that would deal with calling
drm_panel_bridge_remove() if necessary, or any other driver-specific
sequence.

> First and foremost, do you think my analysis is correct?
>
> (*) superficially this looks like another fundamental issue to me, but
>     it is not my focus at the moment
>
> Assuming it is, here are some possible ways to make the panel-bridge
> work with hotplug.
>=20
>  1. have drm_of_get_bridge() return an indication on how to dispose of
>     the returned pointer
>  2. add an ad-hoc remover function alongside drm_of_get_bridge()
>  3. let all panel drivers automatically add a panel-bridge
>  4. stop pretending there is always a "next bridge" after each bridge
>=20
> Idea 1:
>=20
> The new (non drmm/devm) drm_of_get_bridge() would return a flag to
> indicate whether case a) or b) happened. Or it could return a function
> pointer to be called to dispose of the returned pointer, to be
> stored and called by the consumer.
>=20
> I find this quite ugly and I'd call this a workaround rather than a
> solution, but I'm open to discussion.
>=20
> Idea 2:
>=20
> I'm proposing to add drm_of_get_bridge(), which as a non-drmm, non-devm
> variant to be used with refcounting. So the idea is to add alongside it
> a corresponding removal function [drm_of_put_bridge()?]:
>=20
>   drm_of_put_bridge(struct drm_bridge *bridge)
>   {
>       if (drm_bridge_is_panel(bridge))
>           drm_panel_bridge_remove(bridge);
>       drm_bridge_put(bridge);
>   }
>=20
> So the consumer would always have to call this function, which is as
> automagic as *drm_of_get_bridge().
>=20
> My concern is what would happen in case:
>=20
>  * driver A calls drm_of_get_bridge() and a panel_bridge is created
>  * driver B calls drm_of_get_bridge() on the same panel, the existing
>    panel_bridge is returned
>=20
> Both drivers would call drm_of_put_bridge -> drm_panel_bridge_remove,
> so removing twice. However I don't think this is possible due to how the
> *_drm_of_get_bridge() functions are currently implemented.
>=20
> Even more, I don't think it is realistic that two different drivers call
> *_drm_of_get_bridge() for the same panel. Is this assumption correct?
>=20
> Idea 3:=20
>=20
> The idea is that if the panel driver framework always creates a panel
> bridge, it will never need to be created on the fly automagically by
> its consumers, so the whole problem would disappear. It also would be
> better modeling the hardware: still wrapping a panel with a drm_bridge
> that does not exist in the hardware, but at least having it created by
> the provider driver and not by the consumer driver which happens to
> look for it.
>=20
> This looks like a promising and simple idea, so I tried a quick
> implementation:
>=20
>  void drm_panel_init(struct drm_panel *panel, struct device *dev,
>                     const struct drm_panel_funcs *funcs, int connector_ty=
pe)
>  {
> +       struct drm_bridge *bridge;
> +
>         INIT_LIST_HEAD(&panel->list);
>         INIT_LIST_HEAD(&panel->followers);
>         mutex_init(&panel->follower_lock);
>         panel->dev =3D dev;
>         panel->funcs =3D funcs;
>         panel->connector_type =3D connector_type;
> +
> +       bridge =3D devm_drm_panel_bridge_add(panel->dev, panel);
> +       WARN_ON(!bridge);
>  }
>
> This is somewhat working but it requires more work because:
>=20
>  * as it is, it creates a circular dependency between drm_panel and the
>    panel bridge, and modular builds will fail:
>=20
>      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
>=20
>  * The panel bridge implementation should be made private to the panel
>    driver only (possibly helping to solve the previous issue?)
>=20
>  * Many drivers currently call devm_drm_panel_bridge_add() directly,
>    they should probably call drm_of_get_bridge instead
>=20
>  * drm_of_find_panel_or_bridge() should disappear: other drivers would
>    just look for a bridge
>=20
> Opinions about this idea?
>=20
> Idea 4:
>=20
> 'stop pretending there is always a "next bridge" after each bridge'
> looks like a _very_ long term goal, but it would be interesting to
> discuss whether this is a correct idea.
>=20
> If you've been reading thus far, thanks for your patience! I'll be very
> glad to hear more opinions on all the above.

I don't think we need any of them. Adding a mechanism similar to
drm_connector_free() seems to be what you're looking for.

Maxime

--fa4eowenzfyqst36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4j67QAKCRAnX84Zoj2+
dncPAX9PyL9enEymC65hLvWJ6PN6Fkh4qoH9PNOXrfAHz8tYcRCjurtI3P/xO7rt
6fLmqDkBgP5YLyntqAXjiM0qmW9NvNdTHqmwm5PbmrTQZGhtR9rb1k296WMl6vjb
0HfLXePDbQ==
=EcGy
-----END PGP SIGNATURE-----

--fa4eowenzfyqst36--
