Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9531F57C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 08:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6346EAB0;
	Fri, 19 Feb 2021 07:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0991.aruba.it (smtpcmd0991.aruba.it [62.149.156.91])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBB366EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 22:55:38 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CsCZl9zcdJFRNCsCvlTfVD; Thu, 18 Feb 2021 23:55:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1613688938; bh=p0Kr5A0o8yS+nib29/UasaQRUqc522d5JxpBHU2K2xY=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZsE/tl8qSILwy/Ujb2azfTofLnzGyT5pksJtoSZuLFeL90Vf02UWHmDyy0oZiBqie
 kT+q78OtjGE+6iEWJjg5HQ8weD01vgomb/ttznoSmsddIU9ehm4EscnfPvVRM26HZT
 pOni/UyMEqz9VE8ntglEg0DTNXjucWiRYkVDqKQOgZMGxnWHbyCldSY4vbAmGjAowO
 CpRbK4jQtIZA/h7xakQ337r8+lBoxTJGKb3jExvwQTTPEdV/V1ePqIonsxlYekfc7Z
 qD2a9cH/cj7S8al7nzMTwcjUBQxScWfQIK7tBQlABQfWZWj5rBAhjyeUpERbADKBYy
 o03ZiVmE4Qqpg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: 
Subject: [PATCH 7/9] drm/panel: simple: add Jenson JT60248-01
Date: Thu, 18 Feb 2021 23:54:55 +0100
Message-Id: <20210218225458.823773-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfG1AqcTmzHG93buYTjHmj9KonAjAtJ1lJTQt4efiNBnXBVJG9eMctx0qqoFwXYbQ0aNt3FUa1xjMvHRVMdKE1RpWfBl53EOV2fSeSR1Va9StRMDPlpQQ
 qxKX8wW+09NlCgAOautKgsISEpNZajvB+FqivI/GyckxIwyAyf95yDAHLiVMHqKb7BjcJAEtAUjUCCGQ4z3OxfAvs7kkbx3ZlnD1oVa/RhT0J39vjIvnmlie
 wuoY0Mq0Q0wskLq/gPX2+wheRLrG0/0aNQYcPFOJQWtKph8KczrFWNsVuoPYRb9fuF5zrw1MNfy2ucjLBws6oMDvAAhi+51nAm//lYSNZu2UrVlTZ+U8jsgD
 JbJ2dnQ8F4N+t4ogeP7LAEK/r+klH3aBH86Tr6JeJeqwRj4i3Icrnrxdq7dpFDa5TokcmMkjfK4oSxIGiothGYHooK0ADbruPJXGy+IY6xtzk+WP+JUQ6I/H
 g6lhjUYSNW369JCbjECC2Fm95uoxzmMhf6cEvml8TSCsnJJlZiZ2t/xjEBOnigvSz8llQ7wY+RwfLK1ja5ttRXOM0QpwKXShl+cNMfar09sDqXEy9hvkD+yN
 x1vrT7TjHZR3yY0SV/9ikHURMtSkIct6g6APMdu+WpxqnU20+60i+RcpG8qazV8klrN2hvh3d61b0h+T8ArEu9tdtfbEyYWHZjdBxfdqV6J+UejLsJ88Tjxc
 TjRy8W20JpWZ0TZ7lKxZZm+2zxP3j1j0JNlbZO+rfk/Y7KY/rURPahEOvj5Q+jVrmLCYcCAGoXZh9Fh0a2eFyBhZYDXYg6+8D12b7NHKYlU5Up0JeUFPVw==
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, allen <allen.chen@ite.com.tw>,
 Max Merchel <Max.Merchel@tq-group.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

This patch adds support for Jenson JT60248-01 480x272 4.3" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f268ad5f5345..f243087ce89b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2420,6 +2420,30 @@ static const struct panel_desc jenson_jt60245_01 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
+static const struct drm_display_mode jenson_jt60248_01_mode = {
+	.clock = 9000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 8,
+	.hsync_end = 480 + 8 + 4,
+	.htotal = 480 + 8 + 4 + 43,
+	.vdisplay = 272,
+	.vsync_start = 272 + 8,
+	.vsync_end = 272 + 8 + 4,
+	.vtotal = 272 + 8 + 4 + 12,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc jenson_jt60248_01 = {
+	.modes = &jenson_jt60248_01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
 static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
 	.clock = 81000,
 	.hdisplay = 1366,
@@ -4189,6 +4213,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "jenson,jt60245-01",
 		.data = &jenson_jt60245_01,
+	}, {
+		.compatible = "jenson,jt60248-01",
+		.data = &jenson_jt60248_01,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
