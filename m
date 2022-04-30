Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48643515C53
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 12:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFCF10E07F;
	Sat, 30 Apr 2022 10:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D466389DE6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 10:48:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h29so10733553lfj.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jWp20FUjFEijENLW1jgAj2gw68XIVADTXOMKS9xgjoY=;
 b=cgzQY8Q64Q67uW86YHlg0bfLxKzVbDGY698MRQjXg3sdZdn3FlVzRJkurCkWNjwdBq
 Nw/KO7x04JZrsZO6o1w1Okb+L+HeOY40QrjtOyPSGdqhKmryE1GzTjQaSyLmsIPvwRSz
 IC31O9JdbC6Cn3bNbEFXmz/Fq0wwj0L9x25etBCvDqakuLNXRotON+r4LoW5Zkp2BwZt
 hWbZeG0wB70kYxqxBGXkgDoVGevxAOQ67z+3/5aEQzvhV/zSYV1r7M+3olb4Ku1yfKgt
 R/zLZPaEs41qOZXvOF5npwUJBlYtwnXDTs7XugUdUT+ZrMeywW+hp+8uPg0/dhHP/zJ3
 ClZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jWp20FUjFEijENLW1jgAj2gw68XIVADTXOMKS9xgjoY=;
 b=aPMYF4dJikMAQxpVc4G4IiHZ3uegHxoe9jpzsclj/ESyW0Ly9ucTLfBB0nX7EEuIgJ
 b+slaiBAm6jRw6QkPCn9H5jp0B0AQT6fVco1Zzq8+Uq2YlkAx+XR8ikWMRZGQ6Nh6oJO
 tLibRj+FrBWvMW9ivn7yFmyla0agjWHPQ+OUw3J8h0XrO7SgDXmSG5bIutvA4/7Vu1j3
 bWeSs72S6a8zeBdDK/m0MtvLpxLlQHMrOmrNc9jSETwFo6E5jW5OmykKBZgKtSJ3sq/F
 Ur62aSTj/Nf9XyJ2c+IdWGkl7UsSkj2ZyWdOQGt3cyyDEhuDioiaPCho/flJqPGFQEOz
 yWkw==
X-Gm-Message-State: AOAM532m4pFxCYAWAuMY1F01DEfozTBWaNkC8JRrBWuPh6PjmmsGd9Pm
 0HKSHVllujx83/JbqI/d0XcWJg==
X-Google-Smtp-Source: ABdhPJw+A9ODuR0yLPkkt2fiEjJKwxD3Hn49sKAuSccnhcMm14Xdy0Pi8D800lFTTOxQGh1mjIs0jQ==
X-Received: by 2002:a05:6512:b9d:b0:472:687:50ca with SMTP id
 b29-20020a0565120b9d00b00472068750camr2638797lfv.466.1651315701200; 
 Sat, 30 Apr 2022 03:48:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z13-20020a2e8e8d000000b0024f3d1daeeasm510841ljk.114.2022.04.30.03.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 03:48:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm: add missing include to msm_drv.c
Date: Sat, 30 Apr 2022 13:48:20 +0300
Message-Id: <20220430104820.3782290-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add explicit include of drm_bridge.h to the msm_drm.c to fix the
following warning:

drivers/gpu/drm/msm/msm_drv.c:236:17: error: implicit declaration of function 'drm_bridge_remove'; did you mean 'drm_bridge_detach'? [-Werror=implicit-function-declaration]

Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4f3dce334553..4a3dda23e3e0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,6 +11,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-- 
2.35.1

