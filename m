Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD072AE5777
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 00:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FE510E473;
	Mon, 23 Jun 2025 22:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LsJ+EI2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7B710E473
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:35:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so31012215e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 15:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750718148; x=1751322948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w8X8+lYPNXJfIiqIH3VT7v0hy5MQ4DjDzji7la3F3Sk=;
 b=LsJ+EI2F8+b9T+4mrXodAOYX8WYKHIjXlAvQwActJgCQVP/DbRt3BakfkRDJTo+aet
 UZ7LKg8b7yaAmvbHfKOxsvimUmF7nEd/4ayb8TxMHxOCLwWbgl8s2tdSXL4n9kIXpYaa
 AfzaUcdZR3NagrT6nvo420q+KewKDE1Tw1OfRJCPw8mSuyaPWIDjvFFq7r4e7gkONwdP
 05GAmMm0Zjpvs1Wa0TLOjhUaeaeKpQ4QAqk6d2/vc0MjRT9BMmvSn2251h2Ab6pnACha
 Zcy2g/gqZSaloMnHyh2y4fDh2VSNTiNCx7lWYKHGoH3joiMcF/n4kpGc5Bk+L50dTuRD
 npkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750718148; x=1751322948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w8X8+lYPNXJfIiqIH3VT7v0hy5MQ4DjDzji7la3F3Sk=;
 b=eFJe4esshR4GiQgii2Elxh5bcv1QDk6cVoS+OBk4fnHAR7wP7EEfb5ZYCYOZZ5OCWm
 xbVO9c8LB3wTnUthzK74YUp+h0g0R0S2jtM1bPpZx4wdbtTd9/JbXy/F18KYVTQmvCli
 1kZtxv4VHN+YkYlq5J+/tUN/hqqjXSyraWCyw2pFT8Rn8jp4htwv1TKgdKf4KV+8yxMa
 AKl/7wUQMtiBera3PgXvyeVnN6qVom9TrBZhONDNZke6B+k94nm4Iq6JUR25SBeRRrOn
 8+YXZNj6GB1g/XBl2bHawV3F9hia43mcCnAqdSHKpmxqt8zcHiCjsV8AcuOnf8DuOWri
 4Wdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOa7BumvehnocNrohAMJyCltJMi9VWJJ9ZW2AdMT+QahdA2jMyjAN+0YXLMYBWK9YNH0BB4aqePR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNlaDPlnELkgCYJH2bdDPowskBd/ZF9+ghgTIbBuu08RfyFRzM
 22o0qKiqfPGFFT/Zo60+V1hbNNodzQDivclcA0a3HihvqGKeIuKHprv8
X-Gm-Gg: ASbGncun2HBw+6uXnJmJWBHE7BRY2rUz7Zi6btORK7U7lLch+GFKzWvjaY0VsjvZnqW
 sA5SgCHtJfhzNsFOd+Jm5QTYUeTxjjZ7CRMAX5hfv/ddbly3UWGjOZPfYcrV4iJniwhGtjXzbJw
 BBmnrdjhnif0SjUhuJchJkf4jkewi5vV6UWmdcehouFqDUSVq0CSMI5SZe9E5i772kQoROFKcJi
 97Qv/NBGayFUByjMvvg+0q+gx9CtmjzuYdeognRSnDXRyYM6KPLlKbiQprLJwZBZRE3wmwMzj32
 6vDHJy8pZq1+PWt+hZeQgTIR5UmBdRyx/YCD7gIsLtNl5ep7ASde4WrjArwM
X-Google-Smtp-Source: AGHT+IFZ8AJI3ew4IzWWU/Tkz1lnQ+LEc34WeS3W9X9qKZcysFcEpbE85v5c+G/NlHApltmH5vsaYw==
X-Received: by 2002:a05:600c:458a:b0:453:92e:a459 with SMTP id
 5b1f17b1804b1-4537ba90848mr6811445e9.16.1750718147995; 
 Mon, 23 Jun 2025 15:35:47 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4536470903asm125406135e9.40.2025.06.23.15.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 15:35:47 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ian Forbes <ian.forbes@broadcom.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/vmwgfx: fix missing assignment to ts
Date: Mon, 23 Jun 2025 23:35:26 +0100
Message-ID: <20250623223526.281398-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The assignment to ts is missing on the call to ktime_to_timespec64.
Fix this by adding the missing assignment.

Fixes: db6a94b26354 ("drm/vmwgfx: Implement dma_fence_ops properly")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index c2294abbe753..00be92da5509 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -538,7 +538,7 @@ static void vmw_event_fence_action_seq_passed(struct dma_fence *f,
 	if (likely(eaction->tv_sec != NULL)) {
 		struct timespec64 ts;
 
-		ktime_to_timespec64(f->timestamp);
+		ts = ktime_to_timespec64(f->timestamp);
 		/* monotonic time, so no y2038 overflow */
 		*eaction->tv_sec = ts.tv_sec;
 		*eaction->tv_usec = ts.tv_nsec / NSEC_PER_USEC;
-- 
2.50.0

