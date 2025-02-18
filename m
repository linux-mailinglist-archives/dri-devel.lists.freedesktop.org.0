Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021BCA39889
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3687C10E663;
	Tue, 18 Feb 2025 10:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m13Jm2Ov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3557A10E666
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:17:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 182C6A41E6D;
 Tue, 18 Feb 2025 10:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E01C4CEE4;
 Tue, 18 Feb 2025 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739873863;
 bh=NLD8opqn3YtLQC0AnIIaIIsuFrJzaowTdytwyVGeif4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m13Jm2OvSnrjPlWwHqdK2nog9N7C/6Y+OHw9jJ/aM2EDUTgeusD6HiPtlU3lcfrlj
 ffwIZJYOD10g3wodvRUlb/fJ53xUE5yenPv5TKHTMGo5G1R6MHW184sb+xs6IwY9GX
 iygExOym+TUpWMEvqE8K/kbfjdo4I2GIhVnWdSxhDUvVfBDmLQtgzjUtmaO6T5/iSB
 /S0wIWXmk6sU9pkaPa+LSeTNMNtZBm8kQSJGGi6seIvSIxf/JrcehN/jl1iXG+xHgT
 64YDPejgo5mPAWGe/7Sh1YGAS+umsTtiQ2dedgr9Ga5Ve9IouzZDESIEDP/taorC8g
 MiRPy/K1igTKQ==
Date: Tue, 18 Feb 2025 11:17:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <20250218-faithful-white-magpie-da9ac9@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
 <20250210-amusing-bobcat-of-pluck-0d4c09@houat>
 <CAGXv+5GSF=YSiHTgty1J2suAvVYUtOgPShW2mmvuxYiFwK-yeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5h2a6fgfbfdj4ehp"
Content-Disposition: inline
In-Reply-To: <CAGXv+5GSF=YSiHTgty1J2suAvVYUtOgPShW2mmvuxYiFwK-yeg@mail.gmail.com>
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


--5h2a6fgfbfdj4ehp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 05:43:43PM +0800, Chen-Yu Tsai wrote:
> On Tue, Feb 11, 2025 at 2:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > > Adding a panel does currently not add a panel_bridge wrapping it. Usu=
ally
> > > the panel_bridge creation happens when some other driver (e.g. the pr=
evious
> > > bridge or the encoder) calls *_of_get_bridge() and the following elem=
ent in
> > > the pipeline is a panel.
> > >
> > > This has some drawbacks:
> > >
> > >  * the panel_bridge is not created in the context of the driver of the
> > >    underlying physical device (the panel driver), but of some other d=
river
> > >  * that "other driver" is not aware of whether the returned drm_bridge
> > >    pointer is a panel_bridge created on the fly, a pre-existing
> > >    panel_bridge or a non-panel bridge
> > >  * removal of a panel_bridge requires calling drm_panel_bridge_remove=
(),
> > >    but the "other driver" doesn't know whether this is needed because=
 it
> > >    doesn't know whether it has created a panel_bridge or not
> > >
> > > So far this approach has been working because devm and drmm ensure the
> > > panel bridge would be dealloacted at some later point. However with t=
he
> > > upcoming implementation of dynamic bridge lifetime this will get more
> > > complicated.
> > >
> > > Correct removal of a panel_bridge might possibly be obtained by addin=
g more
> > > devm/drmm technology to have it freed correctly at all times. However=
 this
> > > would add more complexity and not help making lifetime more understan=
dable.
> > >
> > > Use a different approach instead: always create a panel_bridge with a
> > > drm_panel, thus matching the lifetime of the drm_panel and the panel_=
bridge
> > > wrapping it. This makes lifetime much more straightforward to underst=
and
> > > and to further develop on.
> > >
> > > With the panel_bridge always created, the functions to get a bridge
> > > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler be=
cause
> > > the bridge they are looking for exists already (if it can exist at al=
l). In
> > > turn, this is implemented based on a variant of
> > > drm_of_find_panel_or_bridge() that only looks for panels:
> > > of_drm_find_bridge_by_endpoint(). In the future
> > > drm_of_find_panel_or_bridge() can be progressively removed because th=
ere
> > > will never be a panel not exposing a bridge.
> > >
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > >
> > > ---
> > >
> > > This patch was added in v6.
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 74 ++++++++++++++++++++++++++++++++=
+---------
> > >  include/drm/drm_panel.h        |  8 +++++
> > >  2 files changed, 66 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/=
panel.c
> > > index 58570ff6952ca313b3def084262c9bb3772272ef..6995de605e7317dd1eb15=
3afd475746ced764712 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -69,6 +69,9 @@ EXPORT_SYMBOL(drm_panel_init);
> > >   */
> > >  void drm_panel_add(struct drm_panel *panel)
> > >  {
> > > +     panel->bridge =3D drm_panel_bridge_add(panel);
> > > +     WARN_ON(!panel->bridge);
> > > +
> > >       mutex_lock(&panel_lock);
> > >       list_add_tail(&panel->list, &panel_list);
> > >       mutex_unlock(&panel_lock);
> > > @@ -86,6 +89,9 @@ void drm_panel_remove(struct drm_panel *panel)
> > >       mutex_lock(&panel_lock);
> > >       list_del_init(&panel->list);
> > >       mutex_unlock(&panel_lock);
> > > +
> > > +     drm_panel_bridge_remove(panel->bridge);
> > > +     panel->bridge =3D NULL;
> > >  }
> > >  EXPORT_SYMBOL(drm_panel_remove);
> >
> > Given that drm_panel_add and drm_panel_remove are typically called at
> > probe/remove, it's pretty much equivalent to using devm. Both of these
> > solutions aren't safe, and the drm_panel lifetime is still broken.
>=20
> FWIW I believe this solves the panel vs panel_bridge lifetime
> inconsistencies we previously reported [1]. Of course, as you rightly
> point out, any pointers to the bridge become stale if the panel gets
> removed.
>=20
> > I'd rather work on a solution that actually fixes those lifetime issues.
>=20
> I think that can happen once the bridges are ref-counted?

Not all panel users use a bridge, some are using the panel API directly.

> Instead of removing the bridge from the list, it can just clear the
> panel pointer and have all the callbacks skip any operations involving
> the panel.
>=20
> The other option is to have the panel itself be ref-counted. I don't
> think that's worth pursuing if the idea is to move everything over to
> panel_bridge and things are somewhat ready.

Yeah, maybe. I'm kind of skeptical it would be easier than just doing
the work we're doing here though. Most of the "easy" users have been
converted already, and only the problematic ones remain, which will be
difficult to move over. sun4i_rgb and sun6i_dsi, for example, won't be
trivial to switch to panel_bridge. And given that sun4i_rgb is mostly
obsolete, and sun6i_dsi unmaintainable, I don't think it's likely to
happen.

So I don't think it's fair to expect that work from such a series, or to
rely on it eventually being fixed.

I think a solution where we have a bridge in drm_panel is a better
solution (and easier to convert to), but that requires a new panel
allocation API too. We've started to work on it as well, so everything
might just click.

Maxime

--5h2a6fgfbfdj4ehp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7ReRAAKCRAnX84Zoj2+
dk60AYCcZBzfluhLprG5SA6HA5XjK+12gVtI9ZdvrJlY2TWQT3Lu0BAIdYcdKdV6
rF/QLKEBgP6HIH1uD51d7M6znAEXnWnTH+jB+R6tdXJc5Bajy8qkrNPoWEOQQnYg
1yfhz+rwPQ==
=c3vr
-----END PGP SIGNATURE-----

--5h2a6fgfbfdj4ehp--
