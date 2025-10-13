Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2ABD38F7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C676F10E471;
	Mon, 13 Oct 2025 14:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KNav2rJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBFC10E46D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:10 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so8831102a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366109; x=1760970909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLQnmXItSmy81z20hFdhZJLlxzeiJ2xCH+H+JdwHWVU=;
 b=KNav2rJWaq6vw8z/DRP5OSynYAic3wOiOBsJ1WYorAAvYlOHVfCmqFibBPbhcjPzcZ
 5z1kuwpBDIxkHmTuBOiLqhHD4ceGd8SBicNk6WiT0m5Kbxo3G2Dw62P4rDezpQpXdasE
 +suFffGr3IAKAztvCTYYwgr7C2rrlJNPtuAoj92POWjp3s5ZGWCd1Loz49cRlOkBEeYP
 TP27iuuJVwO7uBksibUjBdH4zbbYoh5r97aYFO8t5pCOFWzeidYOGSnLcT/jJhM+yZ9y
 X9nXyvP2fVELAhyeQ2rGxWZvVJ+ER8bzI/ideg+FAwodtnypZczUcVsGtka6iP5A1vO5
 TcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366109; x=1760970909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LLQnmXItSmy81z20hFdhZJLlxzeiJ2xCH+H+JdwHWVU=;
 b=FyrpxHwTEF2LykbAEYLSDnqbwB24aCoLxsEQdEzZtDlH6Qp8Ir66m9iI1dPPo/L1QW
 1jAdA/KkJo5zGmd2Q+A/GljyI4CguNjQMeCWpJxgKBZOhaLBIhwq9cbk/Miq2FEsymuM
 D0PTz4Anpg3M/NVVIQFhw1KxwskGlgT1IZ/z1yHMWjhSX4m9+HuyQsZ/wlb7tJvKVAS5
 WHlywc3SwvPe50M/7XSfpcF3/PqHECLhd+4BxoJYsw9EMSM9x7eWBn/GgVKVM+kRF1wj
 gVgYWVIxEJzk0Bvr3lS8Tg4kMxvYOvQ0hZa+uojtd5ae9M4Cl7s2aIJgpiuGArbDkpdx
 SEqw==
X-Gm-Message-State: AOJu0YyTR0f0DXnLpkPpUk5ribYGr70lMeAfTw+b8g1wWX1rKGuiLFZL
 6hcjXwBDskW7pA4qNDaKrJN8gSkp37xESAxm7JbPvthUANXXGqwYROgY
X-Gm-Gg: ASbGnctWNPra9OHa+bLCZAY3nv1CZ762xaWcn6IAb6jayUw2Ffi+5BvrF8iYwsTwnvK
 7YXnf2Lb9OIDJIroYf4rBltzmbu+GGGdJDHXJ1wuAu2x35oUTNw1s+cmCXsDC2HMYNv5aWsKQg6
 e29mmyfB10YbjQ8wD14DUDhBGIfhGaYn52ZbekWZFBlyojwPTer4E9YQWpo6ndk1IN/J3LESC9L
 9WVrI5axAeXj7BxT1wgTOIe+ZNnNhwb1Bpds0ygSiUj0EZ/0NH6QiNo4+ue3GfRGTOY5PRXUnV8
 2d5TSbbiqOxl3jTZR0nVAAqvdQ+mHPxfy61Y2pf1y9rqqS3olqqb4S6RjZjmz7Ao9sP0XpUb1/0
 8nCAiiU16mbrvdfYQC7tEdHMyLbvOpZbuRrrQDz4sK/Fo/fEPQnm/jOEsZbCcdt98zQ==
X-Google-Smtp-Source: AGHT+IGraj4A+6lMzs855DlaUrHnPyCcPhX9oMUFWGOkTxIrwLA1mLTwn1XCHCxbI5xAn9lrH5/XZw==
X-Received: by 2002:a05:6402:1d4b:b0:63a:3e7:4a07 with SMTP id
 4fb4d7f45d1cf-63a03e75e95mr14420483a12.6.1760366109313; 
 Mon, 13 Oct 2025 07:35:09 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/15] dma-buf: use inline lock for the stub fence
Date: Mon, 13 Oct 2025 15:48:33 +0200
Message-ID: <20251013143502.1655-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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

Just as proof of concept and minor cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index a0b328fdd90d..a41ff8e8cd25 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 
-static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
 /*
@@ -123,12 +122,8 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 
 static int __init dma_fence_init_stub(void)
 {
-	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
-		       &dma_fence_stub_lock, 0, 0);
-
-	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-		&dma_fence_stub.flags);
-
+	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
+	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &dma_fence_stub.flags);
 	dma_fence_signal_locked(&dma_fence_stub);
 	return 0;
 }
@@ -160,16 +155,9 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 	if (fence == NULL)
 		return NULL;
 
-	dma_fence_init(fence,
-		       &dma_fence_stub_ops,
-		       &dma_fence_stub_lock,
-		       0, 0);
-
-	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-		&fence->flags);
-
+	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
+	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags);
 	dma_fence_signal_timestamp(fence, timestamp);
-
 	return fence;
 }
 EXPORT_SYMBOL(dma_fence_allocate_private_stub);
-- 
2.43.0

