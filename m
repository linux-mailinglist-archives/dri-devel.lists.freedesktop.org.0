Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6511B7FDF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210D66EB29;
	Fri, 24 Apr 2020 20:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BE989F38
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AF4C21455;
 Fri, 24 Apr 2020 11:37:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=HHj2Ct/TQOE8B
 otW7Nmi0uN46MHYFOx9I7iRnAbqSfg=; b=DdyvYqZwjzH98ujuqL9OmDDTNeLhD
 6r2yW5ElA2gNQ79vRSBjcxC6I5QqVMBZQy6rO5Isu5e2ny3EVKkeQU7SNy6OsXai
 zuwfUiJ7VOjOSGbpd1pUCc62lxm3jOpYwQ5Dbk/7Eh0VBrOF9y4wSkfBWBscbcbC
 7QMAIzrDpLvDEcy0sKjfmQ3s+PIl1WClqZ+hic4bsQ99r5PxDPC0TitLhR6n0XgI
 WzGC0PT1s7Fz9hfbispyD0OgcvsB1MyqnzO1cWLqtw3rFuXkNq+2wdFy7hJEvzcK
 wbJUXg+CgHjQo42zKY92vo8yr3fqhoOpLRZRP4jNzFP8n0jIR3KoddLZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HHj2Ct/TQOE8BotW7Nmi0uN46MHYFOx9I7iRnAbqSfg=; b=oohT9FK9
 SLOZHUE3XNhhH14M3/7xB8/l7UBIITgFBPf515U1npWzrJnnT5myBXqzrTwk29NA
 zCv9szQ+OGI2fBaobroacuNOfsnGUW2djou1ioaM76smT5752l32vBxkff9QkksG
 c/6aR1GLvJH6kh0pN/DyY0aRky9gOlTD6UUqH7m2WUawoE12HpnqZ+wbDCo1HHlk
 E7981as7l+wrqjlSN6DVAgBbNRxi7G+DdbQFmwAk5k3vqSOQbQPr5JiBaxz9FD6p
 63o5S0NtT+hS5zXNFPUIX8C9EE1T2/4Km5k36hcGDAEHWBKm089cRWJTAbaI/+O5
 Qsh95dcbkGJl7w==
X-ME-Sender: <xms:owejXsF9x3oVlQ3lDPkCECMOXpef1IBIs7hw3pnnh8rmm6xzzpI7hA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeiheenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:owejXpnm_G50ezOS-JXXmmzOl1rHphb2i1YTsq67m2L_wO-rirGq6g>
 <xmx:owejXhKSkn3SuV4UI-xR4QBuMOIxIDODVBBcLWSMgPvMp-Dr7unzwg>
 <xmx:owejXiZnO3rbYSrwNZwXRSoJcUstiYzZilqvwM18DLXMcHuEsKqL2w>
 <xmx:owejXsjjgteRmKhKTJwQvcV0hTS2W3y8_HsbyHQ47tgmqk_jcwp-Xfx14JI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E61C93065D97;
 Fri, 24 Apr 2020 11:37:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 75/91] drm/vc4: hdmi: Add PHY init and disable function
Date: Fri, 24 Apr 2020 17:34:56 +0200
Message-Id: <5ebcf3a94da0eeb23002902822f6fe1eefb43366.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI PHY in the BCM2711 HDMI controller is significantly more
complicated to setup than in the older BCM283x SoCs.

Let's add hooks to enable and disable the PHY.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/Makefile       |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 14 +++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h     | 13 +++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 25 +++++++++++++++++++++++++
 4 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_phy.c

diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
index b303703bc7f3..d0163e18e9ca 100644
--- a/drivers/gpu/drm/vc4/Makefile
+++ b/drivers/gpu/drm/vc4/Makefile
@@ -12,6 +12,7 @@ vc4-y := \
 	vc4_kms.o \
 	vc4_gem.o \
 	vc4_hdmi.o \
+	vc4_hdmi_phy.o \
 	vc4_vec.o \
 	vc4_hvs.o \
 	vc4_irq.o \
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4bd385f86034..b04b18d9417d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -323,7 +323,9 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
 
-	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
+	if (vc4_hdmi->variant->phy_disable)
+		vc4_hdmi->variant->phy_disable(vc4_hdmi);
+
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 
@@ -383,12 +385,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
-	/* PHY should be in reset, like
-	 * vc4_hdmi_encoder_disable() does.
-	 */
-	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
-
-	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0);
+	if (vc4_hdmi->variant->phy_init)
+		vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
 
 	if (debug_dump_regs) {
 		struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
@@ -1425,6 +1423,8 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 
 	.init_resources		= vc4_hdmi_init_resources,
 	.reset			= vc4_hdmi_reset,
+	.phy_init		= vc4_hdmi_phy_init,
+	.phy_disable		= vc4_hdmi_phy_disable,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 93695674c2d3..39ae5273f36b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -21,6 +21,8 @@ to_vc4_hdmi_encoder(struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
 }
 
+struct drm_display_mode;
+
 struct vc4_hdmi;
 struct vc4_hdmi_register;
 
@@ -38,6 +40,13 @@ struct vc4_hdmi_variant {
 
 	/* Callback to reset the HDMI block */
 	void (*reset)(struct vc4_hdmi *vc4_hdmi);
+
+	/* Callback to initialize the PHY according to the mode */
+	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
+			 struct drm_display_mode *mode);
+
+	/* Callback to disable the PHY */
+	void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
 };
 
 /* HDMI audio information */
@@ -95,4 +104,8 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 	return container_of(_encoder, struct vc4_hdmi, encoder);
 }
 
+void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
+		       struct drm_display_mode *mode);
+void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
+
 #endif /* _VC4_HDMI_H_ */
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
new file mode 100644
index 000000000000..5a1746877bb5
--- /dev/null
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015 Broadcom
+ * Copyright (c) 2014 The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include "vc4_hdmi.h"
+#include "vc4_hdmi_regs.h"
+
+void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_mode *mode)
+{
+	/* PHY should be in reset, like
+	 * vc4_hdmi_encoder_disable() does.
+	 */
+
+	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
+	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0);
+}
+
+void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
+{
+	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
+}
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
