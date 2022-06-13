Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977DD5485BF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407DE10E7F5;
	Mon, 13 Jun 2022 14:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F5C10E7F5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 34C2F3200923;
 Mon, 13 Jun 2022 10:48:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 13 Jun 2022 10:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655131683; x=1655218083; bh=fXbxvfnzH6
 OEPjBQQ1ujRBLCWsmVXkpwe26aOb+2/Sw=; b=ZN3PzEewBPwj6QfuNSi7CB6IFO
 5R0of7PFEgjMLiNyIXq2bBkU+mONsJnck+yIlHOG+3LI9Zft1pF1/2o6FPilSdUX
 9Uti+IBagaikUn5NbB1NSf/YBNqjlg53Av6++pT221B7l46Hi1qqgmJ5IKdtazOK
 KAfpu8Kkpv/bCVkHDzMDPm283mBCeyQp6U6y5eFK4uC5PWW4quVIpcUYbhuQoAPL
 35XW1AwLv1P/aTMQhaT03N0FP/nBE+8Se8Yj2K35TSSdICPsPGxEovKHTKyheQ+t
 NCz4kZlScSDY010SAtrKidJhkPCj2nGwLaXf0SWZhZ0pVnpZjTHaqQ0DQHmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131683; x=1655218083; bh=fXbxvfnzH6OEP
 jBQQ1ujRBLCWsmVXkpwe26aOb+2/Sw=; b=oTlzFgYQO+MmdJq32lU3sFYJJB/Q5
 XpHioFKC1I02AsPdqiTElnOkofFBTOlW8MDSZkZ+8Y1hsGDGY+LcsYZzJwDkPZ8Z
 9vNbUdIii58S5JcFUxdQsccYMJ2tdzixo0pAzU9W1JrvOvfdAUFAWIzcVwLD6ULK
 yyMW/+7Jhuy8iOpc/9hsA+2LdPtd7CvGYx/OP4jP1fPaoEQvBLh9ijsMBNh9w1Ov
 rJBbJCHOd1sog4rpqV8oEyfLTNadt3bPNW38/z8g43RT17awJIb15/JCquzN7Zbv
 rx4jGVoZ2lsUbCrs/huPZyn0CdPbeRJ6/CkIHanT0SXqYySdMUdA2Ft/A==
X-ME-Sender: <xms:Ik6nYuO87GulGtppu_jvUXj24YQeX_wmmuhhSBAU1Xkx4PBwiIBAfA>
 <xme:Ik6nYs96uujcuJ0RaVKinXNuo_2Xdgr4R3AhVtq6-6sROexppp6XO0S_LkbfwyIJU
 jSeItM36Dot060o5ZU>
X-ME-Received: <xmr:Ik6nYlSc8FH6EYx5VzrUKnOH2lUdqWRYrnB3pAZ1-CloRxpuoIEBh9eo4yWNYh88sS3QILuGxZ7IUu9HZfEngjFuc6pj25wLpkwddsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
 geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ik6nYutzOUqJrLnpcJOYD4kN5gvFM5OKzlhzWP5Nu9GUQb2gI-LpGg>
 <xmx:Ik6nYmdBgxvvJIghXxCXQvYl0fqzczBOTI1dipddEbOx1ns3x696nA>
 <xmx:Ik6nYi3_f8G5GlEqLY2C_q2KhcToIHnIkf07DT6R3oV71NLX3CeqoA>
 <xmx:I06nYl6bdJiXGtHEHMluF2T6vzVdUXGzD_u17haZNq196jkRwLi5Yw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 00/33] drm/vc4: Misc fixes
Date: Mon, 13 Jun 2022 16:47:27 +0200
Message-Id: <20220613144800.326124-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a collection of small fixes that have been used in the downstream
kernel for a while, affecting several parts of the vc4 driver.

Let me know what you think,
Maxime

Dave Stevenson (21):
  drm/vc4: drv: Adopt the dma configuration from the HVS or V3D
    component
  drm/vc4: plane: Fix margin calculations for the right/bottom edges
  drm/vc4: plane: Add alpha_blend_mode property to each plane.
  drm/vc4: hvs: Add debugfs node that dumps the current display lists
  drm/vc4: dpi: Add support for composite syncs to vc4_dpi
  drm/vc4: dpi: Add option for inverting pixel clock and output enable
  drm/vc4: dpi: Ensure a default format is selected
  drm/vc4: dsi: Release workaround buffer and DMA
  drm/vc4: dsi: Correct DSI divider calculations
  drm/vc4: dsi: Correct pixel order for DSI0
  drm/vc4: dsi: Register dsi0 as the correct vc4 encoder type
  drm/vc4: dsi: Fix dsi0 interrupt support
  drm/vc4: dsi: Add correct stop condition to vc4_dsi_encoder_disable
    iteration
  drm/vc4: hdmi: Add all the vc5 HDMI registers into the debugfs dumps
  drm/vc4: hdmi: Reset HDMI MISC_CONTROL register
  drm/vc4: hdmi: Switch to pm_runtime_status_suspended
  drm/vc4: hdmi: Move HDMI reset to pm_resume
  drm/vc4: hdmi: Add HDMI format detection registers to register list
  drm/vc4: hdmi: Add MISC_CONTROL register for vc4
  drm/vc4: hdmi: Correct HDMI timing registers for interlaced modes
  drm/vc4: hdmi: Move pixel doubling from Pixelvalve to HDMI block

Dom Cobley (8):
  drm/vc4: plane: Remove subpixel positioning check
  drm/vc4: hdmi: Clear unused infoframe packet RAM registers
  drm/vc4: hdmi: Avoid full hdmi audio fifo writes
  drm/vc4: hdmi: Stop checking for enabled output in audio
  drm/vc4: hdmi: Skip writes to disabled packet RAM
  drm/vc4: hdmi: Remove VC4_HDMI_SCHEDULER_CONTROL_VERT_ALWAYS_KEEPOUT
  drm/vc4: hdmi: Report that 3d/stereo is allowed
  drm/vc4: hdmi: Force modeset when bpc or format changes

Mateusz Kwiatkowski (1):
  drm/vc4: hdmi: Fix timings for interlaced modes

Maxime Ripard (2):
  drm/vc4: kms: Warn if clk_set_min_rate fails
  drm/vc4: kms: Use maximum FIFO load for the HVS clock rate

Phil Elwell (1):
  drm/vc4: hdmi: Disable audio if dmas property is present but empty

 drivers/gpu/drm/vc4/vc4_crtc.c      |  14 +-
 drivers/gpu/drm/vc4/vc4_dpi.c       |  99 +++++++------
 drivers/gpu/drm/vc4/vc4_drv.c       |  19 +++
 drivers/gpu/drm/vc4/vc4_dsi.c       | 152 +++++++++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 210 ++++++++++++++++++----------
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  14 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  38 ++++-
 drivers/gpu/drm/vc4/vc4_hvs.c       |  42 ++++++
 drivers/gpu/drm/vc4/vc4_kms.c       |   8 +-
 drivers/gpu/drm/vc4/vc4_plane.c     |  92 ++++++++----
 10 files changed, 503 insertions(+), 185 deletions(-)

-- 
2.36.1

