Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA73BF5DD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 08:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3CC6E156;
	Thu,  8 Jul 2021 06:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104366E155
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 06:56:21 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id f20so4626351pfa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BAyx8HGJRdLOBdbNiU99QlY+5w2alIzKC7hMMjJk8E=;
 b=NHKTbL1+5esONkdEeIVUEHanUegxhWFq3mH2qGjsXdj1X4CnZ25OcIeCnh1Cz26/fD
 kX0pEMz5+wuULkM4jGkngh+2zCZzZ//MWkaMBjnnQj1BxLgsg02dZLG+cN7b2Z+y8sow
 h7S6o4wsaeft1bc7Ih5xOyZb+/4dtQEJdUkPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BAyx8HGJRdLOBdbNiU99QlY+5w2alIzKC7hMMjJk8E=;
 b=LlehrVx3r1xVrzwPDKQOsKbZsI/hAGuVhTM5efaN2r8w+uIrWfZ+RjjYxRrPjJW/Fw
 iGurKOm6xDI60Qj0JRkVf7nb/imUYnYiGuUYwbc3hvfq45CbN88VUbrdyNKEZinBXZgx
 0ZgJl6yTAjHQeuylPIlNFd361s6/bX7P6mhgNGjAhKUlmhqO3ZGX+ZkNvPfqaBII9klV
 Yfk/7muh7RD1MPfUai9Zzx3WlDb77oO5tSjAPaTGGM86odun+KLoKoFpepNUrboGlm7M
 hII16/51gaSGO3YYGoCNyFphvLyxketXfwF6GKjPed78icn7xQpcNWB6mUJ226xN/z97
 VZOg==
X-Gm-Message-State: AOAM533YX6EOZ4LjNCDHcTz7tb1QkCdoTUmoqWs6zegXlBSWo9V2hxX/
 ySYePoSaRpjV4V5xzl8vGhzolw==
X-Google-Smtp-Source: ABdhPJxigodUsLw90BixpU3dO51TKFxRvaaErkAE8oVzv77ily6wyBUHpPvwY3JTNwAh2mxe/+P+EQ==
X-Received: by 2002:a63:e043:: with SMTP id n3mr6974211pgj.106.1625727380608; 
 Wed, 07 Jul 2021 23:56:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:82ce:1825:c0a5:9605])
 by smtp.gmail.com with ESMTPSA id a23sm1120910pfa.16.2021.07.07.23.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 23:56:20 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/dpu: Add newlines to printks
Date: Wed,  7 Jul 2021 23:56:19 -0700
Message-Id: <20210708065619.999199-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some missing newlines to the various DRM printks in this file.
Noticed while looking at logs. While we're here unbreak quoted
strings so grepping them is easier.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1c04b7cce43e..0e9d3fa1544b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -274,20 +274,20 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 
 	/* return EWOULDBLOCK since we know the wait isn't necessary */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
-		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d",
+		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d\n",
 			  DRMID(phys_enc->parent), intr_idx,
 			  irq->irq_idx);
 		return -EWOULDBLOCK;
 	}
 
 	if (irq->irq_idx < 0) {
-		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s",
+		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s\n",
 			      DRMID(phys_enc->parent), intr_idx,
 			      irq->name);
 		return 0;
 	}
 
-	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d",
+	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d\n",
 		      DRMID(phys_enc->parent), intr_idx,
 		      irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
 		      atomic_read(wait_info->atomic_cnt));
@@ -303,8 +303,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		if (irq_status) {
 			unsigned long flags;
 
-			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, "
-				      "irq=%d, pp=%d, atomic_cnt=%d",
+			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
 				      DRMID(phys_enc->parent), intr_idx,
 				      irq->irq_idx,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
@@ -315,8 +314,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, "
-				      "irq=%d, pp=%d, atomic_cnt=%d",
+			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
 				      DRMID(phys_enc->parent), intr_idx,
 				      irq->irq_idx,
 				      phys_enc->hw_pp->idx - PINGPONG_0,

base-commit: e9f1cbc0c4114880090c7a578117d3b9cf184ad4
-- 
https://chromeos.dev

