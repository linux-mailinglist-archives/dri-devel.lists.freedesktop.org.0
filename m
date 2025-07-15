Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB52B05135
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 07:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD47110E158;
	Tue, 15 Jul 2025 05:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="eptu6Ys4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3200210E506
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 05:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Rm
 P52XZydMaJnEINWARLUUCcm7vMaBebaXr3L+WXnCY=; b=eptu6Ys4Xqt2RXkbf2
 7+InG8AvpiAnWNK2858j5a/08IDZhY5JBWgJo/fHm+3OTttYzPTqpxBQlyDBuqwQ
 Y5/PXP/xAPEzps0pVrle65cBcmHostlgW0/GuGnc3/3IlVm9v7VSqDrZgVCcVeRz
 btZx35hJj5A9/19bM3o/yv1uI=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wBXiRyO63VoLNw5Ew--.13369S2; 
 Tue, 15 Jul 2025 13:48:02 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: simona@ffwll.ch, andrzej.hajda@intel.com, airlied@gmail.com,
 ian.ray@ge.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 martyn.welch@collabora.co.uk, mripard@kernel.org,
 neil.armstrong@linaro.org, peter.senna@gmail.com, rfoss@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andyshrk@163.com>,
 Dixit Ashutosh <ashutosh.dixit@intel.com>
Subject: [PATCH] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Fix a compile
 error due to bridge->detect parameter changes
Date: Tue, 15 Jul 2025 13:47:52 +0800
Message-ID: <20250715054754.800765-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBXiRyO63VoLNw5Ew--.13369S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFykXFW5Xry5KF4rCF18Grg_yoW8XryrpF
 W2gwsIkFy7Wa15Ka1UAFnrXrn0y3WvqFWfKrWIqw1Sva40gan8AFs8Jr9rXF1Uu3sxCFn8
 ZrnrXrs3GF18ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRfb1nUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgGLXmh15WKgRgABs7
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

Fix the compile error due to bridge->detect parameter changes.

Reported-by: Dixit Ashutosh <ashutosh.dixit@intel.com>
Closes: https://lore.kernel.org/dri-devel/175250667117.3567548.8371527247937906463.b4-ty@oss.qualcomm.com/T/#m8ecd00a05a330bc9c76f11c981daafcb30a7c2e0
Fixes: 5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")
Signed-off-by: Andy Yan <andyshrk@163.com>
---

 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index de57f8a9e98c..c9e6505cbd88 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -142,7 +142,7 @@ ge_b850v3_lvds_bridge_detect(struct drm_bridge *bridge, struct drm_connector *co
 static enum drm_connector_status ge_b850v3_lvds_detect(struct drm_connector *connector,
 						       bool force)
 {
-	return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->bridge);
+	return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->bridge, connector);
 }
 
 static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
-- 
2.43.0

base-commit: 9a2533ba5055b4c23f4bf1c4d87154f26a2c7a94
branch: drm-misc-next

