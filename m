Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EBBA2083E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614A410E622;
	Tue, 28 Jan 2025 10:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="afj3ip0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6392410E622
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:08:36 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38637614567so2596045f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 02:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738058915; x=1738663715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h2yOvoDnInS5YyguD1gPdiTImuorPx6Slh8QNA5BfCg=;
 b=afj3ip0MxLKFVcH/UU0SDrB7gMtw34a97RCNzG95Eqk++25V+h2XKwO/RnkgAbeNvP
 /e4M6RhtYZ40oVJQJv0DhXgvJV8DYchEtVlpzilxZhndtSvcnNSa8b9H6KQjrUffWJKF
 clUyDVuf6JaEvKbRRVgzSqCdMRQ1xZdOQR9PlbFQIcpkLl7HrPImr5DB01yjKatZlYsz
 C1BjkxuneWMnyb2ZMbFpy0pyrbzpFdQHQve8tPcg19qX2wy1nF5GXDZ0u/k2tHTlQWVS
 cU3EoL+ZBhiW5qLsHhzEqYE7/BfZBngAf1geazUxy3xREVa6soHrHG+hJ1z8lONyJuAw
 w65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738058915; x=1738663715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2yOvoDnInS5YyguD1gPdiTImuorPx6Slh8QNA5BfCg=;
 b=vMk0t4+wIfiHL5k79a+E88XJ0tJ2j3+oJgyic8s+t2dNrYLcyyG2GtHbxtGujka2kS
 IgzWIlrfB/EL6jv/EWVsCRr1pC/93qCV0pgfR4pe4T2MPtTdZVB9D19XHcRkX3sdzjXm
 E9bRPA45pkxYlPyN7cgVkZr5OfgrDCoNL7McOuSPpmSH1ELPXVVZz/JZVrZ9DJ3J08b1
 2QEQFf5k0AdgooQ1hMB1hJUxHXJw8QhgIIMAxiE8lR7j/k0g9lLzhbjsgRG29aFsjih5
 xNkqD9hqDebEUNqWfBOp30Dw5HXxkN5KNbhTWFsOu3lFbbGmfaQqT7VoyiuIqNCwKrI1
 JvuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX3FmpuXuCmPeKdELykk/roJt+NUoQ8zlm8ZwSp/GnAD+wVVkBc5miaUNVT1eVEz6KbVNALsLCyIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFXAZrig2Cuw6w24EEB5W52Luwiip2XXbqLt5/x3wxm+xNTifP
 3yA9hhFaxguLM3tSdg3p7vAiCWDepecUbj/xgGq6PF9s32uCi10h
X-Gm-Gg: ASbGncsIHlPTSoeiajmESCnYiKGjEC5fK/ROpFkjHaYzuzbfuVrpa6z8uLkumOF3o8V
 v2WurZrWB6Xx1mUkmyLZ8RxhR/gQquUQRcl8jPQvGcNU+M0CQ/JYCGS3nSV3gQHU7Jo7W8YzHVP
 WH3nhCoxWjgCqxUDUg/MP7OEryEP6sAIEUObnsj1bIslvJUjVWIxJ/kEjAwm33LWlXIRPJtVwha
 jzzlj5BnloUJluqxS+Mm2+LM2DnALxsBgSfs1VdrhauPviSZmzBeF3UL5164+iWGvBiN1VOHKhf
 vL0d8UH9/ZMWKu/3JWjIcQ0mww==
X-Google-Smtp-Source: AGHT+IHEilQrm8VE74CTRIVJXbYI24X5hbrOC34o8rHdp8QOyp8603efRQrzisOdGe1zt5eY0BMEKA==
X-Received: by 2002:a05:6000:1faa:b0:385:e013:39ec with SMTP id
 ffacd0b85a97d-38bf5656b93mr39373974f8f.8.1738058914547; 
 Tue, 28 Jan 2025 02:08:34 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154d:4600:f97b:2e:9c49:a657])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d6b2sm14023800f8f.34.2025.01.28.02.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:08:34 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: marek.olsak@amd.com,
	l.stach@pengutronix.de,
	sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout
Date: Tue, 28 Jan 2025 11:08:33 +0100
Message-Id: <20250128100833.8973-1-christian.koenig@amd.com>
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

Even the kerneldoc says that with a zero timeout the function should not
wait for anything, but still return 1 to indicate that the fences are
signaled now.

Unfortunately that isn't what was implemented, instead of only returning
1 we also waited for at least one jiffies.

Fix that by adjusting the handling to what the function is actually
documented to do.

Reported-by: Marek Olšák <marek.olsak@amd.com>
Reported-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org>
---
 drivers/dma-buf/dma-resv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5f8d010516f0..ae92d9d2394d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -684,11 +684,12 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 	dma_resv_iter_begin(&cursor, obj, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		if (ret <= 0) {
-			dma_resv_iter_end(&cursor);
-			return ret;
-		}
+		ret = dma_fence_wait_timeout(fence, intr, timeout);
+		if (ret <= 0)
+			break;
+
+		/* Even for zero timeout the return value is 1 */
+		timeout = min(timeout, ret);
 	}
 	dma_resv_iter_end(&cursor);
 
-- 
2.34.1

