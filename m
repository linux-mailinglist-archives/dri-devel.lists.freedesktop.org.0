Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4162F7D03
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 14:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A37A6E409;
	Fri, 15 Jan 2021 13:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C96F6E409;
 Fri, 15 Jan 2021 13:46:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F426AD18;
 Fri, 15 Jan 2021 13:46:41 +0000 (UTC)
Subject: Re: [PATCH 02/10] drm: Rename plane atomic_check state names
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
Date: Fri, 15 Jan 2021 14:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, amd-gfx@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, nouveau@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Philippe Cornu <philippe.cornu@st.com>,
 Paul Cercueil <paul@crapouillou.net>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Yannick Fertre <yannick.fertre@st.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-mediatek@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Ben Skeggs <bskeggs@redhat.com>, freedreno@lists.freedesktop.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-tegra@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Leo Li <sunpeng.li@amd.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Roland Scheidegger <sroland@vmware.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Edmund Dea <edmund.j.dea@intel.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Melissa Wen <melissa.srw@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, virtualization@lists.linux-foundation.org,
 Jyri Sarha <jyri.sarha@iki.fi>, linux-stm32@st-md-mailman.stormreply.com,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 spice-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============1211213039=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1211213039==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lskaz8LNiVcoYs32HxGmgvvWi4Wmq6HeF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lskaz8LNiVcoYs32HxGmgvvWi4Wmq6HeF
Content-Type: multipart/mixed; boundary="G73GagE3zy2UEeAS8xRbo0xZxh4D3MkVG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "James (Qian) Wang"
 <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, Russell King <linux@armlinux.org.uk>,
 Dave Airlie <airlied@redhat.com>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, John Stultz <john.stultz@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>, Tomi Valkeinen <tomba@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Eric Anholt <eric@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Message-ID: <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
Subject: Re: [PATCH 02/10] drm: Rename plane atomic_check state names
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
In-Reply-To: <20210115125703.1315064-2-maxime@cerno.tech>

--G73GagE3zy2UEeAS8xRbo0xZxh4D3MkVG
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.01.21 um 13:56 schrieb Maxime Ripard:
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> index 8a4235d9d9f1..2cb09e9d9306 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -344,12 +344,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
>   };
>  =20
>   static int ipu_plane_atomic_check(struct drm_plane *plane,
> -				  struct drm_plane_state *state)
> +				  struct drm_plane_state *new_state)

It's not 'new_plane_state' ?

Best regards
Thomas

>   {
>   	struct drm_plane_state *old_state =3D plane->state;
>   	struct drm_crtc_state *crtc_state;
>   	struct device *dev =3D plane->dev->dev;
> -	struct drm_framebuffer *fb =3D state->fb;
> +	struct drm_framebuffer *fb =3D new_state->fb;
>   	struct drm_framebuffer *old_fb =3D old_state->fb;
>   	unsigned long eba, ubo, vbo, old_ubo, old_vbo, alpha_eba;
>   	bool can_position =3D (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY);
> @@ -359,15 +359,16 @@ static int ipu_plane_atomic_check(struct drm_plan=
e *plane,
>   	if (!fb)
>   		return 0;
>  =20
> -	if (WARN_ON(!state->crtc))
> +	if (WARN_ON(!new_state->crtc))
>   		return -EINVAL;
>  =20
>   	crtc_state =3D
> -		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> +		drm_atomic_get_existing_crtc_state(new_state->state,
> +						   new_state->crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
>  =20
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +	ret =3D drm_atomic_helper_check_plane_state(new_state, crtc_state,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  can_position, true);
> @@ -381,7 +382,7 @@ static int ipu_plane_atomic_check(struct drm_plane =
*plane,
>   	switch (plane->type) {
>   	case DRM_PLANE_TYPE_PRIMARY:
>   		/* full plane minimum width is 13 pixels */
> -		if (drm_rect_width(&state->dst) < 13)
> +		if (drm_rect_width(&new_state->dst) < 13)
>   			return -EINVAL;
>   		break;
>   	case DRM_PLANE_TYPE_OVERLAY:
> @@ -391,7 +392,7 @@ static int ipu_plane_atomic_check(struct drm_plane =
*plane,
>   		return -EINVAL;
>   	}
>  =20
> -	if (drm_rect_height(&state->dst) < 2)
> +	if (drm_rect_height(&new_state->dst) < 2)
>   		return -EINVAL;
>  =20
>   	/*
> @@ -402,12 +403,12 @@ static int ipu_plane_atomic_check(struct drm_plan=
e *plane,
>   	 * callback.
>   	 */
>   	if (old_fb &&
> -	    (drm_rect_width(&state->dst) !=3D drm_rect_width(&old_state->dst)=
 ||
> -	     drm_rect_height(&state->dst) !=3D drm_rect_height(&old_state->ds=
t) ||
> +	    (drm_rect_width(&new_state->dst) !=3D drm_rect_width(&old_state->=
dst) ||
> +	     drm_rect_height(&new_state->dst) !=3D drm_rect_height(&old_state=
->dst) ||
>   	     fb->format !=3D old_fb->format))
>   		crtc_state->mode_changed =3D true;
>  =20
> -	eba =3D drm_plane_state_to_eba(state, 0);
> +	eba =3D drm_plane_state_to_eba(new_state, 0);
>  =20
>   	if (eba & 0x7)
>   		return -EINVAL;
> @@ -433,7 +434,7 @@ static int ipu_plane_atomic_check(struct drm_plane =
*plane,
>   		 * - Only EBA may be changed while scanout is active
>   		 * - The strides of U and V planes must be identical.
>   		 */
> -		vbo =3D drm_plane_state_to_vbo(state);
> +		vbo =3D drm_plane_state_to_vbo(new_state);
>  =20
>   		if (vbo & 0x7 || vbo > 0xfffff8)
>   			return -EINVAL;
> @@ -450,7 +451,7 @@ static int ipu_plane_atomic_check(struct drm_plane =
*plane,
>   		fallthrough;
>   	case DRM_FORMAT_NV12:
>   	case DRM_FORMAT_NV16:
> -		ubo =3D drm_plane_state_to_ubo(state);
> +		ubo =3D drm_plane_state_to_ubo(new_state);
>  =20
>   		if (ubo & 0x7 || ubo > 0xfffff8)
>   			return -EINVAL;
> @@ -471,8 +472,8 @@ static int ipu_plane_atomic_check(struct drm_plane =
*plane,
>   		 * The x/y offsets must be even in case of horizontal/vertical
>   		 * chroma subsampling.
>   		 */
> -		if (((state->src.x1 >> 16) & (fb->format->hsub - 1)) ||
> -		    ((state->src.y1 >> 16) & (fb->format->vsub - 1)))
> +		if (((new_state->src.x1 >> 16) & (fb->format->hsub - 1)) ||
> +		    ((new_state->src.y1 >> 16) & (fb->format->vsub - 1)))
>   			return -EINVAL;
>   		break;
>   	case DRM_FORMAT_RGB565_A8:
> @@ -481,7 +482,7 @@ static int ipu_plane_atomic_check(struct drm_plane =
*plane,
>   	case DRM_FORMAT_BGR888_A8:
>   	case DRM_FORMAT_RGBX8888_A8:
>   	case DRM_FORMAT_BGRX8888_A8:
> -		alpha_eba =3D drm_plane_state_to_eba(state, 1);
> +		alpha_eba =3D drm_plane_state_to_eba(new_state, 1);
>   		if (alpha_eba & 0x7)
>   			return -EINVAL;
>  =20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> index 7bb31fbee29d..f589923b4a5d 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -359,21 +359,22 @@ static void ingenic_drm_crtc_atomic_flush(struct =
drm_crtc *crtc,
>   }
>  =20
>   static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
> -					  struct drm_plane_state *state)
> +					  struct drm_plane_state *new_plane_state)
>   {
>   	struct ingenic_drm *priv =3D drm_device_get_priv(plane->dev);
>   	struct drm_crtc_state *crtc_state;
> -	struct drm_crtc *crtc =3D state->crtc ?: plane->state->crtc;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc ?: plane->state->crtc=
;
>   	int ret;
>  =20
>   	if (!crtc)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state, crtc)=
;
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(new_plane_state->st=
ate,
> +							crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
>  =20
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_sta=
te,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  priv->soc_info->has_osd,
> @@ -386,9 +387,9 @@ static int ingenic_drm_plane_atomic_check(struct dr=
m_plane *plane,
>   	 * Note that state->src_* are in 16.16 fixed-point format.
>   	 */
>   	if (!priv->soc_info->has_osd &&
> -	    (state->src_x !=3D 0 ||
> -	     (state->src_w >> 16) !=3D state->crtc_w ||
> -	     (state->src_h >> 16) !=3D state->crtc_h))
> +	    (new_plane_state->src_x !=3D 0 ||
> +	     (new_plane_state->src_w >> 16) !=3D new_plane_state->crtc_w ||
> +	     (new_plane_state->src_h >> 16) !=3D new_plane_state->crtc_h))
>   		return -EINVAL;
>  =20
>   	/*
> @@ -396,12 +397,12 @@ static int ingenic_drm_plane_atomic_check(struct =
drm_plane *plane,
>   	 * its position, size or depth.
>   	 */
>   	if (priv->soc_info->has_osd &&
> -	    (!plane->state->fb || !state->fb ||
> -	     plane->state->crtc_x !=3D state->crtc_x ||
> -	     plane->state->crtc_y !=3D state->crtc_y ||
> -	     plane->state->crtc_w !=3D state->crtc_w ||
> -	     plane->state->crtc_h !=3D state->crtc_h ||
> -	     plane->state->fb->format->format !=3D state->fb->format->format)=
)
> +	    (!plane->state->fb || !new_plane_state->fb ||
> +	     plane->state->crtc_x !=3D new_plane_state->crtc_x ||
> +	     plane->state->crtc_y !=3D new_plane_state->crtc_y ||
> +	     plane->state->crtc_w !=3D new_plane_state->crtc_w ||
> +	     plane->state->crtc_h !=3D new_plane_state->crtc_h ||
> +	     plane->state->fb->format->format !=3D new_plane_state->fb->forma=
t->format))
>   		crtc_state->mode_changed =3D true;
>  =20
>   	return 0;
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/in=
genic/ingenic-ipu.c
> index e52777ef85fd..623f42d44b07 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -514,49 +514,49 @@ static void ingenic_ipu_plane_atomic_update(struc=
t drm_plane *plane,
>   }
>  =20
>   static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
> -					  struct drm_plane_state *state)
> +					  struct drm_plane_state *new_plane_state)
>   {
>   	unsigned int num_w, denom_w, num_h, denom_h, xres, yres, max_w, max_=
h;
>   	struct ingenic_ipu *ipu =3D plane_to_ingenic_ipu(plane);
> -	struct drm_crtc *crtc =3D state->crtc ?: plane->state->crtc;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc ?: plane->state->crtc=
;
>   	struct drm_crtc_state *crtc_state;
>  =20
>   	if (!crtc)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state, crtc)=
;
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(new_plane_state->st=
ate, crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
>  =20
>   	/* Request a full modeset if we are enabling or disabling the IPU. *=
/
> -	if (!plane->state->crtc ^ !state->crtc)
> +	if (!plane->state->crtc ^ !new_plane_state->crtc)
>   		crtc_state->mode_changed =3D true;
>  =20
> -	if (!state->crtc ||
> +	if (!new_plane_state->crtc ||
>   	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
>   		return 0;
>  =20
>   	/* Plane must be fully visible */
> -	if (state->crtc_x < 0 || state->crtc_y < 0 ||
> -	    state->crtc_x + state->crtc_w > crtc_state->mode.hdisplay ||
> -	    state->crtc_y + state->crtc_h > crtc_state->mode.vdisplay)
> +	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0 ||
> +	    new_plane_state->crtc_x + new_plane_state->crtc_w > crtc_state->m=
ode.hdisplay ||
> +	    new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->m=
ode.vdisplay)
>   		return -EINVAL;
>  =20
>   	/* Minimum size is 4x4 */
> -	if ((state->src_w >> 16) < 4 || (state->src_h >> 16) < 4)
> +	if ((new_plane_state->src_w >> 16) < 4 || (new_plane_state->src_h >> =
16) < 4)
>   		return -EINVAL;
>  =20
>   	/* Input and output lines must have an even number of pixels. */
> -	if (((state->src_w >> 16) & 1) || (state->crtc_w & 1))
> +	if (((new_plane_state->src_w >> 16) & 1) || (new_plane_state->crtc_w =
& 1))
>   		return -EINVAL;
>  =20
> -	if (!osd_changed(state, plane->state))
> +	if (!osd_changed(new_plane_state, plane->state))
>   		return 0;
>  =20
>   	crtc_state->mode_changed =3D true;
>  =20
> -	xres =3D state->src_w >> 16;
> -	yres =3D state->src_h >> 16;
> +	xres =3D new_plane_state->src_w >> 16;
> +	yres =3D new_plane_state->src_h >> 16;
>  =20
>   	/*
>   	 * Increase the scaled image's theorical width/height until we find =
a
> @@ -568,13 +568,13 @@ static int ingenic_ipu_plane_atomic_check(struct =
drm_plane *plane,
>   	max_w =3D crtc_state->mode.hdisplay * 102 / 100;
>   	max_h =3D crtc_state->mode.vdisplay * 102 / 100;
>  =20
> -	for (denom_w =3D xres, num_w =3D state->crtc_w; num_w <=3D max_w; num=
_w++)
> +	for (denom_w =3D xres, num_w =3D new_plane_state->crtc_w; num_w <=3D =
max_w; num_w++)
>   		if (!reduce_fraction(&num_w, &denom_w))
>   			break;
>   	if (num_w > max_w)
>   		return -EINVAL;
>  =20
> -	for (denom_h =3D yres, num_h =3D state->crtc_h; num_h <=3D max_h; num=
_h++)
> +	for (denom_h =3D yres, num_h =3D new_plane_state->crtc_h; num_h <=3D =
max_h; num_h++)
>   		if (!reduce_fraction(&num_h, &denom_h))
>   			break;
>   	if (num_h > max_h)
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_=
plane.c
> index be8eea3830c1..51ceaae9e7e8 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -77,32 +77,34 @@ static unsigned int check_pixel_format(struct drm_p=
lane *plane, u32 format)
>   }
>  =20
>   static int kmb_plane_atomic_check(struct drm_plane *plane,
> -				  struct drm_plane_state *state)
> +				  struct drm_plane_state *new_plane_state)
>   {
>   	struct drm_framebuffer *fb;
>   	int ret;
>   	struct drm_crtc_state *crtc_state;
>   	bool can_position;
>  =20
> -	fb =3D state->fb;
> -	if (!fb || !state->crtc)
> +	fb =3D new_plane_state->fb;
> +	if (!fb || !new_plane_state->crtc)
>   		return 0;
>  =20
>   	ret =3D check_pixel_format(plane, fb->format->format);
>   	if (ret)
>   		return ret;
>  =20
> -	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h > KMB_MAX_HEIGHT)
> +	if (new_plane_state->crtc_w > KMB_MAX_WIDTH || new_plane_state->crtc_=
h > KMB_MAX_HEIGHT)
>   		return -EINVAL;
> -	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h < KMB_MIN_HEIGHT)
> +	if (new_plane_state->crtc_w < KMB_MIN_WIDTH || new_plane_state->crtc_=
h < KMB_MIN_HEIGHT)
>   		return -EINVAL;
>   	can_position =3D (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY);
>   	crtc_state =3D
> -		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> -	return drm_atomic_helper_check_plane_state(state, crtc_state,
> -						 DRM_PLANE_HELPER_NO_SCALING,
> -						 DRM_PLANE_HELPER_NO_SCALING,
> -						 can_position, true);
> +		drm_atomic_get_existing_crtc_state(new_plane_state->state,
> +						   new_plane_state->crtc);
> +	return drm_atomic_helper_check_plane_state(new_plane_state,
> +						   crtc_state,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   can_position, true);
>   }
>  =20
>   static void kmb_plane_atomic_disable(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm=
/mediatek/mtk_drm_plane.c
> index 30ebcfd8832f..cdd2f8cfb4ab 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -141,28 +141,30 @@ static const struct drm_plane_funcs mtk_plane_fun=
cs =3D {
>   };
>  =20
>   static int mtk_plane_atomic_check(struct drm_plane *plane,
> -				  struct drm_plane_state *state)
> +				  struct drm_plane_state *new_plane_state)
>   {
> -	struct drm_framebuffer *fb =3D state->fb;
> +	struct drm_framebuffer *fb =3D new_plane_state->fb;
>   	struct drm_crtc_state *crtc_state;
>   	int ret;
>  =20
>   	if (!fb)
>   		return 0;
>  =20
> -	if (WARN_ON(!state->crtc))
> +	if (WARN_ON(!new_plane_state->crtc))
>   		return 0;
>  =20
> -	ret =3D mtk_drm_crtc_plane_check(state->crtc, plane,
> -				       to_mtk_plane_state(state));
> +	ret =3D mtk_drm_crtc_plane_check(new_plane_state->crtc, plane,
> +				       to_mtk_plane_state(new_plane_state));
>   	if (ret)
>   		return ret;
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state,
> +					       new_plane_state->crtc);
>   	if (IS_ERR(crtc_state))
>   		return PTR_ERR(crtc_state);
>  =20
> -	return drm_atomic_helper_check_plane_state(state, crtc_state,
> +	return drm_atomic_helper_check_plane_state(new_plane_state,
> +						   crtc_state,
>   						   DRM_PLANE_HELPER_NO_SCALING,
>   						   DRM_PLANE_HELPER_NO_SCALING,
>   						   true, true);
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/me=
son/meson_overlay.c
> index 1ffbbecafa22..a419a8c514e1 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -165,18 +165,20 @@ struct meson_overlay {
>   #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
>  =20
>   static int meson_overlay_atomic_check(struct drm_plane *plane,
> -				      struct drm_plane_state *state)
> +				      struct drm_plane_state *new_plane_state)
>   {
>   	struct drm_crtc_state *crtc_state;
>  =20
> -	if (!state->crtc)
> +	if (!new_plane_state->crtc)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state,
> +					       new_plane_state->crtc);
>   	if (IS_ERR(crtc_state))
>   		return PTR_ERR(crtc_state);
>  =20
> -	return drm_atomic_helper_check_plane_state(state, crtc_state,
> +	return drm_atomic_helper_check_plane_state(new_plane_state,
> +						   crtc_state,
>   						   FRAC_16_16(1, 5),
>   						   FRAC_16_16(5, 1),
>   						   true, true);
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meso=
n/meson_plane.c
> index 35338ed18209..2c1256caf48a 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -71,14 +71,15 @@ struct meson_plane {
>   #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
>  =20
>   static int meson_plane_atomic_check(struct drm_plane *plane,
> -				    struct drm_plane_state *state)
> +				    struct drm_plane_state *new_plane_state)
>   {
>   	struct drm_crtc_state *crtc_state;
>  =20
> -	if (!state->crtc)
> +	if (!new_plane_state->crtc)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state,
> +					       new_plane_state->crtc);
>   	if (IS_ERR(crtc_state))
>   		return PTR_ERR(crtc_state);
>  =20
> @@ -87,7 +88,8 @@ static int meson_plane_atomic_check(struct drm_plane =
*plane,
>   	 * - Upscaling up to 5x, vertical and horizontal
>   	 * - Final coordinates must match crtc size
>   	 */
> -	return drm_atomic_helper_check_plane_state(state, crtc_state,
> +	return drm_atomic_helper_check_plane_state(new_plane_state,
> +						   crtc_state,
>   						   FRAC_16_16(1, 5),
>   						   DRM_PLANE_HELPER_NO_SCALING,
>   						   false, true);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> index bc0231a50132..9bce72627ff0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -950,44 +950,45 @@ static bool dpu_plane_validate_src(struct drm_rec=
t *src,
>   }
>  =20
>   static int dpu_plane_atomic_check(struct drm_plane *plane,
> -				  struct drm_plane_state *state)
> +				  struct drm_plane_state *new_plane_state)
>   {
>   	int ret =3D 0, min_scale;
>   	struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> +	struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_state=
);
>   	const struct drm_crtc_state *crtc_state =3D NULL;
>   	const struct dpu_format *fmt;
>   	struct drm_rect src, dst, fb_rect =3D { 0 };
>   	uint32_t min_src_size, max_linewidth;
>  =20
> -	if (state->crtc)
> -		crtc_state =3D drm_atomic_get_new_crtc_state(state->state,
> -							   state->crtc);
> +	if (new_plane_state->crtc)
> +		crtc_state =3D drm_atomic_get_new_crtc_state(new_plane_state->state,=

> +							   new_plane_state->crtc);
>  =20
>   	min_scale =3D FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state, min_sc=
ale,
> -					  pdpu->pipe_sblk->maxdwnscale << 16,
> -					  true, true);
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_sta=
te,
> +						  min_scale,
> +						  pdpu->pipe_sblk->maxdwnscale << 16,
> +						  true, true);
>   	if (ret) {
>   		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
>   		return ret;
>   	}
> -	if (!state->visible)
> +	if (!new_plane_state->visible)
>   		return 0;
>  =20
> -	src.x1 =3D state->src_x >> 16;
> -	src.y1 =3D state->src_y >> 16;
> -	src.x2 =3D src.x1 + (state->src_w >> 16);
> -	src.y2 =3D src.y1 + (state->src_h >> 16);
> +	src.x1 =3D new_plane_state->src_x >> 16;
> +	src.y1 =3D new_plane_state->src_y >> 16;
> +	src.x2 =3D src.x1 + (new_plane_state->src_w >> 16);
> +	src.y2 =3D src.y1 + (new_plane_state->src_h >> 16);
>  =20
> -	dst =3D drm_plane_state_dest(state);
> +	dst =3D drm_plane_state_dest(new_plane_state);
>  =20
> -	fb_rect.x2 =3D state->fb->width;
> -	fb_rect.y2 =3D state->fb->height;
> +	fb_rect.x2 =3D new_plane_state->fb->width;
> +	fb_rect.y2 =3D new_plane_state->fb->height;
>  =20
>   	max_linewidth =3D pdpu->catalog->caps->max_linewidth;
>  =20
> -	fmt =3D to_dpu_format(msm_framebuffer_format(state->fb));
> +	fmt =3D to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>  =20
>   	min_src_size =3D DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>  =20
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/d=
rm/msm/disp/mdp5/mdp5_plane.c
> index 05fa8255caeb..f5434a5254e0 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -404,20 +404,21 @@ static int mdp5_plane_atomic_check_with_state(str=
uct drm_crtc_state *crtc_state,
>   }
>  =20
>   static int mdp5_plane_atomic_check(struct drm_plane *plane,
> -				   struct drm_plane_state *state)
> +				   struct drm_plane_state *new_plane_state)
>   {
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *crtc_state;
>  =20
> -	crtc =3D state->crtc ? state->crtc : plane->state->crtc;
> +	crtc =3D new_plane_state->crtc ? new_plane_state->crtc : plane->state=
->crtc;
>   	if (!crtc)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state, crtc)=
;
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(new_plane_state->st=
ate,
> +							crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
>  =20
> -	return mdp5_plane_atomic_check_with_state(crtc_state, state);
> +	return mdp5_plane_atomic_check_with_state(crtc_state, new_plane_state=
);
>   }
>  =20
>   static void mdp5_plane_atomic_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/=
nouveau/dispnv50/wndw.c
> index 0356474ad6f6..f83bfc0794ab 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -434,12 +434,13 @@ nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw=
,
>   }
>  =20
>   static int
> -nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state=
 *state)
> +nv50_wndw_atomic_check(struct drm_plane *plane,
> +		       struct drm_plane_state *new_plane_state)
>   {
>   	struct nouveau_drm *drm =3D nouveau_drm(plane->dev);
>   	struct nv50_wndw *wndw =3D nv50_wndw(plane);
>   	struct nv50_wndw_atom *armw =3D nv50_wndw_atom(wndw->plane.state);
> -	struct nv50_wndw_atom *asyw =3D nv50_wndw_atom(state);
> +	struct nv50_wndw_atom *asyw =3D nv50_wndw_atom(new_plane_state);
>   	struct nv50_head_atom *harm =3D NULL, *asyh =3D NULL;
>   	bool modeset =3D false;
>   	int ret;
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/oma=
pdrm/omap_plane.c
> index 51dc24acea73..78d0eb1fd69d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -99,18 +99,19 @@ static void omap_plane_atomic_disable(struct drm_pl=
ane *plane,
>   }
>  =20
>   static int omap_plane_atomic_check(struct drm_plane *plane,
> -				   struct drm_plane_state *state)
> +				   struct drm_plane_state *new_plane_state)
>   {
>   	struct drm_crtc_state *crtc_state;
>  =20
> -	if (!state->fb)
> +	if (!new_plane_state->fb)
>   		return 0;
>  =20
>   	/* crtc should only be NULL when disabling (i.e., !state->fb) */
> -	if (WARN_ON(!state->crtc))
> +	if (WARN_ON(!new_plane_state->crtc))
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state, state=
->crtc);
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(new_plane_state->st=
ate,
> +							new_plane_state->crtc);
>   	/* we should have a crtc state if the plane is attached to a crtc */=

>   	if (WARN_ON(!crtc_state))
>   		return 0;
> @@ -118,17 +119,17 @@ static int omap_plane_atomic_check(struct drm_pla=
ne *plane,
>   	if (!crtc_state->enable)
>   		return 0;
>  =20
> -	if (state->crtc_x < 0 || state->crtc_y < 0)
> +	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
>   		return -EINVAL;
>  =20
> -	if (state->crtc_x + state->crtc_w > crtc_state->adjusted_mode.hdispla=
y)
> +	if (new_plane_state->crtc_x + new_plane_state->crtc_w > crtc_state->a=
djusted_mode.hdisplay)
>   		return -EINVAL;
>  =20
> -	if (state->crtc_y + state->crtc_h > crtc_state->adjusted_mode.vdispla=
y)
> +	if (new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->a=
djusted_mode.vdisplay)
>   		return -EINVAL;
>  =20
> -	if (state->rotation !=3D DRM_MODE_ROTATE_0 &&
> -	    !omap_framebuffer_supports_rotation(state->fb))
> +	if (new_plane_state->rotation !=3D DRM_MODE_ROTATE_0 &&
> +	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
>   		return -EINVAL;
>  =20
>   	return 0;
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index 012bce0cdb65..96769047bd8c 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -463,15 +463,15 @@ static const struct drm_crtc_helper_funcs qxl_crt=
c_helper_funcs =3D {
>   };
>  =20
>   static int qxl_primary_atomic_check(struct drm_plane *plane,
> -				    struct drm_plane_state *state)
> +				    struct drm_plane_state *new_plane_state)
>   {
>   	struct qxl_device *qdev =3D to_qxl(plane->dev);
>   	struct qxl_bo *bo;
>  =20
> -	if (!state->crtc || !state->fb)
> +	if (!new_plane_state->crtc || !new_plane_state->fb)
>   		return 0;
>  =20
> -	bo =3D gem_to_qxl_bo(state->fb->obj[0]);
> +	bo =3D gem_to_qxl_bo(new_plane_state->fb->obj[0]);
>  =20
>   	return qxl_check_framebuffer(qdev, bo);
>   }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/=
rcar-du/rcar_du_plane.c
> index a0021fc25b27..63d1bd97abcb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -607,11 +607,12 @@ int __rcar_du_plane_atomic_check(struct drm_plane=
 *plane,
>   }
>  =20
>   static int rcar_du_plane_atomic_check(struct drm_plane *plane,
> -				      struct drm_plane_state *state)
> +				      struct drm_plane_state *new_plane_state)
>   {
> -	struct rcar_du_plane_state *rstate =3D to_rcar_plane_state(state);
> +	struct rcar_du_plane_state *rstate =3D to_rcar_plane_state(new_plane_=
state);
>  =20
> -	return __rcar_du_plane_atomic_check(plane, state, &rstate->format);
> +	return __rcar_du_plane_atomic_check(plane, new_plane_state,
> +					    &rstate->format);
>   }
>  =20
>   static void rcar_du_plane_atomic_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rc=
ar-du/rcar_du_vsp.c
> index f6a69aa116e6..37047d8d1a79 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -264,11 +264,12 @@ static void rcar_du_vsp_plane_cleanup_fb(struct d=
rm_plane *plane,
>   }
>  =20
>   static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
> -					  struct drm_plane_state *state)
> +					  struct drm_plane_state *new_plane_state)
>   {
> -	struct rcar_du_vsp_plane_state *rstate =3D to_rcar_vsp_plane_state(st=
ate);
> +	struct rcar_du_vsp_plane_state *rstate =3D to_rcar_vsp_plane_state(ne=
w_plane_state);
>  =20
> -	return __rcar_du_plane_atomic_check(plane, state, &rstate->format);
> +	return __rcar_du_plane_atomic_check(plane, new_plane_state,
> +					    &rstate->format);
>   }
>  =20
>   static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_vop.c
> index fefeab73ca27..8a507917a0dc 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -778,11 +778,11 @@ static bool rockchip_mod_supported(struct drm_pla=
ne *plane,
>   }
>  =20
>   static int vop_plane_atomic_check(struct drm_plane *plane,
> -			   struct drm_plane_state *state)
> +			   struct drm_plane_state *new_plane_state)
>   {
> -	struct drm_crtc *crtc =3D state->crtc;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
>   	struct drm_crtc_state *crtc_state;
> -	struct drm_framebuffer *fb =3D state->fb;
> +	struct drm_framebuffer *fb =3D new_plane_state->fb;
>   	struct vop_win *vop_win =3D to_vop_win(plane);
>   	const struct vop_win_data *win =3D vop_win->data;
>   	int ret;
> @@ -794,17 +794,18 @@ static int vop_plane_atomic_check(struct drm_plan=
e *plane,
>   	if (!crtc || WARN_ON(!fb))
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state, crtc)=
;
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(new_plane_state->st=
ate,
> +							crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
>  =20
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_sta=
te,
>   						  min_scale, max_scale,
>   						  true, true);
>   	if (ret)
>   		return ret;
>  =20
> -	if (!state->visible)
> +	if (!new_plane_state->visible)
>   		return 0;
>  =20
>   	ret =3D vop_convert_format(fb->format->format);
> @@ -815,12 +816,12 @@ static int vop_plane_atomic_check(struct drm_plan=
e *plane,
>   	 * Src.x1 can be odd when do clip, but yuv plane start point
>   	 * need align with 2 pixel.
>   	 */
> -	if (fb->format->is_yuv && ((state->src.x1 >> 16) % 2)) {
> +	if (fb->format->is_yuv && ((new_plane_state->src.x1 >> 16) % 2)) {
>   		DRM_ERROR("Invalid Source: Yuv format not support odd xpos\n");
>   		return -EINVAL;
>   	}
>  =20
> -	if (fb->format->is_yuv && state->rotation & DRM_MODE_REFLECT_Y) {
> +	if (fb->format->is_yuv && new_plane_state->rotation & DRM_MODE_REFLEC=
T_Y) {
>   		DRM_ERROR("Invalid Source: Yuv format does not support this rotatio=
n\n");
>   		return -EINVAL;
>   	}
> @@ -837,14 +838,16 @@ static int vop_plane_atomic_check(struct drm_plan=
e *plane,
>   		if (ret < 0)
>   			return ret;
>  =20
> -		if (state->src.x1 || state->src.y1) {
> -			DRM_ERROR("AFBC does not support offset display, xpos=3D%d, ypos=3D=
%d, offset=3D%d\n", state->src.x1, state->src.y1, fb->offsets[0]);
> +		if (new_plane_state->src.x1 || new_plane_state->src.y1) {
> +			DRM_ERROR("AFBC does not support offset display, xpos=3D%d, ypos=3D=
%d, offset=3D%d\n",
> +				  new_plane_state->src.x1,
> +				  new_plane_state->src.y1, fb->offsets[0]);
>   			return -EINVAL;
>   		}
>  =20
> -		if (state->rotation && state->rotation !=3D DRM_MODE_ROTATE_0) {
> +		if (new_plane_state->rotation && new_plane_state->rotation !=3D DRM_=
MODE_ROTATE_0) {
>   			DRM_ERROR("No rotation support in AFBC, rotation=3D%d\n",
> -				  state->rotation);
> +				  new_plane_state->rotation);
>   			return -EINVAL;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti=
_cursor.c
> index a98057431023..09a187ea4ade 100644
> --- a/drivers/gpu/drm/sti/sti_cursor.c
> +++ b/drivers/gpu/drm/sti/sti_cursor.c
> @@ -181,12 +181,12 @@ static void sti_cursor_init(struct sti_cursor *cu=
rsor)
>   }
>  =20
>   static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
> -				   struct drm_plane_state *state)
> +				   struct drm_plane_state *new_plane_state)
>   {
>   	struct sti_plane *plane =3D to_sti_plane(drm_plane);
>   	struct sti_cursor *cursor =3D to_sti_cursor(plane);
> -	struct drm_crtc *crtc =3D state->crtc;
> -	struct drm_framebuffer *fb =3D state->fb;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
> +	struct drm_framebuffer *fb =3D new_plane_state->fb;
>   	struct drm_crtc_state *crtc_state;
>   	struct drm_display_mode *mode;
>   	int dst_x, dst_y, dst_w, dst_h;
> @@ -196,15 +196,17 @@ static int sti_cursor_atomic_check(struct drm_pla=
ne *drm_plane,
>   	if (!crtc || !fb)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state, crtc=
);
>   	mode =3D &crtc_state->mode;
> -	dst_x =3D state->crtc_x;
> -	dst_y =3D state->crtc_y;
> -	dst_w =3D clamp_val(state->crtc_w, 0, mode->crtc_hdisplay - dst_x);
> -	dst_h =3D clamp_val(state->crtc_h, 0, mode->crtc_vdisplay - dst_y);
> +	dst_x =3D new_plane_state->crtc_x;
> +	dst_y =3D new_plane_state->crtc_y;
> +	dst_w =3D clamp_val(new_plane_state->crtc_w, 0,
> +			  mode->crtc_hdisplay - dst_x);
> +	dst_h =3D clamp_val(new_plane_state->crtc_h, 0,
> +			  mode->crtc_vdisplay - dst_y);
>   	/* src_x are in 16.16 format */
> -	src_w =3D state->src_w >> 16;
> -	src_h =3D state->src_h >> 16;
> +	src_w =3D new_plane_state->src_w >> 16;
> +	src_h =3D new_plane_state->src_h >> 16;
>  =20
>   	if (src_w < STI_CURS_MIN_SIZE ||
>   	    src_h < STI_CURS_MIN_SIZE ||
> diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gd=
p.c
> index 2d5a2b5b78b8..1b108181cddd 100644
> --- a/drivers/gpu/drm/sti/sti_gdp.c
> +++ b/drivers/gpu/drm/sti/sti_gdp.c
> @@ -615,12 +615,12 @@ static int sti_gdp_get_dst(struct device *dev, in=
t dst, int src)
>   }
>  =20
>   static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
> -				struct drm_plane_state *state)
> +				struct drm_plane_state *new_plane_state)
>   {
>   	struct sti_plane *plane =3D to_sti_plane(drm_plane);
>   	struct sti_gdp *gdp =3D to_sti_gdp(plane);
> -	struct drm_crtc *crtc =3D state->crtc;
> -	struct drm_framebuffer *fb =3D  state->fb;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
> +	struct drm_framebuffer *fb =3D  new_plane_state->fb;
>   	struct drm_crtc_state *crtc_state;
>   	struct sti_mixer *mixer;
>   	struct drm_display_mode *mode;
> @@ -633,17 +633,19 @@ static int sti_gdp_atomic_check(struct drm_plane =
*drm_plane,
>   		return 0;
>  =20
>   	mixer =3D to_sti_mixer(crtc);
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state, crtc=
);
>   	mode =3D &crtc_state->mode;
> -	dst_x =3D state->crtc_x;
> -	dst_y =3D state->crtc_y;
> -	dst_w =3D clamp_val(state->crtc_w, 0, mode->hdisplay - dst_x);
> -	dst_h =3D clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
> +	dst_x =3D new_plane_state->crtc_x;
> +	dst_y =3D new_plane_state->crtc_y;
> +	dst_w =3D clamp_val(new_plane_state->crtc_w, 0, mode->hdisplay - dst_=
x);
> +	dst_h =3D clamp_val(new_plane_state->crtc_h, 0, mode->vdisplay - dst_=
y);
>   	/* src_x are in 16.16 format */
> -	src_x =3D state->src_x >> 16;
> -	src_y =3D state->src_y >> 16;
> -	src_w =3D clamp_val(state->src_w >> 16, 0, GAM_GDP_SIZE_MAX_WIDTH);
> -	src_h =3D clamp_val(state->src_h >> 16, 0, GAM_GDP_SIZE_MAX_HEIGHT);
> +	src_x =3D new_plane_state->src_x >> 16;
> +	src_y =3D new_plane_state->src_y >> 16;
> +	src_w =3D clamp_val(new_plane_state->src_w >> 16, 0,
> +			  GAM_GDP_SIZE_MAX_WIDTH);
> +	src_h =3D clamp_val(new_plane_state->src_h >> 16, 0,
> +			  GAM_GDP_SIZE_MAX_HEIGHT);
>  =20
>   	format =3D sti_gdp_fourcc2format(fb->format->format);
>   	if (format =3D=3D -1) {
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_=
hqvdp.c
> index 5a4e12194a77..cd556e0e4855 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -1017,12 +1017,12 @@ static void sti_hqvdp_start_xp70(struct sti_hqv=
dp *hqvdp)
>   }
>  =20
>   static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
> -				  struct drm_plane_state *state)
> +				  struct drm_plane_state *new_plane_state)
>   {
>   	struct sti_plane *plane =3D to_sti_plane(drm_plane);
>   	struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
> -	struct drm_crtc *crtc =3D state->crtc;
> -	struct drm_framebuffer *fb =3D state->fb;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
> +	struct drm_framebuffer *fb =3D new_plane_state->fb;
>   	struct drm_crtc_state *crtc_state;
>   	struct drm_display_mode *mode;
>   	int dst_x, dst_y, dst_w, dst_h;
> @@ -1032,17 +1032,17 @@ static int sti_hqvdp_atomic_check(struct drm_pl=
ane *drm_plane,
>   	if (!crtc || !fb)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state, crtc=
);
>   	mode =3D &crtc_state->mode;
> -	dst_x =3D state->crtc_x;
> -	dst_y =3D state->crtc_y;
> -	dst_w =3D clamp_val(state->crtc_w, 0, mode->hdisplay - dst_x);
> -	dst_h =3D clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
> +	dst_x =3D new_plane_state->crtc_x;
> +	dst_y =3D new_plane_state->crtc_y;
> +	dst_w =3D clamp_val(new_plane_state->crtc_w, 0, mode->hdisplay - dst_=
x);
> +	dst_h =3D clamp_val(new_plane_state->crtc_h, 0, mode->vdisplay - dst_=
y);
>   	/* src_x are in 16.16 format */
> -	src_x =3D state->src_x >> 16;
> -	src_y =3D state->src_y >> 16;
> -	src_w =3D state->src_w >> 16;
> -	src_h =3D state->src_h >> 16;
> +	src_x =3D new_plane_state->src_x >> 16;
> +	src_y =3D new_plane_state->src_y >> 16;
> +	src_w =3D new_plane_state->src_w >> 16;
> +	src_h =3D new_plane_state->src_h >> 16;
>  =20
>   	if (mode->clock && !sti_hqvdp_check_hw_scaling(hqvdp, mode,
>   						       src_w, src_h,
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 7812094f93d6..a316bf87834f 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -720,9 +720,9 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs =
=3D {
>    */
>  =20
>   static int ltdc_plane_atomic_check(struct drm_plane *plane,
> -				   struct drm_plane_state *state)
> +				   struct drm_plane_state *new_plane_state)
>   {
> -	struct drm_framebuffer *fb =3D state->fb;
> +	struct drm_framebuffer *fb =3D new_plane_state->fb;
>   	u32 src_w, src_h;
>  =20
>   	DRM_DEBUG_DRIVER("\n");
> @@ -731,11 +731,11 @@ static int ltdc_plane_atomic_check(struct drm_pla=
ne *plane,
>   		return 0;
>  =20
>   	/* convert src_ from 16:16 format */
> -	src_w =3D state->src_w >> 16;
> -	src_h =3D state->src_h >> 16;
> +	src_w =3D new_plane_state->src_w >> 16;
> +	src_h =3D new_plane_state->src_h >> 16;
>  =20
>   	/* Reject scaling */
> -	if (src_w !=3D state->crtc_w || src_h !=3D state->crtc_h) {
> +	if (src_w !=3D new_plane_state->crtc_w || src_h !=3D new_plane_state-=
>crtc_h) {
>   		DRM_ERROR("Scaling is not supported");
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_ui_layer.c
> index 816ad4ce8996..981dd72a2991 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -236,17 +236,18 @@ static int sun8i_ui_layer_update_buffer(struct su=
n8i_mixer *mixer, int channel,
>   }
>  =20
>   static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
> -				       struct drm_plane_state *state)
> +				       struct drm_plane_state *new_plane_state)
>   {
>   	struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
> -	struct drm_crtc *crtc =3D state->crtc;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
>   	struct drm_crtc_state *crtc_state;
>   	int min_scale, max_scale;
>  =20
>   	if (!crtc)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state, crtc)=
;
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(new_plane_state->st=
ate,
> +							crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
>  =20
> @@ -258,7 +259,8 @@ static int sun8i_ui_layer_atomic_check(struct drm_p=
lane *plane,
>   		max_scale =3D SUN8I_UI_SCALER_SCALE_MAX;
>   	}
>  =20
> -	return drm_atomic_helper_check_plane_state(state, crtc_state,
> +	return drm_atomic_helper_check_plane_state(new_plane_state,
> +						   crtc_state,
>   						   min_scale, max_scale,
>   						   true, true);
>   }
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_vi_layer.c
> index 76393fc976fe..8dcb243c3166 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -339,17 +339,18 @@ static int sun8i_vi_layer_update_buffer(struct su=
n8i_mixer *mixer, int channel,
>   }
>  =20
>   static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
> -				       struct drm_plane_state *state)
> +				       struct drm_plane_state *new_plane_state)
>   {
>   	struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(plane);
> -	struct drm_crtc *crtc =3D state->crtc;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
>   	struct drm_crtc_state *crtc_state;
>   	int min_scale, max_scale;
>  =20
>   	if (!crtc)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state, crtc)=
;
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(new_plane_state->st=
ate,
> +							crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
>  =20
> @@ -361,7 +362,8 @@ static int sun8i_vi_layer_atomic_check(struct drm_p=
lane *plane,
>   		max_scale =3D SUN8I_VI_SCALER_SCALE_MAX;
>   	}
>  =20
> -	return drm_atomic_helper_check_plane_state(state, crtc_state,
> +	return drm_atomic_helper_check_plane_state(new_plane_state,
> +						   crtc_state,
>   						   min_scale, max_scale,
>   						   true, true);
>   }
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 85dd7131553a..2d91956bc762 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -604,23 +604,23 @@ static const u64 tegra124_modifiers[] =3D {
>   };
>  =20
>   static int tegra_plane_atomic_check(struct drm_plane *plane,
> -				    struct drm_plane_state *state)
> +				    struct drm_plane_state *new_plane_state)
>   {
> -	struct tegra_plane_state *plane_state =3D to_tegra_plane_state(state)=
;
> +	struct tegra_plane_state *plane_state =3D to_tegra_plane_state(new_pl=
ane_state);
>   	unsigned int supported_rotation =3D DRM_MODE_ROTATE_0 |
>   					  DRM_MODE_REFLECT_X |
>   					  DRM_MODE_REFLECT_Y;
> -	unsigned int rotation =3D state->rotation;
> +	unsigned int rotation =3D new_plane_state->rotation;
>   	struct tegra_bo_tiling *tiling =3D &plane_state->tiling;
>   	struct tegra_plane *tegra =3D to_tegra_plane(plane);
> -	struct tegra_dc *dc =3D to_tegra_dc(state->crtc);
> +	struct tegra_dc *dc =3D to_tegra_dc(new_plane_state->crtc);
>   	int err;
>  =20
>   	/* no need for further checks if the plane is being disabled */
> -	if (!state->crtc)
> +	if (!new_plane_state->crtc)
>   		return 0;
>  =20
> -	err =3D tegra_plane_format(state->fb->format->format,
> +	err =3D tegra_plane_format(new_plane_state->fb->format->format,
>   				 &plane_state->format,
>   				 &plane_state->swap);
>   	if (err < 0)
> @@ -638,7 +638,7 @@ static int tegra_plane_atomic_check(struct drm_plan=
e *plane,
>   			return err;
>   	}
>  =20
> -	err =3D tegra_fb_get_tiling(state->fb, tiling);
> +	err =3D tegra_fb_get_tiling(new_plane_state->fb, tiling);
>   	if (err < 0)
>   		return err;
>  =20
> @@ -654,7 +654,7 @@ static int tegra_plane_atomic_check(struct drm_plan=
e *plane,
>   	 * property in order to achieve the same result.  The legacy BO flag=

>   	 * duplicates the DRM rotation property when both are set.
>   	 */
> -	if (tegra_fb_is_bottom_up(state->fb))
> +	if (tegra_fb_is_bottom_up(new_plane_state->fb))
>   		rotation |=3D DRM_MODE_REFLECT_Y;
>  =20
>   	rotation =3D drm_rotation_simplify(rotation, supported_rotation);
> @@ -674,14 +674,14 @@ static int tegra_plane_atomic_check(struct drm_pl=
ane *plane,
>   	 * error out if the user tries to display a framebuffer with such a
>   	 * configuration.
>   	 */
> -	if (state->fb->format->num_planes > 2) {
> -		if (state->fb->pitches[2] !=3D state->fb->pitches[1]) {
> +	if (new_plane_state->fb->format->num_planes > 2) {
> +		if (new_plane_state->fb->pitches[2] !=3D new_plane_state->fb->pitche=
s[1]) {
>   			DRM_ERROR("unsupported UV-plane configuration\n");
>   			return -EINVAL;
>   		}
>   	}
>  =20
> -	err =3D tegra_plane_state_add(tegra, state);
> +	err =3D tegra_plane_state_add(tegra, new_plane_state);
>   	if (err < 0)
>   		return err;
>  =20
> @@ -831,29 +831,29 @@ static const u32 tegra_cursor_plane_formats[] =3D=
 {
>   };
>  =20
>   static int tegra_cursor_atomic_check(struct drm_plane *plane,
> -				     struct drm_plane_state *state)
> +				     struct drm_plane_state *new_plane_state)
>   {
>   	struct tegra_plane *tegra =3D to_tegra_plane(plane);
>   	int err;
>  =20
>   	/* no need for further checks if the plane is being disabled */
> -	if (!state->crtc)
> +	if (!new_plane_state->crtc)
>   		return 0;
>  =20
>   	/* scaling not supported for cursor */
> -	if ((state->src_w >> 16 !=3D state->crtc_w) ||
> -	    (state->src_h >> 16 !=3D state->crtc_h))
> +	if ((new_plane_state->src_w >> 16 !=3D new_plane_state->crtc_w) ||
> +	    (new_plane_state->src_h >> 16 !=3D new_plane_state->crtc_h))
>   		return -EINVAL;
>  =20
>   	/* only square cursors supported */
> -	if (state->src_w !=3D state->src_h)
> +	if (new_plane_state->src_w !=3D new_plane_state->src_h)
>   		return -EINVAL;
>  =20
> -	if (state->crtc_w !=3D 32 && state->crtc_w !=3D 64 &&
> -	    state->crtc_w !=3D 128 && state->crtc_w !=3D 256)
> +	if (new_plane_state->crtc_w !=3D 32 && new_plane_state->crtc_w !=3D 6=
4 &&
> +	    new_plane_state->crtc_w !=3D 128 && new_plane_state->crtc_w !=3D =
256)
>   		return -EINVAL;
>  =20
> -	err =3D tegra_plane_state_add(tegra, state);
> +	err =3D tegra_plane_state_add(tegra, new_plane_state);
>   	if (err < 0)
>   		return err;
>  =20
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index 22a03f7ffdc1..8a2d359c4ff6 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -336,25 +336,25 @@ static void tegra_dc_remove_shared_plane(struct t=
egra_dc *dc,
>   }
>  =20
>   static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
> -					   struct drm_plane_state *state)
> +					   struct drm_plane_state *new_plane_state)
>   {
> -	struct tegra_plane_state *plane_state =3D to_tegra_plane_state(state)=
;
> +	struct tegra_plane_state *plane_state =3D to_tegra_plane_state(new_pl=
ane_state);
>   	struct tegra_shared_plane *tegra =3D to_tegra_shared_plane(plane);
>   	struct tegra_bo_tiling *tiling =3D &plane_state->tiling;
> -	struct tegra_dc *dc =3D to_tegra_dc(state->crtc);
> +	struct tegra_dc *dc =3D to_tegra_dc(new_plane_state->crtc);
>   	int err;
>  =20
>   	/* no need for further checks if the plane is being disabled */
> -	if (!state->crtc || !state->fb)
> +	if (!new_plane_state->crtc || !new_plane_state->fb)
>   		return 0;
>  =20
> -	err =3D tegra_plane_format(state->fb->format->format,
> +	err =3D tegra_plane_format(new_plane_state->fb->format->format,
>   				 &plane_state->format,
>   				 &plane_state->swap);
>   	if (err < 0)
>   		return err;
>  =20
> -	err =3D tegra_fb_get_tiling(state->fb, tiling);
> +	err =3D tegra_fb_get_tiling(new_plane_state->fb, tiling);
>   	if (err < 0)
>   		return err;
>  =20
> @@ -369,8 +369,8 @@ static int tegra_shared_plane_atomic_check(struct d=
rm_plane *plane,
>   	 * error out if the user tries to display a framebuffer with such a
>   	 * configuration.
>   	 */
> -	if (state->fb->format->num_planes > 2) {
> -		if (state->fb->pitches[2] !=3D state->fb->pitches[1]) {
> +	if (new_plane_state->fb->format->num_planes > 2) {
> +		if (new_plane_state->fb->pitches[2] !=3D new_plane_state->fb->pitche=
s[1]) {
>   			DRM_ERROR("unsupported UV-plane configuration\n");
>   			return -EINVAL;
>   		}
> @@ -378,7 +378,7 @@ static int tegra_shared_plane_atomic_check(struct d=
rm_plane *plane,
>  =20
>   	/* XXX scaling is not yet supported, add a check here */
>  =20
> -	err =3D tegra_plane_state_add(&tegra->base, state);
> +	err =3D tegra_plane_state_add(&tegra->base, new_plane_state);
>   	if (err < 0)
>   		return err;
>  =20
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tids=
s/tidss_plane.c
> index 35067ae674ea..6dab9ad89644 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -20,7 +20,7 @@
>   /* drm_plane_helper_funcs */
>  =20
>   static int tidss_plane_atomic_check(struct drm_plane *plane,
> -				    struct drm_plane_state *state)
> +				    struct drm_plane_state *new_plane_state)
>   {
>   	struct drm_device *ddev =3D plane->dev;
>   	struct tidss_device *tidss =3D to_tidss(ddev);
> @@ -33,20 +33,22 @@ static int tidss_plane_atomic_check(struct drm_plan=
e *plane,
>  =20
>   	dev_dbg(ddev->dev, "%s\n", __func__);
>  =20
> -	if (!state->crtc) {
> +	if (!new_plane_state->crtc) {
>   		/*
>   		 * The visible field is not reset by the DRM core but only
>   		 * updated by drm_plane_helper_check_state(), set it manually.
>   		 */
> -		state->visible =3D false;
> +		new_plane_state->visible =3D false;
>   		return 0;
>   	}
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state,
> +					       new_plane_state->crtc);
>   	if (IS_ERR(crtc_state))
>   		return PTR_ERR(crtc_state);
>  =20
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state, 0,
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_sta=
te,
> +						  0,
>   						  INT_MAX, true, true);
>   	if (ret < 0)
>   		return ret;
> @@ -63,35 +65,37 @@ static int tidss_plane_atomic_check(struct drm_plan=
e *plane,
>   	 * check for odd height).
>   	 */
>  =20
> -	finfo =3D drm_format_info(state->fb->format->format);
> +	finfo =3D drm_format_info(new_plane_state->fb->format->format);
>  =20
> -	if ((state->src_x >> 16) % finfo->hsub !=3D 0) {
> +	if ((new_plane_state->src_x >> 16) % finfo->hsub !=3D 0) {
>   		dev_dbg(ddev->dev,
>   			"%s: x-position %u not divisible subpixel size %u\n",
> -			__func__, (state->src_x >> 16), finfo->hsub);
> +			__func__, (new_plane_state->src_x >> 16), finfo->hsub);
>   		return -EINVAL;
>   	}
>  =20
> -	if ((state->src_y >> 16) % finfo->vsub !=3D 0) {
> +	if ((new_plane_state->src_y >> 16) % finfo->vsub !=3D 0) {
>   		dev_dbg(ddev->dev,
>   			"%s: y-position %u not divisible subpixel size %u\n",
> -			__func__, (state->src_y >> 16), finfo->vsub);
> +			__func__, (new_plane_state->src_y >> 16), finfo->vsub);
>   		return -EINVAL;
>   	}
>  =20
> -	if ((state->src_w >> 16) % finfo->hsub !=3D 0) {
> +	if ((new_plane_state->src_w >> 16) % finfo->hsub !=3D 0) {
>   		dev_dbg(ddev->dev,
>   			"%s: src width %u not divisible by subpixel size %u\n",
> -			 __func__, (state->src_w >> 16), finfo->hsub);
> +			 __func__, (new_plane_state->src_w >> 16),
> +			 finfo->hsub);
>   		return -EINVAL;
>   	}
>  =20
> -	if (!state->visible)
> +	if (!new_plane_state->visible)
>   		return 0;
>  =20
> -	hw_videoport =3D to_tidss_crtc(state->crtc)->hw_videoport;
> +	hw_videoport =3D to_tidss_crtc(new_plane_state->crtc)->hw_videoport;
>  =20
> -	ret =3D dispc_plane_check(tidss->dispc, hw_plane, state, hw_videoport=
);
> +	ret =3D dispc_plane_check(tidss->dispc, hw_plane, new_plane_state,
> +				hw_videoport);
>   	if (ret)
>   		return ret;
>  =20
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_plane.c
> index 2f681a713815..389c80a5873c 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> @@ -21,48 +21,48 @@ static const struct drm_plane_funcs tilcdc_plane_fu=
ncs =3D {
>   };
>  =20
>   static int tilcdc_plane_atomic_check(struct drm_plane *plane,
> -				     struct drm_plane_state *state)
> +				     struct drm_plane_state *new_state)
>   {
>   	struct drm_crtc_state *crtc_state;
>   	struct drm_plane_state *old_state =3D plane->state;
>   	unsigned int pitch;
>  =20
> -	if (!state->crtc)
> +	if (!new_state->crtc)
>   		return 0;
>  =20
> -	if (WARN_ON(!state->fb))
> +	if (WARN_ON(!new_state->fb))
>   		return -EINVAL;
>  =20
> -	if (state->crtc_x || state->crtc_y) {
> +	if (new_state->crtc_x || new_state->crtc_y) {
>   		dev_err(plane->dev->dev, "%s: crtc position must be zero.",
>   			__func__);
>   		return -EINVAL;
>   	}
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> -							state->crtc);
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(new_state->state,
> +							new_state->crtc);
>   	/* we should have a crtc state if the plane is attached to a crtc */=

>   	if (WARN_ON(!crtc_state))
>   		return 0;
>  =20
> -	if (crtc_state->mode.hdisplay !=3D state->crtc_w ||
> -	    crtc_state->mode.vdisplay !=3D state->crtc_h) {
> +	if (crtc_state->mode.hdisplay !=3D new_state->crtc_w ||
> +	    crtc_state->mode.vdisplay !=3D new_state->crtc_h) {
>   		dev_err(plane->dev->dev,
>   			"%s: Size must match mode (%dx%d =3D=3D %dx%d)", __func__,
>   			crtc_state->mode.hdisplay, crtc_state->mode.vdisplay,
> -			state->crtc_w, state->crtc_h);
> +			new_state->crtc_w, new_state->crtc_h);
>   		return -EINVAL;
>   	}
>  =20
>   	pitch =3D crtc_state->mode.hdisplay *
> -		state->fb->format->cpp[0];
> -	if (state->fb->pitches[0] !=3D pitch) {
> +		new_state->fb->format->cpp[0];
> +	if (new_state->fb->pitches[0] !=3D pitch) {
>   		dev_err(plane->dev->dev,
>   			"Invalid pitch: fb and crtc widths must be the same");
>   		return -EINVAL;
>   	}
>  =20
> -	if (old_state->fb && state->fb->format !=3D old_state->fb->format) {
> +	if (old_state->fb && new_state->fb->format !=3D old_state->fb->format=
) {
>   		dev_dbg(plane->dev->dev,
>   			"%s(): pixel format change requires mode_change\n",
>   			__func__);
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_=
plane.c
> index 48fdffebb45f..b1b16043b1ed 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1040,21 +1040,21 @@ static int vc4_plane_mode_set(struct drm_plane =
*plane,
>    * in the CRTC's flush.
>    */
>   static int vc4_plane_atomic_check(struct drm_plane *plane,
> -				  struct drm_plane_state *state)
> +				  struct drm_plane_state *new_plane_state)
>   {
> -	struct vc4_plane_state *vc4_state =3D to_vc4_plane_state(state);
> +	struct vc4_plane_state *vc4_state =3D to_vc4_plane_state(new_plane_st=
ate);
>   	int ret;
>  =20
>   	vc4_state->dlist_count =3D 0;
>  =20
> -	if (!plane_enabled(state))
> +	if (!plane_enabled(new_plane_state))
>   		return 0;
>  =20
> -	ret =3D vc4_plane_mode_set(plane, state);
> +	ret =3D vc4_plane_mode_set(plane, new_plane_state);
>   	if (ret)
>   		return ret;
>  =20
> -	return vc4_plane_allocate_lbm(state);
> +	return vc4_plane_allocate_lbm(new_plane_state);
>   }
>  =20
>   static void vc4_plane_atomic_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/v=
irtio/virtgpu_plane.c
> index 42ac08ed1442..9b2ec4db1265 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -83,20 +83,21 @@ static const struct drm_plane_funcs virtio_gpu_plan=
e_funcs =3D {
>   };
>  =20
>   static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
> -					 struct drm_plane_state *state)
> +					 struct drm_plane_state *new_plane_state)
>   {
>   	bool is_cursor =3D plane->type =3D=3D DRM_PLANE_TYPE_CURSOR;
>   	struct drm_crtc_state *crtc_state;
>   	int ret;
>  =20
> -	if (!state->fb || WARN_ON(!state->crtc))
> +	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state,
> +					       new_plane_state->crtc);
>   	if (IS_ERR(crtc_state))
>                   return PTR_ERR(crtc_state);
>  =20
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_sta=
te,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  is_cursor, true);
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/v=
kms_plane.c
> index 0824327cc860..eef120a573a8 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -114,23 +114,24 @@ static void vkms_plane_atomic_update(struct drm_p=
lane *plane,
>   }
>  =20
>   static int vkms_plane_atomic_check(struct drm_plane *plane,
> -				   struct drm_plane_state *state)
> +				   struct drm_plane_state *new_plane_state)
>   {
>   	struct drm_crtc_state *crtc_state;
>   	bool can_position =3D false;
>   	int ret;
>  =20
> -	if (!state->fb || WARN_ON(!state->crtc))
> +	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state,
> +					       new_plane_state->crtc);
>   	if (IS_ERR(crtc_state))
>   		return PTR_ERR(crtc_state);
>  =20
>   	if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
>   		can_position =3D true;
>  =20
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_sta=
te,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  can_position, true);
> @@ -138,7 +139,7 @@ static int vkms_plane_atomic_check(struct drm_plane=
 *plane,
>   		return ret;
>  =20
>   	/* for now primary plane must be visible and full screen */
> -	if (!state->visible && !can_position)
> +	if (!new_plane_state->visible && !can_position)
>   		return -EINVAL;
>  =20
>   	return 0;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.c
> index 7dc96125e5c2..fa3ceef90891 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -441,22 +441,23 @@ vmw_du_cursor_plane_atomic_update(struct drm_plan=
e *plane,
>    * Returns 0 on success
>    */
>   int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
> -				      struct drm_plane_state *state)
> +				      struct drm_plane_state *new_state)
>   {
>   	struct drm_crtc_state *crtc_state =3D NULL;
> -	struct drm_framebuffer *new_fb =3D state->fb;
> +	struct drm_framebuffer *new_fb =3D new_state->fb;
>   	int ret;
>  =20
> -	if (state->crtc)
> -		crtc_state =3D drm_atomic_get_new_crtc_state(state->state, state->cr=
tc);
> +	if (new_state->crtc)
> +		crtc_state =3D drm_atomic_get_new_crtc_state(new_state->state,
> +							   new_state->crtc);
>  =20
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +	ret =3D drm_atomic_helper_check_plane_state(new_state, crtc_state,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  DRM_PLANE_HELPER_NO_SCALING,
>   						  false, true);
>  =20
>   	if (!ret && new_fb) {
> -		struct drm_crtc *crtc =3D state->crtc;
> +		struct drm_crtc *crtc =3D new_state->crtc;
>   		struct vmw_connector_state *vcs;
>   		struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
>  =20
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/=
zynqmp_disp.c
> index c685d94409b0..ee7793d6a26e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1143,18 +1143,20 @@ static inline struct zynqmp_disp_layer *plane_t=
o_layer(struct drm_plane *plane)
>  =20
>   static int
>   zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
> -			       struct drm_plane_state *state)
> +			       struct drm_plane_state *new_plane_state)
>   {
>   	struct drm_crtc_state *crtc_state;
>  =20
> -	if (!state->crtc)
> +	if (!new_plane_state->crtc)
>   		return 0;
>  =20
> -	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	crtc_state =3D drm_atomic_get_crtc_state(new_plane_state->state,
> +					       new_plane_state->crtc);
>   	if (IS_ERR(crtc_state))
>   		return PTR_ERR(crtc_state);
>  =20
> -	return drm_atomic_helper_check_plane_state(state, crtc_state,
> +	return drm_atomic_helper_check_plane_state(new_plane_state,
> +						   crtc_state,
>   						   DRM_PLANE_HELPER_NO_SCALING,
>   						   DRM_PLANE_HELPER_NO_SCALING,
>   						   false, false);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--G73GagE3zy2UEeAS8xRbo0xZxh4D3MkVG--

--lskaz8LNiVcoYs32HxGmgvvWi4Wmq6HeF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmABnLwFAwAAAAAACgkQlh/E3EQov+BQ
ig//Rmtlj7KxWTxphbz7M8sPiLc6CxLQyY5x6lAx72gnSoObmnwACoX7yq7dhZ2aoVeVBlxF78sP
oSHhzJjGGnEfUsdwbk+v8IYRB8YgnFikmNH7YNDp/Rq6UvcmULzt+G+RguJ+EzgndCM44wH/Sc3l
0eQYFvErKJiSwWZrrW3PihgqMqHvqgjKhGDmkTcKlcRNUqQUeJ6sYzdSebcQsyj7wVS+kY0uQg4p
zWA39stMzIxEvQ69Rkm0oXAhzaodfBhhs+itcDnkukEriKJ5+tB/pYXdNAsMtzmw2UGFPXEXIzS4
UGgVcs/NPqUbiVy2Pqs2E7QsY8LDE1QbPnWCsn3MF6K8HQWugLm0+jm/aZ0m7a5khT8382kIu/DA
0pCCU6lwVHfweSKMaLhSVeuCMKvl6DKubEdF/XieSC8OuiyYkqbv8gnPgAhZ33+Zkwrcm3QGcfhb
Wkyljsd2+mv96avzZQmaqMRCnAim4Nvcoui/HwPP22SbQLa/zsGWQDvQd5816k4uB4UCjrKMgVAZ
BC54UKybVu6h38jkAjguKoebnPbEWx4HOqZRStBH0x2S1ZIRhRXxmKoubAqnhWbQHF3913WQJrVW
ETw6vPqNH/cblBDtfIaXYQDyb4B6H5kqpc4G503aXcT1bUh/QCaTw5hJJCBNztqYS0ka7YWiX9tK
dm0=
=X/Y5
-----END PGP SIGNATURE-----

--lskaz8LNiVcoYs32HxGmgvvWi4Wmq6HeF--

--===============1211213039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1211213039==--
