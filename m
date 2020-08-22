Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F9F24E928
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 19:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14256E0F1;
	Sat, 22 Aug 2020 17:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A4D6E0F1;
 Sat, 22 Aug 2020 17:52:01 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id v15so2523325pgh.6;
 Sat, 22 Aug 2020 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6pe9e9T2twD5/s7EIOh11y2F9Qe9Loy+s9jYVy+9GcQ=;
 b=Kae2hkjtqCH1AQ3t4ujJSspPFilOMnRYd30SkprY1/HQlAqanO9AnTcVRpuFx1naL3
 jvJZFzPdgU8U5LkBJm/ThV/bfJgxViwpzT6V4SCi+j8C5XVTSAc4aj5KtUHQbkKrhAyz
 Ty3YxQXHJDRyx9UsRAW8ZRO5EEo4brOuXoOfRuP+k+TokknisUrOix68px/R6BRJ85yX
 epWv9DFDNYSA8dfjoIwwCnaxGoZRbOt/r7Cqk9+Yv7OGX/fFEg6P+EEt2o77qyKYxTUn
 PzMA0P23jZeEatVaUuDbqHNoI9LAx97fH3I1x1Z3sMhBr38uDZJTEsNtJGWgGj1iSH08
 bZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6pe9e9T2twD5/s7EIOh11y2F9Qe9Loy+s9jYVy+9GcQ=;
 b=C/wzC9c7B3EAWk31ac7AxDRKEIvMokm/RwpzP0WE8CUQyXo7ZQWz6SByhbsebfV2gL
 HLGl6JEUR587GAZ6S/AK/nL4KX218I+ck8uRqkfMl0DN+Q3/Z2fbIOc3Fszr8bw5N7If
 l7BWK/tBPKeEmuqnASTDQA8FrkctQxNIfY/uYiBP0q44AELidP4vCudA8phqd65b94XP
 Yp23fK1vfH3JsSwe5RYhAfdmQIep1V/mszdzKRTSNea8/AdPY0xvEdXHt8CfaeffW1N/
 BxqfKqzaEtWkfn5naYm58tMtKlufmjAAhj6O2ayCTdaZMdQA2lChimDHaocTT3Ktt7nd
 HX5A==
X-Gm-Message-State: AOAM5303kd7pb1S2lqv37DmZmETK13jlZwW/2PnpmuZvipY8yRvDsT4F
 Kwm7uSbM3+PJYmIVfH1CONrcDjUg8M74Cg==
X-Google-Smtp-Source: ABdhPJxTIF8SEg5kQ7iKSi30Rkzh/VQZDW09KS3xVrB6DSdOUljq+/rLGKP+iwW+mx/5pQhPJb/Byg==
X-Received: by 2002:a65:49c9:: with SMTP id t9mr526692pgs.256.1598118720669;
 Sat, 22 Aug 2020 10:52:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 f19sm5496232pgn.10.2020.08.22.10.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 10:51:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: drop cache sync hack
Date: Sat, 22 Aug 2020 10:52:54 -0700
Message-Id: <20200822175254.1105377-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that it isn't causing problems to use dma_map/unmap, we can drop the
hack of using dma_sync in certain cases.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b2f49152b4d4..3cb7aeb93fd3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -52,26 +52,16 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
 {
 	struct device *dev = msm_obj->base.dev->dev;
 
-	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
-		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	} else {
-		dma_map_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	}
+	dma_map_sg(dev, msm_obj->sgt->sgl,
+		msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
 }
 
 static void sync_for_cpu(struct msm_gem_object *msm_obj)
 {
 	struct device *dev = msm_obj->base.dev->dev;
 
-	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
-		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	} else {
-		dma_unmap_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	}
+	dma_unmap_sg(dev, msm_obj->sgt->sgl,
+		msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
 }
 
 /* allocate pages from VRAM carveout, used when no IOMMU: */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
