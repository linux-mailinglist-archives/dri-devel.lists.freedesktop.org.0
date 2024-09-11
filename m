Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306BA974DB2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D116710E17C;
	Wed, 11 Sep 2024 08:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PEocMJdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B888A10E803
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:59:08 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so17193595e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726045147; x=1726649947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p4VbxOmiyypdSEuKPugazwnriZOggJdPV5+cZUpYkks=;
 b=PEocMJdAT9rOHTmUkx8RJwypCcqePyoCPyd1EazZizZOAwU9ewPc9LCWOGNRcArwxi
 6at5KlBfDjRNa5052051XTcn1rXUzuivOkGbCIHiKEkMoZDnTQOuufkSQnaqCX8+grpf
 MaX1xnN7GU4q1rYnfwWi9VYjVoUQ/bNjzpdTwIY9V1QLRksq+gFPQUgfnWuyYtDn/NgU
 6r7l/OwiKa1P1P7ATQXVaFZfRFQKJak5inHV+QkY+JUIuwatwmXazA4lP+VoZ4eHccIT
 zLI+ZoZlcNKNT8WztuqvrE5GVLDF845V92mAC4BorUXNXeIGOKGt3qqhyA6PSnxOZhTO
 Ymkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726045147; x=1726649947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4VbxOmiyypdSEuKPugazwnriZOggJdPV5+cZUpYkks=;
 b=BMmRaJsVwvIKJ+KbN/KOGV8iZdYGooxiTtjmahso+gDP5JAR5eLgxmR9MP50w25kdA
 FDB5kwLWnwwezGALcIfF+br9h7e23B9F6hlEkZ7wWUEYWDRWehD6une0I6378esBPHer
 yPmqYelt7oEXLU4pylLFL81ga2zwmCGVOoJDUdtaML75md2Lnik6D8EKuQD+3KqkYFD9
 rRvN/D8VJoY7WQmgHBB5aHX/1e6UdFd2uV/4jZR/eXBR0kAPHmCXckawnuqTY43VaMe+
 N/FuSwcApFNj5z7mX07agVYhiAC570RjWsiJY2oS63y98vVjzRAKhnW+GbBfxmnOc2gR
 UBJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ7uIVm8lCSL3RwNSmqAujOXyXtOLSFnLdfQeoKLkDBtI/IRUZRXkh2oqrqJgQ+Ffnp4IYNkvWvw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZyk9otjbnq8NQ7eux0P8MGz6c8A5P2oulUC0pM4NP2MjnR/z6
 WmTuwLeMQVJnSkUWXmRMfSFMf8ORWPjWOA29eMKyNeWIgk0A4AfI
X-Google-Smtp-Source: AGHT+IESBkOW5XDt741ncXYa20+oy+hapOR6Dt8HN6C6aLvq/3z+OZDDzF7vXV6fo6eRaXKOa93FPg==
X-Received: by 2002:a05:600c:5122:b0:42c:b995:20d9 with SMTP id
 5b1f17b1804b1-42ccd35b1e0mr18515415e9.28.1726045146730; 
 Wed, 11 Sep 2024 01:59:06 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d6:de00:8f84:56ce:f670:6ad4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de4b9sm10978174f8f.111.2024.09.11.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:59:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] dma-buf: add WARN_ON() illegal dma-fence signaling
Date: Wed, 11 Sep 2024 10:58:57 +0200
Message-Id: <20240911085903.1496-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911085903.1496-1-christian.koenig@amd.com>
References: <20240911085903.1496-1-christian.koenig@amd.com>
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

Calling the signaling a NULL fence is obviously a coding error in a
driver. Those functions unfortunately just returned silently without
raising a warning.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0393a9bba3a8..325a263ac798 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -412,7 +412,7 @@ int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
 	unsigned long flags;
 	int ret;
 
-	if (!fence)
+	if (WARN_ON(!fence))
 		return -EINVAL;
 
 	spin_lock_irqsave(fence->lock, flags);
@@ -464,7 +464,7 @@ int dma_fence_signal(struct dma_fence *fence)
 	int ret;
 	bool tmp;
 
-	if (!fence)
+	if (WARN_ON(!fence))
 		return -EINVAL;
 
 	tmp = dma_fence_begin_signalling();
-- 
2.34.1

