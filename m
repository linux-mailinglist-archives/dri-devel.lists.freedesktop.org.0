Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB673A1C8AF
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC13A10E378;
	Sun, 26 Jan 2025 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F170510E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:48:30 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3eb9101419cso1550811b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737751710; x=1738356510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTmcnMLYrKmxshYXQBR0d85tQtf4Zs+o04qMUE/3fe0=;
 b=iP8wkVuy48ACjoKhyjiH3fSF9cSAcIk8cHe6udrsvx3Q7IxDE72vao3mY/L/h6CLj+
 tl2ZpmZghd8gUsVpImeCK6ul14o8FmEaJJIESsBhn7q4epkCmItgKWqhX6hqhHAGswdh
 8+fH7Ib0x4tl6OD/bm9ma5x+LjZVtLbaVy6eFrtmcYfw3F8jOkqC+a2E+TGEQHhth8zS
 rwF540V5EL6saL3dGlmGRVCTcQiMtZAj8GcLNijf7OWIfM42rbWgHGTEwTIu8nnhmlLO
 bJWmLZ/Og0yjwF08AUzFCwdhBZgAHuaMGC+fXdJk54d8eSRT3byXRLoo6uS5vhg+wudi
 OC6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyclY0eKDpBDCtP/y1vJhGBYQZnYQOkooBKsRGZl4qzjoiO/UjDlhZT0tD97jjqDO3mX7P8rYFz4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0c9Vfe9SJ30+UlHlXz6Fm+J03g9aJXKHRPF9Kh+xxpOCMjXai
 zL4sh22Hudri9QRefpiddxVWql3WVUV/Bsu4TmySG5AKCJO/EA/U
X-Gm-Gg: ASbGncthGDkcq6PbHh3DasBSRe7yrdtBGX5kmKCW4f4TfZofkACd1ZdNpB3F1dVd01j
 4GCQXgGqnvnk1k8kh7H1pYRvCbTp6PMgl7EvcaSEgYXXicaP3AmgNJaR0BRLH81ku8I1pAiE3WU
 HEEDmFsT3sG9L51QDEfX4gHjMvRXKyUk002XQ/Zj+WJ0kqpjDmjUt2aGlXw0tV0IWAlT+aQyJlS
 /xPOYzftdaoLGOTWVvYvcJ7WjhNDgZ1dWUlXhHyuxGUOsaHWU97Ob/+RYam0XM0PQk1nupHwfKs
 5A3EFGMhImp0OESp
X-Google-Smtp-Source: AGHT+IHUENjiGVLI+oMMp3gBm5+kAKqMBuu4g8ZgEw8kKGT+Kr/ZYXTAqcZqBbONvERpVoLyMHtDDQ==
X-Received: by 2002:a05:6808:1c0f:b0:3eb:6e47:2fe1 with SMTP id
 5614622812f47-3f19fcd7a40mr18372654b6e.33.1737751710195; 
 Fri, 24 Jan 2025 12:48:30 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f1f0981130sm598700b6e.36.2025.01.24.12.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:48:29 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paco Avelar <pacoavelar@hotmail.com>
Subject: [PATCH v2 4/5] drm: panel-orientation-quirks: Add new quirk for GPD
 Win 2
Date: Fri, 24 Jan 2025 20:46:50 +0000
Message-ID: <20250124204648.56989-10-uejji@uejji.net>
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

Some GPD Win 2 units shipped with the correct DMI strings.

Add a DMI match to correctly rotate the panel on these units.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: Paco Avelar <pacoavelar@hotmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 9e6708cd1..e6148cc31 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -339,6 +339,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
 		},
 		.driver_data = (void *)&gpd_win2,
+	}, {	/* GPD Win 2 (correct DMI strings) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "WIN2")
+		},
+		.driver_data = (void *)&lcd720x1280_rightside_up,
 	}, {	/* GPD Win 3 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
-- 
2.43.0

