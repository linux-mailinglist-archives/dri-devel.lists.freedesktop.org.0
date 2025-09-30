Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D5BAB78C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C63510E4C9;
	Tue, 30 Sep 2025 05:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="kTpteuLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2638210E271
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:07 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250930035538epoutp01695953410709694147303747aefbc6ce~p8zT4DhfL3131931319epoutp01f
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250930035538epoutp01695953410709694147303747aefbc6ce~p8zT4DhfL3131931319epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204538;
 bh=4Xu/MsBJmxCSwDpo2xSTI4a7uCG2vamd7m4a7sW0ahg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kTpteuLVAiT5RcJFWp6jWj5ITKiXH4hE30uQ5AYXD5FMBrVsc67lPfrd7bbSviWll
 glue86eN0WWWwYNtYYjOJeXpK6Jzcb5he9Q+tMpFEQDPY9LfGUyC1u8NMnMVfhe0gq
 G7IdLXd/RPK4QEFlyPj84mwU4ALU5rPDHGhC0y0A=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250930035537epcas5p366a0f47db2a7c46dabb0454c223c59f5~p8zTATxwU3089530895epcas5p3W;
 Tue, 30 Sep 2025 03:55:37 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cbPNS2xgpz6B9mD; Tue, 30 Sep
 2025 03:55:36 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250930035535epcas5p3def6efaf88b04542ab6c27ecaa8e86fd~p8zRfemcp3089530895epcas5p3P;
 Tue, 30 Sep 2025 03:55:35 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035531epsmtip1a50adf3bee592bffd132b68f4263ba67~p8zN24WLU2938529385epsmtip1H;
 Tue, 30 Sep 2025 03:55:31 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 05/29] media: mfc: Add MFC driver header files and core
 utilities
Date: Tue, 30 Sep 2025 09:33:24 +0530
Message-Id: <20250930040348.3702923-6-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035535epcas5p3def6efaf88b04542ab6c27ecaa8e86fd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035535epcas5p3def6efaf88b04542ab6c27ecaa8e86fd
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035535epcas5p3def6efaf88b04542ab6c27ecaa8e86fd@epcas5p3.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

Introduce new driver headers: mfc_buf.h, mfc_common.h,
mfc_media.h, mfc_mem.h, mfc_regs.h, mfc_sched.h, and mfc_utils.h.

mfc_buf.h
Define buffer allocation/release APIs, common driver constants,
video node identifiers, and feature‑specific V4L2 control IDs.

mfc_common.h
Define driver metadata, node IDs, timeout values, format flags,
error/warning macros, and helper macros for buffer/context conversion

mfc_media.h
Expand V4L2 control IDs for a wide range of codec features (HEVC,
VP8/9, AV1, HDR, ROI, etc.)

mfc_mem.h
Implement memory management helpers for DMA buffers,
IOVA pool handling, and firmware mapping.

mfc_regs.h
Add register access macros for core, MMU, and PMU registers,
handling both 32‑bit and 64‑bit DMA address spaces.

mfc_sched.h
Supply scheduler helper for priority calculation and core initialization.
Supply utility inline functions for state changes,
interrupt flag handling, idle checking, and tracing.

mfc_utils.h
Provide inline utility functions for clearing interrupt flags,
state changes, operation‑mode updates, node‑type detection, and
idle‑checker management.

These changes collectively lay the groundwork for the Samsung MFC
(Multi‑Format Codec) driver, enabling buffer handling, register access,
and core scheduling functionalities.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/base/mfc_buf.c         | 289 ++++++++
 .../samsung/exynos-mfc/base/mfc_buf.h         |  32 +
 .../samsung/exynos-mfc/base/mfc_common.h      | 198 ++++++
 .../samsung/exynos-mfc/base/mfc_media.h       | 554 ++++++++++++++++
 .../samsung/exynos-mfc/base/mfc_mem.c         | 618 ++++++++++++++++++
 .../samsung/exynos-mfc/base/mfc_mem.h         |  80 +++
 .../samsung/exynos-mfc/base/mfc_regs.h        |  58 ++
 .../samsung/exynos-mfc/base/mfc_sched.h       |  30 +
 .../samsung/exynos-mfc/base/mfc_utils.h       | 168 +++++
 9 files changed, 2027 insertions(+)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_media.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_regs.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_sched.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
new file mode 100644
index 000000000000..b8b140824aab
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2010-2015 Samsung Electronics Co., Ltd.
+ *				http://www.samsung.com
+ *
+ * mfc_buf.c file
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ * nagaraju siddineni, <nagaraju.s@samsung.com>
+ */
+#include <linux/firmware.h>
+#include <linux/iommu.h>
+
+#include "mfc_buf.h"
+
+#include "mfc_mem.h"
+
+#include "mfc_utils.h"
+
+/* Release context buffers for SYS_INIT */
+static void __mfc_release_common_context(struct mfc_core *core)
+{
+	struct mfc_special_buf *ctx_buf;
+
+	ctx_buf = &core->common_ctx_buf;
+
+	mfc_iova_pool_free(core->dev, ctx_buf);
+
+	mfc_mem_special_buf_free(core->dev, ctx_buf);
+
+	ctx_buf->dma_buf = NULL;
+	ctx_buf->vaddr = NULL;
+	ctx_buf->daddr = 0;
+}
+
+/* Release context buffers for SYS_INIT */
+void mfc_release_common_context(struct mfc_core *core)
+{
+	if (core->fw.status & MFC_CTX_ALLOC) {
+		__mfc_release_common_context(core);
+		mfc_core_change_fw_state(core, MFC_CTX_ALLOC, 0);
+	}
+}
+
+static int __mfc_alloc_common_context(struct mfc_core *core)
+{
+	struct mfc_dev *dev = core->dev;
+	struct mfc_special_buf *ctx_buf;
+	struct mfc_ctx_buf_size *buf_size;
+
+	mfc_core_debug_enter();
+
+	ctx_buf = &core->common_ctx_buf;
+	ctx_buf->buftype = MFCBUF_NORMAL;
+
+	buf_size = dev->variant->buf_size->ctx_buf;
+	ctx_buf->size = buf_size->dev_ctx;
+
+	snprintf(ctx_buf->name, MFC_NUM_SPECIAL_BUF_NAME, "MFC%d common context", core->id);
+	if (mfc_mem_special_buf_alloc(dev, ctx_buf)) {
+		mfc_core_err("Allocating context buffer failed\n");
+		return -ENOMEM;
+	}
+
+	if (mfc_iova_pool_alloc(dev, ctx_buf)) {
+		mfc_core_err("[POOL] failed to get iova\n");
+		__mfc_release_common_context(core);
+		return -ENOMEM;
+	}
+
+	mfc_core_debug_leave();
+
+	return 0;
+}
+
+/* Wrapper : allocate context buffers for SYS_INIT */
+int mfc_alloc_common_context(struct mfc_core *core)
+{
+	int ret = 0;
+
+	ret = __mfc_alloc_common_context(core);
+	if (ret)
+		return ret;
+	mfc_core_change_fw_state(core, MFC_CTX_ALLOC, 1);
+
+	return ret;
+}
+
+/* Allocation buffer of debug infor memory for FW debugging */
+int mfc_alloc_dbg_info_buffer(struct mfc_core *core)
+{
+	struct mfc_dev *dev = core->dev;
+	struct mfc_ctx_buf_size *buf_size = dev->variant->buf_size->ctx_buf;
+
+	mfc_core_debug(2, "Allocate a debug-info buffer\n");
+
+	core->dbg_info_buf.buftype = MFCBUF_NORMAL;
+	core->dbg_info_buf.size = buf_size->dbg_info_buf;
+	snprintf(core->dbg_info_buf.name, MFC_NUM_SPECIAL_BUF_NAME, "MFC%d debug", core->id);
+	if (mfc_mem_special_buf_alloc(dev, &core->dbg_info_buf)) {
+		mfc_core_err("Allocating debug info buffer failed\n");
+		return -ENOMEM;
+	}
+
+	if (mfc_iova_pool_alloc(dev, &core->dbg_info_buf)) {
+		mfc_core_err("[POOL] failed to get iova\n");
+		mfc_release_dbg_info_buffer(core);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/* Release buffer of debug infor memory for FW debugging */
+void mfc_release_dbg_info_buffer(struct mfc_core *core)
+{
+	if (!core->dbg_info_buf.dma_buf)
+		mfc_core_debug(2, "debug info buffer is already freed\n");
+
+	mfc_iova_pool_free(core->dev, &core->dbg_info_buf);
+
+	mfc_mem_special_buf_free(core->dev, &core->dbg_info_buf);
+}
+
+/* Allocate firmware */
+int mfc_alloc_firmware(struct mfc_core *core)
+{
+	struct mfc_dev *dev = core->dev;
+
+	mfc_core_debug_enter();
+
+	if (core->fw_buf.sgt)
+		return 0;
+
+	mfc_core_debug(4, "[F/W] Allocating memory for firmware\n");
+
+	if (dev->pdata->fw_mem_size)
+		core->fw_buf.size = dev->pdata->fw_mem_size;
+	else
+		core->fw_buf.size = dev->variant->buf_size->firmware_code;
+	core->fw_buf.buftype = MFCBUF_NORMAL_FW;
+
+	strscpy(core->fw_buf.name, core->name, sizeof(core->fw_buf.name));
+	if (mfc_mem_special_buf_alloc(dev, &core->fw_buf)) {
+		mfc_core_err("[F/W] Allocating normal firmware buffer failed\n");
+		return -ENOMEM;
+	}
+
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	if (mfc_iommu_map_firmware(core, &core->fw_buf))
+		goto err_reserve_iova;
+#endif
+	mfc_core_change_fw_state(core, MFC_FW_ALLOC, 1);
+
+	mfc_core_debug_leave();
+
+	return 0;
+
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+err_reserve_iova:
+	mfc_core_change_fw_state(core, MFC_FW_ALLOC, 0);
+	iommu_unmap(core->domain, fw_buf->daddr, fw_buf->map_size);
+	mfc_mem_special_buf_free(dev, &core->fw_buf);
+	return -ENOMEM;
+#endif
+}
+
+/* Load firmware to MFC */
+int mfc_load_firmware(struct mfc_core *core,
+		      struct mfc_special_buf *fw_buf,
+		      const u8 *fw_data,
+		      size_t fw_size)
+{
+	mfc_core_debug(2,
+		       "[MEMINFO][F/W] loaded %s F/W Size: %zu\n",
+		       fw_buf->buftype == MFCBUF_NORMAL_FW ? "normal" : "secure",
+		       fw_size);
+
+	if (fw_size > fw_buf->size) {
+		mfc_core_err
+		("[MEMINFO][F/W] MFC firmware(%zu) is too big to be loaded in memory(%zu)\n",
+		fw_size,
+		fw_buf->size);
+		return -ENOMEM;
+	}
+
+	core->fw.fw_size = fw_size;
+
+	if (fw_buf->daddr == 0) {
+		mfc_core_err("[F/W] MFC firmware is not allocated\n");
+		return -EINVAL;
+	}
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	if (!fw_buf->sgt) {
+		mfc_core_err("[F/W] MFC firmware was not mapped correctly\n");
+		return -EINVAL;
+	}
+#endif
+	/*	This adds to clear with '0' for firmware memory except code region. */
+	mfc_core_debug(4,
+		       "[F/W] memset before memcpy for %s fw\n",
+		       fw_buf->buftype == MFCBUF_NORMAL_FW ? "normal" : "secure");
+	memset((fw_buf->vaddr + fw_size), 0, (fw_buf->size - fw_size));
+	memcpy(fw_buf->vaddr, fw_data, fw_size);
+
+	/* cache flush for memcpy by CPU */
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	dma_sync_sgtable_for_device(core->device, fw_buf->sgt, DMA_TO_DEVICE);
+#else
+	dma_sync_single_for_device(core->device, fw_buf->paddr, fw_buf->size, DMA_TO_DEVICE);
+#endif
+	mfc_core_debug(4,
+		       "[F/W] cache flush for %s FW region\n",
+		       fw_buf->buftype == MFCBUF_NORMAL_FW ? "normal" : "secure");
+
+	mfc_core_change_fw_state(core, MFC_FW_LOADED, 1);
+
+	if (core->dev->debugfs.sfr_dump & MFC_DUMP_FIRMWARE) {
+		print_hex_dump(KERN_ERR,
+			       "FW dump ",
+			       DUMP_PREFIX_OFFSET,
+			       32,
+			       1,
+			       fw_buf->vaddr,
+			       0x200,
+			       false);
+		mfc_core_info("......\n");
+		print_hex_dump(KERN_ERR,
+			       "FW dump + 0xffe00 ",
+			       DUMP_PREFIX_OFFSET,
+			       32,
+			       1,
+			       fw_buf->vaddr + 0xffe00,
+			       0x200,
+			       false);
+	}
+
+	return 0;
+}
+
+/* Request and load firmware to MFC */
+int mfc_request_load_firmware(struct mfc_core *core, struct mfc_special_buf *fw_buf)
+{
+	const struct firmware *fw_blob;
+	int ret;
+
+	mfc_core_debug_enter();
+
+	mfc_core_debug(4,
+		       "[F/W] Requesting %s F/W\n",
+		       fw_buf->buftype == MFCBUF_NORMAL_FW ? "normal" : "secure");
+
+	ret = request_firmware(&fw_blob, core->dev->pdata->fw_name, core->dev->v4l2_dev.dev);
+	if (ret != 0) {
+		mfc_core_err("[F/W] Couldn't find the F/W invalid path\n");
+		return ret;
+	}
+
+	ret = mfc_load_firmware(core, fw_buf, fw_blob->data, fw_blob->size);
+	if (ret) {
+		mfc_core_err("[F/W] Failed to load the MFC F/W\n");
+		release_firmware(fw_blob);
+		return ret;
+	}
+
+	release_firmware(fw_blob);
+
+	mfc_core_debug_leave();
+
+	return 0;
+}
+
+/* Release firmware memory */
+int mfc_release_firmware(struct mfc_core *core)
+{
+/* Before calling this function one has to make sure
+ * that MFC is no longer processing
+ */
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	if (core->fw_buf.daddr)
+		iommu_unmap(core->domain, core->fw_buf.daddr, core->fw_buf.map_size);
+#endif
+
+	mfc_mem_special_buf_free(core->dev, &core->fw_buf);
+
+	return 0;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
new file mode 100644
index 000000000000..8291e043b81a
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_buf.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_BUF_H
+#define __MFC_BUF_H __FILE__
+
+#include "mfc_common.h"
+
+/* Memory allocation */
+void mfc_release_common_context(struct mfc_core *core);
+int mfc_alloc_common_context(struct mfc_core *core);
+
+int mfc_alloc_firmware(struct mfc_core *core);
+int mfc_load_firmware(struct mfc_core *core,
+		      struct mfc_special_buf *fw_buf,
+		      const u8 *fw_data,
+		      size_t fw_size);
+int mfc_request_load_firmware(struct mfc_core *core, struct mfc_special_buf *fw_buf);
+int mfc_release_firmware(struct mfc_core *core);
+
+int mfc_alloc_dbg_info_buffer(struct mfc_core *core);
+void mfc_release_dbg_info_buffer(struct mfc_core *core);
+
+#endif /* __MFC_BUF_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
new file mode 100644
index 000000000000..4a1ec714fbb5
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
@@ -0,0 +1,198 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * mfc_common.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_COMMON_H
+#define __MFC_COMMON_H __FILE__
+
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/sched/clock.h>
+#include <linux/vmalloc.h>
+#include <media/videobuf2-dma-sg.h>
+#include <linux/cacheflush.h>
+#include "mfc_data_struct.h"
+#include "mfc_regs.h"
+#include "mfc_debug.h"
+#include "mfc_media.h"
+
+#define MFC_DRIVER_INFO		230330
+
+#define MFC_MAX_REF_BUFS	2
+#define MFC_FRAME_PLANES	2
+#define MFC_INFO_INIT_FD	-1
+#define MFC_FW_MEM_SIZE		SZ_1M	/* 1MB */
+
+/* MFC video node */
+#define EXYNOS_VIDEONODE_MFC_DEC               6
+#define EXYNOS_VIDEONODE_MFC_ENC               7
+#define EXYNOS_VIDEONODE_MFC_DEC_DRM           8
+#define EXYNOS_VIDEONODE_MFC_ENC_DRM           9
+#define EXYNOS_VIDEONODE_MFC_ENC_OTF           10
+#define EXYNOS_VIDEONODE_MFC_ENC_OTF_DRM       11
+
+/* Core information */
+#define MFC_DEC_DEFAULT_CORE	0
+#define MFC_ENC_DEFAULT_CORE	0
+#define MFC_SURPLUS_CORE	1
+
+/* Interrupt timeout */
+#define MFC_INT_TIMEOUT		4000
+/* Interrupt short timeout */
+#define MFC_INT_SHORT_TIMEOUT	800
+/* hwlock timeout */
+#define MFC_HWLOCK_TIMEOUT	12000
+/* Busy wait timeout */
+#define MFC_BW_TIMEOUT		500
+
+/* Interrupt timeout count*/
+#define MFC_INT_TIMEOUT_CNT	3
+
+/*
+ * This value guarantees 299.4msec ~ 2.25sec according to MFC clock (668MHz ~ 89MHz)
+ * related with MFC_REG_TIMEOUT_VALUE
+ */
+#define MFC_TIMEOUT_VALUE	200000000
+/* 250ms is the mfc firmware timeout value*/
+#define MFC_TIMEOUT_VALUE_IN_MSEC 250
+
+#define DEFAULT_TAG		(0xE05)
+#define IGNORE_TAG		(0xD5C) /* ex) encoder DRC */
+#define HEADER_TAG		(0xC5D)
+#define UNUSED_TAG		(-1)
+
+#define MFC_NO_INSTANCE_SET	-1
+
+#define STUFF_BYTE		4
+#define MFC_EXTRA_DPB		5
+#define MFC_ALL_AVAILABLE_DPB	0xffffffffffffffff
+
+#define MFC_BASE_MASK		(BIT(17) - 1)
+
+/* Error & Warning */
+#define mfc_get_err(x)		(((x) >> MFC_REG_ERR_STATUS_SHIFT)	\
+						& MFC_REG_ERR_STATUS_MASK)
+#define mfc_get_warn(x)		(((x) >> MFC_REG_WARN_STATUS_SHIFT)	\
+						& MFC_REG_WARN_STATUS_MASK)
+
+#define vb_to_mfc_buf(x)		\
+	container_of(x, struct mfc_buf, vb.vb2_buf)
+
+#define fh_to_mfc_ctx(x)		\
+	container_of(x, struct mfc_ctx, fh)
+
+#define MFC_FMT_STREAM		BIT(0)
+#define MFC_FMT_FRAME		BIT(1)
+#define MFC_FMT_10BIT		BIT(2)
+#define MFC_FMT_422		BIT(3)
+#define MFC_FMT_RGB		BIT(4)
+#define MFC_FMT_SBWC		BIT(5)
+#define MFC_FMT_SBWCL		BIT(6)
+#define MFC_FMT_DEC		BIT(7)
+#define MFC_FMT_ENC		BIT(8)
+#define MFC_FMT_SBWCLH		BIT(9)
+#define MFC_FMT_SBWCLHFR	BIT(10)
+
+/* node check */
+#define IS_DEC_NODE(n)	({								\
+	typeof(n) _n =	(n);								\
+	((_n == EXYNOS_VIDEONODE_MFC_DEC) || (_n == EXYNOS_VIDEONODE_MFC_DEC_DRM));	\
+})
+#define IS_ENC_NODE(n)	({								\
+	typeof(n) _n = (n);								\
+	((_n == EXYNOS_VIDEONODE_MFC_ENC) || (_n == EXYNOS_VIDEONODE_MFC_ENC_DRM) ||	\
+	 (_n == EXYNOS_VIDEONODE_MFC_ENC_OTF) ||					\
+	 (_n == EXYNOS_VIDEONODE_MFC_ENC_OTF_DRM));					\
+})
+
+#define IS_MULTI_CORE_DEVICE(dev)	((dev)->num_core > 1)
+#define IS_SINGLE_MODE(ctx)	   ((ctx)->op_mode == MFC_OP_SINGLE)
+#define IS_TWO_MODE1(ctx)	   ((ctx)->op_mode == MFC_OP_TWO_MODE1)
+#define IS_TWO_MODE2(ctx)	   ((ctx)->op_mode == MFC_OP_TWO_MODE2)
+#define IS_MULTI_MODE(ctx)	({						\
+	typeof(ctx) _ctx = (ctx);						\
+	((_ctx->op_mode == MFC_OP_TWO_MODE1)	||				\
+	 (_ctx->op_mode == MFC_OP_TWO_MODE2));					\
+})
+
+#define IS_SWITCH_SINGLE_MODE(ctx)	({					\
+	typeof(ctx) _ctx = (ctx);						\
+	((_ctx->op_mode == MFC_OP_SWITCH_TO_SINGLE) ||				\
+	 (_ctx->op_mode == MFC_OP_SWITCH_BUT_MODE2));				\
+})
+
+#define IS_SWITCH_SINGLE_MODE(ctx)	({					\
+	typeof(ctx) _ctx = (ctx);						\
+	((_ctx->op_mode == MFC_OP_SWITCH_TO_SINGLE) ||				\
+	 (_ctx->op_mode == MFC_OP_SWITCH_BUT_MODE2));				\
+})
+
+/* Extra information for Decoder */
+#define DEC_SET_DUAL_DPB		BIT(0)
+#define DEC_SET_DYNAMIC_DPB		BIT(1)
+#define DEC_SET_LAST_FRAME_INFO		BIT(2)
+#define DEC_SET_SKYPE_FLAG		BIT(3)
+#define DEC_SET_HDR10_PLUS		BIT(4)
+/* new C2_INTERFACE: DISPLAY_DELAY, FRAME_POC */
+#define DEC_SET_C2_INTERFACE		BIT(6)
+#define DEC_SET_FRAME_ERR_TYPE		BIT(7)
+#define DEC_SET_OPERATING_FPS		BIT(8)
+#define DEC_SET_HDR10_PLUS_FULL		BIT(9)
+#define DEC_SET_BUF_FLAG_CTRL		BIT(16)
+#define DEC_SET_PRIORITY		BIT(23)
+
+/* Extra information for Encoder */
+#define ENC_SET_RGB_INPUT		BIT(0)
+#define ENC_SET_SPARE_SIZE		BIT(1)
+#define ENC_SET_TEMP_SVC_CH		BIT(2)
+#define ENC_SET_SKYPE_FLAG		BIT(3)
+#define ENC_SET_ROI_CONTROL		BIT(4)
+#define ENC_SET_QP_BOUND_PB		BIT(5)
+#define ENC_SET_FIXED_SLICE		BIT(6)
+#define ENC_SET_PVC_MODE		BIT(7)
+#define ENC_SET_RATIO_OF_INTRA		BIT(8)
+#define ENC_SET_COLOR_ASPECT		BIT(9)
+#define ENC_SET_HP_BITRATE_CONTROL	BIT(10)
+#define ENC_SET_STATIC_INFO		BIT(11)
+#define ENC_SET_HDR10_PLUS		BIT(12)
+#define ENC_SET_VP9_PROFILE_LEVEL	BIT(13)
+#define ENC_SET_DROP_CONTROL		BIT(14)
+#define ENC_SET_CHROMA_QP_CONTROL	BIT(15)
+#define ENC_SET_BUF_FLAG_CTRL		BIT(16)
+#define ENC_SET_GDC_VOTF		BIT(17)
+#define ENC_SET_OPERATING_FPS		BIT(18)
+#define ENC_SET_AVERAGE_QP		BIT(19)
+#define ENC_SET_MV_SEARCH_MODE		BIT(20)
+#define ENC_SET_GOP_CTRL		BIT(21)
+#define ENC_SET_HDR10_PLUS_STAT_INFO	BIT(22)
+#define ENC_SET_PRIORITY		BIT(23)
+#define ENC_SET_CAPABILITY		BIT(24)
+#define ENC_SET_IFRAME_SIZE		BIT(25)
+#define ENC_SET_TIMING_INFO_ENABLE	BIT(26)
+
+#define MFC_FEATURE_SUPPORT(dev, f)	({			\
+	typeof(f) _f = (f);					\
+	(_f).support && ((dev)->fw_date >= (_f).version);	\
+})
+
+/* Low memory check */
+#define IS_LOW_MEM			(totalram_pages() <= ((SZ_1G + SZ_512M) >> PAGE_SHIFT))
+
+static inline int mfc_core_get_pwr_ref_cnt(struct mfc_core *core)
+{
+	return atomic_read(&core->pm.pwr_ref);
+}
+
+static inline int mfc_core_get_clk_ref_cnt(struct mfc_core *core)
+{
+	return atomic_read(&core->clk_ref);
+}
+
+#endif /* __MFC_COMMON_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_media.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_media.h
new file mode 100644
index 000000000000..cf37700d78a0
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_media.h
@@ -0,0 +1,554 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_media.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_MEDIA_H
+#define __MFC_MEDIA_H __FILE__
+
+/* RGB formats */
+#define V4L2_PIX_FMT_RGB32X    v4l2_fourcc('R', 'G', 'B', 'X') /* 32  RGB-8-8-8-8   */
+
+/* compressed formats */
+#define V4L2_PIX_FMT_FIMV     v4l2_fourcc('F', 'I', 'M', 'V') /* FIMV  */
+#define V4L2_PIX_FMT_FIMV1    v4l2_fourcc('F', 'I', 'M', '1') /* FIMV1 */
+#define V4L2_PIX_FMT_FIMV2    v4l2_fourcc('F', 'I', 'M', '2') /* FIMV2 */
+#define V4L2_PIX_FMT_FIMV3    v4l2_fourcc('F', 'I', 'M', '3') /* FIMV3 */
+#define V4L2_PIX_FMT_FIMV4    v4l2_fourcc('F', 'I', 'M', '4') /* FIMV4 */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
+
+enum v4l2_mpeg_mfc51_video_frame_type {
+	V4L2_MPEG_MFC51_VIDEO_FRAME_TYPE_NOT_CODED	= 0,
+	V4L2_MPEG_MFC51_VIDEO_FRAME_TYPE_I_FRAME	= 1,
+	V4L2_MPEG_MFC51_VIDEO_FRAME_TYPE_P_FRAME	= 2,
+	V4L2_MPEG_MFC51_VIDEO_FRAME_TYPE_B_FRAME	= 3,
+	V4L2_MPEG_MFC51_VIDEO_FRAME_TYPE_SKIPPED	= 4,
+	V4L2_MPEG_MFC51_VIDEO_FRAME_TYPE_OTHERS		= 5,
+};
+
+/* new entry for enum v4l2_mpeg_video_mpeg4_level */
+#define V4L2_MPEG_VIDEO_MPEG4_LEVEL_6			8
+
+/* new entry for enum v4l2_mpeg_video_header_mode */
+#define V4L2_MPEG_VIDEO_HEADER_MODE_AT_THE_READY	2
+
+/* new entry for enum v4l2_mpeg_video_multi_slice_mode */
+#define V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB_ROW		3
+#define V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_FIXED_BYTES	4
+
+/* new entry for enum v4l2_mpeg_video_h264_profile */
+#define V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH	17
+
+#define V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_S_B \
+	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
+
+#define V4L2_CID_MPEG_MFC51_VIDEO_I_PERIOD_CH	V4L2_CID_MPEG_VIDEO_GOP_SIZE
+#define V4L2_CID_MPEG_MFC51_VIDEO_BIT_RATE_CH	V4L2_CID_MPEG_VIDEO_BITRATE
+#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE_CH		\
+					V4L2_CID_MPEG_MFC51_VIDEO_H264_RC_FRAME_RATE
+
+/* CID base for MFC controls (MPEG_CLASS) */
+#define V4L2_CID_MPEG_MFC_BASE		(V4L2_CTRL_CLASS_CODEC | 0x2000)
+
+#define V4L2_CID_MPEG_VIDEO_H264_SEI_FP_AVAIL		\
+					(V4L2_CID_MPEG_MFC_BASE + 1)
+#define V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRGMENT_ID	\
+					(V4L2_CID_MPEG_MFC_BASE + 2)
+#define V4L2_CID_MPEG_VIDEO_H264_SEI_FP_INFO		\
+					(V4L2_CID_MPEG_MFC_BASE + 3)
+#define V4L2_CID_MPEG_VIDEO_H264_SEI_FP_GRID_POS	\
+					(V4L2_CID_MPEG_MFC_BASE + 4)
+#define V4L2_CID_MPEG_MFC51_VIDEO_PACKED_PB		\
+					(V4L2_CID_MPEG_MFC_BASE + 5)
+#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG		\
+					(V4L2_CID_MPEG_MFC_BASE + 6)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_ENABLE		\
+					(V4L2_CID_MPEG_MFC_BASE + 7)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_LUMA		\
+					(V4L2_CID_MPEG_MFC_BASE + 8)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_CHROMA	\
+					(V4L2_CID_MPEG_MFC_BASE + 9)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_LUMA_BOT	\
+					(V4L2_CID_MPEG_MFC_BASE + 10)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_CHROMA_BOT	\
+					(V4L2_CID_MPEG_MFC_BASE + 11)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_GENERATED		\
+					(V4L2_CID_MPEG_MFC_BASE + 12)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CHECK_STATE		\
+					(V4L2_CID_MPEG_MFC_BASE + 13)
+#define V4L2_CID_MPEG_MFC51_VIDEO_DISPLAY_STATUS	\
+					(V4L2_CID_MPEG_MFC_BASE + 14)
+#define V4L2_CID_MPEG_MFC51_VIDEO_LUMA_ADDR	\
+					(V4L2_CID_MPEG_MFC_BASE + 15)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CHROMA_ADDR	\
+					(V4L2_CID_MPEG_MFC_BASE + 16)
+#define V4L2_CID_MPEG_MFC51_VIDEO_STREAM_SIZE		\
+					(V4L2_CID_MPEG_MFC_BASE + 17)
+#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_COUNT		\
+					(V4L2_CID_MPEG_MFC_BASE + 18)
+#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TYPE		\
+					(V4L2_CID_MPEG_MFC_BASE + 19)
+#define V4L2_CID_MPEG_MFC51_VIDEO_H264_INTERLACE	\
+					(V4L2_CID_MPEG_MFC_BASE + 20)
+#define V4L2_CID_MPEG_MFC51_VIDEO_H264_RC_FRAME_RATE	\
+					(V4L2_CID_MPEG_MFC_BASE + 21)
+#define V4L2_CID_MPEG_MFC51_VIDEO_MPEG4_VOP_TIME_RES	\
+					(V4L2_CID_MPEG_MFC_BASE + 22)
+#define V4L2_CID_MPEG_MFC51_VIDEO_MPEG4_VOP_FRM_DELTA	\
+					(V4L2_CID_MPEG_MFC_BASE + 23)
+#define V4L2_CID_MPEG_MFC51_VIDEO_H263_RC_FRAME_RATE	\
+					(V4L2_CID_MPEG_MFC_BASE + 24)
+#define V4L2_CID_MPEG_MFC6X_VIDEO_FRAME_DELTA		\
+					(V4L2_CID_MPEG_MFC_BASE + 25)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_CHROMA1	\
+					(V4L2_CID_MPEG_MFC_BASE + 26)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_2BIT_LUMA	\
+					(V4L2_CID_MPEG_MFC_BASE + 27)
+#define V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_2BIT_CHROMA	\
+					(V4L2_CID_MPEG_MFC_BASE + 28)
+#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_POC			\
+					(V4L2_CID_MPEG_MFC_BASE + 29)
+#define V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG			\
+					(V4L2_CID_MPEG_MFC_BASE + 30)
+#define V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG			\
+					(V4L2_CID_MPEG_MFC_BASE + 31)
+#define V4L2_CID_MPEG_VIDEO_GDC_VOTF				\
+					(V4L2_CID_MPEG_MFC_BASE + 32)
+#define V4L2_CID_MPEG_VIDEO_FRAME_ERROR_TYPE			\
+					(V4L2_CID_MPEG_MFC_BASE + 33)
+#define V4L2_CID_MPEG_VIDEO_GOP_CTRL			\
+					(V4L2_CID_MPEG_MFC_BASE + 35)
+#define V4L2_CID_MPEG_VIDEO_PRIORITY			\
+					(V4L2_CID_MPEG_MFC_BASE + 36)
+#define V4L2_CID_MPEG_VIDEO_MAX_IFRAME_SIZE			\
+					(V4L2_CID_MPEG_MFC_BASE + 37)
+#define V4L2_CID_MPEG_VIDEO_CHROMA_QP_OFFSET_CB		\
+					(V4L2_CID_MPEG_MFC_BASE + 38)
+#define V4L2_CID_MPEG_VIDEO_CHROMA_QP_OFFSET_CR		\
+					(V4L2_CID_MPEG_MFC_BASE + 39)
+#define V4L2_CID_MPEG_VIDEO_GET_DISPLAY_DELAY			\
+					(V4L2_CID_MPEG_MFC_BASE + 40)
+#define V4L2_CID_MPEG_VIDEO_DROP_CONTROL			\
+					(V4L2_CID_MPEG_MFC_BASE + 41)
+#define V4L2_CID_MPEG_VIDEO_H264_MVC_VIEW_ID			\
+					(V4L2_CID_MPEG_MFC_BASE + 42)
+#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_STATUS			\
+					(V4L2_CID_MPEG_MFC_BASE + 43)
+#define V4L2_CID_MPEG_MFC51_VIDEO_I_FRAME_DECODING		\
+					(V4L2_CID_MPEG_MFC_BASE + 44)
+#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE			\
+					(V4L2_CID_MPEG_MFC_BASE + 45)
+#define V4L2_CID_MPEG_VIDEO_H264_PREPEND_SPSPPS_TO_IDR		\
+					(V4L2_CID_MPEG_MFC_BASE + 46)
+#define V4L2_CID_MPEG_VIDEO_DECODER_IMMEDIATE_DISPLAY		\
+					(V4L2_CID_MPEG_MFC_BASE + 47)
+#define V4L2_CID_MPEG_VIDEO_DECODER_DECODING_TIMESTAMP_MODE	\
+					(V4L2_CID_MPEG_MFC_BASE + 48)
+#define V4L2_CID_MPEG_VIDEO_DECODER_WAIT_DECODING_START		\
+					(V4L2_CID_MPEG_MFC_BASE + 49)
+#define V4L2_CID_MPEG_VIDEO_QOS_RATIO				\
+					(V4L2_CID_MPEG_MFC_BASE + 50)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT	\
+					(V4L2_CID_MPEG_MFC_BASE + 51)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH \
+					(V4L2_CID_MPEG_MFC_BASE + 52)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT0	\
+					(V4L2_CID_MPEG_MFC_BASE + 53)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT1	\
+					(V4L2_CID_MPEG_MFC_BASE + 54)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT2	\
+					(V4L2_CID_MPEG_MFC_BASE + 55)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT3	\
+					(V4L2_CID_MPEG_MFC_BASE + 56)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT4	\
+					(V4L2_CID_MPEG_MFC_BASE + 57)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT5	\
+					(V4L2_CID_MPEG_MFC_BASE + 58)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT6	\
+					(V4L2_CID_MPEG_MFC_BASE + 59)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_VERSION			\
+					(V4L2_CID_MPEG_MFC_BASE + 60)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_RC_FRAME_RATE		\
+					(V4L2_CID_MPEG_MFC_BASE + 61)
+#define V4L2_CID_MPEG_VIDEO_VP8_MIN_QP				\
+					(V4L2_CID_MPEG_MFC_BASE + 62)
+#define V4L2_CID_MPEG_VIDEO_VP8_MAX_QP				\
+					(V4L2_CID_MPEG_MFC_BASE + 63)
+#define V4L2_CID_MPEG_VIDEO_VP8_I_FRAME_QP			\
+					(V4L2_CID_MPEG_MFC_BASE + 64)
+#define V4L2_CID_MPEG_VIDEO_VP8_P_FRAME_QP			\
+					(V4L2_CID_MPEG_MFC_BASE + 65)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_NUM_OF_PARTITIONS		\
+					(V4L2_CID_MPEG_MFC_BASE + 66)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_FILTER_LEVEL		\
+					(V4L2_CID_MPEG_MFC_BASE + 67)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_FILTER_SHARPNESS		\
+					(V4L2_CID_MPEG_MFC_BASE + 68)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_GOLDEN_FRAMESEL		\
+					(V4L2_CID_MPEG_MFC_BASE + 69)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_GF_REFRESH_PERIOD		\
+					(V4L2_CID_MPEG_MFC_BASE + 70)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_ENABLE	\
+					(V4L2_CID_MPEG_MFC_BASE + 71)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER0	\
+					(V4L2_CID_MPEG_MFC_BASE + 72)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER1	\
+					(V4L2_CID_MPEG_MFC_BASE + 73)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER2	\
+					(V4L2_CID_MPEG_MFC_BASE + 74)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_REF_NUMBER_FOR_PFRAMES	\
+					(V4L2_CID_MPEG_MFC_BASE + 75)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_DISABLE_INTRA_MD4X4	\
+					(V4L2_CID_MPEG_MFC_BASE + 76)
+#define V4L2_CID_MPEG_MFC70_VIDEO_VP8_NUM_TEMPORAL_LAYER	\
+					(V4L2_CID_MPEG_MFC_BASE + 77)
+#define V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT	\
+					(V4L2_CID_MPEG_MFC_BASE + 78)
+#define V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH \
+					(V4L2_CID_MPEG_MFC_BASE + 79)
+#define V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT0	\
+					(V4L2_CID_MPEG_MFC_BASE + 80)
+#define V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT1	\
+					(V4L2_CID_MPEG_MFC_BASE + 81)
+#define V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT2	\
+					(V4L2_CID_MPEG_MFC_BASE + 82)
+
+/* ~ 90 : Reserved for using later */
+
+#define V4L2_CID_MPEG_MFC_GET_VERSION_INFO			\
+					(V4L2_CID_MPEG_MFC_BASE + 91)
+#define V4L2_CID_MPEG_MFC_GET_EXTRA_BUFFER_SIZE			\
+					(V4L2_CID_MPEG_MFC_BASE + 92)
+#define V4L2_CID_MPEG_MFC_SET_DUAL_DPB_MODE			\
+					(V4L2_CID_MPEG_MFC_BASE + 93)
+#define V4L2_CID_MPEG_MFC_SET_DYNAMIC_DPB_MODE			\
+					(V4L2_CID_MPEG_MFC_BASE + 95)
+#define V4L2_CID_MPEG_MFC_SET_USER_SHARED_HANDLE		\
+					(V4L2_CID_MPEG_MFC_BASE + 96)
+#define V4L2_CID_MPEG_MFC_GET_EXT_INFO				\
+					(V4L2_CID_MPEG_MFC_BASE + 97)
+#define V4L2_CID_MPEG_MFC_SET_BUF_PROCESS_TYPE			\
+					(V4L2_CID_MPEG_MFC_BASE + 98)
+#define V4L2_CID_MPEG_MFC_GET_10BIT_INFO			\
+					(V4L2_CID_MPEG_MFC_BASE + 99)
+#define V4L2_CID_MPEG_MFC_H264_ENABLE_LTR		\
+					(V4L2_CID_MPEG_MFC_BASE + 100)
+#define V4L2_CID_MPEG_MFC_H264_MARK_LTR			\
+					(V4L2_CID_MPEG_MFC_BASE + 101)
+#define V4L2_CID_MPEG_MFC_H264_USE_LTR			\
+					(V4L2_CID_MPEG_MFC_BASE + 102)
+#define V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB_ROW	\
+					(V4L2_CID_MPEG_MFC_BASE + 103)
+#define V4L2_CID_MPEG_MFC_H264_BASE_PRIORITY		\
+					(V4L2_CID_MPEG_MFC_BASE + 104)
+#define V4L2_CID_MPEG_MFC_CONFIG_QP			\
+					(V4L2_CID_MPEG_MFC_BASE + 105)
+#define V4L2_CID_MPEG_MFC_H264_VUI_RESTRICTION_ENABLE	\
+					(V4L2_CID_MPEG_MFC_BASE + 106)
+#define V4L2_CID_MPEG_MFC_GET_DRIVER_INFO			\
+					(V4L2_CID_MPEG_MFC_BASE + 107)
+#define V4L2_CID_MPEG_MFC_CONFIG_QP_ENABLE             \
+					(V4L2_CID_MPEG_MFC_BASE + 108)
+#define V4L2_CID_MPEG_MFC_HDR_USER_SHARED_HANDLE	\
+					(V4L2_CID_MPEG_MFC_BASE + 109)
+
+/*
+ * CIDs for HEVC encoding.
+ * Even though it was merged to mainline, do not use it for HAL code compatibility.
+ * V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP	(V4L2_CID_MPEG_MFC_BASE + 110)
+ * V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP	(V4L2_CID_MPEG_MFC_BASE + 111)
+ * V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP	(V4L2_CID_MPEG_MFC_BASE + 112)
+ * V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP	(V4L2_CID_MPEG_MFC_BASE + 113)
+ * V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP	(V4L2_CID_MPEG_MFC_BASE + 114)
+ */
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_QP_ENABLE \
+					(V4L2_CID_MPEG_MFC_BASE + 115)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_TYPE       \
+					(V4L2_CID_MPEG_MFC_BASE + 116)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER      \
+					(V4L2_CID_MPEG_MFC_BASE + 117)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_QP   \
+					(V4L2_CID_MPEG_MFC_BASE + 118)
+/* empty number */
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_RC_FRAME_RATE            \
+					(V4L2_CID_MPEG_MFC_BASE + 122)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_TIER_FLAG                \
+					(V4L2_CID_MPEG_MFC_BASE + 123)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_MAX_PARTITION_DEPTH      \
+					(V4L2_CID_MPEG_MFC_BASE + 124)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REF_NUMBER_FOR_PFRAMES   \
+					(V4L2_CID_MPEG_MFC_BASE + 125)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_DISABLE               \
+					(V4L2_CID_MPEG_MFC_BASE + 126)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_SLICE_BOUNDARY        \
+					(V4L2_CID_MPEG_MFC_BASE + 127)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_BETA_OFFSET_DIV2      \
+					(V4L2_CID_MPEG_MFC_BASE + 128)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_TC_OFFSET_DIV2        \
+					(V4L2_CID_MPEG_MFC_BASE + 129)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REFRESH_TYPE             \
+					(V4L2_CID_MPEG_MFC_BASE + 130)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REFRESH_PERIOD           \
+					(V4L2_CID_MPEG_MFC_BASE + 131)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LOSSLESS_CU_ENABLE       \
+					(V4L2_CID_MPEG_MFC_BASE + 132)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_CONST_INTRA_PRED_ENABLE  \
+					(V4L2_CID_MPEG_MFC_BASE + 133)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_WAVEFRONT_ENABLE         \
+					(V4L2_CID_MPEG_MFC_BASE + 134)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LTR_ENABLE               \
+					(V4L2_CID_MPEG_MFC_BASE + 135)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_USER_REF                 \
+					(V4L2_CID_MPEG_MFC_BASE + 136)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_STORE_REF                \
+					(V4L2_CID_MPEG_MFC_BASE + 137)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_SIGN_DATA_HIDING         \
+					(V4L2_CID_MPEG_MFC_BASE + 138)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_GENERAL_PB_ENABLE        \
+					(V4L2_CID_MPEG_MFC_BASE + 139)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_TEMPORAL_ID_ENABLE       \
+					(V4L2_CID_MPEG_MFC_BASE + 140)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_STRONG_SMOTHING_FLAG     \
+					(V4L2_CID_MPEG_MFC_BASE + 141)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1  \
+					(V4L2_CID_MPEG_MFC_BASE + 142)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_DARK         \
+					(V4L2_CID_MPEG_MFC_BASE + 143)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_SMOOTH       \
+					(V4L2_CID_MPEG_MFC_BASE + 144)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_STATIC	\
+					(V4L2_CID_MPEG_MFC_BASE + 145)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_ACTIVITY     \
+					(V4L2_CID_MPEG_MFC_BASE + 146)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_DISABLE_INTRA_PU_SPLIT   \
+					(V4L2_CID_MPEG_MFC_BASE + 147)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_DISABLE_TMV_PREDICTION	\
+					(V4L2_CID_MPEG_MFC_BASE + 148)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_WITHOUT_STARTCODE_ENABLE \
+					(V4L2_CID_MPEG_MFC_BASE + 149)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_QP_INDEX_CR		\
+					(V4L2_CID_MPEG_MFC_BASE + 150)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_QP_INDEX_CB		\
+					(V4L2_CID_MPEG_MFC_BASE + 151)
+#define V4L2_CID_MPEG_MFC90_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD	\
+					(V4L2_CID_MPEG_MFC_BASE + 152)
+#define V4L2_CID_MPEG_VIDEO_HEVC_PREPEND_SPSPPS_TO_IDR		\
+					(V4L2_CID_MPEG_MFC_BASE + 153)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH	\
+					(V4L2_CID_MPEG_MFC_BASE + 154)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT0 \
+					(V4L2_CID_MPEG_MFC_BASE + 155)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT1 \
+					(V4L2_CID_MPEG_MFC_BASE + 156)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT2 \
+					(V4L2_CID_MPEG_MFC_BASE + 157)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT3 \
+					(V4L2_CID_MPEG_MFC_BASE + 158)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT4 \
+					(V4L2_CID_MPEG_MFC_BASE + 159)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT5 \
+					(V4L2_CID_MPEG_MFC_BASE + 160)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT6 \
+					(V4L2_CID_MPEG_MFC_BASE + 161)
+#define V4L2_CID_MPEG_MFC_HEIF_MODE	\
+					(V4L2_CID_MPEG_MFC_BASE + 162)
+
+/* CIDs for VP9 encoding. Number gaps are for compatibility */
+#define V4L2_CID_MPEG_VIDEO_VP9_VERSION				\
+					(V4L2_CID_MPEG_MFC_BASE + 163)
+#define V4L2_CID_MPEG_VIDEO_VP9_RC_FRAME_RATE			\
+					(V4L2_CID_MPEG_MFC_BASE + 164)
+#define V4L2_CID_MPEG_VIDEO_VP9_MIN_QP				\
+					(V4L2_CID_MPEG_MFC_BASE + 165)
+#define V4L2_CID_MPEG_VIDEO_VP9_MAX_QP				\
+					(V4L2_CID_MPEG_MFC_BASE + 166)
+#define V4L2_CID_MPEG_VIDEO_VP9_I_FRAME_QP			\
+					(V4L2_CID_MPEG_MFC_BASE + 167)
+#define V4L2_CID_MPEG_VIDEO_VP9_P_FRAME_QP			\
+					(V4L2_CID_MPEG_MFC_BASE + 168)
+#define V4L2_CID_MPEG_VIDEO_VP9_GOLDEN_FRAMESEL			\
+					(V4L2_CID_MPEG_MFC_BASE + 169)
+#define V4L2_CID_MPEG_VIDEO_VP9_GF_REFRESH_PERIOD		\
+					(V4L2_CID_MPEG_MFC_BASE + 170)
+#define V4L2_CID_MPEG_VIDEO_VP9_HIERARCHY_QP_ENABLE		\
+					(V4L2_CID_MPEG_MFC_BASE + 171)
+#define V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_QP	\
+					(V4L2_CID_MPEG_MFC_BASE + 172)
+#define V4L2_CID_MPEG_VIDEO_VP9_REF_NUMBER_FOR_PFRAMES		\
+					(V4L2_CID_MPEG_MFC_BASE + 173)
+#define V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER	\
+					(V4L2_CID_MPEG_MFC_BASE + 174)
+#define V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_CH \
+					(V4L2_CID_MPEG_MFC_BASE + 175)
+#define V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT0	\
+					(V4L2_CID_MPEG_MFC_BASE + 176)
+#define V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT1	\
+					(V4L2_CID_MPEG_MFC_BASE + 177)
+#define V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT2	\
+					(V4L2_CID_MPEG_MFC_BASE + 178)
+#define V4L2_CID_MPEG_VIDEO_VP9_MAX_PARTITION_DEPTH		\
+					(V4L2_CID_MPEG_MFC_BASE + 179)
+#define V4L2_CID_MPEG_VIDEO_VP9_DISABLE_INTRA_PU_SPLIT		\
+					(V4L2_CID_MPEG_MFC_BASE + 180)
+#define V4L2_CID_MPEG_VIDEO_DISABLE_IVF_HEADER			\
+					(V4L2_CID_MPEG_MFC_BASE + 181)
+/*
+ * Even though it was merged to mainline, do not use it for HAL code compatibility.
+ * V4L2_CID_MPEG_VIDEO_VP9_LEVEL	(V4L2_CID_MPEG_MFC_BASE + 183)
+ */
+#define V4L2_CID_MPEG_VIDEO_UNCOMP_FMT				\
+					(V4L2_CID_MPEG_MFC_BASE + 184)
+#define V4L2_CID_MPEG_VIDEO_SKIP_LAZY_UNMAP			\
+					(V4L2_CID_MPEG_MFC_BASE + 185)
+#define V4L2_CID_MPEG_VIDEO_MIN_QUALITY				\
+					(V4L2_CID_MPEG_MFC_BASE + 186)
+
+/* CIDs for new common interface */
+#define V4L2_CID_MPEG_VIDEO_ROI_CONTROL				\
+					(V4L2_CID_MPEG_MFC_BASE + 190)
+#define V4L2_CID_MPEG_VIDEO_ROI_ENABLE				\
+					(V4L2_CID_MPEG_MFC_BASE + 191)
+#define V4L2_CID_MPEG_VIDEO_RC_PVC_ENABLE			\
+					(V4L2_CID_MPEG_MFC_BASE + 192)
+#define V4L2_CID_MPEG_VIDEO_TEMPORAL_SHORTTERM_MAX_LAYER	\
+					(V4L2_CID_MPEG_MFC_BASE + 193)
+#define V4L2_CID_MPEG_VIDEO_BLACK_BAR_DETECT			\
+					(V4L2_CID_MPEG_MFC_BASE + 194)
+#define V4L2_CID_MPEG_MFC_H264_NUM_OF_LTR			\
+					(V4L2_CID_MPEG_MFC_BASE + 195)
+#define V4L2_CID_MPEG_VIDEO_WEIGHTED_ENABLE			\
+					(V4L2_CID_MPEG_MFC_BASE + 196)
+#define V4L2_CID_MPEG_VIDEO_YSUM				\
+					(V4L2_CID_MPEG_MFC_BASE + 197)
+#define V4L2_CID_MPEG_VIDEO_RATIO_OF_INTRA			\
+					(V4L2_CID_MPEG_MFC_BASE + 198)
+#define V4L2_CID_MPEG_VIDEO_HIERARCHICAL_BITRATE_CTRL		\
+					(V4L2_CID_MPEG_MFC_BASE + 199)
+#define V4L2_CID_MPEG_VIDEO_DECODING_ORDER			\
+					(V4L2_CID_MPEG_MFC_BASE + 200)
+
+/* QP BOUND interface */
+#define V4L2_CID_MPEG_VIDEO_H264_MAX_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 201)
+#define V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 202)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 203)
+#define V4L2_CID_MPEG_VIDEO_H263_MAX_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 204)
+#define V4L2_CID_MPEG_VIDEO_VP8_MAX_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 205)
+#define V4L2_CID_MPEG_VIDEO_VP9_MAX_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 206)
+#define V4L2_CID_MPEG_VIDEO_H264_MIN_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 207)
+#define V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 208)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 209)
+#define V4L2_CID_MPEG_VIDEO_H263_MIN_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 210)
+#define V4L2_CID_MPEG_VIDEO_VP8_MIN_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 211)
+#define V4L2_CID_MPEG_VIDEO_VP9_MIN_QP_P			\
+					(V4L2_CID_MPEG_MFC_BASE + 212)
+#define V4L2_CID_MPEG_VIDEO_H264_MAX_QP_B			\
+					(V4L2_CID_MPEG_MFC_BASE + 213)
+#define V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_B			\
+					(V4L2_CID_MPEG_MFC_BASE + 214)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_B			\
+					(V4L2_CID_MPEG_MFC_BASE + 215)
+#define V4L2_CID_MPEG_VIDEO_H264_MIN_QP_B			\
+					(V4L2_CID_MPEG_MFC_BASE + 216)
+#define V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_B			\
+					(V4L2_CID_MPEG_MFC_BASE + 217)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_B			\
+					(V4L2_CID_MPEG_MFC_BASE + 218)
+
+/* SEI & VUI PARSING FOR HDR DISPLAY */
+#define V4L2_CID_MPEG_VIDEO_SEI_MAX_PIC_AVERAGE_LIGHT		\
+					(V4L2_CID_MPEG_MFC_BASE + 219)
+#define V4L2_CID_MPEG_VIDEO_SEI_MAX_CONTENT_LIGHT		\
+					(V4L2_CID_MPEG_MFC_BASE + 220)
+#define V4L2_CID_MPEG_VIDEO_SEI_MAX_DISPLAY_LUMINANCE		\
+					(V4L2_CID_MPEG_MFC_BASE + 221)
+#define V4L2_CID_MPEG_VIDEO_SEI_MIN_DISPLAY_LUMINANCE		\
+					(V4L2_CID_MPEG_MFC_BASE + 222)
+#define V4L2_CID_MPEG_VIDEO_MATRIX_COEFFICIENTS			\
+					(V4L2_CID_MPEG_MFC_BASE + 223)
+#define V4L2_CID_MPEG_VIDEO_FORMAT				\
+					(V4L2_CID_MPEG_MFC_BASE + 224)
+#define V4L2_CID_MPEG_VIDEO_SEI_WHITE_POINT			\
+					(V4L2_CID_MPEG_MFC_BASE + 225)
+#define V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_0		\
+					(V4L2_CID_MPEG_MFC_BASE + 226)
+#define V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_1		\
+					(V4L2_CID_MPEG_MFC_BASE + 227)
+#define V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_2		\
+					(V4L2_CID_MPEG_MFC_BASE + 228)
+#define V4L2_CID_MPEG_VIDEO_FULL_RANGE_FLAG			\
+					(V4L2_CID_MPEG_MFC_BASE + 229)
+#define V4L2_CID_MPEG_VIDEO_COLOUR_PRIMARIES			\
+					(V4L2_CID_MPEG_MFC_BASE + 230)
+#define V4L2_CID_MPEG_VIDEO_TRANSFER_CHARACTERISTICS		\
+					(V4L2_CID_MPEG_MFC_BASE + 231)
+#define V4L2_CID_MPEG_VIDEO_STATIC_INFO_ENABLE			\
+					(V4L2_CID_MPEG_MFC_BASE + 232)
+#define V4L2_CID_MPEG_VIDEO_MV_SEARCH_MODE			\
+					(V4L2_CID_MPEG_MFC_BASE + 233)
+#define V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L0			\
+					(V4L2_CID_MPEG_MFC_BASE + 234)
+#define V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L1			\
+					(V4L2_CID_MPEG_MFC_BASE + 235)
+#define V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L0			\
+					(V4L2_CID_MPEG_MFC_BASE + 236)
+#define V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L1			\
+					(V4L2_CID_MPEG_MFC_BASE + 237)
+
+/* CID for AV1 decoding interface */
+#define V4L2_CID_MPEG_MFC_AV1_FILM_GRAIN_USER_SHARED_HANDLE	\
+					(V4L2_CID_MPEG_MFC_BASE + 240)
+#define V4L2_CID_MPEG_MFC_AV1_FILM_GRAIN_PRESENT	\
+					(V4L2_CID_MPEG_MFC_BASE + 241)
+
+#define V4L2_CID_MPEG_MFC_HDR10_PLUS_STAT_USER_SHARED_HANDLE	\
+					(V4L2_CID_MPEG_MFC_BASE + 242)
+#define V4L2_CID_MPEG_MFC_HDR10_PLUS_STAT_ENABLE		\
+					(V4L2_CID_MPEG_MFC_BASE + 243)
+
+/* CID for encoding info interface */
+#define V4L2_CID_MPEG_VIDEO_WP_TWO_PASS_ENABLE			\
+					(V4L2_CID_MPEG_MFC_BASE + 260)
+#define V4L2_CID_MPEG_VIDEO_ADAPTIVE_GOP_ENABLE			\
+					(V4L2_CID_MPEG_MFC_BASE + 261)
+#define V4L2_CID_MPEG_VIDEO_SUM_SKIP_MB				\
+					(V4L2_CID_MPEG_MFC_BASE + 262)
+#define V4L2_CID_MPEG_VIDEO_SUM_INTRA_MB			\
+					(V4L2_CID_MPEG_MFC_BASE + 263)
+#define V4L2_CID_MPEG_VIDEO_SUM_ZERO_MV_MB			\
+					(V4L2_CID_MPEG_MFC_BASE + 264)
+#define V4L2_CID_MPEG_VIDEO_MV_HOR_RANGE			\
+					(V4L2_CID_MPEG_MFC_BASE + 265)
+#define V4L2_CID_MPEG_VIDEO_MV_VER_RANGE			\
+					(V4L2_CID_MPEG_MFC_BASE + 266)
+#define V4L2_CID_MPEG_MFC_H264_SUB_GOP_ENABLE			\
+					(V4L2_CID_MPEG_MFC_BASE + 267)
+#define V4L2_CID_MPEG_MFC_H264_SUB_GOP_TYPE			\
+					(V4L2_CID_MPEG_MFC_BASE + 268)
+#define V4L2_CID_MPEG_MFC_HEVC_SUB_GOP_ENABLE			\
+					(V4L2_CID_MPEG_MFC_BASE + 269)
+#define V4L2_CID_MPEG_MFC_HEVC_SUB_GOP_TYPE			\
+					(V4L2_CID_MPEG_MFC_BASE + 270)
+#define V4L2_CID_MPEG_MFC_TIMING_INFO_ENABLE	\
+					(V4L2_CID_MPEG_MFC_BASE + 271)
+#define V4L2_CID_MPEG_MFC_MULTI_VIEW_ENABLE	\
+					(V4L2_CID_MPEG_MFC_BASE + 272)
+#define V4L2_CID_MPEG_MFC_MULTI_VIEW_MAIN_TYPE	\
+					(V4L2_CID_MPEG_MFC_BASE + 273)
+#endif /* __MFC_MEDIA_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
new file mode 100644
index 000000000000..dfb58ddcbd5d
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
@@ -0,0 +1,618 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * mfc_mem.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include <linux/property.h>
+#include <linux/dma-buf.h>
+#include <linux/iosys-map.h>
+#include <linux/iommu.h>
+#include <linux/dma-heap.h>
+#include <linux/of_device.h>
+
+#include "mfc_mem.h"
+
+static int mfc_mem_fw_alloc(struct mfc_dev *dev, struct mfc_special_buf *special_buf)
+{
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	struct page *fw_pages;
+	unsigned long nr_pages = special_buf->size >> PAGE_SHIFT;
+	int ret;
+
+	special_buf->cma_area = dev->device->cma_area;
+	fw_pages = cma_alloc(special_buf->cma_area, nr_pages, 0, false);
+	if (!fw_pages)
+		return -ENOMEM;
+
+	special_buf->sgt = kmalloc((*special_buf->sgt), GFP_KERNEL);
+	if (!special_buf->sgt)
+		goto err_cma_alloc;
+
+	ret = sg_alloc_table(special_buf->sgt, 1, GFP_KERNEL);
+	if (ret) {
+		mfc_dev_err("Failed to allocate sg_table\n");
+		goto err_sg_alloc;
+	}
+
+	sg_set_page(special_buf->sgt->sgl, fw_pages, special_buf->size, 0);
+
+	special_buf->paddr = page_to_phys(fw_pages);
+	special_buf->vaddr = phys_to_virt(special_buf->paddr);
+
+	return 0;
+
+err_sg_alloc:
+	kfree(special_buf->sgt);
+	special_buf->sgt = NULL;
+err_cma_alloc:
+	cma_release(special_buf->cma_area, fw_pages, nr_pages);
+	return -ENOMEM;
+#else
+	special_buf->vaddr = dma_alloc_coherent(dev->mem_dev[BANK_L_CTX],
+						MFC_FW_MEM_SIZE,
+						&special_buf->daddr,
+						GFP_KERNEL);
+	if (!special_buf->vaddr)
+		return -ENOMEM;
+	special_buf->paddr = dma_to_phys(dev->device, special_buf->daddr);
+	mfc_dev_info("mapped on 0x%lx with size of 0x%lx paddr 0x%lx daddr 0x%lx\n",
+		     (unsigned long)special_buf->vaddr,
+		     special_buf->size,
+		     (unsigned long)special_buf->paddr,
+		     (unsigned long)special_buf->daddr);
+	return 0;
+#endif
+}
+
+static void mfc_mem_fw_free(struct mfc_special_buf *special_buf)
+{
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	if (special_buf->sgt) {
+		cma_release(special_buf->cma_area, phys_to_page(special_buf->paddr),
+			    (special_buf->size >> PAGE_SHIFT));
+		sg_free_table(special_buf->sgt);
+		kfree(special_buf->sgt);
+	}
+#endif
+	special_buf->sgt = NULL;
+	special_buf->dma_buf = NULL;
+	special_buf->attachment = NULL;
+	special_buf->daddr = 0;
+	special_buf->vaddr = NULL;
+	special_buf->name[0] = 0;
+}
+
+static void dma_release(struct dma_buf *dmabuf)
+{
+	struct dma_priv *priv = dmabuf->priv;
+
+	dma_free_coherent(priv->dev, priv->size, priv->vaddr, priv->dma_addr);
+}
+
+static struct sg_table *dma_map(struct dma_buf_attachment *attach, enum dma_data_direction dir)
+{
+	struct dma_priv *priv = attach->dmabuf->priv;
+	struct sg_table *sgt;
+	int ret;
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (ret) {
+		kfree(sgt);
+		return ERR_PTR(ret);
+	}
+
+	sg_set_page(sgt->sgl, virt_to_page(priv->vaddr), priv->size,
+		    offset_in_page(priv->vaddr));
+	sg_dma_address(sgt->sgl) = priv->dma_addr;
+	sg_dma_len(sgt->sgl) = priv->size;
+
+	return sgt;
+}
+
+static void dma_unmap(struct dma_buf_attachment *attach,
+		      struct sg_table *sgt, enum dma_data_direction dir)
+{
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static int dma_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	struct dma_priv *priv = dmabuf->priv;
+
+	if (!priv || !priv->vaddr)
+		return -EINVAL;
+
+	map->vaddr = priv->vaddr;
+	return 0;
+}
+
+static void dma_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+}
+
+static const struct dma_buf_ops dma_ops = {
+	.release = dma_release,
+	.map_dma_buf = dma_map,
+	.unmap_dma_buf = dma_unmap,
+	.vmap = dma_vmap,
+	.vunmap = dma_vunmap,
+};
+
+static struct dma_buf *create_dma_buf(struct mfc_dev *dev, struct mfc_special_buf *special_buf)
+{
+	struct dma_priv *priv;
+	struct dma_buf_export_info exp_info;
+
+	priv = devm_kzalloc(dev->mem_dev[BANK_R_CTX], sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		goto err_alloc;
+
+	priv->dev = dev->mem_dev[BANK_R_CTX];
+	priv->size = special_buf->size;
+
+	priv->vaddr = dma_alloc_coherent(dev->mem_dev[BANK_R_CTX],
+					 priv->size, &priv->dma_addr, GFP_KERNEL);
+	if (!priv->vaddr) {
+		kfree(priv);
+		goto err_alloc;
+	}
+
+	exp_info.ops = &dma_ops;
+	exp_info.size = priv->size;
+	exp_info.flags = O_RDWR;
+	exp_info.exp_name = "ctx_buf";
+	exp_info.priv = priv;
+	exp_info.owner = THIS_MODULE;
+
+	return dma_buf_export(&exp_info);
+
+err_alloc:
+	return ERR_PTR(-ENOMEM);
+}
+
+static int mfc_mem_dma_heap_alloc(struct mfc_dev *dev,
+				  struct mfc_special_buf *special_buf)
+{
+	int ret = 0;
+
+	/* control by DMA heap API */
+	special_buf->dma_buf = create_dma_buf(dev, special_buf);
+	if (IS_ERR(special_buf->dma_buf)) {
+		mfc_dev_err("Failed to allocate buffer (err %ld)\n",
+			    PTR_ERR(special_buf->dma_buf));
+		return -EINVAL;
+	}
+
+	/* control by DMA buf API */
+	special_buf->attachment = dma_buf_attach(special_buf->dma_buf,
+						 dev->device);
+	if (IS_ERR(special_buf->attachment)) {
+		mfc_dev_err("Failed to get dma_buf_attach (err %ld)\n",
+			    PTR_ERR(special_buf->attachment));
+		goto err_put_dma_buf;
+	}
+
+	special_buf->sgt = dma_buf_map_attachment_unlocked(special_buf->attachment,
+							   DMA_BIDIRECTIONAL);
+	if (IS_ERR(special_buf->sgt)) {
+		mfc_dev_err("Failed to get sgt (err %ld)\n",
+			    PTR_ERR(special_buf->sgt));
+		goto err_detach_dma_buf;
+	}
+
+	special_buf->daddr = sg_dma_address(special_buf->sgt->sgl);
+	if (IS_ERR_VALUE(special_buf->daddr)) {
+		mfc_dev_err("Failed to get iova (err 0x%p)\n",
+			    &special_buf->daddr);
+		goto err_unmap_attachment;
+	}
+
+	special_buf->map_size = mfc_mem_get_sg_length(dev, special_buf->sgt);
+	if (!special_buf->map_size || special_buf->map_size < special_buf->size) {
+		mfc_dev_err("Failed to get iova map size (sg length: %zu / buf size: %zu)\n",
+			    special_buf->map_size, special_buf->size);
+		goto err_unmap_attachment;
+	}
+
+	if (special_buf->buftype == MFCBUF_NORMAL) {
+		ret = dma_buf_vmap_unlocked(special_buf->dma_buf, &special_buf->map);
+		if (ret) {
+			mfc_dev_err("Failed to get vaddr\n");
+			goto err_unmap_attachment;
+		}
+
+		if (!special_buf->map.vaddr) {
+			mfc_dev_err("[ERROR]: special_buf->vaddr = map.vaddr: %pa\n",
+				    special_buf->vaddr);
+			goto err_unmap_attachment;
+		}
+		special_buf->vaddr = special_buf->map.vaddr;
+	}
+
+	special_buf->paddr = page_to_phys(sg_page(special_buf->sgt->sgl));
+
+	return 0;
+err_unmap_attachment:
+	if (special_buf->vaddr) {
+		dma_buf_vunmap_unlocked(special_buf->dma_buf, &special_buf->map);
+					special_buf->vaddr = NULL;
+	}
+	dma_buf_unmap_attachment_unlocked(special_buf->attachment, special_buf->sgt,
+					  DMA_BIDIRECTIONAL);
+	special_buf->sgt = NULL;
+	special_buf->map_size = 0;
+	special_buf->daddr = 0;
+err_detach_dma_buf:
+	dma_buf_detach(special_buf->dma_buf, special_buf->attachment);
+			special_buf->attachment = NULL;
+err_put_dma_buf:
+	dma_buf_put(special_buf->dma_buf);
+	special_buf->dma_buf = NULL;
+	return -ENOMEM;
+}
+
+static void mfc_mem_dma_heap_free(struct mfc_special_buf *special_buf)
+{
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(special_buf->vaddr);
+
+	if (special_buf->vaddr)
+		dma_buf_vunmap_unlocked(special_buf->dma_buf, &map);
+	if (special_buf->sgt)
+		dma_buf_unmap_attachment_unlocked(special_buf->attachment,
+						  special_buf->sgt, DMA_BIDIRECTIONAL);
+	if (special_buf->attachment)
+		dma_buf_detach(special_buf->dma_buf, special_buf->attachment);
+	if (special_buf->dma_buf)
+		dma_buf_put(special_buf->dma_buf);
+
+	special_buf->dma_buf = NULL;
+	special_buf->attachment = NULL;
+	special_buf->sgt = NULL;
+	special_buf->daddr = 0;
+	special_buf->vaddr = NULL;
+	special_buf->map_size = 0;
+	special_buf->name[0] = 0;
+}
+
+int mfc_mem_special_buf_alloc(struct mfc_dev *dev, struct mfc_special_buf *special_buf)
+{
+	int ret;
+
+	mfc_dev_debug(2, "[MEMINFO] REQUEST:%s buf\n",
+		      special_buf->name);
+
+	switch (special_buf->buftype) {
+	case MFCBUF_NORMAL_FW:
+		ret = mfc_mem_fw_alloc(dev, special_buf);
+		break;
+	case MFCBUF_NORMAL:
+		ret = mfc_mem_dma_heap_alloc(dev, special_buf);
+		break;
+	default:
+		mfc_dev_err("not supported mfc mem type: %d\n", special_buf->buftype);
+		return -EINVAL;
+	}
+
+	mfc_dev_debug(2, "[MEMINFO] ALLOC: %s buf size: %zu, map size: %zu, daddr: 0x%08llx\n",
+		      special_buf->name,
+		      special_buf->size, special_buf->map_size, special_buf->daddr);
+
+	if (ret)
+		mfc_dev_err("[MEMINFO] Allocating %s failed\n",
+			    special_buf->name);
+
+	return ret;
+}
+
+void mfc_mem_special_buf_free(struct mfc_dev *dev, struct mfc_special_buf *special_buf)
+{
+	mfc_dev_debug(2, "[MEMINFO] RELEASE:%s buf\n",
+		      special_buf->name);
+
+	switch (special_buf->buftype) {
+	case MFCBUF_NORMAL_FW:
+		dma_free_coherent(dev->device, special_buf->size,
+				  special_buf->vaddr, special_buf->daddr);
+		mfc_mem_fw_free(special_buf);
+		break;
+	case MFCBUF_NORMAL:
+		mfc_mem_dma_heap_free(special_buf);
+		break;
+	default:
+		break;
+	}
+}
+
+void mfc_iova_pool_free(struct mfc_dev *dev, struct mfc_special_buf *buf)
+{
+	/* Project that do not support iova reservation */
+	if (!dev->pdata->reserved_start)
+		return;
+
+	if (!buf->iova) {
+		mfc_dev_debug(2, "[POOL] There is no reserved iova for %s\n", buf->name);
+		return;
+	}
+
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	if (buf->map_size)
+		iommu_unmap(dev->domain, buf->daddr, buf->map_size);
+#endif
+
+	gen_pool_free(dev->iova_pool, buf->daddr, buf->map_size);
+
+	mfc_dev_debug(2, "[POOL] FREE: %s iova: %#llx ++ %#zx, %zu/%zu (avail/total KB)\n",
+		      buf->name, buf->daddr, buf->map_size,
+		      gen_pool_avail(dev->iova_pool) / SZ_1K,
+		      gen_pool_size(dev->iova_pool) / SZ_1K);
+
+	buf->daddr = buf->iova;
+	buf->iova = 0;
+}
+
+/*
+ * This iova is allocated for special FW only memory.
+ * These memories deliver to F/W without 4bit shift even if 36bit DMA is supported,
+ * because it is already less than 1GB(0x4000_0000) address.
+ * Therefore, it should be noted that the memory below should use
+ * MFC_CORE_READL(WRITEL) rather than MFC_CORE_DMA_READL(WRITEL).
+ * - MFC_REG_CONTEXT_MEM_ADDR, MFC0_REG_COMMON_CONTEXT_MEM_ADDR, MFC1_REG_COMMON_CONTEXT_MEM_ADDR
+ * - MFC_REG_DBG_BUFFER_ADDR
+ * - MFC_REG_D_METADATA_BUFFER_ADDR, MFC_REG_E_METADATA_BUFFER_ADDR
+ * - MFC_REG_SHARED_MEM_ADDR (not used)
+ */
+int mfc_iova_pool_alloc(struct mfc_dev *dev, struct mfc_special_buf *buf)
+{
+	size_t size;
+
+	/* Project that do not support iova reservation */
+	if (!dev->pdata->reserved_start)
+		return 0;
+
+	if (!dev->iova_pool) {
+		mfc_dev_err("there is no iova pool\n");
+		return -ENOMEM;
+	}
+
+	buf->iova = buf->daddr;
+	buf->daddr = gen_pool_alloc(dev->iova_pool, buf->map_size);
+	if (buf->daddr == 0) {
+		buf->daddr = buf->iova;
+		buf->iova = 0;
+		mfc_dev_err("[POOL] failed alloc %s iova. %zu/%zu (avail/total KB)\n",
+			    buf->name,
+			    gen_pool_avail(dev->iova_pool) / SZ_1K,
+			    gen_pool_size(dev->iova_pool) / SZ_1K);
+		return -ENOMEM;
+	}
+
+	mfc_dev_debug(2, "[POOL] ALLOC: %s iova: %#llx ++ %#zx, %zu/%zu (avail/total KB)\n",
+		      buf->name, buf->daddr, buf->map_size,
+		      gen_pool_avail(dev->iova_pool) / SZ_1K,
+		      gen_pool_size(dev->iova_pool) / SZ_1K);
+
+	size = iommu_map_sg(dev->domain, buf->daddr, buf->sgt->sgl,
+			    buf->sgt->orig_nents, IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	if (!size || size != buf->map_size) {
+		mfc_dev_err("[POOL] Failed to map %s iova %#llx (map size: %zu)\n",
+			    buf->name, buf->daddr, size);
+		mfc_iova_pool_free(dev, buf);
+		return -ENOMEM;
+	}
+
+	mfc_dev_debug(2, "[POOL] MAP: %s iova size: %zu(%#zx)\n",
+		      buf->name, buf->map_size, buf->map_size);
+
+	return 0;
+}
+
+int mfc_iova_pool_init(struct mfc_dev *dev)
+{
+	struct device_node *node = dev->device->of_node;
+	dma_addr_t reserved_base;
+	const __be32 *prop;
+	size_t reserved_size;
+	int n_addr_cells = of_n_addr_cells(node);
+	int n_size_cells = of_n_size_cells(node);
+	int n_all_cells = n_addr_cells + n_size_cells;
+	int i, cnt, ret, found = 0;
+	char name[10];
+
+	snprintf(name, sizeof(name), "MFC");
+	dev->iova_pool = devm_gen_pool_create(dev->device, PAGE_SHIFT, -1, name);
+	if (IS_ERR(dev->iova_pool)) {
+		mfc_dev_err("failed to create MFC IOVA gen pool\n");
+		goto err_init;
+	}
+
+	prop = of_get_property(node, "samsung,iommu-reserved-map", &cnt);
+	if (!prop) {
+		mfc_dev_err("No reserved F/W dma area\n");
+		goto err_init;
+	}
+
+	cnt /= sizeof(unsigned int);
+	if (cnt % n_all_cells != 0) {
+		mfc_dev_err("Invalid number(%d) of values\n", cnt);
+		goto err_init;
+	}
+
+	for (i = 0; i < cnt; i += n_all_cells) {
+		reserved_base = of_read_number(prop + i, n_addr_cells);
+		reserved_size = of_read_number(prop + i + n_addr_cells, n_size_cells);
+		if (reserved_base == dev->pdata->reserved_start) {
+			found = 1;
+			break;
+		}
+	}
+
+	if (!found) {
+		mfc_dev_err("failed to search for reserved address %#x\n",
+			    dev->pdata->reserved_start);
+		goto err_init;
+	}
+
+	ret = gen_pool_add(dev->iova_pool, reserved_base, reserved_size, -1);
+	if (ret) {
+		mfc_dev_err("failed to set address range of MFC IOVA pool (ret: %d)\n", ret);
+		goto err_init;
+	}
+	mfc_dev_info("[POOL] Add MFC iova ranges %#llx ++ %#zx\n",
+		     reserved_base, reserved_size);
+
+	return 0;
+
+err_init:
+	dev->iova_pool = NULL;
+	return -ENOMEM;
+}
+
+int mfc_iommu_map_firmware(struct mfc_core *core, struct mfc_special_buf *fw_buf)
+{
+	struct mfc_dev *dev = core->dev;
+	struct device_node *node = core->device->of_node;
+	dma_addr_t reserved_base;
+	const __be32 *prop;
+
+	prop = of_get_property(node, "samsung,iommu-reserved-map", NULL);
+	if (!prop) {
+		mfc_dev_err("No reserved F/W dma area\n");
+		return -ENOENT;
+	}
+
+	if (fw_buf->buftype == MFCBUF_NORMAL_FW) {
+		reserved_base = of_read_number(prop, of_n_addr_cells(node));
+		mfc_core_info("[F/W] %s: reserved_base is %#llx\n",
+			      fw_buf->name, reserved_base);
+	} else {
+		mfc_core_err("Wrong firmware buftype %d\n", fw_buf->buftype);
+		return -EINVAL;
+	}
+
+	if (!reserved_base) {
+		mfc_core_err("There is no %s firmware reserved_base\n",
+			     (fw_buf->buftype == MFCBUF_NORMAL_FW) ? "normal" : "drm");
+		return -ENOMEM;
+	}
+
+	fw_buf->map_size = iommu_map_sg(core->domain, reserved_base,
+					fw_buf->sgt->sgl, fw_buf->sgt->orig_nents,
+					IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	if (!fw_buf->map_size) {
+		mfc_core_err("Failed to map iova (err VA: %#llx, PA: %#llx)\n",
+			     reserved_base, fw_buf->paddr);
+		return -ENOMEM;
+	}
+
+	fw_buf->daddr = reserved_base;
+	mfc_core_debug(2, "[MEMINFO] FW mapped iova: %#llx (pa: %#llx)\n",
+		       fw_buf->daddr, fw_buf->paddr);
+
+	return 0;
+}
+
+/* DMA memory related helper functions */
+static void mfc_memdev_release(struct device *dev)
+{
+	of_reserved_mem_device_release(dev);
+}
+
+static struct device *mfc_alloc_memdev(struct device *dev,
+				       const char *name, unsigned int idx)
+{
+	struct device *child;
+	int ret;
+
+	child = devm_kzalloc(dev, sizeof(*child), GFP_KERNEL);
+	if (!child)
+		return NULL;
+
+	device_initialize(child);
+	dev_set_name(child, "%s:%s", dev_name(dev), name);
+	child->parent = dev;
+	child->coherent_dma_mask = dev->coherent_dma_mask;
+	child->dma_mask = dev->dma_mask;
+	child->release = mfc_memdev_release;
+	child->dma_parms = devm_kzalloc(dev, sizeof(*child->dma_parms),
+					GFP_KERNEL);
+	if (!child->dma_parms)
+		goto err;
+	/*
+	 * The memdevs are not proper OF platform devices, so in order for them
+	 * to be treated as valid DMA masters we need a bit of a hack to force
+	 * them to inherit the MFC node's DMA configuration.
+	 */
+	of_dma_configure(child, dev->of_node, true);
+
+	if (!device_add(child)) {
+		ret = of_reserved_mem_device_init_by_idx(child, dev->of_node,
+							 idx);
+		if (!ret)
+			return child;
+		device_del(child);
+	}
+err:
+	put_device(child);
+	return NULL;
+}
+
+int mfc_configure_dma_memory(struct mfc_dev *mfc_dev)
+{
+	struct device *dev = mfc_dev->device;
+	void *bank2_virt;
+	dma_addr_t bank2_dma_addr;
+	unsigned long align_size = BIT(17); // MFC_BASE_ALIGN_ORDER;
+
+	/*
+	 * Create and initialize virtual devices for accessing
+	 * reserved memory regions.
+	 */
+	mfc_dev->mem_dev[BANK_L_CTX] = mfc_alloc_memdev(dev, "left",
+							BANK_L_CTX);
+	if (!mfc_dev->mem_dev[BANK_L_CTX])
+		return -ENODEV;
+
+	mfc_dev->mem_dev[BANK_R_CTX] = mfc_alloc_memdev(dev, "right",
+							BANK_R_CTX);
+	if (!mfc_dev->mem_dev[BANK_R_CTX]) {
+		device_unregister(mfc_dev->mem_dev[BANK_L_CTX]);
+		return -ENODEV;
+	}
+
+	/* Allocate memory for firmware and initialize both banks addresses */
+	bank2_virt = dma_alloc_coherent(mfc_dev->mem_dev[BANK_R_CTX],
+					align_size, &bank2_dma_addr, GFP_KERNEL);
+	if (!bank2_virt) {
+		// mfc_release_firmware(mfc_dev);
+		device_unregister(mfc_dev->mem_dev[BANK_R_CTX]);
+		device_unregister(mfc_dev->mem_dev[BANK_L_CTX]);
+		return -ENOMEM;
+	}
+
+	dma_free_coherent(mfc_dev->mem_dev[BANK_R_CTX], align_size, bank2_virt,
+			  bank2_dma_addr);
+
+	dma_set_max_seg_size(mfc_dev->mem_dev[BANK_L_CTX], DMA_BIT_MASK(32));
+	dma_set_max_seg_size(mfc_dev->mem_dev[BANK_R_CTX], DMA_BIT_MASK(32));
+
+	return 0;
+}
+
+void mfc_unconfigure_dma_memory(struct mfc_dev *mfc_dev)
+{
+	device_unregister(mfc_dev->mem_dev[BANK_L_CTX]);
+	device_unregister(mfc_dev->mem_dev[BANK_R_CTX]);
+}
+
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
new file mode 100644
index 000000000000..7b37e5fedbf2
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_mem.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_MEM_H
+#define __MFC_MEM_H __FILE__
+
+#include <linux/dma-buf.h>
+#include <linux/dma-direct.h>
+#include <linux/of_reserved_mem.h>
+
+#include "mfc_common.h"
+
+/* Offset base used to differentiate between CAPTURE and OUTPUT
+ *  while mmaping
+ */
+#define DST_QUEUE_OFF_BASE      (TASK_SIZE / 2)
+
+struct dma_priv {
+	void *vaddr;
+	dma_addr_t dma_addr;
+	struct device *dev;
+	size_t size;
+};
+
+static inline dma_addr_t mfc_mem_get_daddr_vb(struct vb2_buffer *vb, unsigned int n)
+{
+	struct sg_table *sgt;
+	dma_addr_t addr = 0;
+
+	sgt = vb2_dma_sg_plane_desc(vb, n);
+	addr = sg_dma_address(sgt->sgl);
+	WARN_ON((addr == 0) || IS_ERR_VALUE(addr));
+
+	return addr;
+}
+
+static inline phys_addr_t mfc_mem_get_paddr_vb(struct vb2_buffer *vb)
+{
+	struct sg_table *sgt;
+
+	sgt = vb2_dma_sg_plane_desc(vb, 0);
+
+	return page_to_phys(sg_page(sgt->sgl));
+}
+
+static inline size_t mfc_mem_get_sg_length(struct mfc_dev *dev, struct sg_table *sgt)
+{
+	struct scatterlist *sg;
+	size_t size = 0;
+	int i;
+
+	for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {
+		size += sg->length;
+		mfc_dev_debug(6, "[MEMINFO] [%d] sg length %u, sum %zu\n",
+			      i, sg->length, size);
+	}
+
+	return size;
+}
+
+int mfc_mem_special_buf_alloc(struct mfc_dev *dev, struct mfc_special_buf *special_buf);
+void mfc_mem_special_buf_free(struct mfc_dev *dev, struct mfc_special_buf *special_buf);
+
+void mfc_iova_pool_free(struct mfc_dev *dev, struct mfc_special_buf *buf);
+int mfc_iova_pool_alloc(struct mfc_dev *dev, struct mfc_special_buf *buf);
+int mfc_iova_pool_init(struct mfc_dev *dev);
+
+int mfc_iommu_map_firmware(struct mfc_core *core, struct mfc_special_buf *fw_buf);
+
+int mfc_configure_dma_memory(struct mfc_dev *mfc_dev);
+void mfc_unconfigure_dma_memory(struct mfc_dev *mfc_dev);
+#endif /* __MFC_MEM_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_regs.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_regs.h
new file mode 100644
index 000000000000..39f20e5c8877
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_regs.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ * mfc_regs.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_REGS_H
+#define __MFC_REGS_H __FILE__
+
+#include "mfc_regs_mfc.h"
+#include "mfc_data_struct.h"
+
+#define MFC_MIN_BITMASK		32
+
+#define MFC_CORE_READL(offset)					\
+	readl(core->regs_base + (offset))
+#define MFC_CORE_WRITEL(data, offset)				\
+	writel((data), core->regs_base + (offset))
+
+#define MFC_CORE_RAW_READL(offset)				\
+	__raw_readl(core->regs_base + (offset))
+#define MFC_CORE_RAW_WRITEL(data, offset)			\
+	__raw_writel((data), core->regs_base + (offset))
+
+#define MFC_CORE_DMA_READL(offset)						\
+({										\
+	dma_addr_t data;							\
+	typeof(offset) off = offset;                                            \
+	if (core->dev->pdata->dma_bit_mask == MFC_MIN_BITMASK)			\
+		data = readl(core->regs_base + (off));				\
+	else									\
+		data = (dma_addr_t)readl(core->regs_base + (off)) << 4;		\
+	data;									\
+})
+
+#define MFC_CORE_DMA_WRITEL(data, offset)					\
+({										\
+	typeof(offset) off = offset;                                            \
+	typeof(data) dat = data;						\
+	if (core->dev->pdata->dma_bit_mask == MFC_MIN_BITMASK)			\
+		writel((dat), core->regs_base + (off));			\
+	else									\
+		writel((dat >> 4), core->regs_base + (off));			\
+})
+
+#define MFC_MMU0_READL(offset)		readl(core->sysmmu0_base + (offset))
+#define MFC_MMU1_READL(offset)		readl(core->sysmmu1_base + (offset))
+#define mfc_get_mmu0_value(offset, shift, mask)	((MFC_MMU0_READL(offset) >> (shift)) & (mask))
+#define mfc_get_mmu1_value(offset, shift, mask)	((MFC_MMU1_READL(offset) >> (shift)) & (mask))
+
+#define PMU_READL(offset)		readl(core->pmu_base + (offset))
+#define PMU_WRITEL(data, offset)	writel((data), core->pmu_base + (offset))
+
+#endif /* __MFC_REGS_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_sched.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_sched.h
new file mode 100644
index 000000000000..5048bf6c1d78
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_sched.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_sched.h File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_SCHED_H
+#define __MFC_SCHED_H __FILE__
+
+#include "mfc_common.h"
+
+extern struct mfc_sched_class mfc_sched_prio;
+
+static inline int mfc_get_prio(struct mfc_core *core, int rt, int prio)
+{
+	return (rt == MFC_NON_RT) ? (core->num_prio + prio) : prio;
+}
+
+static inline void mfc_sched_init_core(struct mfc_core *core)
+{
+	core->sched = &mfc_sched_prio;
+	core->sched->create_work(core);
+	core->sched->init_work(core);
+}
+#endif /* __MFC_SCHED_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
new file mode 100644
index 000000000000..f965a2e440c0
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
@@ -0,0 +1,168 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_utils.h
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_UTILS_H
+#define __MFC_UTILS_H __FILE__
+
+#include "mfc_common.h"
+
+static inline void mfc_core_clean_dev_int_flags(struct mfc_core *core)
+{
+	core->int_condition = 0;
+	core->int_reason = 0;
+	core->int_err = 0;
+}
+
+static inline void mfc_clean_core_ctx_int_flags(struct mfc_core_ctx *core_ctx)
+{
+	core_ctx->int_condition = 0;
+	core_ctx->int_reason = 0;
+	core_ctx->int_err = 0;
+}
+
+static inline void mfc_change_state(struct mfc_core_ctx *core_ctx, enum mfc_inst_state state)
+{
+	MFC_TRACE_CORE_CTX("** state : %d -> %d\n", core_ctx->state, state);
+	mfc_debug(3, "state %d -> %d\n", core_ctx->state, state);
+	core_ctx->state = state;
+}
+
+static inline void mfc_change_op_mode(struct mfc_ctx *ctx, enum mfc_op_mode op_mode)
+{
+	struct mfc_dev *dev = ctx->dev;
+
+	MFC_TRACE_RM("** op_mode : %d -> %d\n", ctx->op_mode, op_mode);
+	MFC_TRACE_CTX("** op_mode : %d -> %d\n", ctx->op_mode, op_mode);
+	mfc_ctx_debug(3, "op_mode %d -> %d\n", ctx->op_mode, op_mode);
+	ctx->op_mode = op_mode;
+}
+
+static inline void mfc_core_change_state(struct mfc_core *core, enum mfc_core_state state)
+{
+	MFC_TRACE_CORE("** core state : %d\n", state);
+	core->state = state;
+}
+
+static inline void mfc_core_change_fw_state(struct mfc_core *core,
+					    enum mfc_fw_status state, int set)
+{
+	enum mfc_fw_status prev_stat;
+
+	prev_stat = core->fw.status;
+	if (set)
+		core->fw.status |= state;
+	else
+		core->fw.status &= ~state;
+	MFC_TRACE_CORE("** normal FW status %#x -> %#x (%s: %#x)\n",
+		       prev_stat, core->fw.status, set ? "set" : "clear", state);
+	mfc_core_debug(2, "[F/W] normal status: %#x -> %#x (%s: %#x)\n",
+		       prev_stat, core->fw.status, set ? "set" : "clear", state);
+}
+
+static inline enum mfc_node_type mfc_get_node_type(struct file *file)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct mfc_dev *dev;
+	enum mfc_node_type node_type;
+
+	if (!vdev) {
+		mfc_pr_err("mfc failed to get video_device\n");
+		return MFCNODE_INVALID;
+	}
+	dev = video_drvdata(file);
+
+	mfc_dev_debug(2, "video_device index: %d\n", vdev->index);
+
+	switch (vdev->index) {
+	case 0:
+		node_type = MFCNODE_DECODER;
+		break;
+	case 1:
+		node_type = MFCNODE_ENCODER;
+		break;
+	case 2:
+		node_type = MFCNODE_DECODER_DRM;
+		break;
+	case 3:
+		node_type = MFCNODE_ENCODER_DRM;
+		break;
+	case 4:
+		node_type = MFCNODE_ENCODER_OTF;
+		break;
+	case 5:
+		node_type = MFCNODE_ENCODER_OTF_DRM;
+		break;
+	default:
+		node_type = MFCNODE_INVALID;
+		break;
+	}
+
+	return node_type;
+}
+
+static inline int mfc_is_decoder_node(enum mfc_node_type node)
+{
+	if (node == MFCNODE_DECODER)
+		return 1;
+
+	return 0;
+}
+
+/* Meerkat interval */
+#define MEERKAT_TICK_INTERVAL   1000
+/* After how many executions meerkat should assume lock up */
+#define MEERKAT_TICK_CNT_TO_START_MEERKAT        10
+
+/* MFC idle checker interval */
+#define MFCIDLE_TICK_INTERVAL	1500
+
+void mfc_core_idle_checker(struct timer_list *t);
+
+static inline void mfc_core_idle_checker_start_tick(struct mfc_core *core)
+{
+	mod_timer(&core->mfc_idle_timer, jiffies +
+		msecs_to_jiffies(MFCIDLE_TICK_INTERVAL));
+
+	atomic_set(&core->hw_run_bits, 0);
+	atomic_set(&core->dev->queued_bits, 0);
+}
+
+static inline void mfc_core_idle_update_hw_run(struct mfc_core *core,
+					       struct mfc_ctx *ctx)
+{
+	unsigned long flags;
+	int bits;
+
+	spin_lock_irqsave(&core->dev->idle_bits_lock, flags);
+
+	bits = atomic_read(&core->hw_run_bits);
+	atomic_set(&core->hw_run_bits, (bits | BIT(ctx->num)));
+
+	spin_unlock_irqrestore(&core->dev->idle_bits_lock, flags);
+}
+
+static inline void mfc_core_change_idle_mode(struct mfc_core *core,
+					     enum mfc_idle_mode idle_mode)
+{
+	MFC_TRACE_CORE("** idle mode : %d\n", idle_mode);
+	core->idle_mode = idle_mode;
+
+	if (core->idle_mode == MFC_IDLE_MODE_NONE)
+		mfc_core_idle_checker_start_tick(core);
+}
+
+static inline void mfc_ctx_change_idle_mode(struct mfc_ctx *ctx,
+					    enum mfc_idle_mode idle_mode)
+{
+	MFC_TRACE_CTX("**[c:%d] idle mode : %d\n", ctx->num, idle_mode);
+	ctx->idle_mode = idle_mode;
+}
+#endif /* __MFC_UTILS_H */
-- 
2.34.1

