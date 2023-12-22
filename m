Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F681C68F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 09:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB46D10E0FB;
	Fri, 22 Dec 2023 08:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799FD10E049
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 03:02:22 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-42792fe28c2so10805551cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 19:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1703214141;
 x=1703818941; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ycJodXT+JZm9RNjkqB/4yrbtDWd2hG7NkdRmpVRoew=;
 b=gHlc8XkZhdFu2zP4+4iSa7lFwK2Fg2BaRPCpy0H7OcIeUdDIOol4J8pCFQJZ1R/tDA
 m5uss+9WF/fLquUzbAftRU2NWufni9HA+JSv+WLB6NBx4Ij7LPaQGcc3q7s+C0mXRq3L
 SFRGfKSZv/ZMDSY4D+r64wusNDRr0R4/jNujNSA+qSFoO4Td2bAMZ1d5dHxJ35vYZGyn
 cSVTVyNcZtoPXmCN0TZ/SEDpbV4M2IbqsS19rxBQj6tB9ytE4HPJsCIIyzYwc3OCA6ns
 6YZd9y5P4xqi4AyM4EUvqzDQ6PFHVCImTqgf6RkwbenW8NhE2RY7uNqnkTL/X4lmnWiB
 jwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703214141; x=1703818941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ycJodXT+JZm9RNjkqB/4yrbtDWd2hG7NkdRmpVRoew=;
 b=cvDfXSRFihz+lhp+UGyFpkzWvq/4DKHKN9pUX2IX0GGEkWUOnw9zHTBpPK++70IbgM
 DGLyNECRSK0D3vHRafbN4Mf7jajYOTTbjT/rkmNKbCpVpcGmsnZDIXNkvlbIm9WkXCTY
 WfOOLQIn8tNNtco8VCToiVV6qT5weajH7LkgJVMgwj1KVX5eZ6vvCt6KSd76lpL9jP1G
 Rs7FEKHDJ6A4iuf4Q0tpYDp2hhovECG7Qm9+lo1RhbagnziA+7GhfdJpMhNpI5wOxomA
 NPWu1x6MuupgZVT7C5cVapI/97ET0GpxGZVQGjOgp97zFPtjDSpLJEf+Grwipw73Esra
 Zi7A==
X-Gm-Message-State: AOJu0YwlxFxB8kVQXZbmMmuRUr/2bfn1dfvIDn4WAWPPf0K6pQyACVDy
 4c9uDx08Ax84SEp+1tzuaAsmJsO2NSB1Ml9UBnVWZo2Npl96
X-Google-Smtp-Source: AGHT+IE40nhHEoelPMU/O3MVy2WfMGSFfflA4Fa2S4y1VDWTmTHF7liaXsitD4NIA5+wJEBX0bQRog==
X-Received: by 2002:a05:622a:1ba0:b0:423:732e:c345 with SMTP id
 bp32-20020a05622a1ba000b00423732ec345mr882621qtb.26.1703214141401; 
 Thu, 21 Dec 2023 19:02:21 -0800 (PST)
Received: from localhost.localdomain (135-23-195-66.cpe.pppoe.ca.
 [135.23.195.66]) by smtp.gmail.com with ESMTPSA id
 ev4-20020a05622a510400b0042387bd254bsm1419008qtb.9.2023.12.21.19.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 19:02:20 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: panel-orientation-quirks: Add quirk for GPD Win Mini
Date: Thu, 21 Dec 2023 22:01:50 -0500
Message-ID: <20231222030149.3740815-2-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Dec 2023 08:27:45 +0000
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
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---

Changes since v1:

 - Add 1080p right-side up panel data
 - Use the correct panel orientation

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3d92f66e550c3..aa93129c3397e 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -117,6 +117,12 @@ static const struct drm_dmi_panel_orientation_data lcd1080x1920_leftside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1080x1920_rightside_up = {
+	.width = 1080,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
 	.width = 1200,
 	.height = 1920,
@@ -279,6 +285,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1618-03")
 		},
 		.driver_data = (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win Mini */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1617-01")
+		},
+		.driver_data = (void *)&lcd1080x1920_rightside_up,
 	}, {	/* I.T.Works TW891 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
-- 
2.42.0

