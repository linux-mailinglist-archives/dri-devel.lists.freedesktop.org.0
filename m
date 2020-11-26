Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60922C5615
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6176E969;
	Thu, 26 Nov 2020 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEF66E957
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so2189917wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jh3Zn1ResYGUShWTof3m2Q8rRwpV0wK8w2BTM5dDuqo=;
 b=rk6rWnUC9jqDQyGdupgrLNKrRSul0EHQaNGK+50NcidJxDqAvVUj56R5RyfXPBaGcW
 bSBgt/Ie1likRXGMHTQK+17lYRwCLYfSq3BJCLm2XxwMb8WXepCS7ge8/eZVo7gr/XGq
 kCuJM1R00G7RuwWlRH578S74u+AFIcbgHv3NFW66QOirRez6hZequRYFtFmwdFbg4jMK
 863oGkc9U1L7MDiHaIB9G4cRf6dOoqblbB/lUyg/otJbW4APSRCqt0ohAP2dgt2kagdA
 XI8RlvPRmdMATCk3eqe/Xzypb6nIQ8pzFcx6S/gzizO08IQOCYIyaI3A+dQLX9ehNMoK
 2wyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jh3Zn1ResYGUShWTof3m2Q8rRwpV0wK8w2BTM5dDuqo=;
 b=cvN0zljLa5wRpftC0eH1daTjexn7GAiOgRceUrhe3UIb5rHohJvg2Jx+XPyk9+emlx
 sSxuU9uJPMnp+R59FWipjovOv1W9EjkOYBZNkI0sCcOPExaVGCrlxDvLCehpJgKS2eZj
 Pbvx5qcbzaFk0coaNLjlT9G6n2w3zjov3wptTbVbQGSE+jw4d0AKQsVF0g27JJWR+iBI
 6vXcGRS8KyueXuIJsQvpB469gcJloK2lablM+qRoBhiIiDxvExKUhIx1ar1cO0haa7C7
 Mvp0IK9J1dWvAhkrJczegx3dOU2mhB221kKNgTW3cQIm25re4v0dpSHdbtry4r9K5F/a
 P0cg==
X-Gm-Message-State: AOAM532qx4pu3iOe2McNvBOUtEu5GLnM9VXOnt/CfiEQ8le/jyaNf5Oi
 vdCTQD+TOwE40iqf1SeiuQsc9g==
X-Google-Smtp-Source: ABdhPJyFeP+oHnYZ8ZhxN1ULaFwXRE6QX6gCCHEBKcQb558Ob57TmjG/rdCvrc4GTuL6sxomjXk/Zg==
X-Received: by 2002:adf:ee51:: with SMTP id w17mr3923479wro.373.1606398187789; 
 Thu, 26 Nov 2020 05:43:07 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/40] drm/msm/disp/dpu1/dpu_hw_interrupts: Demote kernel-doc
 formatting misuse
Date: Thu, 26 Nov 2020 13:42:15 +0000
Message-Id: <20201126134240.3214176-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Shubhashree Dhar <dhar@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:246: error: Cannot parse struct or union!
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:756: error: Cannot parse struct or union!

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Shubhashree Dhar <dhar@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 38482b1047745..5c521de715670 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -189,7 +189,7 @@ struct dpu_irq_type {
 	u32 reg_idx;
 };
 
-/**
+/*
  * struct dpu_intr_reg -  List of DPU interrupt registers
  */
 static const struct dpu_intr_reg dpu_intr_set[] = {
@@ -245,7 +245,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 	}
 };
 
-/**
+/*
  * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx in this
  *			 table that have a matching interface type and
  *			 instance index.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
