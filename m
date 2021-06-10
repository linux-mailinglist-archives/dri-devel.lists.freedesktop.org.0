Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDA43A35B9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6983E6E430;
	Thu, 10 Jun 2021 21:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336AF6E2C8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 21:14:49 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso6127288pjz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 14:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukdPCSLlGJU5H3ShIIq5nVFw+knkHO+w3v7QyIoHtI4=;
 b=oayqlb6zdl7NcMSa9qfFrVTnl6PYiPzIA2VCAUHpKicKhK0U7qepfCm2CRArLvFQno
 N/zoB0cA4BNii+5Og8S5obfYMlCqj5B9KYBr7qI4aUGj+1QG+dyIVrDwhjbMfvWLUB1q
 5Be+CWWbzmRDFUo9uGZVLWnLg27yXaGsrsVYNsYkUF3PVDbMBiA7uK2uXQTLHvpYVS8c
 j83qLcZUU5bO0pWdW03qj5vUtsKfClLKSKqro04zJCVbH9oHzf0GFEkFNPNT8pd8ucZ3
 cciCabZE2e1+i/3vPbcmksGBk8S/Md8gkab4QU3VFKDc8qxWCVMG0lJaP9UUC2voXDQT
 c8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukdPCSLlGJU5H3ShIIq5nVFw+knkHO+w3v7QyIoHtI4=;
 b=efwACn5Cgz+FjCnkGlfOZnH1abDYBxoPKve5QqrVsgwst4xfn5IrjWxwwIGvNT20v6
 FlqBqnXSn/OEb8i8xtW7INHFRJBQywEe/LYWNPYF9Jy5yAWIOLdcY5Dg8QwIR89BbFrh
 a2XUH3CfEdfNLqQZFda6p3fgFnch7sHaDwx/f8+117QibP31HEwRwA0ZRCHex95Jwn8w
 AMmr1ze6m9JaziV23gBUavyNeoM7Cps6GlwwhMgHYE7MBol8cxksRnYFU4daL8XFGuYj
 yZstwA188UCXbAReMMKiDhA+Qvg1DQ42vV9THlgJxQ+Yq7n3vyUyStILzDguCv3nVMD1
 cryQ==
X-Gm-Message-State: AOAM530Sl7/+a9G2lmYxqNB+T/9C30QPCg8ZVA/8H1/bb4mDEIzTM8S5
 1yKJYKquqWSU6XtGgySEWq2Tpe9XZeAjFQ==
X-Google-Smtp-Source: ABdhPJzL0uA7PwyxLhWd7vwIvtS0Af81qTQYLV+mdcEpvAQdQaQYNSrxPcEBR43uWO/yp+Pk7FkMnQ==
X-Received: by 2002:a17:90b:38c4:: with SMTP id
 nn4mr794507pjb.166.1623359688415; 
 Thu, 10 Jun 2021 14:14:48 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id cl4sm2934062pjb.32.2021.06.10.14.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:14:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
Date: Thu, 10 Jun 2021 16:14:42 -0500
Message-Id: <20210610211442.643307-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610210925.642582-4-jason@jlekstrand.net>
References: <20210610210925.642582-4-jason@jlekstrand.net>
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
---
 Documentation/driver-api/dma-buf.rst |  8 +++++
 include/uapi/linux/dma-buf.h         | 46 +++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

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
index 7f30393b92c3b..1c131002fe1ee 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -22,8 +22,52 @@
 
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
+ * wait for buffer to be ready for reading or writing.  If the driver or
+ * API with which the client is interacting uses implicit synchronization,
+ * this can be done via poll() on the DMA buffer file descriptor.  If the
+ * driver or API requires explicit synchronization, the client may have to
+ * wait on a sync_file or other synchronization primitive outside the scope
+ * of the DMA buffer API.
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

