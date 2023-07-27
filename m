Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA0765470
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 15:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E207610E577;
	Thu, 27 Jul 2023 13:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2867310E57C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 13:00:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99bded9d93dso11777466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1690462839; x=1691067639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P2/1faPsphhRk/mbQ/+XRjgbLbx1PRn0JYNVa9uID+k=;
 b=g7oQEOj54vzX/thxw02+QyWyGKLMJSfBV9AjgfCJKmOrdGyK4KWzhrPyVbfG03nZRg
 CTFkMuRtpC3hsGoLKJYs0LYdJCQxVV1MxS3Q5V6n/nk32GKFQulX29WAXwtnFMENtuMe
 xUCICjMVMjIFnexT6pNt8JJhf2+co0EQZnXHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690462839; x=1691067639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2/1faPsphhRk/mbQ/+XRjgbLbx1PRn0JYNVa9uID+k=;
 b=fYFwV0MksFMAHMFreMNmVbJcFaLe9seDKRzmpkGkwpCQIy5LUQXbfPIueEWb15YCGB
 QkyjewTnSUFpS0UZqnHW258BhUVnU06P08QXVCPqt3qBHqObEhMMz6ndJIN+EGeaXkBg
 p1K4Zi9OD92ubp9ko+IeRaS5mqlkTIQMqHC/DNmmtrBbrIqw4QJoGVQKCvlYyV4j3gj+
 g2DfRX/jQ8Pan39pVLmOi8tdUHjYjzjYPvpsglHoCMY7E55/e2q2yzwDFAIDHmi0uqS+
 H/9QlCwy1/62YfYEUVgv6rtoF3t/mJ//+JMXNiHexG3YXfC5WqBsvmvi2ejRoIPYZW1A
 04wA==
X-Gm-Message-State: ABy/qLZDVEeXVFJWXxLVw3bZcKWQPxxG8Inb5Ke+eWF8EDbU60m46SYp
 qz+qLysj4Cb18km1X3d1wgEU8KN7A1moSjbYsMA=
X-Google-Smtp-Source: APBJJlEMVwnscCIQANk8s0jbzq1Ab/Nb2drYhLpI7f+sy1UYR9ohCCYMGgThMe0O2LbrWD179EHaBg==
X-Received: by 2002:a17:906:649e:b0:99b:c371:b2d3 with SMTP id
 e30-20020a170906649e00b0099bc371b2d3mr3571993ejm.5.1690462839184; 
 Thu, 27 Jul 2023 06:00:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 va16-20020a17090711d000b009894b476310sm744187ejb.163.2023.07.27.06.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:00:37 -0700 (PDT)
Date: Thu, 27 Jul 2023 15:00:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PULL] drm-misc-next
Message-ID: <ZMJqcwm7e/Fiq3o8@phenom.ffwll.local>
References: <urs7omo5xnhglztxgwgsslws7duqfj4jhzrtppaenuvdh2lwuz@4htm4iiqhkep>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <urs7omo5xnhglztxgwgsslws7duqfj4jhzrtppaenuvdh2lwuz@4htm4iiqhkep>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 04:50:44PM +0200, Maxime Ripard wrote:
> Hi,
> 
> Here's this week drm-misc-next PR
> 
> Thanks!
> Maxime
> 
> The following changes since commit 36672dda2eb715af99e9abbcdc400d46598b691c:
> 
>   drm/loongson: Remove a useless check in cursor_plane_atomic_async_check() (2023-07-13 01:24:42 +0800)
> 
> are available in the Git repository at:
> 
>   ssh://git.freedesktop.org/git/drm/drm-misc tags/drm-misc-next-2023-07-21
> 
> for you to fetch changes up to d281eeaa4de2636ff0c8e6ae387bb07b50e5fcbb:
> 
>   drm: adv7511: Fix low refresh rate register for ADV7533/5 (2023-07-21 13:37:18 +0200)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> drm-misc-next for 6.6:
> 
> UAPI Changes:
>   - syncobj: New DRM_IOCTL_SYNCOBJ_EVENTFD ioctl
> 
> Cross-subsystem Changes:
>   - Converge to use of_device_uevent()
> 
> Core Changes:
>   - GPU VA Manager
>   - improvements to make it clearer that drm_minor_type is uAPI
> 
> Driver Changes:
>   - ssd130x: Improve intermediate buffer size computation
>   - bridges:
>     - adv7511: Fix low refresh rate
>     - anx7625: Switch to macros instead of hardcoded values
>   - panel:
>     - ld9040: Backlight support, magic improved
> 
> ----------------------------------------------------------------
> Bogdan Togorean (1):
>       drm: adv7511: Fix low refresh rate register for ADV7533/5
> 
> Chen-Yu Tsai (2):
>       drm/bridge: anx7625: Use common macros for DP power sequencing commands
>       drm/bridge: anx7625: Use common macros for HDCP capabilities
> 
> Danilo Krummrich (2):
>       drm: manager to keep track of GPUs VA mappings
>       drm: debugfs: provide infrastructure to dump a DRM GPU VA space
> 
> Javier Martinez Canillas (1):
>       drm/ssd130x: Change pixel format used to compute the buffer size
> 
> Marek Vasut (1):
>       drm/panel: simple: Drop prepared_time
> 
> Miquel Raynal (2):
>       of: module: Export of_device_uevent()
>       gpu: host1x: Stop open-coding of_device_uevent()
> 
> Paul Cercueil (2):
>       drm/panel: ld9040: Use better magic values
>       drm/panel: ld9040: Register a backlight device
> 
> Rob Herring (2):
>       gpu/host1x: Explicitly include correct DT includes
>       drm: Explicitly include correct DT includes
> 
> Simon Ser (3):
>       drm/drv: use enum drm_minor_type when appropriate
>       drm/file: use explicit values for enum drm_minor_type
>       drm/syncobj: add IOCTL to register an eventfd
> 
> Steven Price (2):
>       drm: manager: Fix printk format for size_t
>       drm: debugfs: Silence warning from cast
> 
>  Documentation/gpu/drm-mm.rst                       |   36 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |    2 +-
>  drivers/gpu/drm/arm/malidp_drv.c                   |    1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |    1 -
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   11 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c          |   12 +-
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |    3 +-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    1 -
>  drivers/gpu/drm/bridge/chipone-icn6211.c           |    2 +-
>  drivers/gpu/drm/bridge/display-connector.c         |    1 -
>  drivers/gpu/drm/bridge/fsl-ldb.c                   |    1 -
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |    2 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9211.c            |    1 -
>  drivers/gpu/drm/bridge/lvds-codec.c                |    1 -
>  drivers/gpu/drm/bridge/nwl-dsi.c                   |    2 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c             |    1 -
>  drivers/gpu/drm/bridge/samsung-dsim.c              |    3 +-
>  drivers/gpu/drm/bridge/simple-bridge.c             |    3 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    2 +-
>  drivers/gpu/drm/drm_debugfs.c                      |   40 +
>  drivers/gpu/drm/drm_drv.c                          |    8 +-
>  drivers/gpu/drm/drm_gem.c                          |    3 +
>  drivers/gpu/drm/drm_gpuva_mgr.c                    | 1725 ++++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h                     |    2 +
>  drivers/gpu/drm/drm_ioctl.c                        |    2 +
>  drivers/gpu/drm/drm_mipi_dsi.c                     |    1 +
>  drivers/gpu/drm/drm_syncobj.c                      |  148 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    2 +-
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |    2 +-
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c         |    1 -
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    3 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |    1 -
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c        |    2 +-
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c         |    2 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |    2 +-
>  drivers/gpu/drm/exynos/exynos_mixer.c              |    1 -
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    2 +-
>  drivers/gpu/drm/imx/dcss/dcss-dev.c                |    5 +-
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    2 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c              |    2 +-
>  drivers/gpu/drm/lima/lima_drv.c                    |    3 +-
>  drivers/gpu/drm/logicvc/logicvc_drm.c              |    2 +-
>  drivers/gpu/drm/mcde/mcde_drv.c                    |    2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c            |    3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |    3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_color.c          |    3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |    3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |    3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |    3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |    3 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |    1 -
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    3 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c               |    2 +-
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |    3 +-
>  drivers/gpu/drm/meson/meson_drv.h                  |    1 -
>  drivers/gpu/drm/meson/meson_dw_hdmi.c              |    3 +-
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    3 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c          |    1 -
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c         |    4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    2 +
>  drivers/gpu/drm/msm/dp/dp_audio.c                  |    2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 |    2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.c                    |    2 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |    3 +-
>  drivers/gpu/drm/msm/msm_mdss.c                     |    2 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    1 -
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |    3 +-
>  drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |    2 +-
>  drivers/gpu/drm/panel/panel-boe-himax8279d.c       |    1 -
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |    1 -
>  drivers/gpu/drm/panel/panel-dsi-cm.c               |    2 +-
>  drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |    1 -
>  .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |    2 +-
>  drivers/gpu/drm/panel/panel-himax-hx8394.c         |    2 +-
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |    3 +-
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    2 +-
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |    2 +-
>  drivers/gpu/drm/panel/panel-innolux-ej030na.c      |    3 +-
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c      |    1 -
>  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |    2 +-
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |    1 -
>  drivers/gpu/drm/panel/panel-lvds.c                 |    2 +-
>  .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    |    1 -
>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |    2 +-
>  drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |    2 +-
>  drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |    3 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c      |    2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35560.c      |    1 -
>  drivers/gpu/drm/panel/panel-novatek-nt35950.c      |    2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c      |    2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |    1 -
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c      |    1 -
>  drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |    1 -
>  .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |    1 -
>  drivers/gpu/drm/panel/panel-samsung-ld9040.c       |   41 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |    2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |    1 -
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |    2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |    2 +-
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c      |    1 -
>  drivers/gpu/drm/panel/panel-simple.c               |    4 -
>  drivers/gpu/drm/panel/panel-sitronix-st7701.c      |    2 +-
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    2 +-
>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |    1 -
>  drivers/gpu/drm/panel/panel-truly-nt35597.c        |    2 +-
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c            |    3 +-
>  drivers/gpu/drm/pl111/pl111_versatile.c            |    1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |    2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |    2 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c      |    1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |    1 -
>  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c   |    1 -
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    3 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    2 +
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |    3 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    1 -
>  drivers/gpu/drm/solomon/ssd130x.c                  |    2 +-
>  drivers/gpu/drm/sprd/sprd_dpu.c                    |    4 +-
>  drivers/gpu/drm/sprd/sprd_drm.c                    |    3 +-
>  drivers/gpu/drm/sprd/sprd_dsi.c                    |    6 +-
>  drivers/gpu/drm/sti/sti_drv.c                      |    2 +
>  drivers/gpu/drm/stm/drv.c                          |    3 +-
>  drivers/gpu/drm/stm/ltdc.c                         |    1 -
>  drivers/gpu/drm/sun4i/sun4i_frontend.c             |    2 +-
>  drivers/gpu/drm/sun4i/sun4i_frontend.h             |    1 +
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |    2 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                 |    6 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |    2 +-
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |    3 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c                |    2 +
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |    2 +-
>  drivers/gpu/drm/tegra/dc.c                         |    3 +-
>  drivers/gpu/drm/tegra/dpaux.c                      |    2 +-
>  drivers/gpu/drm/tegra/gr2d.c                       |    3 +-
>  drivers/gpu/drm/tegra/gr3d.c                       |    2 +-
>  drivers/gpu/drm/tegra/hdmi.c                       |    3 +-
>  drivers/gpu/drm/tegra/hub.c                        |    2 +-
>  drivers/gpu/drm/tegra/nvdec.c                      |    2 -
>  drivers/gpu/drm/tegra/sor.c                        |    2 +-
>  drivers/gpu/drm/tegra/vic.c                        |    2 -
>  drivers/gpu/drm/tidss/tidss_dispc.c                |    2 -
>  drivers/gpu/drm/tidss/tidss_drv.c                  |    2 +-
>  drivers/gpu/drm/vc4/vc4_crtc.c                     |    3 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                      |    4 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                      |    2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |    3 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |    2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                      |    4 +-
>  drivers/gpu/drm/vc4/vc4_vec.c                      |    4 +-
>  drivers/gpu/drm/xen/xen_drm_front.c                |    1 -
>  drivers/gpu/host1x/bus.c                           |   29 +-
>  drivers/gpu/host1x/context.c                       |    2 +-
>  drivers/gpu/host1x/dev.c                           |    3 +-
>  drivers/gpu/ipu-v3/ipu-common.c                    |    2 +-
>  drivers/of/device.c                                |    1 +
>  include/drm/drm_debugfs.h                          |   25 +
>  include/drm/drm_drv.h                              |    6 +
>  include/drm/drm_file.h                             |    8 +-
>  include/drm/drm_gem.h                              |   79 +
>  include/drm/drm_gpuva_mgr.h                        |  706 ++++++++
>  include/drm/drm_syncobj.h                          |    6 +-
>  include/uapi/drm/drm.h                             |   23 +
>  172 files changed, 3014 insertions(+), 215 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>  create mode 100644 include/drm/drm_gpuva_mgr.h



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
