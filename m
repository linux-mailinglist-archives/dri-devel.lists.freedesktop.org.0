Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C975F45CF44
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD05D6EDEF;
	Wed, 24 Nov 2021 21:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127B96EDEE;
 Wed, 24 Nov 2021 21:37:41 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id v19so2935086plo.7;
 Wed, 24 Nov 2021 13:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8cR2Y+uX8vVDrjMHw+aD7NNLHEizzFUKMzZGd0OO/tQ=;
 b=DNHqaPjtfvEq9kQLU9i+7ddrNHG+eAa6dSoHcfbT0frOtu2yHKBWuSQAC5kVp2auot
 o77TJdLzxjmR/8hGfhPiSe02pLBcxYmAVdVWmeD9kqT9JhLQmCk2HfAncbPoBcuCqTQi
 DhJ6Rr4nwg44U2DD0d4IgAroAQyqluJ9wKzpLjSiw8EhBfOGD628ruN7gsDQFehXVosA
 GPaicTyZOjXnXcXE+BKnOt5LDN9AyBLnmsWIVFWiJKIB/p2K3Zr2/XPoKyCKGw5pclMh
 QgNqUs15cYmYnoDTB/WsQF6ukX0qFa8VPFzfmfN+KFkHz5n+I+/AntqNy/i0zgTLp0vT
 db/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8cR2Y+uX8vVDrjMHw+aD7NNLHEizzFUKMzZGd0OO/tQ=;
 b=z2w1bhU8XJcqYbpto6RmBRSF7WjKHw5HydN0JsTeltshoaEN1odZ33pKFHhgqn7XdP
 T9Lc3WffeAc1R4A/v7eRtlkv3Tz+204ogsEtIv7D83vfJSztVjY6PHPqcLtHgQwzl+8X
 vxjq+FrJ2YSAjYHqfeIxra1doemQeFc3SPCL/ZgB+8uhywhNo+6YytkBP4un48MVEAo5
 Hoh7nOhudPHrY80p12KFX+Yyk+lYtZsuGEgTKcYvCLy8DJL1rkMKw16sm/lca4QUyIsY
 XR/Pd9KMRmk9FgWLIM7n/Ot8/kQ/ipEIw78Bn7gTXBnYEgkQ7OWcDUDw6gk4D1c9+eWg
 NDmQ==
X-Gm-Message-State: AOAM532EuZP5u4Dgl8/4xZCYkz5CfK6oirxGGDkvwtFpSXPZRP9RkPC9
 NAQAFqenrGonMr8IMekM4t/2ziH/R20=
X-Google-Smtp-Source: ABdhPJy/qt89x2ESb7NNGbAOo5VrcJZp7SdllwWJTZOxJIW11cj43KGhzdzJYYs52ELKCKLAiVT6vg==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr230252pjb.49.1637789860041; 
 Wed, 24 Nov 2021 13:37:40 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 o7sm536970pjf.33.2021.11.24.13.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:37:39 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/msm/gpu: Add a comment in a6xx_gmu_init()
Date: Wed, 24 Nov 2021 13:41:35 -0800
Message-Id: <20211124214151.1427022-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If you don't realize is_a650_family() also encompasses a660 family,
you'd think that the debug buffer is double allocated.  Add a comment
to make this more clear.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e1774ea342b1..3e325e2a2b1b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1531,6 +1531,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_memory;
 
+	/* Note that a650 family also includes a660 family: */
 	if (adreno_is_a650_family(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
 			SZ_16M - SZ_16K, 0x04000, "icache");
@@ -1547,6 +1548,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		if (ret)
 			goto err_memory;
 	} else {
+		BUG_ON(adreno_is_a660_family(adreno_gpu));
+
 		/* HFI v1, has sptprac */
 		gmu->legacy = true;
 
-- 
2.33.1

