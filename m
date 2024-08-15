Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6658952D8B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 13:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6244A10E0F3;
	Thu, 15 Aug 2024 11:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A8E10E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 11:32:34 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wl2xl1LnCzpTbY;
 Thu, 15 Aug 2024 19:31:07 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
 by mail.maildlp.com (Postfix) with ESMTPS id 7C379180106;
 Thu, 15 Aug 2024 19:32:29 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 15 Aug
 2024 19:32:28 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <dri-devel@lists.freedesktop.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] drm/msm: Remove unused declaraions
Date: Thu, 15 Aug 2024 19:19:36 +0800
Message-ID: <20240815111936.78601-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
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

The definition of msm_atomic_state_clear() and msm_atomic_state_free()
has been removed since commit c21c731d93e8 ("drm/msm: Don't subclass
drm_atomic_state anymore").

Also, the definition of msm_dsi_host_set_src_pll() has been removed
since commit 9b077c1581cf ("drm/msm/dsi: stop setting clock parents
manually"). So, let's remove this unused declarations.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/gpu/drm/msm/dsi/dsi.h | 2 --
 drivers/gpu/drm/msm/msm_drv.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 87496db203d6..6ffc8a3b6c72 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -85,8 +85,6 @@ int msm_dsi_host_register(struct mipi_dsi_host *host);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
 void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
 			struct msm_dsi_phy *src_phy);
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-			struct msm_dsi_phy *src_phy);
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
 void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
 	struct msm_dsi_phy_clk_request *clk_req,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index be016d7b4ef1..48799c678a6b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -254,8 +254,6 @@ void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_state *state);
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
 struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
-void msm_atomic_state_clear(struct drm_atomic_state *state);
-void msm_atomic_state_free(struct drm_atomic_state *state);
 
 int msm_crtc_enable_vblank(struct drm_crtc *crtc);
 void msm_crtc_disable_vblank(struct drm_crtc *crtc);
-- 
2.17.1

