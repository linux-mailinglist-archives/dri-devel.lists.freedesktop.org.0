Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF8031F581
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 08:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604556EAB9;
	Fri, 19 Feb 2021 07:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0991.aruba.it (smtpcmd0991.aruba.it [62.149.156.91])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F5A86E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 22:56:41 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CsDwlA0uUJFRNCsDwlTfoc; Thu, 18 Feb 2021 23:56:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1613689001; bh=Xg+9eOilZ3+EBfunCQI3vbn7P1LyPrhe1crzw17OhlA=;
 h=From:To:Subject:Date:MIME-Version;
 b=k4+pLzTP8gz1A8J9Ayogp8G4UBSB/hMCMHhvs3rmKTHDcdty7Zfi29M+EFHY+2PrA
 G2MIPgfgyozZRiIB7zvdoP5igaTTfsmyyTv3LiQWvxZ56LlkbFmrKPmtrG1/ccGsmW
 XRipkkFAW+nQ4FWbGqF5h/ABo839mkP8DcBaWsEjM400qDsgfLHukC5l3TcVx9gC74
 WV6mn/0ze1kddIqtt0JtZtXlP8KdzI1N+0AchDyXDfl1x1komD4sG1cOUV2ZJpYAJa
 ISQv0/b3YnPDIq3/UWHFcliJq6afsnNCBVZ+Zd5ZoR6juZwM5U4J3W5NrJKTeIhayD
 EcoCT6GELj8AQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: 
Subject: [PATCH 9/9] drm/panel: simple: add Jenson JT60250-02
Date: Thu, 18 Feb 2021 23:56:39 +0100
Message-Id: <20210218225639.824094-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218225639.824094-1-giulio.benetti@benettiengineering.com>
References: <20210218225639.824094-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHye0GsBp+Zno2Xs2m6e5iJ+6btA28qE1BBH+mvc8by/F9ZGF/F91JHot68uD04G/kdExTeINfujtl4FyPPnLtr2MB4zEC97D/Bv4NwoM4f0vasuaq12
 cC0U9YUjbKc7/rARke8/FoE52ScKRY98qyB+qtURFpB1nly1hjXbAmC1aObgdAqVHkrr8yZZcPqOJlIgJ1W0eS+3I0cHa6hs2NuUzsnrhRYujSbojfDptSA0
 OWr4QFnVaJs8LoVJ6mR2AiVE7gg5mJtJH7HB9rKAp1zjoKZ8fohYplemuolhxcvlu8VHAB314Q5RvEqKc0wCLxbjJX+ifS4dl/D5Wk3uASS54XXni1pwVvGU
 TZN8vFDlxJgdE/ttUz11JOmxEiVqBAjJDIDYvMdCvHHRjJZiCQfrbLOmLduXf+RTglXCD4/p62F28MPjiQLiahRmL/R+dMyZqgZKrtGck2RZZFSoXWj8NJA2
 6MRUI2X2tsv6o5Km
X-Mailman-Approved-At: Fri, 19 Feb 2021 07:54:58 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

This patch adds support for Jenson JT60250-02 1024x600 10.1" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 995a581f8b2b..60805d7a12d7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2468,6 +2468,30 @@ static const struct panel_desc jenson_jt60249_01 = {
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
@@ -4243,6 +4267,9 @@ static const struct of_device_id platform_of_match[] = {
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
