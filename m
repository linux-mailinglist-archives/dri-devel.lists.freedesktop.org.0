Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF5F22DFD4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D224589EB7;
	Sun, 26 Jul 2020 15:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A256E14D
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 21:13:57 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BDf295TNkz1rt4N;
 Sat, 25 Jul 2020 23:13:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BDf295GNfz1qxpQ;
 Sat, 25 Jul 2020 23:13:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Hx59tOOreTfX; Sat, 25 Jul 2020 23:13:52 +0200 (CEST)
X-Auth-Info: KlNTHwIfMgS9hWZg06oB8tHCmLe1ND/xqgM93WeJeM0=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 25 Jul 2020 23:13:52 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panel: simple: Add DT bindings for Powertip
 PH800480T013
Date: Sat, 25 Jul 2020 23:13:35 +0200
Message-Id: <20200725211335.5717-3-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725211335.5717-1-marex@denx.de>
References: <20200725211335.5717-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:44 +0000
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
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Powertip PH800480T013 800x480 parallel LCD, this
one is used in the Raspberry Pi 7" touchscreen display unit.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index af6ea5480c81..6bf6604ca78e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2986,6 +2986,27 @@ static const struct panel_desc pda_91_00156_a0  = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
+	.clock = 24750,
+	.hdisplay = 800,
+	.hsync_start = 800 + 54,
+	.hsync_end = 800 + 54 + 2,
+	.htotal = 800 + 54 + 2 + 44,
+	.vdisplay = 480,
+	.vsync_start = 480 + 49,
+	.vsync_end = 480 + 49 + 2,
+	.vtotal = 480 + 49 + 2 + 22,
+};
+
+static const struct panel_desc powertip_ph800480t013_idf02  = {
+	.modes = &powertip_ph800480t013_idf02_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+};
 
 static const struct drm_display_mode qd43003c0_40_mode = {
 	.clock = 9000,
@@ -3998,6 +4019,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "pda,91-00156-a0",
 		.data = &pda_91_00156_a0,
+	}, {
+		.compatible = "powertip,ph800480t013-idf02",
+		.data = &powertip_ph800480t013_idf02,
 	}, {
 		.compatible = "qiaodian,qd43003c0-40",
 		.data = &qd43003c0_40,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
