Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DAC288389
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12DA6EC53;
	Fri,  9 Oct 2020 07:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC8B6E40A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 12:44:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C2C81B70;
 Thu,  8 Oct 2020 08:44:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 08:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=QjVFum5v/DP+F8ZAinOcNIZ5U+
 MPv9S4kCSU7jNGzd0=; b=JCn7fzq302GeIJkofPygQvhhpnI/zKjmkbvtodO0VL
 1T9dJ8wssV91PlrfcvyZg9cApC9LV5MNJvz9DLdEKyJcwhuUVgjEqI2qRlQaBvQE
 oG85Jo0RIF3VtSVxAxwj171BPLuTdF2/TrpWgAUL4nMhi12lA30OuoxLJYrK1tv9
 SCOa0baOG61QS2+o3zwVdYq2d49bAU3gTVC214o/A8c/BW6ly8HniYSjQQt7rQCj
 8TKMIKTK+sGlLUKHgxziSnO0gnbUvjQzYQ2kHcbp083Cdxp77/mFEkQXY+jLyRHf
 FK+H64vn6/J21mf7xXFZrgioIaUdOWsbSQ7rc8RSf93w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QjVFum5v/DP+F8ZAi
 nOcNIZ5U+MPv9S4kCSU7jNGzd0=; b=W3gmyiUUf+TROWnVai7fodsT2wvqpiDn7
 pDLtgS8Pwa65zHPtYFWstJx4+1QwpDeTFNBJoo/ixz+QkNL2PHSqOJ5hpxbM8PdB
 RAp2vmV6zcjGD7jQgfSdTk8VQuIfOdFYIRwZypV6xInv1AHabidPj3y9MTFU4NSy
 YbG2bXTXWirYjaIxI5vFMXsMBeUMEVF7Zrq6TJvrubqTbk6m1iZLminVPyf7ER0n
 g7gRZSk1eRChDne1hY/BBOPnek5Tl/jhVwzcqP7iTr2MGm8BxZkALg0x0jwFLomK
 ResIrkwuNROTlbZsFj/KZrpcHss7RzwdIBA0f7DWAy0bZmVUxdBmQ==
X-ME-Sender: <xms:rQl_XzjE5eZJYs4ktC4eFrmx1-XRCOobSnHzMkWCRModTMCFiNlMpw>
 <xme:rQl_XwD4tHkNydNHLcQN1TyTEolk_gBojnF9RMlfOCmBwniVE-rf7cTNpdyVbionU
 rQDEmi8RJrH_XDNRV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rQl_XzHwPQBI1japB8LTJhPk1rSp39Ln91jZw5ICvAJuiK8yZhVQ1A>
 <xmx:rQl_XwS3OvA7Aicok6MH_x7JD2pt3OpCGecPeOjoY1XxrnHbO-B3Eg>
 <xmx:rQl_XwxJYXXO2FpXzKtO4gcmmd4ryVcQiuU_GPRBvHdLuV6T713JGA>
 <xmx:rgl_X1o2HLoQoaRggdphvTp19DOPUJfD12lwZuYH1lYe2HjHAF7G4cZlHkA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D0AF73280063;
 Thu,  8 Oct 2020 08:44:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 0/6] drm/vc4: hdmi: Support the 10/12 bit output
Date: Thu,  8 Oct 2020 14:44:07 +0200
Message-Id: <cover.647a5105d069cdcf8545555d1c381c233675a289.1602161031.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's some patches to enable the HDR output in the RPi4 HDMI controller.

This needed a quite intrusive rework in the first patch to allow a CRTC to
have access to the whole DRM state at atomic_enable / atomic_disable time.

Let me know what you think,
Maxime

Changes from v1:
  - Added the coccinelle script to the first patch
  - Fixed the pixel_rate ramp up

Maxime Ripard (6):
  drm/atomic: Pass the full state to CRTC atomic enable/disable
  drm/vc4: hvs: Align the HVS atomic hooks to the new API
  drm/vc4: Pass the atomic state to encoder hooks
  drm/vc4: hdmi: Create a custom connector state
  drm/vc4: hdmi: Store pixel frequency in the connector state
  drm/vc4: hdmi: Enable 10/12 bpc output

 drivers/gpu/drm/arc/arcpgu_crtc.c                |   4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c |   8 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c                 |   4 +-
 drivers/gpu/drm/arm/malidp_crtc.c                |   6 +-
 drivers/gpu/drm/armada/armada_crtc.c             |   8 +-
 drivers/gpu/drm/ast/ast_mode.c                   |   6 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   |   4 +-
 drivers/gpu/drm/drm_atomic_helper.c              |   4 +-
 drivers/gpu/drm/drm_simple_kms_helper.c          |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c         |   4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c       |   6 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   |   4 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c  |   4 +-
 drivers/gpu/drm/imx/dcss/dcss-crtc.c             |   9 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c                 |   6 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c        |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c          |   4 +-
 drivers/gpu/drm/meson/meson_crtc.c               |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |   7 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c        |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c        |   4 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                |   4 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c              |   4 +-
 drivers/gpu/drm/qxl/qxl_display.c                |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c           |   6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c      |   6 +-
 drivers/gpu/drm/sti/sti_crtc.c                   |   4 +-
 drivers/gpu/drm/stm/ltdc.c                       |   4 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c               |   4 +-
 drivers/gpu/drm/tegra/dc.c                       |   8 +-
 drivers/gpu/drm/tidss/tidss_crtc.c               |   6 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c             |   4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c            |   4 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                   |  26 +--
 drivers/gpu/drm/vc4/vc4_drv.h                    |  14 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                   | 154 +++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                   |  12 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h              |   9 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                    |   8 +-
 drivers/gpu/drm/vc4/vc4_txp.c                    |   9 +-
 drivers/gpu/drm/virtio/virtgpu_display.c         |   4 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                 |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c              |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c             |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c             |   4 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c               |   6 +-
 drivers/gpu/drm/zte/zx_vou.c                     |   4 +-
 include/drm/drm_modeset_helper_vtables.h         |  13 +-
 48 files changed, 316 insertions(+), 129 deletions(-)

base-commit: 1a11a88cfd9a97e13be8bc880c4795f9844fbbec
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
