Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED5A01C74
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 00:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49DD10E545;
	Sun,  5 Jan 2025 23:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UeDysJQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C856A10E173;
 Sun,  5 Jan 2025 23:18:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DC5E7E9;
 Mon,  6 Jan 2025 00:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736119085;
 bh=eN3aRIQ/gGCSrh9ouIKHrFhOanrFncaqzRShN6d8pSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UeDysJQP/8Oa1/DV3kQKsywDTYtozyWwBNwdqtX1NaCn147rROcOhgDgaBzpl9UCN
 dkXrg5A0RWNQK6dEu/jHI3f++kMLiO8kBcwCiPgwkrE+/NNE7iR+kBs+koVfsvkkE+
 0++Ipy4b9rU2Z58OdadDTjM+gkVR9C1lYmx7Vl1g=
Date: Mon, 6 Jan 2025 01:18:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
Message-ID: <20250105231853.GA21164@pendragon.ideasonboard.com>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>
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

On Mon, Jan 06, 2025 at 12:47:07AM +0200, Dmitry Baryshkov wrote:
> On Sat, Dec 14, 2024 at 03:37:04PM +0200, Dmitry Baryshkov wrote:
> > While working on the generic mode_valid() implementation for the HDMI
> > Connector framework I noticed that unlike other DRM objects
> > drm_connector accepts non-const pointer to struct drm_display_mode,
> > while obviously mode_valid() isn't expected to modify the argument.
> > 
> > Mass-change the DRM framework code to pass const argument to that
> > callback.
> > 
> > The series has been compile-tested with defconfig for x86-64, arm and
> > arm64.
> > 
> > Note: yes, I understand that this change might be hard to review and
> > merge. The only viable option that I foresee is to add new callback,
> > having the const argument and migrate drivers into using it one by one.
> 
> Colleagues, I'd like to graciously ping regarding this series. Should it
> be merged as is (possibly requiring more R-B's)? Or should I rework it
> adding something like .mode_valid_new() callback which takes const
> argument?

I personally like the end result. The diffstat isn't very big, I don't
think it's that hard to review.

> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Rebased on top of linux-next
> > - Replaced 'accept const argument' with 'take a const arugment'
> >   (Laurent)
> > - Link to v1: https://lore.kernel.org/r/20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org
> > 
> > ---
> > Dmitry Baryshkov (5):
> >       drm/encoder_slave: make mode_valid accept const struct drm_display_mode
> >       drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
> >       drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
> >       drm/connector: make mode_valid_ctx take a const struct drm_display_mode
> >       drm/connector: make mode_valid take a const struct drm_display_mode
> > 
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c           |  8 ++++----
> >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c                 |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/atombios_dp.h                 |  2 +-
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c        | 12 +++++++++---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h        |  2 +-
> >  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  2 +-
> >  drivers/gpu/drm/arm/malidp_mw.c                          |  2 +-
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  2 +-
> >  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  2 +-
> >  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  7 -------
> >  drivers/gpu/drm/display/drm_bridge_connector.c           |  2 +-
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c          |  2 +-
> >  drivers/gpu/drm/drm_crtc_helper_internal.h               |  2 +-
> >  drivers/gpu/drm/drm_probe_helper.c                       |  2 +-
> >  drivers/gpu/drm/exynos/exynos_hdmi.c                     |  2 +-
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c                |  2 +-
> >  drivers/gpu/drm/gma500/cdv_intel_crt.c                   |  2 +-
> >  drivers/gpu/drm/gma500/cdv_intel_dp.c                    |  2 +-
> >  drivers/gpu/drm/gma500/cdv_intel_hdmi.c                  |  2 +-
> >  drivers/gpu/drm/gma500/cdv_intel_lvds.c                  |  2 +-
> >  drivers/gpu/drm/gma500/oaktrail_hdmi.c                   |  2 +-
> >  drivers/gpu/drm/gma500/psb_intel_drv.h                   |  2 +-
> >  drivers/gpu/drm/gma500/psb_intel_lvds.c                  |  2 +-
> >  drivers/gpu/drm/gma500/psb_intel_sdvo.c                  |  2 +-
> >  drivers/gpu/drm/i2c/ch7006_drv.c                         |  2 +-
> >  drivers/gpu/drm/i2c/sil164_drv.c                         |  2 +-
> >  drivers/gpu/drm/i915/display/dvo_ch7017.c                |  2 +-
> >  drivers/gpu/drm/i915/display/dvo_ch7xxx.c                |  2 +-
> >  drivers/gpu/drm/i915/display/dvo_ivch.c                  |  2 +-
> >  drivers/gpu/drm/i915/display/dvo_ns2501.c                |  2 +-
> >  drivers/gpu/drm/i915/display/dvo_sil164.c                |  2 +-
> >  drivers/gpu/drm/i915/display/dvo_tfp410.c                |  2 +-
> >  drivers/gpu/drm/i915/display/icl_dsi.c                   |  2 +-
> >  drivers/gpu/drm/i915/display/intel_crt.c                 |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dp.c                  |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c              |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dsi.c                 |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dsi.h                 |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dvo.c                 |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dvo_dev.h             |  2 +-
> >  drivers/gpu/drm/i915/display/intel_hdmi.c                |  2 +-
> >  drivers/gpu/drm/i915/display/intel_lvds.c                |  2 +-
> >  drivers/gpu/drm/i915/display/intel_sdvo.c                |  2 +-
> >  drivers/gpu/drm/i915/display/intel_tv.c                  |  2 +-
> >  drivers/gpu/drm/i915/display/vlv_dsi.c                   |  2 +-
> >  drivers/gpu/drm/imx/ipuv3/imx-tve.c                      |  2 +-
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c      |  2 +-
> >  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c                |  2 +-
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c                  |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_connector.c              |  2 +-
> >  drivers/gpu/drm/qxl/qxl_display.c                        |  2 +-
> >  drivers/gpu/drm/radeon/atombios_dp.c                     |  2 +-
> >  drivers/gpu/drm/radeon/radeon_connectors.c               | 10 +++++-----
> >  drivers/gpu/drm/radeon/radeon_mode.h                     |  2 +-
> >  drivers/gpu/drm/rockchip/cdn-dp-core.c                   |  2 +-
> >  drivers/gpu/drm/rockchip/inno_hdmi.c                     |  4 ++--
> >  drivers/gpu/drm/rockchip/rk3066_hdmi.c                   |  2 +-
> >  drivers/gpu/drm/sti/sti_dvo.c                            |  2 +-
> >  drivers/gpu/drm/sti/sti_hda.c                            | 12 ++++++------
> >  drivers/gpu/drm/sti/sti_hdmi.c                           |  2 +-
> >  drivers/gpu/drm/tegra/dsi.c                              |  2 +-
> >  drivers/gpu/drm/tegra/hdmi.c                             |  2 +-
> >  drivers/gpu/drm/tegra/sor.c                              |  2 +-
> >  drivers/gpu/drm/vc4/vc4_txp.c                            |  2 +-
> >  drivers/gpu/drm/virtio/virtgpu_display.c                 |  2 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                      |  2 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                      |  2 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c                     |  2 +-
> >  include/drm/display/drm_hdmi_state_helper.h              |  2 +-
> >  include/drm/drm_encoder_slave.h                          |  2 +-
> >  include/drm/drm_modeset_helper_vtables.h                 |  4 ++--
> >  71 files changed, 92 insertions(+), 93 deletions(-)
> > ---
> > base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
> > change-id: 20241115-drm-connector-mode-valid-const-ae3db0ef6cb7

-- 
Regards,

Laurent Pinchart
