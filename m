Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D207AFA03D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 15:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2757A10E381;
	Sat,  5 Jul 2025 13:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2589 seconds by postgrey-1.36 at gabe;
 Sat, 05 Jul 2025 02:58:10 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F61C10E15E
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:58:10 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4bYwDF6VDQz4xPS0;
 Sat,  5 Jul 2025 10:58:05 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 5652w1Rf039931;
 Sat, 5 Jul 2025 10:58:01 +0800 (+08)
 (envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid31;
 Sat, 5 Jul 2025 10:58:03 +0800 (CST)
Date: Sat, 5 Jul 2025 10:58:03 +0800 (CST)
X-Zmail-TransId: 2afc686894bb614-86aa7
X-Mailer: Zmail v1.0
Message-ID: <20250705105803198ff11jYCkg1TxntcCEb00R@zte.com.cn>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jasowang@redhat.com>, <krzk@kernel.org>
Cc: <mst@redhat.com>, <xuanzhuo@linux.alibaba.com>, <eperezma@redhat.com>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyXSB2aXJ0aW86IFVwZGF0ZSBrZXJuZWxkb2MgaW4gZHJpdmVycy92aXJ0aW8vdmlydGlvX2RtYV9idWYuYw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 5652w1Rf039931
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 686894BD.000/4bYwDF6VDQz4xPS0
X-Mailman-Approved-At: Sat, 05 Jul 2025 13:21:33 +0000
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

From: Peng Jiang <jiang.peng9@zte.com.cn>

Fix kernel-doc descriptions in virtio_dma_buf.c to fix W=1 warnings:

drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' not described in 'virtio_dma_buf_attach'
drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' not described in 'virtio_dma_buf_attach'

Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
---
 drivers/virtio/virtio_dma_buf.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
index 3fe1d03b0645..0b39b1b209ee 100644
--- a/drivers/virtio/virtio_dma_buf.c
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -9,13 +9,20 @@
 #include <linux/virtio_dma_buf.h>

 /**
- * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
+ * virtio_dma_buf_export() - Creates a new dma-buf for a virtio exported object
  * @exp_info: [in] see dma_buf_export(). ops MUST refer to a dma_buf_ops
  *     struct embedded in a virtio_dma_buf_ops.
  *
  * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
  * for an virtio exported object that can be queried by other virtio drivers
  * for the object's UUID.
+ *
+ * Returns:
+ *   - Valid struct dma_buf pointer on success
+ *   - ERR_PTR(-EINVAL) if:
+ *     - exp_info->ops is NULL
+ *     - attach callback isn't virtio_dma_buf_attach()
+ *     - virtio_ops->get_uuid() is not implemented
  */
 struct dma_buf *virtio_dma_buf_export
        (const struct dma_buf_export_info *exp_info)
@@ -35,7 +42,16 @@ struct dma_buf *virtio_dma_buf_export
 EXPORT_SYMBOL(virtio_dma_buf_export);

 /**
- * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
+ * virtio_dma_buf_attach() - Mandatory attach callback for virtio dma-bufs
+ * @dma_buf: Pointer to the shared dma-buf structure
+ * @attach: Pointer to the newly created attachment metadata
+ *
+ * Implements the standard dma-buf attach operation for virtio devices.
+ * Retrieves virtio-specific operations through container_of macro,
+ * then invokes device-specific attach callback if present.
+ * This enables virtio devices to participate in dma-buf sharing.
+ *
+ * Return: 0 on success, error code on failure
  */
 int virtio_dma_buf_attach(struct dma_buf *dma_buf,
                          struct dma_buf_attachment *attach)
@@ -55,8 +71,12 @@ int virtio_dma_buf_attach(struct dma_buf *dma_buf,
 EXPORT_SYMBOL(virtio_dma_buf_attach);

 /**
- * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
- * @dma_buf: buffer to query
+ * is_virtio_dma_buf() - Check if a dma-buf was created by virtio DMA framework
+ * @dma_buf: [in] buffer to query
+ *
+ * Returns:
+ *   - true  if the dma-buf uses virtio_dma_buf_attach() as its attach callback
+ *   - false otherwise
  */
 bool is_virtio_dma_buf(struct dma_buf *dma_buf)
 {
@@ -65,7 +85,7 @@ bool is_virtio_dma_buf(struct dma_buf *dma_buf)
 EXPORT_SYMBOL(is_virtio_dma_buf);

 /**
- * virtio_dma_buf_get_uuid - gets a virtio dma-buf's exported object's uuid
+ * virtio_dma_buf_get_uuid() - gets a virtio dma-buf's exported object's uuid
  * @dma_buf: [in] buffer to query
  * @uuid: [out] the uuid
  *
-- 
2.25.1
