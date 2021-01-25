Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8FB30247C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 12:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2421889C9B;
	Mon, 25 Jan 2021 11:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3B289C9B;
 Mon, 25 Jan 2021 11:52:51 +0000 (UTC)
IronPort-SDR: 7UKOBn+32+mZxlffqn0PkSGEHWl+ahxlxBHCF4dYem4R7ZfQRr89ENA0pAeEHXL6q8yveVZCqO
 hReFdjPk1OZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="198488809"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="198488809"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 03:52:51 -0800
IronPort-SDR: 48DaYsnvHv+gYU3iB0lIM7aytVWrCoDavD2mjf0kyTM07tuyUD4vfRcB0epq/cCvtOYMGfxoLJ
 ZQzg2k7suibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="472167193"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 25 Jan 2021 03:52:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 Jan 2021 13:52:38 +0200
Date: Mon, 25 Jan 2021 13:52:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 08/11] drm: Rename plane->state variables in atomic
 update and disable
Message-ID: <YA6xBuECFjzjY7gG@intel.com>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-8-maxime@cerno.tech>
 <YArBy2DKdCct5cYW@intel.com>
 <20210125105218.kv63vjbxz5b35hdo@gilmour>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125105218.kv63vjbxz5b35hdo@gilmour>
X-Patchwork-Hint: comment
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-rockchip@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sandy Huang <hjc@rock-chips.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chen Feng <puck.chen@hisilicon.com>,
 Dave Airlie <airlied@redhat.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, linux-mediatek@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Philippe Cornu <philippe.cornu@st.com>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 11:52:18AM +0100, Maxime Ripard wrote:
> Hi Ville,
> =

> On Fri, Jan 22, 2021 at 02:15:07PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Thu, Jan 21, 2021 at 05:35:33PM +0100, Maxime Ripard wrote:
> > > Some drivers are storing the plane->state pointer in atomic_update and
> > > atomic_disable in a variable simply called state, while the state pas=
sed
> > > as an argument is called old_state.
> > > =

> > > In order to ease subsequent reworks and to avoid confusing or
> > > inconsistent names, let's rename those variables to new_state.
> > > =

> > > This was done using the following coccinelle script, plus some manual
> > > changes for mtk and tegra.
> > > =

> > > @ plane_atomic_func @
> > > identifier helpers;
> > > identifier func;
> > > @@
> > > =

> > > (
> > >  static const struct drm_plane_helper_funcs helpers =3D {
> > >  	...,
> > >  	.atomic_disable =3D func,
> > > 	...,
> > >  };
> > > |
> > >  static const struct drm_plane_helper_funcs helpers =3D {
> > >  	...,
> > >  	.atomic_update =3D func,
> > > 	...,
> > >  };
> > > )
> > > =

> > > @ moves_new_state_old_state @
> > > identifier plane_atomic_func.func;
> > > identifier plane;
> > > symbol old_state;
> > > symbol state;
> > > @@
> > > =

> > >  func(struct drm_plane *plane, struct drm_plane_state *old_state)
> > >  {
> > >  	...
> > > -	struct drm_plane_state *state =3D plane->state;
> > > +	struct drm_plane_state *new_state =3D plane->state;
> > > 	...
> > >  }
> > > =

> > > @ depends on moves_new_state_old_state @
> > > identifier plane_atomic_func.func;
> > > identifier plane;
> > > identifier old_state;
> > > symbol state;
> > > @@
> > > =

> > >  func(struct drm_plane *plane, struct drm_plane_state *old_state)
> > >  {
> > >  	<...
> > > -	state
> > > +	new_state
> > > 	...>
> > =

> > Was going to say that this migh eat something else, but I guess
> > the dependency prevents that?
> =

> Yeah, the dependency takes care of this
> =

> > Another way to avoid that I suppose would be to declare 'state'
> > as
> > symbol moves_new_state_old_state.state;
> > =

> > That would probably make the intent a bit more obvious, even with
> > the dependency. Or does a dependency somehow automagically imply
> > that?
> =

> I'm not sure if it does, but it's a symbol here not an identifier or an
> expression, so here moves_new_state_old_state.state would always resolve
> to state (and only state) anyway

Hm. Right. OK, cocci bits look good to me. Variable naming
bikeshed I'll leave to others :)

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
