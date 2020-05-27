Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4301E59B0
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BA26E4B5;
	Thu, 28 May 2020 07:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5E96E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3F575814F9;
 Wed, 27 May 2020 11:51:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Qt9/P4yukHV2B
 TUxxyxl9vY352xX2ptPfPzVLjzzRFg=; b=sVRlM84xe3TyV0NPrwgJBwH7ZsZAM
 MklsRzKl5y8mqAaxIjVJfMCCzXWCLoLw1lOiDVR38y92KDT6erd1dxqbpFAuOcYs
 jD/IUd/4Idc5i2IxJbNEGSjWbrqtEMpAiPiXE39KOK3SbaOcOI/WcuFxdRmXAL1A
 iTv55a9sIv3Vsi+GDw6zEZ9nB+WeDuDKIkb+MsiERKL81YitJRKiW4RQHRsg2Rzz
 CECGngwsNIZSfIc87ba/VPw43Ga26aSEMfYJVWUJYXtbnYvZUfE+IYvAXhJPJmWu
 Yqk9wEFkhriC5aehnjBkZQFZYwTfkq7ajlWbKo9IwNLADp4dPgHTpEhJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Qt9/P4yukHV2BTUxxyxl9vY352xX2ptPfPzVLjzzRFg=; b=J2/RQ2kR
 v98ruPKOf6pL1rocIL6Qq8IONCT+Kdz5cO+nRBnjzH2xmuhp9on7iQg89CSLJb53
 vPIkM01yg1d/uBJ9o0dvthq92FCAmYpWzknhKor+0T+wwK2kdkhZivE9mpj0FjaX
 sussLiepjHxHgLfmKlHqMWwXQuPH0RrUvwmCsGAvLVNVj9WWxwGkI0aE/QzyqduG
 qW2KRRQWeLoomrhsQFfi0Z8OCtuQ49+hXX2LsgzrwDS9TYmolUqVCxsO9EYoc6ze
 nQspnsjEVD1w0mcEb8RZbQw1R8Yc/hFKryjuy/k7oT+CkItQl9K8dKS5bIpiMaMy
 0p6+2Oqu8Wklkg==
X-ME-Sender: <xms:fozOXsb_v5XmlXhJaaxJF-_Yi8JNYEyV6XePpFHa2SHst1Cq9gYG_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fozOXnbnCQnxw9FAZYgHPC53wNkGhGMIKi1TqUFYvl3mARhZz7m0PA>
 <xmx:fozOXm_pU2veX9JEoHkEzT8LGFlk-HeIPNIHqTtZBHKPdhBSaFGUkg>
 <xmx:fozOXmqKq88bTAK5_3mllqyVTqD5o9z4VpBwOXKz4SzWiBFuE0YBLw>
 <xmx:fozOXjI7NHNfBccefGtHERMKpJ85yKikb7u4znAgg7aG1oJtRUjjSw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70284328005E;
 Wed, 27 May 2020 11:51:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 082/105] drm/vc4: hdmi: Add PHY init and disable function
Date: Wed, 27 May 2020 17:48:52 +0200
Message-Id: <f56124810ee0dd417cefa40546d3302e61c828ed.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
index dceff505c840..3d5e35aa96ff 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -321,7 +321,9 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
 
-	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
+	if (vc4_hdmi->variant->phy_disable)
+		vc4_hdmi->variant->phy_disable(vc4_hdmi);
+
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 
@@ -381,12 +383,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
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
@@ -1414,6 +1412,8 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 
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
