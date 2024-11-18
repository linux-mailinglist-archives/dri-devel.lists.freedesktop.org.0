Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56CC9D101F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 12:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2517F10E4A8;
	Mon, 18 Nov 2024 11:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E40710E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 11:49:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD0751682
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 03:49:43 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C3453F6A8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 03:49:13 -0800 (PST)
Date: Mon, 18 Nov 2024 11:47:32 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/connector: make mode_valid accept const struct
 drm_display_mode
Message-ID: <ZzspVJGYUaUUzDHO@e110455-lin.cambridge.arm.com>
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-5-b1b523156f71@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-5-b1b523156f71@linaro.org>
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

On Fri, Nov 15, 2024 at 11:09:30PM +0200, Dmitry Baryshkov wrote:
> The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
> accept const struct drm_display_mode argument. Change the mode_valid
> callback of drm_connector to also accept const argument.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c           |  8 ++++----
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c                 |  2 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.h                 |  2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c        |  2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h        |  2 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  2 +-
>  drivers/gpu/drm/arm/malidp_mw.c                          |  2 +-

For the Arm display drivers:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  7 -------
>  drivers/gpu/drm/drm_crtc_helper_internal.h               |  2 +-
>  drivers/gpu/drm/drm_probe_helper.c                       |  2 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c                     |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c                |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_crt.c                   |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c                    |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c                  |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c                  |  2 +-
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c                   |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_drv.h                   |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c                  |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c                  |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ch7017.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ivch.c                  |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ns2501.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_sil164.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_tfp410.c                |  2 +-
>  drivers/gpu/drm/i915/display/icl_dsi.c                   |  2 +-
>  drivers/gpu/drm/i915/display/intel_crt.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp.c                  |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi.h                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dvo.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dvo_dev.h             |  2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_tv.c                  |  2 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c                   |  2 +-
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c                      |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c      |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c                  |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c              |  2 +-
>  drivers/gpu/drm/qxl/qxl_display.c                        |  2 +-
>  drivers/gpu/drm/radeon/atombios_dp.c                     |  2 +-
>  drivers/gpu/drm/radeon/radeon_connectors.c               | 10 +++++-----
>  drivers/gpu/drm/radeon/radeon_mode.h                     |  2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c                   |  2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c                     |  4 ++--
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c                   |  2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                            |  2 +-
>  drivers/gpu/drm/sti/sti_hda.c                            |  2 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                           |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c                   |  2 +-
>  drivers/gpu/drm/tegra/dsi.c                              |  2 +-
>  drivers/gpu/drm/tegra/hdmi.c                             |  2 +-
>  drivers/gpu/drm/tegra/sor.c                              |  2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                            |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c                 |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                      |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                      |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c                     |  2 +-
>  include/drm/drm_modeset_helper_vtables.h                 |  2 +-
>  64 files changed, 71 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 344e0a9ee08a99a7e874e4ed31c28901b7ea25b0..5e375e9c4f5de3883797f06a0c4bea26bf3d1795 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -674,7 +674,7 @@ static int amdgpu_connector_lvds_get_modes(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status amdgpu_connector_lvds_mode_valid(struct drm_connector *connector,
> -					     struct drm_display_mode *mode)
> +					     const struct drm_display_mode *mode)
>  {
>  	struct drm_encoder *encoder = amdgpu_connector_best_single_encoder(connector);
>  
> @@ -839,7 +839,7 @@ static int amdgpu_connector_vga_get_modes(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status amdgpu_connector_vga_mode_valid(struct drm_connector *connector,
> -					    struct drm_display_mode *mode)
> +					    const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct amdgpu_device *adev = drm_to_adev(dev);
> @@ -1196,7 +1196,7 @@ static void amdgpu_connector_dvi_force(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status amdgpu_connector_dvi_mode_valid(struct drm_connector *connector,
> -					    struct drm_display_mode *mode)
> +					    const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct amdgpu_device *adev = drm_to_adev(dev);
> @@ -1464,7 +1464,7 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
>  }
>  
>  static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector *connector,
> -					   struct drm_display_mode *mode)
> +					   const struct drm_display_mode *mode)
>  {
>  	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>  	struct amdgpu_connector_atom_dig *amdgpu_dig_connector = amdgpu_connector->con_priv;
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index 622634c08c7b56dce527b37c2d8b479abc58420c..521b9faab18059ed92ebb1dc9a9847e8426e7403 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -430,7 +430,7 @@ void amdgpu_atombios_dp_set_link_config(struct drm_connector *connector,
>  }
>  
>  int amdgpu_atombios_dp_mode_valid_helper(struct drm_connector *connector,
> -				  struct drm_display_mode *mode)
> +				  const struct drm_display_mode *mode)
>  {
>  	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>  	struct amdgpu_connector_atom_dig *dig_connector;
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.h b/drivers/gpu/drm/amd/amdgpu/atombios_dp.h
> index f59d85eaddf022d5b227e33bc8d3af418781f6d6..3e24acf8133f3a7f2d86f07048b1a8c67a4a8263 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.h
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.h
> @@ -32,7 +32,7 @@ int amdgpu_atombios_dp_get_panel_mode(struct drm_encoder *encoder,
>  void amdgpu_atombios_dp_set_link_config(struct drm_connector *connector,
>  				 const struct drm_display_mode *mode);
>  int amdgpu_atombios_dp_mode_valid_helper(struct drm_connector *connector,
> -				  struct drm_display_mode *mode);
> +				  const struct drm_display_mode *mode);
>  bool amdgpu_atombios_dp_needs_link_train(struct amdgpu_connector *amdgpu_connector);
>  void amdgpu_atombios_dp_set_rx_power_state(struct drm_connector *connector,
>  				    u8 power_state);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d0ca905e91eafe6c53f3f2ebdf3f2ae9589d7f89..260426ba680c9e8120edfe36a28e6e6c34cd9a3a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7377,7 +7377,7 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>  }
>  
>  enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connector,
> -				   struct drm_display_mode *mode)
> +				   const struct drm_display_mode *mode)
>  {
>  	int result = MODE_ERROR;
>  	struct dc_sink *dc_sink;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 25e95775c45c10ec1fb72f062204109d3b2e5efa..32856b848052efba0b26e257cc823ceae8c066c8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -945,7 +945,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>  				     int link_index);
>  
>  enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connector,
> -				   struct drm_display_mode *mode);
> +				   const struct drm_display_mode *mode);
>  
>  void dm_restore_drm_connector_state(struct drm_device *dev,
>  				    struct drm_connector *connector);
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index ebccb74306a765d524401c5fbbad32439366fbcb..e075a6b317cc23122238a79b1eb62f68a5074e81 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -88,7 +88,7 @@ komeda_wb_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  komeda_wb_connector_mode_valid(struct drm_connector *connector,
> -			       struct drm_display_mode *mode)
> +			       const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_mode_config *mode_config = &dev->mode_config;
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index 2577f0cef8fcda497efa91ed5dbce9c2a40587c7..600af5ad81b15d0c30f9f79588f40cca07437ed8 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -43,7 +43,7 @@ static int malidp_mw_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  malidp_mw_connector_mode_valid(struct drm_connector *connector,
> -			       struct drm_display_mode *mode)
> +			       const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_mode_config *mode_config = &dev->mode_config;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index eb5919b382635e5e0b8fb70bcc2cc6de1a059187..fda66e7876b86f6dfc1ed0f781cd9c184e380090 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -847,7 +847,7 @@ static int adv7511_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  adv7511_connector_mode_valid(struct drm_connector *connector,
> -			     struct drm_display_mode *mode)
> +			     const struct drm_display_mode *mode)
>  {
>  	struct adv7511 *adv = connector_to_adv7511(connector);
>  
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 41f72d458487fb27a34f2fa475c51de55725bc23..3b9e265e874719a3a8d21ea735bd7a877b47c7a7 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1619,7 +1619,7 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
>  
>  static
>  enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
> -					  struct drm_display_mode *mode)
> +					  const struct drm_display_mode *mode)
>  {
>  	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
>  
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 37f1acf5c0f83ded2fb3d83150dc05cb6cfd2432..3760ccfe54d0826053eb899c5b14f9c8026702a2 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -115,16 +115,9 @@ static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
>  	return num_modes;
>  }
>  
> -static enum drm_mode_status ge_b850v3_lvds_mode_valid(
> -		struct drm_connector *connector, struct drm_display_mode *mode)
> -{
> -	return MODE_OK;
> -}
> -
>  static const struct
>  drm_connector_helper_funcs ge_b850v3_lvds_connector_helper_funcs = {
>  	.get_modes = ge_b850v3_lvds_get_modes,
> -	.mode_valid = ge_b850v3_lvds_mode_valid,
>  };
>  
>  static enum drm_connector_status ge_b850v3_lvds_bridge_detect(struct drm_bridge *bridge)
> diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
> index 8059f65c5d6c46014a3b510069730c6ac079f7bc..bae73936acf9bae97acb0d4f9554f963303907ca 100644
> --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> @@ -43,7 +43,7 @@ enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
>  					    const struct drm_display_mode *mode);
>  int
>  drm_connector_mode_valid(struct drm_connector *connector,
> -			 struct drm_display_mode *mode,
> +			 const struct drm_display_mode *mode,
>  			 struct drm_modeset_acquire_ctx *ctx,
>  			 enum drm_mode_status *status);
>  
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 96b266b37ba49539dfc9b1af13b5e803526ee40a..080b552006141489d8d3fd985f737714820aa3a6 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -202,7 +202,7 @@ enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
>  
>  int
>  drm_connector_mode_valid(struct drm_connector *connector,
> -			 struct drm_display_mode *mode,
> +			 const struct drm_display_mode *mode,
>  			 struct drm_modeset_acquire_ctx *ctx,
>  			 enum drm_mode_status *status)
>  {
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index c9d4b9146df95bb46cb6bea4849c331616c2b463..683409f7abafa9ee95b25d37f74724de2477a4c1 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -931,7 +931,7 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
>  }
>  
>  static enum drm_mode_status hdmi_mode_valid(struct drm_connector *connector,
> -					    struct drm_display_mode *mode)
> +					    const struct drm_display_mode *mode)
>  {
>  	struct hdmi_context *hdata = connector_to_hdmi(connector);
>  	int ret;
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> index 2c2b92324a2e90fe13dcfa889986f00419c4be60..048b747d6871400ffa748458762b0721a5c1cad6 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> @@ -62,7 +62,7 @@ static int fsl_dcu_drm_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  fsl_dcu_drm_connector_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> +				 const struct drm_display_mode *mode)
>  {
>  	if (mode->hdisplay & 0xf)
>  		return MODE_ERROR;
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
> index 5a0acd914f769a970f3be12176dfd0bcbd8cee17..06fe7480e7afd1d67ee2be45b872604830913aff 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
> @@ -69,7 +69,7 @@ static void cdv_intel_crt_dpms(struct drm_encoder *encoder, int mode)
>  }
>  
>  static enum drm_mode_status cdv_intel_crt_mode_valid(struct drm_connector *connector,
> -				struct drm_display_mode *mode)
> +				const struct drm_display_mode *mode)
>  {
>  	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
>  		return MODE_NO_DBLESCAN;
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index cc2ed9b3fd2d22aa9d02983cf7059823f80ef366..53990d27c39faca906e960f4ad5a9e614c002990 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -505,7 +505,7 @@ static void cdv_intel_edp_backlight_off (struct gma_encoder *intel_encoder)
>  
>  static enum drm_mode_status
>  cdv_intel_dp_mode_valid(struct drm_connector *connector,
> -		    struct drm_display_mode *mode)
> +		    const struct drm_display_mode *mode)
>  {
>  	struct gma_encoder *encoder = gma_attached_encoder(connector);
>  	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> index 2d95e04712911afcb2a1c03ce88428daf71dbb74..f2a3e37ef63289876182821f688348e05b7e224e 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> @@ -222,7 +222,7 @@ static int cdv_hdmi_get_modes(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status cdv_hdmi_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> +				 const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > 165000)
>  		return MODE_CLOCK_HIGH;
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> index f3a4517bdf27cef18041d2c533bc3543a0cc371e..9276e3676ba0503e4ed50e67efd51c6fc2311669 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> @@ -153,7 +153,7 @@ static void cdv_intel_lvds_restore(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status cdv_intel_lvds_mode_valid(struct drm_connector *connector,
> -			      struct drm_display_mode *mode)
> +			      const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
> index ed8626c73541c13b1c04da26c096cf94f80524a6..1cf3943691277660d1d376a1894a5523362f0808 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
> @@ -514,7 +514,7 @@ static void oaktrail_hdmi_dpms(struct drm_encoder *encoder, int mode)
>  }
>  
>  static enum drm_mode_status oaktrail_hdmi_mode_valid(struct drm_connector *connector,
> -				struct drm_display_mode *mode)
> +				const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > 165000)
>  		return MODE_CLOCK_HIGH;
> diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
> index 2499fd6a80c9d81541a0a137e85fd5e974c7b021..9dc9dcd1b09f79b3e7a7d1c28e48afd82cd60da3 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> @@ -212,7 +212,7 @@ extern bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
>  				      const struct drm_display_mode *mode,
>  				      struct drm_display_mode *adjusted_mode);
>  extern enum drm_mode_status psb_intel_lvds_mode_valid(struct drm_connector *connector,
> -				     struct drm_display_mode *mode);
> +				     const struct drm_display_mode *mode);
>  extern int psb_intel_lvds_set_property(struct drm_connector *connector,
>  					struct drm_property *property,
>  					uint64_t value);
> diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> index 138f153d38ba354b2632eb39f559e1dad003ebf8..9ad611b5956eb4a289f7ba7f86ee94c0068ef5f1 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> @@ -331,7 +331,7 @@ static void psb_intel_lvds_restore(struct drm_connector *connector)
>  }
>  
>  enum drm_mode_status psb_intel_lvds_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> +				 const struct drm_display_mode *mode)
>  {
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->dev);
>  	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> index 8dafff963ca8bc169706c283fa1504958d69a72e..afda40fc449470b1ba3244b3d236db12ee61d452 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> @@ -1159,7 +1159,7 @@ static void psb_intel_sdvo_dpms(struct drm_encoder *encoder, int mode)
>  }
>  
>  static enum drm_mode_status psb_intel_sdvo_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> +				 const struct drm_display_mode *mode)
>  {
>  	struct psb_intel_sdvo *psb_intel_sdvo = intel_attached_sdvo(connector);
>  
> diff --git a/drivers/gpu/drm/i915/display/dvo_ch7017.c b/drivers/gpu/drm/i915/display/dvo_ch7017.c
> index 493e730c685b80055ad81a615a4a36d30d00cd17..206818f9ad49e6a6876d4e179f34ce7d8369fd06 100644
> --- a/drivers/gpu/drm/i915/display/dvo_ch7017.c
> +++ b/drivers/gpu/drm/i915/display/dvo_ch7017.c
> @@ -247,7 +247,7 @@ static enum drm_connector_status ch7017_detect(struct intel_dvo_device *dvo)
>  }
>  
>  static enum drm_mode_status ch7017_mode_valid(struct intel_dvo_device *dvo,
> -					      struct drm_display_mode *mode)
> +					      const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > 160000)
>  		return MODE_CLOCK_HIGH;
> diff --git a/drivers/gpu/drm/i915/display/dvo_ch7xxx.c b/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
> index 534b8544e0a41ddd5761610f63f890d6d42ac6bd..10ab3cc73e586492aa7bc0d767d7fcd57f72db25 100644
> --- a/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
> +++ b/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
> @@ -276,7 +276,7 @@ static enum drm_connector_status ch7xxx_detect(struct intel_dvo_device *dvo)
>  }
>  
>  static enum drm_mode_status ch7xxx_mode_valid(struct intel_dvo_device *dvo,
> -					      struct drm_display_mode *mode)
> +					      const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > 165000)
>  		return MODE_CLOCK_HIGH;
> diff --git a/drivers/gpu/drm/i915/display/dvo_ivch.c b/drivers/gpu/drm/i915/display/dvo_ivch.c
> index 0d5cce6051b1b8451a6da38e54da5e1cd6cd7eaf..d9c3152d4338fbf3ba97ac69c3bd11a285c10c4e 100644
> --- a/drivers/gpu/drm/i915/display/dvo_ivch.c
> +++ b/drivers/gpu/drm/i915/display/dvo_ivch.c
> @@ -314,7 +314,7 @@ static enum drm_connector_status ivch_detect(struct intel_dvo_device *dvo)
>  }
>  
>  static enum drm_mode_status ivch_mode_valid(struct intel_dvo_device *dvo,
> -					    struct drm_display_mode *mode)
> +					    const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > 112000)
>  		return MODE_CLOCK_HIGH;
> diff --git a/drivers/gpu/drm/i915/display/dvo_ns2501.c b/drivers/gpu/drm/i915/display/dvo_ns2501.c
> index 9d47f8a93e94b5da3dd7afaa9cd268c8b1260751..cb619ffc974f28c2ed931e8ace2cda1eab6c84c7 100644
> --- a/drivers/gpu/drm/i915/display/dvo_ns2501.c
> +++ b/drivers/gpu/drm/i915/display/dvo_ns2501.c
> @@ -524,7 +524,7 @@ static enum drm_connector_status ns2501_detect(struct intel_dvo_device *dvo)
>  }
>  
>  static enum drm_mode_status ns2501_mode_valid(struct intel_dvo_device *dvo,
> -					      struct drm_display_mode *mode)
> +					      const struct drm_display_mode *mode)
>  {
>  	DRM_DEBUG_KMS
>  	    ("is mode valid (hdisplay=%d,htotal=%d,vdisplay=%d,vtotal=%d)\n",
> diff --git a/drivers/gpu/drm/i915/display/dvo_sil164.c b/drivers/gpu/drm/i915/display/dvo_sil164.c
> index a8dd40c0099703484b3ed6154fa9df948c5f9128..b42c717085f316a1e887340a36b5bd6090099789 100644
> --- a/drivers/gpu/drm/i915/display/dvo_sil164.c
> +++ b/drivers/gpu/drm/i915/display/dvo_sil164.c
> @@ -189,7 +189,7 @@ static enum drm_connector_status sil164_detect(struct intel_dvo_device *dvo)
>  }
>  
>  static enum drm_mode_status sil164_mode_valid(struct intel_dvo_device *dvo,
> -					      struct drm_display_mode *mode)
> +					      const struct drm_display_mode *mode)
>  {
>  	return MODE_OK;
>  }
> diff --git a/drivers/gpu/drm/i915/display/dvo_tfp410.c b/drivers/gpu/drm/i915/display/dvo_tfp410.c
> index d9a0cd753a878db8fda9fb537dd8f7ca4036c7e8..280699438526790b76f0bbf7a5d73aa109546558 100644
> --- a/drivers/gpu/drm/i915/display/dvo_tfp410.c
> +++ b/drivers/gpu/drm/i915/display/dvo_tfp410.c
> @@ -217,7 +217,7 @@ static enum drm_connector_status tfp410_detect(struct intel_dvo_device *dvo)
>  }
>  
>  static enum drm_mode_status tfp410_mode_valid(struct intel_dvo_device *dvo,
> -					      struct drm_display_mode *mode)
> +					      const struct drm_display_mode *mode)
>  {
>  	return MODE_OK;
>  }
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index 87a27d91d15dc9e28fe95548942a17a5ad1bb0b4..644efaa89c855beae30abb7b9a78c5d167dab27b 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1451,7 +1451,7 @@ static void gen11_dsi_post_disable(struct intel_atomic_state *state,
>  }
>  
>  static enum drm_mode_status gen11_dsi_mode_valid(struct drm_connector *connector,
> -						 struct drm_display_mode *mode)
> +						 const struct drm_display_mode *mode)
>  {
>  	struct drm_i915_private *i915 = to_i915(connector->dev);
>  	enum drm_mode_status status;
> diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
> index fd78adbaadbe82ae7dbaaee1f4a1175ede81932d..2cda689a8f4f5a677aade0ac6b705be9ca62bf64 100644
> --- a/drivers/gpu/drm/i915/display/intel_crt.c
> +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> @@ -344,7 +344,7 @@ static void intel_enable_crt(struct intel_atomic_state *state,
>  
>  static enum drm_mode_status
>  intel_crt_mode_valid(struct drm_connector *connector,
> -		     struct drm_display_mode *mode)
> +		     const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index fbb096be02ade5e4bb36e65f197705d90dfa8a55..66ec69ee73b370d67d1da21b71f42fa326dcfa15 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1366,7 +1366,7 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
>  
>  static enum drm_mode_status
>  intel_dp_mode_valid(struct drm_connector *_connector,
> -		    struct drm_display_mode *mode)
> +		    const struct drm_display_mode *mode)
>  {
>  	struct intel_connector *connector = to_intel_connector(_connector);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.c b/drivers/gpu/drm/i915/display/intel_dsi.c
> index 0be46c6c9611f7c386a052ad8b79f4924727b892..c93a3cf75c52cc2bf2f4ba85b0cdef9e3a8ebd76 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.c
> @@ -58,7 +58,7 @@ int intel_dsi_get_modes(struct drm_connector *connector)
>  }
>  
>  enum drm_mode_status intel_dsi_mode_valid(struct drm_connector *connector,
> -					  struct drm_display_mode *mode)
> +					  const struct drm_display_mode *mode)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->dev);
>  	struct intel_connector *intel_connector = to_intel_connector(connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
> index e8ba4ccd99d3c76e220415a3bb638c87689f6dca..89c7166a3860bb76b19e0afac1ce047f70cc0630 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> @@ -165,7 +165,7 @@ enum drm_panel_orientation
>  intel_dsi_get_panel_orientation(struct intel_connector *connector);
>  int intel_dsi_get_modes(struct drm_connector *connector);
>  enum drm_mode_status intel_dsi_mode_valid(struct drm_connector *connector,
> -					  struct drm_display_mode *mode);
> +					  const struct drm_display_mode *mode);
>  struct intel_dsi_host *intel_dsi_host_init(struct intel_dsi *intel_dsi,
>  					   const struct mipi_dsi_host_ops *funcs,
>  					   enum port port);
> diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
> index 9508ceae0d846c3a8255653b38ebbcb5dc4bc233..2ecbad6f41a5ad64f7aa7fab50cbf20eda4efde2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_dvo.c
> @@ -217,7 +217,7 @@ static void intel_enable_dvo(struct intel_atomic_state *state,
>  
>  static enum drm_mode_status
>  intel_dvo_mode_valid(struct drm_connector *_connector,
> -		     struct drm_display_mode *mode)
> +		     const struct drm_display_mode *mode)
>  {
>  	struct intel_connector *connector = to_intel_connector(_connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> index 4bf476656b8cd2eb6c401fbc2101006c0927df24..d20667870e50f00356b5c1cf6f87c481916d23f0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> +++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> @@ -71,7 +71,7 @@ struct intel_dvo_dev_ops {
>  	 * \return MODE_OK if the mode is valid, or another MODE_* otherwise.
>  	 */
>  	enum drm_mode_status (*mode_valid)(struct intel_dvo_device *dvo,
> -					   struct drm_display_mode *mode);
> +					   const struct drm_display_mode *mode);
>  
>  	/*
>  	 * Callback for setting up a video mode after fixups have been made.
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 72ac910bf6ec4baf440e24d91e43b2217e67451e..848aebaa6b08bbb8b1defaede7aa5ae98a2c35f3 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2000,7 +2000,7 @@ intel_hdmi_mode_clock_valid(struct drm_connector *connector, int clock,
>  
>  static enum drm_mode_status
>  intel_hdmi_mode_valid(struct drm_connector *connector,
> -		      struct drm_display_mode *mode)
> +		      const struct drm_display_mode *mode)
>  {
>  	struct intel_display *display = to_intel_display(connector->dev);
>  	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
> diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
> index 5f753ee743c610cd2408fcc926a3cda178ef4c00..6928ae41a36f359cf920df284b128ade7e653368 100644
> --- a/drivers/gpu/drm/i915/display/intel_lvds.c
> +++ b/drivers/gpu/drm/i915/display/intel_lvds.c
> @@ -388,7 +388,7 @@ static void intel_lvds_shutdown(struct intel_encoder *encoder)
>  
>  static enum drm_mode_status
>  intel_lvds_mode_valid(struct drm_connector *_connector,
> -		      struct drm_display_mode *mode)
> +		      const struct drm_display_mode *mode)
>  {
>  	struct intel_connector *connector = to_intel_connector(_connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index b83bf813677d53194af97dcbccaf10bd00fa0147..03a3b83c5dbac9c4b7a458b65c066072e856b08f 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -1938,7 +1938,7 @@ static void intel_enable_sdvo(struct intel_atomic_state *state,
>  
>  static enum drm_mode_status
>  intel_sdvo_mode_valid(struct drm_connector *connector,
> -		      struct drm_display_mode *mode)
> +		      const struct drm_display_mode *mode)
>  {
>  	struct drm_i915_private *i915 = to_i915(connector->dev);
>  	struct intel_sdvo *intel_sdvo = intel_attached_sdvo(to_intel_connector(connector));
> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> index e40aff490486336c8f7399c9e81795aff40b5e40..104a928b8249064bd77fe65f81c1332254656d21 100644
> --- a/drivers/gpu/drm/i915/display/intel_tv.c
> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> @@ -957,7 +957,7 @@ static const struct tv_mode *intel_tv_mode_find(const struct drm_connector_state
>  
>  static enum drm_mode_status
>  intel_tv_mode_valid(struct drm_connector *connector,
> -		    struct drm_display_mode *mode)
> +		    const struct drm_display_mode *mode)
>  {
>  	struct intel_display *display = to_intel_display(connector->dev);
>  	struct drm_i915_private *i915 = to_i915(connector->dev);
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 32d15bd9a358350694503cee5f4c0632c4d6cd6e..3a9332f2c91300183709e14286e509d7a8d22f55 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1541,7 +1541,7 @@ static const struct drm_encoder_funcs intel_dsi_funcs = {
>  };
>  
>  static enum drm_mode_status vlv_dsi_mode_valid(struct drm_connector *connector,
> -					       struct drm_display_mode *mode)
> +					       const struct drm_display_mode *mode)
>  {
>  	struct drm_i915_private *i915 = to_i915(connector->dev);
>  
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> index d46d07d25f51795b1a569adafb51b9896e0b77d4..bdebd11cb7b1f534ac9f5a6613ded195c789e132 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> @@ -217,7 +217,7 @@ static int imx_tve_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  imx_tve_connector_mode_valid(struct drm_connector *connector,
> -			     struct drm_display_mode *mode)
> +			     const struct drm_display_mode *mode)
>  {
>  	struct imx_tve *tve = con_to_tve(connector);
>  	unsigned long rate;
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> index 7444b75c4215794f544553d7dee552718dad947d..52e728181b523cc3380d7718b5956e7e2dbd4cad 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> @@ -58,7 +58,7 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
> -			       struct drm_display_mode *mode)
> +			       const struct drm_display_mode *mode)
>  {
>  	struct mdp4_lvds_connector *mdp4_lvds_connector =
>  			to_mdp4_lvds_connector(connector);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index eed579a6c858b658e0ce4c90670c057bd05d27e4..ad88041a1c75e1bc4872b64c219d375a47deda74 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1142,7 +1142,7 @@ nv50_mstc_atomic_best_encoder(struct drm_connector *connector,
>  
>  static enum drm_mode_status
>  nv50_mstc_mode_valid(struct drm_connector *connector,
> -		     struct drm_display_mode *mode)
> +		     const struct drm_display_mode *mode)
>  {
>  	struct nv50_mstc *mstc = nv50_mstc(connector);
>  	struct nouveau_encoder *outp = mstc->mstm->outp;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 8d5c9c74cbb90927036cee75f173f687617f14ec..2d26784bde74c0909ad69af61166821a7f3c114d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1074,7 +1074,7 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  nouveau_connector_mode_valid(struct drm_connector *connector,
> -			     struct drm_display_mode *mode)
> +			     const struct drm_display_mode *mode)
>  {
>  	struct nouveau_connector *nv_connector = nouveau_connector(connector);
>  	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index bc24af08dfcd559e77e0e48aef140b714a992976..70aff64ced87a09fd6f678ad9d794e875d2c8353 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1044,7 +1044,7 @@ static int qxl_conn_get_modes(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status qxl_conn_mode_valid(struct drm_connector *connector,
> -			       struct drm_display_mode *mode)
> +			       const struct drm_display_mode *mode)
>  {
>  	struct drm_device *ddev = connector->dev;
>  	struct qxl_device *qdev = to_qxl(ddev);
> diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
> index 6328627b7c342cefb2f0b2c3aafcb688f2db4482..fa78824931cc428b1f9e23fe8f98867136ef9883 100644
> --- a/drivers/gpu/drm/radeon/atombios_dp.c
> +++ b/drivers/gpu/drm/radeon/atombios_dp.c
> @@ -467,7 +467,7 @@ void radeon_dp_set_link_config(struct drm_connector *connector,
>  }
>  
>  int radeon_dp_mode_valid_helper(struct drm_connector *connector,
> -				struct drm_display_mode *mode)
> +				const struct drm_display_mode *mode)
>  {
>  	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
>  	struct radeon_connector_atom_dig *dig_connector;
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index f9c73c55f04f76ed5c78e9169004f8a7dea6004e..3ec58df0f534afcad09a161fe643bd47c3ca1c7a 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -806,7 +806,7 @@ static int radeon_lvds_get_modes(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status radeon_lvds_mode_valid(struct drm_connector *connector,
> -				  struct drm_display_mode *mode)
> +				  const struct drm_display_mode *mode)
>  {
>  	struct drm_encoder *encoder = radeon_best_single_encoder(connector);
>  
> @@ -968,7 +968,7 @@ static int radeon_vga_get_modes(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status radeon_vga_mode_valid(struct drm_connector *connector,
> -				  struct drm_display_mode *mode)
> +				  const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct radeon_device *rdev = dev->dev_private;
> @@ -1116,7 +1116,7 @@ static int radeon_tv_get_modes(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status radeon_tv_mode_valid(struct drm_connector *connector,
> -				struct drm_display_mode *mode)
> +				const struct drm_display_mode *mode)
>  {
>  	if ((mode->hdisplay > 1024) || (mode->vdisplay > 768))
>  		return MODE_CLOCK_RANGE;
> @@ -1457,7 +1457,7 @@ static void radeon_dvi_force(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connector,
> -				  struct drm_display_mode *mode)
> +				  const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct radeon_device *rdev = dev->dev_private;
> @@ -1733,7 +1733,7 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
>  }
>  
>  static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector,
> -				  struct drm_display_mode *mode)
> +				  const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct radeon_device *rdev = dev->dev_private;
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
> index 4063d3801e819ba2726b63225e5f3f7d85eb760f..3102f6c2d0556210c10feff93f2a7103b10beea4 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -706,7 +706,7 @@ extern int radeon_get_monitor_bpc(struct drm_connector *connector);
>  
>  extern void radeon_connector_hotplug(struct drm_connector *connector);
>  extern int radeon_dp_mode_valid_helper(struct drm_connector *connector,
> -				       struct drm_display_mode *mode);
> +				       const struct drm_display_mode *mode);
>  extern void radeon_dp_set_link_config(struct drm_connector *connector,
>  				      const struct drm_display_mode *mode);
>  extern void radeon_dp_link_train(struct drm_encoder *encoder,
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index f576b1aa86d1434d75b3770e08d91537aca4f5c4..573b84dbea49bb1071bb704560424ed8fad524ea 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -275,7 +275,7 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  cdn_dp_connector_mode_valid(struct drm_connector *connector,
> -			    struct drm_display_mode *mode)
> +			    const struct drm_display_mode *mode)
>  {
>  	struct cdn_dp_device *dp = connector_to_dp(connector);
>  	struct drm_display_info *display_info = &dp->connector.display_info;
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
> index 42ef62aa0a1e078d4b1db93eb20c7cc21054df28..a43cd7953bceb3ad8b179bf1cb952c601988018e 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -471,7 +471,7 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
>  }
>  
>  static enum drm_mode_status inno_hdmi_display_mode_valid(struct inno_hdmi *hdmi,
> -							 struct drm_display_mode *mode)
> +							 const struct drm_display_mode *mode)
>  {
>  	unsigned long mpixelclk, max_tolerance;
>  	long rounded_refclk;
> @@ -577,7 +577,7 @@ static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  inno_hdmi_connector_mode_valid(struct drm_connector *connector,
> -			       struct drm_display_mode *mode)
> +			       const struct drm_display_mode *mode)
>  {
>  	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
>  
> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> index 784de990da1b2c076a7067dcebb6c4a1273a5d5c..fa9da55949a3376fc3df11bd84e4c5f72d6a9063 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> @@ -482,7 +482,7 @@ static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  rk3066_hdmi_connector_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> +				 const struct drm_display_mode *mode)
>  {
>  	u32 vic = drm_match_cea_mode(mode);
>  
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index 68b8197b3dd16713a49d97f91498b686fdda21ec..96913232479bbccaf77dd2b35c1eb615d074689d 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -349,7 +349,7 @@ static int sti_dvo_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  sti_dvo_connector_mode_valid(struct drm_connector *connector,
> -			     struct drm_display_mode *mode)
> +			     const struct drm_display_mode *mode)
>  {
>  	int target = mode->clock * 1000;
>  	int target_min = target - CLK_TOLERANCE_HZ;
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index 829dc4b034e8a79a908bda60485c2b94ef96890c..5ab42574e919faa0b643c4f43a8f1100f98e3b93 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -603,7 +603,7 @@ static int sti_hda_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  sti_hda_connector_mode_valid(struct drm_connector *connector,
> -			     struct drm_display_mode *mode)
> +			     const struct drm_display_mode *mode)
>  {
>  	int target = mode->clock * 1000;
>  	int target_min = target - CLK_TOLERANCE_HZ;
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 847470f747c0efad61c2ebdc3fb3746a7a13a863..58962e8675a8d5860f725b8a17a7d0268f23168c 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1011,7 +1011,7 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  sti_hdmi_connector_mode_valid(struct drm_connector *connector,
> -			      struct drm_display_mode *mode)
> +			      const struct drm_display_mode *mode)
>  {
>  	int target = mode->clock * 1000;
>  	int target_min = target - CLK_TOLERANCE_HZ;
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> index b3649449de3026784ae2f3466906403a0b6e3b47..523d32f31e4e1d45ad33e52b22e88900248d0810 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -207,7 +207,7 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
>  
>  static enum drm_mode_status
>  sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
> -				struct drm_display_mode *mode)
> +				const struct drm_display_mode *mode)
>  {
>  	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
>  							      HDMI_COLORSPACE_RGB);
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index db606e151afc81e26eaacb36a90389acc3b5a1aa..a4f1ba189baa90d15e84de83e8a9f170459bf07c 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -812,7 +812,7 @@ static const struct drm_connector_funcs tegra_dsi_connector_funcs = {
>  
>  static enum drm_mode_status
>  tegra_dsi_connector_mode_valid(struct drm_connector *connector,
> -			       struct drm_display_mode *mode)
> +			       const struct drm_display_mode *mode)
>  {
>  	return MODE_OK;
>  }
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 6bf2dae82ca0510ae36304c077946114fb570390..c4f9a86460dda25891aeb1eddde1d517cf7f44ad 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -1137,7 +1137,7 @@ static const struct drm_connector_funcs tegra_hdmi_connector_funcs = {
>  
>  static enum drm_mode_status
>  tegra_hdmi_connector_mode_valid(struct drm_connector *connector,
> -				struct drm_display_mode *mode)
> +				const struct drm_display_mode *mode)
>  {
>  	struct tegra_output *output = connector_to_output(connector);
>  	struct tegra_hdmi *hdmi = to_hdmi(output);
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index bad3b8fcc72692eaf89fe82e1a0c70abc00a6b79..f85ab0eeeb5f46995323e5c57be0c1bb267cae79 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -1789,7 +1789,7 @@ static int tegra_sor_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  tegra_sor_connector_mode_valid(struct drm_connector *connector,
> -			       struct drm_display_mode *mode)
> +			       const struct drm_display_mode *mode)
>  {
>  	return MODE_OK;
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index ffe1f7d1b911d35b0b3d50f4ae55634786b8bebd..6059e32b86d16263a5425d0f30a4d86ad571f3ed 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -192,7 +192,7 @@ static int vc4_txp_connector_get_modes(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  vc4_txp_connector_mode_valid(struct drm_connector *connector,
> -			     struct drm_display_mode *mode)
> +			     const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_mode_config *mode_config = &dev->mode_config;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index 64baf2f22d9f0566511b38f49a6e3225f2acd9ee..59a45e74a64126e8c7b99462111565499fcd12b0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -189,7 +189,7 @@ static int virtio_gpu_conn_get_modes(struct drm_connector *connector)
>  }
>  
>  static enum drm_mode_status virtio_gpu_conn_mode_valid(struct drm_connector *connector,
> -				      struct drm_display_mode *mode)
> +				      const struct drm_display_mode *mode)
>  {
>  	struct virtio_gpu_output *output =
>  		drm_connector_to_virtio_gpu_output(connector);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index f39bf992364da4c264dbff4d56aeb078ca16be29..9cfaa2c5f096127ac10829a5cef0ac81a89be5a7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2658,7 +2658,7 @@ int vmw_du_helper_plane_update(struct vmw_du_update_plane *update)
>   * Returns MODE_OK on success, or a drm_mode_status error code.
>   */
>  enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
> -					      struct drm_display_mode *mode)
> +					      const struct drm_display_mode *mode)
>  {
>  	enum drm_mode_status ret;
>  	struct drm_device *dev = connector->dev;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> index 2a6c6d6581e02bb51c9d70cef3ddce1a0f9ecd1a..4eab581883e26d339298fb0fb4386e7dc90c1e6e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -435,7 +435,7 @@ int vmw_kms_helper_dirty(struct vmw_private *dev_priv,
>  			 int increment,
>  			 struct vmw_kms_dirty *dirty);
>  enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
> -					      struct drm_display_mode *mode);
> +					      const struct drm_display_mode *mode);
>  int vmw_connector_get_modes(struct drm_connector *connector);
>  
>  void vmw_kms_helper_validation_finish(struct vmw_private *dev_priv,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index 82d18b88f4a7e7aaff2d7123fce1af05754e34d9..cbec3b244eb5483f678f7711d56eeedfed47841b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -839,7 +839,7 @@ static void vmw_stdu_connector_destroy(struct drm_connector *connector)
>  
>  static enum drm_mode_status
>  vmw_stdu_connector_mode_valid(struct drm_connector *connector,
> -			      struct drm_display_mode *mode)
> +			      const struct drm_display_mode *mode)
>  {
>  	enum drm_mode_status ret;
>  	struct drm_device *dev = connector->dev;
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index fa9ee6a128bec0205f501df6f7634757f5fcb9ee..b62f41f489625e5177bdc05eef950e6c18c219fd 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -967,7 +967,7 @@ struct drm_connector_helper_funcs {
>  	 * drm_mode_status.
>  	 */
>  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
> -					   struct drm_display_mode *mode);
> +					   const struct drm_display_mode *mode);
>  
>  	/**
>  	 * @mode_valid_ctx:
> 
> -- 
> 2.39.5
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
