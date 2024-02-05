Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B4884AAE8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 00:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FC710FD8F;
	Mon,  5 Feb 2024 23:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="edpFx8et";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAFC10E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 22:26:12 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a37721e42feso255738266b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 14:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707171971; x=1707776771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jMW5wdmb5flI6vLFVtqD4Jumk1xc51o3V0jyjgs8wnk=;
 b=edpFx8etjATtEQsPDqzkLRSVFY5yCcW8XipCaC+wLpq+vAwaLe3pAvdH0BYpMPIDYU
 NMgqZdeQpCvXL++PEx/vW6ykEz/IZPJpxNkn5VRvZqn11Ic8l7BO03sYcJ+HJrjd4UN2
 1mC+RhRMyDFr0PYt5ULry5QuzOVPSm4INzs5NgfwhJ1FwvEQYT0LE0JUsTg+HOKRSuC5
 q8DSy77oUeWk+a5YPPIxylYVo28FFPeQLqMjvq/OrCqzjK7+Fl2Xp+72srs6/18cp6yt
 TKmoIwHq0PJ55OQufleWIq7G4A3V7OXTSxA4XxzsUQMUVC8gVQR4no70eOzrNlR1r339
 W+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707171971; x=1707776771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jMW5wdmb5flI6vLFVtqD4Jumk1xc51o3V0jyjgs8wnk=;
 b=heS/J2rzHc3YiWapgSUON2PzX4mAxtJrx9Ogr6U8wA+j8nMdYMV+WLSCDBaNyQRf6J
 t3+hs6NYJS6VR6O7heFZ0QNFLk435XOhGw6kobtU6jBbFNBBQIrKoPx4knSZbmXQR665
 czGqd6Ysvp2cTdy77xxooAl4yKLsA0KskpYzBHiqO5zATTCDDh58mG2ksOdYiI6o9MPi
 MK039Saz29Iy34wgGcAZJ2FNdIr3l3WMogJG1yzCkipKfIdrlk5FT+V/lx/uiwFwNaqr
 OgbwNGm0TXkhLmf7XNNX1rLsenuLsZU3PkY/i8XdP4F5PSOypSIVjskoL9gnZUAyWO/3
 kPJg==
X-Gm-Message-State: AOJu0YxrB5QKciWM98MsytSElY1jFO3nUTPOvVncNwNHyrHIqEZVOw8W
 euhUQWhHm3RoHpVPVtClCk0v4qYrx8LigeJ0LakoweJn9RlEhgWk
X-Google-Smtp-Source: AGHT+IE/FqKYit9aohk8It1ZTAaSm0WfL91R5trg6gCGqjVzKZedXq10IDnGZY0XorSUy746CCXy8A==
X-Received: by 2002:a17:906:41:b0:a37:1e9a:c549 with SMTP id
 1-20020a170906004100b00a371e9ac549mr416602ejg.49.1707171970972; 
 Mon, 05 Feb 2024 14:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWX1EJyOYmTktMLnOdtloZGXokcxAyu3WHr/pSCnNXGDP+u+5T+eARTd8bTkDCc+RgrBa7kMgodQb1VQsYp0eTIxpGDCk5XhlWCba98EHKTr9HwOnXCbCx/Y1bIqWQWlSqBFHnIuULyU5sFbWF/h0Ao8yiT6n7DDwr75M88OSIaZkZz0HpmjycbUU5xsIAVKcFEzn8X9qKfx1NkKzSJxsnJyh7Kmu44hdz5MgACwWplMEN8u77SsWd0e3I=
Received: from localhost ([2001:470:5139::819])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a1709065acc00b00a3793959b4asm325169ejs.134.2024.02.05.14.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 14:26:10 -0800 (PST)
From: cubic2k@gmail.com
X-Google-Original-From: tjakobi@math.uni-bielefeld.de
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for Aya Neo KUN
Date: Mon,  5 Feb 2024 23:25:56 +0100
Message-ID: <20240205222556.299481-1-tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Feb 2024 23:57:32 +0000
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

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Similar to the other Aya Neo devices this one features
again a portrait screen, here with a native resolution
of 1600x2560.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index d5c15292ae93..03224f8860ce 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO KUN */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
+		},
+		.driver_data = (void *)&lcd1600x2560_rightside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.43.0

