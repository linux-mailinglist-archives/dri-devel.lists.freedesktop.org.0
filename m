Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB8400523
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727536E8D1;
	Fri,  3 Sep 2021 18:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F0E6E8D1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:44:19 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so150775pjc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=31jt7QK/9p5C4ADlv88LMXP5EVEdNDb9tmwFIJMLC4k=;
 b=qDJrFouyCfFeLGnUbBR95iExuYEIHyianFD6naRgO7dfxR2y9NADfeSqdQuNE+FJP9
 E0Sm4AaAcVXgb7ItBoEq1Iue3+aYiFwCDfaXrcFO+hJ+CTd1JP1+v4GAaP7dlMdtXzo6
 sCevxf1S8rW69vkzS4YlO32nzt2EwbQhNUeHTi6KmHcz6lpGQq9QYzEYx5ZwcsPS4eYn
 b5eZur8Smg2NtgeTQXEDS2Zq7A5VrbBKomXnqtw96gjnrH5SY/tJD6jSk6HnTtqOi3rX
 QJv3DWZde2p64pTjBa1sKF0dNN3uEeMz/nsLOotmS46dBO2qtWO6ZK+KgQiEMO0DKB/X
 D9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=31jt7QK/9p5C4ADlv88LMXP5EVEdNDb9tmwFIJMLC4k=;
 b=EM0WY8OlprcJETWPZGHjPJNq9hQDiRYMjQ7i+mf4LQ72sy6oyyN3gQvqoSnDWUg6ec
 KCs6jCFy19dRNMCB6xImmW2z1mHKIsJk+++b3WGG1VyWVx8hcONotx9w78xomDw28pzc
 OEOEJghHGEqCea1A+Udz1iUgQHf2VJ7bp+3qKDZtDTxlxHvRt7r06xybZkKee0hdI9/7
 wfqa+mJJ0rDRIyHUErNrby21PHHHfeuxm8mOE1ZAUIIRBZNcPnymV6vh1t06bK/EkIsL
 EGYVcxYNb1vFUGahKwLCOfinKGoK0Icp8dTxpOGb4FkbUi24pA/OSTSdeWEBNr3iZrz4
 IOpA==
X-Gm-Message-State: AOAM531Q/AAFZcFaAlbsXPkLnyq/AVlMCNtxE9yivxHBDU7Ph3T9krjF
 /+5XRlS7GpLyXB1HhOAmCjIu/TslJkY=
X-Google-Smtp-Source: ABdhPJz6kyvVGuIf5Nqgp1yrWhHs6MzCixB5+jjmT64dNTD7WkrgEvidF5J/wT0yLD8G5WTB+b3pag==
X-Received: by 2002:a17:90a:1904:: with SMTP id 4mr317144pjg.217.1630694657983; 
 Fri, 03 Sep 2021 11:44:17 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 h24sm113360pfn.180.2021.09.03.11.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:44:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 7/9] dma-buf/fence-chain: Add fence deadline support
Date: Fri,  3 Sep 2021 11:47:58 -0700
Message-Id: <20210903184806.1680887-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
MIME-Version: 1.0
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

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 1b4cb3e5cec9..736a9ad3ea6d 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -208,6 +208,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+
+static void dma_fence_chain_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	dma_fence_chain_for_each(fence, fence) {
+		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
+		struct dma_fence *f = chain ? chain->fence : fence;
+
+		dma_fence_set_deadline(f, deadline);
+	}
+}
+
 const struct dma_fence_ops dma_fence_chain_ops = {
 	.use_64bit_seqno = true,
 	.get_driver_name = dma_fence_chain_get_driver_name,
@@ -215,6 +227,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 	.enable_signaling = dma_fence_chain_enable_signaling,
 	.signaled = dma_fence_chain_signaled,
 	.release = dma_fence_chain_release,
+	.set_deadline = dma_fence_chain_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_chain_ops);
 
-- 
2.31.1

