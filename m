Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334E88D7122
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 18:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A619F890BB;
	Sat,  1 Jun 2024 16:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DOHaOVE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2A510E1A3
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 16:32:37 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52b8b7b8698so1895120e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717259556; x=1717864356; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HeNWgTvWB9NOiq+Vqu2GBpsAJX9qGaBSyXZdTFfGgGw=;
 b=DOHaOVE2QFqgwu8Q/74qB2aDefCm6LX88bubQBczCJj70ApVQBVjxru77Soo4L49lG
 vKE+qaHPrSTmuAy5a6iBcJC9ALLA/rZcFxKQGG25qohU2xSEJ2ZKrLAeW/yExRH3aAr7
 e6fWbc/5Vnpro7LpGaRuPGATD8bMR0Um1vJ8YINYX4MrfJU7ViwlV7bsJBb+eqrA5/d3
 PUZWWmDQ5fXwQvRrhxIln0aXOMQ/ajnhgxJYBGjZ3ujMYyZp3M/YYNQhgmywwwB0XU7s
 8E20CMqQmK/8PWIG5i5CzYqD9ec3QFWyOHPys0HrGQe9O+aqYOuPExnGmTgi+JABe71Z
 SJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717259556; x=1717864356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HeNWgTvWB9NOiq+Vqu2GBpsAJX9qGaBSyXZdTFfGgGw=;
 b=oaFTKvYaI+V5P2ozriY8zBXBkeXB00Dap9VeIEiiLR/loek0Pu+KDYwsSTg9af9ops
 +DFuUNHVJMyD58oIO99YPd2jBQX9hPNTTk5Ke5HlF7XZLwQ9gceq+82Kz2l3elkGPSwP
 nBfwKwmAiqy4BrW6WaQQ/WmBVu4gLgb6sYNgSMVgbLu69x5fBPdlSV6H4qdkQyhSmTeJ
 0kKfRmg6DKEPru8H/Duapi0+JBPXUeA5cFsW/LNyPqvqXDwRxjVYJZ7s0CrUiYAcrH/b
 NxbNDcPUepTYVgn+aCW2O42x4YJyVuw6juh61um3aYzQJb42zl272aIq/y3fvXzKYtaZ
 1yHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcv6891Z/zYXIxE7nV9ENvOAnlW3L1/bKptP4kw5eegonlBhfPL0y71l5Y+KgZGDg1xnWJ1bM/bFtuVOpMs+xFvEgMZrKxcguI2lp1CMWi
X-Gm-Message-State: AOJu0YzqvW+vaFy+Ap7wco6Ye1/JrugvYcVylzgOIi5TirifYcDFhndz
 F5QLpXVjTIj3TlvBypDKqfnrZIhP+D1nGxrx9gFqykGcZ9k1wOg3lK0V3jugXLE=
X-Google-Smtp-Source: AGHT+IEGq9nFbnbn3YZLDr5pbWxznGwX+oNfINNXl+JWzilp9OJBdS+502iu7P5yQzsdmL9dipjc6g==
X-Received: by 2002:ac2:518f:0:b0:529:a646:932b with SMTP id
 2adb3069b0e04-52b8956c4dbmr3060104e87.20.1717259555422; 
 Sat, 01 Jun 2024 09:32:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3eb89sm713308e87.70.2024.06.01.09.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 09:32:35 -0700 (PDT)
Date: Sat, 1 Jun 2024 19:32:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Yao <markyao0591@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI
 TX Controller
Message-ID: <a5jlj5hncv2p7lxk6pbgynkqfovlg3lzz2muzrbrkd73afiopu@n5tmd4zfyeik>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
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

On Sat, Jun 01, 2024 at 04:12:22PM +0300, Cristian Ciocaltea wrote:
> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
> 
> It is HDMI 2.1 compliant and supports the following features, among
> others:
> 
> * Fixed Rate Link (FRL)
> * 4K@120Hz and 8K@60Hz video modes
> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
> * Fast Vactive (FVA)
> * SCDC I2C DDC access
> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
> * Multi-stream audio
> * Enhanced Audio Return Channel (EARC)

It would be really nice if you can take a look at using the HDMI
connector framework (landed few days ago) with adaptations for the
drm_bridge / drm_bridge_connector ([1]). Your comments for the
drm_bridge patches would be defeinitely appreciated.

[1] https://lore.kernel.org/dri-devel/20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org/

> 
> This is the last required component that needs to be supported in order
> to enable the HDMI output functionality on the RK3588 based SBCs, such
> as the RADXA Rock 5B. The other components are the Video Output
> Processor (VOP2) and the Samsung IP based HDMI/eDP TX Combo PHY, for
> which basic support has been already made available via [1] and [2],
> respectively.
> 
> The patches are grouped as follows:
> * PATCH 1..7: DW HDMI TX driver refactor to minimize code duplication in
>   the new QP driver (no functional changes intended)
> 
> * PATCH 8..11: Rockchip DW HDMI glue driver cleanup/improvements (no
>   functional changes intended)
> 
> * PATCH 12..13: The new DW HDMI QP TX driver reusing the previously
>   exported functions and structs from existing DW HDMI TX driver
> 
> * PATCH 14: Rockchip DW HDMI glue driver update to support RK3588 and
>   make use of DW HDMI QP TX
> 
> They provide just the basic HDMI support for now, i.e. RGB output up to
> 4K@60Hz, without audio, CEC or any of the HDMI 2.1 specific features.
> Also note the vop2 driver is currently not able to properly handle all
> display modes supported by the connected screens, e.g. it doesn't cope
> with non-integer refresh rates.
> 
> A possible workaround consists of enabling the display controller to
> make use of the clock provided by the HDMI PHY PLL. This is still work
> in progress and will be submitted later, as well as the required DTS
> updates.
> 
> To facilitate testing and experimentation, all HDMI output related
> patches, including those part of this series, are available at [3].
> So far I could only verify this on the RADXA Rock 3A and 5B boards.
> 
> Thanks,
> Cristian
> 
> [1]: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> [2]: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
> [3]: https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-v6.10-rc1
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (14):
>       drm/bridge: dw-hdmi: Simplify clock handling
>       drm/bridge: dw-hdmi: Add dw-hdmi-common.h header
>       drm/bridge: dw-hdmi: Commonize dw_hdmi_i2c_adapter()
>       drm/bridge: dw-hdmi: Factor out AVI infoframe setup
>       drm/bridge: dw-hdmi: Factor out vmode setup
>       drm/bridge: dw-hdmi: Factor out hdmi_data_info setup
>       drm/bridge: dw-hdmi: Commonize dw_hdmi_connector_create()
>       drm/rockchip: dw_hdmi: Use modern drm_device based logging
>       drm/rockchip: dw_hdmi: Simplify clock handling
>       drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
>       drm/rockchip: dw_hdmi: Drop superfluous assignments of mpll_cfg, cur_ctr and phy_config
>       dt-bindings: display: rockchip,dw-hdmi: Add compatible for RK3588
>       drm/bridge: synopsys: Add DW HDMI QP TX controller driver
>       drm/rockchip: dw_hdmi: Add basic RK3588 support
> 
>  .../display/rockchip/rockchip,dw-hdmi.yaml         | 127 +++-
>  drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h   | 179 +++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 787 +++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       | 831 +++++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 353 +++------
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 351 +++++++--
>  include/drm/bridge/dw_hdmi.h                       |   8 +
>  8 files changed, 2290 insertions(+), 348 deletions(-)
> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> change-id: 20240601-b4-rk3588-bridge-upstream-a27baff1b8fc
> 

-- 
With best wishes
Dmitry
