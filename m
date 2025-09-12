Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8FB5463A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8849A10EBD7;
	Fri, 12 Sep 2025 08:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="dDj+jrkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973184.qiye.163.com (mail-m1973184.qiye.163.com
 [220.197.31.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8210EBD2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:59:24 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 229880a5d;
 Fri, 12 Sep 2025 16:59:19 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 09/17] drm/bridge: analogix_dp: Remove unused
 &analogix_dp_plat_data.get_modes()
Date: Fri, 12 Sep 2025 16:58:38 +0800
Message-Id: <20250912085846.7349-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26893a03a3kunm813a8c8ea45eec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JMTVZOQhkeSkJMTkNNGkhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=dDj+jrkR/dkCe3rxCz4nUU3ox5+cB2+QKDpCO/tB6xFv17IF36uQKgz+JqhKm4mpy+aDyGbgmKrBE+p7z855fAovf6736akud26f9dlJWkAfMxwOm13b9hPNFyhsaX1Ovz9CX6dc8Sl72ZOoVVvUDoR7tk0DBjIdexxmAB9dwf4=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=UjIhDc9kComjgNGOxQJKlI/oiKaUUNqcaR2XyNLMxkA=;
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
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ---
 include/drm/bridge/analogix_dp.h                   | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5d15fdf88c92..9bf91d7595d6 100644
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

