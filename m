Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65263D0B6C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5346E81C;
	Wed, 21 Jul 2021 09:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9557C6E81C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 09:21:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso569964wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kvjkshBsZL+MRjib8570PI/tuRb4iFlF0PaMehLZjJ4=;
 b=aPZ6bqW2WIiaB2KzWUPxLT58PsGbNp7k1mBkxoX4qsJgP7NH4XQv3nvh0dUSKwc1up
 MgUltM82BREA7GYRrqI+zgWVpRV3P+55PTiTVDRM/qHrrYQ0q9Wmy9NBPPs2rzyZpsRR
 E8jPzvwe/t7UMYaNEMokY7uclkmVJEYHiwpXQ9AFJvg7dm1YgwpHl0izRd5lqVJeq5Qi
 frfdghX4QpQHU+nEECqGdHaZPnUpOuBzx5R40XRTlttvAp9j6w6pYA+STl3mSUkaU44V
 6hG6AlxAkFuBGnmWAj5wxh+3tG+eXLK5v+0zTS6htPIMdq0dLWbqWk3thO5sBgb4PGo2
 5R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kvjkshBsZL+MRjib8570PI/tuRb4iFlF0PaMehLZjJ4=;
 b=W0UPdkrKt8F3CBQsUn6qGvskTK4lAlL1j61qZ2vp8M5A4mrPJ+FY30OcjtCGwgIt5f
 PCPVxdOe3DCprLUxEFQ1gaLxlKuafs4AjQIg+XvVEq6IcdAdeAhlnZMZg5VURI2Cazao
 BEZCtkGd8AMhA4/OXxbytCgnBsyeZQMjREgQvW2pJj6p8CQ+m1Sgo8XFb22x7S3GwAFa
 0fUoRO7Sw7DLDceqL5VfMUuXf9IXEtDJBYt9QHIpJfN3lsUGKknfiexEnuM8GgBqsrxz
 cDz0FopebCr28vql2ZAJF+iVrQ4Cu7a5MzilumFnLdGdV39PIcVcOAEIcZtNebuLj8FS
 0iAQ==
X-Gm-Message-State: AOAM5321TEupOP5p71b/yjk8ngRoSwDYiS2LMlwc5U2ZJ91RBk3b2YxB
 wUZHBB9vrvlRBCCylRgRoz0=
X-Google-Smtp-Source: ABdhPJwk4aqKVntEPERivi0x/ffBlIk0USEgvF1Z6VRMIQ0+7zHLxtB1UcB0tZhk+RtI/sx36LnIHg==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr36017769wmb.170.1626859295247; 
 Wed, 21 Jul 2021 02:21:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:41a7:7431:f7fe:c1b5])
 by smtp.gmail.com with ESMTPSA id d8sm27157871wrv.20.2021.07.21.02.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 02:21:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dma-buf: clarify dma_fence_ops->wait documentation
Date: Wed, 21 Jul 2021 11:21:32 +0200
Message-Id: <20210721092133.2817-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

This callback is pretty much deprecated and should not be used by new implementations.

Clarify that in the documentation as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..a44e42b86c2a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -214,19 +214,15 @@ struct dma_fence_ops {
 	 * Custom wait implementation, defaults to dma_fence_default_wait() if
 	 * not set.
 	 *
-	 * The dma_fence_default_wait implementation should work for any fence, as long
-	 * as @enable_signaling works correctly. This hook allows drivers to
-	 * have an optimized version for the case where a process context is
-	 * already available, e.g. if @enable_signaling for the general case
-	 * needs to set up a worker thread.
+	 * Deprecated and should not be used by new implementations. Only used
+	 * by existing implementations which need special handling for their
+	 * hardware reset procedure.
 	 *
 	 * Must return -ERESTARTSYS if the wait is intr = true and the wait was
 	 * interrupted, and remaining jiffies if fence has signaled, or 0 if wait
 	 * timed out. Can also return other error values on custom implementations,
 	 * which should be treated as if the fence is signaled. For example a hardware
 	 * lockup could be reported like that.
-	 *
-	 * This callback is optional.
 	 */
 	signed long (*wait)(struct dma_fence *fence,
 			    bool intr, signed long timeout);
-- 
2.25.1

