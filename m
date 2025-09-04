Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82BBB444C2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2052E10EAAB;
	Thu,  4 Sep 2025 17:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Wn2ogZd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551DD10EAA2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:50:41 +0000 (UTC)
Received: from relay11 (localhost.localdomain [127.0.0.1])
 by relay11.grserver.gr (Proxmox) with ESMTP id 2DF9EC83BC;
 Thu,  4 Sep 2025 20:50:40 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay11.grserver.gr (Proxmox) with ESMTPS id BAE71C83C3;
 Thu,  4 Sep 2025 20:50:39 +0300 (EEST)
Received: from antheas-z13 (unknown [37.96.55.21])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 6F9A91FD13B;
 Thu,  4 Sep 2025 20:50:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1757008239;
 bh=BAvDGtLi6Zo9CZ1tJtojxW1gBOs8Zcop6Ypl8Lyl3Nw=; h=From:To:Subject;
 b=Wn2ogZd5pY83lrLjAXK2CoCDEZulDmzlGK3mz0l0k2NOUivSEnVWJmUJFYoDsqJA0
 yvWmo0lRP3cHcA5nVxA1ymjQIhrWuSrqN85Bn2BzHWkGQ4hF64g2C+YCvKtz7VCKmJ
 5NxGlSaXuuI6EpFHd1SHNnJahZ0HjbEnpIryScLpHuCtXP+EdAFhsN1cqBz0t5bVeZ
 IMBUaEIU/ebtk6lq3FCXYTAaFAFvmvftsuIPvvOHRXCc8gbnSy1mYpwHhaVWqbpJTo
 XG7gYcpX5cxR+BPWbT759aiaSjajB6DzOm2JAB7+Wu04oyUjHt9PMYQh7PflI7MEnN
 lCfugq+mQ0PNg==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 37.96.55.21) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, philm@manjaro.org,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 06/10] drm: panel-orientation-quirks: Add OneXPlayer F1
 variants
Date: Thu,  4 Sep 2025 19:50:21 +0200
Message-ID: <20250904175025.3249650-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904175025.3249650-1-lkml@antheas.dev>
References: <20250904175025.3249650-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175700823943.2009361.5295348970573880397@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OneXPlayer F1Pro has a 144hz 1920x1080 portrait OLED panel.
Add a quirk to correct the panel portrait orientation. In addition,
it comes with a red limited edition variant in the Chinese market,
so add that as well. Then, add the 8840U non-pro variant as well.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 0c0fe66e94ad..6f5ce26a84b7 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -540,6 +540,24 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro EVA-02"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) LE Red variant */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) Hawk Point */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 OLED"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) Strix Point */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1Pro"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* OrangePi Neo */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
-- 
2.51.0


