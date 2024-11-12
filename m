Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62E9C578A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 13:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7C610E2C0;
	Tue, 12 Nov 2024 12:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q6sXdTGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D407E10E2C0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 12:19:28 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a9e71401844so708843666b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 04:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731413967; x=1732018767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZK6KTrfFDqJD+BDzYPYnwIzhtwkBdVUDmg327FUN3wQ=;
 b=Q6sXdTGxsKaW9qgP0PR6jen0JkqFvDSXc8jBm2jDDwM+2Qx3ZbXGXVxvLRuZ0r0VXN
 N/eZiN3TqOFtXROCi+11h+W0AGt1s6515RoJM2S7tGvWxx9WR1dtLc3YgU+hXSnIUSIh
 9OMDJ73UOwfYIp6AV4QaSsp7sbekmJ+XDbiN/NFHFJ+2AL9/38Hzqu5+BG5n7b0DXdlN
 6QrdPfPgqJKPESfMsiupuGFzuLO8K5rBxCvpBbOGDu/jUU4MKZ7JBv5YixdpTMMUnyc/
 ZBPrSyr5sbQZPkBY6mCP0GgSFlkyDUgscEaFnq603/Wa7yq94yoHhjcuXZcelFaaDsGe
 XjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731413967; x=1732018767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZK6KTrfFDqJD+BDzYPYnwIzhtwkBdVUDmg327FUN3wQ=;
 b=rDR45hT47zgm0ZjdhvpmHlM9yV6lGyhOzeH3elKeEB0BwJ2hnS7sL73yxGNxQE1eh7
 2nE/wbKEcH1aG+ixW4JFb8kVu8H0DnwvCFM5i6CpXaXlx/l6JYQd8VywwrMCuSXMq5+T
 3HKnfzBh/PD9QOSMd/fIKXcQrEa9FfpMPJPrP4z+0dwVOx3VeV5YOCHBWNwJnktWsrKF
 QEc0eENtP7Lq/DarUJaN/WTUfwK9gfQMTvvGWOBRz7cusPHK/Vs3JoJUnqysKniUG5ip
 vW4WGCHeCY7G9Fm1lNvQiDPPXf4UNsI9Iw9f5MDTlErt3R4OqdOBqDeP9NKniFGYIzq0
 c+Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYXWMAnBsAR/NlAU7H9E9ItsqtXeQAzrYZEzSBH3rO7WCf4mTIfQocWDUv7+uX9WdaWl0CeRg0djE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuJmSGGJY1kr4XLAlqME8bT5Cd565O6iy+QF3Nfids5NJymsSh
 3b4DZ/dUrYXmXeYDzfEyevMlCoH/HDH1xbL63FG7jfk1JK/7JFiYTYJcKp2phEw=
X-Google-Smtp-Source: AGHT+IGliXdPkXU83mod9i3SCGIInIuQEUEkNMqXYXSlQ2iKaytDGImuWdEW1mzycShjPyMaXCOYig==
X-Received: by 2002:a17:906:6a02:b0:a99:e4db:4909 with SMTP id
 a640c23a62f3a-a9eefeeca25mr1572309166b.15.1731413967066; 
 Tue, 12 Nov 2024 04:19:27 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1594:eb00:7c40:925d:3ffb:4a9a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2e8a3sm710008666b.190.2024.11.12.04.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 04:19:26 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net, boris.brezillon@collabora.com, olvaffe@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix dma_fence_array_signaled v3
Date: Tue, 12 Nov 2024 13:19:25 +0100
Message-Id: <20241112121925.18464-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/dma-buf/dma-fence-array.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 8a08ffde31e7..c3ffcc842c6f 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -103,10 +103,33 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 static bool dma_fence_array_signaled(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
+	int num_pending;
+	unsigned int i;
 
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

