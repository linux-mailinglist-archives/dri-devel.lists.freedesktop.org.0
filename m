Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5BA2DA92
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 04:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEFA10E229;
	Sun,  9 Feb 2025 03:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AglOiZXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6210E229
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 03:27:06 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30797730cbdso32046041fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 19:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071625; x=1739676425; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MEMGOzMHg8q4HMuP8Kzf4ro/M59TspTkcMQCU5stT2k=;
 b=AglOiZXp8K4YusPcYZhSu0W0tXZbSKyyiJbzCbkcZfGI8ltXx7ynR47mlD9PznNPmN
 x2GV5KVXoCvfaGnCDpgyi/3wzybfXIluKgJjlWeeP3MBiTtfbrEDhhLVRlC73JbiCv8i
 TLLtOyts3haBObkzU/8IWh+jEy9ESyTwkVjB3RklpaDrLrDfhiATLSRchFTzFqXhwnIl
 Ix7SUpagWhsT+YRSLshcx9DSh6FYukbkOkOKUGFfLeWRiPfD70ahXEY85YQHt0JFJils
 6AhlKdC/GxVEaCI2AAiwZ78eirT+TZnjWmLtQ6gfIqd6zYwSuwF/ezFKz5XQdUdN6dXI
 cxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071625; x=1739676425;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEMGOzMHg8q4HMuP8Kzf4ro/M59TspTkcMQCU5stT2k=;
 b=UyrRY37s9F2F3na2euTCamLm/hjY6PKOwkJc6gwZHV6cZ9Ekdyv/zWqYKh8DtvylmK
 HoM0r7iz2hfBr18d7uSboQmIzORvLb32GbN1fjxXit4x85/Kea4wKoWKe/hCiWziPVZa
 R4GCwLWkI/c5F7w7PUM4ZU9PLqll5i1ae1FFvp/bAt1WCRtmn+husSUtErAV7Pvk93kZ
 DDl8GDPvXrbfTqYQpVS6quaXME4eXVF4zrH3v+pmvu2t9qt5bLhJax95cNfdiksOcmeO
 FGicQxsB4Ainjt03V91E8bVBt2Ol3KurmYDmFg+MDuaFfgBO9xTgAWffWu5DvhfJSUjR
 syjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPtILLzha8do2px04wxQZRMpYoRRpd0Tz8SxDrkuisj75fO2CSirNcpQwbaQlFq3cBLSKuRwb/ME8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym1/5gqmnI9aOlolJVkPDC1FA1hzEDZd7ODqPXWEQt5EVRn0fD
 v0mKFwy82Uc3PcBYHm0Q+PQt253Ar9AuuQgfiYvEgnlRlKlwjkLX5y5bXc7uyaY=
X-Gm-Gg: ASbGnct4beJEINtQOMxljVKXKC3/ZyVDafx4QfS0hcM+crnmU5V3b4gHXQxL9nd64d4
 2zTK9Km90+XNvomqi4/t7V+g9+n/haGtC5LMyGsgPz2b5RdOiTs7RHqZ5N+AOxJvWLIaCVxeZTo
 seiIpwwtt4BRQe2fC7jbF2zklTC/HHEkP0duhkgyIR+QDDJ42aJELOPPU1dNegPw6+znxWAJJmY
 5jmX9He1rfvsy9SI2krYxx0BFzKJeR4jkgAkH94HOutR3y6gq4ixP+Fte/DmQkWBKF//N6uToe6
 /aqYRjQ5IXW+c/dPdH4ZVdn4Xg3du5iHXlokaHQPmT505sp4LAK4T7ond3TlF8du7WVRjOQ=
X-Google-Smtp-Source: AGHT+IHWOaxReu1PjXNDThgwzOdk0tYkcKOZfUsXWgA+tH1ap47fTYHkaH6FCI/c9iY9x2qd2M3TgA==
X-Received: by 2002:a05:651c:b29:b0:302:3ad8:34 with SMTP id
 38308e7fff4ca-307e57ca839mr25888001fa.12.1739071624853; 
 Sat, 08 Feb 2025 19:27:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2bad67sm9037651fa.77.2025.02.08.19.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:27:03 -0800 (PST)
Date: Sun, 9 Feb 2025 05:27:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 00/35] drm/bridge: Various quality of life improvements
Message-ID: <yudkovtipwtnofr3o2qwqrmriwxlczrwploieh5i4ke3sx5zhk@5ktlrew7o6k2>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:28PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's a series of changes after to the KMS helpers and bridge API
> following a bunch of reviews I did.
> 
> It's mostly centered across providing an easier time to deal with bridge
> states, and a somewhat consistent with the other entities API.
> 
> It's build tested only, with arm64 allmodconfig.
> 
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v2:
> - Pass the full atomic state to bridge atomic hooks
> - Make attach take the encoder as a parameter
> - Mark bridge->encoder as deprecated
> - Rework the logic to detect if a bridge uses a state or not at
>   atomic_check time
> - Add lockdep assertion to drm_bridge_get_current_state()
> - Link to v1: https://lore.kernel.org/r/20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org
> 
> ---
> Maxime Ripard (35):
>       drm/atomic: Document history of drm_atomic_state
>       drm/bridge: Pass full state to atomic_pre_enable
>       drm/bridge: Pass full state to atomic_enable
>       drm/bridge: Pass full state to atomic_disable
>       drm/bridge: Pass full state to atomic_post_disable
>       drm/atomic-helper: Fix commit_tail state variable name
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_dependencies()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail_rpm()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_modeset_disables()
>       drm/atomic-helper: Change parameter name of disable_outputs()
>       drm/bridge: Change parameter name of drm_atomic_bridge_chain_disable()
>       drm/bridge: Change parameter name of drm_atomic_bridge_chain_post_disable()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_update_legacy_modeset_state()
>       drm/atomic-helper: Change parameter name of crtc_set_mode()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_planes()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_modeset_enables()
>       drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_enable()
>       drm/bridge: Change parameter name of drm_atomic_bridge_chain_enable()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_writebacks()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_fake_vblank()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_hw_done()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_vblanks()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_cleanup_planes()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_cleanup_done()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_flip_done()

I agree that use of the old_state can be confusing (and it has been
confusing to me for some time). The main question is, do we loose useful
memo 'this is the state after swap'. Most likely it is useless now, just
wanted to give it a second thought.

>       drm/bridge: Add encoder parameter to drm_bridge_funcs.attach
>       drm/bridge: Provide a helper to retrieve current bridge state
>       drm/bridge: Assume that a bridge is atomic if it has atomic_reset
>       drm/bridge: Provide pointers to the connector and crtc in bridge state
>       drm/bridge: Make encoder pointer deprecated
>       drm/bridge: cdns-csi: Switch to atomic helpers
>       drm/bridge: tc358775: Switch to atomic commit
>       drm/bridge: tc358768: Convert to atomic helpers
>       drm/bridge: ti-sn65dsi86: Use bridge_state crtc pointer
> 
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   3 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   3 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   3 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  26 +--
>  drivers/gpu/drm/bridge/analogix/anx7625.c          |  11 +-
>  drivers/gpu/drm/bridge/aux-bridge.c                |   3 +-
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   1 +
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  30 ++-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   6 +-
>  drivers/gpu/drm/bridge/chipone-icn6211.c           |  13 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c           |   5 +-
>  drivers/gpu/drm/bridge/display-connector.c         |   1 +
>  drivers/gpu/drm/bridge/fsl-ldb.c                   |   8 +-
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |   7 +-
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |   2 +-
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   3 +-
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |  10 +-
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |  10 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  21 +-
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   8 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  13 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  11 +-
>  drivers/gpu/drm/bridge/ite-it6263.c                |  18 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                |  10 +-
>  drivers/gpu/drm/bridge/ite-it66121.c               |   8 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c           |   3 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c            |   8 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c            |  21 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
>  drivers/gpu/drm/bridge/lvds-codec.c                |   3 +-
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   1 +
>  drivers/gpu/drm/bridge/microchip-lvds.c            |   3 +-
>  drivers/gpu/drm/bridge/nwl-dsi.c                   |  13 +-
>  drivers/gpu/drm/bridge/nxp-ptn3460.c               |   5 +-
>  drivers/gpu/drm/bridge/panel.c                     |  15 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c             |   1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c             |   7 +-
>  drivers/gpu/drm/bridge/samsung-dsim.c              |  11 +-
>  drivers/gpu/drm/bridge/sii902x.c                   |   9 +-
>  drivers/gpu/drm/bridge/sil-sii8620.c               |   1 +
>  drivers/gpu/drm/bridge/simple-bridge.c             |   5 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   5 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   8 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  11 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  11 +-
>  drivers/gpu/drm/bridge/tc358762.c                  |  12 +-
>  drivers/gpu/drm/bridge/tc358764.c                  |   3 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |  22 +-
>  drivers/gpu/drm/bridge/tc358768.c                  |  33 ++-
>  drivers/gpu/drm/bridge/tc358775.c                  |  39 ++--
>  drivers/gpu/drm/bridge/thc63lvd1024.c              |   3 +-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c               |  10 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  10 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  63 ++++--
>  drivers/gpu/drm/bridge/ti-tdp158.c                 |  12 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c                 |   5 +-
>  drivers/gpu/drm/bridge/ti-tpd12s015.c              |   3 +-
>  drivers/gpu/drm/drm_atomic_helper.c                | 242 ++++++++++-----------
>  drivers/gpu/drm/drm_atomic_state_helper.c          |   5 +
>  drivers/gpu/drm/drm_bridge.c                       |  98 +++------
>  drivers/gpu/drm/i2c/tda998x_drv.c                  |   1 +
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c       |   3 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   9 +-
>  drivers/gpu/drm/mcde/mcde_dsi.c                    |   3 +-
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |   9 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |   3 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  11 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  12 +-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   8 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c          |   8 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   8 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |  28 +--
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  19 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   6 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   3 +-
>  drivers/gpu/drm/omapdrm/dss/dpi.c                  |   3 +-
>  drivers/gpu/drm/omapdrm/dss/dsi.c                  |   3 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                |   8 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                |   8 +-
>  drivers/gpu/drm/omapdrm/dss/sdi.c                  |   3 +-
>  drivers/gpu/drm/omapdrm/dss/venc.c                 |   3 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |   8 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   7 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |   8 +-
>  drivers/gpu/drm/stm/lvds.c                         |  16 +-
>  drivers/gpu/drm/tidss/tidss_encoder.c              |   3 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |  12 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  17 +-
>  drivers/platform/arm64/acer-aspire1-ec.c           |   3 +-
>  include/drm/drm_atomic.h                           |  45 ++++
>  include/drm/drm_bridge.h                           |  39 +++-
>  91 files changed, 681 insertions(+), 574 deletions(-)
> ---
> base-commit: 50d0a57d3a4193862a53fae0de7ed7749908cd8f
> change-id: 20250115-bridge-connector-f93194e267ff
> 
> Best regards,
> -- 
> Maxime Ripard <mripard@kernel.org>
> 

-- 
With best wishes
Dmitry
