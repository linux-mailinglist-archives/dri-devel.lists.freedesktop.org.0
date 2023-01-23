Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2F677B18
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C48810E488;
	Mon, 23 Jan 2023 12:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E4310E486
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:38:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id n7so10665601wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VXN5GkMQp7hu9CGhDS6OQxzJfUxb9ZcG/2PxTv2bgTk=;
 b=PRp+K8o/qTb7x4Y1T4vYADVymgsFKRTiEQUeIw441b4+7ksI/PO8lCH5nm/rIRROsn
 4iDMmlJJZNdtKrxH21SPVt6hGd52qj7s5OsiIVfSlWaUeOpvfxE4TU3jF5kUaDJ+QCTx
 bQJgw6nfDkGfN0OoxfEebu0UfsuBEFMbcnTwXKOtuClRamGYCZr34BG8Iq+FuWPnorcK
 HxURxh6w1av0zX2Ly+9wrUaVN5sp+1l5/rl0FNBqrV9zbWJSc1njgdpi+lTy9NDlIrq+
 aHFWcg9XG1+lAOOI1AivWVVwObRowL0aF72L3uePVBGdz+XMfNrRQ+KTbE97l1W5tm67
 VrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXN5GkMQp7hu9CGhDS6OQxzJfUxb9ZcG/2PxTv2bgTk=;
 b=LfbTkwwuL0929Y8Mub1gRbx/eLy1YBCWkBpebBwg7davuGobIqFe4gShmlX3VN0EWb
 4wDCdW2OaDlLBI6vUGUssUhFRAig66EuCMY8zWMsRJpxcMljXfICkRNbI2S7gr6BgxCi
 UkuivtT79VxcllwVhRF/J7YeQJBfoJxCzzr15KX//37VYeG6ZOF48XuvR88JV65wk78b
 YpElSBd6HpfiFZOv5VyiPgegmjsO52NoOnp21h53m3j66CCmtGHahqi+iwGKuYXwHw1/
 WgECtrSFCXoaO1PAYv6J9x6yH47aHdW/fexPKgxgRclnTPacXL0ndTtMf7Jz+gWAzn8i
 Fo7Q==
X-Gm-Message-State: AFqh2krNkeOLm+CiKEQt0x/nzmu3T/abfcUkQn7EN8K39MFP+8iUDohg
 DcjEUgUDR5E1SIxRoHFOSoo=
X-Google-Smtp-Source: AMrXdXvYyLMHWTRnrKqjQOgBOftzo1qbhvRaLIe14a7zX93YHo/yUYT9qtTwOY/d9I30A1VU7c/EMA==
X-Received: by 2002:a05:6000:a03:b0:2bd:e036:6b1a with SMTP id
 co3-20020a0560000a0300b002bde0366b1amr24265990wrb.64.1674477481885; 
 Mon, 23 Jan 2023 04:38:01 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a5d6e83000000b00289bdda07b7sm4284510wrz.92.2023.01.23.04.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:38:01 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
 lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
 jstultz@google.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Subject: [PATCH 1/2] dma-heap: add device link and unlink functions
Date: Mon, 23 Jan 2023 13:37:55 +0100
Message-Id: <20230123123756.401692-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123123756.401692-1-christian.koenig@amd.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This allows device drivers to specify a DMA-heap where they want their
buffers to be allocated from. This information is then exposed as
sysfs link between the device and the DMA-heap.

Useful for userspace when in need to decide from which provider to
allocate a buffer.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-heap.c | 41 ++++++++++++++++++++++++++++++--------
 include/linux/dma-heap.h   | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index c9e41e8a9e27..0f7cf713c22f 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -31,6 +31,7 @@
  * @heap_devt		heap device node
  * @list		list head connecting to list of heaps
  * @heap_cdev		heap char device
+ * @dev:		heap device in sysfs
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -41,6 +42,7 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+	struct device *dev;
 };
 
 static LIST_HEAD(heap_list);
@@ -49,6 +51,33 @@ static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
+int dma_heap_create_device_link(struct device *dev, const char *heap)
+{
+	struct dma_heap *h;
+
+	/* check the name is valid */
+	mutex_lock(&heap_list_lock);
+	list_for_each_entry(h, &heap_list, list) {
+		if (!strcmp(h->name, heap))
+			break;
+	}
+	mutex_unlock(&heap_list_lock);
+
+	if (list_entry_is_head(h, &heap_list, list)) {
+		pr_err("dma_heap: Link to invalid heap requested %s\n", heap);
+		return -EINVAL;
+	}
+
+	return sysfs_create_link(&dev->kobj, &h->dev->kobj, DEVNAME);
+}
+EXPORT_SYMBOL(dma_heap_create_device_link);
+
+void dma_heap_remove_device_link(struct device *dev)
+{
+	sysfs_remove_link(&dev->kobj, DEVNAME);
+}
+EXPORT_SYMBOL(dma_heap_remove_device_link);
+
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 unsigned int fd_flags,
 				 unsigned int heap_flags)
@@ -219,7 +248,6 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
-	struct device *dev_ret;
 	unsigned int minor;
 	int ret;
 
@@ -261,14 +289,11 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		goto err1;
 	}
 
-	dev_ret = device_create(dma_heap_class,
-				NULL,
-				heap->heap_devt,
-				NULL,
-				heap->name);
-	if (IS_ERR(dev_ret)) {
+	heap->dev = device_create(dma_heap_class, NULL, heap->heap_devt, NULL,
+				  heap->name);
+	if (IS_ERR(heap->dev)) {
 		pr_err("dma_heap: Unable to create device\n");
-		err_ret = ERR_CAST(dev_ret);
+		err_ret = ERR_CAST(heap->dev);
 		goto err2;
 	}
 
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..097076766496 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -65,4 +65,39 @@ const char *dma_heap_get_name(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+#ifdef CONFIG_DMABUF_HEAPS
+
+/**
+ * dma_heap_create_device_link() - add link between device and heap
+ * @dev: the device which should be linked to a heap
+ * @heap: name of the heap to link to
+ *
+ * Add a sysfs link between a device and a DMA-heap. This link can then be used
+ * by userspace to figure out from which DMA-heap a device wants it's buffers
+ * to be allocated.
+ */
+int dma_heap_create_device_link(struct device *dev, const char *heap);
+
+/**
+ * dma_heap_remove_device_link() - remove link between device and heap
+ * @dev: the device which should be unlinked
+ *
+ * Removes the sysfs link between the device and it's DMA-heap again when a
+ * driver is unloaded.
+ */
+void dma_heap_remove_device_link(struct device *dev);
+
+#else
+
+int dma_heap_create_device_link(struct device *dev, const char *heap)
+{
+	return 0;
+}
+
+void dma_heap_remove_device_link(struct device *dev)
+{
+}
+
+#endif
+
 #endif /* _DMA_HEAPS_H */
-- 
2.34.1

