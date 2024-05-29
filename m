Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185C8D31DB
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757F210F386;
	Wed, 29 May 2024 08:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZRw53Do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3752C10F386
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:43:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4211249fdf4so16678385e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 01:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716972204; x=1717577004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lvhs1YIV6pAjRxwybpgLmMel6kLADeGuuGr92YQQdas=;
 b=aZRw53DoAFk4kCNoYFoymG1wc9qm6w6sTHF7evkzUa4OK0qO87SV6S8xIS/h0KrPBk
 aAvDk4JKip0QyJfNXljnFyIynbk/R1jkRvWdgtBYHq8370S74uInTykcdj41kAQGq8iM
 ig+/owO3LReIClGHGnXGQbZNZ20bCNe8xDkDwWIOnUUZ5NYrYexErL3AZOqZSC9Hu489
 z5FBoRF4Bn2+upW5zceEqI7ba0NOaxqWNZ1GOdzYUYz1bPFEE5WKhsGNHWoOUoDa8gBF
 PnGWN+PfQhdcRNiG4tbr5ZCnUi6SYwir3pHopoQF5Q0mWUozL7vDS0ZlXGYOP8rZr2Fa
 XTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716972204; x=1717577004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lvhs1YIV6pAjRxwybpgLmMel6kLADeGuuGr92YQQdas=;
 b=N10QZsbctxXJEE57oozmsExckU+eCfxmvOlBBBm5xFer5S218CP/CmAS0PxZw6I3oW
 26Qx57REIamDEPSkxTddGtpM4vQkdz+Hg7JdP3V5rTW7B9sjmsSvao9bLjtUhHzKlQh0
 r3YdASR399pbZad9j4trNby7JniG1mJoUbIylrb2fdK/YvjlJEVXKyMpAQIZvmzo4bWG
 wkiik24+ZL+F5k6cAg0E1Mb8or3itiQV9Yx6S6SIHADMQLBWxKPQ2cVxGfvnDQ24Lbp8
 kvVI1GVSAdcNLi/zgmjDXot6fI9dgXWWlBnwg2jb+pIH7w4EG6W6gEwoko0oGXv6Mku5
 fmCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBtfBEuONhR5H8Z8NBFHHPgR+j//pSK13H7nSeVRCNB4ngUBgZwS70psHkcSHYNNKXJDhak+QSlxnnTrT0Sl9/vqTmq1vTcs21gCRk9zdK
X-Gm-Message-State: AOJu0YyaSd/yjFbC9ELC+AEGrMAJdJjUGOXCqGQ4XSJv/yt5BwFYC4JJ
 R0Z+sewlj2roq5xXoWUqmHyLHD8vBEfTTHxLys8iHbvJogjyrkF2
X-Google-Smtp-Source: AGHT+IHKTLDXQAqpReBZKZ8jDWLCepRMhyiee8/k86QBffcnCdZq0RvxicFRDsDKZ2JIjkbbv4RAGQ==
X-Received: by 2002:a05:600c:314d:b0:421:7ad:daab with SMTP id
 5b1f17b1804b1-42108a4f606mr106018725e9.7.1716972204003; 
 Wed, 29 May 2024 01:43:24 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:150d:a900:2eeb:e69b:7ecb:9c4f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3577505a218sm10975107f8f.31.2024.05.29.01.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 01:43:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: sumit.semwal@linaro.org
Subject: [PATCH] dma-buf: add a warning when drv try to reserve 0 fence slots
Date: Wed, 29 May 2024 10:43:22 +0200
Message-Id: <20240529084322.2284-1-christian.koenig@amd.com>
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

When dma_resv_reserve_fences() is called with num_fences=0 it usually
means that a driver or other component messed up its calculation how
many fences are needed. Warn in that situation.

When no fence are needed the function shouldn't be called in the first
place.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index e2869fb31140..5f8d010516f0 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -186,6 +186,13 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 
 	dma_resv_assert_held(obj);
 
+	/* Driver and component code should never call this function with
+	 * num_fences=0. If they do it usually points to bugs when calculating
+	 * the number of needed fences dynamically.
+	 */
+	if (WARN_ON(!num_fences))
+		return -EINVAL;
+
 	old = dma_resv_fences_list(obj);
 	if (old && old->max_fences) {
 		if ((old->num_fences + num_fences) <= old->max_fences)
-- 
2.34.1

