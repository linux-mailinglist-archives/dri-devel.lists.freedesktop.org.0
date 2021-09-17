Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165844104BC
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 09:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B566E0E5;
	Sat, 18 Sep 2021 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3B86EC7C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:58:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so9886940wmd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5OvK6rAM51FXadQ9HCCAo1nDCyjKMMChivM3w7j7uc=;
 b=eGbAxd0RK5cxQWiBRoDzRjyFcyMn7M/eBSrwbZMorRDrBHyNh4tqr35S8hZL1zQklf
 RBiPTeB08MrRxL0kav7kVnBYC3mvabfvI50ICHvrgiqYvzsX/4onFFutFzvjeFkCVdQ/
 bVgUFe6XzFBkePmRam+R2PSqjEnY479IeT5wuX4i7pF177s7lzDdWvdm5igsQEoKSM1f
 S4f7zns2RaZg65Lmn7EyKCY2aKpI4tD0Mq83PlI9Gf7ke9lJp8JalDULeU/ctPjGweOR
 /H5SXb9HXeusY/cT0l2DURVOcyUTmg6ggcaQ4N8iw5rDeLFJm7NE699FYbhO/1WEHEEI
 bZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5OvK6rAM51FXadQ9HCCAo1nDCyjKMMChivM3w7j7uc=;
 b=WB3flBx2YD28UXbLCgeYcoNsWPppjRTCI+inFw7rvgYdQ9/eYZGuEs5M7EgBFuFU0J
 +IyFGSKlbSiKfGqp1QlragqfsU/1L+mhOSp3B4t0u9NULZAnp7ElRYWqQLtZp3OGRaKg
 8bnpZoKsWfTV6uuOho6hT5YoEoCI0Ve/qPzIRd3ANYXYcib7IRRTkkdUXP8gfF730hZb
 P2u2NhblONld+0q6EugDffFCbupy3T3UCufvr678iy1Pqm7Unouu1qrdAoCXDtz7B1Fa
 T6UkN/V2zVceK6JLcKI8wRznwJLlLg3w8FeFTFN7rPN1UF/wZZHTP/S5GNTArqUUt1wa
 F+LA==
X-Gm-Message-State: AOAM532CV1wEbSWp9Y3ROQuI3umfVSjAxVBKstrzDrYtA+j+aDwUvbzk
 X+0xGoVYUxHKAuQY3Fve9XrveQ==
X-Google-Smtp-Source: ABdhPJwiH/6gX7ZX2P33uYpMlaxknnvLf6Knho3tfcfF2fd3161qyj87sKWlfvIfg6IfLTt4G9AEdg==
X-Received: by 2002:a05:600c:3392:: with SMTP id
 o18mr14906465wmp.92.1631883479342; 
 Fri, 17 Sep 2021 05:57:59 -0700 (PDT)
Received: from localhost.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:57:58 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, gpain@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 3/4] rpmsg: Add support of AI Processor Unit (APU)
Date: Fri, 17 Sep 2021 14:59:44 +0200
Message-Id: <20210917125945.620097-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917125945.620097-1-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 18 Sep 2021 07:25:35 +0000
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

Some Mediatek SoC provides hardware accelerator for AI / ML.
This driver use the DRM driver to manage the shared memory,
and use rpmsg to execute jobs on the APU.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/rpmsg/Kconfig     |  10 +++
 drivers/rpmsg/Makefile    |   1 +
 drivers/rpmsg/apu_rpmsg.c | 184 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/rpmsg/apu_rpmsg.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0b4407abdf138..fc1668f795004 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -73,4 +73,14 @@ config RPMSG_VIRTIO
 	select RPMSG_NS
 	select VIRTIO
 
+config RPMSG_APU
+	tristate "APU RPMSG driver"
+	select REMOTEPROC
+	select RPMSG_VIRTIO
+	select DRM_APU
+	help
+	  This provides a RPMSG driver that provides some facilities to
+	  communicate with an accelerated processing unit (APU).
+	  This Uses the APU DRM driver to manage memory and job scheduling.
+
 endmenu
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee3..8b336b9a817c1 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
 obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
 obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
+obj-$(CONFIG_RPMSG_APU)		+= apu_rpmsg.o
diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
new file mode 100644
index 0000000000000..7e504bd176a4d
--- /dev/null
+++ b/drivers/rpmsg/apu_rpmsg.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2020 BayLibre SAS
+
+#include <asm/cacheflush.h>
+
+#include <linux/cdev.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/iova.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <drm/apu_drm.h>
+
+#include "rpmsg_internal.h"
+
+#define APU_RPMSG_SERVICE_MT8183 "rpmsg-mt8183-apu0"
+
+struct rpmsg_apu {
+	struct apu_core *core;
+	struct rpmsg_device *rpdev;
+};
+
+static int apu_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int count,
+			      void *priv, u32 addr)
+{
+	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
+	struct apu_core *apu_core = apu->core;
+
+	return apu_drm_callback(apu_core, data, count);
+}
+
+static int apu_rpmsg_send(struct apu_core *apu_core, void *data, int len)
+{
+	struct rpmsg_apu *apu = apu_drm_priv(apu_core);
+	struct rpmsg_device *rpdev = apu->rpdev;
+
+	return rpmsg_send(rpdev->ept, data, len);
+}
+
+static struct apu_drm_ops apu_rpmsg_ops = {
+	.send = apu_rpmsg_send,
+};
+
+static int apu_init_iovad(struct rproc *rproc, struct rpmsg_apu *apu)
+{
+	struct resource_table *table;
+	struct fw_rsc_carveout *rsc;
+	int i;
+
+	if (!rproc->table_ptr) {
+		dev_err(&apu->rpdev->dev,
+			"No resource_table: has the firmware been loaded ?\n");
+		return -ENODEV;
+	}
+
+	table = rproc->table_ptr;
+	for (i = 0; i < table->num; i++) {
+		int offset = table->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table + offset;
+
+		if (hdr->type != RSC_CARVEOUT)
+			continue;
+
+		rsc = (void *)hdr + sizeof(*hdr);
+		if (apu_drm_reserve_iova(apu->core, rsc->da, rsc->len)) {
+			dev_err(&apu->rpdev->dev,
+				"failed to reserve iova\n");
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static struct rproc *apu_get_rproc(struct rpmsg_device *rpdev)
+{
+	/*
+	 * To work, the APU RPMsg driver need to get the rproc device.
+	 * Currently, we only use virtio so we could use that to find the
+	 * remoteproc parent.
+	 */
+	if (!rpdev->dev.parent && rpdev->dev.parent->bus) {
+		dev_err(&rpdev->dev, "invalid rpmsg device\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (strcmp(rpdev->dev.parent->bus->name, "virtio")) {
+		dev_err(&rpdev->dev, "unsupported bus\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return vdev_to_rproc(dev_to_virtio(rpdev->dev.parent));
+}
+
+static int apu_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_apu *apu;
+	struct rproc *rproc;
+	int ret;
+
+	apu = devm_kzalloc(&rpdev->dev, sizeof(*apu), GFP_KERNEL);
+	if (!apu)
+		return -ENOMEM;
+	apu->rpdev = rpdev;
+
+	rproc = apu_get_rproc(rpdev);
+	if (IS_ERR_OR_NULL(rproc))
+		return PTR_ERR(rproc);
+
+	/* Make device dma capable by inheriting from parent's capabilities */
+	set_dma_ops(&rpdev->dev, get_dma_ops(rproc->dev.parent));
+
+	ret = dma_coerce_mask_and_coherent(&rpdev->dev,
+					   dma_get_mask(rproc->dev.parent));
+	if (ret)
+		goto err_put_device;
+
+	rpdev->dev.iommu_group = rproc->dev.parent->iommu_group;
+
+	apu->core = apu_drm_register_core(rproc, &apu_rpmsg_ops, apu);
+	if (!apu->core) {
+		ret = -ENODEV;
+		goto err_put_device;
+	}
+
+	ret = apu_init_iovad(rproc, apu);
+
+	dev_set_drvdata(&rpdev->dev, apu);
+
+	return ret;
+
+err_put_device:
+	devm_kfree(&rpdev->dev, apu);
+
+	return ret;
+}
+
+static void apu_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
+
+	apu_drm_unregister_core(apu);
+	devm_kfree(&rpdev->dev, apu);
+}
+
+static const struct rpmsg_device_id apu_rpmsg_match[] = {
+	{ APU_RPMSG_SERVICE_MT8183 },
+	{}
+};
+
+static struct rpmsg_driver apu_rpmsg_driver = {
+	.probe = apu_rpmsg_probe,
+	.remove = apu_rpmsg_remove,
+	.callback = apu_rpmsg_callback,
+	.id_table = apu_rpmsg_match,
+	.drv  = {
+		.name  = "apu_rpmsg",
+	},
+};
+
+static int __init apu_rpmsg_init(void)
+{
+	return register_rpmsg_driver(&apu_rpmsg_driver);
+}
+arch_initcall(apu_rpmsg_init);
+
+static void __exit apu_rpmsg_exit(void)
+{
+	unregister_rpmsg_driver(&apu_rpmsg_driver);
+}
+module_exit(apu_rpmsg_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("APU RPMSG driver");
-- 
2.31.1

