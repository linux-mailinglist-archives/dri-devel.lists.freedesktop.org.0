Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDCA35135
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDB510E463;
	Thu, 13 Feb 2025 22:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024D710E1A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:25:20 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-726f84bd6b5so972672a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739485520; x=1740090320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbXz1euv/cPJto4Z2heNFSHbQ1+cD/Kyl1f7KOCLRQA=;
 b=mbvsDDq6nc93V0P725OWn92xmkuP3GlO6tQBRrIAYcxEBu8ACZvREHoNhZMRWTEB+P
 X8g0h0YYxPJQBDGtxyTaDbqVJg7yyDRQ8Y3TrDDP4TUNp+VSyKfuGb7yXimR/BZEAU5z
 /Bx7qJ9GS5hEfXuL/Pey8PPMrG87xKI54KREK+M2ghaAMttUVSHVatNK32Ac4UXt6yGD
 Qx0ZU7QpFBsSLZbF4ry/L/yhnSykOmxx5/6ToXpfkHB986jRt97fnFcBVs4ADIz6O9+W
 BCttFiysdx6zjaRSonNG2kI5zkNIR+H5Eqx468I9i9Vsag4ZEmJDapR3pVIAXcQGqjnT
 QJ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtKX2Z5V5OaeSLsbWuze5j/Xb7qytCwbgqY6SqC9HDaFC1vssHSSwOwlfzjP84gWXGdogfvTrYmzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu5ujM6QxR5/cH8jOUcuJiD9LxObtQ6LjbIwWefRsWn9fVqJpa
 kbVMepUwt3eZcI6zWBJBkEjxmqSboRx/6HgyKzMref2gf0qVaVTo
X-Gm-Gg: ASbGncs1GG/49d7MkA2CIKFcPzIHvyiCwZavuaTuCQV32ciNUY2XifyBgwvA+QCrDOV
 FGCT9PO1MYjO47yCdXT3SY9xxjfS24nZ2FtoTJL8ovYcDUunahsnzZW36jRnug3Jxb1OFOm2/SC
 ixXkJjy+ZFBguKWfr9uFwibGSUaOTZp6V6fpuucGP+XAqPUuk+792OjrGOlpfxnTm4n6PGyYNK0
 eBPaESoR+quLIzu2Rw+Bfr5EaU/L9PcF8JfsV51h6f1qhcBpDQyiT8sCWoxnQ7J0DwRnK4NEACO
 p3SKutXZqvnTi17V
X-Google-Smtp-Source: AGHT+IHxK1p4NsYf81sYIzrNKJsg7ljfMe1tLS+UA3xHsLoNyXR1fUqhVsxBfQAGVM5OOQZiQYT3AQ==
X-Received: by 2002:a05:6830:1318:b0:726:fe71:5373 with SMTP id
 46e09a7af769-726fe715469mr2911731a34.4.1739485520213; 
 Thu, 13 Feb 2025 14:25:20 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-727001cde00sm984184a34.5.2025.02.13.14.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 14:25:19 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jo=C3=A3o=20Pedro=20Kurtz?= <joexkurtz@gmail.com>
Subject: [PATCH v3 5/5] drm: panel-orientation-quirks: Add quirk for
 OneXPlayer Mini (Intel)
Date: Thu, 13 Feb 2025 22:24:53 +0000
Message-ID: <20250213222455.93533-6-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213222455.93533-1-uejji@uejji.net>
References: <20250213222455.93533-1-uejji@uejji.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

