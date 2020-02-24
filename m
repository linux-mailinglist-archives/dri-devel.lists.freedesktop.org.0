Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F416A298
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F476E32C;
	Mon, 24 Feb 2020 09:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11866E225
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id C6B21611;
 Mon, 24 Feb 2020 04:09:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=H/2y1u+18pkIE
 R5sI0A+gvL3htUncY5w9ZHNgfRxgqU=; b=vR9TUvGVu3mc6/7epDAoFCWastzrs
 446Yre3SePqp9JlKnCKUEMVNmY+scfNEYbluPk0LcI1T22u5T4q8kfUM+j6LCHWo
 1U90LuBQUfnl0bbQYHmP6VwVA83TfCfpq/tdcTlz2G++DLHuZrvCpZD63l+czu4G
 0wDnAh+Yxjk/SPp8lv0t1PP33FlVOvtnYeuqHNjCeaXhg1o/AH4AzaP8L3AfJWZs
 /gcxOKEDcJAfnEEMCuPBYwCM5GXohuW4NQomYH7KsMb/KDJYI14/4rUaPA0lh8lA
 x69kYGcwUXuvdEYookjeUQHSsAqHHY20pD4Fl0NfZ7WxSgHNpJfk1iYuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=H/2y1u+18pkIER5sI0A+gvL3htUncY5w9ZHNgfRxgqU=; b=bJ7hYLjC
 ceExO9si8LhJKLFqPKVsJJMVOlJY92jq1mCZMe5XXdaufWOBu83dkAYFRk7rgEeh
 ypcXzLlO6NthI1iGxlVF5MXlzkLHBa8rOxYQ0E+DVCYrBSGD+puH3TNRk4B3RA6U
 LNZ7dKgS4e0n1KuqYQ4XVTQlcPS3KQMHR7eGPDUzWnYK02dxWmMUAcTR/aE33ubk
 CQ8b6NunwofuQBn2cKPrH4IlYqCAjDXDPaO0Z03WEuWbRWU9uWpxy8yTAoyzRRL4
 hLCExchpUURwPzjJ3jzhcn7oczcKN/L12+K6r5vGrzzKq8PhWNNVcE4fYi6HlIa3
 xsqChZnBzPiixw==
X-ME-Sender: <xms:xJJTXvmkDbhpob0r-7YTbqLfIvbZSX8OEU_22rjzOPEtTNDnw_E9yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvddunecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xJJTXlH4YKJw6ucuycshVVC1y2vONeJEUfefwVg23onISZKGREQXxw>
 <xmx:xJJTXn5cUlZjNZ65y58MSKvfczjYk1X-flM7zboxXWxg9Ejy2HLNCw>
 <xmx:xJJTXtkDAtf4LyeRXKCbjNt37NCSy4m79-8yeMiTFfrFMKWUgIxPtg>
 <xmx:xJJTXmi1rcAmzoVyimPIWxvAV1udyaEHXwz2yNiuaGmgigUbdF5w9WQf-IQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DDC7B328005E;
 Mon, 24 Feb 2020 04:09:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 24/89] reset: Move reset-simple header out of drivers/reset
Date: Mon, 24 Feb 2020 10:06:26 +0100
Message-Id: <a0216935ea55e03e98cd8fdf1d07782424d1aaa4.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
