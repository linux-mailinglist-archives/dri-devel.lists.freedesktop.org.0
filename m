Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38534AB3F56
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 19:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5F410E461;
	Mon, 12 May 2025 17:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="H5X/T1n8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD9B10E461
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 17:40:59 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30a59538b17so4553809a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747071659; x=1747676459;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=xt8CAY1hcGS6Lny9EEFatzo77hxl+1XNQzM/j34oESs=;
 b=H5X/T1n8xlSbK4bF/SMiBOP5cHircvnppw+q+zGKxtNluQ/NK4lKv38eaIcXCv5FwK
 /bVgSWcNa4sRIUMGYcmNHa/RQ2oBKx8TMFEUxuZM5V1IpfDwEpRF+WNO7XGu8VxuNLgQ
 f08zwk/FTsPwaufQ7pLzvfW17egEVVyF4s376fPo3jJeX/QvBbEJBQxCvXlvkgT8P5cf
 MFukVLaIJ775zehU4rv6ZBGNMVvefs8wsW30qM2glt1l8M05XymXszpZQSCFmyRL27Ch
 ivTHSp8Zy/AI+NYWcX7hohDGydyvOo+rjy5xxBhc166U9/3z3SqPAUlaF0eWkiWnAoUZ
 h5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747071659; x=1747676459;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xt8CAY1hcGS6Lny9EEFatzo77hxl+1XNQzM/j34oESs=;
 b=CgA0B8eTv9ua6L0Z4nnjkoaBus6A7+pcOFXi5Ld7RFeJFY32YPoJjkjFGHAe2jF2tr
 GrTZKH5ssURJmaaW9UjDbeYwOlEzLYC7GgOKWYSc798O/OEpk0yxMMRFBUAD2HfG/6f3
 UEIzwf6bX/xyI0mc1nB6CcjeQ3SE/8tXGfPW8gzoNDGAL5M2HfbZlhV3/cWAf8jjqTdE
 E624K5o0UHKM8XQWfsFz+5rUH2ICS+kmUcn14IfubUTMC3R7iVQ4ZYD2LYsLubv6ZgDr
 CR9S0FulWfWvkELKus7jSJsu7L8L5i3sfFiVLtcuicOJTIXD4O58HJT+UnNFiF07OvE2
 Zo7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzx9AcIZpgWPDA4/ESqt9fMwZDLSRoib9xeLigwA7YwyIv0Lnz+yhI4dU6/BZiET/vpqDQc/+YI58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkMhoU9IMf41ehiG6BcENw/BjPpqwIxjSlIQ2osxg38nVgYL6I
 ylicPFZU8juGgA9kMvfZLm4Sr2iF85eVaga6ilZEm/vWYN3S0ei8a14q9zHlklLjaxba1gd0KTN
 FCgc02akj1kO1Bg==
X-Google-Smtp-Source: AGHT+IGSf3qT9YvheOr4I3XzP14hYOrPMaTHP/OGAQDR4qmiHA2sveVJ+nyVBauT4udhHi7fyZ4qbN95CQx57ik=
X-Received: from pjbsn16.prod.google.com ([2002:a17:90b:2e90:b0:2fa:15aa:4d2b])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2413:b0:30c:5617:7475 with SMTP id
 98e67ed59e1d1-30c5617928fmr14088307a91.18.1747071658988; 
 Mon, 12 May 2025 10:40:58 -0700 (PDT)
Date: Mon, 12 May 2025 17:40:34 +0000
In-Reply-To: <20250512174036.266796-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250512174036.266796-4-tjmercier@google.com>
Subject: [PATCH bpf-next v5 3/5] bpf: Add open coded dmabuf iterator
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

This open coded iterator allows for more flexibility when creating BPF
programs. It can support output in formats other than text. With an open
coded iterator, a single BPF program can traverse multiple kernel data
structures (now including dmabufs), allowing for more efficient analysis
of kernel data compared to multiple reads from procfs, sysfs, or
multiple traditional BPF iterator invocations.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
 kernel/bpf/dmabuf_iter.c | 48 ++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/helpers.c     |  5 +++++
 2 files changed, 53 insertions(+)

diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index 83ef54d78b62..4dd7ef7c145c 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -100,3 +100,51 @@ static int __init dmabuf_iter_init(void)
 }
=20
 late_initcall(dmabuf_iter_init);
+
+struct bpf_iter_dmabuf {
+	/*
+	 * opaque iterator state; having __u64 here allows to preserve correct
+	 * alignment requirements in vmlinux.h, generated from BTF
+	 */
+	__u64 __opaque[1];
+} __aligned(8);
+
+/* Non-opaque version of bpf_iter_dmabuf */
+struct bpf_iter_dmabuf_kern {
+	struct dma_buf *dmabuf;
+} __aligned(8);
+
+__bpf_kfunc_start_defs();
+
+__bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
+	BUILD_BUG_ON(__alignof__(*kit) !=3D __alignof__(*it));
+
+	kit->dmabuf =3D NULL;
+	return 0;
+}
+
+__bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *i=
t)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	if (kit->dmabuf)
+		kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
+	else
+		kit->dmabuf =3D dma_buf_iter_begin();
+
+	return kit->dmabuf;
+}
+
+__bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	if (kit->dmabuf)
+		dma_buf_put(kit->dmabuf);
+}
+
+__bpf_kfunc_end_defs();
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 78cefb41266a..39fe63016868 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -3346,6 +3346,11 @@ BTF_ID_FLAGS(func, bpf_iter_kmem_cache_next, KF_ITER=
_NEXT | KF_RET_NULL | KF_SLE
 BTF_ID_FLAGS(func, bpf_iter_kmem_cache_destroy, KF_ITER_DESTROY | KF_SLEEP=
ABLE)
 BTF_ID_FLAGS(func, bpf_local_irq_save)
 BTF_ID_FLAGS(func, bpf_local_irq_restore)
+#ifdef CONFIG_DMA_SHARED_BUFFER
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_new, KF_ITER_NEW | KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_next, KF_ITER_NEXT | KF_RET_NULL | KF_S=
LEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_destroy, KF_ITER_DESTROY | KF_SLEEPABLE=
)
+#endif
 BTF_KFUNCS_END(common_btf_ids)
=20
 static const struct btf_kfunc_id_set common_kfunc_set =3D {
--=20
2.49.0.1045.g170613ef41-goog

