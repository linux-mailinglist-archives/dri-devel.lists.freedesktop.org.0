Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FBFAAD1E6
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 02:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F2210E35D;
	Wed,  7 May 2025 00:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ld7WhJW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA2310E35D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 00:10:50 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-22e033b0f1aso54528635ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746576650; x=1747181450;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SkxID+WP7mb4sg4ZUV6PaZg3RytzLGPGnjFriQZ17Hk=;
 b=ld7WhJW+0UPcL8g0dOkkoZVja/cgXGUFBMHGR+67PUDjMvgXphqrnGwTIre5sd5fxL
 O5fAqVqbjVUFphTJ70tEKNj5xzOcumwUt8B53NO0ZQdGrWtuoI583JSr1AFMvKPCkB7H
 4gxFYX4eE9jff0t2qTT7yWdli5ckTwWYNWogDzgDNhIoWML0sRcJ0QyLEo+R1PgzcQbe
 xHIUTSCoK2GeNeK+mh65O1gmImgGQvjbaDdVf2wNJIQPTg4I+4T0WM7zeDC9W1I3w1uo
 VVZCQqPE+eWCjNdMkY+QsqGNNLTkJARHfQYZRzm7MfVFw180F2uy+lrw4bQyTTea+YYv
 5QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746576650; x=1747181450;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SkxID+WP7mb4sg4ZUV6PaZg3RytzLGPGnjFriQZ17Hk=;
 b=aW779yotKthwPRGUwVeSI2NC3I8hC0QdJVepAkLkv3SrwF048kOQDsSEaPn0McPeEI
 UvsghBDc6rbRf5KEC+6HFn9tv1pFfI0gzNBlyvPLECRsAaZ24KQ3QsAcEQhHtLJeCCD9
 X26XMQZlbwNC/ImsObqBfDKA/dxlkXZZHp+H5aHiBvWorbC/SPobWyra/z//WMC+zAd5
 OEnkptwD4ynMinfCi3PrIOzg/gD0toKPvcylTq7xSQh2vqG3n/kGU3DPcX4bsrkMUOJw
 fhhK3KRwoE91WTovrAi6RZrvkPn6u4xCzskdlIlCsclVgN1kIqzGv5TsXnJBgFbZose9
 NZFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj3cJ0rKdczYiu5/5njZMjP0uzokNoy3FQ0SJwpojyoHU7gzj93lG+EkIeX9bCei+pDNgNTKMFiCY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKuYYqOvvpyVYvmK9hou/3vAhs4+vpAO1NybUDe00cftD3jDFW
 usjLqsjLipNjJpMZ49Cyq6LuYTozB7fZxhuAjNVIQM+EuRldhJ2KnMBMPnxdnMFjyvInlrEleLu
 TM+zxSX7VJbe0vw==
X-Google-Smtp-Source: AGHT+IEx7hDcQzk8ELF2Wf/YDX+04BAayFsjqz8ketxueOqk4IMFJhrgD4+bT2AOspb/6AKarjrhAJ8dHZy5bPA=
X-Received: from pjbsi7.prod.google.com ([2002:a17:90b:5287:b0:2fb:fa85:1678])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecc6:b0:22e:1740:e561 with SMTP id
 d9443c01a7336-22e5ea501ccmr19570925ad.19.1746576649869; 
 Tue, 06 May 2025 17:10:49 -0700 (PDT)
Date: Wed,  7 May 2025 00:10:34 +0000
In-Reply-To: <20250507001036.2278781-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250507001036.2278781-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250507001036.2278781-4-tjmercier@google.com>
Subject: [PATCH bpf-next v3 3/5] bpf: Add open coded dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, song@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
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

This open coded iterator allows for more flexibility when creating BPF
programs. It can support output in formats other than text. With an open
coded iterator, a single BPF program can traverse multiple kernel data
structures (now including dmabufs), allowing for more efficient analysis
of kernel data compared to multiple reads from procfs, sysfs, or
multiple traditional BPF iterator invocations.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 kernel/bpf/dmabuf_iter.c | 47 ++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/helpers.c     |  5 +++++
 2 files changed, 52 insertions(+)

diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index 80bca8239c6d..b0478b4875ed 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -100,3 +100,50 @@ static int __init dmabuf_iter_init(void)
 }
 
 late_initcall(dmabuf_iter_init);
+
+struct bpf_iter_dmabuf {
+	/* opaque iterator state; having __u64 here allows to preserve correct
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
+	struct bpf_iter_dmabuf_kern *kit = (void *)it;
+
+	BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
+	BUILD_BUG_ON(__alignof__(*kit) != __alignof__(*it));
+
+	kit->dmabuf = NULL;
+	return 0;
+}
+
+__bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit = (void *)it;
+
+	if (kit->dmabuf)
+		kit->dmabuf = get_next_dmabuf(kit->dmabuf);
+	else
+		kit->dmabuf = get_first_dmabuf();
+
+	return kit->dmabuf;
+}
+
+__bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit = (void *)it;
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
@@ -3346,6 +3346,11 @@ BTF_ID_FLAGS(func, bpf_iter_kmem_cache_next, KF_ITER_NEXT | KF_RET_NULL | KF_SLE
 BTF_ID_FLAGS(func, bpf_iter_kmem_cache_destroy, KF_ITER_DESTROY | KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_local_irq_save)
 BTF_ID_FLAGS(func, bpf_local_irq_restore)
+#ifdef CONFIG_DMA_SHARED_BUFFER
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_new, KF_ITER_NEW | KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_next, KF_ITER_NEXT | KF_RET_NULL | KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_destroy, KF_ITER_DESTROY | KF_SLEEPABLE)
+#endif
 BTF_KFUNCS_END(common_btf_ids)
 
 static const struct btf_kfunc_id_set common_kfunc_set = {
-- 
2.49.0.1045.g170613ef41-goog

