Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FE63F1A7B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981B76E831;
	Thu, 19 Aug 2021 13:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80296E831
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:36:44 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u3so13054765ejz.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BAopytyK/R8bUpbK+b7Q0+6GCUrOVsER44boOsZ9dQ=;
 b=UeVsli6ZqeVfyxuDP82l6Qchdxd0SS9uCWKergbqRpdGjWukw6CdmP19lDB0j6CeHc
 kZoC1YnwRSRcSKTrfDIP46iuVub+8E5lBPazngHEZVtCxE8Dt99wvylfuFdsJxJTKcei
 tgQwEKfYgXVjIv1RvlErvCsIk0WxVwr8WrCI74L3F26QlW7QyC7Y5NRDLhGrdVguY501
 hB6uoV6dn4V6XN/KCizDVURHciZZrB8Qcjs7iROlCpv14cTfzS2vaZ8BbBqS+9lSDE8U
 6DP4dPYFalWvW/zQpp560Ne0VjzaY5T/Db8Zn2uCZAWs0Ei5wlpAYXCdvXYO30jaIqBe
 /I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BAopytyK/R8bUpbK+b7Q0+6GCUrOVsER44boOsZ9dQ=;
 b=BfVgL+xMcLkIx/9xZPd5LKtU7RuHhYC0+8N/l3GcarOwuwun4GxAfA33WhivgHCYLO
 eFnZUAHpnu4mGpxxLM5xRMqmIsvLT+ySTAd4aENw38Gm2URN0JjsqKKAKAL3ZgOtpBuK
 /QMkTAlkNjlI+tmpGwuIUJtkJEu4/GHRgMAPMQA5cvwBTy5C2joCpeEzll+EIdO2LaL8
 zQp42gYlUYfHrFhxqmvIeOE3SDnasLs3UpxcdLeSMxVOeopM/VGnmAMDoh8Blpa3Ig9u
 LCCQFxe/YGEMHtGaO80iFBj8V7AjdLqMidUU7FemwQnnLPIoDOPHJS3pF45FScNftJJR
 0v5A==
X-Gm-Message-State: AOAM532arTye+tlXtdiOilev994Dn1SNlJBmVhwAJp3IcF2qyaAocm9w
 qk4wMkzTFp73L6HhnFFLbFJ6SQ==
X-Google-Smtp-Source: ABdhPJzWpeXlmAlC6oKFJXd83aDooz5YGi7xRGcALh6ivDz0hfP0Xwl6LH+PhBTG6C5khTlVBapj4Q==
X-Received: by 2002:a17:906:ad7:: with SMTP id
 z23mr16114025ejf.419.1629380203406; 
 Thu, 19 Aug 2021 06:36:43 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:eb3d:3695:30c3:3572])
 by smtp.gmail.com with ESMTPSA id ay20sm1770138edb.91.2021.08.19.06.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 06:36:43 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, abhinavk@codeaurora.org,
 angelogioacchino.delregno@somainline.org, mkrishn@codeaurora.org,
 kalyan_t@codeaurora.org, lee.jones@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1] drm/msm/dpu: Fix address of SM8150 PINGPONG5 IRQ register
Date: Thu, 19 Aug 2021 15:36:36 +0200
Message-Id: <20210819133636.2045766-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
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

Both PINGPONG4 and PINGPONG5 IRQ registers are using the
same address, which is incorrect. PINGPONG4 should use the
register offset 30, and PINGPONG5 should use the register
offset 31 according to the downstream driver.

Fixes: 667e9985ee24 ("drm/msm/dpu: replace IRQ lookup with the data in hw catalog")
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2e482cdd7b3c5..420d78cfce8af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -794,7 +794,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 			-1),
 	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 			-1),
 };
 
-- 
2.30.2

