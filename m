Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4003AB027F
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237BD10E94F;
	Thu,  8 May 2025 18:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="N+vTR2D9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6210E952
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 18:20:50 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30a8fc0ac84so1278042a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 11:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746728449; x=1747333249;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=j8rRBHMHk3l955gP5RCSBGHdN9fy4o3Irn9EK1cQXJU=;
 b=N+vTR2D9rmFvslKXXBl6No3WlQWOjMQnxCfpNkBZs6qKe+BRZMpY0ayYwGx6WLrKZW
 tAyXVR9VQLYE9Mhwek52vR0R3MCJk/L19kAoIgWhxSQY0/FHU8fLNLfe2FOM3idrHYA0
 eaFoazXj3HFK7K8nvbpd7MaocXUmIRYpnDfE4LwVYGBCSkrkkD5f8X67sJkjSW88kqRA
 9Koggzt2DNSutOU8r1TSFGxn6u57m0z4trAg1ERqL06cT2zxZeE8HN3PKboRCDVosk5x
 keSV31x4pNsVy0a6i1DTEO3T7zIonR0cpUF0sZkc9I/WOj5oZXns8uucDBhrg8iOTKm3
 2TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746728449; x=1747333249;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j8rRBHMHk3l955gP5RCSBGHdN9fy4o3Irn9EK1cQXJU=;
 b=XMcm6Q7yfImyyBcggwks8TCk4yhxf+HOoEV39TVs1vMc8G368O6Q67+VPs0qJ/+y7o
 9C1sEfq6uxdgxW/Oaj+gdIHxRY17Xhs3oLJGTX7PVS8E12469SayuhBJd3SeZyFFln9f
 A7oKCE2AZtoS+Cs/pfHYNDSB6zbn6eDuOKCRL/GyODFnM3zBrUY3a8NhwB3wZE0qDE12
 JiZvKDjepYTNvOUApGCPnwmTWf8Y+CIoTTXEYEWcvBVlK5qeuAghrYkQ4pmUtzTSbspZ
 CoshGE7cydGnWO0s5JNVxFmB6vDlpY2F5NVNAdfXPYI0tHejvZ1THHunh8S6U6Uu2Gv6
 I3aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlb7HDjAbdZu3lya1fYVrS0nwN8Hv6iiC4vQNLVOd5VF2WLSovcYAIudW3Q6hG1lp54ozd7zRs7S4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlKqXLg3mBhKo6ujJC12xQNZEDa4M6rmyHR9Ar1iGY8AxRjszy
 MXQtEP8pA7CxwKeh41iSqPhvSLC4Z4ov5waGyGQSAHxP1UzGifWxU8+bEqw1LtywFeBSQFiLxPy
 F52Vl9DuvLRURAw==
X-Google-Smtp-Source: AGHT+IF5O4pJZUDV3dye2FVwuoW2YooMLe6xtghEG8PaiVjgBWnEqJZ6Bl2vHK9VOrtDqNZKp86YPAQrtLaPgWA=
X-Received: from pjbst8.prod.google.com ([2002:a17:90b:1fc8:b0:2ff:5344:b54])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b0f:b0:301:a0e9:66f with SMTP id
 98e67ed59e1d1-30c3cff2d16mr859660a91.14.1746728449553; 
 Thu, 08 May 2025 11:20:49 -0700 (PDT)
Date: Thu,  8 May 2025 18:20:21 +0000
In-Reply-To: <20250508182025.2961555-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508182025.2961555-3-tjmercier@google.com>
Subject: [PATCH bpf-next v4 2/5] bpf: Add dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org, song@kernel.org, 
 "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c |  68 +++++++++++++++++++++++++
 include/linux/dma-buf.h   |   2 +
 kernel/bpf/Makefile       |   3 ++
 kernel/bpf/dmabuf_iter.c  | 102 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 175 insertions(+)
 create mode 100644 kernel/bpf/dmabuf_iter.c

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8d151784e302..6b59506a1b94 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -19,7 +19,9 @@
 #include <linux/anon_inodes.h>
 #include <linux/export.h>
 #include <linux/debugfs.h>
+#include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/seq_file.h>
 #include <linux/sync_file.h>
 #include <linux/poll.h>
@@ -55,6 +57,72 @@ static void __dma_buf_list_del(struct dma_buf *dmabuf)
 	mutex_unlock(&dmabuf_list_mutex);
 }
=20
+/**
+ * dma_buf_iter_begin - begin iteration through global list of all DMA buf=
fers
+ *
+ * Returns the first buffer in the global list of DMA-bufs that's not in t=
he
+ * process of being destroyed. Increments that buffer's reference count to
+ * prevent buffer destruction. Callers must release the reference, either =
by
+ * continuing iteration with dma_buf_iter_next(), or with dma_buf_put().
+ *
+ * Return:
+ * * First buffer from global list, with refcount elevated
+ * * NULL if no active buffers are present
+ */
+struct dma_buf *dma_buf_iter_begin(void)
+{
+	struct dma_buf *ret =3D NULL, *dmabuf;
+
+	/*
+	 * The list mutex does not protect a dmabuf's refcount, so it can be
+	 * zeroed while we are iterating. We cannot call get_dma_buf() since the
+	 * caller may not already own a reference to the buffer.
+	 */
+	mutex_lock(&dmabuf_list_mutex);
+	list_for_each_entry(dmabuf, &dmabuf_list, list_node) {
+		if (file_ref_get(&dmabuf->file->f_ref)) {
+			ret =3D dmabuf;
+			break;
+		}
+	}
+	mutex_unlock(&dmabuf_list_mutex);
+	return ret;
+}
+
+/**
+ * dma_buf_iter_next - continue iteration through global list of all DMA b=
uffers
+ * @dmabuf:	[in]	pointer to dma_buf
+ *
+ * Decrements the reference count on the provided buffer. Returns the next
+ * buffer from the remainder of the global list of DMA-bufs with its refer=
ence
+ * count incremented. Callers must release the reference, either by contin=
uing
+ * iteration with dma_buf_iter_next(), or with dma_buf_put().
+ *
+ * Return:
+ * * Next buffer from global list, with refcount elevated
+ * * NULL if no additional active buffers are present
+ */
+struct dma_buf *dma_buf_iter_next(struct dma_buf *dmabuf)
+{
+	struct dma_buf *ret =3D NULL;
+
+	/*
+	 * The list mutex does not protect a dmabuf's refcount, so it can be
+	 * zeroed while we are iterating. We cannot call get_dma_buf() since the
+	 * caller may not already own a reference to the buffer.
+	 */
+	mutex_lock(&dmabuf_list_mutex);
+	dma_buf_put(dmabuf);
+	list_for_each_entry_continue(dmabuf, &dmabuf_list, list_node) {
+		if (file_ref_get(&dmabuf->file->f_ref)) {
+			ret =3D dmabuf;
+			break;
+		}
+	}
+	mutex_unlock(&dmabuf_list_mutex);
+	return ret;
+}
+
 static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int bufle=
n)
 {
 	struct dma_buf *dmabuf;
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 8ff4add71f88..7af2ea839f58 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -634,4 +634,6 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_m=
ap *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
 int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map=
);
+struct dma_buf *dma_buf_iter_begin(void);
+struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf);
 #endif /* __DMA_BUF_H__ */
diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
index 70502f038b92..3a335c50e6e3 100644
--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
+ifeq ($(CONFIG_DMA_SHARED_BUFFER),y)
+obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
+endif
=20
 CFLAGS_REMOVE_percpu_freelist.o =3D $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_bpf_lru_list.o =3D $(CC_FLAGS_FTRACE)
diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
new file mode 100644
index 000000000000..96b4ba7f0b2c
--- /dev/null
+++ b/kernel/bpf/dmabuf_iter.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2025 Google LLC */
+#include <linux/bpf.h>
+#include <linux/btf_ids.h>
+#include <linux/dma-buf.h>
+#include <linux/kernel.h>
+#include <linux/seq_file.h>
+
+BTF_ID_LIST_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
+DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_buf *d=
mabuf)
+
+static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
+{
+	if (*pos)
+		return NULL;
+
+	return dma_buf_iter_begin();
+}
+
+static void *dmabuf_iter_seq_next(struct seq_file *seq, void *v, loff_t *p=
os)
+{
+	struct dma_buf *dmabuf =3D v;
+
+	++*pos;
+
+	return dma_buf_iter_next(dmabuf);
+}
+
+struct bpf_iter__dmabuf {
+	__bpf_md_ptr(struct bpf_iter_meta *, meta);
+	__bpf_md_ptr(struct dma_buf *, dmabuf);
+};
+
+static int __dmabuf_seq_show(struct seq_file *seq, void *v, bool in_stop)
+{
+	struct bpf_iter_meta meta =3D {
+		.seq =3D seq,
+	};
+	struct bpf_iter__dmabuf ctx =3D {
+		.meta =3D &meta,
+		.dmabuf =3D v,
+	};
+	struct bpf_prog *prog =3D bpf_iter_get_info(&meta, in_stop);
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
+	struct dma_buf *dmabuf =3D v;
+
+	if (dmabuf)
+		dma_buf_put(dmabuf);
+}
+
+static const struct seq_operations dmabuf_iter_seq_ops =3D {
+	.start	=3D dmabuf_iter_seq_start,
+	.next	=3D dmabuf_iter_seq_next,
+	.stop	=3D dmabuf_iter_seq_stop,
+	.show	=3D dmabuf_iter_seq_show,
+};
+
+static void bpf_iter_dmabuf_show_fdinfo(const struct bpf_iter_aux_info *au=
x,
+					struct seq_file *seq)
+{
+	seq_puts(seq, "dmabuf iter\n");
+}
+
+static const struct bpf_iter_seq_info dmabuf_iter_seq_info =3D {
+	.seq_ops		=3D &dmabuf_iter_seq_ops,
+	.init_seq_private	=3D NULL,
+	.fini_seq_private	=3D NULL,
+	.seq_priv_size		=3D 0,
+};
+
+static struct bpf_iter_reg bpf_dmabuf_reg_info =3D {
+	.target			=3D "dmabuf",
+	.feature                =3D BPF_ITER_RESCHED,
+	.show_fdinfo		=3D bpf_iter_dmabuf_show_fdinfo,
+	.ctx_arg_info_size	=3D 1,
+	.ctx_arg_info		=3D {
+		{ offsetof(struct bpf_iter__dmabuf, dmabuf),
+		  PTR_TO_BTF_ID_OR_NULL },
+	},
+	.seq_info		=3D &dmabuf_iter_seq_info,
+};
+
+static int __init dmabuf_iter_init(void)
+{
+	bpf_dmabuf_reg_info.ctx_arg_info[0].btf_id =3D bpf_dmabuf_btf_id[0];
+	return bpf_iter_reg_target(&bpf_dmabuf_reg_info);
+}
+
+late_initcall(dmabuf_iter_init);
--=20
2.49.0.1015.ga840276032-goog

