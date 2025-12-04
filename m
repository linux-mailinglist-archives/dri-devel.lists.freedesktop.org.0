Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B644CA420E
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 16:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5632910E1F3;
	Thu,  4 Dec 2025 14:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j0+gfFnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C800410E1F9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 14:59:56 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso549508f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764860395; x=1765465195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xFWFQJyqNEArb97bML7scQOt1LXkeAlqXlQJNt06ohg=;
 b=j0+gfFnv9e4YHOE7N6SxZOkcmewBSGrLKsYK8T1QUMHorHnwTR9wvCeFSoObdZkgQr
 rlYXIw8Xutx6TIcao5BXO6OxcM4sTlLkmMyQTPh9FaSgJI3HoBoSafECQ0uEaCSRaS0/
 7RnSz7GA1NCNPs6Vx3vI6omSgNI4ZkkGldh4stz1RkfMOEapjnY7CzNqZNPzznMCmrkp
 rOTFpmhf9Y0QhjK0wPZ0Vvs6oRkpxa3vOZghvUYwGetN+7LjGPLxpgW0RZPYxWQSA6ts
 W3B608G7x2LZk+w7BWOl/l+p/UGk4s5rpJYHmH5WPOM0jpRTZDS4j+Y7Urg61nxji4S9
 AQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764860395; x=1765465195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xFWFQJyqNEArb97bML7scQOt1LXkeAlqXlQJNt06ohg=;
 b=kp/PnBlt7YXSlQ6vr6AvwyrOGlZHoPoVsZLNf4M6x9/6+Q6kyfWh4EGgWSV2yBsZHW
 7mekCoR5Z6KjrI5XPHRqwFk+pIdn4T5P2t4H7X+GxKWvYg9NCilVDm3oz1cknsZabr2X
 BjnoKgkioN93isz3B9fPpHLrOS6dNZYZINr9KeuXkD8VKUfqXb2mjUT/kpA5c9ZJifzT
 DETJdadP09GmaPvFtZ/Dhu+8JdYh53oqPo3Vt8vazt2ynV1XrT1iwiTdz00pA683JHzh
 fO8fQRLKENe0cYXtYC+EyvxESMBWnW7+1NQ8Ywiv17TUoWOf9wOOEHlm2itkQJNppkw+
 68TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUICQv1O9obva1g6YWxtDXTSJn36UcTYOj7+U3LQdwHAm0cAARtxeXgBsv6jYoWJjGG8YnmG3cstfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu4Vt9bAjRK9bIVGqtP52+WeuSqxzCYSVzMuuObz3a8WBazalR
 JvT9/W5anJsMetJcwVXRrLdvoOZH2kuSl0mcFAiq6QpuXJtXPHjoAX5Z
X-Gm-Gg: ASbGnctaOx2UB29m9USMtSQZ9PKPnZsy43ECE0QY1mWsvoaBuY92rA3RF+5ktpyfl2B
 i41ld+FebMX1PtdCjd3C6P7gxL8H0eQatBXTJa7Rr8i+Sci76SzgKr+wDH/pNP7wWtUYHZn65SM
 vS2mJAkqeag2eed+Sosu3YUz8DY+eVMJjOqa/KbP+jRvWjwSUhIUd8M4Pagmveq8GB84Sww1u+z
 CG3BnITBRZoqAg/3pJUjAQH8hg7ONHZbW+RK7q5uiZfBEdjZSjdiJDQBVFJ1soE0s5qCzScHF4E
 MvEdQex43sf/EnddDomEt+Hz05A43p2VouPjhoXmgoYp/fdz5uHogPATQmISrHUJCRHj3beJVfj
 wIiV1+nQMEd1kbrGGWU+cpWXEW++rNwlIXthhjW1IAeSxd/iCPY/wmyZoOPq9SQpNO0BXQRMnQw
 UGQuzteVoHGretKleAaWZHt3PY8ok4ZQFKog==
X-Google-Smtp-Source: AGHT+IG9v9h20E8VTHUoLcKatGxvnYbRKazdI61G/E6P5Z/sBf3V209yQKFoFn/ZFKs2knJoDlVqew==
X-Received: by 2002:a05:6000:2905:b0:429:b8f9:a887 with SMTP id
 ffacd0b85a97d-42f73171e51mr7463511f8f.6.1764860395251; 
 Thu, 04 Dec 2025 06:59:55 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1591:1600:c95:ff70:a9ae:a00c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331af5sm3473291f8f.31.2025.12.04.06.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 06:59:54 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch
Subject: [PATCH 2/2] dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels
Date: Thu,  4 Dec 2025 15:59:52 +0100
Message-ID: <20251204145952.7052-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204145952.7052-1-christian.koenig@amd.com>
References: <20251204145952.7052-1-christian.koenig@amd.com>
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

The overhead of enforcing the DMA-buf rules for importers is now so low
that it save to enable it by default on DEBUG kernels.

This will hopefully result in fixing more issues in importers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7..fdd823e446cc 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DMA_API_DEBUG
+	default y if DEBUG
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.43.0

