Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECFCC6D6B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 10:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AB110EBE0;
	Wed, 17 Dec 2025 09:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="TLmPmUma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com
 [220.197.31.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B836910E55C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 09:39:08 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2d931e589;
 Wed, 17 Dec 2025 17:34:02 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v8 11/18] drm/bridge: analogix_dp: Remove unused
 &analogix_dp_plat_data.get_modes()
Date: Wed, 17 Dec 2025 17:33:14 +0800
Message-Id: <20251217093321.3108939-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217093321.3108939-1-damon.ding@rock-chips.com>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2ba8d26c03a3kunma9c945a29ef14
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5IHlZOS0wYTUlCQk1CHxpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=TLmPmUmaLDSaeKx3WJ0oFH4mkHcuU3ZTtws+5YI9g1RXAwp3PcwvXxocwdW0vw1GvpWgmL6a2thf59bs3lgceu5Rfx2Grj5PMMW9Q9I0rMJCFSwB+TlWHQCyXskE4QxYb2oPpD+LlajyBaIIEKiRuGvw/afrfXhKvYr8jCvzsyE=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=VtrQU3q9kaAmYUFLSXbn0bcjKVxTa/yyLvjSOfcswXg=;
 h=date:mime-version:subject:message-id:from;
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

The callback &analogix_dp_plat_data.get_modes() is not implemented
by either Rockchip side or Exynos side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ---
 include/drm/bridge/analogix_dp.h                   | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5bf41b364aba..b0bc96693fdb 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -875,9 +875,6 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 		}
 	}
 
-	if (dp->plat_data->get_modes)
-		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
-
 	return num_modes;
 }
 
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index f06da105d8f2..3301392eda5f 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -35,8 +35,6 @@ struct analogix_dp_plat_data {
 	int (*power_off)(struct analogix_dp_plat_data *);
 	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
 		      struct drm_connector *);
-	int (*get_modes)(struct analogix_dp_plat_data *,
-			 struct drm_connector *);
 };
 
 int analogix_dp_resume(struct analogix_dp_device *dp);
-- 
2.34.1

