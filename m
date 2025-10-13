Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB09BD392D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF52610E483;
	Mon, 13 Oct 2025 14:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YWMTp/Pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD0A10E46D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:11 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-634a3327ff7so8760926a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366110; x=1760970910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dcs5G3OnlnQFK9aYqll3CwX2/M7qzjpRhdjkxpesGLA=;
 b=YWMTp/PggdKievczQo56z4OHEtH5+YTYMeKheuUrui/WXLaYUpFoZcUem1G1VTj2AC
 65V+zSIq3z5EardgM2u0w5MKusSSgKBsJUYeBJgsq/z91JnB45kC2iCrv0qasz7g6TLD
 AqYftwjOO1/0r4nCVipawszj9tVI+pJEIJQQHU5lCSZEZxmp5FCLVoe92ulh/0HrEc+3
 NRWGGEX2PgtjxPw6dq/n8bCE8SAxarJNsXN4GPLR4ZOdxzlIvm2lo2WrA7yA5nJ+PmQZ
 p0Ctg8jcJepzS704O/2cKDCUUl/BpjFVH6iwrZt9QrlSNHdM0RUa/orMUDnlTEx8fkll
 J5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366110; x=1760970910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dcs5G3OnlnQFK9aYqll3CwX2/M7qzjpRhdjkxpesGLA=;
 b=IzT0BBpWKxx0fBKG6Te3WvPTJz88VYzVDr/6ia8D+Tkm2kkA9EEDqIBN1RiOdam0nT
 Vb/2GF3jr9c8Fn82hC/n5kbJzXr3xVa2+swmVaO2Oi3wyasaWrsmbe0D599VJzVCDdn/
 c4m2SEUR51/rkafzWs8D/W8uEN0w70xxHNIjhSiFrJsZWemG0p5KWoDdlGSebUBSjWTE
 4Qsv7VRx/HcoO4W27l9QKAy1dfSnC/+ySCOJ7DVMfnmFIhIXlw4dUGF9Y1iIXxjXUJ4a
 +/b/0Wktw+rGwrg0g/fOdprn2im0UefCxXsFhbqYlt7Wlm0U0MldBkOFfckT0N1XT+pY
 /srQ==
X-Gm-Message-State: AOJu0YzjkrO71LkiTb+iDfpVDpLr9zHtPR8QFlI7HT6FoG/3viDywr6p
 gro04iAeqi8R8blNeriYugYF68nDk6cDBZroi7mvfzlwZ5vnNC0kmY69
X-Gm-Gg: ASbGnct/nuO+kTz3XZiSJwf/VQBmRocn5m/GD8llYNAekJ4LK5Htfh23eO1R6tTLxsA
 XdVMoGvNE4F7OKd43JD5xEVLcG5lHYmVOtlbg6j819pXEyMr2Uc71+A6LyN+U63bNgOLyeyTJFQ
 0hL71qTWgbZlFzhYVu2dh5F5zQZVJH34KDeX4QTtryBnPIXZHZCiz7kEWYMR2Jml9AexfjYV/r2
 5sUSyd1qaM/jzeZXou+DQNr1sApMZVTnU+ZTJUWvO8iXX+b7UE9SWve4JuvBykI8wAYh0yLGDVl
 GYSaicw0hp6Y0T/I0dqllz4uKn4fq+Fl3tEpf1TIMqQ2tXBhbfa5aSaGLFV9qCbFPFa4ewFkruo
 bG5Dlly5QaJO5lzwxvgywLGKOv6cEvVL5FcbfW5RWGowvFkhEHEg2RF7NoISfrqOq3A==
X-Google-Smtp-Source: AGHT+IEUIFOIb5BRE+Mb+i7LjygPEzDEIsUwjT5ndJZqiW7ZYGEomZKLV3H66PtH/3ll02Pg8SvOXg==
X-Received: by 2002:a05:6402:1444:b0:63a:35c:6ebc with SMTP id
 4fb4d7f45d1cf-63a035c72c9mr13487401a12.23.1760366109937; 
 Mon, 13 Oct 2025 07:35:09 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/15] dma-buf: use inline lock for the dma-fence-array
Date: Mon, 13 Oct 2025 15:48:34 +0200
Message-ID: <20251013143502.1655-8-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-fence-array.c | 5 ++---
 include/linux/dma-fence-array.h   | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..c2119a8049fe 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -204,9 +204,8 @@ void dma_fence_array_init(struct dma_fence_array *array,
 
 	array->num_fences = num_fences;
 
-	spin_lock_init(&array->lock);
-	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
-		       context, seqno);
+	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
+		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 079b3dec0a16..370b3d2bba37 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -38,7 +38,6 @@ struct dma_fence_array_cb {
 struct dma_fence_array {
 	struct dma_fence base;
 
-	spinlock_t lock;
 	unsigned num_fences;
 	atomic_t num_pending;
 	struct dma_fence **fences;
-- 
2.43.0

