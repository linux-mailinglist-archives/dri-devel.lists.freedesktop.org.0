Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3FEAC1723
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35C910E711;
	Thu, 22 May 2025 23:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Zd/6tm5o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883DD10E72F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:04:41 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-30eac9886ffso4584359a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747955081; x=1748559881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=0+t3s6SNOuCRN33iH3dGH+rCenT32waU3wVYkXXbO4I=;
 b=Zd/6tm5oF5R8BsIFDpIejea/rrHH75YEJSkZJFQ2v0BbK7pk9c10aXaphwYXwAMoIi
 8b5e/znMUHCxyIFn2atekcPLkOZjsqYEKugdguhlVKrkUdVDFDjAomlZ1jL9bphhgcll
 NKJDSBwynb6MFsgFqS8bMAcS4M619qpG5Z6PdZHZGu9dOZrZsYbPyZXaCGNEXrWc2Ieg
 CmdlZtWmatjokQeZIKM7/ksYz5J9L16z/ztzhLcee5agjlQPeDCdIt0/88ECf1/9doEU
 ZoNPSLHzBz01dhm3sYs0vjdgFQ6h9uVrEdgFm5VnxvmCpJ/3oFvxLzwGQn4ifEWdTsa2
 Jmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747955081; x=1748559881;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0+t3s6SNOuCRN33iH3dGH+rCenT32waU3wVYkXXbO4I=;
 b=KP/3FztNYaekh/Yx8+zyp4YEOhzskLYMtmrE7xMPE9rg//tmS/8a5rCCDs59K8dcYZ
 C0urm7s0JGPBLdXcg3NWy/MGHymMP2HRIXw/5mjzow7gQIOAivITEXPfvauK0S6ZkEvY
 aZ/AlIDb6D/r0TA+P8XhfXGwvCXGaEHwTVmd9Ob3hSMONIfUI1SC2i+5HxWsj9/yER3S
 DGbAGc8ZKkBtN2J88oHEmj/8SvTZOkDG7wAHeNbLiV5n0+pwN2iTxhHlfPO3ZjQK+YfG
 SHtjdODEiKA4t9Y+tC9hmkp6+ZW4heeoSuv4LQaOq4hHhTcMOOI8gF3Q2MItYMUF8kLH
 QNPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCEv29Qq/b5SKlLdo475J7A/UMp+so6dihsiqhdiTusuRrzw6N7y72Oe8ijVhEf9DeKrV9CovJ+sw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOXfuvQ2fdCZ+uh25D6LjMNPrNIPnE350owxCIlRIyqvCU20RM
 2yFLsCFBzMI6nTs2DwdLoWZcWVp3s+Hpo1eZyHMm8W9CqyVfpZniR2P3sEl5g9Fxt9VgHHpNPZC
 2p6Sd/HUD3vkh9Z/D2w==
X-Google-Smtp-Source: AGHT+IHc8w2C/hVYKlepeDUS+gdP6rU5PYG4tNWHgiwyi8QzNtjOhtc0Nria+4KwgjyX972SMuMRIqaspc+ap+w=
X-Received: from pjd15.prod.google.com ([2002:a17:90b:54cf:b0:308:861f:fddb])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b8c:b0:2ea:3f34:f18f with SMTP id
 98e67ed59e1d1-310e96e746bmr1139945a91.19.1747955081045; 
 Thu, 22 May 2025 16:04:41 -0700 (PDT)
Date: Thu, 22 May 2025 23:04:25 +0000
In-Reply-To: <20250522230429.941193-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250522230429.941193-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522230429.941193-2-tjmercier@google.com>
Subject: [PATCH bpf-next v7 1/5] dma-buf: Rename debugfs symbols
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

Rename the debugfs list and mutex so it's clear they are now usable
without the need for CONFIG_DEBUG_FS. The list will always be populated
to support the creation of a BPF iterator for dmabufs.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
 drivers/dma-buf/dma-buf.c | 40 +++++++++++++++------------------------
 include/linux/dma-buf.h   |  2 --
 2 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..8d151784e302 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,35 +35,25 @@
=20
 static inline int is_dma_buf_file(struct file *);
=20
-#if IS_ENABLED(CONFIG_DEBUG_FS)
-static DEFINE_MUTEX(debugfs_list_mutex);
-static LIST_HEAD(debugfs_list);
+static DEFINE_MUTEX(dmabuf_list_mutex);
+static LIST_HEAD(dmabuf_list);
=20
-static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
+static void __dma_buf_list_add(struct dma_buf *dmabuf)
 {
-	mutex_lock(&debugfs_list_mutex);
-	list_add(&dmabuf->list_node, &debugfs_list);
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_lock(&dmabuf_list_mutex);
+	list_add(&dmabuf->list_node, &dmabuf_list);
+	mutex_unlock(&dmabuf_list_mutex);
 }
=20
-static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
+static void __dma_buf_list_del(struct dma_buf *dmabuf)
 {
 	if (!dmabuf)
 		return;
=20
-	mutex_lock(&debugfs_list_mutex);
+	mutex_lock(&dmabuf_list_mutex);
 	list_del(&dmabuf->list_node);
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_list_mutex);
 }
-#else
-static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
-{
-}
-
-static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
-{
-}
-#endif
=20
 static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int bufle=
n)
 {
@@ -115,7 +105,7 @@ static int dma_buf_file_release(struct inode *inode, st=
ruct file *file)
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
=20
-	__dma_buf_debugfs_list_del(file->private_data);
+	__dma_buf_list_del(file->private_data);
=20
 	return 0;
 }
@@ -689,7 +679,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_exp=
ort_info *exp_info)
 	file->f_path.dentry->d_fsdata =3D dmabuf;
 	dmabuf->file =3D file;
=20
-	__dma_buf_debugfs_list_add(dmabuf);
+	__dma_buf_list_add(dmabuf);
=20
 	return dmabuf;
=20
@@ -1630,7 +1620,7 @@ static int dma_buf_debug_show(struct seq_file *s, voi=
d *unused)
 	size_t size =3D 0;
 	int ret;
=20
-	ret =3D mutex_lock_interruptible(&debugfs_list_mutex);
+	ret =3D mutex_lock_interruptible(&dmabuf_list_mutex);
=20
 	if (ret)
 		return ret;
@@ -1639,7 +1629,7 @@ static int dma_buf_debug_show(struct seq_file *s, voi=
d *unused)
 	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
 		   "size", "flags", "mode", "count", "ino");
=20
-	list_for_each_entry(buf_obj, &debugfs_list, list_node) {
+	list_for_each_entry(buf_obj, &dmabuf_list, list_node) {
=20
 		ret =3D dma_resv_lock_interruptible(buf_obj->resv, NULL);
 		if (ret)
@@ -1676,11 +1666,11 @@ static int dma_buf_debug_show(struct seq_file *s, v=
oid *unused)
=20
 	seq_printf(s, "\nTotal %d objects, %zu bytes\n", count, size);
=20
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_list_mutex);
 	return 0;
=20
 error_unlock:
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_list_mutex);
 	return ret;
 }
=20
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..8ff4add71f88 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -370,10 +370,8 @@ struct dma_buf {
 	 */
 	struct module *owner;
=20
-#if IS_ENABLED(CONFIG_DEBUG_FS)
 	/** @list_node: node for dma_buf accounting and debugging. */
 	struct list_head list_node;
-#endif
=20
 	/** @priv: exporter specific private data for this buffer object. */
 	void *priv;
--=20
2.49.0.1151.ga128411c76-goog

