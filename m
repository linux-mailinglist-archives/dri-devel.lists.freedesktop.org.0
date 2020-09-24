Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A85627812E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455136EC0C;
	Fri, 25 Sep 2020 07:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB2E6EB37
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 15:31:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BA625D28;
 Thu, 24 Sep 2020 11:31:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 24 Sep 2020 11:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=thG9qK6LWEaRGW/pJZpaMyzSnD
 MMfJPnfRh3AwwISWw=; b=XfrAXMoEwbpiQ/jpSveTTZheliw3OV8J5i+HCWD+6t
 gr62KBVX3hm/lDf9tfFPy3sAHUN3kUsNymD2KhAHQWyWZIWuBwRtyV9VJonFAcgu
 Bq75bGxW7//hed5EpR5SddXatSU0VEQcvFwe9UsrCoWwKadjq++MGzqRytKWnPrW
 XbXAcGeA2cUBpZ8FO9kQIoddEapsV1hz+T/2OMAWkx1Nx//gE1sM8WH/i3JekZEn
 9XRcq8AadRgBnMDP/f2Ye6SAb9JHu70DKWk4KhMqIsAP98GggtZ+aYUKxLXcHw8y
 ply9XBklgW9ect5h/8HtxSKA6GMHrVSNLgXb6vs9OJbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=thG9qK6LWEaRGW/pJ
 ZpaMyzSnDMMfJPnfRh3AwwISWw=; b=UhGqxHkruNY0KDL5dVXRLbSKEnHuQO2Mo
 7E9sNR2mZT1AwOA0vT40Shv7sPp+HaJljKLazlzIJFSbXe5OCE7uwsr5ONKFdFay
 KXL1y+f7s81kladu8713JP0ULm8ujVz/Q/YbUDsTal8c61nx+DaHMbvuCEVhvJ2x
 f6g9+4hxrQJkEn/ntK/5NFQfPQsADbCZdW9mAREUsxwX4emwoCnXp8tXH90eXj57
 16JnB9ZCBI8FTo+ZMAIDRms23PJIWcfib5YZzzikYSgXKMgCIlpbp45SR+njh6gs
 6lLoSHKa10Tdjzh2HKvlcaA9KrtIatMShMJlnqHjXCZe0GY8L4xtw==
X-ME-Sender: <xms:uLtsX4rg8APU-4dDFNM1moeBF2OI8nrLgI_Dtjzccp0dgRjq_AQW5A>
 <xme:uLtsX-qyeQpjXCTspozGV1wCqLBGF8Q8Vn5tcZfVuE8UFcmWbVkM876t1FR32Sdu-
 tWo-RuCjxI8FLytINY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uLtsX9PBp58gc-d429fpYogjnn3aS9i7X74YKqGxS2-2NMkM_TjGGw>
 <xmx:uLtsX_6E-J-V3YIh5vs1P6gkhWK1uaC5iIBf4MMaqT2edwn0xg97_w>
 <xmx:uLtsX36YuH6MU9ua_WXXxVg5zYYhX7Pob-ii2L1WzBgLlxshPGDYPg>
 <xmx:urtsX0xGjoddGjKY3cZXOJFSEoLDUmJpJWnoNwwjEd9j4I7TxumQO7rxEB8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D2FC328005E;
 Thu, 24 Sep 2020 11:31:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 0/6] drm/vc4: hdmi: Support the 10/12 bit output
Date: Thu, 24 Sep 2020 17:30:55 +0200
Message-Id: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
 drivers/gpu/drm/imx/dcss/dcss-crtc.c             |   8 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c                 |   6 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c        |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c          |   4 +-
 drivers/gpu/drm/meson/meson_crtc.c               |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |   6 +-
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
 drivers/gpu/drm/vc4/vc4_txp.c                    |   8 +-
 drivers/gpu/drm/virtio/virtgpu_display.c         |   4 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                 |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c              |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c             |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c             |   4 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c               |   6 +-
 drivers/gpu/drm/zte/zx_vou.c                     |   4 +-
 include/drm/drm_modeset_helper_vtables.h         |  13 +-
 48 files changed, 313 insertions(+), 129 deletions(-)

base-commit: e742b35e5978d6a679adba2440eb91b0cba513f3
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
