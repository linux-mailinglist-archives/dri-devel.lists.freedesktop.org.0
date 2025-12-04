Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B3CA202F
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 01:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC7D10E1A4;
	Thu,  4 Dec 2025 00:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="o3Mm+f5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CED10E162
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 00:05:21 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-29845b18d1aso5604055ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 16:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764806720; x=1765411520;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tG99E2G74NBlCqMFEbuJyuFU682bdGjo6IlyusySJck=;
 b=o3Mm+f5fKAOHvWFODFqgBn5T1Dtfbfq4lH9tKxLK3aC+4B2Pxzht3IUn+jNGCnk1SX
 N+PsM7ZKUVSWowO0nNZy/rnTSOPnPT8lgLsV8TwUeTbQGg5cFX1qnE5Ha56mY27we2Aw
 9uKaxs2f+lDoDRDn8A3KKz+dvNP/D0x4v58dJFGJ5XUP7dBrUEhG6dB+8tLENlcEUcle
 Y4o7IwCJSWix19vY4w0IFGrf+7aoBXcEO9XLQdrl8lpCJJGeglrQ4GnRArczi6e+Um6q
 ZQbLPKNj706ppcPveXu2YZFhSEk3JWFf2938VMBVv6MwQtiAXG47VKvr6RXqMeAt9PAd
 2Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764806720; x=1765411520;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tG99E2G74NBlCqMFEbuJyuFU682bdGjo6IlyusySJck=;
 b=giF5w0SaaoWUtH3VczTUzJep3LD9ifLme6PHgWYNQvGz8WCH+XQMY1h0JepSUzkfOc
 3cO1Jp87/yqsmRCBANk7PMDVLO8uSQDsx7TLkH7NheM0Mo5IHOOrTtCgRXddDa08ADW9
 OtUXD9cHqCrxaMeGPoxw1Vk7bFmXGyOI6W+c2WyEA++myijOcRB4j08pWk+O8pq40b2K
 +14UuuUyAxcoa8kg4em564n4lvYtK8GshxdVWtFVlZSEEhB4jyYGKfQ2U405tzKq8pI2
 AS76zWlP+vVTa3skdEOnFGiR1ffdfgxZVw1PmsWwZGGCamGtjCM1z+hudKgCAnUfXWiq
 sxAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbZAQPaDKIEaVIg8CuH4Bnp+Sucn3NXXHn7F0Ggg64EcuCLPSw3keQyIH9h1nAjNUvxWIp5uX9Dqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz1m8HxHZTrUf2yV3S0cw55FwirwkYpzA9KCG0e/EbnsMl1z80
 Gr0VP8Ueycv2YTEpWmcQk8Rtlqxude5OhaYtSlQ2dC3Umh8PIMTLjPvxCstQKO6D6gN16fTAkD6
 B9An5EVCPGSQzIVhWeQ==
X-Google-Smtp-Source: AGHT+IGeC714EhBu/T29Z7FIKq0MljnotPa6j758d1YJabmaYRlvO/lv9fc69gFjzEtkHLe56aPYXjQBQYBtJtQ=
X-Received: from plbbb9.prod.google.com ([2002:a17:902:bc89:b0:29d:5afa:2c4])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e943:b0:296:5ea8:ed7c with SMTP id
 d9443c01a7336-29d68344bf3mr55170825ad.17.1764806720435; 
 Wed, 03 Dec 2025 16:05:20 -0800 (PST)
Date: Wed,  3 Dec 2025 16:03:47 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.177.g9f829587af-goog
Message-ID: <20251204000348.1413593-1-tjmercier@google.com>
Subject: [PATCH bpf 1/2] bpf: Fix truncated dmabuf iterator reads
From: "T.J. Mercier" <tjmercier@google.com>
To: yonghong.song@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 android-mm@google.com
Cc: christian.koenig@amd.com, sumit.semwal@linaro.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, "T.J. Mercier" <tjmercier@google.com>
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

If there is a large number (hundreds) of dmabufs allocated, the text
output generated from dmabuf_iter_seq_show can exceed common user buffer
sizes (e.g. PAGE_SIZE) necessitating multiple start/stop cycles to
iterate through all dmabufs. However the dmabuf iterator currently
returns NULL in dmabuf_iter_seq_start for all non-zero pos values, which
results in the truncation of the output before all dmabufs are handled.

After dma_buf_iter_begin / dma_buf_iter_next, the refcount of the buffer
is elevated so that the BPF iterator program can run without holding any
locks. When a stop occurs, instead of immediately dropping the reference
on the buffer, stash a pointer to the buffer in seq->priv until
either start is called or the iterator is released. This also enables
the resumption of iteration without first walking through the list of
dmabufs based on the pos value.

Fixes: 76ea95534995 ("bpf: Add dmabuf iterator")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 kernel/bpf/dmabuf_iter.c | 56 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index 4dd7ef7c145c..cd500248abd9 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -6,10 +6,33 @@
 #include <linux/kernel.h>
 #include <linux/seq_file.h>
 
+struct dmabuf_iter_priv {
+	/*
+	 * If this pointer is non-NULL, the buffer's refcount is elevated to
+	 * prevent destruction between stop/start. If reading is not resumed and
+	 * start is never called again, then dmabuf_iter_seq_fini drops the
+	 * reference when the iterator is released.
+	 */
+	struct dma_buf *dmabuf;
+};
+
 static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
 {
-	if (*pos)
-		return NULL;
+	struct dmabuf_iter_priv *p = seq->private;
+
+	if (*pos) {
+		struct dma_buf *dmabuf = p->dmabuf;
+
+		if (!dmabuf)
+			return NULL;
+
+		/*
+		 * Always resume from where we stopped, regardless of the value
+		 * of pos.
+		 */
+		p->dmabuf = NULL;
+		return dmabuf;
+	}
 
 	return dma_buf_iter_begin();
 }
@@ -54,8 +77,11 @@ static void dmabuf_iter_seq_stop(struct seq_file *seq, void *v)
 {
 	struct dma_buf *dmabuf = v;
 
-	if (dmabuf)
-		dma_buf_put(dmabuf);
+	if (dmabuf) {
+		struct dmabuf_iter_priv *p = seq->private;
+
+		p->dmabuf = dmabuf;
+	}
 }
 
 static const struct seq_operations dmabuf_iter_seq_ops = {
@@ -71,11 +97,27 @@ static void bpf_iter_dmabuf_show_fdinfo(const struct bpf_iter_aux_info *aux,
 	seq_puts(seq, "dmabuf iter\n");
 }
 
+static int dmabuf_iter_seq_init(void *priv, struct bpf_iter_aux_info *aux)
+{
+	struct dmabuf_iter_priv *p = (struct dmabuf_iter_priv *)priv;
+
+	p->dmabuf = NULL;
+	return 0;
+}
+
+static void dmabuf_iter_seq_fini(void *priv)
+{
+	struct dmabuf_iter_priv *p = (struct dmabuf_iter_priv *)priv;
+
+	if (p->dmabuf)
+		dma_buf_put(p->dmabuf);
+}
+
 static const struct bpf_iter_seq_info dmabuf_iter_seq_info = {
 	.seq_ops		= &dmabuf_iter_seq_ops,
-	.init_seq_private	= NULL,
-	.fini_seq_private	= NULL,
-	.seq_priv_size		= 0,
+	.init_seq_private	= dmabuf_iter_seq_init,
+	.fini_seq_private	= dmabuf_iter_seq_fini,
+	.seq_priv_size		= sizeof(struct dmabuf_iter_priv),
 };
 
 static struct bpf_iter_reg bpf_dmabuf_reg_info = {

base-commit: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
-- 
2.52.0.177.g9f829587af-goog

