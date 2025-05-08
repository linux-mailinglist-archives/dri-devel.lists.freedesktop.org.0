Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597BAAB0283
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B761610E952;
	Thu,  8 May 2025 18:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KC8iPp0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CDD10E957
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 18:20:53 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-22e3abea7e8so17029455ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 11:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746728453; x=1747333253;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OWA0exWT2PF9Bwdd6zODqvQVYBXl/Ht/Vugb+Sflr70=;
 b=KC8iPp0st1b1ggAhrcNqZdYj1jajbXYbhRPCIQt5eMkWSGbTY/F591CtzZTlif8n2I
 cfQnalsU6OuJ2S728HAL6/XBhQivz0Rh6L07eulYHhgHyDJ21Hfu20eBcYTbBHUM4kTo
 hi99P2Zrc1dIFcDVZSqv837w7mzo6f8nVmn43muDbDF5Ds8lqB+jJI5+xz2szKnnD6nB
 IaQLmAIB8WL6ULE5Y2kJTgVa+5Fhi/shhKpkd3L5TWesfTESK1hQ2cSgpcLXAyZeJKZ+
 GDFAW+eNmPJezrPzDKO31t2pGkDgWK8HVFBsaYMyrWi78zQwzI6EypfglwP3apV09SnH
 EJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746728453; x=1747333253;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWA0exWT2PF9Bwdd6zODqvQVYBXl/Ht/Vugb+Sflr70=;
 b=umLuki3jpSrNZADNgqr0NFRsKwW5sCsarWZIEIh7dZFhjDxObc+d34+tY77Y/9ZPtu
 kKCYPU+OATsHoG8X68dtpFL0IiCTpDf4oqKz0KrgnL8peMJLD2lG+g2Pyo+91bifqjsw
 SUknvYIPS0ahyd2OqO/Lfch802Wh5wnv8l95FWLldQZeX3dqiIGMX8TBJTsbSfSEj1b7
 3qlGdBgH7RFH6FA74NW8tq9A5NvdAPPxXwseLeDK0TkHnFZKUat4CHMJtx24++CsuLj3
 HZyLPruU0o2MrTPOLpKZFk3C1SV3Fi++PPpWC4kbgzsBA7Ek6E3t99hrPnBUBU2O2ttB
 X4qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU27SZBXoQMTmoBpwfVPMF5pvEDUlHmvK3+9Wb3SARZFFOSJVXdbl1IDZhaTDkok5+VfBpidct0Hug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtX+6gBRZJZilNtgVYn3xjqDqwFMb2H14WvQcZwOGBE5FHG3eJ
 e6d89uYQm1bViJHF1+jzLjxzviLlod7ovjH/MSqlnselsC5KYlRkliyIzeUTrlqU/btdk2/rH60
 w/O3wGGuzNeP1rg==
X-Google-Smtp-Source: AGHT+IEeAsbdgzwNcuStC5o0lsQE+GcpWguKPjE5+maPyPUAIOXS6rnVv8L8CoEgWNh3XZFUrNpQz3jUw6fJs5g=
X-Received: from plb16.prod.google.com ([2002:a17:903:4410:b0:22f:b333:1bd9])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecc2:b0:211:e812:3948 with SMTP id
 d9443c01a7336-22fc8946f85mr6138175ad.0.1746728453022; 
 Thu, 08 May 2025 11:20:53 -0700 (PDT)
Date: Thu,  8 May 2025 18:20:22 +0000
In-Reply-To: <20250508182025.2961555-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508182025.2961555-4-tjmercier@google.com>
Subject: [PATCH bpf-next v4 3/5] bpf: Add open coded dmabuf iterator
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
index 96b4ba7f0b2c..8049bdbc9efc 100644
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
+		kit->dmabuf = dma_buf_iter_next(kit->dmabuf);
+	else
+		kit->dmabuf = dma_buf_iter_begin();
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
2.49.0.1015.ga840276032-goog

