Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBE35E1FE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C336E5D5;
	Tue, 13 Apr 2021 14:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEFC6E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:54:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E5DF91669;
 Tue, 13 Apr 2021 10:54:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Apr 2021 10:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=i/GUtNBfipgcb
 K0Tsz4xDIwLMG8mn8zAhLxbfvTWgzA=; b=eTU/TPR8Y5k/ezF61qtCdoBZc4smt
 dUA+FKEk4ZIoc2Jcnub4evRTvVRX9d1he5gvK2PyGxxRW0qLoFKu3mUfpRnOD8My
 ZJu/sfEz8N+F+X5HSsJtzipzT036fzNyPUOv8BLDR0959UE6+55gLu10fTUP0aGP
 w0AM8XEKbWiqtXTmrtK23Y9fKGK0p/Fmy5nr3Z4QeDbO+Z4hZlIuydcqxVSsQSH+
 k7Mil9QAdtgpvz2jxyWmXNlmmci88bSCy3JWi7qO/qRj0wUbQ9x9qmeNsnplAtn4
 WoGt4f2SkDVgvC4ZSzvcrS456Xg8esEGk7ExW8cjmWHBH6JIQtWjKty4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=i/GUtNBfipgcbK0Tsz4xDIwLMG8mn8zAhLxbfvTWgzA=; b=kH0/7nu8
 cLMlPr7mcAEQCGC7vLe1BesMEKHIluG0tHzFp7h7Ln1y5/ou8XPmS6cGH6HbPVgY
 6xV1Dm1iAZhU7b8ziO8UfUNZ2rMzlqe5Z0ISpTIP6dE5SSWbEh/K4raA6xZbmEYU
 fgENohrd2a4Qn2fnDDdKvzGXDfbOGz+WhP7BmLVHJhjnVCUlzacMxe3hxgnA8+MN
 fza2nIvvt9OhBN3EA8dg41+4kRcRsBq6QgQ0OFLhk/yekrdeBbZeAGeMAO1jhoS5
 2IJKZLiLM8WMosFNbeMtzHoiMvYip7hG0PAAUv7mKVdsLCIJWXZXfi2eLameiuqM
 yIlvzQ+X6XJ1CA==
X-ME-Sender: <xms:vLB1YEDdBvtK4Ku10rPla_aZyUwBSDVolAwsaP50CKuk5qn9utddkA>
 <xme:vLB1YCBHxibtxmG_cyK3h11cT2ovM4uW-RuUthdNC5IoCkE56f5bz5p0giHbqGniP
 lna_2kFnUWNRCIRHnE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vLB1YOAydH1w4XEqV36tfSXLyECh4PhJFXuFlsuM0wG8TTJcYWpmww>
 <xmx:vLB1YFqmxCvPoHo4cuqro8eGzSDBxkOsglqi5P2G11QaJs7hp2kP9A>
 <xmx:vLB1YAkKJLtAchLUhwkZ-gGMDoNuDQ4wZ0u6xOr-oLciiuu_KcFDeQ>
 <xmx:vLB1YMw-l_Ss2JItGDqc9elyNp_bWcflJJf8DidGrzXHbJCCyToXgLo7NsY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D0C0240054;
 Tue, 13 Apr 2021 10:54:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 5/9] drm/vc4: hvs: Make the HVS bind first
Date: Tue, 13 Apr 2021 16:54:37 +0200
Message-Id: <20210413145441.483977-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413145441.483977-1-maxime@cerno.tech>
References: <20210413145441.483977-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to have the HVS binding before the HDMI controllers so that
we can check whether the firmware allows to run in 4kp60. Reorder a bit
the component list, and document the current constraints we're aware of.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index cd1fb75c66a7..fef31d6eea60 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -339,12 +339,21 @@ static const struct component_master_ops vc4_drm_ops = {
 	.unbind = vc4_drm_unbind,
 };
 
+/*
+ * This list determines the binding order of our components, and we have
+ * a few constraints:
+ *   - The TXP driver needs to be bound before the PixelValves (CRTC)
+ *     but after the HVS to set the possible_crtc field properly
+ *   - The HDMI driver needs to be bound after the HVS so that we can
+ *     lookup the HVS maximum core clock rate and figure out if we
+ *     support 4kp60 or not.
+ */
 static struct platform_driver *const component_drivers[] = {
+	&vc4_hvs_driver,
 	&vc4_hdmi_driver,
 	&vc4_vec_driver,
 	&vc4_dpi_driver,
 	&vc4_dsi_driver,
-	&vc4_hvs_driver,
 	&vc4_txp_driver,
 	&vc4_crtc_driver,
 	&vc4_v3d_driver,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
