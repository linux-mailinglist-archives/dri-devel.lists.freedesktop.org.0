Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33C2CE5CEB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 04:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B49610F822;
	Mon, 29 Dec 2025 03:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MC3AUKDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F14110F822
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 03:15:55 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7f89d0b37f0so4253910b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 19:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766978155; x=1767582955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6kLoZB5QMQc+K/aIrEr+4NYhtJKe9kWjjOywPC1m2Es=;
 b=MC3AUKDAuf1K75GaacQ0wFRdWHVGAq5VstY20n5/xeIRzA/HcaLcUvPMrADxOAGLLO
 3A81BRJ2yH6q1hNScoQIjmbgpOOKR5gKxtmH3j+jn4Cjt3ZR1jhrkZYq7JXIkXMOZIeR
 8fvgjZgo0GgMs3b5IrWtYzKHms6v/7m4zW+g+HilN98S7WWxQ2Nny9Q0zPcXUMSs6YTF
 BzM8uDulQi7W1JwD6VpN/XFsxIOpyRCdGsfeu7RYB/yerXEzoVHTz2pZFYe4xEqxLxbD
 WdeZ19a+91WGoI/sn1pl2iKKErf4eyqOiWufEy+MrFkUtehcSOAcsqRPeL02DWTooRHh
 MygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766978155; x=1767582955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kLoZB5QMQc+K/aIrEr+4NYhtJKe9kWjjOywPC1m2Es=;
 b=p3Zoc4DcGuHMIRD2vZ0gQV5U08kpFGa1D0YVc0gHQ8jjK5KUxwqpLksBhliAOeo58F
 gMe3Ej34wEjrC54UsudVgj0wOoGVnNJW9ixz27JsjrbRRwIEzAeyH5O/6eNVIz2uDaju
 7YowHiuPKGfis4z8DWF0KePGT1y1AYdeZRja1LhcZRSJOpU0aZJtP+1h1epJ1IwTrz8W
 Q0NuGzLs5xqka4Bdn0F8GbZqdB1EJtrQKza1zYZgNbtqUhdNo8Z0kR7+57r0kWwOQGXE
 a5QooMbZpE/3mRws6PaEQ+V+vReQOZQt7tZrxQrN6SbRMvFeeTED0KfGZEupYI3hQWI1
 93IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT+q6XKTPMESrl6U79G3HeEtLX60941jN6/k6vu2UJweRRskWeXCUNcK316JHSrrxOlvlJv5+hLz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9PhtIpyyC3wV3e0KCiEAp4e42jZ+9vAK1kqfS+AmnKn3AkbPP
 VHKi3+TAlDgPkDTmtA3J3j0Bp17OwcPE0DjB58f0Zp+8w9cChV6rAmFH
X-Gm-Gg: AY/fxX4/VmY5R8FukvRU74JxRQQPqWhnjUfJVe20hfMqXYDgXm/o66sp9heHHW8aq/T
 XdrGKFyoLdM8I9Hh13j87So5A67RlaQHsDQ812dMLW1lylhmmPzmoDqFc9uqQf5ENPbvplDIznr
 eon8EW+PcGVZZNu/Ne9R0/SgdJqZxPMQzpO/WLsLXyP9BUrOFjwTNtKmlQzyIx6H+0BFMLBYdeW
 mKW8rX62QMcYPKGXNUkp55lJhZxUW4B09BoHMyjL5EYsEkhZpt/mvp//VNE8qbr8EH182XD9wlA
 u1pTUd/P6JcjRXS1Um0WVfb2j2ifEPlP8dqiySCX3Hl4MTs4zUCnYEDdUJQVZFdclucliaM+Je0
 qhWMqEpV96o3Q34HM9ySkVbZUjNmevkZ7kV9M5OWFYGF21lhw+RlEkoJvBjSva/vRcrbVkl38gH
 rUi+XhYDE7YgZfcHEIuE6QQr8/wz2Eeog=
X-Google-Smtp-Source: AGHT+IFaS92fvg7qIdSkG8OVXret7v/N5DAvufFQ6j12Iv44PrQ8ceHxTlqDy0oxGWdWmtlvryWrgQ==
X-Received: by 2002:a05:6a00:451c:b0:7e8:3fcb:bc46 with SMTP id
 d2e1a72fcca58-7ff54c01878mr28259482b3a.27.1766978154707; 
 Sun, 28 Dec 2025 19:15:54 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7af2b537sm27529677b3a.20.2025.12.28.19.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 19:15:54 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, rostedt@goodmis.org,
 mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH v12] dma-buf: add some tracepoints to debug.
Date: Mon, 29 Dec 2025 11:15:47 +0800
Message-Id: <20251229031547.59272-1-gxxa03070307@gmail.com>
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

Since we can only inspect dmabuf by iterating over process FDs or the
dmabuf_list, we need to add our own tracepoints to track its status in
real time in production.

For example:
   binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_name=qcom,system size=12685312 ino=2738
   binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=qcom,system size=12685312 ino=2738 fd=8
   binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal: exp_name=qcom,system size=28672 ino=2739
     kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=qcom,system size=12685312 ino=2738
    RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=qcom,system size=12771328 ino=2762 fd=176
    RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
    RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---

Changes since v11: https://lore.kernel.org/all/20251225121119.2194228-1-gxxa03070307@gmail.com/
- Lined up the backslashes nicely for the macro DMA_BUF_TRACE.
- Used DEFINE_EVENT_CONDITION() to move the condition branch into the tracepoint.

Changes since v10: https://lore.kernel.org/all/20251224013455.1649879-1-gxxa03070307@gmail.com/
- Always expose dmabuf->name_lock if lockdep is enabled.

Changes since v9: https://lore.kernel.org/all/20251223032749.1371913-1-gxxa03070307@gmail.com/
- Fixed some whitespace issues with the macro DMA_BUF_TRACE again.

Changes since v8: https://lore.kernel.org/all/20251218062853.819744-1-gxxa03070307@gmail.com/
- Expose dmabuf->name_lock when lockdep is enabled but trace event is not.

Changes since v7: https://lore.kernel.org/all/20251217105132.643300-1-gxxa03070307@gmail.com/
- Fixed some whitespace issues with the macro DMA_BUF_TRACE.

Changes since v6: https://lore.kernel.org/all/20251216063952.516364-1-gxxa03070307@gmail.com/
- Add a comment for the macro DMA_BUF_TRACE.

Changes since v5: https://lore.kernel.org/all/20251201112148.843572-1-gxxa03070307@gmail.com/
- Add the macro DMA_BUF_TRACE.
- Modify the commit message.

Changes since v4: https://lore.kernel.org/all/20251128085215.550100-1-gxxa03070307@gmail.com/
- Remove the tracepoints exporting.
- Remove the file refcount for the trace.
- Print the dev_name last.
- Add the parameter of whether dma_buf attachment is dynamic.

Changes since v3: https://lore.kernel.org/all/20251127004352.376307-1-gxxa03070307@gmail.com/
- Take the dmabuf->name_lock around the tracepoint call itself.
- Used DECLARE_EVENT_CLASS() and a DEFINE_EVENT().

Changes since v2: https://lore.kernel.org/all/20251125162949.220488-1-gxxa03070307@gmail.com/
- Add more explanation to the commit message.

 drivers/dma-buf/dma-buf.c      |  48 +++++++++-
 include/trace/events/dma_buf.h | 159 +++++++++++++++++++++++++++++++++
 2 files changed, 205 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..dee59d4c0b12 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,26 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
+/*
+ * dmabuf->name must be accessed with holding dmabuf->name_lock.
+ * we need to take the lock around the tracepoint call itself where
+ * it is called in the code.
+ *
+ * Note: FUNC##_enabled() is a static branch that will only
+ *       be set when the trace event is enabled.
+ */
+#define DMA_BUF_TRACE(FUNC, ...)					\
+	do {								\
+		/* Always expose lock if lockdep is enabled */		\
+		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {	\
+			guard(spinlock)(&dmabuf->name_lock);		\
+			FUNC(__VA_ARGS__);				\
+		}							\
+	} while (0)
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +240,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap_internal, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +767,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	DMA_BUF_TRACE(trace_dma_buf_export, dmabuf);
+
 	return dmabuf;
 
 err_dmabuf:
@@ -768,10 +792,15 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_export, "DMA_BUF");
  */
 int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 {
+	int fd;
+
 	if (!dmabuf || !dmabuf->file)
 		return -EINVAL;
 
-	return FD_ADD(flags, dmabuf->file);
+	fd = FD_ADD(flags, dmabuf->file);
+	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
+
+	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 
@@ -786,6 +815,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -797,7 +827,11 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return file->private_data;
+	dmabuf = file->private_data;
+
+	DMA_BUF_TRACE(trace_dma_buf_get, dmabuf, fd);
+
+	return dmabuf;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
 
@@ -817,6 +851,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -971,6 +1007,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
+	DMA_BUF_TRACE(trace_dma_buf_dynamic_attach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), dev);
+
 	return attach;
 
 err_attach:
@@ -1015,6 +1054,9 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	DMA_BUF_TRACE(trace_dma_buf_detach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), attach->dev);
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1480,6 +1522,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..3bb88d05bcc8
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,159 @@
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
+		__string(	exp_name,		dmabuf->exp_name)
+		__field(	size_t,			size)
+		__field(	ino_t,			ino)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__entry->size	= dmabuf->size;
+		__entry->ino	= dmabuf->file->f_inode->i_ino;
+	),
+
+	TP_printk("exp_name=%s size=%zu ino=%lu",
+		  __get_str(exp_name),
+		  __entry->size,
+		  __entry->ino)
+);
+
+DECLARE_EVENT_CLASS(dma_buf_attach_dev,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
+		bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, attach, is_dynamic, dev),
+
+	TP_STRUCT__entry(
+		__string(	dev_name,			dev_name(dev))
+		__string(	exp_name,			dmabuf->exp_name)
+		__field(	size_t,				size)
+		__field(	ino_t,				ino)
+		__field(	struct dma_buf_attachment *,	attach)
+		__field(	bool,				is_dynamic)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(exp_name);
+		__entry->size		= dmabuf->size;
+		__entry->ino		= dmabuf->file->f_inode->i_ino;
+		__entry->is_dynamic	= is_dynamic;
+		__entry->attach		= attach;
+	),
+
+	TP_printk("exp_name=%s size=%zu ino=%lu attachment:%p is_dynamic=%d dev_name=%s",
+		  __get_str(exp_name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->attach,
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
+		__string(	exp_name,		dmabuf->exp_name)
+		__field(	size_t,			size)
+		__field(	ino_t,			ino)
+		__field(	int,			fd)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__entry->size	= dmabuf->size;
+		__entry->ino	= dmabuf->file->f_inode->i_ino;
+		__entry->fd	= fd;
+	),
+
+	TP_printk("exp_name=%s size=%zu ino=%lu fd=%d",
+		  __get_str(exp_name),
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
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
+		bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, attach, is_dynamic, dev)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
+		bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, attach, is_dynamic, dev)
+);
+
+DEFINE_EVENT_CONDITION(dma_buf_fd, dma_buf_fd,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd),
+
+	TP_CONDITION(fd >= 0)
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

