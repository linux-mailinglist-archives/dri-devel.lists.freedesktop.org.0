Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98393ABD05
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEA56E9AA;
	Thu, 17 Jun 2021 19:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A976E9AA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:43:04 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id h16so4401579pjv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 12:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EmNWEiFZswyh9np0n10pkURO9xsudg2vD0SlqJOygw=;
 b=D4/yp2FVj3zwopNKCn9NGRcz89YLdykjk9uMu1b91JmmWaX8acJYD86yug53UUNUYn
 G3IRi0pNwoHW2hBS2VgKrsM/GoePnj/ZQ1rWmGuZVXrg4ETYbK8wQr4+T3h8bJ8jxGR3
 bJNOtrXFF3uG+RvYnp+2dwbdmnW3N8Gv2pUMF7CEJ5t6Enb3LflLntpDcBc8nHoq6znC
 nPYGwC4+FLUIRp4l6HKj9MZjzrDuxfFlndG+pQtwo47gjgiNZpfMaIxvId0sF/oz8IZa
 il2BTASMsyPb74qXl0vWI62cY55j+uWe/elSz4okj/rqaiqKmEawW4KZkPMteW52azkQ
 FUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EmNWEiFZswyh9np0n10pkURO9xsudg2vD0SlqJOygw=;
 b=bDgv1AP7V6Ag3Iug+ls62ndQ2zaMyMATGz7Ycj4wteyBfg/ufE33r4O0DBXWuFhu+L
 xQvuHbs7zSqR5P0JgMeDzG9hwBbMP5LH+kACxPfwFE/LGUrSy3IRNXarlcXr3VeN9oO7
 ogZXKqt6amP7KvMDwf/99Vq8om3Fuasc/d2yxqOXa+fkoEye7pg2F59NVOyA5R17SA3d
 ZKPWivtBpo3qk8irR/2SmUi5NbBqUZzVbi0jcg0HT0YF3/qgoE4+4y5BafVV3gkMQXYw
 58jtyknlbxvU0Fo1okDFE6c+8kfFcNWDyYTUY5Q2MCdjpaEM/ehs+LbcgZsqDqasFauT
 LX1w==
X-Gm-Message-State: AOAM532QK2TSZ46l+73cTxlNa189nfec3n/24gbKcGqUeHTAUWpQ6tPA
 ah+iRYw8tUl/xTmUYuSHFrwPAKSDZxs7SA==
X-Google-Smtp-Source: ABdhPJxfcUh5h7UPiTm75MqhhJzH9COhYNPAOsT2vI2gSkCU7iaer4DZ2s2Eu4KGmTt2nizYReypAw==
X-Received: by 2002:a17:90b:19cd:: with SMTP id
 nm13mr18517949pjb.226.1623958983410; 
 Thu, 17 Jun 2021 12:43:03 -0700 (PDT)
Received: from omlet.lan (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id n23sm6142921pgv.76.2021.06.17.12.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:43:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Document DMA_BUF_IOCTL_SYNC (v3)
Date: Thu, 17 Jun 2021 14:42:58 -0500
Message-Id: <20210617194258.579011-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a new "DMA Buffer ioctls" section to the dma-buf docs and adds
documentation for DMA_BUF_IOCTL_SYNC.

v2 (Daniel Vetter):
 - Fix a couple typos
 - Add commentary about synchronization with other devices
 - Use item list format for describing flags

v3 (Pekka Paalanen):
 - Clarify stalling requirements.
 - Be more clear that that DMA_BUF_IOCTL_SYNC with SINC_END has to be
   called before more GPU work happens.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
---
 Documentation/driver-api/dma-buf.rst |  8 +++++
 include/uapi/linux/dma-buf.h         | 50 +++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 7f21425d9435a..0d4c13ec1a800 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -88,6 +88,9 @@ consider though:
 - The DMA buffer FD is also pollable, see `Implicit Fence Poll Support`_ below for
   details.
 
+- The DMA buffer FD also supports a few dma-buf-specific ioctls, see
+  `DMA Buffer ioctls`_ below for details.
+
 Basic Operation and Device DMA Access
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -106,6 +109,11 @@ Implicit Fence Poll Support
 .. kernel-doc:: drivers/dma-buf/dma-buf.c
    :doc: implicit fence polling
 
+DMA Buffer ioctls
+~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/uapi/linux/dma-buf.h
+
 Kernel Functions and Structures Reference
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 7f30393b92c3b..8e4a2ca0bcbf7 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -22,8 +22,56 @@
 
 #include <linux/types.h>
 
-/* begin/end dma-buf functions used for userspace mmap. */
+/**
+ * struct dma_buf_sync - Synchronize with CPU access.
+ *
+ * When a DMA buffer is accessed from the CPU via mmap, it is not always
+ * possible to guarantee coherency between the CPU-visible map and underlying
+ * memory.  To manage coherency, DMA_BUF_IOCTL_SYNC must be used to bracket
+ * any CPU access to give the kernel the chance to shuffle memory around if
+ * needed.
+ *
+ * Prior to accessing the map, the client must call DMA_BUF_IOCTL_SYNC
+ * with DMA_BUF_SYNC_START and the appropriate read/write flags.  Once the
+ * access is complete, the client should call DMA_BUF_IOCTL_SYNC with
+ * DMA_BUF_SYNC_END and the same read/write flags.
+ *
+ * The synchronization provided via DMA_BUF_IOCTL_SYNC only provides cache
+ * coherency.  It does not prevent other processes or devices from
+ * accessing the memory at the same time.  If synchronization with a GPU or
+ * other device driver is required, it is the client's responsibility to
+ * wait for buffer to be ready for reading or writing before calling this
+ * ioctl with DMA_BUF_SYNC_START.  Likewise, the client must ensure that
+ * follow-up work is not submitted to GPU or other device driver until
+ * after this ioctl has been called with DMA_BUF_SYNC_END?
+ *
+ * If the driver or API with which the client is interacting uses implicit
+ * synchronization, waiting for prior work to complete can be done via
+ * poll() on the DMA buffer file descriptor.  If the driver or API requires
+ * explicit synchronization, the client may have to wait on a sync_file or
+ * other synchronization primitive outside the scope of the DMA buffer API.
+ */
 struct dma_buf_sync {
+	/**
+	 * @flags: Set of access flags
+	 *
+	 * DMA_BUF_SYNC_START:
+	 *     Indicates the start of a map access session.
+	 *
+	 * DMA_BUF_SYNC_END:
+	 *     Indicates the end of a map access session.
+	 *
+	 * DMA_BUF_SYNC_READ:
+	 *     Indicates that the mapped DMA buffer will be read by the
+	 *     client via the CPU map.
+	 *
+	 * DMA_BUF_SYNC_WRITE:
+	 *     Indicates that the mapped DMA buffer will be written by the
+	 *     client via the CPU map.
+	 *
+	 * DMA_BUF_SYNC_RW:
+	 *     An alias for DMA_BUF_SYNC_READ | DMA_BUF_SYNC_WRITE.
+	 */
 	__u64 flags;
 };
 
-- 
2.31.1

