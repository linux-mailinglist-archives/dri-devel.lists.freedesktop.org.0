Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3EB3002A0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 13:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADEB89F97;
	Fri, 22 Jan 2021 12:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8271389F07;
 Fri, 22 Jan 2021 12:15:20 +0000 (UTC)
IronPort-SDR: i0oqqhbJTUokpYJZ1yVsgm/RaC9AlYRyNhTi1Z54UM0ieHvbXhKy97G8q3q1Q1KQyFONw0fvLf
 C4i9VDNntZuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179518454"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="179518454"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 04:15:19 -0800
IronPort-SDR: vxhEFHoBM4hXws2Gfq3XVEXWbVHJjZt+mKNZqWwfpNFtZ+x/7C1X0hk8QBjs48BMnxsKHMbW17
 KXS9hV06ZNpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="467909062"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 22 Jan 2021 04:15:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Jan 2021 14:15:07 +0200
Date: Fri, 22 Jan 2021 14:15:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 08/11] drm: Rename plane->state variables in atomic
 update and disable
Message-ID: <YArBy2DKdCct5cYW@intel.com>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-8-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121163537.1466118-8-maxime@cerno.tech>
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
Cc: , Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
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

On Thu, Jan 21, 2021 at 05:35:33PM +0100, Maxime Ripard wrote:
> Some drivers are storing the plane->state pointer in atomic_update and
> atomic_disable in a variable simply called state, while the state passed
> as an argument is called old_state.
> =

> In order to ease subsequent reworks and to avoid confusing or
> inconsistent names, let's rename those variables to new_state.
> =

> This was done using the following coccinelle script, plus some manual
> changes for mtk and tegra.
> =

> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> =

> (
>  static const struct drm_plane_helper_funcs helpers =3D {
>  	...,
>  	.atomic_disable =3D func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers =3D {
>  	...,
>  	.atomic_update =3D func,
> 	...,
>  };
> )
> =

> @ moves_new_state_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> symbol state;
> @@
> =

>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
>  	...
> -	struct drm_plane_state *state =3D plane->state;
> +	struct drm_plane_state *new_state =3D plane->state;
> 	...
>  }
> =

> @ depends on moves_new_state_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> identifier old_state;
> symbol state;
> @@
> =

>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
>  	<...
> -	state
> +	new_state
> 	...>

Was going to say that this migh eat something else, but I guess
the dependency prevents that?

Another way to avoid that I suppose would be to declare 'state'
as
symbol moves_new_state_old_state.state;

That would probably make the intent a bit more obvious, even with
the dependency. Or does a dependency somehow automagically imply
that?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
