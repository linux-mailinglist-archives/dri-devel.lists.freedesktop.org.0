Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E686FE6F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAC410FF25;
	Mon,  4 Mar 2024 10:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="V1g4ZJXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18D5410FF25
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=rWWze
 ynqvpKTE8wM5BvJ7WhI4cRh2jw6a0Kbi0ZwsdA=; b=V1g4ZJXgnDduvAq01bKml
 dVxaDiyDzC5H4z8/n32ZfrcKQKaIKR84bNNjoy39SlkZ4ACN02OkX7LyOHn3rPMt
 3o5L/JA0VGQGxfl9d6OGJoZ6RYmMk3p9veoiCHDvQ2k/XdiEmDlo1ZL8lSo48HFe
 dM9SAFp1cugZROOeyXS7fM=
Received: from ProDesk.. (unknown [103.29.142.67])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3n_jzneVlOacmAQ--.60415S2;
 Mon, 04 Mar 2024 18:10:01 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Remove AR30 and AB30 format support
Date: Mon,  4 Mar 2024 18:09:52 +0800
Message-Id: <20240304100952.3592984-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n_jzneVlOacmAQ--.60415S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr47XrWkGr4DZw17ur45KFg_yoWfuwcEk3
 47X3Wfur4xCrn8Jw12y3y7WrZFy3WI9Fs2ga9Yyan5AF1vvw1rXFy0vry7Gas8JF42kFs7
 GF1jqry3CFn8WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1YL95UUUUU==
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEB6XXmVOCknmwAAAsJ
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

From: Andy Yan <andy.yan@rock-chips.com>

The Alpha blending for 30 bit RGB/BGR are not
functioning properly for rk3568/rk3588, so remove
it from the format list.

Fixes: bfd8a5c228fa ("drm/rockchip: vop2: Add more supported 10bit formats")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 48170694ac6b..18efb3fe1c00 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -17,9 +17,7 @@
 
 static const uint32_t formats_cluster[] = {
 	DRM_FORMAT_XRGB2101010,
-	DRM_FORMAT_ARGB2101010,
 	DRM_FORMAT_XBGR2101010,
-	DRM_FORMAT_ABGR2101010,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XBGR8888,
-- 
2.34.1

