Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA20BB444C4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C7C10EAAD;
	Thu,  4 Sep 2025 17:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="GNVGV9g/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CF110EAAD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:50:44 +0000 (UTC)
Received: from relay11 (localhost.localdomain [127.0.0.1])
 by relay11.grserver.gr (Proxmox) with ESMTP id 5FC62C83C3;
 Thu,  4 Sep 2025 20:50:43 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay11.grserver.gr (Proxmox) with ESMTPS id 00EFFC83D4;
 Thu,  4 Sep 2025 20:50:43 +0300 (EEST)
Received: from antheas-z13 (unknown [37.96.55.21])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id A31311FD14D;
 Thu,  4 Sep 2025 20:50:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1757008242;
 bh=OfnR+WHwEoXTr+6OSdeoYm2XPL1+cyV+dJHo0zlMnD0=; h=From:To:Subject;
 b=GNVGV9g/ure7gnjB+Pdg4LCeqMSTxrxE6Vc/CN37JB668lNKsG8SPWcD81KYQOnaK
 N52qfq2mG8dmbCfgUuyfez4B+hRX7GBfM4Cz6V5Lm9hDWx8ViO7jmfoSvIpJ4ZkyOC
 P6ncbjUZomFY2uZxKbYThTk0sOi8e5eI+m1qY3qpTv9P0ZnvK8JTRv40o9nF4/Z90b
 pbZjKBXugElnr6xkgOG9tB5t60d5kpcA6urM9xK+DjcAvx+pBDFhHCPFFHh4c712gU
 Qb5D9gBIN6d3FEMFU5KxKZ/y+ncGdyPRJEOMccISux9AMJarKvqsoILtEefmHMO6fc
 dUWgesB/ALzQA==
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
Subject: [PATCH v1 08/10] drm: panel-orientation-quirks: Add GPD Win Max (2021)
Date: Thu,  4 Sep 2025 19:50:23 +0200
Message-ID: <20250904175025.3249650-9-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904175025.3249650-1-lkml@antheas.dev>
References: <20250904175025.3249650-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175700824267.2009457.17215964093686136802@linux3247.grserver.gr>
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

Right side up, DSI-1, 800x1280 screen.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index e7a2c5b59d28..75a8c4532434 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -327,6 +327,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1619-01"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* GPD Win Max (2021) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1619-03"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/*
 		 * GPD Pocket, note that the DMI data is less generic then
 		 * it seems, devices with a board-vendor of "AMI Corporation"
-- 
2.51.0


