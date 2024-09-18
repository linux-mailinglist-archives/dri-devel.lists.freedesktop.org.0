Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E094597B6D4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5F910E0A8;
	Wed, 18 Sep 2024 02:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mYrzoEgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0C910E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1726626840; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=3qLw/Od5UmDZ19I6DykV+eKlxsisqhpJH2+/epwDaQo=;
 b=mYrzoEgkmCaMzmGwspJs7GXbxKcJbCeBTN9F9uRci+MxTvI+PwoEsRA1BEp+OpikWBz+u3FUSIxDTKCICeeoLuFN3wOIwFF7NuBQ6kTsmL57vxTvFu0sJD8egb3BeZSuTUh04Lpc42FdSE9gpHUseyo7q2FFK/AEBj2HQ2tfSmQ=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0WFCLPA4_1726626839) by smtp.aliyun-inc.com;
 Wed, 18 Sep 2024 10:34:00 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: quic_abhinavk@quicinc.com, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next v2] drm/msm: Remove unneeded semicolon
Date: Wed, 18 Sep 2024 10:33:57 +0800
Message-Id: <20240918023357.59399-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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

./drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:282:2-3: Unneeded semicolon

This patch removes an unneeded semicolon after a switch statement in the 
pll_get_post_div function. Adding a semicolon after a switch statement is 
unnecessary and can lead to confusion in the code structure.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9852
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 0e3a2b16a2ce..65cf237c6b4e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -279,7 +279,7 @@ static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
 	case 25:
 		found_hsclk_divsel = 14;
 		break;
-	};
+	}
 
 	pd->vco_freq = found_vco_freq;
 	pd->tx_band_sel = found_tx_band_sel;
-- 
2.32.0.3.g01195cf9f

