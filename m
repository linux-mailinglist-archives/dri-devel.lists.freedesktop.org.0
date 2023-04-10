Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C0F6DCD97
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 00:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC4D10E438;
	Mon, 10 Apr 2023 22:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DB210E438
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 22:40:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e9so35901241ljq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681166436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ExpMxaiAsYSC/kxMJmZJo/lYKKpscHCMufENOoO0Jss=;
 b=LQtBg78Rc3RIjK/NZdxj45la/WmU3KKsbqGoThwHmVhqr3sy6wHRVnWkYRDTAvL1gj
 A2QPJYb0iISeYpolqz32lfMnFZD/beoqQMmWmbFbG7qE2qZCv+23MhSJwlY3i3nkd+FW
 JW7nTn8cza7x6vw/Rw8fOH/gM97LocbXHoy91RAP7ewNzl7zhNHjIupJbPT3yhi6jwbc
 jQjCtBOZ7GK4ODk6HkE1XaL27zXdUCOA4T0iI5sCn1hXsWa0SvbpPg6glS7ou/9QTrHR
 YW32M0rBskdbBsueG1Ba+I6KTSG1jJaFNxErCLgEvFOjO2KSn9OoBmkTcJQ6YAvJ4Oa/
 yXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681166436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExpMxaiAsYSC/kxMJmZJo/lYKKpscHCMufENOoO0Jss=;
 b=aI2qvuNVkc6hnVCwfxEcaUqSPb+0ZeGDhMTrYuQHT1Qq8urbc1inn0gWyDcuX8XZAz
 6o9hUpzF8WikzlzwZ/jPt2g2OcYGEf5VyzcDVOd84CfHjz8rnlPAOqDPnQbLra7BWIe5
 NnvFHniVWBTVTAVofYx/zAEddfNSxA9gok6k7HzcmEy8XeCzWiqBvhbi6aT5ALtc0Khx
 +abFXl0VhIGo4dVUMAIZul72q0K+pPWAAasO9BD1YmfbWt+HFqH0Sp3HUSCnm7+I45Z9
 Vq+UNl27N923WzVsp9pOw5kY2dpZZXQJZkrWm0iHeM35mb6NX4zbWek4BcJhgl7Ofad9
 rSsw==
X-Gm-Message-State: AAQBX9e4gEDu6HyA8gGYe52qKHAsaaQdkcTh4dsTQ3Jr8Rw2mzolFwbS
 f8ZKUvo86rhNgqPIu7oXDiGhlg==
X-Google-Smtp-Source: AKy350aZM/Dm9IAVjkzrpnrNGKkAnyaxL3kEvMMKkv5S1Zqvl3B8sQgi0Z5WHmQ0jjUxAcOa5vxccg==
X-Received: by 2002:a2e:9d08:0:b0:29a:1f7d:38b1 with SMTP id
 t8-20020a2e9d08000000b0029a1f7d38b1mr3633969lji.28.1681166435783; 
 Mon, 10 Apr 2023 15:40:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a2e95c4000000b002a77e01c3a0sm518102ljh.23.2023.04.10.15.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 15:40:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm/adreno: fix sparse warnings in a6xx code
Date: Tue, 11 Apr 2023 01:40:34 +0300
Message-Id: <20230410224034.443210-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse reports plenty of warnings against the a6xx code because of
a6xx_gmu::mmio and a6xx_gmu::rscc members. For some reason they were
defined as __iomem pointers rather than pointers to __iomem memory.
Correct the __iomem attribute.

Fixes: 02ef80c54e7c ("drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304070550.NrbhJCvP-lkp@intel.com/
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: removed whispace after the star (Stephen)

---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..4759a8ce51e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -51,8 +51,8 @@ struct a6xx_gmu {
 
 	struct msm_gem_address_space *aspace;
 
-	void * __iomem mmio;
-	void * __iomem rscc;
+	void __iomem *mmio;
+	void __iomem *rscc;
 
 	int hfi_irq;
 	int gmu_irq;
-- 
2.30.2

