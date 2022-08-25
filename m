Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF585A1964
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 21:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D1E10E0D7;
	Thu, 25 Aug 2022 19:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA1110E072
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 19:20:13 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s1so26699291lfp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=kF9MhVcSbXaljKbuFL1RJfsDNuyI/P+cFQh4/nvdssI=;
 b=Z3O9KnWdeGQQyHdKD6xIdD1D3F7D3Mq4205E1Ze3dba3OzOQFo4hCla/cv6O7CqHen
 gw6iHhjSoXMnen0FA0JFZdPukmDfzHCV3wrGTpQiytxViMwv77Pm+ZSkpVM4Bgc254cA
 MV79FMi5QDtdWGthf0ov2Z3f+XwSr9lgVvNqH52cr6kR42jASUXKUJoQtFmhMJKf9tfW
 gDOpZBdUcAclHbWxBn8wVAr8ALnpdsli+8Q+tOxU3DVotBlQilW7wkA5tYiHUQyxtui5
 VARtKp/QoeUyWt5z7MWOjP1NkhVovHuLXlLWNkwEZLvdQMo0ofXo3aIn7jjImr5M9bJI
 cFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=kF9MhVcSbXaljKbuFL1RJfsDNuyI/P+cFQh4/nvdssI=;
 b=oSeBPpGcOgiG3QdYxm7yIRINcPcelBXZJoaplb/68Iga2Lubz/ZnIWJemHAMdPeO6R
 jq3BHI7Jln8EvAgWWFWsMkAt+TPVymj4s8qdBlQRy+Bvy24S2pJKEw/IVotVhzQoVktf
 pD1/Re882vE1qtiOx3YywXlCnrWG/f1r87LyOVy4eP3GQAgbHy8NSAgHxInCBqFhEb4T
 lz1fnE2TKDZrX0cfVH5glMg+I0IVon97ejfDuRIHwGaLiVsZImyQoaXOag7/0lSFWtQG
 ZKJ4RygiCrTTyqc8fWMx5Sm7JsLqXGyFPqkwM2AbBwBUrIlJ5q1b5L3lTUPW/DYa7Dpt
 HOIw==
X-Gm-Message-State: ACgBeo2peie+X+o+aPnA5LUcQVz5Obee+esXoH6RWE+Fwin0ki0HwiMq
 aqL761bhvDXu7udSWn2eRz7ZnWTFNlPSAA==
X-Google-Smtp-Source: AA6agR4S1Vt+QCpWxNLHgv/Ec0zp+VC3W/CaIotz+EYe+34gokNpcyUEQFEkIxH7EgSp966JtsnMAQ==
X-Received: by 2002:ac2:5225:0:b0:493:7fd:58ef with SMTP id
 i5-20020ac25225000000b0049307fd58efmr1462808lfl.330.1661455211212; 
 Thu, 25 Aug 2022 12:20:11 -0700 (PDT)
Received: from localhost.localdomain (79.191.37.241.ipv4.supernova.orange.pl.
 [79.191.37.241]) by smtp.gmail.com with ESMTPSA id
 z20-20020a2eb534000000b00261b58cbf03sm30896ljm.87.2022.08.25.12.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 12:20:10 -0700 (PDT)
From: Maccraft123 <maccraft123mc@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for Aya Neo Air
Date: Thu, 25 Aug 2022 21:19:47 +0200
Message-Id: <20220825191946.1678798-1-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Yet another x86 gaming handheld.

This one has many SKUs with quite a few of DMI strings,
so let's just use a catchall, just as with Aya Neo Next.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index fc1728d46ac2..0b011b615495 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -103,6 +103,12 @@ static const struct drm_dmi_panel_orientation_data lcd800x1280_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1080x1920_leftside_up = {
+	.width = 1080,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
 	.width = 1200,
 	.height = 1920,
@@ -152,6 +158,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO AIR */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_BOARD_NAME, "AIR"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* AYA NEO NEXT */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-- 
2.37.2

