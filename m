Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A0B2AAE15
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715BA89817;
	Sun,  8 Nov 2020 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA60A6EA8F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 15:14:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BB1C15806FC;
 Fri,  6 Nov 2020 10:14:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 06 Nov 2020 10:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Eg4JWQqjWxIR/
 zO0gXgSwPEyTCTZbt2FCx+KcRhEn7I=; b=iyPyM3ECswpAxG3vT6eWTnxnhcMnO
 7lewE6u2noPU3CteiyyHpGyhFFylbX6DZbVkgl+42Zs2fLEt28HeIP1JOjSNDzRp
 RQbIpZf+wwIuOb4vd3T5umOaSDS5uana7+DA4koIYf0qpY0MN94pcqR4D6t3uA2i
 Vm0j09ekvi+r8JV/jgIED7zNSs2tHrlSVoWNimS2uh+PSP3OFsmSba836okRWaHI
 LvG2Z+qpu4wLpp9mdTiDKqYMjJThXClc4va7DTmNzg7RZgQSV/M1WyIkZIXQ8ZCf
 IVH0fxuTdigKzvZ8VoHyOQullUfzWdu6YuSpv180AAsq+9Qqi73fmu1Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Eg4JWQqjWxIR/zO0gXgSwPEyTCTZbt2FCx+KcRhEn7I=; b=XbXO4mFO
 jpJDWloV0oLiDcfypahhUEPf0pvVWT7Fbnz+ptAuQND3QId9IzMl/CYIBKuzUV2o
 FaSM2/qm7fYsKcUz9GaUAxa1UoURaH5J6JjuhdKCflZOpulNe2rJUshbYxTrP7s+
 49byyGv+UizVX6jm7yaYliLKcRuVwiauACIO0+jBxg5CGpyg6fewvtu7JlODR9O6
 7VXvm+yGfqSPOsGz0sVwwa0Wofjyp4A8rFNcbiQLdqZivNhdiqwqd6cxAvAXwlxx
 T1kffanfpRU0aEPhpyEPdDri7yd/rq03YXa8Jh9O8v+v1332csz+X0uhEKdmmOfB
 anFyq5ezezD7dA==
X-ME-Sender: <xms:SGilX5jl8-04-_EtistVL2rLFkNaE3HSPuP2EC-yP_pEvibz3iopfg>
 <xme:SGilX-BtNTEsGcB08YqdVptlkiyZQ7Y_7ll8lJza712ZLHKEQ0yM8c9gX2xS48mJJ
 eqx50dTdhv9TTmRmrU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SGilX5FgV3YrafQAewai08iGaqQHh8CRHNOlJZ6ckO1b8tuag3YXtA>
 <xmx:SGilX-TPhexYOuTrNaOlHjxjP3GdNqH3Yh9keJHfWqQp36tB27EFfw>
 <xmx:SGilX2wgNIj0rOYi-PCTL36L_-ZSE2Bvljr5W-7EM7oTjhPXC8SnCA>
 <xmx:SGilX7KquAIA-ZDDUai-gnq4X-K9Ibe8F6UR7RyvSk-mBvu1JfNxFA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28304306005B;
 Fri,  6 Nov 2020 10:14:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/7] soc: sunxi: Deal with the MBUS DMA offsets in a central
 place
Date: Fri,  6 Nov 2020 16:14:06 +0100
Message-Id: <20201106151411.321743-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106151411.321743-1-maxime@cerno.tech>
References: <20201106151411.321743-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: devel@driverdev.osuosl.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <maxime@cerno.tech>, Yong Deng <yong.deng@magewell.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So far most of the drivers with the MBUS quirks had to duplicate the
code to deal with DT compatibility and enforcing the DMA offsets.

Let's move for a more maintainable solution by putting everything in a
notifier that would take care of setting up the DMA offsets for all the
MBUS devices.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/soc/sunxi/Kconfig      |   8 ++
 drivers/soc/sunxi/Makefile     |   1 +
 drivers/soc/sunxi/sunxi_mbus.c | 132 +++++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/soc/sunxi/sunxi_mbus.c

diff --git a/drivers/soc/sunxi/Kconfig b/drivers/soc/sunxi/Kconfig
index f10fd6cae13e..1fef0e711056 100644
--- a/drivers/soc/sunxi/Kconfig
+++ b/drivers/soc/sunxi/Kconfig
@@ -2,6 +2,14 @@
 #
 # Allwinner sunXi SoC drivers
 #
+
+config SUNXI_MBUS
+	bool
+	default ARCH_SUNXI
+	help
+	  Say y to enable the fixups needed to support the Allwinner
+	  MBUS DMA quirks.
+
 config SUNXI_SRAM
 	bool
 	default ARCH_SUNXI
diff --git a/drivers/soc/sunxi/Makefile b/drivers/soc/sunxi/Makefile
index 7816fbbec387..549159571d4f 100644
--- a/drivers/soc/sunxi/Makefile
+++ b/drivers/soc/sunxi/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SUNXI_MBUS) +=	sunxi_mbus.o
 obj-$(CONFIG_SUNXI_SRAM) +=	sunxi_sram.o
diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
new file mode 100644
index 000000000000..a9d077f73c3a
--- /dev/null
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2020 Maxime Ripard <maxime@cerno.tech> */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static const char * const sunxi_mbus_devices[] = {
+	/*
+	 * The display engine virtual devices are not strictly speaking
+	 * connected to the MBUS, but since DRM will perform all the
+	 * memory allocations and DMA operations through that device, we
+	 * need to have the quirk on those devices too.
+	 */
+	"allwinner,sun4i-a10-display-engine",
+	"allwinner,sun5i-a10s-display-engine",
+	"allwinner,sun5i-a13-display-engine",
+	"allwinner,sun6i-a31-display-engine",
+	"allwinner,sun6i-a31s-display-engine",
+	"allwinner,sun7i-a20-display-engine",
+	"allwinner,sun8i-a23-display-engine",
+	"allwinner,sun8i-a33-display-engine",
+	"allwinner,sun8i-a83t-display-engine",
+	"allwinner,sun8i-h3-display-engine",
+	"allwinner,sun8i-r40-display-engine",
+	"allwinner,sun8i-v3s-display-engine",
+	"allwinner,sun9i-a80-display-engine",
+	"allwinner,sun50i-a64-display-engine",
+
+	/*
+	 * And now we have the regular devices connected to the MBUS
+	 * (that we know of).
+	 */
+	"allwinner,sun4i-a10-csi1",
+	"allwinner,sun4i-a10-display-backend",
+	"allwinner,sun4i-a10-display-frontend",
+	"allwinner,sun4i-a10-video-engine",
+	"allwinner,sun5i-a13-display-backend",
+	"allwinner,sun5i-a13-video-engine",
+	"allwinner,sun6i-a31-csi",
+	"allwinner,sun6i-a31-display-backend",
+	"allwinner,sun7i-a20-csi0",
+	"allwinner,sun7i-a20-display-backend",
+	"allwinner,sun7i-a20-display-frontend",
+	"allwinner,sun7i-a20-video-engine",
+	"allwinner,sun8i-a23-display-backend",
+	"allwinner,sun8i-a23-display-frontend",
+	"allwinner,sun8i-a33-display-backend",
+	"allwinner,sun8i-a33-display-frontend",
+	"allwinner,sun8i-a33-video-engine",
+	"allwinner,sun8i-a83t-csi",
+	"allwinner,sun8i-h3-csi",
+	"allwinner,sun8i-h3-video-engine",
+	"allwinner,sun8i-v3s-csi",
+	"allwinner,sun9i-a80-display-backend",
+	"allwinner,sun50i-a64-csi",
+	"allwinner,sun50i-a64-video-engine",
+	"allwinner,sun50i-h5-video-engine",
+	NULL,
+};
+
+static int sunxi_mbus_notifier(struct notifier_block *nb,
+			       unsigned long event, void *__dev)
+{
+	struct device *dev = __dev;
+	int ret;
+
+	if (event != BUS_NOTIFY_ADD_DEVICE)
+		return NOTIFY_DONE;
+
+	/*
+	 * Only the devices that need a large memory bandwidth do DMA
+	 * directly over the memory bus (called MBUS), instead of going
+	 * through the regular system bus.
+	 */
+	if (!of_device_compatible_match(dev->of_node, sunxi_mbus_devices))
+		return NOTIFY_DONE;
+
+	/*
+	 * Devices with an interconnects property have the MBUS
+	 * relationship described in their DT and dealt with by
+	 * of_dma_configure, so we can just skip them.
+	 *
+	 * Older DTs or SoCs who are not clearly understood need to set
+	 * that DMA offset though.
+	 */
+	if (of_find_property(dev->of_node, "interconnects", NULL))
+		return NOTIFY_DONE;
+
+	ret = dma_direct_set_offset(dev, PHYS_OFFSET, 0, SZ_4G);
+	if (ret)
+		dev_err(dev, "Couldn't setup our DMA offset: %d\n", ret);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block sunxi_mbus_nb = {
+	.notifier_call = sunxi_mbus_notifier,
+};
+
+static const char * const sunxi_mbus_platforms[] __initconst = {
+	"allwinner,sun4i-a10",
+	"allwinner,sun5i-a10s",
+	"allwinner,sun5i-a13",
+	"allwinner,sun6i-a31",
+	"allwinner,sun7i-a20",
+	"allwinner,sun8i-a23",
+	"allwinner,sun8i-a33",
+	"allwinner,sun8i-a83t",
+	"allwinner,sun8i-h3",
+	"allwinner,sun8i-r40",
+	"allwinner,sun8i-v3",
+	"allwinner,sun8i-v3s",
+	"allwinner,sun9i-a80",
+	"allwinner,sun50i-a64",
+	"allwinner,sun50i-h5",
+	"nextthing,gr8",
+	NULL,
+};
+
+static int __init sunxi_mbus_init(void)
+{
+	if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
+		return 0;
+
+	bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);
+	return 0;
+}
+arch_initcall(sunxi_mbus_init);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
