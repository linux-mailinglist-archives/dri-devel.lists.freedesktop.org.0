Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4381313FD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 15:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F066E45E;
	Mon,  6 Jan 2020 14:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E225189FE6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 14:46:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u2so15506343wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 06:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QvKYwFfhq7GRYirkEDF3h61x8EPumyfDioiDaywo8tA=;
 b=L05f8mXw0NEfsnvTh1sEajmBcDeIG6Ura/7/pVR54LXeNFET6sycKoOyIAiFtcUb5d
 habdp4LNVYkyKQICDr/uUjzw1cnv7xqJuH+HCl6HKbNK7WsOrw1aUPowJC+N0FO0p/i1
 CVULFM5uAOXoXYhc7+QQBV5C+OhWCY26eq2Z10hMfeORE0x7aP08Q6VTxV1VrDsxiphW
 ws6L/dFWhguYJgqZz63e6aH1e8U2pN5uwYYX7NQdQq6FS04UroUCU8QICpXMalXS8DAt
 csyatTAGaR05auYz9A6bqLcrRwANurRaa7AwgNR0B9754d1xL5GTHznEjRaRxtmNnG9T
 ZDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QvKYwFfhq7GRYirkEDF3h61x8EPumyfDioiDaywo8tA=;
 b=i4WKO6RbF1de4q0upfz4zEcUF9x61xPlaKaGQOdP7pV21XVOBg7xbfOEl2K/syatxb
 aS5rPYnDHqjPZxu19RGhS0VGUsfidW1c+GqEEDFqWaI+IZIHbn6MsEUaFby/Rdos5sG5
 Wm/0NUIR8aav2hpS+ObGlLMAcKG8a9TjWVByNrEBLGsfZJUkRDFHp4RRTcG6EJ9150qf
 SQdTfTKxJbxbIjBybcaxxrAOjytsDkdkD1Mi0SzVruBL0vyJjsgocuVYU6DA2iSaH/tO
 SX7ZPEdRvUX1RFQpTxMViNWVhTIN6DFJMN1vkqdJLXsiDFfzbXKuB7ylUFaocHoNrpoj
 R4dA==
X-Gm-Message-State: APjAAAVoOv8f06DJkfAVo/4QLb51uoMHf17Hx32lr9j0MZqK7PbVT+My
 zuk9qfqNys3/cFn2vEJ1RpQjnBBzYmAvKA==
X-Google-Smtp-Source: APXvYqxAb07Oal4mH/oPmXls1nQJQhfu14sgzWHQeNkHCgrx10cnIc/u56JgLIKw7BwxyEVB5Iz/PA==
X-Received: by 2002:a05:600c:305:: with SMTP id
 q5mr35853733wmd.167.1578321960910; 
 Mon, 06 Jan 2020 06:46:00 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h2sm78267372wrt.45.2020.01.06.06.46.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 06:46:00 -0800 (PST)
Subject: Re: [PATCH v4 00/51] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
To: dri-devel@lists.freedesktop.org
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <e3df30e4-7336-cb16-aa98-0e609cdfb5ce@baylibre.com>
Date: Mon, 6 Jan 2020 15:45:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 19/12/2019 11:44, Laurent Pinchart wrote:
> Hello,
> 
> This patch series is the fourth attempt to (nearly, see [1]) complete the
> rework of the omapdrm driver to move to drm_bridge and drm_panel.
> 
> Versions, available at [2], explains in its long cover letter the
> rationale for the changes. I won't duplicate it here as it is still
> valid as-is.
> 
> Compared to v3, this version has been rebased on top of drm-misc-next,
> minor issues reported during review have been fixed, and tags collected.
> 
> There is however still one major open issue in the way hotplug detection
> and notification is handled. This has been discussed in length with
> Andrzej and Daniel in [3] (where we have competed for the largest number
> of quote levels in an e-mail, and may have won). I do agree with some of
> the points they have raised, but I would like to propose addressing them
> on top of this series.
> 
> The rationale for this proposal is as follows. Hotplug notification is
> an area that hasn't received enough love, and there is quite a lot of
> work there to fix the world. The code in this series has already been
> reworked to decouple the notification mechanism from both the producers
> (as in bridges) and consumers (as in other bridges) of hotplug events,
> isolating the implementation of the mechanism in drm_bridge.c and
> drm_bridge_connector.c.
> 
> The implementation has known shortcomings in that it doesn't support
> blocking hotplug notifications along the chain of bridges, or native
> notification of encoders or DRM devices. While those are valid concerns,
> I'm worried that fixing them as part of this series would not only
> massively delay the other parts, but would also have no user as I have
> no use case for these features. The implementation would then be largely
> untested, and very likely fail to test of real users.
> 
> For these reasons I would like to improve the hotplug notification
> mechanism on top of this series, when someone will hit for real the
> issues that have been previously raised. If that person isn't me, I am
> willing to help them solve the problems at that point.
> 
> The patches can be found at
> 
>         git://linuxtv.org/pinchartl/media.git omapdrm/bridge/devel
> 
> [1] The only notable exception is the omapdrm-specific DSI panel driver
> that implements a large number of custom operations. This is being
> addressed separately.
> 
> [2] https://patchwork.kernel.org/cover/11102445/
> 
> [3] https://patchwork.kernel.org/patch/11034193/
> 
> Laurent Pinchart (50):
>   video: hdmi: Change return type of hdmi_avi_infoframe_init() to void
>   drm/connector: Add helper to get a connector type name
>   drm/edid: Add flag to drm_display_info to identify HDMI sinks
>   drm/bridge: Add connector-related bridge operations and data
>   drm/bridge: Extend bridge API to disable connector creation
>   drm/bridge: dumb-vga-dac: Rename internal symbols to simple-bridge
>   drm/bridge: dumb-vga-dac: Rename driver to simple-bridge
>   drm/bridge: simple-bridge: Add support for non-VGA bridges
>   drm/bridge: simple-bridge: Add support for enable GPIO
>   drm/bridge: simple-bridge: Add support for the TI OPA362
>   drm/bridge: Add bridge driver for display connectors
>   drm/bridge: Add driver for the TI TPD12S015 HDMI level shifter
>   drm/bridge: panel: Implement bridge connector operations
>   drm/bridge: tfp410: Replace manual connector handling with bridge
>   drm/bridge: tfp410: Allow operation without drm_connector
>   drm: Add helper to create a connector for a chain of bridges
>   drm/omap: dss: Cleanup DSS ports on initialisation failure
>   drm/omap: Simplify HDMI mode and infoframe configuration
>   drm/omap: Factor out display type to connector type conversion
>   drm/omap: Use the drm_panel_bridge API
>   drm/omap: dss: Fix output next device lookup in DT
>   drm/omap: Add infrastructure to support drm_bridge local to DSS
>     outputs
>   drm/omap: dss: Make omap_dss_device_ops optional
>   drm/omap: hdmi: Allocate EDID in the .read_edid() operation
>   drm/omap: hdmi4: Rework EDID read to isolate data read
>   drm/omap: hdmi5: Rework EDID read to isolate data read
>   drm/omap: hdmi4: Register a drm_bridge for EDID read
>   drm/omap: hdmi5: Register a drm_bridge for EDID read
>   drm/omap: hdmi4: Move mode set, enable and disable operations to
>     bridge
>   drm/omap: hdmi5: Move mode set, enable and disable operations to
>     bridge
>   drm/omap: hdmi4: Implement drm_bridge .hpd_notify() operation
>   drm/omap: dss: Remove .set_hdmi_mode() and .set_infoframe() operations
>   drm/omap: venc: Register a drm_bridge
>   drm/omap: Create connector for bridges
>   drm/omap: Switch the HDMI and VENC outputs to drm_bridge
>   drm/omap: Remove HPD, detect and EDID omapdss operations
>   drm/omap: hdmi: Remove omap_dss_device operations
>   drm/omap: venc: Remove omap_dss_device operations
>   drm/omap: hdmi4: Simplify EDID read
>   drm/omap: hdmi5: Simplify EDID read
>   drm/omap: dpi: Sort includes alphabetically
>   drm/omap: dpi: Reorder functions in sections
>   drm/omap: dpi: Simplify clock setting API
>   drm/omap: dpi: Register a drm_bridge
>   drm/omap: sdi: Sort includes alphabetically
>   drm/omap: sdi: Register a drm_bridge
>   drm/omap: Hardcode omap_connector type to DSI
>   drm/omap: dss: Remove unused omap_dss_device operations
>   drm/omap: dss: Inline the omapdss_display_get() function
>   drm/omap: dss: Remove unused omapdss_of_find_connected_device()
>     function
> 
> Wen Yang (1):
>   drm/omap: Fix possible object reference leak
> 
>  Documentation/gpu/todo.rst                    |  14 +
>  arch/arm/configs/davinci_all_defconfig        |   2 +-
>  arch/arm/configs/integrator_defconfig         |   2 +-
>  arch/arm/configs/multi_v7_defconfig           |   2 +-
>  arch/arm/configs/omap2plus_defconfig          |   7 +-
>  arch/arm/configs/shmobile_defconfig           |   2 +-
>  arch/arm/configs/sunxi_defconfig              |   2 +-
>  arch/arm/configs/versatile_defconfig          |   2 +-
>  drivers/gpu/drm/Makefile                      |   3 +-
>  drivers/gpu/drm/arc/arcpgu_hdmi.c             |   2 +-
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |   2 +-
>  drivers/gpu/drm/bridge/Kconfig                |  29 +-
>  drivers/gpu/drm/bridge/Makefile               |   4 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |   8 +-
>  .../drm/bridge/analogix/analogix-anx6345.c    |   8 +-
>  .../drm/bridge/analogix/analogix-anx78xx.c    |   8 +-
>  .../drm/bridge/analogix/analogix_dp_core.c    |  10 +-
>  drivers/gpu/drm/bridge/cdns-dsi.c             |   6 +-
>  drivers/gpu/drm/bridge/display-connector.c    | 292 ++++++++++++++
>  drivers/gpu/drm/bridge/dumb-vga-dac.c         | 300 --------------
>  drivers/gpu/drm/bridge/lvds-encoder.c         |   5 +-
>  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |   8 +-
>  drivers/gpu/drm/bridge/nxp-ptn3460.c          |   8 +-
>  drivers/gpu/drm/bridge/panel.c                |  17 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c        |   8 +-
>  drivers/gpu/drm/bridge/sii902x.c              |   8 +-
>  drivers/gpu/drm/bridge/sil-sii8620.c          |   3 +-
>  drivers/gpu/drm/bridge/simple-bridge.c        | 342 ++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  10 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |   8 +-
>  drivers/gpu/drm/bridge/tc358764.c             |   8 +-
>  drivers/gpu/drm/bridge/tc358767.c             |   9 +-
>  drivers/gpu/drm/bridge/thc63lvd1024.c         |   5 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   8 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c            | 222 ++++-------
>  drivers/gpu/drm/bridge/ti-tpd12s015.c         | 211 ++++++++++
>  drivers/gpu/drm/drm_bridge.c                  | 168 +++++++-
>  drivers/gpu/drm/drm_bridge_connector.c        | 373 ++++++++++++++++++
>  drivers/gpu/drm/drm_connector.c               |  15 +
>  drivers/gpu/drm/drm_edid.c                    |  11 +-
>  drivers/gpu/drm/drm_simple_kms_helper.c       |   2 +-
>  drivers/gpu/drm/exynos/exynos_dp.c            |   3 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   4 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c          |   2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c     |   2 +-
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |   2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c             |  10 +-
>  drivers/gpu/drm/imx/imx-ldb.c                 |   2 +-
>  drivers/gpu/drm/imx/parallel-display.c        |   2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +-
>  drivers/gpu/drm/mcde/mcde_dsi.c               |   5 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c            |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |   2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  10 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c         |   4 +-
>  drivers/gpu/drm/msm/edp/edp.c                 |   2 +-
>  drivers/gpu/drm/msm/edp/edp_bridge.c          |   2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.c               |   2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |   2 +-
>  drivers/gpu/drm/omapdrm/displays/Kconfig      |  22 --
>  drivers/gpu/drm/omapdrm/displays/Makefile     |   4 -
>  .../omapdrm/displays/connector-analog-tv.c    |  97 -----
>  .../gpu/drm/omapdrm/displays/connector-hdmi.c | 183 ---------
>  .../gpu/drm/omapdrm/displays/encoder-opa362.c | 137 -------
>  .../drm/omapdrm/displays/encoder-tpd12s015.c  | 217 ----------
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |   2 +-
>  drivers/gpu/drm/omapdrm/dss/Makefile          |   2 +-
>  drivers/gpu/drm/omapdrm/dss/base.c            |  55 +--
>  drivers/gpu/drm/omapdrm/dss/display.c         |   9 -
>  drivers/gpu/drm/omapdrm/dss/dpi.c             | 351 ++++++++--------
>  drivers/gpu/drm/omapdrm/dss/dsi.c             |   4 +-
>  drivers/gpu/drm/omapdrm/dss/dss-of.c          |  28 --
>  drivers/gpu/drm/omapdrm/dss/dss.c             |  46 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi.h            |   4 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c           | 308 ++++++++-------
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c      |  59 +--
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.h      |   4 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c           | 290 +++++++-------
>  drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  48 +--
>  drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |   5 +-
>  .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   9 +-
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  46 +--
>  drivers/gpu/drm/omapdrm/dss/output.c          |  53 ++-
>  drivers/gpu/drm/omapdrm/dss/sdi.c             | 178 ++++++---
>  drivers/gpu/drm/omapdrm/dss/venc.c            | 270 +++++++------
>  drivers/gpu/drm/omapdrm/omap_connector.c      | 247 +-----------
>  drivers/gpu/drm/omapdrm/omap_connector.h      |   3 -
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  88 +++--
>  drivers/gpu/drm/omapdrm/omap_encoder.c        |  83 +---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  11 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c      |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_rgb.c       |   2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                 |   2 +-
>  drivers/gpu/drm/sti/sti_hda.c                 |   2 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                |   2 +-
>  drivers/gpu/drm/stm/ltdc.c                    |   2 +-
>  drivers/gpu/drm/sun4i/sun4i_lvds.c            |   2 +-
>  drivers/gpu/drm/sun4i/sun4i_rgb.c             |   2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_external.c      |   2 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                 |   2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                 |   2 +-
>  drivers/video/hdmi.c                          |  11 +-
>  include/drm/drm_bridge.h                      | 213 +++++++++-
>  include/drm/drm_bridge_connector.h            |  18 +
>  include/drm/drm_connector.h                   |   9 +
>  include/linux/hdmi.h                          |   2 +-
>  107 files changed, 2939 insertions(+), 2415 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/display-connector.c
>  delete mode 100644 drivers/gpu/drm/bridge/dumb-vga-dac.c
>  create mode 100644 drivers/gpu/drm/bridge/simple-bridge.c
>  create mode 100644 drivers/gpu/drm/bridge/ti-tpd12s015.c
>  create mode 100644 drivers/gpu/drm/drm_bridge_connector.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/dss-of.c
>  create mode 100644 include/drm/drm_bridge_connector.h
> 

Tell me how I can help to apply drm/bridge patches

4 to 15 looks ok and are already reviewed, should I apply them ?

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
