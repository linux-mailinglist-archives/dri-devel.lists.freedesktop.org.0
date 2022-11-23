Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167356363B9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DED10E593;
	Wed, 23 Nov 2022 15:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0A310E597
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:30:35 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 97E362B069B3;
 Wed, 23 Nov 2022 10:30:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Nov 2022 10:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217432; x=
 1669224632; bh=PInW46Mf1B/UYZgG0wNLZ/9p9A1Gm+pmd5rhlVQpAoY=; b=k
 6lu/FuC8Xkz3dnkvII+dE0VVW4GR0YIOruv/Wm4uov4MIAl8ptF5EOu/2LJW5NBm
 GiMom/wHl7EE56u9QejAUrG8OkInivaQ3bLyxclEwr8Z3LklwaP5paEFI3ScrwxF
 05YEv69yN1Nba3O8AUTxmmRji8jnGhtV4FNaJgvDfx2w/v+ZtO/1wgx8pWOZ2spz
 bPJLYYv9U/ATOOwWFWvT9SykzK671myVl0fCCbKybswunFqYTsx5iSk2Rd5sZYip
 pMn5rR9zGsQZDWhPUrvmgg6vUFQxsk/orsMh0sGtxzbBWSObjLfEt1KlDBTbdxpA
 VOo72VWMwp5BOSL0AcPYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217432; x=
 1669224632; bh=PInW46Mf1B/UYZgG0wNLZ/9p9A1Gm+pmd5rhlVQpAoY=; b=N
 kHib9j33DEtAYhWlBA7cvxZf74RZAzr/hIJa1A5CYunMYVqGaDqhdyrQTCihB5Yh
 kZT41hjJom2R8vpgWCE6Hl3kM3UVqjqbCstHy8k0M0gOeOJ3Z64s7fLa9eqmML/c
 XrUSW99aYOYIFScdevWCxsxl2wmLAFadt7VtgNYI68LzvKKge5ybXFnWxogxWaZL
 Y3cn1GcYeUgdO2AY3CsPGdb8pWHMKba2Lu6axs6/9X64JGA3IyHMh7qGHadM7j9S
 tT0YLyHfQYD9F08qBM+lJJuErCLvyoLzTb6V9g8e1Eqyg5YR9zeSFZ9vYFHkXEiR
 PgnRp/C2EGZQ8y6EQUGug==
X-ME-Sender: <xms:mDx-Y7583LFh3OcsCv02vNDUItbkPqkkOGhrKpdK7-SugVt8dPsltQ>
 <xme:mDx-Yw7tEd5h_M_02oEYd5Ez3xdETu8Rhzs3bF-xCmhkEYYlbkcq0vBRMou-5hOgC
 4W4izQof1gmnmeOy80>
X-ME-Received: <xmr:mDx-Yyfb5EykpMJIpgKoF3qd7iM9AJolpDn9wMlOXIWfNNnjOfj_gLe4AfWY_6IRfXrwyfrSQABNAnLo8QnUJPAUd6Rq_k6r6BAVDvVu1NOhyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mDx-Y8LFLXl7CKVHOwwcNXQQNCFo4bxPz3xZEEOj2fCAzsK5nOhW8A>
 <xmx:mDx-Y_JDRX-uzh80_dyNjD-7dQzGxOLUty7JfyQKz2tPLyZyK8e9TQ>
 <xmx:mDx-Y1z2h2sE-R-fAMwH_gaaJRd9tHEH0jYUhwaaHibikV1dB5vC5Q>
 <xmx:mDx-Y7rJzVqF84l0njKsEJrSOe1zUDO0T0beeOd4qxDIizxpx3pgWsLWMb0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:30:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:26:05 +0100
Subject: [PATCH 23/24] drm/vc4: tests: Fail the current test if we access a
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-23-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=7654; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5dadrjPFsgwFBAf3QWF0Jlq69VdDQFw4v7XG9R/543g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11jX93/x+7z05m1/5/fQ7PrNsC16FuUoFTd7lFzJvndWN
 sLK7HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIRkmGv2JfY2/cSC2/LiiwrO5PTZ
 WM/dXXW6Vyr3w+P/PsFedT9xQY/pe//xNoXy9Qw/6pOUSKO9H6cH6LWorQjAqT8ANeSZvDWQA=
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
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
index e2a56c32a124..d13033ed8848 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -19,6 +19,8 @@
 #include <drm/drm_mm.h>
 #include <drm/drm_modeset_lock.h>
 
+#include <kunit/test-bug.h>
+
 #include "uapi/drm/vc4_drm.h"
 
 struct drm_device;
@@ -642,10 +644,29 @@ to_vc4_crtc_state(const struct drm_crtc_state *crtc_state)
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
index 92c07e31d632..79bdef35db76 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -175,8 +175,17 @@ struct vc4_vec {
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
