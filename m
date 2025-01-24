Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C1A1C8A8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F49910E374;
	Sun, 26 Jan 2025 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8994910E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:54:33 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-71e1d7130a5so1260858a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737752073; x=1738356873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JnOGBClk7osJ0B6upaFsfK1KgRp3GiXOZGZi8eI3q40=;
 b=tCWvlur6c7orm7c6kk8RX2Giz0Owup8neZqR/sv1GVs5zhpOcD+Weaiye2m/Lliwad
 MrzBGE6/9i5F7Knb4Tj+pfu9mkYIEaR/Eq/c8XfiRp9rGu2Knzd5pMDLhxQ8UsPHCRK9
 cWOaZC14uFvb0eATW8faQJN4G7ygVkviGTYVqXzSK0GraSZe7TnVSiqy8PHD5WRdOkG7
 dhvibjC/7fSdLNzVuQ8UCX2CVbIRVZhzRLdKmXvPsFNDHuUvCc9RovmXTLgYR+JlZzWJ
 FEmpCXzAeqbkFq8FdO1xXeSb4oMXixqps6rumk/XeOzp1YaC6lag+O3mD6hud32b/4Ry
 C0Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsJUdZ1CFQ5EmLSxYeE+cglfIrjKrtVJC3pxUeCq+wvdjyvJxUkSc7NKtYrcad1PDtxWdkesRgz2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDGhn9jbMs5TyvQ6kfXbGRng3dHfj5la55tcuTBCkETcX7SO6/
 B2G+b4G+9vrw3TAIphcG54rYHml4+LtA+Zh5dbSvHE6jCqsuoIEM
X-Gm-Gg: ASbGnctdgrSkXg21gV6QvNs8NOq/RGpAf15uMvDArSEnxqr2Gkn20YWDz3K07JiX6kK
 nNQj/EWgxuOEfjVe3FHhoVfIANqiG79FKYvrOrgFGnhVpl5BTz7wOkafwwNc2gMwzdQQe35I2mf
 SXtmQxRsa7YXca0ZOJsEpGNpDmP7ewfZ1qUExZjuqxt+aWHe/PoLD69hUJfK2XzV2JyjgQajsBo
 idGdxH/5n0vZjf/3SxKredA4xEyZUyEfnDahzPM32zdO4jDrcMfFr4vBL42pvT/brxguEaw2IWQ
 FXMGlw==
X-Google-Smtp-Source: AGHT+IEBJwsGWY0m4HRWqPxTKo9Z+JkgxvCDzRFG8SK7wGfzwjM0LCJjki2X4FEaPu19+tNx1Jzofg==
X-Received: by 2002:a05:6830:641a:b0:71d:eee3:fd26 with SMTP id
 46e09a7af769-7249da56939mr19282278a34.4.1737752072731; 
 Fri, 24 Jan 2025 12:54:32 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5fa8b9b8fd3sm553703eaf.40.2025.01.24.12.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:54:31 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jo=C3=A3o=20Pedro=20Kurtz?= <joexkurtz@gmail.com>
Subject: [PATCH v2 5/5] drm: panel-orientation-quirks: Add quirk for
 OneXPlayer Mini (Intel)
Date: Fri, 24 Jan 2025 20:52:51 +0000
Message-ID: <20250124205301.57041-3-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124204648.56989-2-uejji@uejji.net>
References: <20250124204648.56989-2-uejji@uejji.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

From: Andrew Wyatt <fewtarius@steamfork.org>

The Intel model of the OneXPlayer Mini uses a 1200x1920 portrait LCD panel.
The DMI strings are the same as the OneXPlayer, which already has a DMI
quirk, but the panel is different.

Add a DMI match to correctly rotate this panel.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Co-developed-by: John Edwards <uejji@uejji.net>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: João Pedro Kurtz <joexkurtz@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index e6148cc31..88aa57c15 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -129,6 +129,12 @@ static const struct drm_dmi_panel_orientation_data lcd1080x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1200x1920_leftside_up = {
+	.width = 1200,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
 	.width = 1200,
 	.height = 1920,
@@ -473,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer Mini (Intel) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
 	}, {	/* OrangePi Neo */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
-- 
2.43.0

