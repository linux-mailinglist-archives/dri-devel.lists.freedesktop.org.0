Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AB9E3F96
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEE410E4F6;
	Wed,  4 Dec 2024 16:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4ZcHpy+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D582B10E4F6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:27:04 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-434a9f9a225so60295e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 08:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733329623; x=1733934423;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4W1li+PQJAySFeW+G0OUEYywmlbqWEh+T217K5HBe5s=;
 b=4ZcHpy+YBi2qnZVFjK4Axx0e6Xrt8L+UC9R5c9QF0etqd5hb9XB1I++bJSRBodIBMU
 Hu4L5XOqETmiNSksXr5YEqEPA1lmGSY76yxJYZO3dl37p5RSie2HkYkWi1Fz43liIwuf
 BTsHy4+Y5lHW/kGGbySDzok9hvTrn4M8aktbauorf2Xm9X6cvYGv8cOCpg8XdSyx0PIP
 9lNhs3kBf3jxKoNCUWfRvfhNxRtyz4AvMExgWcq0w8cEuKp2FN+S8VqeQp0zGgmXqs3Q
 SJtZeWiS1ANFE0Ld5FlNLSJGc/CoY9Dlra/KCNIDOjkE6zFaOizMnT6TzBVZoXYBBYdH
 brZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733329623; x=1733934423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4W1li+PQJAySFeW+G0OUEYywmlbqWEh+T217K5HBe5s=;
 b=TTswdQN5yxM7vrQ5mIH7XxGJmtm5pz9qp/AIvpTJdfktRTDQo5ZH/ApET71gdAfBvF
 OFOZGYXi42BiNnbxMoDzQklmL3/LzmjcBJmY0S7t3X6kpwg8hQAMvRk9qXmmOUW/mjK7
 qyif6EY0gm3AWGemT9aPZrPIQ0HvEzd/pHazagtIKiqqTTY+vTGnliCRCyuj6qn+uTl+
 O79aWA2w/ZeedFqELWnC0CMLmWT9ILpwHHqgfHNUxBlEeK68bPX9J647zrZuSMtSYAjW
 Ai0TOOVZXQW5hCHRr02glD94YrhpEZULOx1XjseP4yXitC7o+u5dyA9VnyN7RSFzw8/C
 aeWg==
X-Gm-Message-State: AOJu0Yz2HlQFc8smBay1Kc6g+S3xRWUk4iCtSwzDCJxMKJpU267tYbHa
 2rc3bYldl6nqVHY+lWHFS/jX7ZzhurF2Iqkl5pYbGKq4ZzRDt7GHdWwuOFc8qQ==
X-Gm-Gg: ASbGncsPsQTLOvzNlwIWDD/EIqhAMgm0ogqg7e+p5obLvCFab8Mp75TuHyY1yHEpIqn
 scewckUJnI5BBmT6IMrbR5q5C0S86KbPtHujeDtX7PovTkePaNbY+rg3qoQKLLyCZSpBv+lGOc8
 DusD3I7YxhWHzIVFRdxD4ZjUG5JcDLsR4ksF3L/nU+0aybNAgtQ3fD0dJgJ9ryFJymgTYdVYXF/
 jVBrhab61Ho0cfjt2zlJXWGdqi0CSIc7Bs3eVA=
X-Google-Smtp-Source: AGHT+IFxTlGmGXtO+gti6IDe6nN/9i5MoY6EIkDL/S+U10Uwbut4N21TN5+9JMZjadgnuQEdINJ5lg==
X-Received: by 2002:a05:600c:138c:b0:434:9d76:5031 with SMTP id
 5b1f17b1804b1-434d52a1a87mr1200535e9.1.1733329622396; 
 Wed, 04 Dec 2024 08:27:02 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:4606:5fa1:8ade:6950])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e391656csm13529589f8f.47.2024.12.04.08.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 08:27:01 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 04 Dec 2024 17:26:21 +0100
Subject: [PATCH v2 3/3] udmabuf: fix memory leak on last export_udmabuf()
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-udmabuf-fixes-v2-3-23887289de1c@google.com>
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733329589; l=2920;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=mvwHL7Jb84Pbju4MjxbJaCZAU90KwtuuZ/LtjIuw+f8=;
 b=fcP3sbdyj//3/2F+j7CV5MfjiClV4Op+98VqArx+dvhb/6GkinHSzqeg9LJqzsq7iAU0UxgUh
 QpLwT4usxp1DhuRdSWGAKD7NSw4TKBtLSJfIgmMudebJ46OZuQdrIzb
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
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

In export_udmabuf(), if dma_buf_fd() fails because the FD table is full, a
dma_buf owning the udmabuf has already been created; but the error handling
in udmabuf_create() will tear down the udmabuf without doing anything about
the containing dma_buf.

This leaves a dma_buf in memory that contains a dangling pointer; though
that doesn't seem to lead to anything bad except a memory leak.

Fix it by moving the dma_buf_fd() call out of export_udmabuf() so that we
can give it different error handling.

Note that the shape of this code changed a lot in commit 5e72b2b41a21
("udmabuf: convert udmabuf driver to use folios"); but the memory leak
seems to have existed since the introduction of udmabuf.

Fixes: fbb0de795078 ("Add udmabuf misc device")
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index b330b99fcc7619a05bb7dc2aeeb9c82faf9a387b..cc7398cc17d67fca0634e763534901f8e6b454f8 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -317,12 +317,10 @@ static int check_memfd_seals(struct file *memfd)
 	return 0;
 }
 
-static int export_udmabuf(struct udmabuf *ubuf,
-			  struct miscdevice *device,
-			  u32 flags)
+static struct dma_buf *export_udmabuf(struct udmabuf *ubuf,
+				      struct miscdevice *device)
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
-	struct dma_buf *buf;
 
 	ubuf->device = device;
 	exp_info.ops  = &udmabuf_ops;
@@ -330,11 +328,7 @@ static int export_udmabuf(struct udmabuf *ubuf,
 	exp_info.priv = ubuf;
 	exp_info.flags = O_RDWR;
 
-	buf = dma_buf_export(&exp_info);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
-
-	return dma_buf_fd(buf, flags);
+	return dma_buf_export(&exp_info);
 }
 
 static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
@@ -391,6 +385,7 @@ static long udmabuf_create(struct miscdevice *device,
 	struct folio **folios = NULL;
 	pgoff_t pgcnt = 0, pglimit;
 	struct udmabuf *ubuf;
+	struct dma_buf *dmabuf;
 	long ret = -EINVAL;
 	u32 i, flags;
 
@@ -455,9 +450,20 @@ static long udmabuf_create(struct miscdevice *device,
 	}
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
-	ret = export_udmabuf(ubuf, device, flags);
-	if (ret < 0)
+	dmabuf = export_udmabuf(ubuf, device);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
 		goto err;
+	}
+	/*
+	 * Ownership of ubuf is held by the dmabuf from here.
+	 * If the following dma_buf_fd() fails, dma_buf_put() cleans up both the
+	 * dmabuf and the ubuf (through udmabuf_ops.release).
+	 */
+
+	ret = dma_buf_fd(dmabuf, flags);
+	if (ret < 0)
+		dma_buf_put(dmabuf);
 
 	kvfree(folios);
 	return ret;

-- 
2.47.0.338.g60cca15819-goog

