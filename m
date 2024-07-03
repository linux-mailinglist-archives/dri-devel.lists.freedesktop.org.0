Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8749261BE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448EF10E013;
	Wed,  3 Jul 2024 13:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L64qxKBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD1010E013
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:26:07 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4256aee6d4fso33059385e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720013165; x=1720617965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CxJJEdicDCb6IZeT3uMULK0SV5Cncp7AGUzQdXGY/s=;
 b=L64qxKBNZi/eZ7a680wpt2d+AYCgH8zdOv4fONcj7Rv9RqFBrS5sgPbm8syg9TN7vx
 xs0j5LZjuCBcOUpd41kE3Tsz1xULMVvy81GhclWXpsUU5IGrYdZdzSAlmzz6SsLkuCVk
 gj42lOQXCJJ3LZRRtT9W1+k62A4r6PViq/9z6YPxzo5Zbljz26xsJa3gL2T8Hsy3VoWX
 qH5gD729Vuz6/W0MwOEpIQsCari7ujWrfi9/guwe0qbeKgJNoxRqtkz6xrrVj82Bwuj5
 2APeEohnA+fbDaZ/devjCmJ5nEMo1nS2TwYy/weXJlzKhBdLCZvIVPP+GKQGuBEglOa2
 XlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720013165; x=1720617965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CxJJEdicDCb6IZeT3uMULK0SV5Cncp7AGUzQdXGY/s=;
 b=Q2puwKZEAZjAwsHGbuRkdf97P/f1zKoosRWMkvJXmUtNP17ndGfaYQAy1WVClIeEwc
 zkUMRpg6DG3JQMIw/aGiyhvejpfBr3KRXkIoKK4PSjbOZgJnERp0ZdyYSfSWzXqFK7LQ
 i6dlissNO2jFDa2PZth+XdH5jsD+dQSWRe2EEWgtwBgwIlNBJ64Lpb2dVPjuRp7WEc+W
 ypg4iI7AAwcQxRQm4EdnFXM3OCp9eP36cnib1pWvPNTNrf8ebe94hh6HdiVOJC/lfBAC
 Qk7rJiuql1dDZq2W2TG9CTrT9qsweG/wZQ9bDz+WeVHtSET3K+MEoHBjyjP39IeWDkbz
 oGMw==
X-Gm-Message-State: AOJu0Yx79F4cb67mK1SpEavMLDoGP0U78PkZLgKw+MBiyTwypSQF7sbG
 7y2zt4ZVzbXiGE97RXcUfxycmsQfHMXlvxyZ32QQy2yNTjKu4Ol8y2DEbTwht1s=
X-Google-Smtp-Source: AGHT+IH5eOzqvMGazNWjbpb+sHtC59G7AmyiAaSXe+sc4V30YI5sYlUokwJCvSeF5c9FofvOCES+4A==
X-Received: by 2002:a05:600c:4e91:b0:426:4186:efae with SMTP id
 5b1f17b1804b1-4264186f0c9mr11828905e9.14.1720013165203; 
 Wed, 03 Jul 2024 06:26:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1559:9300:5f5d:6303:9414:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5ba51sm237197665e9.12.2024.07.03.06.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:26:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
Date: Wed,  3 Jul 2024 15:25:58 +0200
Message-Id: <20240703132602.4756-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703132602.4756-1-christian.koenig@amd.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

For the drm_exec_trylock() functionality, there is a need to be able
to trylock a dma-resv object as part of a drm_exec transaction.
Therefore expose a variant of dma_resv_trylock that also takes
a struct ww_acquire_ctx parameter.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linaro-mm-sig@lists.linaro.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/dma-resv.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8d0e34dad446..68dae8f2a22c 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -405,6 +405,27 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
 	return ww_mutex_lock_slow_interruptible(&obj->lock, ctx);
 }
 
+/**
+ * dma_resv_trylock_ctx - trylock the reservation object
+ * @obj: the reservation object
+ * @ctx: The ww acquire context or NULL.
+ *
+ * Tries to lock the reservation object for exclusive access and modification.
+ * Note, that the lock is only against other writers, readers will run
+ * concurrently with a writer under RCU. The seqlock is used to notify readers
+ * if they overlap with a writer. The context parameter ensures that other
+ * ww transactions can perform deadlock backoff if necessary, and that
+ * subsequent attempts to dma_resv_lock() @obj for @ctx will return
+ * -EALREADY.
+ *
+ * Return: true if the lock was acquired, false otherwise.
+ */
+static inline bool __must_check
+dma_resv_trylock_ctx(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_trylock(&obj->lock, ctx);
+}
+
 /**
  * dma_resv_trylock - trylock the reservation object
  * @obj: the reservation object
@@ -421,7 +442,7 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
  */
 static inline bool __must_check dma_resv_trylock(struct dma_resv *obj)
 {
-	return ww_mutex_trylock(&obj->lock, NULL);
+	return dma_resv_trylock_ctx(obj, NULL);
 }
 
 /**
-- 
2.34.1

