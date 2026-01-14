Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2AD1E014
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F7710E0F2;
	Wed, 14 Jan 2026 10:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527F610E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:24:35 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6536e4d25e1so2302285a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768386274; x=1768991074;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p15e32WbNaL2KGaBjlfT55qZ8Pa+6Ph5Zi1/eLI5a5E=;
 b=VleM4+2cHo54P2f4DSL5Guk18UQYdkxgX0KWjRWBv0kzeq0XbjwhtBWgOhClpYIBVw
 Tf87ESPobGsvIjti0ruEV+aXoB8pcVfbD6sgtFkqaQtD6J4ojhdPkvIHPdp+9aS4oJbz
 2VybuX2npsoTppu74ewRZOuTnEsk2vAvbwhOfTQFwdfWMs+Z5Cd8n8cJndzaYPN4dJw3
 SIlubO8gt2tUT9dtsz0xrEZU7oKTRKMX4bmo1JfWLKpz52tcBWY5sjv/fcR1NnDsaWAF
 JTmyE80ki/5PsblMEs1pq7W7YRvPBE9OI0fhhAaGaumCi1g0hhEftE+RpAchNIeGypCZ
 8aNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXKcQV2mR0yfZn4FUK7c1e0rBr6cd++xyAovx4fzfN8SkpU5PLFJdjQIq6DG+tYxMCenh9AVQNn88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/2+HLGdjxdIzfQTN1ysPEfn8X/+xI7TCNMOIjJ5gB8jURaak9
 aap+otv1YOvBCNWwrMw/wFOhva/BILlSYr9hDFAFf+1NTkuj2cWKzNvgOayZrg==
X-Gm-Gg: AY/fxX64N+Bi1/mjeQvctqzIIdZyDfJRzbeMQC9FzkuQGju9xZu4GEUfVeT09TQ38Vm
 iSOyJejh7ubaA2blGtTL5OhFGjSpClNTNj+Ctw0OLsxjK40uYqRaHG+8pJHwvtLWU/CG2/W6eGZ
 7xlPtzH2eZBwq8LZZfPcS9ptmmphi8ySJgelf/ziBZyFVwwMDbRk3iTrgYPG90lESagKRoxOq9Z
 cguuLmQnINylsN1f8EGJnNPZxrcQcxmYspJmhkSM+NhxyYnQz+pA4SgfWwSiiWo7PPU+mmPwPgu
 4iWWelS8d2eQe5sTlFmP0XLysnFGzynlPWWq19eERpNPuuLmtw3u6X4zLQOto/9h/KbYaZkSXai
 AXjkCrvvMpxb7+e+wRV53UsKaxwie1rdpAQl4QWUhK6Kx74+4Xpkn6xSpw50vFH9XGHFOheyQ5c
 3Fh6wcZt57psJiGb9Lshr8cUzckH0OtNmW/2Z/Ap7jII2OrQ==
X-Received: by 2002:a05:6402:13c3:b0:64d:e1c:4c0a with SMTP id
 4fb4d7f45d1cf-653ebf703famr1606697a12.0.1768380438100; 
 Wed, 14 Jan 2026 00:47:18 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:47:17 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 09:46:49 +0100
Subject: [PATCH v2 2/5] accel/thames: Add driver for the C7x DSPs in TI
 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-thames-v2-2-e94a6636e050@tomeuvizoso.net>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
In-Reply-To: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

Some SoCs from Texas Instruments contain DSPs that can be used for
general compute tasks.

This driver provides a drm/accel UABI to userspace for submitting jobs
to the DSP cores and managing the input, output and intermediate memory.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 Documentation/accel/thames/index.rst |  28 +++++
 MAINTAINERS                          |   9 ++
 drivers/accel/Kconfig                |   1 +
 drivers/accel/Makefile               |   3 +-
 drivers/accel/thames/Kconfig         |  26 +++++
 drivers/accel/thames/Makefile        |   9 ++
 drivers/accel/thames/thames_core.c   | 155 ++++++++++++++++++++++++++
 drivers/accel/thames/thames_core.h   |  53 +++++++++
 drivers/accel/thames/thames_device.c |  93 ++++++++++++++++
 drivers/accel/thames/thames_device.h |  46 ++++++++
 drivers/accel/thames/thames_drv.c    | 155 ++++++++++++++++++++++++++
 drivers/accel/thames/thames_drv.h    |  21 ++++
 drivers/accel/thames/thames_ipc.h    | 204 +++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_rpmsg.c  | 155 ++++++++++++++++++++++++++
 drivers/accel/thames/thames_rpmsg.h  |  27 +++++
 15 files changed, 984 insertions(+), 1 deletion(-)

diff --git a/Documentation/accel/thames/index.rst b/Documentation/accel/thames/index.rst
new file mode 100644
index 0000000000000000000000000000000000000000..ca8391031f226f7ef1dc210a356c86acbe126c6f
--- /dev/null
+++ b/Documentation/accel/thames/index.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+============================================================
+ accel/thames Driver for the C7x DSPs from Texas Instruments
+============================================================
+
+The accel/thames driver supports the C7x DSPs inside some Texas Instruments SoCs
+such as the J722S. These can be used as accelerators for various workloads,
+including machine learning inference.
+
+This driver controls the power state of the hardware via :doc:`remoteproc </staging/remoteproc>`
+and communicates with the firmware running on the DSP via :doc:`rpmsg_virtio </staging/rpmsg_virtio>`.
+The kernel driver itself allocates buffers, manages contexts, and submits jobs
+to the DSP firmware. Buffers are mapped by the DSP itself using its MMU,
+providing memory isolation among different clients.
+
+The source code for the firmware running on the DSP is available at:
+https://gitlab.freedesktop.org/tomeu/thames_firmware/.
+
+Everything else is done in userspace, as a Gallium driver (also called thames)
+that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html
+
+If there is more than one core that advertises the same rpmsg_virtio service
+name, the driver will load balance jobs between them with drm-gpu-scheduler.
+
+Hardware currently supported:
+
+* J722S
diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8feeff25613c59fe9c929927dadaa7e..a3fc809c797269d0792dfe5202cc1b49f6ff57e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7731,6 +7731,15 @@ F:	Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
 F:	drivers/accel/rocket/
 F:	include/uapi/drm/rocket_accel.h
 
+DRM ACCEL DRIVER FOR TI C7x DSPS
+M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/thames/
+F:	drivers/accel/thames/
+F:	include/uapi/drm/thames_accel.h
+
 DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
 M:	Oded Gabbay <ogabbay@kernel.org>
 L:	dri-devel@lists.freedesktop.org
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bdf48ccafcf21b2fd685ec963e39e256196e6e17..cb49c71cd4e4a4220624f7041a75ba950a1a2ee1 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -30,5 +30,6 @@ source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
 source "drivers/accel/rocket/Kconfig"
+source "drivers/accel/thames/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950f39e2ae600a2fc07a3ef7e41831e..8472989cbe22746f1e7292d2401fa0f7424a6c15 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
-obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
+obj-$(CONFIG_DRM_ACCEL_THAMES)		+= thames/
\ No newline at end of file
diff --git a/drivers/accel/thames/Kconfig b/drivers/accel/thames/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..50e0b6ac2a16a942ba8463333991f5b0161b99ac
--- /dev/null
+++ b/drivers/accel/thames/Kconfig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_THAMES
+	tristate "Thames (support for TI C7x DSP accelerators)"
+	depends on DRM_ACCEL
+	depends on TI_K3_R5_REMOTEPROC || COMPILE_TEST
+	depends on RPMSG
+	depends on MMU
+	select DRM_SCHED
+	select DRM_GEM_SHMEM_HELPER
+	help
+	  Choose this option if you have a Texas Instruments SoC that contains
+	  C7x DSP cores that can be used as compute accelerators. This includes
+	  SoCs such as the AM62A, J721E, J721S2, and J784S4.
+
+	  The C7x DSP cores can be used for general-purpose compute acceleration
+	  and are exposed through the DRM accel subsystem.
+
+	  The interface exposed to userspace is described in
+	  include/uapi/drm/thames_accel.h and is used by the Thames userspace
+	  driver in Mesa3D.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called thames.
diff --git a/drivers/accel/thames/Makefile b/drivers/accel/thames/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..7ccd8204f0f5ea800f30e84b319f355be948109d
--- /dev/null
+++ b/drivers/accel/thames/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_ACCEL_THAMES) := thames.o
+
+thames-y := \
+	thames_core.o \
+	thames_device.o \
+	thames_drv.o \
+	thames_rpmsg.o
diff --git a/drivers/accel/thames/thames_core.c b/drivers/accel/thames/thames_core.c
new file mode 100644
index 0000000000000000000000000000000000000000..92af1d68063116bcfa28a33960cbe829029fc1bf
--- /dev/null
+++ b/drivers/accel/thames/thames_core.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#include "linux/remoteproc.h"
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/completion.h>
+#include <linux/jiffies.h>
+#include <linux/rpmsg.h>
+
+#include "thames_core.h"
+#include "thames_device.h"
+#include "thames_rpmsg.h"
+
+/* Shift to convert bytes to megabytes (divide by 1048576) */
+#define THAMES_BYTES_TO_MB_SHIFT 20
+
+int thames_core_get_iova_range(struct rpmsg_device *rpdev, u64 *iova_start, u64 *iova_size)
+{
+	struct rproc *rproc;
+	struct device_node *of_node;
+	struct device_node *mem_node;
+	struct resource mem_res;
+	int err;
+
+	if (!iova_start || !iova_size)
+		return -EINVAL;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc) {
+		dev_err(&rpdev->dev, "Failed to get rproc device\n");
+		return -ENODEV;
+	}
+
+	of_node = rproc->dev.parent->of_node;
+	put_device(&rproc->dev);
+
+	if (!of_node) {
+		dev_err(&rpdev->dev, "No device tree node found on rproc parent\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Read the IOVA pool range from the device tree node.
+	 * The third memory-region (index 2) defines the virtual address range.
+	 * The first two regions are typically:
+	 *   [0] = DMA memory region for remoteproc (physically contiguous)
+	 *   [1] = Code/data memory region for remoteproc (physically contiguous)
+	 *   [2] = Virtual address pool for BO mappings (firmware-managed MMU)
+	 */
+	mem_node = of_parse_phandle(of_node, "memory-region", 2);
+	if (!mem_node) {
+		dev_err(&rpdev->dev, "Missing third memory-region (DSP VA pool) in device tree\n");
+		return -EINVAL;
+	}
+
+	err = of_address_to_resource(mem_node, 0, &mem_res);
+	of_node_put(mem_node);
+	if (err) {
+		dev_err(&rpdev->dev, "Failed to get DSP VA pool range from memory-region[2]: %d\n",
+			err);
+		return err;
+	}
+
+	*iova_start = mem_res.start;
+	*iova_size = resource_size(&mem_res);
+
+	if (!*iova_size) {
+		dev_err(&rpdev->dev, "Invalid DSP VA pool size: 0\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int thames_core_validate_iova_range(struct thames_core *core)
+{
+	struct thames_device *tdev = core->tdev;
+	u64 iova_start, iova_size;
+	int err;
+
+	err = thames_core_get_iova_range(core->rpdev, &iova_start, &iova_size);
+	if (err)
+		return err;
+
+	if (iova_start != tdev->iova_start || iova_size != tdev->iova_size) {
+		dev_err(core->dev,
+			"Core %d IOVA range mismatch! Expected 0x%llx-0x%llx, got 0x%llx-0x%llx\n",
+			core->index, tdev->iova_start, tdev->iova_start + tdev->iova_size - 1,
+			iova_start, iova_start + iova_size - 1);
+		dev_err(core->dev,
+			"All cores must have the same memory-region[2] (IOVA pool) in device tree\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int thames_core_init(struct thames_core *core)
+{
+	int err = 0;
+
+	err = thames_core_validate_iova_range(core);
+	if (err)
+		return err;
+
+	err = thames_rpmsg_init(core);
+	if (err)
+		return err;
+
+	err = thames_rpmsg_ping_test(core);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void thames_core_fini(struct thames_core *core)
+{
+	thames_rpmsg_fini(core);
+}
+
+void thames_core_reset(struct thames_core *core)
+{
+	struct rpmsg_device *rpdev = core->rpdev;
+	struct rproc *rproc;
+	int ret;
+
+	dev_warn(core->dev, "Resetting DSP core %d", core->index);
+
+	if (!atomic_read(&core->reset.pending))
+		dev_warn(core->dev, "Reset called without reset.pending set\n");
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc) {
+		dev_err(core->dev, "Failed to get rproc for reset\n");
+		return;
+	}
+
+	ret = rproc_shutdown(rproc);
+	if (ret) {
+		dev_err(&rproc->dev, "Failed to shut down DSP: %d\n", ret);
+		goto put_rproc;
+	}
+
+	ret = rproc_boot(rproc);
+	if (ret)
+		dev_err(&rproc->dev, "Failed to boot DSP: %d\n", ret);
+
+put_rproc:
+	put_device(&rproc->dev);
+}
diff --git a/drivers/accel/thames/thames_core.h b/drivers/accel/thames/thames_core.h
new file mode 100644
index 0000000000000000000000000000000000000000..72c3d3d6c575f56cc1d8731d1c9dc958486dbf7f
--- /dev/null
+++ b/drivers/accel/thames/thames_core.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#ifndef __THAMES_CORE_H__
+#define __THAMES_CORE_H__
+
+#include <linux/rpmsg.h>
+#include <drm/gpu_scheduler.h>
+#include <linux/mutex_types.h>
+#include <linux/completion.h>
+
+struct thames_msg_buffer_op;
+
+struct thames_core {
+	struct rpmsg_device *rpdev;
+	struct device *dev;
+	struct thames_device *tdev;
+	unsigned int index;
+
+	/* RPMSG communication context */
+	struct {
+		struct rpmsg_endpoint *endpoint;
+
+		struct {
+			u32 sequence;
+			u32 expected_data;
+			bool success;
+			struct completion completion;
+		} ping_test;
+	} rpmsg_ctx;
+
+	struct mutex job_lock;
+	struct thames_job *in_flight_job;
+
+	spinlock_t fence_lock;
+
+	struct {
+		struct workqueue_struct *wq;
+		struct work_struct work;
+		atomic_t pending;
+	} reset;
+
+	struct drm_gpu_scheduler sched;
+	u64 fence_context;
+	u64 emit_seqno;
+};
+
+int thames_core_init(struct thames_core *core);
+void thames_core_fini(struct thames_core *core);
+void thames_core_reset(struct thames_core *core);
+int thames_core_get_iova_range(struct rpmsg_device *rpdev, u64 *iova_start, u64 *iova_size);
+
+#endif
diff --git a/drivers/accel/thames/thames_device.c b/drivers/accel/thames/thames_device.c
new file mode 100644
index 0000000000000000000000000000000000000000..2b2aa32b07ee361ea388ab5ec781a13ff4359e5f
--- /dev/null
+++ b/drivers/accel/thames/thames_device.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#include <drm/drm_drv.h>
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/platform_device.h>
+
+#include "thames_device.h"
+
+/* Shift to convert bytes to megabytes (divide by 1048576) */
+#define THAMES_BYTES_TO_MB_SHIFT 20
+
+struct thames_device *thames_device_init(struct platform_device *pdev,
+
+					 const struct drm_driver *thames_drm_driver, u64 iova_start,
+					 u64 iova_size)
+{
+	struct device *dev = &pdev->dev;
+	struct thames_device *tdev;
+	struct drm_device *ddev;
+	int err;
+
+	tdev = devm_drm_dev_alloc(dev, thames_drm_driver, struct thames_device, ddev);
+	if (IS_ERR(tdev))
+		return tdev;
+
+	tdev->num_cores = 0;
+	ddev = &tdev->ddev;
+	dev_set_drvdata(dev, tdev);
+
+	dma_set_max_seg_size(dev, UINT_MAX);
+
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	if (err)
+		return ERR_PTR(err);
+
+	err = devm_mutex_init(dev, &tdev->sched_lock);
+	if (err)
+		return ERR_PTR(-ENOMEM);
+
+	ida_init(&tdev->bo_ida);
+	ida_init(&tdev->ctx_ida);
+	ida_init(&tdev->job_ida);
+	ida_init(&tdev->ipc_seq_ida);
+
+	/*
+	 * Initialize shared virtual address space for all DSP cores.
+	 *
+	 * IMPORTANT: This driver does NOT use Linux IOMMU. The TI C7x DSP cores
+	 * have their own MMUs that are managed entirely by the DSP firmware.
+	 * The VA space is shared across all cores - userspace receives VAs that
+	 * work on all cores. Each core's firmware programs its own MMU to map
+	 * the same VA to the same PA.
+	 *
+	 * The Linux driver's role is only to:
+	 * 1. Allocate non-overlapping virtual addresses from a safe range
+	 * 2. Provide physical addresses to each DSP firmware via IPC
+	 * 3. Let each firmware program its own MMU to map VA -> PA
+	 */
+	if (!iova_size) {
+		dev_err(dev, "Invalid DSP VA pool size: 0\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	tdev->iova_start = iova_start;
+	tdev->iova_size = iova_size;
+
+	drm_mm_init(&tdev->mm, iova_start, iova_size);
+	err = devm_mutex_init(dev, &tdev->mm_lock);
+	if (err)
+		return ERR_PTR(-ENOMEM);
+
+	err = drm_dev_register(ddev, 0);
+	if (err)
+		return ERR_PTR(err);
+
+	return tdev;
+}
+
+void thames_device_fini(struct thames_device *tdev)
+{
+	WARN_ON(tdev->num_cores > 0);
+
+	ida_destroy(&tdev->bo_ida);
+	ida_destroy(&tdev->ctx_ida);
+	ida_destroy(&tdev->job_ida);
+	ida_destroy(&tdev->ipc_seq_ida);
+	drm_mm_takedown(&tdev->mm);
+	drm_dev_unregister(&tdev->ddev);
+}
diff --git a/drivers/accel/thames/thames_device.h b/drivers/accel/thames/thames_device.h
new file mode 100644
index 0000000000000000000000000000000000000000..c7d8e521d4323122134e8c8e8d256d957c89ae5f
--- /dev/null
+++ b/drivers/accel/thames/thames_device.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#ifndef __THAMES_DEVICE_H__
+#define __THAMES_DEVICE_H__
+
+#include <drm/drm_device.h>
+#include <drm/drm_mm.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/idr.h>
+#include <linux/platform_device.h>
+
+#include "thames_core.h"
+
+#define MAX_CORES 8
+
+struct thames_device {
+	struct drm_device ddev;
+
+	struct mutex sched_lock;
+
+	struct thames_core cores[MAX_CORES];
+	unsigned int num_cores;
+
+	struct ida bo_ida;
+	struct ida ctx_ida;
+	struct ida job_ida;
+	struct ida ipc_seq_ida;
+
+	struct drm_mm mm;
+	struct mutex mm_lock;
+
+	u64 iova_start;
+	u64 iova_size;
+};
+
+struct thames_device *thames_device_init(struct platform_device *pdev,
+					 const struct drm_driver *thames_drm_driver, u64 iova_start,
+					 u64 iova_size);
+void thames_device_fini(struct thames_device *rdev);
+
+#define to_thames_device(drm_dev) \
+	((struct thames_device *)(container_of((drm_dev), struct thames_device, ddev)))
+
+#endif /* __THAMES_DEVICE_H__ */
diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
new file mode 100644
index 0000000000000000000000000000000000000000..473498dd6f0135f346b0986a2a17fc4411417f52
--- /dev/null
+++ b/drivers/accel/thames/thames_drv.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+
+#include "thames_drv.h"
+#include "thames_core.h"
+#include "thames_ipc.h"
+
+static struct platform_device *drm_dev;
+static struct thames_device *tdev;
+
+static int thames_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct thames_device *tdev = to_thames_device(dev);
+	struct thames_file_priv *thames_priv;
+	int ret;
+
+	if (!try_module_get(THIS_MODULE))
+		return -EINVAL;
+
+	thames_priv = kzalloc(sizeof(*thames_priv), GFP_KERNEL);
+	if (!thames_priv) {
+		ret = -ENOMEM;
+		goto err_put_mod;
+	}
+
+	thames_priv->tdev = tdev;
+
+	file->driver_priv = thames_priv;
+
+	return 0;
+
+err_put_mod:
+	module_put(THIS_MODULE);
+	return ret;
+}
+
+static void thames_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct thames_file_priv *thames_priv = file->driver_priv;
+
+	kfree(thames_priv);
+	module_put(THIS_MODULE);
+}
+
+static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
+#define THAMES_IOCTL(n, func) DRM_IOCTL_DEF_DRV(THAMES_##n, thames_ioctl_##func, 0)
+
+};
+
+DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
+
+static const struct drm_driver thames_drm_driver = {
+	.driver_features = DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
+	.open = thames_open,
+	.postclose = thames_postclose,
+	.ioctls = thames_drm_driver_ioctls,
+	.num_ioctls = ARRAY_SIZE(thames_drm_driver_ioctls),
+	.fops = &thames_accel_driver_fops,
+	.name = "thames",
+	.desc = "thames DRM",
+};
+
+static int thames_probe(struct rpmsg_device *rpdev)
+{
+	u64 iova_start, iova_size;
+	unsigned int core;
+	int err;
+
+	if (!tdev) {
+		err = thames_core_get_iova_range(rpdev, &iova_start, &iova_size);
+		if (err)
+			return err;
+
+		tdev = thames_device_init(drm_dev, &thames_drm_driver, iova_start, iova_size);
+		if (IS_ERR(tdev)) {
+			dev_err(&rpdev->dev, "failed to initialize thames device\n");
+			return PTR_ERR(tdev);
+		}
+	}
+
+	core = tdev->num_cores;
+
+	tdev->cores[core].tdev = tdev;
+	tdev->cores[core].rpdev = rpdev;
+	tdev->cores[core].dev = &rpdev->dev;
+	tdev->cores[core].index = core;
+
+	tdev->num_cores++;
+
+	return thames_core_init(&tdev->cores[core]);
+}
+
+static void thames_remove(struct rpmsg_device *rpdev)
+{
+	unsigned int core;
+
+	for (core = 0; core < tdev->num_cores; core++) {
+		if (tdev->cores[core].rpdev == rpdev) {
+			thames_core_fini(&tdev->cores[core]);
+			tdev->num_cores--;
+			break;
+		}
+	}
+
+	if (!tdev->num_cores) {
+		thames_device_fini(tdev);
+		tdev = NULL;
+	}
+}
+
+static const struct rpmsg_device_id thames_rpmsg_id_table[] = { { .name = THAMES_SERVICE_NAME },
+								{} };
+
+static struct rpmsg_driver thames_rpmsg_driver = {
+	.drv = {
+		.name = "thames",
+		.owner = THIS_MODULE,
+	},
+	.id_table = thames_rpmsg_id_table,
+	.probe = thames_probe,
+	.remove = thames_remove,
+};
+
+static int __init thames_register(void)
+{
+	drm_dev = platform_device_register_simple("thames", -1, NULL, 0);
+	if (IS_ERR(drm_dev))
+		return PTR_ERR(drm_dev);
+
+	return register_rpmsg_driver(&thames_rpmsg_driver);
+}
+
+static void __exit thames_unregister(void)
+{
+	unregister_rpmsg_driver(&thames_rpmsg_driver);
+
+	platform_device_unregister(drm_dev);
+}
+
+module_init(thames_register);
+module_exit(thames_unregister);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DRM driver for Texas Instrument's C7x accelerator cores");
+MODULE_AUTHOR("Tomeu Vizoso");
+MODULE_ALIAS("rpmsg:" THAMES_SERVICE_NAME);
diff --git a/drivers/accel/thames/thames_drv.h b/drivers/accel/thames/thames_drv.h
new file mode 100644
index 0000000000000000000000000000000000000000..e03203eab8b88686ca91c10b45e55df1ea3d2e77
--- /dev/null
+++ b/drivers/accel/thames/thames_drv.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#ifndef __THAMES_DRV_H__
+#define __THAMES_DRV_H__
+
+#include <drm/drm_mm.h>
+#include <drm/gpu_scheduler.h>
+
+#include "thames_device.h"
+
+struct thames_file_priv {
+	struct thames_device *tdev;
+
+	struct drm_sched_entity sched_entity;
+
+	u32 context_id;
+	bool context_valid;
+};
+
+#endif
diff --git a/drivers/accel/thames/thames_ipc.h b/drivers/accel/thames/thames_ipc.h
new file mode 100644
index 0000000000000000000000000000000000000000..60297b4bc2ffd990315cb735a96a23429d390f43
--- /dev/null
+++ b/drivers/accel/thames/thames_ipc.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * This header defines the RPMSG message structures exchanged between
+ * the Linux kernel (host) and the C7x DSP (remote) firmware for the
+ * Thames DRM/accel driver.
+ */
+
+#ifndef _THAMES_IPC_H
+#define _THAMES_IPC_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+typedef uint8_t __u8;
+typedef uint16_t __u16;
+typedef uint32_t __u32;
+typedef uint64_t __u64;
+#endif
+
+#define THAMES_SERVICE_NAME "thames-service"
+
+/**
+ * @THAMES_MSG_TYPE: Simplified message type enumeration
+ */
+enum thames_msg_type {
+	/* --- Host (Kernel) -> Remote (DSP) --- */
+	THAMES_MSG_PING = 0x100, /* Ping message to test communication */
+	THAMES_MSG_CONTEXT_OP, /* Create/destroy context */
+	THAMES_MSG_BO_OP, /* Map/unmap buffer objects */
+	THAMES_MSG_SUBMIT_JOB, /* Submit job for execution */
+
+	/* --- Remote (DSP) -> Host (Kernel) --- */
+	THAMES_MSG_PING_RESPONSE = 0x200,
+	THAMES_MSG_CONTEXT_OP_RESPONSE,
+	THAMES_MSG_BO_OP_RESPONSE,
+	THAMES_MSG_SUBMIT_JOB_RESPONSE,
+};
+
+/**
+ * @THAMES_CONTEXT_OP: Context operation types
+ */
+enum thames_context_op {
+	THAMES_CONTEXT_CREATE = 0,
+	THAMES_CONTEXT_DESTROY,
+};
+
+/**
+ * @THAMES_BO_OP: Buffer Object operation types
+ */
+enum thames_bo_op {
+	THAMES_BO_MAP = 0,
+	THAMES_BO_UNMAP,
+};
+
+/**
+ * @THAMES_RESP_STATUS: Response status codes
+ */
+enum thames_resp_status {
+	THAMES_RESP_SUCCESS = 0,
+	THAMES_RESP_ERR_GENERIC = 1,
+	THAMES_RESP_ERR_NOMEM = 2,
+	THAMES_RESP_ERR_INVAL = 3,
+	THAMES_RESP_ERR_NO_CTX = 4,
+	THAMES_RESP_ERR_MMU = 5,
+	THAMES_RESP_ERR_JOB_TIMEOUT = 6,
+};
+
+/**
+ * struct thames_msg_hdr - Common header for all RPMSG messages
+ * @type: Message type from enum thames_msg_type
+ * @seq:  Sequence number for request/response matching
+ * @len:  Total message length including header
+ */
+struct thames_msg_hdr {
+	__u32 type;
+	__u32 seq;
+	__u32 len;
+	__u32 reserved;
+};
+
+/*
+ * ===================================================================
+ * Host (Kernel) -> Remote (DSP) Messages
+ * ===================================================================
+ */
+
+/**
+ * struct thames_msg_ping - Ping message to test communication
+ * @hdr:        Common message header
+ * @ping_data:  Optional ping data (timestamp, sequence, etc.)
+ */
+struct thames_msg_ping {
+	struct thames_msg_hdr hdr;
+	__u32 ping_data;
+};
+
+/**
+ * struct thames_msg_context_op - Context create/destroy operations
+ * @hdr:           Common message header
+ * @op:            Operation type (CREATE/DESTROY)
+ * @context_id:    Context ID
+ */
+struct thames_msg_context_op {
+	struct thames_msg_hdr hdr;
+	uint32_t op; /* enum thames_context_op */
+	uint32_t context_id;
+};
+
+/**
+ * struct thames_msg_bo_op - Buffer Object map/unmap operations
+ * @hdr:        Common message header
+ * @op:         Operation type (MAP/UNMAP)
+ * @context_id: Context ID that this BO belongs to
+ * @bo_id:      Buffer Object ID for tracking
+ * @vaddr:      Virtual address where BO should be mapped on DSP
+ * @paddr:      Physical address of the BO
+ * @size:       Size of the BO in bytes
+ */
+struct thames_msg_bo_op {
+	struct thames_msg_hdr hdr;
+	uint32_t op; /* enum thames_bo_op */
+	uint32_t context_id;
+	uint32_t bo_id;
+	uint64_t vaddr;
+	uint64_t paddr;
+	uint64_t size;
+};
+
+/**
+ * struct thames_msg_submit_job - Submit job for execution
+ * @hdr:         Common message header
+ * @context_id:  Context to run job in
+ * @job_id:      Host-generated job tracking ID
+ * @kernel_iova: IOVA of kernel code BO (first byte = first instruction)
+ * @kernel_size: Size of kernel code in bytes
+ * @args_iova:   IOVA of arguments BO (array of uint64_t values)
+ * @args_size:   Size of arguments BO in bytes
+ */
+struct thames_msg_submit_job {
+	struct thames_msg_hdr hdr;
+	uint32_t context_id;
+	uint32_t job_id;
+	uint64_t kernel_iova;
+	uint64_t kernel_size;
+	uint64_t args_iova;
+	uint64_t args_size;
+};
+
+/*
+ * ===================================================================
+ * Remote (DSP) -> Host (Kernel) Messages
+ * ===================================================================
+ */
+
+/**
+ * struct thames_msg_response - Generic response to commands
+ * @hdr:    Common message header (seq matches request)
+ * @status: Status code from enum thames_resp_status
+ * @data:   Optional response data (context-dependent)
+ */
+struct thames_msg_response {
+	struct thames_msg_hdr hdr;
+	uint32_t status;
+	uint32_t data;
+};
+
+/*
+ * ===================================================================
+ * Buffer Size Calculations
+ * ===================================================================
+ */
+
+/* Calculate the maximum message size by finding the largest structure */
+#define THAMES_MSG_SIZE_PING sizeof(struct thames_msg_ping)
+#define THAMES_MSG_SIZE_CONTEXT_OP sizeof(struct thames_msg_context_op)
+#define THAMES_MSG_SIZE_BO_OP sizeof(struct thames_msg_bo_op)
+#define THAMES_MSG_SIZE_SUBMIT_JOB sizeof(struct thames_msg_submit_job)
+#define THAMES_MSG_SIZE_RESPONSE sizeof(struct thames_msg_response)
+
+/* Helper macros to find maximum of multiple values */
+#define THAMES_MAX2(a, b) ((a) > (b) ? (a) : (b))
+#define THAMES_MAX3(a, b, c) THAMES_MAX2(THAMES_MAX2(a, b), c)
+#define THAMES_MAX5(a, b, c, d, e) THAMES_MAX2(THAMES_MAX3(a, b, c), THAMES_MAX2(d, e))
+
+/* Maximum size of any Thames IPC message */
+#define THAMES_IPC_MAX_MSG_SIZE                                                              \
+	THAMES_MAX5(THAMES_MSG_SIZE_PING, THAMES_MSG_SIZE_CONTEXT_OP, THAMES_MSG_SIZE_BO_OP, \
+		    THAMES_MSG_SIZE_SUBMIT_JOB, THAMES_MSG_SIZE_RESPONSE)
+
+/* RPMSG buffer size - should accommodate largest message + some padding */
+#define THAMES_RPMSG_BUFFER_SIZE ((THAMES_IPC_MAX_MSG_SIZE + 15) & ~15) /* 16-byte aligned */
+
+/* Compile-time size checks - use BUILD_BUG_ON in kernel code */
+#ifdef __KERNEL__
+#define THAMES_ASSERT_MSG_SIZE(msg_type) BUILD_BUG_ON(sizeof(struct msg_type) > 64)
+#else
+#define THAMES_ASSERT_MSG_SIZE(msg_type) \
+	_Static_assert(sizeof(struct msg_type) <= 64, #msg_type " too large")
+#endif
+
+#endif /* _THAMES_IPC_H */
diff --git a/drivers/accel/thames/thames_rpmsg.c b/drivers/accel/thames/thames_rpmsg.c
new file mode 100644
index 0000000000000000000000000000000000000000..ebc34f49353e5e7959734da8e8a935573c130e79
--- /dev/null
+++ b/drivers/accel/thames/thames_rpmsg.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/completion.h>
+#include <linux/jiffies.h>
+#include <linux/rpmsg.h>
+
+#include "thames_rpmsg.h"
+#include "thames_core.h"
+#include "thames_device.h"
+#include "thames_ipc.h"
+
+#define THAMES_PING_TEST_PATTERN 0xDEADBEEF
+#define THAMES_PING_TIMEOUT_MS 5000
+
+static int thames_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int len, void *priv,
+				 u32 src)
+{
+	struct thames_msg_hdr *hdr = (struct thames_msg_hdr *)data;
+	struct thames_core *core = priv;
+
+	dev_dbg(&rpdev->dev, "Received response on core %d with length %d\n", core->index, len);
+
+	if (len < sizeof(struct thames_msg_hdr)) {
+		dev_err(&rpdev->dev, "Received message too short: %d bytes", len);
+		return -EINVAL;
+	}
+
+	switch (hdr->type) {
+	case THAMES_MSG_PING_RESPONSE: {
+		struct thames_msg_response *response = (struct thames_msg_response *)data;
+
+		dev_dbg(&rpdev->dev,
+			"Received PING response: status=%u, data=0x%x, expected_data=0x%x, seq=%u, expected_seq=%u\n",
+			response->status, response->data, core->rpmsg_ctx.ping_test.expected_data,
+			hdr->seq, core->rpmsg_ctx.ping_test.sequence);
+
+		if (hdr->seq != core->rpmsg_ctx.ping_test.sequence) {
+			dev_err(&rpdev->dev,
+				"PING response sequence mismatch: got %u, expected %u\n", hdr->seq,
+				core->rpmsg_ctx.ping_test.sequence);
+			ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+			return -EINVAL;
+		}
+
+		if (response->data != core->rpmsg_ctx.ping_test.expected_data) {
+			dev_err(&rpdev->dev,
+				"PING response data mismatch: got 0x%x, expected 0x%x\n",
+				response->data, core->rpmsg_ctx.ping_test.expected_data);
+			core->rpmsg_ctx.ping_test.success = false;
+			complete(&core->rpmsg_ctx.ping_test.completion);
+			ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+			return -EINVAL;
+		}
+
+		core->rpmsg_ctx.ping_test.success = (response->status == THAMES_RESP_SUCCESS);
+		complete(&core->rpmsg_ctx.ping_test.completion);
+
+		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+
+		break;
+	}
+
+	default:
+		dev_warn(&rpdev->dev, "Unknown message type: %u\n", hdr->type);
+		break;
+	}
+
+	return 0;
+}
+
+static int thames_rpmsg_send_raw(struct thames_core *core, const void *data, size_t len)
+{
+	if (!core->rpmsg_ctx.endpoint) {
+		dev_err(core->dev, "RPMSG endpoint not available");
+		return -ENODEV;
+	}
+
+	return rpmsg_send(core->rpmsg_ctx.endpoint, (void *)data, len);
+}
+
+int thames_rpmsg_init(struct thames_core *core)
+{
+	struct rpmsg_device *rpdev = core->rpdev;
+	struct rpmsg_channel_info chinfo = {};
+
+	strscpy(chinfo.name, rpdev->id.name, sizeof(chinfo.name));
+	chinfo.src = RPMSG_ADDR_ANY; /* Let rpmsg assign an address */
+	chinfo.dst = RPMSG_ADDR_ANY;
+
+	core->rpmsg_ctx.endpoint = rpmsg_create_ept(rpdev, thames_rpmsg_callback, core, chinfo);
+	if (!core->rpmsg_ctx.endpoint) {
+		dev_err(core->dev, "Failed to create RPMSG endpoint for core %d", core->index);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+void thames_rpmsg_fini(struct thames_core *core)
+{
+	if (core->rpmsg_ctx.endpoint) {
+		rpmsg_destroy_ept(core->rpmsg_ctx.endpoint);
+		core->rpmsg_ctx.endpoint = NULL;
+	}
+}
+
+int thames_rpmsg_send_ping(struct thames_core *core, u32 ping_data, u32 *sequence)
+{
+	struct thames_msg_ping ping_msg = {};
+
+	ping_msg.hdr.type = THAMES_MSG_PING;
+	ping_msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	ping_msg.hdr.len = sizeof(ping_msg);
+	ping_msg.hdr.reserved = 0;
+	ping_msg.ping_data = ping_data;
+
+	*sequence = ping_msg.hdr.seq;
+
+	return thames_rpmsg_send_raw(core, &ping_msg, sizeof(ping_msg));
+}
+
+int thames_rpmsg_ping_test(struct thames_core *core)
+{
+	const u32 test_data = THAMES_PING_TEST_PATTERN;
+	int ret;
+	unsigned long timeout;
+
+	core->rpmsg_ctx.ping_test.expected_data = test_data;
+	core->rpmsg_ctx.ping_test.success = false;
+	init_completion(&core->rpmsg_ctx.ping_test.completion);
+
+	ret = thames_rpmsg_send_ping(core, test_data, &core->rpmsg_ctx.ping_test.sequence);
+	if (ret) {
+		dev_err(core->dev, "Failed to send PING message to core %d: %d", core->index, ret);
+		return ret;
+	}
+
+	timeout = msecs_to_jiffies(THAMES_PING_TIMEOUT_MS);
+	ret = wait_for_completion_timeout(&core->rpmsg_ctx.ping_test.completion, timeout);
+	if (ret == 0) {
+		dev_err(core->dev, "PING test timed out - DSP core %d not responding", core->index);
+		return -ETIMEDOUT;
+	}
+
+	if (!core->rpmsg_ctx.ping_test.success) {
+		dev_err(core->dev, "PING test failed - incorrect PONG response from DSP core %d",
+			core->index);
+		return -EIO;
+	}
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_rpmsg.h b/drivers/accel/thames/thames_rpmsg.h
new file mode 100644
index 0000000000000000000000000000000000000000..6d5195453b8d3eac2c333b7ac03e469b2744fb78
--- /dev/null
+++ b/drivers/accel/thames/thames_rpmsg.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#ifndef __THAMES_RPMSG_H__
+#define __THAMES_RPMSG_H__
+
+#include <linux/completion.h>
+#include <linux/rpmsg.h>
+
+struct thames_core;
+
+int thames_rpmsg_init(struct thames_core *core);
+void thames_rpmsg_fini(struct thames_core *core);
+
+int thames_rpmsg_send_ping(struct thames_core *core, u32 ping_data, u32 *sequence);
+int thames_rpmsg_send_create_context(struct thames_core *core, u32 context_id);
+int thames_rpmsg_send_destroy_context(struct thames_core *core, u32 context_id);
+int thames_rpmsg_send_map_bo(struct thames_core *core, u32 context_id, u32 bo_id, u64 vaddr,
+			     u64 paddr, u64 size);
+int thames_rpmsg_send_unmap_bo(struct thames_core *core, u32 context_id, u32 bo_id);
+int thames_rpmsg_send_submit_job(struct thames_core *core, u32 context_id, u32 job_id,
+				 u64 kernel_iova, u64 kernel_size, u64 args_iova, u64 args_size,
+				 u32 *sequence);
+
+int thames_rpmsg_ping_test(struct thames_core *core);
+
+#endif /* __THAMES_RPMSG_H__ */

-- 
2.52.0

