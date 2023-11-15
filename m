Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054AA7EBF7C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 10:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A5F10E519;
	Wed, 15 Nov 2023 09:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550AB10E519
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 09:30:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso960840566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 01:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700040637; x=1700645437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=yB7Vx9jRhXPtu5tqEcLUYKJwFbScID9ZtZB3ZSvKBco=;
 b=UrdxjWKgNtsAxAwz2GrNgaYMABHaU/tuZ8RaEV3oasNzpH/pbn61bMwzoLIDaWtgKH
 Uhhgeb2S8FNNgo/USpMZ8GTpNZN51zQMpZo+T6KAyNpL+XH6jQ9S2XC6SkSZrZ2iIx9q
 O3A8RMMXyeJV5xFuyNAUe7gw0N1ks6KGexgk6oIV7bwpsUrAdOnGpAN2Uh1Otx4Lo2rs
 AUSgt6VTxLKmFDyuaxlrlpjYElKzfbL51zeng1O6qoecNp5UMCH3atAh/EtK3RrQn2j8
 KFAv+oXANWyf0oaWrnEW598HwobdiEOsKhOaqaEmJtg2OTkGGwhksZm7oyY4lmZHaf5L
 W98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700040637; x=1700645437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yB7Vx9jRhXPtu5tqEcLUYKJwFbScID9ZtZB3ZSvKBco=;
 b=BtKvP3Ca74OaR5tB+R19WN57hOtDBTYGEPtSlwPzzj0bj4l7Inx6BNL0OuYJPqRHxr
 vtpW2fGa/U2RTCCbqM3snhsWr1feqV+5K22G6GrOMq1nU5ARwuEUyWk1hn7erTzbo5Ke
 FtxpKRYi91r8B9FPiO0rla2mz4WS3+xqq/uofm20ddanwlXhPrlcyPtSuVXb8wuCkrwC
 n4/jJ15FLZEH38Kpf3T8uJGGNNay+8ZyBI0HCYhksmPG+EnssIQJWhVNyVcMyPajW6No
 0L/dnEFJfVf1hfcpKOWXESYkhrtfcJ3R3Z06eRbJZIBv1OZ1KIAL2S8hoBu0ogBBm13G
 Fmcw==
X-Gm-Message-State: AOJu0YxyG+aIicCFr9N7pjRArmBTunE5OYLI5lQ4OiQI7GUKc1KF+Av1
 xzNVciKj3ba9EEamAec23RjfiLHYZkw=
X-Google-Smtp-Source: AGHT+IGSUIO1vf/vS6SCJdIo3iWj+1ibt6jwIe6cS2Zz1J88lLlR4jPJ2yLG0oV0Crvhh3hBAPUrDQ==
X-Received: by 2002:a17:906:d14b:b0:9ad:7890:b4c0 with SMTP id
 br11-20020a170906d14b00b009ad7890b4c0mr7671598ejb.56.1700040636600; 
 Wed, 15 Nov 2023 01:30:36 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1581:a900:e649:e473:229b:cd53])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm6880255ejc.173.2023.11.15.01.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 01:30:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, faith.ekstrand@collabora.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: fix check in dma_resv_add_fence
Date: Wed, 15 Nov 2023 10:30:35 +0100
Message-Id: <20231115093035.1889-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

It's valid to add the same fence multiple times to a dma-resv object and
we shouldn't need one extra slot for each.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: a3f7c10a269d5 ("dma-buf/dma-resv: check if the new fence is really later")
Cc: stable@vger.kernel.org # v5.19+
---
 drivers/dma-buf/dma-resv.c |  2 +-
 include/linux/dma-fence.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 38b4110378de..eb8b733065b2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -301,7 +301,7 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 
 		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
 		if ((old->context == fence->context && old_usage >= usage &&
-		     dma_fence_is_later(fence, old)) ||
+		     dma_fence_is_later_or_same(fence, old)) ||
 		    dma_fence_is_signaled(old)) {
 			dma_resv_list_set(fobj, i, fence, usage);
 			dma_fence_put(old);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index ebe78bd3d121..b3772edca2e6 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -498,6 +498,21 @@ static inline bool dma_fence_is_later(struct dma_fence *f1,
 	return __dma_fence_is_later(f1->seqno, f2->seqno, f1->ops);
 }
 
+/**
+ * dma_fence_is_later_or_same - return true if f1 is later or same as f2
+ * @f1: the first fence from the same context
+ * @f2: the second fence from the same context
+ *
+ * Returns true if f1 is chronologically later than f2 or the same fence. Both
+ * fences must be from the same context, since a seqno is not re-used across
+ * contexts.
+ */
+static inline bool dma_fence_is_later_or_same(struct dma_fence *f1,
+					      struct dma_fence *f2)
+{
+	return f1 == f2 || dma_fence_is_later(f1, f2);
+}
+
 /**
  * dma_fence_later - return the chronologically later fence
  * @f1:	the first fence from the same context
-- 
2.34.1

