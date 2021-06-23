Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8223B1E80
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 18:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4616E8A8;
	Wed, 23 Jun 2021 16:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F626E8A8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:19:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gn32so4931368ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cO1vJz5pucDouo6X9nWZ3NnckMomg2MFYmOs4y5pkK4=;
 b=DDCIl7hcJY4ZO4Z513KKDraLBQhvHBFR7V7PcQgwkC9h1HodRqSx7sm8LZKM6bEVC9
 WOayaqmWTq3+JXKAiy5bErOphH/Qd10hwxfJ2x7ehnbQyoSsrVkduUnnXA0koCzIOrQn
 tBGcVmg6448ZIHIYUY2YhukxUFoJTB+3HSijE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cO1vJz5pucDouo6X9nWZ3NnckMomg2MFYmOs4y5pkK4=;
 b=GjzRYRurXIsdKRg4S3R2QRmJb4OU1bNh2Oq7ricybGeCcy2ls/sicwTAQTBMYpFNNe
 hN3GWi2t9l7CA6gvIx5ge5ILUC7lCI2oXlcy6RiBE4OaCk7nJZ8S1w3MB16RHWDNvcsr
 qF7oshNy/kHlwRrZ2mZj3QVzqU7yTBWy8uvzSmFwz9eRGlYaXkJDfdQkd4kGHxEvfXR/
 UOJXUznrjQQR5NLpOLKEoNCP+ntMxpaPRgEG+FKpUrvgXi8qXkOvR9y9rpqGZVuPQM3t
 Lc58O8b7wnjnPjKp6c1qSiQPwzBlUsMPZkY3TM948oOJOm5Xj7yUhEwayP+Jc0EdlzIL
 Xy0Q==
X-Gm-Message-State: AOAM531TUriqT00UQO9nAfXhpG2RIOwG86MWdkLQIqQY7h0tXGnIS8Qm
 BjJT7gFaENzsSXzk1/MfhdqJsRf5t+qWbg==
X-Google-Smtp-Source: ABdhPJwKsMbsDP0Bcv38UaSZ4GVVy38OY+3qXIada2qcpL3Cx8ePFIJRMy9XGPeKjAnrgyRYyPhRQg==
X-Received: by 2002:a17:907:2d8b:: with SMTP id
 gt11mr903565ejc.80.1624465157754; 
 Wed, 23 Jun 2021 09:19:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ee47sm285539edb.51.2021.06.23.09.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 09:19:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-buf: Switch to inline kerneldoc
Date: Wed, 23 Jun 2021 18:17:12 +0200
Message-Id: <20210623161712.3370885-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
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
Cc: Deepak R Varma <mh12gx2825@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>, linaro-mm-sig@lists.linaro.org,
 Nirmoy Das <nirmoy.das@amd.com>, Chen Li <chenli@uniontech.com>,
 Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also review & update everything while we're at it.

This is prep work to smash a ton of stuff into the kerneldoc for
@resv.

v2: Move the doc for sysfs_entry.attachment_uid to the right place too
(Sam)

Acked-by: Christian König <christian.koenig@amd.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Chen Li <chenli@uniontech.com>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/linux/dma-buf.h | 116 +++++++++++++++++++++++++++++++---------
 1 file changed, 90 insertions(+), 26 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 92eec38a03aa..81cebf414505 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -289,30 +289,6 @@ struct dma_buf_ops {
 
 /**
  * struct dma_buf - shared buffer object
- * @size: size of the buffer; invariant over the lifetime of the buffer.
- * @file: file pointer used for sharing buffers across, and for refcounting.
- * @attachments: list of dma_buf_attachment that denotes all devices attached,
- *               protected by dma_resv lock.
- * @ops: dma_buf_ops associated with this buffer object.
- * @lock: used internally to serialize list manipulation, attach/detach and
- *        vmap/unmap
- * @vmapping_counter: used internally to refcnt the vmaps
- * @vmap_ptr: the current vmap ptr if vmapping_counter > 0
- * @exp_name: name of the exporter; useful for debugging.
- * @name: userspace-provided name; useful for accounting and debugging,
- *        protected by @resv.
- * @name_lock: spinlock to protect name access
- * @owner: pointer to exporter module; used for refcounting when exporter is a
- *         kernel module.
- * @list_node: node for dma_buf accounting and debugging.
- * @priv: exporter specific private data for this buffer object.
- * @resv: reservation object linked to this dma-buf
- * @poll: for userspace poll support
- * @cb_excl: for userspace poll support
- * @cb_shared: for userspace poll support
- * @sysfs_entry: for exposing information about this buffer in sysfs.
- * The attachment_uid member of @sysfs_entry is protected by dma_resv lock
- * and is incremented on each attach.
  *
  * This represents a shared buffer, created by calling dma_buf_export(). The
  * userspace representation is a normal file descriptor, which can be created by
@@ -324,24 +300,100 @@ struct dma_buf_ops {
  * Device DMA access is handled by the separate &struct dma_buf_attachment.
  */
 struct dma_buf {
+	/**
+	 * @size:
+	 *
+	 * Size of the buffer; invariant over the lifetime of the buffer.
+	 */
 	size_t size;
+
+	/**
+	 * @file:
+	 *
+	 * File pointer used for sharing buffers across, and for refcounting.
+	 * See dma_buf_get() and dma_buf_put().
+	 */
 	struct file *file;
+
+	/**
+	 * @attachments:
+	 *
+	 * List of dma_buf_attachment that denotes all devices attached,
+	 * protected by &dma_resv lock @resv.
+	 */
 	struct list_head attachments;
+
+	/** @ops: dma_buf_ops associated with this buffer object. */
 	const struct dma_buf_ops *ops;
+
+	/**
+	 * @lock:
+	 *
+	 * Used internally to serialize list manipulation, attach/detach and
+	 * vmap/unmap. Note that in many cases this is superseeded by
+	 * dma_resv_lock() on @resv.
+	 */
 	struct mutex lock;
+
+	/**
+	 * @vmapping_counter:
+	 *
+	 * Used internally to refcnt the vmaps returned by dma_buf_vmap().
+	 * Protected by @lock.
+	 */
 	unsigned vmapping_counter;
+
+	/**
+	 * @vmap_ptr:
+	 * The current vmap ptr if @vmapping_counter > 0. Protected by @lock.
+	 */
 	struct dma_buf_map vmap_ptr;
+
+	/**
+	 * @exp_name:
+	 *
+	 * Name of the exporter; useful for debugging. See the
+	 * DMA_BUF_SET_NAME IOCTL.
+	 */
 	const char *exp_name;
+
+	/**
+	 * @name:
+	 *
+	 * Userspace-provided name; useful for accounting and debugging,
+	 * protected by dma_resv_lock() on @resv and @name_lock for read access.
+	 */
 	const char *name;
+
+	/** @name_lock: Spinlock to protect name acces for read access. */
 	spinlock_t name_lock;
+
+	/**
+	 * @owner:
+	 *
+	 * Pointer to exporter module; used for refcounting when exporter is a
+	 * kernel module.
+	 */
 	struct module *owner;
+
+	/** @list_node: node for dma_buf accounting and debugging. */
 	struct list_head list_node;
+
+	/** @priv: exporter specific private data for this buffer object. */
 	void *priv;
+
+	/**
+	 * @resv:
+	 *
+	 * Reservation object linked to this dma-buf.
+	 */
 	struct dma_resv *resv;
 
-	/* poll support */
+	/** @poll: for userspace poll support */
 	wait_queue_head_t poll;
 
+	/** @cb_excl: for userspace poll support */
+	/** @cb_shared: for userspace poll support */
 	struct dma_buf_poll_cb_t {
 		struct dma_fence_cb cb;
 		wait_queue_head_t *poll;
@@ -349,10 +401,22 @@ struct dma_buf {
 		__poll_t active;
 	} cb_excl, cb_shared;
 #ifdef CONFIG_DMABUF_SYSFS_STATS
-	/* for sysfs stats */
+	/**
+	 * @sysfs_entry:
+	 *
+	 * For exposing information about this buffer in sysfs. See also
+	 * `DMA-BUF statistics`_ for the uapi this enables.
+	 */
 	struct dma_buf_sysfs_entry {
 		struct kobject kobj;
 		struct dma_buf *dmabuf;
+
+		/**
+		 * @sysfs_entry.attachment_uid:
+		 *
+		 * This is protected by the dma_resv_lock() on @resv and is
+		 * incremented on each attach.
+		 */
 		unsigned int attachment_uid;
 		struct kset *attach_stats_kset;
 	} *sysfs_entry;
-- 
2.32.0.rc2

