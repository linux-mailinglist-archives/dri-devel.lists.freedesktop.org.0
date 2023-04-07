Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0766DA6CC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 03:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77D10E164;
	Fri,  7 Apr 2023 01:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDC810E164
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 01:07:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x17so52962314lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 18:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680829662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w3a+69adOgPkxQyocC5BiinFT3JB1Qibigr0rq2G96c=;
 b=fIDZZ9v6947E0Q3J9sMM+dt8UO0ih+0RZNY8hHqTLr3H89mj4ZBLmEeN122vSa7uEc
 hAl1okX51h9tEX9GsdffWfTPjjTUnnmFRCepSggoM2GfdqABoaovIMGZIXcPbl+mHV0s
 C96a2n9avrnVw7QAZRRA04zcWZdH5qZL/+dc26EvISAZjzLfM7Jt8mmDAdpLZOrhe23i
 kTfskEd707+LTSqKZvWv1PFKBivt2aw21tUyFoevs4UXqUx01WagCpqZQSHr8y6TxOP1
 CKpuYnuEA1p118HFF1e7ZTR801HZNvxEUVx0WL030Ac7ppVEyYql71vvEb0JK0uD+plO
 xUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680829662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w3a+69adOgPkxQyocC5BiinFT3JB1Qibigr0rq2G96c=;
 b=pn0Dxktz/tzRKeNS5Lz3lgsIS3LtCUVEDLwBvS7fxD+YwUlCJj9shZx/SVPxwVettJ
 GTT1CDK7kCaH1/L4aEujwIFnWDr7uGXq1Ccxkmnfn4IWy3K0CLtRTYMjkyREvpTKI8q8
 1RHikiJWKMEcnfzra7sljIoG4xnfv3RRr9XFyLuGMxpZ2ZfpAdhOa+YXeeqEU9qdr9In
 tpFhIkA1ZhoM7QtwAkTIBaTZphz1kNcH5rcQbGpB09iq8OAC5e81mrgr6qa2SQs3j02a
 ZnP9+7pn3ajMWglFsh/Ofm4RM4YbgrGL4Bn9O85L3li3/YJ5MKvJ+qQ3esN85TQpG4Ne
 cHag==
X-Gm-Message-State: AAQBX9cyqt7C0tKDcRxuv+NFTMwTsxm/CGpn1MmGXrfFztVbLnZFwaHb
 LSf0yPQcE/k3oT0KfTyQgBrliA==
X-Google-Smtp-Source: AKy350Yoc10BEw0s6ojqNkBbVfQx5NeF7Cm9mBc3P0WyYr2s8+wfKC/vHgJbGCbbP8b3cjqsLqvV3A==
X-Received: by 2002:ac2:55a3:0:b0:4ea:f7aa:e778 with SMTP id
 y3-20020ac255a3000000b004eaf7aae778mr67466lfg.24.1680829662449; 
 Thu, 06 Apr 2023 18:07:42 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w20-20020ac24434000000b004cb14fa604csm475800lfl.262.2023.04.06.18.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 18:07:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/adreno: fix sparse warnings in a6xx code
Date: Fri,  7 Apr 2023 04:07:41 +0300
Message-Id: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse reports plenty of warnings against the a6xx code because of
a6xx_gmu::mmio and a6xx_gmu::rscc members. For some reason they were
defined as __iomem pointers rather than pointers to __iomem memory.
Correct the __iomem attribute.

Fixes: 02ef80c54e7c ("drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304070550.NrbhJCvP-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..84d345af126f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -51,8 +51,8 @@ struct a6xx_gmu {
 
 	struct msm_gem_address_space *aspace;
 
-	void * __iomem mmio;
-	void * __iomem rscc;
+	void __iomem * mmio;
+	void __iomem * rscc;
 
 	int hfi_irq;
 	int gmu_irq;
-- 
2.39.2

