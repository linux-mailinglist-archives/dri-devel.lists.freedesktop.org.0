Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0824352377
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 01:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098FD6EDC3;
	Thu,  1 Apr 2021 23:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44E326E15D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 23:24:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.220])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S6YzlD4W1HTbyS6Z2lYTew; Fri, 02 Apr 2021 01:17:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617319045; bh=DvsT8CmRrjeIKd6BdcBuSnIUTUX2BgBikZZZxdB8QNY=;
 h=From:To:Subject:Date:MIME-Version;
 b=fJwEtaqddFnuZCz6AksUpuHlwqeWzQYFm5dzQ7QMXlGLb5AnNibMjMgx3hHjEljDh
 YXL5vIE5vb9QdcvCFeMGVeLUlzYvYHkLGm8GZJy2Esi49XHFXE3uVtGkbiFE7U/WkP
 4IBmoxOOoMdrjbMM871WK0Pf3k2QCoAJ6FQR+NzNL4gQHDcyd3kmuHAaZ7/q1DjPxV
 +1NHb2QATdeGJdacmW+ohZcn9uH9Fu9LVVFu1brYXdNTMN3BXXpPmOAv6EPaXDOtOp
 o0mnfSp2lZ0aO985TaxvURFI4dUKEB/hBGGuxfje7MruWmBXJfziVev4pHBUoPiu0T
 4g2lfhorq4G/g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 9/9] drm/panel: simple: add Jenson JT60250-02
Date: Fri,  2 Apr 2021 01:17:20 +0200
Message-Id: <20210401231720.2470869-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAsEO2oOl16uNPOxSnBrtqyzijUWPiHGsZ5M3Na065ZzWi9rs0RsNY07/AP725a9oFi9AhNeYYwSVYDLnnwb19FJ5BAEOOVw2hXQ7VRaIT2+bEjwXUcd
 FlZ9hrwRR+pvr0kFJUwSs4ow54K/xtxovR+/qWqwMHLxg84ihUJc2EA6ZN15LnBoKPsgPlB8qH2tAOnQCSBwzCcJTHmu2d6w7tjFZJqg8rAbo5zf562/EYJR
 vjbcsocceXkKswT3Pcm35y0wW4XG7iiALJKBlTA450K4JhWoMBMAvMVO2IQbGgfYKfhJzh3AgTgfQtj5s0RL5P1Y5OCggFBT3ruMOp3kTNjla2EiNbX7Helv
 UNild0V/5M87Bl9fzoKZWIc1VY1myh8zBdj1OY13q9fyYn7l9e6Ci1Oi/4HRxpG1mrA/FmNZ70NMOkoAfzFTDApN8SFY2F1GVkG+g5TEunF72492bF8=
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for Jenson JT60250-02 1024x600 10.1" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 1966ace764c3..2ebfe529e0c7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2604,6 +2604,30 @@ static const struct panel_desc jenson_jt60249_01 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct drm_display_mode jenson_jt60250_02_mode = {
+	.clock = 51000,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 160,
+	.hsync_end = 1204 + 160 + 10,
+	.htotal = 1024 + 160 + 10 + 160,
+	.vdisplay = 600,
+	.vsync_start = 600 + 12,
+	.vsync_end = 600 + 12 + 70,
+	.vtotal = 600 + 12 + 70 + 23,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc jenson_jt60250_02 = {
+	.modes = &jenson_jt60250_02_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 223,
+		.height = 125,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
 static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
 	.clock = 81000,
 	.hdisplay = 1366,
@@ -4382,6 +4406,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "jenson,jt60249-01",
 		.data = &jenson_jt60249_01,
+	}, {
+		.compatible = "jenson,jt60250-02",
+		.data = &jenson_jt60250_02,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
