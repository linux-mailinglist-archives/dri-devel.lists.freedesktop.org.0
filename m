Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725BF3D0B6D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3116E904;
	Wed, 21 Jul 2021 09:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3366E81C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 09:21:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r11so1379833wro.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t19VNYD7z90zjqfUtw8wZympFk0WCxWbJcimp6O0h0E=;
 b=BRSl6PZPvRS9Zsr0ONHAYPW1HYeGC3iNC5vnxjRTJI+upxd+ItsR6vIJaCrkPzW9rJ
 KhfWqOqX/32uf7qrUPT3+aZCRkEC9fn3HTRgHHJo+y4RhEGHKwnd6KK1dD9bAyFTwy+D
 /pNlpRFOHi/Bt1jr+FGGPebJF91il9yDWf5NN8O7hClzOTxOBlHL1K3gXheXSeIffNe/
 h8CWEk/+0UPwLNf4aZ2/DzqxeevCfE+AF0IliEMekvXn9lICXqRcYAY3exkYEACSShj0
 eASYZEjTvXoegNbK/0rvwW0EWQXaTvuyNDxHS+35vNZl2d1AgSrfg6gm4I7zD6Rqc+Xl
 AJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t19VNYD7z90zjqfUtw8wZympFk0WCxWbJcimp6O0h0E=;
 b=RVdV/ZUK/z/RTm5OUq8oujVjKTM2SBiSRYylX+aMwvNQt57/sR6d0ISeeo87hNLFRL
 P5uFE9sxgrzpUFOkFhXI2CKjoIq1Mc814+u6GKWG9I2IxqDrz6O2/P3CTmLJ6OTUqNWW
 2C3e+5vSeAEshWO3sr1wj5hlkR9NvCnkdXatDeKyYYg0syoBtuQpS3AGE22jOSL/quyr
 Xa1W9rNUxLsoQUGMvfpta8mWsC1szkj2Yt8NNjBWOh9SI7WNlqwN5PGKXjziMzlS4Ywm
 VhnENlf6Cc8H049uTWK6GdOIAsszXCzye0XKzNZn2NO0mgY2cCAOe/iZUIZ9GIG0vsuh
 knKg==
X-Gm-Message-State: AOAM532WSy4c6InNtxa4YZX64vMxF6rZOTTJl6NPQsKcIOy/QV1aHaAB
 jpW/0TGTgvW/q0p/0ueUyVmN+mmAQ8M=
X-Google-Smtp-Source: ABdhPJzO2QbS3WlZAk0s4sK7zSbaIyNg1nZAlKtqyZcLtwD/sS6q8SoNvMsZ7UsTTNeflJA0Z+TGHg==
X-Received: by 2002:adf:a287:: with SMTP id s7mr40874238wra.120.1626859295810; 
 Wed, 21 Jul 2021 02:21:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:41a7:7431:f7fe:c1b5])
 by smtp.gmail.com with ESMTPSA id d8sm27157871wrv.20.2021.07.21.02.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 02:21:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
Date: Wed, 21 Jul 2021 11:21:33 +0200
Message-Id: <20210721092133.2817-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721092133.2817-1-christian.koenig@amd.com>
References: <20210721092133.2817-1-christian.koenig@amd.com>
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

That the caller doesn't need to keep a reference is rather
risky and not defensive at all.

Especially dma_buf_poll got that horrible wrong, so better
remove that sentence and also clarify that the callback
might be called in atomic or interrupt context.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..1e82ecd443fa 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
  * @cb: the callback to register
  * @func: the function to call
  *
+ * Add a software callback to the fence. The caller should keep a reference to
+ * the fence.
+ *
  * @cb will be initialized by dma_fence_add_callback(), no initialization
  * by the caller is required. Any number of callbacks can be registered
  * to a fence, but a callback can only be registered to one fence at a time.
  *
- * Note that the callback can be called from an atomic context.  If
- * fence is already signaled, this function will return -ENOENT (and
+ * If fence is already signaled, this function will return -ENOENT (and
  * *not* call the callback).
  *
- * Add a software callback to the fence. Same restrictions apply to
- * refcount as it does to dma_fence_wait(), however the caller doesn't need to
- * keep a refcount to fence afterward dma_fence_add_callback() has returned:
- * when software access is enabled, the creator of the fence is required to keep
- * the fence alive until after it signals with dma_fence_signal(). The callback
- * itself can be called from irq context.
+ * Note that the callback can be called from an atomic context or irq context.
  *
  * Returns 0 in case of success, -ENOENT if the fence is already signaled
  * and -EINVAL in case of error.
-- 
2.25.1

