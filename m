Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4F416563
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 20:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591F96EDA1;
	Thu, 23 Sep 2021 18:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BDA6EDA1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 18:50:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A0DBD3201EB1;
 Thu, 23 Sep 2021 14:50:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Sep 2021 14:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=3az7OdV7Z3JaXLLheQndiqCilD
 FEjUNPtbedszlC/7o=; b=L66XcP3PnBokEOCMUPHYGOPL+6JL9ZowG7e3B0VI2T
 XWTQbOhAUgOtDTCmRQaLnE5Uv3EkquaGhhxuCxy85qZdofzimA7VB4NdNj/rFQFi
 cgIaVDc7faJ1+4HvQ6bx0xaQr+6T9WdgUduXuiiwp0j68KcSkJLshVeUQiV3hEZk
 UdZ0ZtKZeu7/+96xZwtLO86eURok6CSLgins0PD0bpOUc0vbI16eJHA6QAdZAZP6
 +q1IwIF72h+u75OGlJfvjBlAfSA9evx1rn0m5g+Maugc+CgNJ/r+AbYU3yYl4TZj
 WKy57MsZwAtlHNK7xx9Wf1++CGJJAxLKkCLVgv8p5eZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3az7OdV7Z3JaXLLhe
 QndiqCilDFEjUNPtbedszlC/7o=; b=TilS0PEqvSQLft14JtQ1SDyz5iVHM1Lxl
 TuYygupHI6e0Pt1k8wc1a80TNKQjrGdj+zW77rpKn2SoftEUSnWVXvFkImCvziUh
 TdbF1Kgzzieg2SGQ+3s+b55q7qD1yelWAPI6nVBQZG5ujdevJWBBJ9xpdpItZ359
 BQLFMsk+u4otJ0CGi/BC/h+8BbjxkFk0/UNQpYX9vJ1ZMZm1/63yXvSM+DWMVQQh
 iX2LEOsAMoFOruuxSJ2ol6NbFDHh5K7PTQTHnh9SL6si/Pr+ASr8f7PiUKhqTFkJ
 N9etjG3CbrwHtSb3UuBISgycS2DcunQAIGXQsooU1Xe+2x7H16hJA==
X-ME-Sender: <xms:Z8xMYe1WuGg4M5ZQQ-zmP52tagmPQXGKPhwqnOuJcolFKOHxANKbKw>
 <xme:Z8xMYRENCCXsiL-UhKWPfmMuFi7waBiEA7KREnZgc1b3YN90I79gLlNT5trjrZitn
 Boj1Uk-S0GfHvgp9OE>
X-ME-Received: <xmr:Z8xMYW4uN8FT2IQIHeuM1fNU-nLNHaR2gS_r59XuGpOQS9D980OtVxWIdRsGOPYGwHBZdIfmicPxb88Lai7kULl_1-fYuaZFJRxe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeej
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aMxMYf0EgU5dS57P9JASFlVASLxYubriK6jkfOYGumL2nBdHeB8lhg>
 <xmx:aMxMYREy6pLa5HcR-zPmwZinX3yK-gKfQjN2cNpVcZyKVO90u6ZWWA>
 <xmx:aMxMYY8zRV0IctdFClD5oKY7v46GDARH3i1FPL1IpYIz-GgxWMEg3g>
 <xmx:acxMYXaO5v6uPHruthU6DOpxqoL5Yqk4gi1yo79mesApnqTI_aF_ag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 14:50:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/vc4: crtc: Make sure the HDMI controller is powered when
 disabling
Date: Thu, 23 Sep 2021 20:50:13 +0200
Message-Id: <20210923185013.826679-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot
time"), during the initial setup of the driver we call into the VC4 HDMI
controller hooks to make sure the controller is properly disabled.

However, we were never making sure that the device was properly powered
while doing so. This never resulted in any (reported) issue in practice,
but since the introduction of commit 4209f03fcb8e ("drm/vc4: hdmi: Warn
if we access the controller while disabled") we get a loud complaint
when we do that kind of access.

Let's make sure we have the HDMI controller properly powered while
disabling it.

Fixes: 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot time")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 18f5009ce90e..c0df11e5fcf2 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -32,6 +32,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -42,6 +43,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vc4_drv.h"
+#include "vc4_hdmi.h"
 #include "vc4_regs.h"
 
 #define HVS_FIFO_LATENCY_PIX	6
@@ -496,8 +498,10 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	enum vc4_encoder_type encoder_type;
 	const struct vc4_pv_data *pv_data;
 	struct drm_encoder *encoder;
+	struct vc4_hdmi *vc4_hdmi;
 	unsigned encoder_sel;
 	int channel;
+	int ret;
 
 	if (!(of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
 				      "brcm,bcm2711-pixelvalve2") ||
@@ -525,7 +529,20 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	if (WARN_ON(!encoder))
 		return 0;
 
-	return vc4_crtc_disable(crtc, encoder, NULL, channel);
+	vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = vc4_crtc_disable(crtc, encoder, NULL, channel);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
-- 
2.31.1

