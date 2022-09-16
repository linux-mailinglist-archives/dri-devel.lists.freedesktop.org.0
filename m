Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90D5BB68C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 07:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC7710E3AF;
	Sat, 17 Sep 2022 05:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F5B10ED41
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 13:50:17 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id a14so204798ild.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=AKed33L7/gXTrNguuIgtZfEgy2m6ebn7NIyiYlN3tNg=;
 b=fMC6MCN8yaUgRG6eEbFrh+Zx9PoNaDmY8Q7MQgeExwWGPITQYUig86e2s+ssPLlJNE
 lNQouaOpKfKvNeMKkeCHAdPrFq6csgzvHfWUmHnopOTOouRQGwDpH4WbJ8V5QpiGAO7H
 V8U3MYz1sSnxqnvaSORhpGKVgHf8u0NAM+2XA9duD/8IS1jCSEL9PX2T0v3aWF6Gc3kk
 ZviUMYq0sRFLFCJokvaKyEMAytZFSFsUxFq4kcwiJ+0zdqPyuc6sYpMy6BVAdcrXKUnz
 /cp6ino3VovOO5E5KQWERD06QXNUpZzTGOOIRcHW9MDLICvJokDiJxyMVaUBm4y72WBS
 lLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=AKed33L7/gXTrNguuIgtZfEgy2m6ebn7NIyiYlN3tNg=;
 b=OY20stmjlkISx9dNXztA6FthzNk7VTxYXd/jTdl/GFmyLpc/xRvnlkkfmXBEh9rhME
 MQqZMPXd7HTn1vYrv7TNxxhiFvThqTVkb7ho1/985ly4lkgqPKUzB3XkcWWVE14Uy9Z0
 R2uHkSyrc/kMtfzX/vOzzE6v8KQ6Z42Kvt/OfiLEn1nFiZwDghRC5IaRkD0OLj4D/KFv
 7QN31CD8dqzgeluE+i+5HdvHNh7XMJYgkyld07PoF9F7HpfPhKt6cbPenaHfS0ZnqoNb
 lia9MLecNAhaww+hw3SzxeN1kTEPBetenn/pO6QeDwSF2ZxbTL8K9Gr5BPHocfKz2ZsQ
 aEKw==
X-Gm-Message-State: ACrzQf3B4pwPJ6YN6bMtVPTBEZFQAOQrG15JgsAS4jCapRb8zdkRL/mt
 CX5n8OFQkg8Xrzd+hJr7RhE=
X-Google-Smtp-Source: AMsMyM5ENhHIjQTMpHESgGfVi4JrbNsBL2JXlAsCjRr/7HcLP8f/u0Ufh618QDhyrOQ/5kvUBHYEpg==
X-Received: by 2002:a05:6e02:1c8d:b0:2eb:77fc:5618 with SMTP id
 w13-20020a056e021c8d00b002eb77fc5618mr2284907ill.268.1663336217063; 
 Fri, 16 Sep 2022 06:50:17 -0700 (PDT)
Received: from localhost.localdomain ([173.23.87.62])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a056638389700b00358f3cc92acsm2283153jav.36.2022.09.16.06.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:50:16 -0700 (PDT)
From: Matthew <ruinairas1992@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] Updated the orientation quirks to support the many variations
 of ONEXPLAYER and AokZoe devices.
Date: Fri, 16 Sep 2022 07:50:14 -0600
Message-Id: <20220916135014.2873-1-ruinairas1992@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 17 Sep 2022 05:33:33 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Matthew <ruinairas1992@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
---
 .../gpu/drm/drm_panel_orientation_quirks.c    | 86 ++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index fc1728d46ac2..15203c134717 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -115,6 +115,18 @@ static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd800x1280_leftside_up = {
+	.width = 800,
+	.height = 1280,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd1200x1920_leftside_up = {
+	.width = 1200,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1600x2560_leftside_up = {
 	.width = 1600,
 	.height = 2560,
@@ -128,6 +140,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "One S1003"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AOKZOE A1 AR07 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AOKZOE"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AOKZOE A1 AR07"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
 	}, {	/* Asus T100HA */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
@@ -308,12 +326,78 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
 		},
 		.driver_data = (void *)&onegx1_pro,
-	}, {	/* OneXPlayer */
+	}, {	/* OneXPlayer 800P Original DMI Values */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd800x1280_leftside_up,
+	}, {	/* OneXPlayer 1200P Original DMI Values */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
+	}, {	/* OneXPlayer 1600P Original DMI Values */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer Gundam Edition Bios Updated */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER GUNDAM GA72"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
+	}, {	/* ONEXPLAYER mini A07 800P Bios Updated */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini A07"),
+		},
+		.driver_data = (void *)&lcd800x1280_leftside_up,
+	}, {	/* ONEXPLAYER mini A07 1200P Bios Updated*/
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini A07"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
+	}, {	/* ONEXPLAYER mini GA72 800P Bios Updated*/
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini GA72"),
+		},
+		.driver_data = (void *)&lcd800x1280_leftside_up,
+	}, {	/* ONEXPLAYER mini GA72 1200P Bios Updated*/
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini GA72"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
+	}, {	/* ONEXPLAYER mini GT72 800P Bios Updated*/
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini GT72"),
+		},
+		.driver_data = (void *)&lcd800x1280_leftside_up,
+	}, {	/* ONEXPLAYER mini GT72 1200P Bios Updated*/
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini GT72"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
+	}, {	/* OneXPlayer 1 8.4" Intel Bios Updated */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER 1 T08"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer 1S 8.4" Intel Bios Updated */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER 1S T08"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
 	}, {	/* Samsung GalaxyBook 10.6 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-- 
2.37.3

