Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E08A2C0432
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AF989FC9;
	Mon, 23 Nov 2020 11:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F1C89FAD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p19so12927524wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0idKtGJTZ3eV2wLeGxjJ8blqSNYptwaWGPv5a5zic4=;
 b=hQxod/4O674zszb8RygkHLWu7NdAN+sjg/VYnQ1fWPLJQi+nO7oS/Q9B2PMoGUnfll
 u+d3BZWc4kp0yQUQXXMUoHnDNrgLelIdYT28LHhDGxoX17+8/oHPznTGWlh3N4BrKygd
 DMplyGtPJGFYBKof4mNSv2Y/5DuUfaJ7csCtOnuuOCNMMvI4IU7xiL7+hqdJaFoqHKiU
 /JzeUWNEJxi6vtabgHU5bE4Th+FL0Yuyw0sGYSYN8IiQykCkkczthgeTADQHfxbzuqfL
 ILU95YU9qbtYsl9Myx7i1hvj/fStJMZ5Y/HqcLvEIJb0pbliVeEyEV7HxZu/3HmtvbdP
 huqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0idKtGJTZ3eV2wLeGxjJ8blqSNYptwaWGPv5a5zic4=;
 b=YXyZb9Kk5jsNWZwKQHgVErAp14tIVfOFhAbDGJczmq6OcSrOFtJLdqX7ysslV5kSTx
 poer+CGB3KJ4V8DWUrVFgatiDHSe0jNi77HDzmTb0JxLP5uk7vbirHjn2CxIIJNAFM2/
 yfMveFcoqbgqRrLDIB72FMG3Q4ObXeDQrPwrueAOtY9yxRvzB/pypLG8hfOzF2zh/8v0
 SBAx56le0G5/6F9svMJwfQ3fulP4OpAtKj8yecxO0hxM/l2fCJsGdXY4xlxmG6eeIK5+
 w6yjq5h2u860mHAgyx8CqOmS8JI9X4JiDEDKWz21KKZ39R6GZMJ+GL6OzYw8eM6gzDG3
 P71A==
X-Gm-Message-State: AOAM5316bzVoeVOcZw8I1QXAXNol6SBmsCgM5RQe19hiYVivW1PnCtvs
 ETJhmvtsZ3fOAouwe+USmDCVVA==
X-Google-Smtp-Source: ABdhPJyY8lH30XYo80J+rnqQXr9BnzfsFnx27ygSUV7MIdA3y1Hs37Qs509j3j5OsS3eU3WorwBbrA==
X-Received: by 2002:a1c:f017:: with SMTP id a23mr23705686wmb.56.1606130407603; 
 Mon, 23 Nov 2020 03:20:07 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/40] drm/msm/disp/dpu1/dpu_vbif: Fix a couple of function
 param descriptions
Date: Mon, 23 Nov 2020 11:19:11 +0000
Message-Id: <20201123111919.233376-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:150: warning: Function parameter or member 'dpu_kms' not described in 'dpu_vbif_set_ot_limit'
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:150: warning: Excess function parameter 'vbif' description in 'dpu_vbif_set_ot_limit'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 5e8c3f3e66256..7e08f40e7e6fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -140,7 +140,7 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 
 /**
  * dpu_vbif_set_ot_limit - set OT based on usecase & configuration parameters
- * @vbif:	Pointer to hardware vbif driver
+ * @dpu_kms:	DPU handler
  * @params:	Pointer to usecase parameters
  *
  * Note this function would block waiting for bus halt.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
