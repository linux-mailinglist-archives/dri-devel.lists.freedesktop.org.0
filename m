Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B73DAF8CCB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8C210E989;
	Fri,  4 Jul 2025 08:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5454F10E939
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 07:21:14 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4bYQ6G5CWRzCh0h
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 15:21:10 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4bYQ6D34TmzBRHKN
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 15:21:08 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bYQ644Mftz8R044;
 Fri,  4 Jul 2025 15:21:00 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
 by mse-fl1.zte.com.cn with SMTP id 5647KiW8090359;
 Fri, 4 Jul 2025 15:20:44 +0800 (+08)
 (envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Fri, 4 Jul 2025 15:20:47 +0800 (CST)
Date: Fri, 4 Jul 2025 15:20:47 +0800 (CST)
X-Zmail-TransId: 2af9686780cf5ce-2beb8
X-Mailer: Zmail v1.0
Message-ID: <20250704152047205U11FdEih1MxrmcmAz0Xpp@zte.com.cn>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>
Cc: <mst@redhat.com>, <eperezma@redhat.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSB2aXJ0aW86IEFkZCBtaXNzaW5nIGtlcm5lbGRvYyBmb3IgdmlydGlvX2RtYV9idWZfYXR0YWNo?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 5647KiW8090359
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 686780E5.000/4bYQ6G5CWRzCh0h
X-Mailman-Approved-At: Fri, 04 Jul 2025 08:53:39 +0000
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

Add kerneldoc for 'virtio_dma_buf_attach' function to fix W=1 warnings:

drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' not described in 'virtio_dma_buf_attach'
drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' not described in 'virtio_dma_buf_attach'

Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
---
 drivers/virtio/virtio_dma_buf.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
index 3fe1d03b0645..18d261ba5197 100644
--- a/drivers/virtio/virtio_dma_buf.c
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -35,7 +35,16 @@ struct dma_buf *virtio_dma_buf_export
 EXPORT_SYMBOL(virtio_dma_buf_export);

 /**
- * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
+ * virtio_dma_buf_attach - Mandatory attach callback for virtio dma-bufs
+ * @dma_buf: Pointer to the shared dma-buf structure
+ * @attach: Pointer to the newly created attachment metadata
+ *
+ * Description: Implements the standard dma-buf attach operation for virtio devices.
+ *              Retrieves virtio-specific operations through container_of macro,
+ *              then invokes device-specific attach callback if present.
+ *              This enables virtio devices to participate in dma-buf sharing.
+ *
+ * Return: 0 on success, error code on failure
  */
 int virtio_dma_buf_attach(struct dma_buf *dma_buf,
                          struct dma_buf_attachment *attach)
-- 
2.25.1
