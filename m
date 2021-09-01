Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEE63FD92B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 14:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644D6E1B5;
	Wed,  1 Sep 2021 12:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4606E1B3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 12:02:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x6so4054278wrv.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 05:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t19VNYD7z90zjqfUtw8wZympFk0WCxWbJcimp6O0h0E=;
 b=G6ETOEwW1DPJao3SNyHPhkWySxellpwcrOanOx+H/U7C60K1lguHGdZmCJRhXBf3wf
 DBTcqxD2TEZNZSpFgA2EDgdJQU2E86xO5+toACv95jPAd5le/2TG6Vy1WGZJs+gH8kGh
 ek7/eCwhfvaygdmXw+kUt35t/X6Dr8xxXyg2RzH7xXSvxXi0kVpusUS2v3NW6rkMmgU/
 bxMvFO6cbDpiMe6jPWR5ZjG2TRrT2r+PxeAK2jBwsBILg+CM2IZ2sBusluOmYs83rD6f
 s4WH4X2oNm2nxupCldljLiylGJhtgBKgqjCKSXoVB2x7OIsXE+gh0TYAGmA3VVA42Ft1
 o4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t19VNYD7z90zjqfUtw8wZympFk0WCxWbJcimp6O0h0E=;
 b=DZnMAArcJC5MRNv0moWi59Yt9HfZQ/oP51f/1zetz2BuDMEwqS55mtZeRmJ08NyD4H
 1AmSMpyBvjxM3nlarPHfKEwpPB+wtzvzBYUo58COsCn5sWlqs84NBAIkUhugkLvpXUsR
 s0A+HlLG7HXH708ZO5q9YMpIY6G+5zUerois0UVjUdEBSA9ZpSXXDkQ0/kayQfqvDeiN
 tLarwpMDahJU5EnzF7+Vdz6vNL2ahOGGM/H6C6YHh27Oy8g7mZ5BgT+9xwVyOKca/Jm4
 sEeECNoMf3rBHM1L19gjxFScFuI/23jAVmAQL+UmtIEPFyknQC1PjVr3IExVDuXEipFM
 hsmw==
X-Gm-Message-State: AOAM530Y+XvpU7/KVwS2fu44F63q9jV+9H2XYIATpW/8dHTxcZdychyP
 Tm1fiwmyQseVjG/dnnrS1bGIWwtR9d1g6QOV
X-Google-Smtp-Source: ABdhPJwwDwe3tgn7MblJIyLmFJyjf2zJInaWT7+HVsxQIqE9k+Ba7sN30IGAwqd20tWoBoVKXpyneA==
X-Received: by 2002:adf:90d0:: with SMTP id i74mr36369414wri.185.1630497767938; 
 Wed, 01 Sep 2021 05:02:47 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l7sm5641336wmj.9.2021.09.01.05.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:02:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
Date: Wed,  1 Sep 2021 14:02:40 +0200
Message-Id: <20210901120240.7339-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901120240.7339-1-christian.koenig@amd.com>
References: <20210901120240.7339-1-christian.koenig@amd.com>
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

