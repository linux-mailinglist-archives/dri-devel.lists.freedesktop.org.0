Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3323B9F9C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E526E106;
	Fri,  2 Jul 2021 11:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B866E105
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:16:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gn32so15610209ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 04:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bAUQPXbSkvT19k/XhsYs0cmL8Bgj7Ny0WAGbdIQQDHQ=;
 b=htu1X4WFwBHbFRXePki14xQ0DdDNrq5wcPcKSlLx6nrrZ5AbINucJcwmwb65tic2Lm
 bZuOgKshl8GHe2JteULiueYTBjOlthJ1jAMtLVYW2kmSFUKd4MHc/ei7pXcRSN7Xw5iL
 M2AuhmqkvFXEnzdOGn3nAgdokUUrwm7pOz/KxxvwXUg5zniEAZaT6IdB52xvPxz/IBgM
 tMPAe0uE0UYEJazKDHQA+FoInRfHp9mPd1XYtZll9MLG0Rq4eVLhoy1Rjyk/tDCqYc+D
 zlrRfPaBcBQ1Kmb6s+/4FO0/Ji/uya+VQ4+qVj8+T/ab1iuAp8sO1gGLknWmO37IT+zT
 B0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bAUQPXbSkvT19k/XhsYs0cmL8Bgj7Ny0WAGbdIQQDHQ=;
 b=b9IdSRs6bQ58K0bY+8HqdLyQWHGQ1xjrePdKTx2eLMdoF7Q50aiQW7AEg9lnoBDaGE
 G3ZsYoEZU+YIHmax80c/AFoEaNxn9Dy9QxnCdfo8Ypin6QMUOa2cAB3JQogwjfzfcCF0
 pudWFuDae8V3uXJya0mu7t39Yd+RRb6JZhEN4KVK4SltQOcm/g/GXC7S7LrrqLQOCCAq
 YClnK/N4OF7ngx5NMn0g4XCKJCFnc7Gi3IksONEFWOjwa/3cO64XX1FyQwHM91gjFztx
 AXT5RrlcejunNO8xwbO4VoWw/FALT8l2GOEBGdxFLSZWitCfhYdOSzrG6LsboWClrXMe
 DXvA==
X-Gm-Message-State: AOAM5312S5YXjUH7/zxyk17mdFsHjgCbZmSJLTGflhsERoLVZ6wTBt9g
 lmYx2L+YEtrv81x/F+fgqm+PeEFcTvQ=
X-Google-Smtp-Source: ABdhPJyRgjzwscGIJoyF9znrXrJnDrwrc90UNbbWde1C3zuxN949aMgabFfCOgc4z8mzNuJLPTN4Yw==
X-Received: by 2002:a17:907:948c:: with SMTP id
 dm12mr4792888ejc.486.1625224605221; 
 Fri, 02 Jul 2021 04:16:45 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9bc7:a922:a595:15bd])
 by smtp.gmail.com with ESMTPSA id g21sm937286ejf.25.2021.07.02.04.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 04:16:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 1/4] dma-buf: add some more kerneldoc to
 dma_resv_add_shared_fence
Date: Fri,  2 Jul 2021 13:16:39 +0200
Message-Id: <20210702111642.17259-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702111642.17259-1-christian.koenig@amd.com>
References: <20210702111642.17259-1-christian.koenig@amd.com>
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

Explicitly document that code can't assume that shared fences
signal after the exclusive fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f26c71747d43..4ab02b6c387a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -235,7 +235,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
  * @fence: the shared fence to add
  *
  * Add a fence to a shared slot, obj->lock must be held, and
- * dma_resv_reserve_shared() has been called.
+ * dma_resv_reserve_shared() has been called. The shared fences can signal in
+ * any order and there is especially no guarantee that shared fences signal
+ * after the exclusive one. Code relying on any signaling order is broken and
+ * needs to be fixed.
  */
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
-- 
2.25.1

