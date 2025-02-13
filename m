Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B259A3512F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7493D10E151;
	Thu, 13 Feb 2025 22:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C273710E151
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:25:07 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7270713db26so339522a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739485507; x=1740090307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkhhJpvktwkvV7LdqnfaxhleGSqjs7jvYncE9GyNCL4=;
 b=tkCPqU/nbcHKGQtlz3pLC+yyDYAqzIRzt4nHmM0miIYFrnsWy6Lx6MFKj6bv02gOZt
 zoppIN7VRXm5bknccrwVHg9hnAMV3KeWNO5Ds5nKByk67PF/qNGanhZ2hYtLnX3Tx/mz
 ysIY3WPaJhhkap9/qo0loH0Gl3OtlClp+YU59H2YJ6HtU7ifR4S5qjN7hgio9lfU41b4
 eD2K12pxkbymX/x0fWifWm4E3B89uI123urt2ouJhwVT1P7sG+j5K40debYnHl8z1D7K
 qd7xwvS1y7WckaBDikBvysSa6zlXczwVhVu5awaovc29lvRGjCBf+LETIpd73X9GkJG/
 Ccqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6UGbYV3OFOXTesK8Er/DWZYODOogbT44twTPVQoQPCUIYR6E9GbIH0AVoyEZ97dvU3Omathrwo6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbd9Vqd4hXlJZF3TE420kpJQVTZBaMhMZMtDfPNWpltct5trWQ
 6hORr4QIBUlz33EdcSHo56R8L6Sh4TTlk6ndWmAx/xg4U12gtZ4jD+Pkhx5r
X-Gm-Gg: ASbGnct6tvT2BZEFZ613/WvqaEaiHshRe7jAy/Gp6IvbPB7vaNrWH7Lfn+OS/G+OwgQ
 ZL6FcTDxlyzZbx7SOTsBpr4cq4fkUNC2BD0XUCI1chtKIJfVAoSpFysmU7/Ax2ipltge6yj4hqA
 Yai7u7fgjA9BSjP2Ljcc5ZpAxYQmqVQRiOcnnHgVdCJ4h55IEsEnSOUNhvDLJf5Qcc3y5HUw+Sx
 Annp6dVHcrpyIOKQ72348VDzoCwhdq91rJl5qZ+ybeKMFv0O6dJp3aiPEQUT28K5NlzekZftshO
 1APsT+qfpi4Azu2e
X-Google-Smtp-Source: AGHT+IFtP3uWg6TAJVNiySjP6wyYc+vZZ1FwohqMlkNmdGPgIgWEz6mzL0Op7/CYpJPMYbspPWQF4g==
X-Received: by 2002:a05:6830:6813:b0:71d:f239:c0a8 with SMTP id
 46e09a7af769-726f302c18dmr5158284a34.6.1739485506968; 
 Thu, 13 Feb 2025 14:25:06 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-727001cde00sm984184a34.5.2025.02.13.14.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 14:25:06 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] drm: panel-orientation-quirks: Add support for AYANEO
 2S
Date: Thu, 13 Feb 2025 22:24:49 +0000
Message-ID: <20250213222455.93533-2-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213222455.93533-1-uejji@uejji.net>
References: <20250213222455.93533-1-uejji@uejji.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrew Wyatt <fewtarius@steamfork.org>

AYANEO 2S uses the same panel and orientation as the AYANEO 2.

Update the AYANEO 2 DMI match to also match AYANEO 2S.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: John Edwards <uejji@uejji.net>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

