Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E624A35132
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11EA10E156;
	Thu, 13 Feb 2025 22:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3486E10E156
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:25:14 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3f3bac262f9so890836b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739485513; x=1740090313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5Koqqds6/Oa1Ks59aNVsxFB/wqKaebUccbyhlEMaPk=;
 b=Kt4yp4OT9g3ZaPJc/uBmAc7yw4NJsRKjY1atS4/R1xeV4I4by5f6NUco0T1noAMOgE
 ZgrdkYg9Qz5PirDqWptB1aN8aeHDFKHKjdgtVjKLrjBqFUf7kCUSZgNmu0W/uWHNywJm
 RWPC6x8LaO341j3vkpZTh0yL4UhEqH+ph7OvnLoRzUvkiKQulym/9UblSMyT1ltr9MAX
 KvFnaU66kwkreJHhPDk0X+ggufZGB4z30wGGsswkRIPoWjYcvilyMkmMak85sP/sIOMi
 26TNy7C1QXHk1SQvQIYIKfr/EsFqePj+WUHuR8Is3QZqQOnS+8zLI3ymJmfa6V3WTvs9
 kbDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRm/vOSg34F4PVbWK4MV41BD8nEZLnTi8BdvUPF+GmBuW7ATZXx9wHEvPqzxexWdZJQuFfkNjL4T8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynvDdQ4XUsVBQlbbu6bJlo/DPtsNDN2q1hbdWAM9rZNEFZ/D0o
 iusG5HziGXAUuMajHabNfZbTRpQMBhs43U7Nv5Pl5ZKXhvVs45rv
X-Gm-Gg: ASbGncs625+iaXErEAjHGLwdQP4adrjlyRBbHkr+QYXu8EJ6t22/3be+1y5hqUpSRN5
 HqIEG+LNCM+NNw5uFQHuKoeSoxWc+97yA2Y7oDBGdYqd7FvbPbbjIN9kNtt7Q/bBnWkkuakabjF
 Mc36d6mugZHma9fyWw2t4R8kLNOdOycEEXSCww27EOo4iRP23hynJJ3aQXgrKbe81j9S6+vicQO
 WnTnsKkzHn7vGh+qLog38OLLNqkdG+Jb6IKXEmXajhyCWPGA2JhVWDg61kIm8QkZAW8GwNbFIOo
 sndAVbyZn3hYWXfO
X-Google-Smtp-Source: AGHT+IGgZGSQ0bjsz7JLGz80TDQRbnkyLOC23cDSniTL9nQuAzEpOrzRjMZqGE4A3Tts2LgXfxfIeA==
X-Received: by 2002:a05:6808:350b:b0:3f3:e0ea:86f7 with SMTP id
 5614622812f47-3f3e0ea8937mr522134b6e.16.1739485513346; 
 Thu, 13 Feb 2025 14:25:13 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-727001cde00sm984184a34.5.2025.02.13.14.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 14:25:13 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] drm: panel-orientation-quirks: Add quirk for AYA NEO
 Slide
Date: Thu, 13 Feb 2025 22:24:51 +0000
Message-ID: <20250213222455.93533-4-uejji@uejji.net>
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

The AYANEO Slide uses a 1080x1920 portrait LCD panel.  This is the same
panel used on the AYANEO Air Plus, but the DMI data is too different to
match both with one entry.

Add a DMI match to correctly rotate the panel on the AYANEO Slide.

This also covers the Antec Core HS, which is a rebranded AYANEO Slide with
the exact same hardware and DMI strings.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: John Edwards <uejji@uejji.net>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "SLIDE"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {    /* AYN Loki Max */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
-- 
2.43.0

