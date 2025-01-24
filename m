Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9EFA1C8B2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2254110E37E;
	Sun, 26 Jan 2025 14:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D3710E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:49:09 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3eb939021bfso1244247b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737751748; x=1738356548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5xA14pV/ID80+ZWYLSsOoIEL9rfki2kGsfrRSt/vpbY=;
 b=nkgCI3RWD7oYhWz/W6B09XFIa0UYZh7IyvPtjOU+mHpfPcWfev/YLURBp23p01ZMPW
 kXefHCxeIxMnsZyJ8FgS48V1QLHoxDguW42OvbcqAy+/aXUmeBDAgGrSI/5VdcCcgyIG
 FMBgkdAMCO4xc8uq0VqddkdKMs8IqVSCvyYgnIvGqDnMVxWzdKa4SnzQaY8jXot6yv9v
 fotM3jAFZa1hP728SUQqJ1HRMXPiAlk5Gg2Tumt9AacWWNTBTChl9XOlJu0keFrmnVfg
 7t75kcksxPhEL3KUJUYSF/x7OTS3xAZ6XmZ8qMSSzAQs26GgDvb5qJnEMaIP5wwZ7/t9
 jYdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfmYwU5EsmKm6qbU2pTr2Km9KBX3gDGQYigx54CgbMVbTr2XyE0hdXP0iHjUaOnuxF59RZwhbsl/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxzb5RmqrTHADzty/Hz47h2tDmdSMqmHlI8rDPN0kHQfem14BG
 wLUSCH//5XFnln7pOoZ2jXQO7dpybcTQLRkHge49ktq84B+4fkq8wbueFjUh
X-Gm-Gg: ASbGncsUFDIME4hL7g71aCe4px5YfckzZMb6ubTs4WuC+Jd8rB3EdfRwrzRfrtFxfPd
 nTxP8Mn5vN8fGnH2pb0xRUyZwvgs/+Ebe0FCdu50PcbLQJwxO/slTyJ9GnwKlUQhOK/L2sgh8Gk
 GB2gTEtOdzG5LmErfprGYjnipVbOqXeTiMF8alA5Agu3Iod+joMOu1PA6rvxWtpFFODtTTVCGVd
 8muzRIoOxxkA/66XghAiOcRlmJHx9YImHjXRspFuSvJgyT52dN8IQwslktyDRzUH8Jp/ZKEaZbN
 ZNpaxQ==
X-Google-Smtp-Source: AGHT+IFoCw9pViPBJfjcoCYgkjD9iFLB95goRltiwpnSLVyw4cjDuOVRPwGZV0c0Kx+SMcyafVuOIg==
X-Received: by 2002:a05:6808:3c46:b0:3e6:63b5:f248 with SMTP id
 5614622812f47-3f19fbfe377mr21460708b6e.7.1737751748520; 
 Fri, 24 Jan 2025 12:49:08 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f1f0981130sm598700b6e.36.2025.01.24.12.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:49:07 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jo=C3=A3o=20Pedro=20Kurtz?= <joexkurtz@gmail.com>
Subject: [PATCH v2 5/5] drm: panel-orientation-quirks: Add quirk for
 OneXPlayer Mini (Intel) From: Andrew Wyatt <fewtarius@steamfork.org>
Date: Fri, 24 Jan 2025 20:46:52 +0000
Message-ID: <20250124204648.56989-12-uejji@uejji.net>
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

