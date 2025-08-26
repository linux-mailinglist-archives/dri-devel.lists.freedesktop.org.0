Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF92B37B73
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845CC10E714;
	Wed, 27 Aug 2025 07:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsONH8FQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9356310E083;
 Tue, 26 Aug 2025 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756207721; x=1787743721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QTpwn17bS/2M5ihjKSMc54SrMGEVyPkZUy+LI0Eysoc=;
 b=FsONH8FQFK4xsi8KDdE0n1aE0uBQUvfpo2BbrK2sOwUi12wa8dw3Kn5l
 8jesxs+Wf++RNA4sBdjeCAKHI4dwh131lIY6wuKlWAoFcDlN3Vfjg61Lp
 qSOJiTxESzd16iI+sTDjJ7CSqeFwxyA2rV/edX3B10VOaq7ApQRXMwynU
 TvCvhukrlQJSiVDiTckpCDuSbvTQ+1rwWXs9Scpb37esP+rEZ6Ws17ApS
 bD4cWp0fiWa9+t6yn1/TOPE72FYJpaR0E3ubgrTDrtYMqzxIy7I99Wis/
 gDTvECPZT1Iw1pbSqtXJpENBYGDJJKiw6yv6waO9Oqm4EW2Fg0ZTC2xBf w==;
X-CSE-ConnectionGUID: tNTSZp4rSAebLl3X0Gg62A==
X-CSE-MsgGUID: N6HNUwe2Tb+HiSFxlaSVDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69873949"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69873949"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 04:28:41 -0700
X-CSE-ConnectionGUID: XSYuHinnRt+9yZYtOFQUyw==
X-CSE-MsgGUID: ADIMLAKMRRiqUot4ZGBacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174857337"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.254])
 by orviesa005.jf.intel.com with SMTP; 26 Aug 2025 04:28:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Aug 2025 14:28:22 +0300
Date: Tue, 26 Aug 2025 14:28:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Edmund Dea <edmund.j.dea@intel.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Sui Jingfeng <suijingfeng@loongson.cn>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej@freedesktop.org, Skra@freedesktop.org
Subject: Re: [PATCH 01/39] drm/atomic: Make drm_atomic_get_connector_state()
 early return consistent
Message-ID: <aK2aVmh2VN2WVvjh@intel.com>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-1-f08ccd9f85c9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825-drm-no-more-existing-state-v1-1-f08ccd9f85c9@kernel.org>
X-Patchwork-Hint: comment
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

On Mon, Aug 25, 2025 at 03:43:06PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_connector_state() tries to lookup if a connector
> state was already allocated in the global state to return early if it
> was the case. drm_atomic_get_plane_state() and
> drm_atomic_get_crtc_state() behave similarly.
> 
> However, and unlike the other two, drm_atomic_get_connector_state() will
> do that lookup after having called drm_modeset_lock(), when the others
> will do it before.
> 
> Let's move the early return before the lock to make it consistent.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index cd15cf52f0c9144711da5879da57884674aea9e4..fe21f154e0fa030f85fb3d6d35e2684adcf36e26 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1128,10 +1128,13 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  	struct drm_mode_config *config = &connector->dev->mode_config;
>  	struct drm_connector_state *connector_state;
>  
>  	WARN_ON(!state->acquire_ctx);
>  
> +	if (state->connectors[index].state)
> +		return state->connectors[index].state;

connectors[] is dynamically allocated so this can't be done safely.

> +
>  	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
>  	index = drm_connector_index(connector);
> @@ -1150,13 +1153,10 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  		       sizeof(*state->connectors) * (alloc - state->num_connector));
>  
>  		state->num_connector = alloc;
>  	}
>  
> -	if (state->connectors[index].state)
> -		return state->connectors[index].state;
> -
>  	connector_state = connector->funcs->atomic_duplicate_state(connector);
>  	if (!connector_state)
>  		return ERR_PTR(-ENOMEM);
>  
>  	drm_connector_get(connector);
> 
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
