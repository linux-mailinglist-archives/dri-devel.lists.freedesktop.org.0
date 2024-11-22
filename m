Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8289D615C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 16:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34EB10E01F;
	Fri, 22 Nov 2024 15:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RmeIQW4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC0210E01F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 15:30:45 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3824446d2bcso1889809f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732289444; x=1732894244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=nZYzC8/qbp8uYldU3RtFW20PuBvBN5BAeIz25F9W1rE=;
 b=RmeIQW4iVtY7iHDfQ3rdT69Xu6moqN5/Rl1Lmms7TWlb7dUHseeRYL8SX6Oi+q8RAo
 BTYLG5vHpDzv+nCzCFDJ4Ufd18qqow/jWpuUGk8eJpOJu5RruQTN8eP006StvGLnUX6F
 xZmb9sqslqQ3+IoLLia3LW17rsX6n4Kuo3GnAp68VCpDXnRpVIVO9DW46WZXWO35/idn
 CBMDF26EnBWjGfjM7AmHSG5WpSSPyh7u0A6/xSpCmvUbTZczD7RE3ug3LK23U/eNy6Pa
 rBw0TMKptwYBNclEehvw7qeKUgjyG2YwmmksRI0wBOXa3qyeW1mA90YHDIdTfT87g/mb
 14+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732289444; x=1732894244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nZYzC8/qbp8uYldU3RtFW20PuBvBN5BAeIz25F9W1rE=;
 b=tChgBJrnUCEI/w9oIclLZiTMaF/Rzf0iQYqQnHwIb+yuk5AvPjY024U3Uahya6W6N+
 wL1xW+xQo7hXzMcZ4DPlhtG03SOI7WPYwFcLs5Dagkafrv1NLXuC5aEvDaZxj4oELIpr
 +0KIG/C7gQ9gJc+l6842TC4/hLBmPvtE9GQYw2fWlh7ACLcPlAl0yvu4mjTVnbCZYokT
 9ZVSlBvOt76Uj4WRxfM2i78spaJnB9yBk+zVVEo6u1o9LkpFVI0kuEEykmDGGviIErN4
 Crn+JtzJqTBTE57JyX+qpev66Cw33gRmRHNO5vwr8nc6LB0OfnEKYduSbSL4h0Jf3fcH
 zdSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE0TMrn2sI18BCpG+v3gpz2sgSi5b8ld0WHINx067kJDhsXikeBZEjAupJzuO11RgETjMQke0IVcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBBDsuxrfyxRN6hOx4gbh9qQ2ZRybfflruK/KQ04HHZ2I6Z79Y
 5y/ckBL3JHCx1ETTXmdJcKrJDjmTEdhyLQyelQqaYT2SoP6o28HKqYdFA/W6W/k=
X-Gm-Gg: ASbGncs6kp42JSFyfS6xOt4vPuP8rI1ABd0u4ARy1feUA0fmlIxSVSVGtYpP8rM9PrH
 Q4oivnynb50vvS4fMb5hRYNzmwR9hJLxA1CknGt8juAa0QcqnpVAfTkROz0LmizKQplqkjvBcYH
 qu/ho5v77iNjavikUAETwuZ7eLjhpmijGEATzDSJz1OcqP2vYHLwauI95OXu8GuxzmuqYdeBMWm
 x9EFlX9ZmVglnaaLvpjRT2XKWTmr9ZSpvNzXzurN3sqEETo0Q3TUHI6ujshVQ==
X-Google-Smtp-Source: AGHT+IFyf43o/Vii7nkRDfZwAAgP9+t3+U/bgwCjZTu7yt2147qx/dGOP44d+lmi/uigqylNYEndlw==
X-Received: by 2002:a05:6000:1a8e:b0:382:4a87:6681 with SMTP id
 ffacd0b85a97d-38260b61f7dmr3214988f8f.28.1732289443348; 
 Fri, 22 Nov 2024 07:30:43 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:157b:ce00:e5bb:3b9:2ec9:95a3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fafe3cbsm2653098f8f.38.2024.11.22.07.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 07:30:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix dma_fence_array_signaled v4
Date: Fri, 22 Nov 2024 16:30:37 +0100
Message-Id: <20241122153037.44079-1-christian.koenig@amd.com>
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
v3: fix the underflow pointed out by Tvrtko
v4: atomic_read_acquire() as suggested by Tvrtko

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/dma-buf/dma-fence-array.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 8a08ffde31e7..6657d4b30af9 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -103,10 +103,36 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 static bool dma_fence_array_signaled(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
+	int num_pending;
+	unsigned int i;
 
-	if (atomic_read(&array->num_pending) > 0)
+	/*
+	 * We need to read num_pending before checking the enable_signal bit
+	 * to avoid racing with the enable_signaling() implementation, which
+	 * might decrement the counter, and cause a partial check.
+	 * atomic_read_acquire() pairs with atomic_dec_and_test() in
+	 * dma_fence_array_enable_signaling()
+	 *
+	 * The !--num_pending check is here to account for the any_signaled case
+	 * if we race with enable_signaling(), that means the !num_pending check
+	 * in the is_signalling_enabled branch might be outdated (num_pending
+	 * might have been decremented), but that's fine. The user will get the
+	 * right value when testing again later.
+	 */
+	num_pending = atomic_read_acquire(&array->num_pending);
+	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
+		if (num_pending <= 0)
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

