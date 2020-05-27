Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830F1E593A
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5486D6E40C;
	Thu, 28 May 2020 07:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657976E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DCEF3581FE3;
 Wed, 27 May 2020 11:49:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ET50CDHB8TJGj
 iykYoaPxDVVGYTjSyMOvmiDrMK+Rx0=; b=d/5nAYhUFGoS5ydVtqNZ8KB9PZVH1
 M7YlgzMDsJg00QCJgY63oFmbcLv1Ud/XTDL0zz5/Ki9RAi5zW3nxSyfetwxjeDuD
 tX5zYMITEc0eLv+EcGJGRjyJ05D8PA45me1tqgjpukqkqUEpG4GTMhNp6bmOxWyA
 7I+2AzQ6MM24rmJJ2VcbEFE7bJKSh4srn162GPCR5I3ZSS4cNvEsNtKl+Q9RKfoR
 IcxTW9XWW03+rNKowaky6Cgo1dr0B2zxh5zUwcSvEWhGY5eGBBryK311btlx3NI4
 CS5GEk0rcIVnzloSm9LCEyvfMJ4HnoFH+ByIatRANJVFzaa/L0b24CvVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ET50CDHB8TJGjiykYoaPxDVVGYTjSyMOvmiDrMK+Rx0=; b=khMCP2eJ
 /gRzBF2uNkjYBtVdyz1vFmD7ZUyYM9ln+4x98KjB9wSpwOg5vygnzsz1CSm0iHEl
 MPjiKV/ox8cx7fR5cJiDroU1ssGFDS2KE1MKTyilfGzubs98aBTWJeJByfrbdMoh
 RmqmDBGTe/XgTvh/g0CFP5+dV8Gzu9pvdSZbta9O1suSHR89KyK9Vio9JFf9HQCT
 tHFYU10EMYnmNDOytF7N+kIeu7VWQXSNF6fWRuGgUbl9SaQp+BFKHYcNCGLvnZuW
 bojcYw4ao2wE9mgJpg+gb9AWcEHK0nR5uj5KgxPGVKM4XPqdhb53jRdmiZyu9Rgb
 ITQIi8b3EYw5tA==
X-ME-Sender: <xms:_ovOXvkeLH4DDKfb7dMCBzZO_LM5juLIkiZavNrpL8HJ8ZUqo8Ecgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_ovOXi0CHyDVApk6q2GkeNfJuesv86XLwyo11frDSyQIuSN5WNoNLQ>
 <xmx:_ovOXlqzBIj894cw4yCr3Hj6gITQtEBsHPeIuPC1vnJ1Q1BYlT6M-Q>
 <xmx:_ovOXnml_srU8XYJlDEumW4grFAfzhMUvnKI2vh0OXZnYuWnxHMpyQ>
 <xmx:_ovOXmImD89ensT7gNt5u7Qv0BWq5AxuM82k5d1MpIltTjbY6Gz8rQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7CAB83061856;
 Wed, 27 May 2020 11:49:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 001/105] reset: Move reset-simple header out of
 drivers/reset
Date: Wed, 27 May 2020 17:47:31 +0200
Message-Id: <d908a44996c817540a38c72c65cb99d939a9fa6d.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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

The reset-simple code can be useful for drivers outside of drivers/reset
that have a few reset controls as part of their features. Let's move it to
include/linux/reset.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/reset/reset-simple.c        |  3 +--
 drivers/reset/reset-simple.h        | 41 +------------------------------
 drivers/reset/reset-socfpga.c       |  3 +--
 drivers/reset/reset-sunxi.c         |  3 +--
 drivers/reset/reset-uniphier-glue.c |  3 +--
 include/linux/reset/reset-simple.h  | 41 ++++++++++++++++++++++++++++++-
 6 files changed, 45 insertions(+), 49 deletions(-)
 delete mode 100644 drivers/reset/reset-simple.h
 create mode 100644 include/linux/reset/reset-simple.h

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 067e7e7b34f1..c854aa351640 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -18,10 +18,9 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
 #include <linux/spinlock.h>
 
-#include "reset-simple.h"
-
 static inline struct reset_simple_data *
 to_reset_simple_data(struct reset_controller_dev *rcdev)
 {
diff --git a/drivers/reset/reset-simple.h b/drivers/reset/reset-simple.h
deleted file mode 100644
index 08ccb25a55e6..000000000000
--- a/drivers/reset/reset-simple.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Simple Reset Controller ops
- *
- * Based on Allwinner SoCs Reset Controller driver
- *
- * Copyright 2013 Maxime Ripard
- *
- * Maxime Ripard <maxime.ripard@free-electrons.com>
- */
-
-#ifndef __RESET_SIMPLE_H__
-#define __RESET_SIMPLE_H__
-
-#include <linux/io.h>
-#include <linux/reset-controller.h>
-#include <linux/spinlock.h>
-
-/**
- * struct reset_simple_data - driver data for simple reset controllers
- * @lock: spinlock to protect registers during read-modify-write cycles
- * @membase: memory mapped I/O register range
- * @rcdev: reset controller device base structure
- * @active_low: if true, bits are cleared to assert the reset. Otherwise, bits
- *              are set to assert the reset. Note that this says nothing about
- *              the voltage level of the actual reset line.
- * @status_active_low: if true, bits read back as cleared while the reset is
- *                     asserted. Otherwise, bits read back as set while the
- *                     reset is asserted.
- */
-struct reset_simple_data {
-	spinlock_t			lock;
-	void __iomem			*membase;
-	struct reset_controller_dev	rcdev;
-	bool				active_low;
-	bool				status_active_low;
-};
-
-extern const struct reset_control_ops reset_simple_ops;
-
-#endif /* __RESET_SIMPLE_H__ */
diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
index 96953992c2bb..bdd984296196 100644
--- a/drivers/reset/reset-socfpga.c
+++ b/drivers/reset/reset-socfpga.c
@@ -11,13 +11,12 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
 #include <linux/reset/socfpga.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#include "reset-simple.h"
-
 #define SOCFPGA_NR_BANKS	8
 
 static int a10_reset_init(struct device_node *np)
diff --git a/drivers/reset/reset-sunxi.c b/drivers/reset/reset-sunxi.c
index e7f169e57bcf..e752594b6971 100644
--- a/drivers/reset/reset-sunxi.c
+++ b/drivers/reset/reset-sunxi.c
@@ -14,13 +14,12 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
 #include <linux/reset/sunxi.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#include "reset-simple.h"
-
 static int sunxi_reset_init(struct device_node *np)
 {
 	struct reset_simple_data *data;
diff --git a/drivers/reset/reset-uniphier-glue.c b/drivers/reset/reset-uniphier-glue.c
index 2b188b3bb69a..027990b79f61 100644
--- a/drivers/reset/reset-uniphier-glue.c
+++ b/drivers/reset/reset-uniphier-glue.c
@@ -9,8 +9,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
-
-#include "reset-simple.h"
+#include <linux/reset/reset-simple.h>
 
 #define MAX_CLKS	2
 #define MAX_RSTS	2
diff --git a/include/linux/reset/reset-simple.h b/include/linux/reset/reset-simple.h
new file mode 100644
index 000000000000..08ccb25a55e6
--- /dev/null
+++ b/include/linux/reset/reset-simple.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Simple Reset Controller ops
+ *
+ * Based on Allwinner SoCs Reset Controller driver
+ *
+ * Copyright 2013 Maxime Ripard
+ *
+ * Maxime Ripard <maxime.ripard@free-electrons.com>
+ */
+
+#ifndef __RESET_SIMPLE_H__
+#define __RESET_SIMPLE_H__
+
+#include <linux/io.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+
+/**
+ * struct reset_simple_data - driver data for simple reset controllers
+ * @lock: spinlock to protect registers during read-modify-write cycles
+ * @membase: memory mapped I/O register range
+ * @rcdev: reset controller device base structure
+ * @active_low: if true, bits are cleared to assert the reset. Otherwise, bits
+ *              are set to assert the reset. Note that this says nothing about
+ *              the voltage level of the actual reset line.
+ * @status_active_low: if true, bits read back as cleared while the reset is
+ *                     asserted. Otherwise, bits read back as set while the
+ *                     reset is asserted.
+ */
+struct reset_simple_data {
+	spinlock_t			lock;
+	void __iomem			*membase;
+	struct reset_controller_dev	rcdev;
+	bool				active_low;
+	bool				status_active_low;
+};
+
+extern const struct reset_control_ops reset_simple_ops;
+
+#endif /* __RESET_SIMPLE_H__ */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
