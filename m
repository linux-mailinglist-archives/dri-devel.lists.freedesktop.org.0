Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2ABBE36B
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 15:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA5D10E34A;
	Mon,  6 Oct 2025 13:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MAyAL+6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC8D10E34A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 13:47:16 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-46e2c3b6d4cso40234275e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759758435; x=1760363235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ykaAfDA6fK+gQoVD6r/9heA6ErlZ1qqQhHNz6PenFtM=;
 b=MAyAL+6jyJfMxY2OJk3OVBVzTaGXbrkXGixTES3ca/33HXu+7MUCtWq6GpFHi7Urbk
 Ua0KGguU4bjJ28lfOH9rIUGOv1XyGec+84hJ8ZqSmyu2MB+28r4KJyHqs0XAWT2LX9oT
 2JIZ/k7M7FTmXp1QuSxhG+9Nj4rGBLyo5EoD4HVlJl52A9uSUC/VIkW6qkO30q7qhoMG
 cU62hAL792Y4ZkSB6SRY9dgr3gjDni6iORtSzVfG47Tyk/2n0rgonscUEkNkEgnpDgrl
 8vLjug3i8HZXe8vBMhNlILcY3EXa4gvBcum1Gl5YwaqiUbJywK6YgPwRBLkI3BXIhDPZ
 poTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759758435; x=1760363235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ykaAfDA6fK+gQoVD6r/9heA6ErlZ1qqQhHNz6PenFtM=;
 b=eOb0+UQICGQu0GbrrvSC+HY6Nxxls8UgsSKX7xyIhnHOEUTXgkUtTbV61gj+Ed8Lbf
 n2Y/ODHl/Otp2gguumcBVtC/++hGAl+Q7kKXHgRtA/90+dHxf9ZV+lN5IoksbQa9zamr
 /uVTIuZykYg55i1sHXEid2LRaoFwrzkKdAo1WHmSFlWEUv+MUcBvBEsD4t2jr97Aenpp
 a7XZOWgyw0E+GNN7v+2L0tYGKHm74g7vYhAwgeYXCViy2VsVaCa7JnNoz3JWSWzZJgkA
 QXzYQD2Bo5/j8PeqIwsXCX5f4pgoPC4lrC0so37M/OD0WzhOmGkHR0rDm/ZkTEDpmj1w
 dXqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP5ZSX5EmdsIZfjGe7ncKiXHtPENifKVCsOD8ti251UZTa5VHQA9+FfIUAR4zy5ooki7/S5wAdTZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKPazEsLKPeBpp5DvP7zrh85PqxTsIgw0vRZBQToBuZSKeSARb
 zp3Ty51jJ8OjYjSMgf7jB3FHJ98DoASYlM2v8JCO3TczIthdwhTiICwA
X-Gm-Gg: ASbGncuU6TmQKN1yNNu98mndX0S/FOr3dvzbCa1fOZ3qaMAmPpbdedTNodS+LbG+kQr
 gfRRHMkW11hq83xZP/lblryyf900vjZw/nzCq4+KEt2yAMG93/LogLFcVe0gUPu9I1PSfopznxg
 JD+jwCeaefpFOrBnaDD0qBBY4XCdC+OfnAfe5ciu+OmWdBYUc2EvbcA0wtqAaaljNYvmK+zWoga
 CkzWBgCq5FQPJk0olevhjwUc/wwnUAsuf+tMuEAPhUIpvNWiK/CFwIwHtEawaTSvIygA4I/jyGq
 IuLVCUUgcvxHnM6//kRf+zXA2lpFPioInus+dPRiqADOZuKdVAnZ020GE2K4eP92a/3R/UvF9vk
 Ymm83Warsy6oO6EHgJdja/VOapkmNgqMHf3w9fuAOCMry8Q+1XFie8LYWLIs=
X-Google-Smtp-Source: AGHT+IGt/TaymBas0Wox5VXpeJZMwWsZOYyvYRRK6eQW+9dxtYpqDSvK0Ox0qUxnYoZRr2+FbONLPQ==
X-Received: by 2002:a05:6000:2204:b0:408:5363:8266 with SMTP id
 ffacd0b85a97d-425671b07c1mr8352403f8f.44.1759758434680; 
 Mon, 06 Oct 2025 06:47:14 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1585:c600:2084:c9fe:598c:ebd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8b0068sm20966125f8f.26.2025.10.06.06.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 06:47:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch
Subject: [PATCH 1/2] dma-buf: replace "#if" with just "if"
Date: Mon,  6 Oct 2025 15:47:12 +0200
Message-ID: <20251006134713.1846-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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

No need to conditional compile that code, let the compilers dead code
elimination handle it instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..2305bb2cc1f1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1141,8 +1141,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	}
 	mangle_sg_table(sg_table);
 
-#ifdef CONFIG_DMA_API_DEBUG
-	{
+	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
 		struct scatterlist *sg;
 		u64 addr;
 		int len;
@@ -1154,10 +1153,10 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 			if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(len)) {
 				pr_debug("%s: addr %llx or len %x is not page aligned!\n",
 					 __func__, addr, len);
+				break;
 			}
 		}
 	}
-#endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
 
 error_unmap:
-- 
2.43.0

