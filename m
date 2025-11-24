Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C3C83DE1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A736C10E36C;
	Tue, 25 Nov 2025 08:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZdHftB4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682010E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:36:56 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-340ba29d518so2602865a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 05:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763991416; x=1764596216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=69heBc7lxItVc7wNt1exM2CAHwdvZiFMjd3lDNLudqQ=;
 b=ZdHftB4NKb4bpWNpEBnKWMTmGmnI53jOLRGw0ojN3cS4nrJuXUHeLmy3b4djBzUfNH
 Gaq2r1gg7NSXt2tTeIiPee4Ptq+705U0/VuXOs5x07EXBuEHCko5Ie3eqf221385VJ5a
 jYjnS+mrmkLTLzk72QiPQTZz1ldMY+HpQRoNTcnGMRURCW71bJnccUBiSD2S8ap3Z48d
 HwrJx7MHMSiimLBvK04piuNkQwuI88UXyQtPoKXhqI6lOigXUM8Oia4W+55UMsWAEaT8
 lHede7pN22D6g4lmDeSB7sGfaksu+UAxA/QhcPaIqgCJzOopnVWj4bhGyIqROioPLVQF
 XU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763991416; x=1764596216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69heBc7lxItVc7wNt1exM2CAHwdvZiFMjd3lDNLudqQ=;
 b=FULy0y38ltiieb2U0/ugZ9MNlbwz42LndWgksL8dpx2ordVqG1lzBvS8IielRg3b4h
 2zryfFAso1hyAqK9XX5foytaONo/u8lsa6cpEl+2xQY3wSzHwRU486g91SSzyZo38SmF
 WTYhISpYgn2Hj34Of1510KoQ6NtLTAup00iPEdnhIT4m1Hu0m1gL1s+raBx7iYjC3K5F
 w3JEFjgrz6nAhfdrIeybGltjAge9ZhLULtxAsGBFVODiy8LUX5sMzB+hQswAxEU+cRNX
 28MyKMznR9n3p6dtkTGC3XocWpx4fJLKM+XkkS6eUynb/18fSnI7X75i/C7HxaQhBJYy
 0KBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUicvgzKILG74iZKQcgpRCNGzz0UcKTZjcWWvmtonTjQjyuUqEZ/KQn1RkusAauIw7fK1Dzm/isELg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGe6TqE/Zb4z7861gjnt4K46Gou0n6WZhZ04jYH33T14GYrEGM
 NSGIamjJYjYKYbwJXLDkI9RNl8C7+tcl8ihuEye4gd822ZFXoJyBTzDK
X-Gm-Gg: ASbGncs4wh3XdM0wlk1jvvJijqPXENZ2soXx/QH0E3ZpGXZcAWHu/m3io2g/87fiXHg
 hoAb4Ey6P7LbV4JiMYgQBHrRvqj5ylaegaEaN1Yav5ylIEwt+gpurljVAmch4aD05YCTYa2yXbo
 5WKyJeSX4dLQDcMOAsP7CbhYuQ6L6NfV+AWVj9Z8ykmp2hDjQAWpmo/ZV3cA58XacJfWnGu42en
 2+Vs0cMCyT/UIhPQyr5NnYWcpcE9rvsXWYF5r+oYnNHRGOC+zvCryNPzqISS+ABfYQyBtjkFEPh
 ufGyvi+GbMkMrp7DU2n9EmQKQiH1a0pAeEGDlhJDTeYQhZyKJHmNZ79tftjvSjsX6HA8+duUs3A
 tUsG4Xwzh19wlBzBysl/65bVrV5iMh+LjZN7w52I+4dUfr40fpfZDKqlbrzy8z7yClwFAt0NlJ5
 lcG0lEX4lKQtcG9GoTru9Q
X-Google-Smtp-Source: AGHT+IG8VQwWoauvzDFbRHO/aVA7+5Mp7waCEC1xvbAJGyrpIlW5gSd8E1x6DOClV9RsbiV2xW4jVQ==
X-Received: by 2002:a17:90b:2f85:b0:340:be4d:a718 with SMTP id
 98e67ed59e1d1-34733e4a4eemr14390507a91.7.1763991415673; 
 Mon, 24 Nov 2025 05:36:55 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-345b04771e6sm8091573a91.8.2025.11.24.05.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 05:36:55 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, rostedt@goodmis.org,
 mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 mathieu.desnoyers@efficios.com, dhowells@redhat.com, kuba@kernel.org,
 brauner@kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH] dma-buf: add some tracepoints to debug.
Date: Mon, 24 Nov 2025 21:36:48 +0800
Message-Id: <20251124133648.72668-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Nov 2025 08:03:45 +0000
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

With these tracepoints, we can track dmabuf in real time.

For example:
   binder:3025_3-10524   [000] .....   553.310313: dma_buf_export: exp_name=qcom,system name=(null) size=12771328 ino=2799
   binder:3025_3-10524   [000] .....   553.310318: dma_buf_fd: exp_name=qcom,system name=(null) size=12771328 ino=2799 fd=8
    RenderThread-9307    [000] .....   553.310869: dma_buf_get: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799 fd=673 f_ref=4
    RenderThread-9307    [000] .....   553.310871: dma_buf_attach: dev_name=kgsl-3d0 exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
    RenderThread-9307    [000] .....   553.310946: dma_buf_mmap_internal: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
    RenderThread-9307    [004] .....   553.315084: dma_buf_detach: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
    RenderThread-9307    [004] .....   553.315084: dma_buf_put: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799 f_ref=5

Signed-off-by: gaoxiang17 <gaoxiang17@xiaomi.com>
---
 drivers/dma-buf/dma-buf.c      |  19 +++
 include/trace/events/dma_buf.h | 245 +++++++++++++++++++++++++++++++++
 2 files changed, 264 insertions(+)
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
index 000000000000..796ae444f6ae
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,245 @@
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
+	),
+
+	TP_fast_assign(
+		__assign_str(dname);
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+	),
+
+	TP_printk("dev_name=%s exp_name=%s name=%s size=%zu ino=%lu",
+		  __get_str(dname),
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino)
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
+		__field(long, f_ref)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = ((struct dma_buf *)file->private_data)->size;
+		__entry->ino = ((struct dma_buf *)file->private_data)->file->f_inode->i_ino;
+		__entry->fd = fd;
+		__entry->f_ref = file_ref_get(&file->f_ref);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_ref=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->fd,
+		  __entry->f_ref)
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
+		__field(long, f_ref)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_ref = file_ref_get(&dmabuf->file->f_ref);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_ref=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_ref)
+);
+
+#endif /* _TRACE_DMA_BUF_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.34.1

