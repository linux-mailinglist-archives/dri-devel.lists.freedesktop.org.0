Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EEEAA89C8
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 00:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2647F10E0FC;
	Sun,  4 May 2025 22:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fmCx1c2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com
 [209.85.215.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EC010E0D5
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 22:42:44 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-af5156fbe79so4555463a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746398559; x=1747003359;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=i4UiHJytqyMBjkMUe4jiF7RJR+rLd9EB5rxLuUC9nlM=;
 b=fmCx1c2x21lcNxjKEaDxIjHYWmsfhNPMQZ5GExreykBXVybm6yCOSmCWGcfU3dTBlJ
 O2CuGUc0GBivC3cWtOtQWwVUu17C4hrrVYkdD703kVbiyO9cFxR6x4951SZ9D3f3MWcm
 25qTDWneN4SoxLJVVIoQwLJlMSrXhOOYEkfXHgRQ8e1uiyXAoawIjPW5L38syZo7oIWu
 9wck9//Hrgkny+NAO3v4WATz5DJ2H024D0u5HMoLF6j5nhCoPG9Aa+w7Hp/VRwTvQXXs
 OkT5jwihKfdjnuBPlVf/kyjqZ6FbIbRHJUD1r0oNwM4gj3RhEhTOR89h5EuhMPDOyKME
 nxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746398559; x=1747003359;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4UiHJytqyMBjkMUe4jiF7RJR+rLd9EB5rxLuUC9nlM=;
 b=aV0EW6TInHoNu4hR8do2SsHjJz4yV1hy8CcczKqjhXvdv+o2EUEWtlyhrk9at7SFlm
 UXMDyy89YmtWj4qEpYRB9ZcU7kW/F8+xi59GHUOteLortX7OZA+CtpZxFh1vhODpkIq3
 k54D8Y74YMWWcguN5PlScwb+1GxUYdgBzixDhY2V+w1wsPGCDs+di5YfBhI5q1qBt4FZ
 D9eR+PpaZBfkjOjOpTsnFJMtCTCH2lxjPrFw2cB2DJ47b2NhCLFktAKcycyAq7BdBZaz
 r3W3NOcvX+cOfem/Tf6Alp2GsnYOi+jfRanCQHN7cO+H6Q5sCibvyDVYsnryeMUkJuuM
 DbKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX83Vie0i5kHgu5BYYnukSIe9/XcHrn/UVzVEdCV4HPpZ88clKOCqy0PTbnY7KCy0dhSfk4V+gqedM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySiEt4k4ViUewcqGbkbhHA0ThWIzvnXDDi3C7FqvV9SQXrTgru
 5yl4S7COUaslU4lsDGZBK1gEw9c9ygXJTzdohY7tkdCaaQH1APf9Z1nwiZmdWtRYtkPOK2kT3Vi
 Glbq363VA6E1+Pg==
X-Google-Smtp-Source: AGHT+IHpmxI7uk2byAzLuOwzl/LvQ35S8UNuCQgWihS4iwBUZaso+FHslC8sl609nY7YVNmyP5x9fzMsax0/eCE=
X-Received: from pjxx6.prod.google.com ([2002:a17:90b:58c6:b0:301:4260:4d23])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f0e:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30a619769b0mr8600818a91.9.1746398558977; 
 Sun, 04 May 2025 15:42:38 -0700 (PDT)
Date: Sun,  4 May 2025 22:41:38 +0000
In-Reply-To: <20250504224149.1033867-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250504224149.1033867-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504224149.1033867-3-tjmercier@google.com>
Subject: [PATCH v2 2/6] bpf: Add dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, song@kernel.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
 corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
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

The dmabuf iterator traverses the list of all DMA buffers.

DMA buffers are refcounted through their associated struct file. A
reference is taken on each buffer as the list is iterated to ensure each
buffer persists for the duration of the bpf program execution without
holding the list mutex.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 kernel/bpf/Makefile      |   3 +
 kernel/bpf/dmabuf_iter.c | 134 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 kernel/bpf/dmabuf_iter.c

diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
index 70502f038b92..3a335c50e6e3 100644
--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) += relo_core.o
 obj-$(CONFIG_BPF_SYSCALL) += btf_iter.o
 obj-$(CONFIG_BPF_SYSCALL) += btf_relocate.o
 obj-$(CONFIG_BPF_SYSCALL) += kmem_cache_iter.o
+ifeq ($(CONFIG_DMA_SHARED_BUFFER),y)
+obj-$(CONFIG_BPF_SYSCALL) += dmabuf_iter.o
+endif
 
 CFLAGS_REMOVE_percpu_freelist.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_bpf_lru_list.o = $(CC_FLAGS_FTRACE)
diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
new file mode 100644
index 000000000000..968762e11f73
--- /dev/null
+++ b/kernel/bpf/dmabuf_iter.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2025 Google LLC */
+#include <linux/bpf.h>
+#include <linux/btf_ids.h>
+#include <linux/dma-buf.h>
+#include <linux/kernel.h>
+#include <linux/seq_file.h>
+
+BTF_ID_LIST_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
+DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_buf *dmabuf)
+
+static struct dma_buf *get_next_dmabuf(struct dma_buf *dmabuf)
+{
+	struct dma_buf *ret = NULL;
+
+	/*
+	 * Look for the first/next buffer we can obtain a reference to.
+	 *
+	 * The list mutex does not protect a dmabuf's refcount, so it can be
+	 * zeroed while we are iterating. We cannot call get_dma_buf() since the
+	 * caller of this program may not already own a reference to the buffer.
+	 */
+	mutex_lock(&dmabuf_list_mutex);
+	if (dmabuf) {
+		dma_buf_put(dmabuf);
+		list_for_each_entry_continue(dmabuf, &dmabuf_list, list_node) {
+			if (file_ref_get(&dmabuf->file->f_ref)) {
+				ret = dmabuf;
+				break;
+			}
+		}
+	} else {
+		list_for_each_entry(dmabuf, &dmabuf_list, list_node) {
+			if (file_ref_get(&dmabuf->file->f_ref)) {
+				ret = dmabuf;
+				break;
+			}
+		}
+	}
+	mutex_unlock(&dmabuf_list_mutex);
+	return ret;
+}
+
+static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
+{
+	if (*pos)
+		return NULL;
+
+	return get_next_dmabuf(NULL);
+}
+
+static void *dmabuf_iter_seq_next(struct seq_file *seq, void *v, loff_t *pos)
+{
+	struct dma_buf *dmabuf = v;
+
+	++*pos;
+
+	return get_next_dmabuf(dmabuf);
+}
+
+struct bpf_iter__dmabuf {
+	__bpf_md_ptr(struct bpf_iter_meta *, meta);
+	__bpf_md_ptr(struct dma_buf *, dmabuf);
+};
+
+static int __dmabuf_seq_show(struct seq_file *seq, void *v, bool in_stop)
+{
+	struct bpf_iter_meta meta = {
+		.seq = seq,
+	};
+	struct bpf_iter__dmabuf ctx = {
+		.meta = &meta,
+		.dmabuf = v,
+	};
+	struct bpf_prog *prog = bpf_iter_get_info(&meta, in_stop);
+
+	if (prog)
+		return bpf_iter_run_prog(prog, &ctx);
+
+	return 0;
+}
+
+static int dmabuf_iter_seq_show(struct seq_file *seq, void *v)
+{
+	return __dmabuf_seq_show(seq, v, false);
+}
+
+static void dmabuf_iter_seq_stop(struct seq_file *seq, void *v)
+{
+	struct dma_buf *dmabuf = v;
+
+	if (dmabuf)
+		dma_buf_put(dmabuf);
+}
+
+static const struct seq_operations dmabuf_iter_seq_ops = {
+	.start	= dmabuf_iter_seq_start,
+	.next	= dmabuf_iter_seq_next,
+	.stop	= dmabuf_iter_seq_stop,
+	.show	= dmabuf_iter_seq_show,
+};
+
+static void bpf_iter_dmabuf_show_fdinfo(const struct bpf_iter_aux_info *aux,
+					struct seq_file *seq)
+{
+	seq_puts(seq, "dmabuf iter\n");
+}
+
+static const struct bpf_iter_seq_info dmabuf_iter_seq_info = {
+	.seq_ops		= &dmabuf_iter_seq_ops,
+	.init_seq_private	= NULL,
+	.fini_seq_private	= NULL,
+	.seq_priv_size		= 0,
+};
+
+static struct bpf_iter_reg bpf_dmabuf_reg_info = {
+	.target			= "dmabuf",
+	.feature                = BPF_ITER_RESCHED,
+	.show_fdinfo		= bpf_iter_dmabuf_show_fdinfo,
+	.ctx_arg_info_size	= 1,
+	.ctx_arg_info		= {
+		{ offsetof(struct bpf_iter__dmabuf, dmabuf),
+		  PTR_TO_BTF_ID_OR_NULL },
+	},
+	.seq_info		= &dmabuf_iter_seq_info,
+};
+
+static int __init dmabuf_iter_init(void)
+{
+	bpf_dmabuf_reg_info.ctx_arg_info[0].btf_id = bpf_dmabuf_btf_id[0];
+	return bpf_iter_reg_target(&bpf_dmabuf_reg_info);
+}
+
+late_initcall(dmabuf_iter_init);
-- 
2.49.0.906.g1f30a19c02-goog

