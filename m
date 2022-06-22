Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8B554D3A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973C610EDDD;
	Wed, 22 Jun 2022 14:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB5D897EF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6A95732009B3;
 Wed, 22 Jun 2022 10:33:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908427; x=1655994827; bh=xa
 3P1sv4afwrplIobQZs4hDs96mkWHKCSQG2cYIVVFM=; b=uO5fgz4mTN33sZ7OwT
 ikRU691gcXi9QaB3LsGUFD5v47vQd7q8YH5L2foGJ4M/1en++110sXuRIcAJ2fuj
 BaUV76RDWWswPPTICqElPiqusiHE/JWGDDE5lXurzm43a7MG5zUdpgYq/7JiyQWt
 mAetj0mMXMbdR/zBTRK97mNgDVJJiIojJ237xUS1Al/X1hZ18CJO2Ryt6O3RjKZF
 JgQTnDMCF8NTf3jaYDIoZVavZwi5V72cjJkyLK+osqijSFrzGYITNb+9C0OM0y2x
 0lZg0nHBLE91pC5XjgkOzMhfoTTK0JLwRdY1Eg/HO81I0Xc2guv8lBAQ9Xo+1gMU
 3Wdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908427; x=1655994827; bh=xa3P1sv4afwrp
 lIobQZs4hDs96mkWHKCSQG2cYIVVFM=; b=QxQebAsSukC72UW58tkaNUK8Yhr0/
 qvikLhONPGUfozbz632ahad/qKyANeaD9QF30gF0JB+QnbPWveY8/UomGC0NNle4
 qMgnkBDo2RozoksbU5WijlPvnHCINS40mGFLy7IrfJeb0gXoqDj1IXIGRDC0rGFO
 5ptP4wCF0lzr3UF+aDaN3D1onVNvOJ+2bDmb6Iij10aH9zAutAgovW3R5hBuGq+c
 ZVNOGrDDQyEIpFhV/xurSMdpVF60jzpe2Hwf6DcUxbtE4u/W27tv8n8YhVXAbf+0
 T6ajKuo3+t+wNvsS7EMKqI5dE/+EqXk8/+CF0n4sKSJWIqKxbrtZGWj3A==
X-ME-Sender: <xms:SyizYgQvD28XWWfPoBsEdq0aDr1tOWMdEfEltCTkIm-OFh7wBBWkrQ>
 <xme:SyizYty4WgUOJZDsGMCjDeQhiCVErlvVATB6UqqR9Lu9DWnOFJqwIWeoU3qa0-aiB
 Q7P76vGlC4AVwIvu5E>
X-ME-Received: <xmr:SyizYt215vNRetmblM2doZjEQs1-qDe3qolc5NMlEUxKbHBKkmFkKppwS_uqpYxMrtlJZp0iheWwtaaymskj_1HF0ZvW4iRRb4Ooq5Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SyizYkBpP7OqpXpcbcsatC6a1bu4ttZR09_PYAMu0O_0z5eRk0Fz3w>
 <xmx:SyizYpgU0w04LDFzfjFgyQS64rtkKQj7-TgTWIYrNt5eN7dbvT5sgw>
 <xmx:SyizYgrxZtQVOwmVcSyBjwkLozRt-yfqwFamEU3LH1VUQM5KSe5P3w>
 <xmx:SyizYnaWPtQOn4TiMyJOpfUGfbhs7kViMJlrKT08-yEmY3JbNV5q_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 30/68] drm/vc4: dpi: Protect device resources
Date: Wed, 22 Jun 2022 16:31:31 +0200
Message-Id: <20220622143209.600298-31-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our current code now mixes some resources whose lifetime are tied to the
device (clocks, IO mappings, etc.) and some that are tied to the DRM device
(encoder, bridge).

The device one will be freed at unbind time, but the DRM one will only be
freed when the last user of the DRM device closes its file handle.

So we end up with a time window during which we can call the encoder hooks,
but we don't have access to the underlying resources and device.

Let's protect all those sections with drm_dev_enter() and drm_dev_exit() so
that we bail out if we are during that window.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 71bb51e1d703..75b4ea3ab7e3 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -111,9 +112,16 @@ static const struct debugfs_reg32 dpi_regs[] = {
 
 static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
 {
+	struct drm_device *dev = encoder->dev;
 	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	clk_disable_unprepare(dpi->pixel_clock);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
@@ -124,6 +132,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector = NULL, *connector_scan;
 	u32 dpi_c = DPI_ENABLE | DPI_OUTPUT_ENABLE_MODE;
+	int idx;
 	int ret;
 
 	/* Look up the connector attached to DPI so we can get the
@@ -184,6 +193,9 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	else if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
 		dpi_c |= DPI_VSYNC_DISABLE;
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	DPI_WRITE(DPI_C, dpi_c);
 
 	ret = clk_set_rate(dpi->pixel_clock, mode->clock * 1000);
@@ -193,6 +205,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	ret = clk_prepare_enable(dpi->pixel_clock);
 	if (ret)
 		DRM_ERROR("Failed to set clock rate: %d\n", ret);
+
+	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status vc4_dpi_encoder_mode_valid(struct drm_encoder *encoder,
-- 
2.36.1

