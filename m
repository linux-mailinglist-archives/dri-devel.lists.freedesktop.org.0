Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DF7C67D6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCF388FB2;
	Thu, 12 Oct 2023 08:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118C810E45D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1697100133; x=1728636133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HD7jH7viAq//eqJGWBJ78WdMU/P/dhkuZ8Xm+g0owI4=;
 b=OFrBMfnpbnz1tQOuPptJI8lflACoZ8BDrg+CtLYmF9szY0TpM9FrVKXT
 27/ao3n2s2LDML0DSPO6YAYjWgXM5XhwcFaDqjZd6AhBitKkMbb8V2RvN
 t1rh+SMmTV6AFNXqgU2lhTkYIWe3Z08HevN3hUXFWWmk3KzVSKwcrEG1Y
 794azYiD4IhLw6/zWP5df+vg3mw5DnVqqcv/1eHLaiC4LLN1NzCjHtSvk
 KvtpM0/C/6C0FO/LRvysepcc0rmM7QUo00K0rg+lMZqdS+womMjr3PJ0q
 3gWkxgpT6iRF/G7QZ4NtwOqFZP/PVBSeaa0QAp0ZcOaDW9BvvNJmG4JdW w==;
X-IronPort-AV: E=Sophos;i="6.03,218,1694728800"; d="scan'208";a="33424448"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2023 10:42:10 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BDF9F280082;
 Thu, 12 Oct 2023 10:42:10 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/1] drm: panel-simple: add missing bus flags for Tianma
 tm070jvhg[30/33]
Date: Thu, 12 Oct 2023 10:42:08 +0200
Message-Id: <20231012084208.2731650-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The DE signal is active high on this display, fill in the missing
bus_flags. This aligns panel_desc with its display_timing.

Fixes: 9a2654c0f62a ("drm/panel: Add and fill drm_panel type field")
Fixes: b3bfcdf8a3b6 ("drm/panel: simple: add Tianma TM070JVHG33")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes in v2:
* Collected Sam's R-b

 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 07c627de70534..b5b79f1789519 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3867,6 +3867,7 @@ static const struct panel_desc tianma_tm070jdhg30 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 };
 
 static const struct panel_desc tianma_tm070jvhg33 = {
@@ -3879,6 +3880,7 @@ static const struct panel_desc tianma_tm070jvhg33 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 };
 
 static const struct display_timing tianma_tm070rvhg71_timing = {
-- 
2.34.1

