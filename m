Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC144AC1722
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FA710E72F;
	Thu, 22 May 2025 23:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4iOBAKRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com
 [209.85.215.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD19810E711
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:04:44 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-b26e38174e5so8337749a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747955084; x=1748559884;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=G/g8JyMw2VwyJ/m9TjS/SiUKpJwsf5OkBbH7oNpMPS0=;
 b=4iOBAKRntQd6VFp6TdVw2rJ3fXz+FQNobbCvgpZFGGN+LqEmwRk7+iqYUhEGgZlHa5
 F66NZVXOUzIC0wNSaD66BoV3knXdNsh+/e2pV0ZCXYBrhZQhiUk7msYp1wgqzSjdpX+t
 X/s0rgGp8+GzLZ3YuPd6ku/9RDWNxQ4qfeqKN0R8Fsalm1/TYOwGPqQR0KqFt2pXqcRn
 y1CI49LIMaCGMW2kK8ph3TRkf263u9jd4K4BWLYq+IPcosHYf8P7WT5No2GEIykxw0oJ
 fDhn7/UnoST9bMeu/Ti7DaSE00lK+QMqCaE3t8PL+QUPdtnnjgI9EkPjNR0t6m2XwoRM
 ZOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747955084; x=1748559884;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=G/g8JyMw2VwyJ/m9TjS/SiUKpJwsf5OkBbH7oNpMPS0=;
 b=Kh7gGlFR6n4GLqPT6LZjENg0cUsHXUtmxUmhoANwRUGsQ4Mngfsi8FNuG+4rMmn2ue
 W1bEXLAn/3LqWV7IO1NRfbrmf9hl2KmySPS2Ps+t8EQPK0KVlS9Z8tjFJL9Xon4tx9Qz
 KQhAonNLSnabJaSu3b+3BQFRiNlWulMzcuo9It7E1+ihr2MSiWyMXLSJaAYKEEWtemZN
 HMFFB5Xwhv2XWov5WURw8llH5T6Luth7+Jap9mhXzZh6j/+YGeDgNs7BPHmpHzyhRx1w
 R6J0hx+qYXIz6ISXWj0OxUnnKTwPLSbki/OtTuFHjicPkOpvbl1/5FjFUort7X4xPsAc
 R97g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC3xZdb11Kxi1YjLr9diCKzdZyHkETg5iHkGp06nu3Y44wfOU+7KHNuVaW8kKkdSRER9wgo8JZSYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0NS8zk89YcTcPVYTuA997BKaL9S5B5gjkYn+sf4U9F//SngoC
 UggOECPt2U5P0doBz0RgupeflIAo7K3jlWelOTsAupypKjVFs+dHhYQ37BZy8lN/szd2J3shiln
 T5KmvaRf1XnC7u/z+Yw==
X-Google-Smtp-Source: AGHT+IFHuZm2aKEEnirqMLyqXI/q0B8Co6Lr8MSquOHmj/BaEI70fa0f5cgugQZD5uKAyXECH9AT3FapY42Phlk=
X-Received: from pjf6.prod.google.com ([2002:a17:90b:3f06:b0:2ea:9d23:79a0])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3905:b0:30e:9349:2d93 with SMTP id
 98e67ed59e1d1-310e972b4famr1252004a91.28.1747955084272; 
 Thu, 22 May 2025 16:04:44 -0700 (PDT)
Date: Thu, 22 May 2025 23:04:27 +0000
In-Reply-To: <20250522230429.941193-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250522230429.941193-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522230429.941193-4-tjmercier@google.com>
Subject: [PATCH bpf-next v7 3/5] bpf: Add open coded dmabuf iterator
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
index c1113b74e1e2..bd17ed5bfc4b 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -3386,6 +3386,11 @@ BTF_ID_FLAGS(func, bpf_copy_from_user_dynptr, KF_SLE=
EPABLE)
 BTF_ID_FLAGS(func, bpf_copy_from_user_str_dynptr, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_copy_from_user_task_dynptr, KF_SLEEPABLE | KF_TRUST=
ED_ARGS)
 BTF_ID_FLAGS(func, bpf_copy_from_user_task_str_dynptr, KF_SLEEPABLE | KF_T=
RUSTED_ARGS)
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
2.49.0.1151.ga128411c76-goog

