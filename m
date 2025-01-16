Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A4AA14B6A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E2110EAAA;
	Fri, 17 Jan 2025 08:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463FD10E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:53:14 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-71e16519031so620143a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042793; x=1737647593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kA+5/cCDMEVy9H9hQsMuvHPoF7Lama9bj1o+Le+tyQ4=;
 b=nuWzaeN5u35iexuyueRxdLowqgdG6XZxIpQYQLSj5CfI0IbaaxrMZOA9RBiGX3a8Z7
 GoHDYkMZtfukXJ+ztR5/rAQuL8ipFKriR8L5YQCZzKwjAlOgBgrAj30f3j3ll3khBuBR
 +iiRzcGRj7zDenVlXe5YN4EVKLyI2479QD7GW04iGnTtnVezEKZRmoqaLer8tHWr9Bhu
 B5MuZUX0e+H3+SAIGsLqy57Lgp4qkzt84MIYdLIMdsuNptGYaFG7MxLW4NdDUiiqOsZw
 /m8biWCOwzX3K/H4ij3r/JMmG6pBmI/4TIYRvq6ty0N+3/6dZqQoI+R1IN0I7W9YGfB/
 8IWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMtAb7jwGgXoCrgBe36JMhtb8N24j1/rbNP60/neoD3cePOXv3UkZ2myfoweLDLJFZZeyT+3y2cv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Ip0wCdXziclTNkvU4Erpu16jJIyAcnNVtruBIhtng+S5HMM2
 9q4Bjn/X4ILsL+/XH2p5XBjXuSlnNypkcLPlEsqH9iqq5VtRQ+fg
X-Gm-Gg: ASbGncvOrXF0pp98Gz71QB9r+1zwJRyVgvshecz+nIGVXR23eLQekhJbHYRijtjbFMc
 LwKXgUyFUsdcVda1vYX913Tq0Sj3d6IJo9Vv2PGzk5eerZwgMPPg4//TUtVY2Y+8T2iJvO/IlTt
 I+h6Cq0wR76/9mqnlZfbo48RbkVCFZLXUpCNd4KAulLAEp8AhY1B11mgHXDWKd2iftP58YFiS9w
 UzDXVJ4ThEXfaR1reLJZUcm44CxKo3KSLYnfo2H9uQFZZeoOQJpk3qi8A==
X-Google-Smtp-Source: AGHT+IG8ZIE5+BJhaGeJRBaZvEsBRD3tiHiI6FaSGMbUXWETrlCMwASRRfR9lR9VvtVaZMjKvT+DTQ==
X-Received: by 2002:a9d:5d18:0:b0:71d:eec3:5623 with SMTP id
 46e09a7af769-724858ff63cmr4821346a34.4.1737042793502; 
 Thu, 16 Jan 2025 07:53:13 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5fa35f05bbdsm70538eaf.13.2025.01.16.07.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:53:12 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, John Edwards <uejji@uejji.net>,
 Paco Avelar <pacoavelar@hotmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm: panel-orientation-quirks: Add new quirk for GPD Win 2
Date: Thu, 16 Jan 2025 15:50:51 +0000
Message-ID: <20250116155049.39647-10-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116155049.39647-2-uejji@uejji.net>
References: <20250116155049.39647-2-uejji@uejji.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Jan 2025 08:46:14 +0000
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

Some GPD Win 2 models shipped with the correct DMI strings.

Add a DMI match to correctly rotate the panel on these models.

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

