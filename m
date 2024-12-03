Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6E9E292A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8A010EAD5;
	Tue,  3 Dec 2024 17:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cGV3BBVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614A10EAD5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:26:51 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-434a9f9a225so56125e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 09:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733246810; x=1733851610;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/Vb9UXBOYsKi0pZ5x9hV4iMqdA2fMvrJ4pmauvo9ZZ8=;
 b=cGV3BBVFWql2JNekIhnwqxLVVScwmnUJXSBL5q7G93SKDnHfHvOrMPWh/xbDTbo1fo
 1yW+l9k6g3rz/IB3dJiutUm80ws5G1TDmf7yWIJo4CkMEv6fVfDFxpwc2mcowHOP4hI9
 mpp81QVMb6FtpIGhm9mKrg1J/nFgT+GHB6IEVDiDlh/VVRwdqUF6Y6+fgnbUTKwyj/yJ
 zhlrinDBvu+EUuKududiXrTXLygPwoEr1QVmtMWBGuzRBLxtUwpaG56jboyyfHlucVCv
 /vIxMw9g8DGVz5Mmic1HGtIoTO+LylhuVU9kWOeLx4xsSSyc+EotI+FL3Xv4ytTMe7c0
 0Zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733246810; x=1733851610;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Vb9UXBOYsKi0pZ5x9hV4iMqdA2fMvrJ4pmauvo9ZZ8=;
 b=dvWoBOURp1ZS4Dy1IHZFMRm/OSe1ue20A1fhsESBIVAvtqv/O5+h5XR1dYVNla6M6I
 MOYTl8er3lvYYTCJ4H9rHkyE2WtVlQbnKWaeTk9c23zkO08aE4QgLzL36x3a7qwiGhls
 Ulao3bAOuPw0YiIfZmIJXFeqLtGYeKuk2RuZgMu1ZtBwSWUMETUM77td2F30nkiH6PVO
 YjpcNaHt4Fjcidn+fA5w45i5+9KPn8VZM6OFXfLN0PZp1B6z+RTqKiYutXF2v+oZ1yXE
 kUggehvjNKFppxa/c+Ioy6MmoAUopTH0cLcwpB4JDCdtcqpbDYdeLIsRFrd2EycUWHk9
 CQ4g==
X-Gm-Message-State: AOJu0YyMG/QISEoJ2DLUciRjaQ66QJvbRqn6TBkI5gjXoDtHDzlFVk32
 HTwCQNh4njiOurs9YHwKqr2UA6xvb3mKeNnetYAFSFz7BZIIcRCc4h5g3Arnrg==
X-Gm-Gg: ASbGncsiLZNbqvOyLWuSiQZ3cnFtdPbdIMlWtLcAtfL0Xg2azA76JreYyadxNelZkhc
 rC/7QARjuxVLgVtmjxX6rSVXstjPXYScy4hhhGTx637NB+g6aUXzXKsAwsttSiRXqUwioOh4e4q
 vHJbks32v6ajcwpbLOOwvgSoFduq6i8vLhfTFFyjp3K+BPpgfFVttiA0Ed2/LtAGCN+IQryOsvR
 TYZ1HrXQPRPbXfbiKXz+diAa215vPB+7L8grkQ=
X-Google-Smtp-Source: AGHT+IH0TNX49DlvsUlDmYHqE+X/GJfm7kzNvuJYlH9rEpQHDfxMRPXJgjMqM5godm3e1PRO0SoeKQ==
X-Received: by 2002:a7b:cc83:0:b0:434:9d76:5031 with SMTP id
 5b1f17b1804b1-434d12b8d88mr1204505e9.1.1733246809511; 
 Tue, 03 Dec 2024 09:26:49 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:92ba:3294:39ee:2d61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0dbe4e6sm194671505e9.14.2024.12.03.09.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 09:26:49 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Tue, 03 Dec 2024 18:25:37 +0100
Subject: [PATCH 3/3] udmabuf: fix memory leak on last export_udmabuf()
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-udmabuf-fixes-v1-3-f99281c345aa@google.com>
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
In-Reply-To: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 John Stultz <john.stultz@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733246802; l=2748;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=d/SKaEARJ6M0/cu1G8obkYNjM7fgsn+zCy4/XdkuEqM=;
 b=X3evmweW4JuzseSHwdhP7RA4Pf8e6N5ueqNFDbhwq7nktyWWe+H3fxCMDbqjeNobSJ+OFwz4q
 CrhwTQWCO5HCdsMU7uLiRuWbk2eiWJ94PEjMmxwGvVbe3p9pYkPZ/mf
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
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8ce77f5837d71a73be677cad014e05f29706057d..aae0071be14a2c83a428b59ea9e905c7173232be 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -317,12 +317,11 @@ static int check_memfd_seals(struct file *memfd)
 	return 0;
 }
 
-static int export_udmabuf(struct udmabuf *ubuf,
-			  struct miscdevice *device,
-			  u32 flags)
+static struct dma_buf *export_udmabuf(struct udmabuf *ubuf,
+				      struct miscdevice *device,
+				      u32 flags)
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
-	struct dma_buf *buf;
 
 	ubuf->device = device;
 	exp_info.ops  = &udmabuf_ops;
@@ -330,11 +329,7 @@ static int export_udmabuf(struct udmabuf *ubuf,
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
@@ -391,6 +386,7 @@ static long udmabuf_create(struct miscdevice *device,
 	struct folio **folios = NULL;
 	pgoff_t pgcnt = 0, pglimit;
 	struct udmabuf *ubuf;
+	struct dma_buf *dmabuf;
 	long ret = -EINVAL;
 	u32 i, flags;
 
@@ -451,9 +447,16 @@ static long udmabuf_create(struct miscdevice *device,
 	}
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
-	ret = export_udmabuf(ubuf, device, flags);
-	if (ret < 0)
+	dmabuf = export_udmabuf(ubuf, device, flags);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
 		goto err;
+	}
+	/* ownership of ubuf is held by the dmabuf from here */
+
+	ret = dma_buf_fd(dmabuf, flags);
+	if (ret < 0)
+		dma_buf_put(dmabuf);
 
 	kvfree(folios);
 	return ret;

-- 
2.47.0.338.g60cca15819-goog

