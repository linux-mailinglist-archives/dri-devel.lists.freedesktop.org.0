Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B83516BC96
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B446EA51;
	Tue, 25 Feb 2020 08:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1AC898FD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:02:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 185so6129676pfv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 15:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=yMIBpGCQZFSounLwDGFCMn/mc7tP53hqzjjD1MIQEBY=;
 b=OnQWqDJqowRRF9IEu4EQyeSn0H6mibUZmII0oDrW5WYeGF3QNOrmSsYast9OntgneO
 801MKU2nsaCiH8DZ/qet7n7WdKjhNY8wq9WBkszpgc/EDPZUGghQOL8HuI+Hcwe6Extr
 AyoDsgz0Vjh49/CFrnZkC/sH6qARczTmacyh4qc+JxZoAahq0xzcwmoAP3X3oszfRKuq
 PFRI9bcK/AXjYA6OmyWhGKsYX7TV7Y27aVgO6J4jhEhxfMtTUgDeJzTJP0xwXOvfhHei
 oJtUKaqA7Hn/+xv7Uy/ORX1nH9vrlrp5y5156b1m2S7QyFyShRr0oMZkhYDyozT6jmTR
 O/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=yMIBpGCQZFSounLwDGFCMn/mc7tP53hqzjjD1MIQEBY=;
 b=R6K8rS6xx2NVQZO3lLT+hDVOAwRYbXwCYVjmpLBXbMLWmaLAF7Wgy/1Cb12sBNtjmc
 5JGR8Hoq4G8BVaNeeNeMRnbYpDghgKPbgfxOv0KCN7u4WVv6bCyT9hk1Q+aMwcA/doth
 nSLFtZjZR5UaX1NNlwRE+HoVgamvvu2dHkyVxCghw6mPgooNCpms3CUxBYj6HiH455kf
 0ieitsuQsP1q5OI/RtHclEEQvTLRaVzdNi3eMZ/AOo9IvRnEWTn2GEv/M8vImqAZxt2T
 VgVUfFPm5tHmi1D68eNmHJ6DKg3ijJMxXCDcZX1h6Wqxi2OmyZVjt1ZetdZILcpKZbFt
 jnVw==
X-Gm-Message-State: APjAAAULXYAbMYxgbVRRYeVKc+A8b0CFY0IEDl8/gABtChG5I+CoE3jl
 8zTL8FvDDBPdfGA+iVb0Lt0=
X-Google-Smtp-Source: APXvYqzuqw+AV+yPN4hMHC48zivrF5Er5ZizhTdY1E/VSZobhOps0F2PfJiT9sEYRfXnXf7EXRdb+Q==
X-Received: by 2002:a63:3f4f:: with SMTP id m76mr53244097pga.353.1582585325634; 
 Mon, 24 Feb 2020 15:02:05 -0800 (PST)
Received: from paxos.mtv.corp.google.com
 ([2620:15c:202:201:31a4:f84f:da5f:97b4])
 by smtp.gmail.com with ESMTPSA id g13sm13824075pgh.82.2020.02.24.15.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 15:02:04 -0800 (PST)
From: Lepton Wu <ytht.net@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] RFC: drm/virtio: Dummy virtio GPU
Date: Mon, 24 Feb 2020 15:01:55 -0800
Message-Id: <20200224230155.120894-2-ytht.net@gmail.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200224230155.120894-1-ytht.net@gmail.com>
References: <20200224230155.120894-1-ytht.net@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Reply-To: Lepton Wu <ytht.net@gmail.com>
Cc: Lepton Wu <ytht.net@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The idea here is: if we run the vm headless, we don't really need to
communicate with VMM, and we even don't need any VMM support
for virtio-gpu. Of course, only 2d works. But it's enough for some
use case. And this looks simpler than vkms.

Signed-off-by: Lepton Wu <ytht.net@gmail.com>
---
 drivers/gpu/drm/virtio/Kconfig         |   9 ++
 drivers/gpu/drm/virtio/Makefile        |   3 +
 drivers/gpu/drm/virtio/virtgpu_dummy.c | 161 +++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_dummy.c

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index eff3047052d4..9c18aace38ed 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -9,3 +9,12 @@ config DRM_VIRTIO_GPU
 	   QEMU based VMMs (like KVM or Xen).
 
 	   If unsure say M.
+
+config DRM_VIRTIO_GPU_DUMMY
+	tristate "Virtio dummy GPU driver"
+	depends on DRM_VIRTIO_GPU
+	help
+	   This add a new virtio GPU device which handles the virtio ring buffers
+	   inline so it doesn't rely on VMM to provide the virtio GPU device.
+	   Currently it only handle VIRTIO_GPU_CMD_GET_DISPLAY_INFO which is enough
+	   for a dummy 2D VGA device.
diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index 92aa2b3d349d..26d8fee1bc41 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -8,4 +8,7 @@ virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
 	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
 
+virtio-gpu-dummy-y := virtgpu_dummy.o
+
 obj-$(CONFIG_DRM_VIRTIO_GPU) += virtio-gpu.o
+obj-$(CONFIG_DRM_VIRTIO_GPU_DUMMY) += virtio-gpu-dummy.o
diff --git a/drivers/gpu/drm/virtio/virtgpu_dummy.c b/drivers/gpu/drm/virtio/virtgpu_dummy.c
new file mode 100644
index 000000000000..8c2eb6fea47c
--- /dev/null
+++ b/drivers/gpu/drm/virtio/virtgpu_dummy.c
@@ -0,0 +1,161 @@
+#include <linux/module.h>
+#include <linux/virtio.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ring.h>
+#include <linux/virtio_gpu.h>
+
+#include "virtgpu_drv.h"
+
+static int virtgpu_dummy_width = 1024;
+static int virtgpu_dummy_height = 768;
+
+MODULE_PARM_DESC(width, "Dummy VGA width");
+module_param_named(width, virtgpu_dummy_width, int, 0400);
+MODULE_PARM_DESC(height, "Dummy VGA height");
+module_param_named(height, virtgpu_dummy_height, int, 0400);
+
+static struct bus_type dummy_bus = {
+	.name = "",
+};
+
+static struct dummy_gpu {
+	struct device *root;
+	struct virtio_device vdev;
+	unsigned char status;
+} dummy;
+
+static u64 dummy_get_features(struct virtio_device *vdev)
+{
+	return 1ULL << VIRTIO_F_VERSION_1;
+}
+
+static int dummy_finalize_features(struct virtio_device *vdev)
+{
+	return 0;
+}
+
+static void dummy_get(struct virtio_device *vdev, unsigned int offset,
+		      void *buf, unsigned len)
+{
+	static struct virtio_gpu_config config = {
+		.num_scanouts = 1,
+	};
+	BUG_ON(offset + len > sizeof(config));
+	memcpy(buf, (char *)&config + offset, len);
+}
+
+static u8 dummy_get_status(struct virtio_device *vdev)
+{
+	struct dummy_gpu*  gpu = container_of(vdev, struct dummy_gpu, vdev);
+	return gpu->status;
+}
+
+static void dummy_set_status(struct virtio_device *vdev, u8 status)
+{
+	struct dummy_gpu*  gpu = container_of(vdev, struct dummy_gpu, vdev);
+	BUG_ON(!status);
+	gpu->status = status;
+}
+
+void process_cmd(struct vring_desc *desc, int idx)
+{
+	// FIXME, use chain to get resp buffer addr
+	char *buf = __va(desc[idx].addr);
+	struct virtio_gpu_vbuffer *vbuf =
+	    (struct virtio_gpu_vbuffer *)(buf - sizeof(*vbuf));
+	struct virtio_gpu_ctrl_hdr *cmd_p = (struct virtio_gpu_ctrl_hdr *)buf;
+	struct virtio_gpu_resp_display_info *resp;
+	BUG_ON(vbuf->buf != buf);
+	if (cmd_p->type != cpu_to_le32(VIRTIO_GPU_CMD_GET_DISPLAY_INFO))
+		return;
+	BUG_ON(vbuf->resp_size != sizeof(struct virtio_gpu_resp_display_info));
+	resp = (struct virtio_gpu_resp_display_info *)vbuf->resp_buf;
+	resp->pmodes[0].r.width = virtgpu_dummy_width;
+	resp->pmodes[0].r.height = virtgpu_dummy_height;
+	resp->pmodes[0].enabled = 1;
+}
+
+static bool dummy_notify(struct virtqueue *vq)
+{
+	struct vring *r = (struct vring *)(vq + 1);
+	int used, avail;
+	// FIXME, handle multiple avail and also fix for big endian.
+	used = r->used->idx & (r->num - 1);
+	avail = (r->avail->idx - 1) & (r->num - 1);
+	r->used->ring[used].id = r->avail->ring[avail];
+	r->used->idx++;
+	if (!strcmp(vq->name, "control"))
+		process_cmd(r->desc, r->avail->ring[avail]);
+	vq->callback(vq);
+	return true;
+}
+
+static int dummy_find_vqs(struct virtio_device *vdev, unsigned nvqs,
+			  struct virtqueue *vqs[],
+			  vq_callback_t * callbacks[],
+			  const char *const names[],
+			  const bool *ctx, struct irq_affinity *desc)
+{
+	int i, j;
+	for (i = 0; i < nvqs; ++i) {
+		vqs[i] = vring_create_virtqueue(i, 256, SMP_CACHE_BYTES, vdev,
+						true, false, false,
+						dummy_notify, callbacks[i],
+						names[i]);
+		if (!vqs[i])
+			goto err;
+	}
+	return 0;
+err:
+	for (j = 0; j < i; ++j) {
+		vring_del_virtqueue(vqs[j]);
+		vqs[j] = NULL;
+	}
+	return -ENOMEM;
+}
+
+static void dummy_reset(struct virtio_device *vdev)
+{
+}
+
+static const struct virtio_config_ops dummy_vq_ops = {
+	.get_features = dummy_get_features,
+	.finalize_features = dummy_finalize_features,
+	.get = dummy_get,
+	.get_status = dummy_get_status,
+	.set_status = dummy_set_status,
+	.reset = dummy_reset,
+	.find_vqs = dummy_find_vqs,
+};
+
+static int __init virtio_gpu_dummy_init(void)
+{
+	int ret;
+	struct device * root = root_device_register("dummy");
+	if (PTR_ERR_OR_ZERO(root))
+		return PTR_ERR(root);
+	root->bus = &dummy_bus;
+	dummy.vdev.dev.parent = root;
+	dummy.vdev.id.device = VIRTIO_ID_GPU;
+	dummy.vdev.config = &dummy_vq_ops;
+	ret = register_virtio_device(&dummy.vdev);
+	if (ret) {
+		pr_err("Failed to register virtio device %d", ret);
+		root_device_unregister(root);
+		return ret;
+	}
+	dummy.root = root;
+	return 0;
+}
+
+static void virtio_gpu_dummy_exit(void)
+{
+	if (!dummy.root)
+		return;
+	unregister_virtio_device(&dummy.vdev);
+	root_device_unregister(dummy.root);
+}
+
+module_init(virtio_gpu_dummy_init);
+module_exit(virtio_gpu_dummy_exit);
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
