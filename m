Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF11A88F8B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 00:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487210E058;
	Mon, 14 Apr 2025 22:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="I2uElp2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4247910E058
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 22:53:08 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-2ff8340d547so4396279a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744671188; x=1745275988;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Te3lUbwZ2e402n8prt5NUot7zPEUxb8izsCNx6llZ0U=;
 b=I2uElp2nh+JotBjV5aIEtUtTT6Jh8b+WUrvDNSDgAGgEzQnPZBKfrnv1qInu3EOII/
 YIa6eWo2hM+rBr8t+OWZPxQGECg2rWsGdBeev5yZon9zhv2DmjyaPIVK3b2IwnDG3shw
 EokaN6ml0BTZrDAyHQS8uoJWrVKmgVFLpzjEfZjUbTG9zHOPWAGaBX8X4L+Po7Eunala
 LANAbmC87nggnBcC+A9Qu/BDDT+6/XYkZ7hbtPTdTyeAQevb1HjnH7egpmVgMwtl+F3q
 Y0rN9Pu1HNbkPobjeH3MGwC4qSLoxqn3SE3xb3tn3qaHbQ1Td1tS9lFcWLqMx8v29H5o
 D73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744671188; x=1745275988;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Te3lUbwZ2e402n8prt5NUot7zPEUxb8izsCNx6llZ0U=;
 b=nF3NkDT2oUZYzkeKc6g7bK9sDqqz5uOA+uXk0YM1WTCODgnKxF/kDm2CLebxHCUgrB
 DMPOMyZd7w3rPT/jHrkPOenZmwO03LruNQVJ6Z2lE5RGBExGlKxMSQuWBx4SAMUX5Qdr
 BamAkGh9g8Q5wsoNsRWHalBnU2oJi1ItXdqGPodYvkPZRmPaVQ78dshu26wsYwLu6J2+
 P7DyWZYedj7oi57w6TWeb2EVK0Sv4197qc5Xagk4qqZ4MT1rWYhrSSOqHtY782fElKFp
 rQitn5eZEl6qrM9JE8I1rlkYTT2G788Q1Y1WThfj3fm9jGzM4d4hPDvYTUqeNb4XeR6J
 KmVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfaHvI8lSHHaCf5BD8+eW0JEAAyM20eqC7HjaBLvWMhGsR6AeyeI19W9KLb5Ww5Mxl7ipXoAvmXSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2w8LvmwUMPkB/bytTH7tIsjQE/JpjIuED7L+ZL/+uZ5MORHBg
 lqOeB0HL6V+cdapGSMB4aDYhorfmIUdrrcmWTfSoc6MvsSkOrPytFzawvtSXnWKWnw7Y6lr5qvt
 SdzR/r5W9k8dZPQ==
X-Google-Smtp-Source: AGHT+IFby0+3fZ+dlbvnlnn/PuiXCtm12W3q3xJ1huaS9epNl9xvSzvIQXz19TFGLLtbJ8r7RNzWm6OwL70SRho=
X-Received: from pjvf15.prod.google.com ([2002:a17:90a:da8f:b0:2fc:2c9c:880])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d64e:b0:301:1bce:c252 with SMTP id
 98e67ed59e1d1-30823672e78mr19733269a91.27.1744671187842; 
 Mon, 14 Apr 2025 15:53:07 -0700 (PDT)
Date: Mon, 14 Apr 2025 22:52:25 +0000
In-Reply-To: <20250414225227.3642618-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414225227.3642618-3-tjmercier@google.com>
Subject: [PATCH 2/4] bpf: Add dmabuf iterator
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

The dmabuf iterator traverses the list of all DMA buffers. The list is
maintained only when CONFIG_DEBUG_FS is enabled.

DMA buffers are refcounted through their associated struct file. A
reference is taken on each buffer as the list is iterated to ensure each
buffer persists for the duration of the bpf program execution without
holding the list mutex.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 include/linux/btf_ids.h  |   1 +
 kernel/bpf/Makefile      |   3 +
 kernel/bpf/dmabuf_iter.c | 130 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 kernel/bpf/dmabuf_iter.c

diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
index 139bdececdcf..899ead57d89d 100644
--- a/include/linux/btf_ids.h
+++ b/include/linux/btf_ids.h
@@ -284,5 +284,6 @@ extern u32 bpf_cgroup_btf_id[];
 extern u32 bpf_local_storage_map_btf_id[];
 extern u32 btf_bpf_map_id[];
 extern u32 bpf_kmem_cache_btf_id[];
+extern u32 bpf_dmabuf_btf_id[];
 
 #endif
diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
index 70502f038b92..5b30d37ef055 100644
--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) += relo_core.o
 obj-$(CONFIG_BPF_SYSCALL) += btf_iter.o
 obj-$(CONFIG_BPF_SYSCALL) += btf_relocate.o
 obj-$(CONFIG_BPF_SYSCALL) += kmem_cache_iter.o
+ifeq ($(CONFIG_DEBUG_FS),y)
+obj-$(CONFIG_BPF_SYSCALL) += dmabuf_iter.o
+endif
 
 CFLAGS_REMOVE_percpu_freelist.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_bpf_lru_list.o = $(CC_FLAGS_FTRACE)
diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
new file mode 100644
index 000000000000..b4b8be1d6aa4
--- /dev/null
+++ b/kernel/bpf/dmabuf_iter.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2025 Google LLC */
+#include <linux/bpf.h>
+#include <linux/btf_ids.h>
+#include <linux/dma-buf.h>
+#include <linux/kernel.h>
+#include <linux/seq_file.h>
+
+BTF_ID_LIST_GLOBAL_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
+DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_buf *dmabuf)
+
+static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
+{
+	struct dma_buf *dmabuf, *ret = NULL;
+
+	if (*pos) {
+		*pos = 0;
+		return NULL;
+	}
+	/* Look for the first buffer we can obtain a reference to.
+	 * The list mutex does not protect a dmabuf's refcount, so it can be
+	 * zeroed while we are iterating. Therefore we cannot call get_dma_buf()
+	 * since the caller of this program may not already own a reference to
+	 * the buffer.
+	 */
+	mutex_lock(&dmabuf_debugfs_list_mutex);
+	list_for_each_entry(dmabuf, &dmabuf_debugfs_list, list_node) {
+		if (file_ref_get(&dmabuf->file->f_ref)) {
+			ret = dmabuf;
+			break;
+		}
+	}
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
+
+	return ret;
+}
+
+static void *dmabuf_iter_seq_next(struct seq_file *seq, void *v, loff_t *pos)
+{
+	struct dma_buf *dmabuf = v, *ret = NULL;
+
+	++*pos;
+
+	mutex_lock(&dmabuf_debugfs_list_mutex);
+	dma_buf_put(dmabuf);
+	while (!list_is_last(&dmabuf->list_node, &dmabuf_debugfs_list)) {
+		dmabuf = list_next_entry(dmabuf, list_node);
+		if (file_ref_get(&dmabuf->file->f_ref)) {
+			ret = dmabuf;
+			break;
+		}
+	}
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
+
+	return ret;
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
2.49.0.604.gff1f9ca942-goog

