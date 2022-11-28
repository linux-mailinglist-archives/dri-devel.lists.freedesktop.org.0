Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0247763ABBB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAAA10E219;
	Mon, 28 Nov 2022 14:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF92010E219
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:58:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 404CB2B066B1;
 Mon, 28 Nov 2022 09:58:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Nov 2022 09:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647491; x=
 1669654691; bh=T/qHo/5EgZfy+0EW4M5zGCIWFd3WRbFsz5Qi/IDNilc=; b=F
 dgRzJoAac09fmuXyjbTYNolrXKEFJP7kaTV3eK6dHfUPhBIEqGq+i9zJgCR5MU9e
 7WnkFYR4L71nAn3YgNuaSXKWvJqOG0UiunStfOhGpBalL10uzAzCiI1WBve6bml+
 8jvfa3AdHNdBY1LE4ImM8KVYj2pgFpGvffL88FqEAZpN53xZQ3a0fvd6XV1hAqB/
 T7NmEKE9Olu6LaWjkKe1E/NdnjODXu1x5yD2y8Gho0rhIfl0DVYYP+GN+D6AVt/J
 +Fxr9sO5zAx269v2jn9aFrM70yxmtEYx9EenIf62l7UI+1Gt3U1/GdHXchNbgqZR
 3zj773FRyQ53ZPRQzcy3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647491; x=
 1669654691; bh=T/qHo/5EgZfy+0EW4M5zGCIWFd3WRbFsz5Qi/IDNilc=; b=J
 11VMQZ4A1yoq7B6m+nv49Afa2tacUJcIHygXwAsaZTTe3HAzChILq8pIq5LQjr4g
 JMj8NLXcvlzhYBHzcqxru+uoblLpSLmEaGVCYh0qBdHb0uNaOxFyuRtB4dP7EdzL
 hED0GlbLIaMloVtvVeFi0GBSe+i+f8d9eTPM0PsJlb4Syf+NMT1C1OCyPhZTmBM5
 prvstS3atJAS7gp2enc7hAn2qz2HxRcdHwb5BZwhq1eQg7eKADoZ9czRb1Jo/9SM
 Q/QrYpi3Um1ovFBbJlxZdE3km/9tf5srjaB+nolFdMwL566XDFKRGfFtJe870twq
 7PWHN9bEZdb8pa8PkOqwQ==
X-ME-Sender: <xms:g8yEY1axHVk6pf3hHlz_hy1jDlefN7SDSwySe-wH3bL6KiELWOGYqA>
 <xme:g8yEY8bhNfaJtlHBnFpHTEfKtEOy5qwUKspgGmQ4pyAHcvm_IfspF8t06z0yKi2Jt
 7SsG-NpWyLgiE8e70U>
X-ME-Received: <xmr:g8yEY39dsQtTgLf-Qlusmnf54309tVfxf750ZO32z-v6PZb5oE46XR_51gyBJvH_pGVOnXJMIa1pehspYJQyeIpkinFW2rWJTc4uFostJQGHrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g8yEYzpVfOwHxRbc2wPX9uax5E97oo5-7t_FuP0BK8JmP3DkGQ2gMA>
 <xmx:g8yEYwoqPn9Oryuv9jvdq6G8lh9tsG4oviHpsnuZa4hGVEm_bUkdUw>
 <xmx:g8yEY5R-W_Wttz9ynaOOL6Q-3JlZLLCNKm62CsiwBzWt7SHNWUPQfQ>
 <xmx:g8yEY9LGGlxcm_alBNSF0owN_jo0pgH7V_UsBBAtuGXSjfB42z8w369s4Ww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:58:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:45 +0100
Subject: [PATCH v2 16/17] drm/vc4: tests: Fail the current test if we access a
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-16-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=7654; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=C/ucmAYwpdcP7Js0zpzfjYx2CYQBR31VOSxzqQusrSo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8suzJ5ucOv31undJjNvTZD8sWXOT8bIaB2pIyu9zqXt
 ub7/YkcpC4MYF4OsmCJLjLD5krhTs153svHNg5nDygQyhIGLUwAmknud4Z9OyInvS396VV5xPx171u
 r8SZ36PTLTeuYzvQ8IumSpr/CQkWHlviA/y6tVuapKheF6/O+8OgWbsqJev1HnkxCbv0J5NQ8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Maíra Canal <mairacanal@riseup.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accessing a register when running under kunit is a bad idea since our
device is completely mocked.

Fail the current test if we ever access any of our hardware registers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c      | 13 +++++++++++--
 drivers/gpu/drm/vc4/vc4_dpi.c       | 13 +++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h       | 29 +++++++++++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_dsi.c       |  9 ++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  4 ++++
 drivers/gpu/drm/vc4/vc4_txp.c       | 13 +++++++++++--
 drivers/gpu/drm/vc4/vc4_vec.c       | 13 +++++++++++--
 7 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 21b40d644ace..ad868c24672a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -50,8 +50,17 @@
 
 #define HVS_FIFO_LATENCY_PIX	6
 
-#define CRTC_WRITE(offset, val) writel(val, vc4_crtc->regs + (offset))
-#define CRTC_READ(offset) readl(vc4_crtc->regs + (offset))
+#define CRTC_WRITE(offset, val)								\
+	do {										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		writel(val, vc4_crtc->regs + (offset));					\
+	} while (0)
+
+#define CRTC_READ(offset)								\
+	({										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		readl(vc4_crtc->regs + (offset));					\
+	})
 
 static const struct debugfs_reg32 crtc_regs[] = {
 	VC4_REG32(PV_CONTROL),
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 1f8f44b7b5a5..0edf3c4c98c8 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -103,8 +103,17 @@ to_vc4_dpi(struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_dpi, encoder.base);
 }
 
-#define DPI_READ(offset) readl(dpi->regs + (offset))
-#define DPI_WRITE(offset, val) writel(val, dpi->regs + (offset))
+#define DPI_READ(offset)								\
+	({										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		readl(dpi->regs + (offset));						\
+	})
+
+#define DPI_WRITE(offset, val)								\
+	do {										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		writel(val, dpi->regs + (offset));					\
+	} while (0)
 
 static const struct debugfs_reg32 dpi_regs[] = {
 	VC4_REG32(DPI_C),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 418f4f308e36..78fda5332cb3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -19,6 +19,8 @@
 #include <drm/drm_mm.h>
 #include <drm/drm_modeset_lock.h>
 
+#include <kunit/test-bug.h>
+
 #include "uapi/drm/vc4_drm.h"
 
 struct drm_device;
@@ -645,10 +647,29 @@ to_vc4_crtc_state(const struct drm_crtc_state *crtc_state)
 	return container_of(crtc_state, struct vc4_crtc_state, base);
 }
 
-#define V3D_READ(offset) readl(vc4->v3d->regs + offset)
-#define V3D_WRITE(offset, val) writel(val, vc4->v3d->regs + offset)
-#define HVS_READ(offset) readl(hvs->regs + offset)
-#define HVS_WRITE(offset, val) writel(val, hvs->regs + offset)
+#define V3D_READ(offset)								\
+	({										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		readl(vc4->v3d->regs + (offset));						\
+	})
+
+#define V3D_WRITE(offset, val)								\
+	do {										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		writel(val, vc4->v3d->regs + (offset));					\
+	} while (0)
+
+#define HVS_READ(offset)								\
+	({										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		readl(hvs->regs + (offset));						\
+	})
+
+#define HVS_WRITE(offset, val)								\
+	do {										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		writel(val, hvs->regs + (offset));					\
+	} while (0)
 
 #define VC4_REG32(reg) { .name = #reg, .offset = reg }
 
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 878e05d79e81..2c9cb27903a0 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -617,6 +617,8 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 	dma_cookie_t cookie;
 	int ret;
 
+	kunit_fail_current_test("Accessing a register in a unit test!\n");
+
 	/* DSI0 should be able to write normally. */
 	if (!chan) {
 		writel(val, dsi->regs + offset);
@@ -645,7 +647,12 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 		DRM_ERROR("Failed to wait for DMA: %d\n", ret);
 }
 
-#define DSI_READ(offset) readl(dsi->regs + (offset))
+#define DSI_READ(offset)								\
+	({										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		readl(dsi->regs + (offset));						\
+	})
+
 #define DSI_WRITE(offset, val) dsi_dma_workaround_write(dsi, offset, val)
 #define DSI_PORT_READ(offset) \
 	DSI_READ(dsi->variant->port ? DSI1_##offset : DSI0_##offset)
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 48db438550b1..b04b2fc8d831 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -456,6 +456,8 @@ static inline u32 vc4_hdmi_read(struct vc4_hdmi *hdmi,
 
 	WARN_ON(pm_runtime_status_suspended(&hdmi->pdev->dev));
 
+	kunit_fail_current_test("Accessing an HDMI register in a unit test!\n");
+
 	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
 			 "Invalid register ID %u\n", reg);
@@ -486,6 +488,8 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
 
 	WARN_ON(pm_runtime_status_suspended(&hdmi->pdev->dev));
 
+	kunit_fail_current_test("Accessing an HDMI register in a unit test!\n");
+
 	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
 			 "Invalid register ID %u\n", reg);
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 2b69454b8534..ef5cab2a3aa9 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -145,8 +145,17 @@
 /* Number of lines received and committed to memory. */
 #define TXP_PROGRESS		0x10
 
-#define TXP_READ(offset) readl(txp->regs + (offset))
-#define TXP_WRITE(offset, val) writel(val, txp->regs + (offset))
+#define TXP_READ(offset)								\
+	({										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		readl(txp->regs + (offset));						\
+	})
+
+#define TXP_WRITE(offset, val)								\
+	do {										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		writel(val, txp->regs + (offset));					\
+	} while (0)
 
 struct vc4_txp {
 	struct vc4_crtc	base;
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index e270a4099be3..f589ab918f4d 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -207,8 +207,17 @@ struct vc4_vec {
 	struct debugfs_regset32 regset;
 };
 
-#define VEC_READ(offset) readl(vec->regs + (offset))
-#define VEC_WRITE(offset, val) writel(val, vec->regs + (offset))
+#define VEC_READ(offset)								\
+	({										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		readl(vec->regs + (offset));						\
+	})
+
+#define VEC_WRITE(offset, val)								\
+	do {										\
+		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
+		writel(val, vec->regs + (offset));					\
+	} while (0)
 
 static inline struct vc4_vec *
 encoder_to_vc4_vec(struct drm_encoder *encoder)

-- 
2.38.1-b4-0.11.0-dev-d416f
