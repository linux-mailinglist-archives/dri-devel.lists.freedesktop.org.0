Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A53986E45
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0625A10EAD4;
	Thu, 26 Sep 2024 07:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FBX1fpb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C85F10EA9E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:01:21 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3770320574aso347572f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727334080; x=1727938880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fs8vGQj6gBPYGtja4mFfGqlu9i7HD+/rnYLvYM98k+w=;
 b=FBX1fpb38ofyUcRF1YAX/Uc02Zw2Dgs6e7AVOb7offZymv0J2u1DprzKw+d6zCf/NK
 nPFD/r6yX4eVeKFcm59omKCDvRFm1wYQAgqEPI8mKmBmyIkbqCa/ThnhJNZxwRE7rmE7
 JwylVp9MMkKYjncf+Z+xfoRbsp4w4mos5IGXT0zCz+22uWeWm4m59PtGx1fKSzheysSw
 YSdgpZ0PXRXz3Si76j7MDXQU4fxp47CKsNMgRJInTRXAV9V61Lihq8QdJJH89jIUBZL1
 R30CF0wsWkjn3r87WK7d2jcmiFJN9mkIdUyv1JVHa5DGIahR/7rAl8OnL93AkqO2Z4ZI
 /82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727334080; x=1727938880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fs8vGQj6gBPYGtja4mFfGqlu9i7HD+/rnYLvYM98k+w=;
 b=IxzWOF+DSsC/IODU9lhcbpbwHuPpLiie78kPyvF3S5h+wUcJvnqRHf73MhmBPqG8is
 FhbbNGewlG3NUAR/IFjHyMnxnw/n+bb7MEa13zDv8R8Vd9cmKzCg0OYoAo7o3ReOtZNG
 tJtwkgQWKDiBBr54R9E2SiSIM3AgSMinUmB442wduJqA8bXwsSR1Ki8gfpFfAz/ww5/G
 MtIstmXxeP4eVJfwi7EjvHo6hryBAfvzhCAUlJxkietNMiAh/vqp+/d+ND0FKpV93W8+
 odHA3bPBLrl0TMHfitKdvKEnyn/GHW1hy1fpQszjo6xQeTrWb3LxiDYz7x1RMHa1eObc
 ODmw==
X-Gm-Message-State: AOJu0Yw5OlP0Dm+mRQbWW6LAgSUGarLDuDjL1OG/zqBAA80uOnMaiqlo
 qpyTzurtlucwS/VDOAS5GpT0koCcUjd9RpMrd+wT5Kq29cUgsnQOIWLA5A==
X-Google-Smtp-Source: AGHT+IFeVrfUbnlrIDKjJyVaR8iGPPmzPzTvbX7kFpQaA91rvYRac7K9b0Rhoeh1c+HkmnKMjHKffQ==
X-Received: by 2002:adf:cf09:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-37cc24739ddmr3746253f8f.21.1727334079391; 
 Thu, 26 Sep 2024 00:01:19 -0700 (PDT)
Received: from localhost.localdomain (2-230-196-213.ip203.fastwebnet.it.
 [2.230.196.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ccea4b9cdsm1053467f8f.72.2024.09.26.00.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 00:01:18 -0700 (PDT)
From: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
X-Google-Original-From: Marco Rodolfi <marco.rodolfi@tuta.io>
To: dri-devel@lists.freedesktop.org
Cc: Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: [PATCH] [v3] drm: panel-orientation-quirks: Also handle rotation for
 DeckHD equipped LCDs units
Date: Thu, 26 Sep 2024 09:01:06 +0200
Message-ID: <20240926070106.208328-1-marco.rodolfi@tuta.io>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Sep 2024 07:54:54 +0000
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

Orientation quirk code take panel resolution into account when
determining panel orientation. Add orientation configuration for the
popular aftermarket DeckHD panel, which resolution (1200x1920) differs
from the standard panel (800x1280).

Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3860a8ce1e2d..32582dbdc184 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -420,13 +420,20 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
-	}, {	/* Valve Steam Deck (Jupiter) */
+	}, {	/* Valve Steam Deck (Jupiter) Stock Display */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Valve Steam Deck (Jupiter) DeckHD Display */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd1080x1920_rightside_up,
 	}, {	/* Valve Steam Deck (Galileo) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
-- 
2.46.2

