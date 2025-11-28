Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE251C91509
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 09:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D3A10E888;
	Fri, 28 Nov 2025 08:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aI6FAT9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7DE10E873
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 08:53:11 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3438d4ae152so1753351a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 00:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764319991; x=1764924791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eL0U7zmB1gT10wwBCtl159d+vX25hEIj58mzemed9/Q=;
 b=aI6FAT9TvToy4XyWhSEJ5JSuAF3xpm2TmVDkInxrHkpxkPTDHIMiLKHADXjotO941W
 8Vk/DAVy+e2cdw1bxkkHht5UVB2H28P/QzJN3M0jz09eH4LhSYKkzoLErhidqAjpqT1A
 qkUIVtDi/8z+8140/16E3WOrlinUTVqUZRSfR3SFYNr/3DEDf+3SxM+Z0oE7H5Ia9it0
 gSJWtmIq6dtPZNLaKZSKXKU1IT7xZucGx8GzxatKgsw3i+N8QyOilBNuo2cQNH5ApNvy
 Lo4wHHRfc4LLlaoXWerxIP7YindtXN/+6H9BdBeH7/Bl/p9D/NGrAQHkli9bL9XRgqFE
 95lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764319991; x=1764924791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eL0U7zmB1gT10wwBCtl159d+vX25hEIj58mzemed9/Q=;
 b=TLNGPs3vFqkfh9GhK2sOPDFhHyioMooKYl1IQGVI5tt24dSSkrwwnzfBfYu6ZUrSMM
 LV4B4nW7XK3v2evkU7zKCvX/sIETENB7ERnEOx6EoYAW4ac8/X+lleJrJLciuIxDHNCh
 qYBglpL3eCGnounRnWycnmvwgBjplyz239ObXCUWRSqglLIZ8TE4qEDmG0BLZs5RD7OT
 +rScldqp0kUFOrcMTvsP2XBviMuhm+uqPIwhROeByYXaMKYJxUv2cN+y0Js6dyxnWAdi
 zrUmL5CyzgKMYw0ugQ7H3/vTEJFffl1lNlF52ynaN/KsN0c9fWJkgYT1VC8jqISuhwkF
 qUDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg1YyRBaMuO0/0ImMWi3jgNGdVbhm4N7IRB9dk8DdD56zCVdQ7RTmN5E1skb4hdAe0Sd7hknUy+kQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9wTaHb4FiBO43gUHS/nCcZUWhrzvaJf51B6TU/fJfSi06sHu5
 KQbOWsuvQIzJq6k9yeiFb3a1K0gsXVwRA+gMgHz2hJfJEhBEgjkO9X74
X-Gm-Gg: ASbGncsYV2oe5wecaxWJqFezET3PryhbgIgA83G2vY0FX18G5BIqpPE3tZ6GZ3QCgIL
 Cid/+8Ep0qIYsyzExJB/Hj1WHVsSvdIv4EdDqo9lLjoGSx4UAFBjioKGxWDC1KNTk9v/ilFUF/U
 bagXj1ooW0vmxS5P4m/H8cWFRG+/RmHuTHH/h8/kRU+CPJO5jE1HklFjKekGbEYd2wZ8wZfM0Bb
 MTuWhjklm1QbCiCLeH0iiIv/WsmRRlnLn8rsR4DljoEjuq3BfK5ee+MRPoR3wVWp4ep+/ro3rkN
 MVvfl5qKeZHv7Tlaijaaz1m7qKpjm0ebqln6AimMaHqBl93D5ucI+XH8iZd48ShJze5asDsE3OH
 zvLBQzkHXTJQqf4nrjO0adhgcF8zHBfm+mIGpnJhTjpp6OG5Ui+FoyBE+HRtEuOm5RA5IQ8kJH8
 dl5tKQHC6aoooD7aFs6dAz
X-Google-Smtp-Source: AGHT+IGhvbpVFcjEpLATAzAUhW5W40T3P1QD6+AfVb9g4d1Wfoo3l+g8ulGKiN+/KZRkWEKYmuoAzw==
X-Received: by 2002:a17:90a:d00c:b0:340:e529:5572 with SMTP id
 98e67ed59e1d1-34733e6cac7mr23773546a91.8.1764319990845; 
 Fri, 28 Nov 2025 00:53:10 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3477b74b8f1sm4081125a91.14.2025.11.28.00.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 00:53:10 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, rostedt@goodmis.org,
 mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH v4] dma-buf: add some tracepoints to debug.
Date: Fri, 28 Nov 2025 16:52:15 +0800
Message-Id: <20251128085215.550100-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

From: gaoxiang17 <gaoxiang17@xiaomi.com>

I want to track the status of dmabuf in real time in the production environment.
But now we can only check it by traversing the fd in the process or dmabuf_list.

For example:
   binder:3031_4-18348   [005] ...1.   545.568275: dma_buf_export: exp_name=qcom,system name=(null) size=217088 ino=2750
   binder:3031_4-18348   [005] ...1.   545.568284: dma_buf_fd: exp_name=qcom,system name=(null) size=217088 ino=2750 fd=8
   binder:3031_4-18348   [005] ...1.   545.568399: dma_buf_mmap_internal: exp_name=qcom,system name=qcom,system size=28672 ino=2751
     kworker/5:1-130     [005] ...1.   545.570193: dma_buf_put: exp_name=qcom,system name=ab size=28672 ino=2751
    RenderThread-18891   [005] ...1.   545.602994: dma_buf_get: exp_name=qcom,system name=ab size=217088 ino=2750 fd=1087
    RenderThread-9409    [000] .n.1.   545.745004: dma_buf_dynamic_attach: exp_name=qcom,system name=ab size=217088 ino=2750 is_dynamic=0 dev_name=kgsl-3d0
    RenderThread-9409    [005] ...1.   545.747802: dma_buf_detach: exp_name=qcom,system name=bq size=12771328 ino=2764 is_dynamic=0 dev_name=kgsl-3d0

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 drivers/dma-buf/dma-buf.c      |  48 +++++++++-
 include/trace/events/dma_buf.h | 160 +++++++++++++++++++++++++++++++++
 2 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..6e04e12f149e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,9 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +223,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	if (trace_dma_buf_mmap_internal_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_mmap_internal(dmabuf);
+	}
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +753,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	if (trace_dma_buf_export_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_export(dmabuf);
+	}
+
 	return dmabuf;
 
 err_dmabuf:
@@ -779,6 +792,11 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	if (trace_dma_buf_fd_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_fd(dmabuf, fd);
+	}
+
 	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
@@ -794,6 +812,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -805,7 +824,14 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return file->private_data;
+	dmabuf = file->private_data;
+
+	if (trace_dma_buf_get_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_get(dmabuf, fd);
+	}
+
+	return dmabuf;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
 
@@ -825,6 +851,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	if (trace_dma_buf_put_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_put(dmabuf);
+	}
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -979,6 +1010,11 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
+	if (trace_dma_buf_dynamic_attach_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_dynamic_attach(dmabuf, dma_buf_attachment_is_dynamic(attach), dev);
+	}
+
 	return attach;
 
 err_attach:
@@ -1023,6 +1059,11 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	if (trace_dma_buf_detach_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_detach(dmabuf, dma_buf_attachment_is_dynamic(attach), attach->dev);
+	}
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1488,6 +1529,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	if (trace_dma_buf_mmap_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_mmap(dmabuf);
+	}
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..f4b6ba5241fa
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dma_buf
+
+#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DMA_BUF_H
+
+#include <linux/dma-buf.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(dma_buf,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf),
+
+	TP_STRUCT__entry(
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino)
+);
+
+DECLARE_EVENT_CLASS(dma_buf_attach_dev,
+
+	TP_PROTO(struct dma_buf *dmabuf, bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, is_dynamic, dev),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(bool, is_dynamic)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->is_dynamic = is_dynamic;
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu is_dynamic=%d dev_name=%s",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->is_dynamic,
+		  __get_str(dev_name))
+);
+
+DECLARE_EVENT_CLASS(dma_buf_fd,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd),
+
+	TP_STRUCT__entry(
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(int, fd)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->fd = fd;
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->fd)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_export,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_mmap_internal,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_mmap,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_put,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_dynamic_attach,
+
+	TP_PROTO(struct dma_buf *dmabuf, bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, is_dynamic, dev)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
+
+	TP_PROTO(struct dma_buf *dmabuf, bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, is_dynamic, dev)
+);
+
+DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd)
+);
+
+DEFINE_EVENT(dma_buf_fd, dma_buf_get,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd)
+);
+
+#endif /* _TRACE_DMA_BUF_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.34.1

