Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FAC2F86D1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 21:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6586E49F;
	Fri, 15 Jan 2021 20:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 618 seconds by postgrey-1.36 at gabe;
 Fri, 15 Jan 2021 20:39:37 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087396E48E;
 Fri, 15 Jan 2021 20:39:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 309F158B;
 Fri, 15 Jan 2021 21:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610743174;
 bh=0eTzkl0LE8TIXGf5t0PGWUacoy38z9y9u6sIiGp9UYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FXkkLjrDScPwYCBTtHe+DPRrgVJwFQs+YddTW3P3PdK3Wp3t1JdLeO03A/q4YqBb0
 yL0LkWkkkMrfDp4IQxFj67afKUSbF+PM1L5xg7dytXkZ+flIG2RQqODs4Y3ZibtTbs
 45RkI7efEFF4ERwTe7cGwnLt1+LYrGqe7X5DhFkE=
Date: Fri, 15 Jan 2021 22:39:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 04/10] drm/atomic: Pass the full state to planes
 atomic_check
Message-ID: <YAH9dTnznIugsSYE@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-4-maxime@cerno.tech>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Edmund Dea <edmund.j.dea@intel.com>, virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 linux-tegra@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 amd-gfx@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, spice-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Philippe Cornu <philippe.cornu@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Jyri Sarha <jyri.sarha@iki.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:56:56PM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
> 
> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
> 
> Let's start convert all the remaining helpers to provide a consistent

s/start convert/convert/ ?

> interface, starting with the planes atomic_check.
> 
> The conversion was done using the coccinelle script below plus some
> manual changes for vmwgfx, built tested on all the drivers.
> 
> @@
> identifier plane, plane_state;
> symbol state;
> @@
> 
>  struct drm_plane_helper_funcs {
>  	...
> 	int (*atomic_check)(struct drm_plane *plane,
> -			    struct drm_plane_state *plane_state);
> +			    struct drm_atomic_state *state);
> 	...
> }
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> static const struct drm_plane_helper_funcs helpers = {
> 	...,
>  	.atomic_check = func,
> 	...,
> };
> 
> @@
> struct drm_plane_helper_funcs *FUNCS;
> identifier f;
> identifier dev;
> identifier plane, plane_state, state;
> @@
> 
>  f(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	<+...
> -	FUNCS->atomic_check(plane, plane_state)
> +	FUNCS->atomic_check(plane, state)
>  	...+>
>  }
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane,
> -    struct drm_plane_state *state)
> +    struct drm_plane_state *new_plane_state)
>  {
> 	<...
> -	state
> +	new_plane_state
> 	...>
>  }
> 

Is this needed, or is it a leftover from 02/10 ?

> @ ignores_new_state @
> identifier plane_atomic_func.func;
> identifier plane, new_plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *new_plane_state)
>  {
> 	... when != new_plane_state
>  }
> 
> @ adds_new_state depends on plane_atomic_func && !ignores_new_state @
> identifier plane_atomic_func.func;
> identifier plane, new_plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *new_plane_state)
>  {
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>  	...
>  }
> 
> @ depends on plane_atomic_func @
> identifier plane_atomic_func.func;
> identifier plane, new_plane_state;
> @@
> 
>  func(struct drm_plane *plane,
> -     struct drm_plane_state *new_plane_state
> +     struct drm_atomic_state *state
>      )
>  { ... }
> 
> @ include depends on adds_new_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && adds_new_state @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/drm_atomic_helper.c               | 2 +-
>  drivers/gpu/drm/drm_simple_kms_helper.c           | 4 +++-
>  drivers/gpu/drm/omapdrm/omap_plane.c              | 4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c           | 4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c             | 5 ++++-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c                | 4 +++-

For these,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[snip]

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
