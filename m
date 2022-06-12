Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AC547A7D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 16:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87D810E803;
	Sun, 12 Jun 2022 14:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D550910E82E
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 14:33:56 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3C0768399B;
 Sun, 12 Jun 2022 16:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655044434;
 bh=sdsTKpfHiMFBZt71oWwQFHUcsYThLY11iNI5HgoKAF0=;
 h=From:To:Cc:Subject:Date:From;
 b=qiE5gTRTUPXdaAFqbOKvRrp1BBHCq3UVpybGS/I6RW5T+CGoLMBqdUrLI5FpdFNOI
 J6hdMw7pFxsQI8Mf3Qx5RpOl+xyx5wwPSpBL/KWYgG0DK7g9fV87wPcKb0RKYBzI96
 y7orCKLG2mj9t8W+VZJooe1LDwyX3TdyRv2vnQGQfjxnYvgftukH8EOF7g83FkPZhc
 mzfGnAek8TUxzh+YKIcIgElDBQaEcZ3V4+CoGrXZAXCsyv4NotboU6ujNzRfHjCji+
 8pKwDqVrznlEE4FfaqUd8FbuD39YQ2X1BOBlDpA2kVvpbGMjavUJLIHAidnH6VVOn+
 TWxL4LACEO3QQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix convert to drm_of_get_data_lanes_count
Date: Sun, 12 Jun 2022 16:33:49 +0200
Message-Id: <20220612143349.105766-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing header file into dsi_host.c and encode data-lanes string
directly into the warning message in the driver to avoid build issues
detected by lkp.

Fixes: 185443efa26a ("drm/msm: Convert to drm_of_get_data_lanes_count")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 346556c5706d7..57ae14a0e1814 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -106,8 +106,8 @@ static int dp_parser_misc(struct dp_parser *parser)
 
 	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
 	if (len < 0) {
-		DRM_WARN("Invalid property %s, default max DP lanes = %d\n",
-				data_lane_property, DP_MAX_NUM_DP_LANES);
+		DRM_WARN("Invalid property \"data-lanes\", default max DP lanes = %d\n",
+			 DP_MAX_NUM_DP_LANES);
 		len = DP_MAX_NUM_DP_LANES;
 	}
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index db5871b9c5d88..7e21916d1511a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -21,6 +21,8 @@
 
 #include <video/mipi_display.h>
 
+#include <drm/drm_of.h>
+
 #include "dsi.h"
 #include "dsi.xml.h"
 #include "sfpb.xml.h"
-- 
2.35.1

