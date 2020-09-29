Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A5427B8CC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 02:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86DF6E192;
	Tue, 29 Sep 2020 00:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D586E192;
 Tue, 29 Sep 2020 00:18:16 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z19so2776562pfn.8;
 Mon, 28 Sep 2020 17:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oy1aXlDPXrReF1gBpu82DpN2M0nTMmLTwJqtxAH2mCA=;
 b=gSZGDzL313qgnP9EOczNvz/gNDSAfTjbal1eD50rvCr3AiMcjMnYFcl0d0P5zY7clH
 wIWgqQtLsZ8WRVQ88FbJ64AbDkRyJSc0KgYIMTCZfRjHyQh7TCmOKFQ32elgcbIVZjZV
 XMAwl9JduHCTFpRahOlb5LODeoyTEftVTmgFCvMBq7Haef6PdNSrm9+o80fII+WcxCAT
 51Ftexs7DNsOieK+sQFcphWmgJMV5RYLsdxQG9ze3Qt9MItWm3Uu5sUwVQZ4M/5Ol8v2
 5bQmab8sY/LaxAZuaGWyIzHzaL1v3Utg1U8wG/H58rD7ohWpWATgZpSpnMaIApmoaaMq
 1boA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oy1aXlDPXrReF1gBpu82DpN2M0nTMmLTwJqtxAH2mCA=;
 b=bhb7Km+42rUhC/2grroYwcfrViBzxpLcZx1CJibEXR29SLMeNC4moZEv4CoLLpBHzl
 DkPLvUy63kw5PizVR41+yQmIvg9LiwM6jNLeNWkaOGYWXe3VNRChGUolTYnkmC/uTfkp
 ezmr3/zcDSOQyTBNiFwAyNB3HuBFhFqqE/DcFlG8C9TFCrEUPn0Jvuul6NL12qKj/z64
 +ePoUwvNKteEPmgOMoZaHWlU4SkmUglQdUlHsI/95Lg8+EdT+DdZ5wAumYtgcRh8LhSL
 tBXV1vy1VrI0DzwFCiFL+SJnYVCS2bjvMkjEZ6YRvh+tSWUUjzMY9EYXEepwpYAAWJhk
 ef1A==
X-Gm-Message-State: AOAM531S4pZ1FCwp7LOb9hCz4drdmQapD2JXm4QgkJezEecxzRTBJVgN
 kfDKV8ljpXadv56pvCH/ToDSOu16Pkg=
X-Google-Smtp-Source: ABdhPJx9B+EigXOvBOeQtwn7+Eryj+DGPRHycZtoFvJRN16DN8hlDsLfqlEYL5HT43IpE3C2I1JwsA==
X-Received: by 2002:aa7:9e4e:0:b029:13c:1611:6589 with SMTP id
 z14-20020aa79e4e0000b029013c16116589mr1765820pfq.6.1601338695189; 
 Mon, 28 Sep 2020 17:18:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 a74sm2939486pfa.16.2020.09.28.17.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 17:18:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: fix 32b build warns
Date: Mon, 28 Sep 2020 17:19:12 -0700
Message-Id: <20200929001925.2916984-1-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Neither of these code-paths apply to older 32b devices, but it is rude
to introduce warnings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index fd8f491f2e48..458b5b26d3c2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -209,7 +209,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	size = iommu->geometry.aperture_end - start + 1;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu",
-		start & GENMASK(48, 0), size);
+		start & GENMASK_ULL(48, 0), size);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index 029cc8bf5a04..de0dfb815125 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -879,7 +879,7 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
 	pll->max_rate = 3500000000UL;
 	if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
 		pll->min_rate = 600000000UL;
-		pll->max_rate = 5000000000UL;
+		pll->max_rate = (unsigned long)5000000000ULL;
 		/* workaround for max rate overflowing on 32-bit builds: */
 		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
