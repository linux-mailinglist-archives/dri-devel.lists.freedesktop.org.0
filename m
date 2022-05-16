Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CCE52813A
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB3F10E7FC;
	Mon, 16 May 2022 10:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5906C10E790
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NSPRtUmltVh6ObH1Mhsz7Yl7/HcszeTP1HMUL4e/X/U=; b=Heh8/B6KBQIU19XYOy9FZM2GVC
 FTdQzClOxZzJ9GujKQoQeEq0Wsv44g8dm7RpIFNKWMPmhO/gmsCKoGM4chmSbvMwlnZuqlJGSmfnj
 1p370Z9HWgcAAA2UXs445RMEYGCpbElfI02cPfKUYSONgYLAdIhLf1cp8IPlLUv/2P1rDIomCbwTY
 T8yQm3IxdfUD7R7b62aJLuLGdKvLfL1fg4Hl/bVw/lqIPCzXVnNhCiYPtel/RUDFPAXwp+xcEyzOq
 KOf3i10yWFlk502q7MPvA7jEmwSJ8CxypTeVXEvBSV7LQQ8uwxnlLZMnOZvMFobFJ+l/teryfKenD
 bDY3D3ww==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqXYg-0005yU-2R; Mon, 16 May 2022 13:02:34 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Subject: [PATCH v1 09/13] gpu: host1x: Tegra234 device data and headers
Date: Mon, 16 May 2022 13:02:09 +0300
Message-Id: <20220516100213.1536571-10-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516100213.1536571-1-cyndis@kapsi.fi>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add device data and chip headers for Tegra234.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/Makefile                   |   3 +-
 drivers/gpu/host1x/dev.c                      |  42 ++++
 drivers/gpu/host1x/hw/host1x08.c              |  33 ++++
 drivers/gpu/host1x/hw/host1x08.h              |  15 ++
 drivers/gpu/host1x/hw/host1x08_hardware.h     |  21 ++
 drivers/gpu/host1x/hw/hw_host1x08_channel.h   |  11 ++
 drivers/gpu/host1x/hw/hw_host1x08_common.h    |   4 +
 .../gpu/host1x/hw/hw_host1x08_hypervisor.h    |   9 +
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h    | 181 ++++++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x08_vm.h        |  36 ++++
 10 files changed, 354 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/host1x/hw/host1x08.c
 create mode 100644 drivers/gpu/host1x/hw/host1x08.h
 create mode 100644 drivers/gpu/host1x/hw/host1x08_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_common.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_uclass.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_vm.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 8a65e13d113a..a35ec85f8d65 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -16,7 +16,8 @@ host1x-y = \
 	hw/host1x04.o \
 	hw/host1x05.o \
 	hw/host1x06.o \
-	hw/host1x07.o
+	hw/host1x07.o \
+	hw/host1x08.o
 
 obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
 obj-$(CONFIG_TEGRA_HOST1X_CONTEXT_BUS) += context_bus.o
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index c28939850bf6..0cd3f97e7e49 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -39,6 +39,7 @@
 #include "hw/host1x05.h"
 #include "hw/host1x06.h"
 #include "hw/host1x07.h"
+#include "hw/host1x08.h"
 
 void host1x_common_writel(struct host1x *host1x, u32 v, u32 r)
 {
@@ -205,7 +206,48 @@ static const struct host1x_info host1x07_info = {
 	.reserve_vblank_syncpts = false,
 };
 
+/*
+ * Tegra234 has two stream ID protection tables, one for setting stream IDs
+ * through the channel path via SETSTREAMID, and one for setting them via
+ * MMIO. We program each engine's data stream ID in the channel path table
+ * and firmware stream ID in the MMIO path table.
+ */
+static const struct host1x_sid_entry tegra234_sid_table[] = {
+	{
+		/* VIC channel */
+		.base = 0x17b8,
+		.offset = 0x30,
+		.limit = 0x30
+	},
+	{
+		/* VIC MMIO */
+		.base = 0x1688,
+		.offset = 0x34,
+		.limit = 0x34
+	},
+};
+
+static const struct host1x_info host1x08_info = {
+	.nb_channels = 63,
+	.nb_pts = 1024,
+	.nb_mlocks = 24,
+	.nb_bases = 0,
+	.init = host1x08_init,
+	.sync_offset = 0x0,
+	.dma_mask = DMA_BIT_MASK(40),
+	.has_wide_gather = true,
+	.has_hypervisor = true,
+	.has_common = true,
+	.num_sid_entries = ARRAY_SIZE(tegra234_sid_table),
+	.sid_table = tegra234_sid_table,
+	.streamid_vm_table = { 0x1004, 128 },
+	.classid_vm_table = { 0x1404, 25 },
+	.mmio_vm_table = { 0x1504, 25 },
+	.reserve_vblank_syncpts = false,
+};
+
 static const struct of_device_id host1x_of_match[] = {
+	{ .compatible = "nvidia,tegra234-host1x", .data = &host1x08_info, },
 	{ .compatible = "nvidia,tegra194-host1x", .data = &host1x07_info, },
 	{ .compatible = "nvidia,tegra186-host1x", .data = &host1x06_info, },
 	{ .compatible = "nvidia,tegra210-host1x", .data = &host1x05_info, },
diff --git a/drivers/gpu/host1x/hw/host1x08.c b/drivers/gpu/host1x/hw/host1x08.c
new file mode 100644
index 000000000000..754890c34c74
--- /dev/null
+++ b/drivers/gpu/host1x/hw/host1x08.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Host1x init for Tegra234 SoCs
+ *
+ * Copyright (c) 2022 NVIDIA Corporation.
+ */
+
+/* include hw specification */
+#include "host1x08.h"
+#include "host1x08_hardware.h"
+
+/* include code */
+#define HOST1X_HW 8
+
+#include "cdma_hw.c"
+#include "channel_hw.c"
+#include "debug_hw.c"
+#include "intr_hw.c"
+#include "syncpt_hw.c"
+
+#include "../dev.h"
+
+int host1x08_init(struct host1x *host)
+{
+	host->channel_op = &host1x_channel_ops;
+	host->cdma_op = &host1x_cdma_ops;
+	host->cdma_pb_op = &host1x_pushbuffer_ops;
+	host->syncpt_op = &host1x_syncpt_ops;
+	host->intr_op = &host1x_intr_ops;
+	host->debug_op = &host1x_debug_ops;
+
+	return 0;
+}
diff --git a/drivers/gpu/host1x/hw/host1x08.h b/drivers/gpu/host1x/hw/host1x08.h
new file mode 100644
index 000000000000..a6bad56e44cf
--- /dev/null
+++ b/drivers/gpu/host1x/hw/host1x08.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Host1x init for Tegra234 SoCs
+ *
+ * Copyright (c) 2018 NVIDIA Corporation.
+ */
+
+#ifndef HOST1X_HOST1X08_H
+#define HOST1X_HOST1X08_H
+
+struct host1x;
+
+int host1x08_init(struct host1x *host);
+
+#endif
diff --git a/drivers/gpu/host1x/hw/host1x08_hardware.h b/drivers/gpu/host1x/hw/host1x08_hardware.h
new file mode 100644
index 000000000000..936243060bff
--- /dev/null
+++ b/drivers/gpu/host1x/hw/host1x08_hardware.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Tegra host1x Register Offsets for Tegra234
+ *
+ * Copyright (c) 2022 NVIDIA Corporation.
+ */
+
+#ifndef __HOST1X_HOST1X08_HARDWARE_H
+#define __HOST1X_HOST1X08_HARDWARE_H
+
+#include <linux/types.h>
+#include <linux/bitops.h>
+
+#include "hw_host1x08_uclass.h"
+#include "hw_host1x08_vm.h"
+#include "hw_host1x08_hypervisor.h"
+#include "hw_host1x08_common.h"
+
+#include "opcodes.h"
+
+#endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x08_channel.h b/drivers/gpu/host1x/hw/hw_host1x08_channel.h
new file mode 100644
index 000000000000..c9272d2ab14a
--- /dev/null
+++ b/drivers/gpu/host1x/hw/hw_host1x08_channel.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 NVIDIA Corporation.
+ */
+
+#ifndef HOST1X_HW_HOST1X08_CHANNEL_H
+#define HOST1X_HW_HOST1X08_CHANNEL_H
+
+#define HOST1X_CHANNEL_SMMU_STREAMID 0x084
+
+#endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x08_common.h b/drivers/gpu/host1x/hw/hw_host1x08_common.h
new file mode 100644
index 000000000000..4df28440b86b
--- /dev/null
+++ b/drivers/gpu/host1x/hw/hw_host1x08_common.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 NVIDIA Corporation.
+ */
diff --git a/drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h b/drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h
new file mode 100644
index 000000000000..22964324c914
--- /dev/null
+++ b/drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 NVIDIA Corporation.
+ */
+
+#define HOST1X_HV_SYNCPT_PROT_EN			0x1724
+#define HOST1X_HV_SYNCPT_PROT_EN_CH_EN			BIT(1)
+#define HOST1X_HV_CH_MLOCK_EN(x)			(0x1700 + (x * 4))
+#define HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(x)		(0x1710 + (x * 4))
diff --git a/drivers/gpu/host1x/hw/hw_host1x08_uclass.h b/drivers/gpu/host1x/hw/hw_host1x08_uclass.h
new file mode 100644
index 000000000000..724cccd71aa1
--- /dev/null
+++ b/drivers/gpu/host1x/hw/hw_host1x08_uclass.h
@@ -0,0 +1,181 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018 NVIDIA Corporation.
+ */
+
+ /*
+  * Function naming determines intended use:
+  *
+  *     <x>_r(void) : Returns the offset for register <x>.
+  *
+  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
+  *
+  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
+  *
+  *     <x>_<y>_f(u32 v) : Returns a value based on 'v' which has been shifted
+  *         and masked to place it at field <y> of register <x>.  This value
+  *         can be |'d with others to produce a full register value for
+  *         register <x>.
+  *
+  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
+  *         value can be ~'d and then &'d to clear the value of field <y> for
+  *         register <x>.
+  *
+  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
+  *         to place it at field <y> of register <x>.  This value can be |'d
+  *         with others to produce a full register value for <x>.
+  *
+  *     <x>_<y>_v(u32 r) : Returns the value of field <y> from a full register
+  *         <x> value 'r' after being shifted to place its LSB at bit 0.
+  *         This value is suitable for direct comparison with other unshifted
+  *         values appropriate for use in field <y> of register <x>.
+  *
+  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
+  *         field <y> of register <x>.  This value is suitable for direct
+  *         comparison with unshifted values appropriate for use in field <y>
+  *         of register <x>.
+  */
+
+#ifndef HOST1X_HW_HOST1X08_UCLASS_H
+#define HOST1X_HW_HOST1X08_UCLASS_H
+
+static inline u32 host1x_uclass_incr_syncpt_r(void)
+{
+	return 0x0;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT \
+	host1x_uclass_incr_syncpt_r()
+static inline u32 host1x_uclass_incr_syncpt_cond_f(u32 v)
+{
+	return (v & 0xff) << 10;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT_COND_F(v) \
+	host1x_uclass_incr_syncpt_cond_f(v)
+static inline u32 host1x_uclass_incr_syncpt_indx_f(u32 v)
+{
+	return (v & 0xff) << 0;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT_INDX_F(v) \
+	host1x_uclass_incr_syncpt_indx_f(v)
+static inline u32 host1x_uclass_wait_syncpt_r(void)
+{
+	return 0x8;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT \
+	host1x_uclass_wait_syncpt_r()
+static inline u32 host1x_uclass_wait_syncpt_indx_f(u32 v)
+{
+	return (v & 0xff) << 24;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_INDX_F(v) \
+	host1x_uclass_wait_syncpt_indx_f(v)
+static inline u32 host1x_uclass_wait_syncpt_thresh_f(u32 v)
+{
+	return (v & 0xffffff) << 0;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_THRESH_F(v) \
+	host1x_uclass_wait_syncpt_thresh_f(v)
+static inline u32 host1x_uclass_wait_syncpt_base_r(void)
+{
+	return 0x9;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_BASE \
+	host1x_uclass_wait_syncpt_base_r()
+static inline u32 host1x_uclass_wait_syncpt_base_indx_f(u32 v)
+{
+	return (v & 0xff) << 24;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_BASE_INDX_F(v) \
+	host1x_uclass_wait_syncpt_base_indx_f(v)
+static inline u32 host1x_uclass_wait_syncpt_base_base_indx_f(u32 v)
+{
+	return (v & 0xff) << 16;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_BASE_BASE_INDX_F(v) \
+	host1x_uclass_wait_syncpt_base_base_indx_f(v)
+static inline u32 host1x_uclass_wait_syncpt_base_offset_f(u32 v)
+{
+	return (v & 0xffff) << 0;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_BASE_OFFSET_F(v) \
+	host1x_uclass_wait_syncpt_base_offset_f(v)
+static inline u32 host1x_uclass_load_syncpt_base_r(void)
+{
+	return 0xb;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_BASE \
+	host1x_uclass_load_syncpt_base_r()
+static inline u32 host1x_uclass_load_syncpt_base_base_indx_f(u32 v)
+{
+	return (v & 0xff) << 24;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_BASE_BASE_INDX_F(v) \
+	host1x_uclass_load_syncpt_base_base_indx_f(v)
+static inline u32 host1x_uclass_load_syncpt_base_value_f(u32 v)
+{
+	return (v & 0xffffff) << 0;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_BASE_VALUE_F(v) \
+	host1x_uclass_load_syncpt_base_value_f(v)
+static inline u32 host1x_uclass_incr_syncpt_base_base_indx_f(u32 v)
+{
+	return (v & 0xff) << 24;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT_BASE_BASE_INDX_F(v) \
+	host1x_uclass_incr_syncpt_base_base_indx_f(v)
+static inline u32 host1x_uclass_incr_syncpt_base_offset_f(u32 v)
+{
+	return (v & 0xffffff) << 0;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT_BASE_OFFSET_F(v) \
+	host1x_uclass_incr_syncpt_base_offset_f(v)
+static inline u32 host1x_uclass_indoff_r(void)
+{
+	return 0x2d;
+}
+#define HOST1X_UCLASS_INDOFF \
+	host1x_uclass_indoff_r()
+static inline u32 host1x_uclass_indoff_indbe_f(u32 v)
+{
+	return (v & 0xf) << 28;
+}
+#define HOST1X_UCLASS_INDOFF_INDBE_F(v) \
+	host1x_uclass_indoff_indbe_f(v)
+static inline u32 host1x_uclass_indoff_autoinc_f(u32 v)
+{
+	return (v & 0x1) << 27;
+}
+#define HOST1X_UCLASS_INDOFF_AUTOINC_F(v) \
+	host1x_uclass_indoff_autoinc_f(v)
+static inline u32 host1x_uclass_indoff_indmodid_f(u32 v)
+{
+	return (v & 0xff) << 18;
+}
+#define HOST1X_UCLASS_INDOFF_INDMODID_F(v) \
+	host1x_uclass_indoff_indmodid_f(v)
+static inline u32 host1x_uclass_indoff_indroffset_f(u32 v)
+{
+	return (v & 0xffff) << 2;
+}
+#define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
+	host1x_uclass_indoff_indroffset_f(v)
+static inline u32 host1x_uclass_indoff_rwn_read_v(void)
+{
+	return 1;
+}
+#define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
+	host1x_uclass_indoff_indroffset_f(v)
+static inline u32 host1x_uclass_load_syncpt_payload_32_r(void)
+{
+	return 0x4e;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32 \
+	host1x_uclass_load_syncpt_payload_32_r()
+static inline u32 host1x_uclass_wait_syncpt_32_r(void)
+{
+	return 0x50;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_32 \
+	host1x_uclass_wait_syncpt_32_r()
+
+#endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x08_vm.h b/drivers/gpu/host1x/hw/hw_host1x08_vm.h
new file mode 100644
index 000000000000..1455a4670bf8
--- /dev/null
+++ b/drivers/gpu/host1x/hw/hw_host1x08_vm.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 NVIDIA Corporation.
+ */
+
+#define HOST1X_CHANNEL_DMASTART				0x0000
+#define HOST1X_CHANNEL_DMASTART_HI			0x0004
+#define HOST1X_CHANNEL_DMAPUT				0x0008
+#define HOST1X_CHANNEL_DMAPUT_HI			0x000c
+#define HOST1X_CHANNEL_DMAGET				0x0010
+#define HOST1X_CHANNEL_DMAGET_HI			0x0014
+#define HOST1X_CHANNEL_DMAEND				0x0018
+#define HOST1X_CHANNEL_DMAEND_HI			0x001c
+#define HOST1X_CHANNEL_DMACTRL				0x0020
+#define HOST1X_CHANNEL_DMACTRL_DMASTOP			BIT(0)
+#define HOST1X_CHANNEL_DMACTRL_DMAGETRST		BIT(1)
+#define HOST1X_CHANNEL_DMACTRL_DMAINITGET		BIT(2)
+#define HOST1X_CHANNEL_CMDFIFO_STAT			0x0024
+#define HOST1X_CHANNEL_CMDFIFO_STAT_EMPTY		BIT(13)
+#define HOST1X_CHANNEL_CMDFIFO_RDATA			0x0028
+#define HOST1X_CHANNEL_CMDP_OFFSET			0x0030
+#define HOST1X_CHANNEL_CMDP_CLASS			0x0034
+#define HOST1X_CHANNEL_CHANNELSTAT			0x0038
+#define HOST1X_CHANNEL_CMDPROC_STOP			0x0048
+#define HOST1X_CHANNEL_TEARDOWN				0x004c
+#define HOST1X_CHANNEL_SMMU_STREAMID			0x0084
+
+#define HOST1X_SYNC_SYNCPT_CPU_INCR(x)			(0x6400 + 4 * (x))
+#define HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(x)	(0x6600 + 4 * (x))
+#define HOST1X_SYNC_SYNCPT_INTR_DEST(x)			(0x6684 + 4 * (x))
+#define HOST1X_SYNC_SYNCPT_THRESH_INT_ENABLE_CPU0(x)	(0x770c + 4 * (x))
+#define HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(x)	(0x7790 + 4 * (x))
+#define HOST1X_SYNC_SYNCPT(x)				(0x8080 + 4 * (x))
+#define HOST1X_SYNC_SYNCPT_INT_THRESH(x)		(0xa088 + 4 * (x))
+#define HOST1X_SYNC_SYNCPT_CH_APP(x)			(0xb090 + 4 * (x))
+#define HOST1X_SYNC_SYNCPT_CH_APP_CH(v)			(((v) & 0x3f) << 8)
-- 
2.36.1

