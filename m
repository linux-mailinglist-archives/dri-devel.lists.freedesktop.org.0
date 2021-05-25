Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F39390B33
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 23:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904AC894C3;
	Tue, 25 May 2021 21:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA446EB49
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 21:18:08 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 v13-20020a17090abb8db029015f9f7d7290so2488101pjr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=khdZVEEK1rP9kUwKpWiHIvVsVSC2tlfvCOHGJLhYPfw=;
 b=tZwS4IMa7UY4aVAguim0NS+EKV5ES9Vc0QRtnfHKS16itzMpsD0qciJuA9TbKgnorn
 jBhyGscwIQUdUpanxz8ZbYn2CstobqR66xLAf882Ko3LKcrnHJVT9WUHdhxLFSFvc9xX
 fldQiOpj8KTvASzbiugIedBE7GyMLhCFNDZBKMpSyEjUx5rMnpNv8mCs8NdAixzwEgMS
 oNuJmjFQx2b4YKItS5lW+L1pyEqMSPpxxjWPVCQNiF6PBzBTAf28CwazgtkFJTD/pMtj
 EsQ58zc33IMQ1vtarjZZwp7NYHPOdv1wILq2gAb/1pozU4/iu5Y08mHkp0b3XJSA5F2Y
 Cakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=khdZVEEK1rP9kUwKpWiHIvVsVSC2tlfvCOHGJLhYPfw=;
 b=B8z4r8hyjsE4UXOXVxY5TD6fpRkVjmNMniaOngQidaqUz7wo3I7w5VjP1yk7g0fcBL
 v5uRYGjX1MiXRmOiBVTkGhS2ibv4Igy4kiPu5Np0u0gw1RIvcAcsoD3e8e0eN4BrR2sJ
 WmrECymb2pIVjDE0vmWls5X1ghUcKhevSgC/0qpw2xNK6UyrTDoYRaw4eB8LLrIOdxYj
 P8ZlWg1dIepUU/nOSi8kKXBnnsQas8Xkbk8A+86JkP77HChNS1u/bWm31kdCx4CHIc9V
 +fpGgzX6B/ruKjB/DnaPTkYz9P3T7V59itZGNefXzD1SghbSnCxSvTsfwdbIqzUJZaM1
 RMkA==
X-Gm-Message-State: AOAM530dR9o6l8hX4bN5UA4aP12zib05Or13yLbmABHmRb5NZ2pQz+w6
 IHw0VjpfXIa6okqTbupxObEpfdU++sRseg==
X-Google-Smtp-Source: ABdhPJxsCexXt0qdANF6TJ1maa4rnZI7NhaWP+hRNDQJOMuYwwT9ml9eZwq+RosYMOi4/ddeowJU6w==
X-Received: by 2002:a17:90b:14cc:: with SMTP id
 jz12mr33137764pjb.210.1621977487956; 
 Tue, 25 May 2021 14:18:07 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id e186sm14342278pfa.145.2021.05.25.14.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 14:18:07 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] dma-buf: Document DMA_BUF_IOCTL_SYNC
Date: Tue, 25 May 2021 16:17:50 -0500
Message-Id: <20210525211753.1086069-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525211753.1086069-1-jason@jlekstrand.net>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
---
 Documentation/driver-api/dma-buf.rst |  8 +++++++
 include/uapi/linux/dma-buf.h         | 32 +++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 7f37ec30d9fd7..784f84fe50a5e 100644
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
index 7f30393b92c3b..1f67ced853b14 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -22,8 +22,38 @@
 
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
+ * Prior to accessing the map, the client should call DMA_BUF_IOCTL_SYNC
+ * with DMA_BUF_SYNC_START and the appropriate read/write flags.  Once the
+ * access is complete, the client should call DMA_BUF_IOCTL_SYNC with
+ * DMA_BUF_SYNC_END and the same read/write flags.
+ */
 struct dma_buf_sync {
+	/**
+	 * @flags: Set of access flags
+	 *
+	 * - DMA_BUF_SYNC_START: Indicates the start of a map access
+	 *   session.
+	 *
+	 * - DMA_BUF_SYNC_END: Indicates the end of a map access session.
+	 *
+	 * - DMA_BUF_SYNC_READ: Indicates that the mapped DMA buffer will
+	 *   be read by the client via the CPU map.
+	 *
+	 * - DMA_BUF_SYNC_READ: Indicates that the mapped DMA buffer will
+	 *   be written by the client via the CPU map.
+	 *
+	 * - DMA_BUF_SYNC_RW: An alias for DMA_BUF_SYNC_READ |
+	 *   DMA_BUF_SYNC_WRITE.
+	 */
 	__u64 flags;
 };
 
-- 
2.31.1

