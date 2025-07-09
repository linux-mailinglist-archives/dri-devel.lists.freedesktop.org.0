Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A5AFE0E4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB21710E74A;
	Wed,  9 Jul 2025 07:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZHGcEjNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32110.qiye.163.com (mail-m32110.qiye.163.com
 [220.197.32.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C74E10E749
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:07:48 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1b69d1c4b;
 Wed, 9 Jul 2025 15:02:42 +0800 (GMT+08:00)
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
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 11/12] drm/bridge: analogix_dp: Remove unused APIs for AUX
 bus
Date: Wed,  9 Jul 2025 15:01:38 +0800
Message-Id: <20250709070139.3130635-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMdQlZCHx4YThlCGE8aGBlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe6a1803a3kunm3a7bcd50c83bc0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pkk6TRw5UTEzFS8RIxdMIi4J
 IkkwC0hVSlVKTE5JS09PTk1OSkhOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISU5LNwY+
DKIM-Signature: a=rsa-sha256;
 b=ZHGcEjNWd8Ny++COiRajpPxJxHQekEehDeGuu9Y4E9O7z8QGdVqEXvkKN1LP1c7k8/Debbz4uRuv6VfLjhx7YEerzTPINgAqhTXYqdJbAvtaas9gPGzCN4U9DgzvElAeKzVVp07yV4an3fkKdbMqyYRg51tG04FzOBwULGPhiHg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=fqyUN1F8Tzi8KnSDWJShNFEL8g+VnD7YEPfF0DJm4TE=;
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

Since the panel/bridge parsing has been moved to the Analogix side,
the analogix_dp_aux_to_plat_data() and analogix_dp_get_aux() is
redundant.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 --------------
 include/drm/bridge/analogix_dp.h                   |  2 --
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 660f95e90490..abc64cc17e4c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1695,20 +1695,6 @@ int analogix_dp_stop_crc(struct drm_connector *connector)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_stop_crc);
 
-struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux)
-{
-	struct analogix_dp_device *dp = to_dp(aux);
-
-	return dp->plat_data;
-}
-EXPORT_SYMBOL_GPL(analogix_dp_aux_to_plat_data);
-
-struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
-{
-	return &dp->aux;
-}
-EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
-
 static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
 {
 	struct analogix_dp_device *dp = to_dp(aux);
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 0b6d85f1924e..94854b5949c2 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -51,8 +51,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp);
 int analogix_dp_start_crc(struct drm_connector *connector);
 int analogix_dp_stop_crc(struct drm_connector *connector);
 
-struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
-struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
 int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp);
 
 #endif /* _ANALOGIX_DP_H_ */
-- 
2.34.1

