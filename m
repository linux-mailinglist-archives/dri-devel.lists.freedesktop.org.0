Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAA32F6D9
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 00:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706E16EC9A;
	Fri,  5 Mar 2021 23:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd15177.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C9E96EC9D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:51:44 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IK7Ql1dnx4WhhIK7floTLO; Sat, 06 Mar 2021 00:44:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1614987883; bh=SIOYQ2xjUG3T56x4cQhDycFmuvk7vJhIG1eUTJlGBYE=;
 h=From:To:Subject:Date:MIME-Version;
 b=GCVkgstoZzsubT5ho/VjkvWZwYo9Ivh84bTeoMJ3ENB4Hd7bctw3R67VnH/SSmmCa
 k2fa7SpobCSZLe4er6skts+I42HDHNuNfTJCXCoFxXH+Y9CgfxCz3ncWEjZrCzihCG
 nW+kT8p7prssbQhOfAGYkGYcfYyQuSQYJJipp00gg5TWlZ/hBYCBr603VQsSBJZvYF
 bmu4mqK7QNyl8juAPO5mArfpm8343tFp4nhKT/AwJHiRfX1jtnpYCo6d2bliZ/X2yc
 4oIUUTAFto9+TLXVOkxP3EwRSU/wlPByS7AC6oyRURSUsS1wAJdR7jsNZLY63EsUJQ
 HcVvfkTV9Mgpg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 9/9] drm/panel: simple: add Jenson JT60250-02
Date: Sat,  6 Mar 2021 00:44:26 +0100
Message-Id: <20210305234427.572114-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
References: <20210305225444.GA792026@robh.at.kernel.org>
 <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJJICPsYTIQqANHNAY9JioPU95qdZp7ybyeIBAmJIwL39BzuorocT3L2d748Dycpgo4ZvSTyxlkVU59j9Ba+GDLcT5p2is6Isq1NvY0Or0eSpQk6By6z
 bIIEWHcoV0wM/YJPNLs8nsh/MBAVH9OYQwBUnNAaS6/BXEVFUiiL85mtcYNqpvNQsQHUbdcqaCdzAFG63uCK56aZ6XtvZJrQUEPZPbijFmApBwSM1ReLAc6y
 3AR7nkgm4bU4fCCo1re79tXxvpcwt0pbIskoyZgOW9TwPzvN7WWyXCCw7moY0P/7h3lmrTdX5lRfnRCd6G+wpJMVQtRskJZtPiiGnWHTmLogcp9No7bW0mrK
 5aSV5YUy380MGnXd6bldc9RWGE/8Qb7JqegcF11RvqigMZ1yijoISIPJegMr2m4udG4IyIjSE/C6yw1gwMUpF20pZxIHIsgba+ASvxmSJj5Njr8HqYTibNVm
 QU2a0CTEYyoVsP4SmHW1wFkr60XdlwT8GfvFwxv5p8ytN24QcWWXGpU5waSuRDHCK++xb/9b8hu6WNvtIHd6CkvwFH+WsgEknzBTmt5AsA26x3EjGJ5UuTRm
 H8b9EiIKo4bwXG/S0OHoaAUfIpM3OM9zf5qeuWzR/qwWiZeQ4SIbszTFqqRbf/R4X1cW+/tRNGMvZKPBEEQ6+6cigGyNMMpZgn+BEEUp9HYjASjM+2587s1q
 YtUKEI/H0rLgG+Qy+fpvQWjCdG1t1j9rpWTk6WRB3mv9qh8ENGIxyg==
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 allen <allen.chen@ite.com.tw>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

This patch adds support for Jenson JT60250-02 1024x600 10.1" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
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
