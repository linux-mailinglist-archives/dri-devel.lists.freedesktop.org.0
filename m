Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF09C5752
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 13:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823FD10E5CD;
	Tue, 12 Nov 2024 12:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ne0cAnUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C3210E307
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 12:07:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so52953425e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 04:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731413269; x=1732018069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tisxu7LPkUEby4IG0GZi8PaScjmqs9tDf8j8yOelypQ=;
 b=ne0cAnUcCbKR3ihTwCk9ADLbdbji+v02sRaP8LeeA1yOwAzrh2mKoZvqJxHhSSrcjK
 /gK83iCZ6OGp9D6wmMWP/D8oOyK8KB/DkKX9kVK+lPo14DjWd7qtHYzrZNDJad1ywocM
 voT1xD+0TP4SC7G2DdOgCQpKgOVT08rTTvesuf4xHcYpGGACO0RnXQ1Y1LgUbGRdxJce
 +QmnxZHMS9IiZaz5NYhhRURjQXKfEl9cbBVJ1KEvS83g9RbQddN+zI8gM6rnxIpNL40o
 2QNuL8MDFmu55ecqJv+1zOT5zEpY8J6VAGKljbDF10Gu7OQ7Tqs6Mb5JCCdWL720TGDs
 JKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731413269; x=1732018069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tisxu7LPkUEby4IG0GZi8PaScjmqs9tDf8j8yOelypQ=;
 b=iQaDIFzpZDKK+P71898z7PLX96BrnX5u+Gt8kZ0Q46P6EDCVqEHyf3Lsyt6dQ9b2aO
 goA2Ul/E5ozpLUCtRpsO+HZ/xyXo06gKW3t97EIXO85ReJgzzUoBc41mVpb2kX8Fwabi
 mMBLVxyGJHgTeFxlwcvj15enA+7KSFTi/DAN5uIlGImeCzTZu8ASIRP2DEs50Z68Q8tj
 e13QC9MltBxwlb21qMk3FpHyyZ2juQ9ynjD1QxvzqLNL22YxYuHe4X5LoMCfc/U2IVQK
 B7SjI8qlvTT8RhEE5TMZ7d0f9GdYzwTOPaqxdsKR8RzUeU7+YCeTQmqugORPUy47RJgh
 F/eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDjQEQpk1cfuhVgDYzEPkrtPsVCnRy4F5V+DKyotRJO4xpGF5nFjDVkqCZKpDU4kkZ6xfKYTrpDlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPDPzWVmBNu2/0xFFcj2o4IVnwttxYzwOoTNDXAFHuDUv/yua+
 QHgi9A/ivYibQb4hSUo3B9rKVqB+3Sz8kI60MoQJ3o2ldVAN19Mo
X-Google-Smtp-Source: AGHT+IG10L3UTYbB4n9DNDukNS5gK2VbwP53Phi1zaHmd2x7ZoQ/d2YQnThhAeOg4ULlsHoxyNUrjQ==
X-Received: by 2002:a05:600c:4e0e:b0:426:6455:f124 with SMTP id
 5b1f17b1804b1-432b749164fmr152692205e9.0.1731413267523; 
 Tue, 12 Nov 2024 04:07:47 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1594:eb00:7c40:925d:3ffb:4a9a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed7d2c0fsm15716071f8f.0.2024.11.12.04.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 04:07:46 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net, boris.brezillon@collabora.com, olvaffe@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix dma_fence_array_signaled v2
Date: Tue, 12 Nov 2024 13:07:45 +0100
Message-Id: <20241112120745.2559-1-christian.koenig@amd.com>
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

The function silently assumed that signaling was already enabled for the
dma_fence_array. This meant that without enabling signaling first we would
never see forward progress.

Fix that by falling back to testing each individual fence when signaling
isn't enabled yet.

v2: add the comment suggested by Boris why this is done this way

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/dma-buf/dma-fence-array.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 8a08ffde31e7..e578493a6c50 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -103,10 +103,32 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 static bool dma_fence_array_signaled(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
+	unsigned int i, num_pending;
 
-	if (atomic_read(&array->num_pending) > 0)
+	/* We need to read num_pending before checking the enable_signal bit
+	 * to avoid racing with the enable_signaling() implementation, which
+	 * might decrement the counter, and cause a partial check.
+	 *
+	 * The !--num_pending check is here to account for the any_signaled case
+	 * if we race with enable_signaling(), that means the !num_pending check
+	 * in the is_signalling_enabled branch might be outdated (num_pending
+	 * might have been decremented), but that's fine. The user will get the
+	 * right value when testing again later.
+	 */
+	num_pending = atomic_read(&array->num_pending);
+	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
+		if (!num_pending)
+			goto signal;
 		return false;
+	}
+
+	for (i = 0; i < array->num_fences; ++i) {
+		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
+			goto signal;
+	}
+	return false;
 
+signal:
 	dma_fence_array_clear_pending_error(array);
 	return true;
 }
-- 
2.34.1

