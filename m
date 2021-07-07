Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262FB3BE589
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6278A6E863;
	Wed,  7 Jul 2021 09:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65D26E863
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:23:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 4754D2B0093D;
 Wed,  7 Jul 2021 05:23:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 07 Jul 2021 05:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=zQgJHm3ll4lz4
 6OTv48xFixF8+h91gpIW0tSdb+KCwI=; b=uycU0fGA1ImVkHvSVK17kooI437Kt
 JHdKSM0de1e76Y/ikEnjhFuBcH9arAvIIhqadcjAAvvh4kk9g20jPu/OY/mNvoRH
 u4USl5vMMcQvHajH1W2zqJ8SPjIZ4woU0bkSrAackHMrXnfOZJof9YFANgw9yBZT
 skEbpLmkn6OuHdIDM9Vqzfgt1jNC5gh9tnRXvlB4jeOXajD5l3hYA1yszTI1Lbeb
 WOO3Ho6Jex8QzejJmOwvBSuU4YAw7HpLhsUY0yIiIZRGyJAADAD7v/RS9VWaNpay
 XUPc6ZsBiuZgfy6oQOA/rprZ79iYdpZqea8h/9yeBAFIbh7zXnD8XzDcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zQgJHm3ll4lz46OTv48xFixF8+h91gpIW0tSdb+KCwI=; b=PvmnYjFv
 2LCnx3JwObhy4/aFN7livZQrZXhFqXwkocVLzFWNeLaofaQQc5zipEkh8w4phG16
 6R6NA0WPy935r2T7kQ23xSZztbaJxh3phIIaA6uRCsuqj+OzIH8aj6zGu4RgFLi0
 7Nq07xg6zTnXtK7VjCLocILSFCFLuQ4zBcvox1A3DefH9lUNlgVhes/Z1BVzEDY+
 l9c3qn83fGNo0Rm/JMB/4zwZI0Zp2eSMrfUMrhcNIvPIj9+H00RxzUolJHhqUq2k
 PlnlpUkbnLtAb7VDbzs9994jMeXbcvWsbVxuRceoarnsWQYLd48q/WngGcq90t4j
 Unef5TBXNUYq7g==
X-ME-Sender: <xms:iXLlYAaI1i-38QzL8LQ-gQkxxqn5u0Hed-mUyHeISL8pG8DFlhKd0g>
 <xme:iXLlYLZqC_4rxvUzIkU3kdzaI2PrdzgKZ8Opq8o_UQU7GZK1ZzlndLqJxWhiDcqAP
 erhYS-uPNhSUU4AmsY>
X-ME-Received: <xmr:iXLlYK9L5JfCIVyiPatDeV5O4YOPbhfI-gJrnUiLjnkDsOtKZqb0IH6czUOIYIo6pSPwrDV_BaBiAfIM2YOAQ_tSbT3e0oJE9g0J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iXLlYKrfapTr4zEay2CJ8mdhvAKYle02f6c837bbaCYN87nBDT59Mg>
 <xmx:iXLlYLq7bw8s2qTU-errAtnMrck8hjD_oSvxDvGpL3bI2FGSTICh5A>
 <xmx:iXLlYISmmtGhY3dRuxEDdRGQA-g-wKOZnL3SIQXK4lKlvOOEsaBeWw>
 <xmx:iXLlYBYQT3II1suUGDiPPY5ZZ2AwIohIVyHEvzKyAXr7ALe0-eyRO9QV73s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:23:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 5/5] drm/vc4: hdmi: Warn if we access the controller while
 disabled
Date: Wed,  7 Jul 2021 11:22:57 +0200
Message-Id: <20210707092257.1465109-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707092257.1465109-1-maxime@cerno.tech>
References: <20210707092257.1465109-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Tim Gover <tim.gover@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had many silent hangs where the kernel would look like it just
stalled due to the access to one of the HDMI registers while the
controller was disabled.

Add a warning if we're about to do that so that it's at least not silent
anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 19d2fdc446bc..99dde6e06a37 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -1,6 +1,8 @@
 #ifndef _VC4_HDMI_REGS_H_
 #define _VC4_HDMI_REGS_H_
 
+#include <linux/pm_runtime.h>
+
 #include "vc4_hdmi.h"
 
 #define VC4_HDMI_PACKET_STRIDE			0x24
@@ -412,6 +414,8 @@ static inline u32 vc4_hdmi_read(struct vc4_hdmi *hdmi,
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
 	void __iomem *base;
 
+	WARN_ON(!pm_runtime_active(&hdmi->pdev->dev));
+
 	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
 			 "Invalid register ID %u\n", reg);
@@ -438,6 +442,8 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
 	void __iomem *base;
 
+	WARN_ON(!pm_runtime_active(&hdmi->pdev->dev));
+
 	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
 			 "Invalid register ID %u\n", reg);
-- 
2.31.1

