Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07301443EFD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 10:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FAE73387;
	Wed,  3 Nov 2021 09:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA88F7336C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 09:08:07 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso3995342wmd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eFr0MuK80sKSXpSZTrUSk/rMt2BKi1X4nDoh2mUFIHY=;
 b=uRyskjYqUvgMOoiU+1zlKsd9kv5YpO3lo1A9csznrYcKjUku7eQdnf3D5ZDrb/dwKq
 zhr99WsHvAUVD9YpRRmoTzZhT2T5akTvwbgcWuT2m4QKuK2XBjN8U9tDkELNnuWHdQgC
 lytbElbu9WlBOcypjL5G7C0QQ+Y7J+4pO8UDvG6dzY1QhNjsofgizCQk5PicG6wTEtZ+
 5Y4ls/pZ2soaDE99YDNXiioPvSd30HnOy1CjrK21t0HZAzdOyAgkHLNcqitOQ3o7cNlk
 KoFPIFG3TywvwNvHs/iYC5gJ7MH16RbWdngvVzG/RF9Qct/Ij0lSmgMVrgT2UQK+vbJA
 osBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eFr0MuK80sKSXpSZTrUSk/rMt2BKi1X4nDoh2mUFIHY=;
 b=sgk0gO4VVNjavOlS0jMgWhgSuzB10hXcQ2Kx8gccW08qZMmUUaJ878X18kShlzV8ow
 CApQKkiQG0KBh+M+zX0YHbQWEchFe3zrXzHxV8U+kQMmm7/t1YH6ptKEyFo9S+PQm6Fg
 he/T7530gaip/NKky8+E/RQZYaBM3zvHT/oM5JrlDrfcHVedTX82RLrZ0YZHUX+rb8HO
 QssqFnRdmECgergXyZQFxv+AlZr9u/2qStxz+YMimyTYt6ohg7Ji/sYndxV2U9kjsR8M
 z8Ekq6erZ7FU0jkOA6zf7vI4D5ISbDOhtD3n4I80m+KvvUrhguAn3OUeEAdvDeygkrUH
 f7OQ==
X-Gm-Message-State: AOAM5337ZoSJuqP1/kzvEZlUf7lgjD5fkSY8TNREVOynWBOSA2JImJl3
 R/kkKoIR9x0Tah7dk7J1PPc+jQ==
X-Google-Smtp-Source: ABdhPJyrv1rX0YZQOr2V4htvr1foMnpLq2JA5R60y4Kzi7A1xCjWBzT8xCEKS+ChoNgoJej+8prcPQ==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr14026261wmk.40.1635930484902; 
 Wed, 03 Nov 2021 02:08:04 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:aeb4:bd52:fec9:f300?
 ([2001:861:44c0:66c0:aeb4:bd52:fec9:f300])
 by smtp.gmail.com with ESMTPSA id r10sm1340427wrl.92.2021.11.03.02.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 02:08:04 -0700 (PDT)
Subject: Re: [PATCH 01/13] drm/connector: Add define for HDMI 1.4 Maximum
 Pixel Rate
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-2-maxime@cerno.tech>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <484395cc-8b47-7dec-71a0-707cc5d18cdf@baylibre.com>
Date: Wed, 3 Nov 2021 10:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102145944.259181-2-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Robert Foss <robert.foss@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2021 15:59, Maxime Ripard wrote:
> A lot of drivers open-code the HDMI 1.4 maximum pixel rate in their
> driver to test whether the resolutions are supported or if the
> scrambling needs to be enabled.
> 
> Let's create a common define for everyone to use it.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  | 4 ++--
>  drivers/gpu/drm/drm_edid.c                 | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c  | 2 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c      | 4 ++--
>  drivers/gpu/drm/radeon/radeon_encoders.c   | 2 +-
>  drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c | 2 +-
>  drivers/gpu/drm/tegra/sor.c                | 8 ++++----
>  drivers/gpu/drm/vc4/vc4_hdmi.c             | 4 ++--
>  include/drm/drm_connector.h                | 2 ++
>  9 files changed, 16 insertions(+), 14 deletions(-)

For meson & bridge/synopsys/dw-hdmi:

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 62ae63565d3a..3a58db357be0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -46,7 +46,7 @@
>  /* DW-HDMI Controller >= 0x200a are at least compliant with SCDC version 1 */
>  #define SCDC_MIN_SOURCE_VERSION	0x1
>  
> -#define HDMI14_MAX_TMDSCLK	340000000
> +#define HDMI14_MAX_TMDSCLK	(DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)
>  
>  enum hdmi_datamap {
>  	RGB444_8B = 0x01,
> @@ -1264,7 +1264,7 @@ static bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi,
>  	 * for low rates is not supported either
>  	 */
>  	if (!display->hdmi.scdc.scrambling.low_rates &&
> -	    display->max_tmds_clock <= 340000)
> +	    display->max_tmds_clock <= DRM_HDMI_14_MAX_TMDS_CLK_KHZ)
>  		return false;
>  
>  	return true;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 7aa2a56a71c8..ec8fb2d098ae 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4966,7 +4966,7 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
>  		u32 max_tmds_clock = hf_vsdb[5] * 5000;
>  		struct drm_scdc *scdc = &hdmi->scdc;
>  
> -		if (max_tmds_clock > 340000) {
> +		if (max_tmds_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
>  			display->max_tmds_clock = max_tmds_clock;
>  			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
>  				display->max_tmds_clock);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index d2e61f6c6e08..0666203d52b7 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2226,7 +2226,7 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
>  		if (scdc->scrambling.low_rates)
>  			pipe_config->hdmi_scrambling = true;
>  
> -		if (pipe_config->port_clock > 340000) {
> +		if (pipe_config->port_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
>  			pipe_config->hdmi_scrambling = true;
>  			pipe_config->hdmi_high_tmds_clock_ratio = true;
>  		}
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 0afbd1e70bfc..8078667aea0e 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -434,7 +434,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>  		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
>  
>  	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
> -			 mode->clock > 340000 ? 40 : 10);
> +			 mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ ? 40 : 10);
>  
>  	/* Enable clocks */
>  	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
> @@ -457,7 +457,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>  	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>  
>  	/* TMDS pattern setup */
> -	if (mode->clock > 340000 &&
> +	if (mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ &&
>  	    dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_YUV8_1X24) {
>  		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
>  				  0);
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
> index 46549d5179ee..ddd8100e699f 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -384,7 +384,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
>  		if (radeon_connector->use_digital) {
>  			/* HDMI 1.3 supports up to 340 Mhz over single link */
>  			if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> -				if (pixel_clock > 340000)
> +				if (pixel_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ)
>  					return true;
>  				else
>  					return false;
> diff --git a/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c b/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c
> index d25ecd4f4b67..bc213232a875 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c
> @@ -102,7 +102,7 @@ static bool sti_hdmi_tx3g4c28phy_start(struct sti_hdmi *hdmi)
>  	tmdsck = ckpxpll;
>  	pllctrl |= 40 << PLL_CFG_NDIV_SHIFT;
>  
> -	if (tmdsck > 340000000) {
> +	if (tmdsck > (DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)) {
>  		DRM_ERROR("output TMDS clock (%d) out of range\n", tmdsck);
>  		goto err;
>  	}
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 0ea320c1092b..99a2d627bfeb 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -1814,7 +1814,7 @@ tegra_sor_encoder_atomic_check(struct drm_encoder *encoder,
>  	 * For HBR2 modes, the SOR brick needs to use the x20 multiplier, so
>  	 * the pixel clock must be corrected accordingly.
>  	 */
> -	if (pclk >= 340000000) {
> +	if (pclk >= (DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)) {
>  		state->link_speed = 20;
>  		state->pclk = pclk / 2;
>  	} else {
> @@ -2196,7 +2196,7 @@ static void tegra_sor_hdmi_scdc_start(struct tegra_sor *sor)
>  
>  	mode = &sor->output.encoder.crtc->state->adjusted_mode;
>  
> -	if (mode->clock >= 340000 && scdc->supported) {
> +	if (mode->clock >= DRM_HDMI_14_MAX_TMDS_CLK_KHZ && scdc->supported) {
>  		schedule_delayed_work(&sor->scdc, msecs_to_jiffies(5000));
>  		tegra_sor_hdmi_scdc_enable(sor);
>  		sor->scdc_enabled = true;
> @@ -2340,7 +2340,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>  	value &= ~SOR_CLK_CNTRL_DP_LINK_SPEED_MASK;
>  	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
>  
> -	if (mode->clock < 340000) {
> +	if (mode->clock < DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
>  		DRM_DEBUG_KMS("setting 2.7 GHz link speed\n");
>  		value |= SOR_CLK_CNTRL_DP_LINK_SPEED_G2_70;
>  	} else {
> @@ -2423,7 +2423,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>  	/* adjust clock rate for HDMI 2.0 modes */
>  	rate = clk_get_rate(sor->clk_parent);
>  
> -	if (mode->clock >= 340000)
> +	if (mode->clock >= DRM_HDMI_14_MAX_TMDS_CLK_KHZ)
>  		rate /= 2;
>  
>  	DRM_DEBUG_KMS("setting clock to %lu Hz, mode: %lu Hz\n", rate, pclk);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index fab9b93e1b84..fc7247cc1022 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -97,11 +97,11 @@
>  #define HSM_MIN_CLOCK_FREQ	120000000
>  #define CEC_CLOCK_FREQ 40000
>  
> -#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
> +#define HDMI_14_MAX_TMDS_CLK	(DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)
>  
>  static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
>  {
> -	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
> +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
>  }
>  
>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b501d0badaea..030636635af1 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -260,6 +260,8 @@ struct drm_hdmi_info {
>  	struct drm_hdmi_dsc_cap dsc_cap;
>  };
>  
> +#define DRM_HDMI_14_MAX_TMDS_CLK_KHZ	(340 * 1000)
> +
>  /**
>   * enum drm_link_status - connector's link_status property value
>   *
> 

