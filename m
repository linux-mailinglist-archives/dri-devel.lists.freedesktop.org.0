Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB28A1C8AC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC2A10E376;
	Sun, 26 Jan 2025 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BB510E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:47:32 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3eb7e725aa0so1050209b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737751652; x=1738356452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2rFT6UPFjBzbaYoHK4JyH1XrSo+yhjpr3t2g2LL060=;
 b=kkrzk7otdC/zV/icyAmDuA9jkukh7n4hgxJOeviyIv2yYvfYQ7SdsZhllsLTFhrElJ
 ia+qY+3hOqcD+XLjHdxjl83KfU15kXxTRfAgEflcDwsPQa0ejEy5DzBena4qLMW2EvMZ
 BgdS7V7yvv0FyhJKOxG7vIndgqGYXO6Nqu7GcxMYOL1mxrpFGlWa5RaiiJiJhHP/MAxT
 GbMVMrE7XYyANeOBoHS7CKsQJrUl+bFlyyzU4PXcFEyM78VrmJa5Flaqp/hSuudFgHxQ
 UkQWgoClTxgNxmgbFYF68Jk8awEI0Semb7rJvZs1J/TQ7OoBkOak/jrqZUOv9T8VB8Ko
 U7Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN7bhYHAgOLp628dDoGXFdZeVx6pwhZso51xA66UhfLl/UxzzZya3TRtdaYhI848cvB9PwuPiIqhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgDzW5D1HRZImVhJMC/JQt15++m+75sFYMaHCX3Hdqi/Nl66WS
 EDCdOTKUt3z4GIXw/hqnc5VHbcJg+kY29j0W1liyLfZ1GF7KviRz
X-Gm-Gg: ASbGncs0dSmFbMomtZrIpjHQvjoM8FoMaKfnTqQWJ75KDe6uCGxJETWhjP3cbsoh4QM
 UpZ8LO3NIP5twXiEu1XdEzIKW4sTDSsHFk355Qz6b0qxW//LJYL4mumCeoqshUeWbKLrgty61J8
 wc3XknCdeLACmCZM0aorbR3hMyf8YxXABTFLnUYBqACc2gS3YNdlKzVumgoGQCQn0zl98w5WnCR
 kvCPZ0VLgGGo36MoYGj/CQRMIl1v1NQoLclpXLnbVIAlGZ8zUIu+GtQNACjbQZmRJTSgS73fa1Z
 KgJ8JezfZwRHzhmQ
X-Google-Smtp-Source: AGHT+IFqqf6lCndHXWMgjGWt86aJIeMlSyR7k1jd84Et0ur1qGKRTVO1fQOoPtdwfyZtY3anWIEkgw==
X-Received: by 2002:a05:6808:2e89:b0:3eb:7ec4:f3ba with SMTP id
 5614622812f47-3f19fc4b7e6mr21633026b6e.2.1737751651828; 
 Fri, 24 Jan 2025 12:47:31 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f1f0981130sm598700b6e.36.2025.01.24.12.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:47:30 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] drm: panel-orientation-quirks: Add support for AYANEO
 2S
Date: Fri, 24 Jan 2025 20:46:44 +0000
Message-ID: <20250124204648.56989-4-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124204648.56989-2-uejji@uejji.net>
References: <20250124204648.56989-2-uejji@uejji.net>
MIME-Version: 1.0
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

AYANEO 2S uses the same panel and orientation as the AYANEO 2.

Update the AYANEO 2 DMI match to also match AYANEO 2S.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: John Edwards <uejji@uejji.net>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4a73821b8..f9c975338 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -184,10 +184,10 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
-	}, {	/* AYA NEO AYANEO 2 */
+	}, {	/* AYA NEO AYANEO 2/2S */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
-		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* AYA NEO 2021 */
-- 
2.43.0

