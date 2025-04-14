Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF6A88F89
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 00:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D0610E00A;
	Mon, 14 Apr 2025 22:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="duvhFfB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D934810E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 22:53:02 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-22650077995so67983875ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 15:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744671182; x=1745275982;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uJrdRumDqZ5uqDqo6HIvT1i7XS9qBKy2EYr2kcfYfkI=;
 b=duvhFfB6QdTPj62hna11aZVcIJRkNgj5Trc3mt9kFz4xYCz2/1ynNVSBf4wK8RvKGD
 I14dP9DY6QSGpoYkQwCN8Kf6nmpGH4Ci2dYbn4L0oBJENTUfgGXSlI0GXkE4JsRGJx8X
 h/7/FgRenmmpZUPWejhKXEBD8G4IZuG47VGp/EtqHPhuyGuEIHBu+qgKgVRBEWsXsbpt
 Lt3rYkOuLdk22OaS1r6MnmFVLX5JYwZlRszrv3jqTsxwSFZJKsFE/EgISSXugNj3HLkQ
 UeaS20Et0exwnqdQDUj0UxfCaMV7KAZMVQYltgir8E1eVzcIVjeiEbXWve11LmTL0Bll
 3h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744671182; x=1745275982;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uJrdRumDqZ5uqDqo6HIvT1i7XS9qBKy2EYr2kcfYfkI=;
 b=qY26Bih+yfi5DkICCib9wckpviQxMXmCqrzpykpBkvQnYSjw4qG0DjPM4lh2X29zo7
 n9uxZjJaiqzBIX5nek1fSeTspGi75XwvByPQTeC9jaLR8rYAHOUCGwn+FKoH63JScMuf
 quJxFCNfK1C2WSBsYZUM4TE+Ou9Py+Y4DhkMzIF6EBaBbRlO31knZEVS8maUFf1klB0F
 HpmDZHWWEZPoDAuwXEgg5pHUIK1+1E+kGfyA7hSRw4+uuyGBOSJk26wjC7T/WqXaOSgD
 F+ayRSken37fbdQzeBGfX/S0Q4o8qAlivDOVXl8KmehDLWDp0qwk+FN44VIij7AE/CQx
 vrSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAARetbY5DzcVI+eJQz2dpSzFPDwVbsiAVuN8A8bfaXiEDXkoIGp5K1yooVfxQR1oK0SVStao2b6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOn85QPi4APRKQh+nlsrwHy9Heo/joVhq8nXLq3kWIb+yorApo
 VZjYRO6kjOJa32IDq68da4Ai7I1+qRZ6aI7GCS2ZJa1xthn1dBUv6Podto6aEFYa2ZpayS870yF
 H3bgU9FkYvJVhnQ==
X-Google-Smtp-Source: AGHT+IHdhGyVRFQrYACqs6CpKKEAPawP/7gzm2A4TvPbteK5I88D550DNb1nfh3BQI2ey0zXeU9GGoMDGDE66H8=
X-Received: from pllw4.prod.google.com ([2002:a17:902:7b84:b0:220:d668:ff81])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b2f:b0:215:a179:14ca with SMTP id
 d9443c01a7336-22bea49529cmr197698465ad.2.1744671182407; 
 Mon, 14 Apr 2025 15:53:02 -0700 (PDT)
Date: Mon, 14 Apr 2025 22:52:24 +0000
In-Reply-To: <20250414225227.3642618-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414225227.3642618-2-tjmercier@google.com>
Subject: [PATCH 1/4] dma-buf: Rename and expose debugfs symbols
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
 corbet@lwn.net, eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Expose the debugfs list and mutex so they are usable for the creation of
a BPF iterator for dmabufs. Rename the symbols so it's clear they
contain dmabufs and not some other type.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/dma-buf.c | 22 +++++++++++-----------
 include/linux/dma-buf.h   |  6 ++++++
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..affb47eb8629 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -36,14 +36,14 @@
 static inline int is_dma_buf_file(struct file *);
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
-static DEFINE_MUTEX(debugfs_list_mutex);
-static LIST_HEAD(debugfs_list);
+DEFINE_MUTEX(dmabuf_debugfs_list_mutex);
+LIST_HEAD(dmabuf_debugfs_list);
 
 static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
 {
-	mutex_lock(&debugfs_list_mutex);
-	list_add(&dmabuf->list_node, &debugfs_list);
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_lock(&dmabuf_debugfs_list_mutex);
+	list_add(&dmabuf->list_node, &dmabuf_debugfs_list);
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
 }
 
 static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
@@ -51,9 +51,9 @@ static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
 	if (!dmabuf)
 		return;
 
-	mutex_lock(&debugfs_list_mutex);
+	mutex_lock(&dmabuf_debugfs_list_mutex);
 	list_del(&dmabuf->list_node);
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
 }
 #else
 static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
@@ -1630,7 +1630,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	size_t size = 0;
 	int ret;
 
-	ret = mutex_lock_interruptible(&debugfs_list_mutex);
+	ret = mutex_lock_interruptible(&dmabuf_debugfs_list_mutex);
 
 	if (ret)
 		return ret;
@@ -1639,7 +1639,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
 		   "size", "flags", "mode", "count", "ino");
 
-	list_for_each_entry(buf_obj, &debugfs_list, list_node) {
+	list_for_each_entry(buf_obj, &dmabuf_debugfs_list, list_node) {
 
 		ret = dma_resv_lock_interruptible(buf_obj->resv, NULL);
 		if (ret)
@@ -1676,11 +1676,11 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 
 	seq_printf(s, "\nTotal %d objects, %zu bytes\n", count, size);
 
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
 	return 0;
 
 error_unlock:
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
 	return ret;
 }
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..7754608453dc 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/scatterlist.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/dma-mapping.h>
 #include <linux/fs.h>
 #include <linux/dma-fence.h>
@@ -556,6 +557,11 @@ struct dma_buf_export_info {
 	struct dma_buf_export_info name = { .exp_name = KBUILD_MODNAME, \
 					 .owner = THIS_MODULE }
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+extern struct list_head dmabuf_debugfs_list;
+extern struct mutex dmabuf_debugfs_list_mutex;
+#endif
+
 /**
  * get_dma_buf - convenience wrapper for get_file.
  * @dmabuf:	[in]	pointer to dma_buf
-- 
2.49.0.604.gff1f9ca942-goog

