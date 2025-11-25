Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8AC86DC2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 20:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF6810E452;
	Tue, 25 Nov 2025 19:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cKIjjIs6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0AA10E441
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:29:58 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7b9215e55e6so3878256b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764088198; x=1764692998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WwtB7x9jbnj3BkBVwjT6kHA5QLKT/sBvVzDGMwM9kMs=;
 b=cKIjjIs6g88gL+tt4m4SK1WOGQqZAVmLVQ9IRRk4PYlPiTYQ/D0mmuR6w+jegTT/WP
 Y4c8uGta5wnodoYeaTzUiacOn3M6R3+mIMicLFvUaNU6oZD4s3r5G/tJQu2CbmqGYOuN
 BnKI6zSwb5XIGuMykRP0HHtLZEM3PWSPm1mKRQw0QVxa5a0zmr8kgnHEvRK15Wy//W+F
 RJsooPP42xVULRhyBrGok/x/5UiKHsk3+oYq7DYD1HG+8U2ZE6O5u8IDth/tSraIP8fw
 cHA4PI27JGTAt8imelRd+B9QoAH4GAITzIOLlJjcl5QOXvRvfCXkHvyRsXEnRosmQFwW
 opNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764088198; x=1764692998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwtB7x9jbnj3BkBVwjT6kHA5QLKT/sBvVzDGMwM9kMs=;
 b=ANCXbbFfzdA2aI5TRC493l4aL5e74ynlQLQb5LBxgN14E7368nDHiMY+ApxpRVrWuv
 lUfDBBMx/GClg1Wt+lmh+197wf++o+UkeBvtZ8UtVh+Bf3qmZPIZaek9yUFhJ3ICxsYJ
 Lm1yq8+6kz2Xi8cgbFACJa8QTmpUZiDlM+IR01WYJeSPgIZsq7cVz+n4Fp8Tszd0V/2H
 dJs61eOtZEJ8e3xbJsfQEYymRXdbgFIKmKY0ndkyGF430isInC7ivfPgtYHswkODYrf+
 +YvR7lx1RXJYm/S8xuBP1PFK/qN8bhp2AIjTlVMEkxc4bLXQPkgkrmI91+I3A/L+Ij7q
 ezpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo3Rpq3Vcg7a45ZwhwTmonF02HsH6TRZFbQdTcUQPiDKPdIZsfBbwCRO2OaSa+I8aPFrq0lNpHm0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIASOl3DonzYP+kjFggogxMtF52+3xfCkLipQm4/87JYCjAkfw
 VfPUk/2I/9s/QbLNS5GLUlx789jp0kuWqdrWJGnOGDkL0nC5SebJpRLp
X-Gm-Gg: ASbGnctheyYDJYr7goW033FbSFlfGwle2ZExOYOK6dLuXoJNx2vBw5PrOmSC3KdC+l0
 zJ1FwYt6qFEUJYXphgoPyxdZsZ10rYUqQLAVqHgwRF2NRbFM4pZd3dJ4d/dAH4Br1go+uqWdTSx
 dyY3wjKVDbrgJhrhwXf0H3RdfPO6H5fEO+puK0lapAZDIPZdnBg5QpQBlRLoNvtDcDNrK8t6nav
 J5TX8DyqJMhTLhRj/IUpsQzOaEVXog8rVLMaz50VlarWR5wGlJNjCeLIekUM5Y/rsrnk2jTqRh5
 bL7VlNnJHw3su9tp1K547LMtw0vFDCo3RvmEJjlJg1aQ32//0fXHx+v5TLn/eytKqbqN7fmuwpP
 4lhS1dANjPOWa0Qp3xwy4AqH9dQmXZpeY8qi9j6FVm6Ks85Dhh0vtAK04ShCK2+cey2iKNyUUpX
 AdrpqeMw==
X-Google-Smtp-Source: AGHT+IH5VsEgKVWLFjZB0z7fH5JXEPDjqE0RvxYdxUOT95d5pZGo+nIy5F29wx/dgZIyyG1Bi/NSdA==
X-Received: by 2002:a05:6a20:2583:b0:35d:53dc:cb57 with SMTP id
 adf61e73a8af0-3637e0a58c8mr3790560637.49.1764088197837; 
 Tue, 25 Nov 2025 08:29:57 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f174d2c0sm18544900b3a.66.2025.11.25.08.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 08:29:56 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, rostedt@goodmis.org,
 mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 mathieu.desnoyers@efficios.com, dhowells@redhat.com, kuba@kernel.org,
 brauner@kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH v2] dma-buf: add some tracepoints to debug.
Date: Wed, 26 Nov 2025 00:29:49 +0800
Message-Id: <20251125162949.220488-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Nov 2025 19:50:03 +0000
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
    <...>-8342    [006] .....   199.626433: dma_buf_export: exp_name=system name=(null) size=32768 ino=2337 f_refcnt=2
    <...>-8342    [006] .....   199.626436: dma_buf_fd: exp_name=system name=(null) size=32768 ino=2337 fd=853 f_refcnt=2
    <...>-8342    [006] .....   199.626472: dma_buf_mmap_internal: exp_name=system name=system size=32768 ino=2337 f_refcnt=6
    <...>-3199    [006] .....   200.719182: dma_buf_get: exp_name=qcom,system name=acb size=184320 ino=2331 fd=111 f_refcnt=6
    <...>-894     [006] .....   199.632342: dma_buf_put: exp_name=system name=system size=32768 ino=2337 f_refcnt=2
    <...>-3199    [003] .....   213.402200: dma_buf_attach: dev_name=soc:qcom,xxx exp_name=qcom,system name=acb size=184320 ino=2331 f_refcnt=7
    <...>-1229    [004] .....   213.850270: dma_buf_detach: exp_name=qcom,system name=acb size=184320 ino=2331 f_refcnt=6

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 drivers/dma-buf/dma-buf.c      |  19 +++
 include/trace/events/dma_buf.h | 281 +++++++++++++++++++++++++++++++++
 2 files changed, 300 insertions(+)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..8b5af73f0218 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,9 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +223,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	trace_dma_buf_mmap_internal(dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +750,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	trace_dma_buf_export(dmabuf);
+
 	return dmabuf;
 
 err_dmabuf:
@@ -779,6 +786,8 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	trace_dma_buf_fd(dmabuf, fd);
+
 	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
@@ -805,6 +814,8 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
+	trace_dma_buf_get(fd, file);
+
 	return file->private_data;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
@@ -825,6 +836,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	trace_dma_buf_put(dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -998,6 +1011,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev)
 {
+	trace_dma_buf_attach(dmabuf, dev);
+
 	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
@@ -1024,6 +1039,8 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 		dmabuf->ops->detach(dmabuf, attach);
 
 	kfree(attach);
+
+	trace_dma_buf_detach(dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
 
@@ -1488,6 +1505,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	trace_dma_buf_mmap(dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..ab593dea4617
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,281 @@
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
+TRACE_EVENT(dma_buf_export,
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
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		spin_lock(&dmabuf->name_lock);
+		__assign_str(name);
+		spin_unlock(&dmabuf->name_lock);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+TRACE_EVENT(dma_buf_fd,
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
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		spin_lock(&dmabuf->name_lock);
+		__assign_str(name);
+		spin_unlock(&dmabuf->name_lock);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->fd = fd;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->fd,
+		  __entry->f_refcnt)
+);
+
+TRACE_EVENT(dma_buf_mmap_internal,
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
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		spin_lock(&dmabuf->name_lock);
+		__assign_str(name);
+		spin_unlock(&dmabuf->name_lock);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+TRACE_EVENT(dma_buf_mmap,
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
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		spin_lock(&dmabuf->name_lock);
+		__assign_str(name);
+		spin_unlock(&dmabuf->name_lock);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+TRACE_EVENT(dma_buf_attach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
+
+	TP_ARGS(dmabuf, dev),
+
+	TP_STRUCT__entry(
+		__string(dname, dev_name(dev))
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(dname);
+		__assign_str(exp_name);
+		spin_lock(&dmabuf->name_lock);
+		__assign_str(name);
+		spin_unlock(&dmabuf->name_lock);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("dev_name=%s exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(dname),
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+TRACE_EVENT(dma_buf_detach,
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
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		spin_lock(&dmabuf->name_lock);
+		__assign_str(name);
+		spin_unlock(&dmabuf->name_lock);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+TRACE_EVENT(dma_buf_get,
+
+	TP_PROTO(int fd, struct file *file),
+
+	TP_ARGS(fd, file),
+
+	TP_STRUCT__entry(
+		__string(exp_name, ((struct dma_buf *)file->private_data)->exp_name)
+		__string(name, ((struct dma_buf *)file->private_data)->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(int, fd)
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		struct dma_buf *dmabuf = (struct dma_buf *)file->private_data;
+
+		__assign_str(exp_name);
+		spin_lock(&dmabuf->name_lock);
+		__assign_str(name);
+		spin_unlock(&dmabuf->name_lock);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->fd = fd;
+		__entry->f_refcnt = file_count(file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->fd,
+		  __entry->f_refcnt)
+);
+
+TRACE_EVENT(dma_buf_put,
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
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		spin_lock(&dmabuf->name_lock);
+		__assign_str(name);
+		spin_unlock(&dmabuf->name_lock);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+#endif /* _TRACE_DMA_BUF_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.34.1

