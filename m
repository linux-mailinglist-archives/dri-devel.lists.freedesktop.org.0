Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0B12FE56F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8969E6E51D;
	Thu, 21 Jan 2021 08:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157C06E2DE;
 Wed, 20 Jan 2021 13:50:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 544A5580616;
 Wed, 20 Jan 2021 08:50:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 20 Jan 2021 08:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=sDxhL51Vhfp7bMJtc05jY3INv15
 IU8xKUsLjHr0xiOU=; b=e6RAvVNPXxx7n+xiZF1cUAYNfJs5LTR6PfLc0CImUdL
 LlXQ2amT0WEqGAlHTdvKd/rcGDF9tSdtsirQSEbuQ3kwVZPiCkw1rM45GLgnvgPm
 Z4AsvGXKTlP7JsOul0AAUpaxlPAIY0gsrLwL9MiYoYuMQ6L6TO3yzgXJyxnZRvp+
 jtbY428Tzk+iEi5DuF8gexjpBHwznO/my3ickth/O3fCvFWfKEcF6MqEAd4+26aI
 ltp/+9yq6CB5vfxYtjqmtlBszlAGV3LvzyYzkBIp/5m62bEJ7/gvtET2/W1vfPsg
 vY4oRDFmYVdvqYxQCwBv7aNKZ4xfO67HgJeBjDQpS+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sDxhL5
 1Vhfp7bMJtc05jY3INv15IU8xKUsLjHr0xiOU=; b=LikqJHGPtkrNylI5xzansd
 wjJ/KJ/R7Dq22hms9Md8biwwcNcdgUs/TtLHDiHdLWd/KIyZNBRPQyEEuZqOAVQH
 Zq59rIAwtrVdT/8xqrz21GDUEkDYGNlS2+2VlDDnQMqXZW2egzoG0Z70QoZsOgpH
 Cv+G0h3ZqaTJuyO4BYEoteVvzAOlKtK1B98G73tE5c5NwbRRkCgLWGFAWw/fAa69
 zKxmdFUnM/ToyfHDRec9Q6ytEXmtIFW+kY42SZebw6yv+4kH64ts8JA31fa6TubI
 bDGw4zZCK5hUm4lShfikDy9nGwJ5aG1okt63wGVtgRstD+gcvL8O6zoqeehmfcBA
 ==
X-ME-Sender: <xms:IzUIYJyjBDk2-Ewegnc7Hq9GTD5alDyksFm78hquneKLxSpMAnTx1Q>
 <xme:IzUIYJTtvdXHIq0wdouB0Fd3H_6WXJmFuESX5TuHXHnInWmwdGIT1NvWqzSGAlwXW
 1oyxaEoJrSKjHXk9Us>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejuddvhfekkefhtdegiefhledutdevtdfhkedtleefjefgleduhfetudevjeeh
 hfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IzUIYDV4IfnGFU_2lyw5XqL3TvmYbBA4AR__TrkA3iaokM7PmfRegg>
 <xmx:IzUIYLg4_zBtXiAWqlVE93JYhTgicZgHFCMWYuPvMc-sOMKhU-l4IA>
 <xmx:IzUIYLA6hD-5ZjG_K5igYUbzbL45QJq6qsO7iotuwoTsiB2nPVOYfQ>
 <xmx:JzUIYFrYN58bP-OKW0NJDZug9puVlgOcLOhe106KSpR_QIyNqvm3rQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4410A24005A;
 Wed, 20 Jan 2021 08:50:27 -0500 (EST)
Date: Wed, 20 Jan 2021 14:50:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 10/10] drm: Use state helper instead of the plane state
 pointer
Message-ID: <20210120135026.np2ivojt5vnvyota@gilmour>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-10-maxime@cerno.tech>
 <YAIHFTYiry6ebUsY@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <YAIHFTYiry6ebUsY@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michal Simek <michal.simek@xilinx.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Yannick Fertre <yannick.fertre@st.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Philippe Cornu <philippe.cornu@st.com>, Dave Airlie <airlied@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 virtualization@lists.linux-foundation.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, linux-renesas-soc@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Edmund Dea <edmund.j.dea@intel.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Melissa Wen <melissa.srw@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, freedreno@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, linux-stm32@st-md-mailman.stormreply.com,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 spice-devel@lists.freedesktop.org, Kevin Hilman <khilman@baylibre.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============1126441042=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1126441042==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j7svqftvzagigb3f"
Content-Disposition: inline


--j7svqftvzagigb3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Jan 15, 2021 at 11:20:21PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Fri, Jan 15, 2021 at 01:57:02PM +0100, Maxime Ripard wrote:
> > Many drivers reference the plane->state pointer in order to get the
> > current plane state in their atomic_update or atomic_disable hooks,
>=20
> Please don't use the word "current", it's ambiguous. Do you mean old
> state or new state ?

It's kind of the point I was trying to make: plane->state is the current
state of the plane, but it's definitely ambiguous and it's fairly easy
to be confused when working over several hooks.

> > which would be the new plane state in the global atomic state since
> > _swap_state happened when those hooks are run.
>=20
> Is this relevant ? drm_atomic_helper_swap_state() doesn't change the
> old_state and new_state pointers in drm_atomic_state as far as I can
> tell.

No, but it does change the plane->state pointer: before swap_state it's
the old state, after swap_state it's the new state

> > Use the drm_atomic_get_new_plane_state helper to get that state to make=
 it
> > more obvious.
> >=20
> > This was made using the coccinelle script below:
> >=20
> > @ plane_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > (
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >  	...,
> >  	.atomic_disable =3D func,
> > 	...,
> >  };
> > |
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >  	...,
> >  	.atomic_update =3D func,
> > 	...,
> >  };
> > )
> >=20
> > @ adds_new_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state;
> > identifier new_state;
> > @@
> >=20
> >  func(struct drm_plane *plane, struct drm_atomic_state *state)
> >  {
> >  	...
> > -	struct drm_plane_state *new_state =3D plane->state;
> > +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state, plane);
> > 	...
> >  }
> >=20
> > @ include depends on adds_new_state @
> > @@
> >=20
> >  #include <drm/drm_atomic.h>
> >=20
> > @ no_include depends on !include && adds_new_state @
> > @@
> >=20
> > + #include <drm/drm_atomic.h>
> >   #include <drm/...>
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
>=20
> [snip]
>=20
> >  drivers/gpu/drm/omapdrm/omap_plane.c            | 6 ++++--
> >  drivers/gpu/drm/rcar-du/rcar_du_plane.c         | 3 ++-
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 3 ++-
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c              | 3 ++-
>=20
> [snip]
>=20
> > diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/oma=
pdrm/omap_plane.c
> > index cd8cf7c786b5..021a94de84a1 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> > @@ -44,7 +44,8 @@ static void omap_plane_atomic_update(struct drm_plane=
 *plane,
> >  {
> >  	struct omap_drm_private *priv =3D plane->dev->dev_private;
> >  	struct omap_plane *omap_plane =3D to_omap_plane(plane);
> > -	struct drm_plane_state *new_state =3D plane->state;
>=20
> This seems to imply that you're interested in the new state.

Well, to be fair, the variable is only called "state" before this series
and it's one of the previous patch that renames it to new_state and
makes it a more obvious.

Otherwise, state =3D plane->state is fairly confusing and error-prone.
With that change you would make it really obvious

> > +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state,
> > +									   plane);
>=20
> Does this really make things more obvious ?

I guess you're better at remembering this than I am then :)

The discussion on whether it's more obvious or not aside, accessing the
->state pointer directly has some culprits, see:

https://dri.freedesktop.org/docs/drm/gpu/todo.html#plumb-drm-atomic-state-a=
ll-over

Maxime

--j7svqftvzagigb3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAg1IgAKCRDj7w1vZxhR
xW+rAQCaKXuyQvbRubp33hPCkdAY/LXaD+3TQwLv2j7AhTFUtAD/aLv/q1HqwcEO
ZfMJ4deD5+JElSu70qt5AOEI/9JMPAg=
=q+gU
-----END PGP SIGNATURE-----

--j7svqftvzagigb3f--

--===============1126441042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1126441042==--
