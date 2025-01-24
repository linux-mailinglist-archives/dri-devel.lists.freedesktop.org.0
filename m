Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21683A1C8AB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A536310E375;
	Sun, 26 Jan 2025 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D0910E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:48:18 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3eb790888c6so661856b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737751698; x=1738356498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSgi3kw7bFscI4U3pI0dPYp1l5hHbgjpKx8NF/oyVvg=;
 b=QuycBp+WtdCkvr1mNIKLXH9LblhVVZnikuKiHqPGXxqF6rmCdfLte5Wi2hpBYeLrg8
 OipP2P5QM0wH+7Yf1kNvOvBmOua5+ZgHoQiGWPhvUOcNTPMLJbRYlyrgXAvBSikE1PUC
 Jlag1EVKy+p7JSNk4wydll9atSZfqNyHfD3SDniIWr9lnRKOYpxLbmT7SvPU1K4Iw3Dt
 it1OWXZk4mYa3buBVu8FfSdhFGvfY8SaaPxu0/tnM44hAqF1EsC7ltzBFc1pPNSnAxM4
 yqYXVcNXKSptKU5AjANiFMPPYY4kffL04FTA3nl8AUip/c1y1dyb7QLzxJGN3nVOjQY3
 EUpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqc1aRml802knn6Ki4nj19s7/4ZGRCIG0r9KiCNVz9+u7MnHsyJZNOdVcg6trAvjwAk7b4T15l+ws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxul2yGX4Tk+eIrEFeAaf2sNyGgKmYciL9QK/mfutNhGnO6iDuF
 5chJeU5AfFRcqslCqGM1M0tK2YeWA1d6xSCWw5kIHj5DSbOxee0x
X-Gm-Gg: ASbGncsm5jZOk0OJDbRgfDTTF85XJitg2qfybnoDwFQCmKdGjfXsEw4uyOeewA8EDpt
 a2PMj0so+taHmknRYzy74D2h4VK86Wa9DnF2VA49j7swdDQrJg+jy8SMOKvXZudW4ocersp1rwc
 Em/5miEHqOX/Y3mDXYbT4ZEoh7CufFQySZn0jDQGEbyuMBvqpyUwA1LTMKV7GTRY2Bgdj51RKej
 bG4eBJaqA/RW3xAbyWNwp904dm96HF5hu0235UDfWx+iOSKyUhLYWjgq8aGB0t6nh96O4hsZKb9
 DSiytg==
X-Google-Smtp-Source: AGHT+IG80veEMQhupDpObdV+bU0AgKFzhdJHt/NS6t/Qj2aJuLV/Rb+ztj34oVJUUYrZPJYRSX3VIw==
X-Received: by 2002:a05:6808:398c:b0:3e6:5761:af3 with SMTP id
 5614622812f47-3f19fc7d842mr21834906b6e.9.1737751697838; 
 Fri, 24 Jan 2025 12:48:17 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f1f0981130sm598700b6e.36.2025.01.24.12.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:48:16 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm: panel-orientation-quirks: Add quirk for AYA NEO
 Slide
Date: Fri, 24 Jan 2025 20:46:48 +0000
Message-ID: <20250124204648.56989-8-uejji@uejji.net>
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

The AYANEO Slide uses a 1080x1920 portrait LCD panel.  This is the same
panel used on the AYANEO Air Plus, but the DMI data is too different to
match both with one entry.

Add a DMI match to correctly rotate the panel on the AYANEO Slide.

This also covers the Antec Core HS, which is a rebranded AYANEO Slide with
the exact same hardware and DMI strings.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: John Edwards <uejji@uejji.net>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c5acf2628..9e6708cd1 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -244,6 +244,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
 		},
 		.driver_data = (void *)&lcd1600x2560_rightside_up,
+	}, {	/* AYA NEO SLIDE */
+		 .matches = {
+		   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		   DMI_MATCH(DMI_PRODUCT_NAME, "SLIDE"),
+	},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {    /* AYN Loki Max */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
-- 
2.43.0

