Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900642F86AD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 21:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9DB6E48E;
	Fri, 15 Jan 2021 20:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8240C6E48E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 20:29:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E61358B;
 Fri, 15 Jan 2021 21:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610742556;
 bh=8R5qOZgwIXX9QIBlCIV/R54viYQ+tS8st/8kK+PspT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXfe/Bd4sxDcopxrQyulKr6sWDtZgNWVEUmMmsnebMU4/0jVNn/8hLQVXHqwR4Iqy
 dmLamgDdsuehH2QKJU5DVGWdiVNzsC5Rqtv2JHOZ59k4V2CtY3G/tqo9iglvRf5/6q
 dndbBomFsfYf9WqlpJf3+ozL6ojiJBE1hiTgHRnI=
Date: Fri, 15 Jan 2021 22:28:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 02/10] drm: Rename plane atomic_check state names
Message-ID: <YAH7C0EOsisHhqvR@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-2-maxime@cerno.tech>
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
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
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
 Sandy Huang <hjc@rock-chips.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 linux-tegra@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, amd-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, Alison Wang <alison.wang@nxp.com>,
 spice-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-renesas-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jyri Sarha <jyri.sarha@iki.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:56:54PM +0100, Maxime Ripard wrote:
> Most drivers call the argument to the plane atomic_check hook simply
> state, which is going to conflict with the global atomic state in a
> later rework. Let's rename it to new_plane_state (or new_state depending
> on the convention used in the driver).
> 
> This was done using the coccinelle script below, and built tested:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
>  static const struct drm_plane_helper_funcs helpers = {
>  	.atomic_check = func,
>  };
> 
> @ has_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> expression e;
> symbol old_state;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
>  	...
>  	struct drm_plane_state *old_state = e;
>  	...
>  }
> 
> @ depends on has_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane,
> -	struct drm_plane_state *state
> +	struct drm_plane_state *new_state
>      )
>  {
>  	<+...
> -	state
> +	new_state
> 	...+>
>  }
> 
> @ has_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
>  	...
>  }
> 
> @ depends on has_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane,
> -	struct drm_plane_state *state
> +	struct drm_plane_state *new_plane_state
>      )
>  {
>  	<+...
> -	state
> +	new_plane_state
> 	...+>
>  }
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

>  drivers/gpu/drm/omapdrm/omap_plane.c          | 19 +++++----
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  7 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  7 ++--
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            | 10 +++--

For these, with the comment below addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  41 files changed, 402 insertions(+), 357 deletions(-)

[snip]

> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 51dc24acea73..78d0eb1fd69d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -99,18 +99,19 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
>  }
>  
>  static int omap_plane_atomic_check(struct drm_plane *plane,
> -				   struct drm_plane_state *state)
> +				   struct drm_plane_state *new_plane_state)
>  {
>  	struct drm_crtc_state *crtc_state;
>  
> -	if (!state->fb)
> +	if (!new_plane_state->fb)
>  		return 0;
>  
>  	/* crtc should only be NULL when disabling (i.e., !state->fb) */

s/state/new_plane_state/ here too ?

> -	if (WARN_ON(!state->crtc))
> +	if (WARN_ON(!new_plane_state->crtc))
>  		return 0;
>  
> -	crtc_state = drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> +	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
> +							new_plane_state->crtc);
>  	/* we should have a crtc state if the plane is attached to a crtc */
>  	if (WARN_ON(!crtc_state))
>  		return 0;
> @@ -118,17 +119,17 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>  	if (!crtc_state->enable)
>  		return 0;
>  
> -	if (state->crtc_x < 0 || state->crtc_y < 0)
> +	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
>  		return -EINVAL;
>  
> -	if (state->crtc_x + state->crtc_w > crtc_state->adjusted_mode.hdisplay)
> +	if (new_plane_state->crtc_x + new_plane_state->crtc_w > crtc_state->adjusted_mode.hdisplay)

I can't help thinking we're using too long variable names... :-(

>  		return -EINVAL;
>  
> -	if (state->crtc_y + state->crtc_h > crtc_state->adjusted_mode.vdisplay)
> +	if (new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->adjusted_mode.vdisplay)
>  		return -EINVAL;
>  
> -	if (state->rotation != DRM_MODE_ROTATE_0 &&
> -	    !omap_framebuffer_supports_rotation(state->fb))
> +	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
> +	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
>  		return -EINVAL;
>  
>  	return 0;

[...]

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
