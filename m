Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485702AC9F9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 02:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFAE897C5;
	Tue, 10 Nov 2020 01:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EA289623
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 01:01:25 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f21so5606523plr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 17:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQGwaDV0ot1OLpjjnTBztSL09/8IGHrWUwhyxX/y9kA=;
 b=QjEmxhtWZHle8inOOJpn/TrhbZu+KpW6PGXHs5TnWeq5zdnBXd0aqG4Mru4nUkQ/Pv
 McIJhZFq1jJB4Y49jJ49rr509sUJIBVGOt0HEB9oc8+VPuDbCdtoCIVtRi305bhFJSP0
 /Y1SM5Cz93fNHU27IY2pFGj07cfyy/kEUbhgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQGwaDV0ot1OLpjjnTBztSL09/8IGHrWUwhyxX/y9kA=;
 b=KP9+HxTUHVYhBbD/hsdPBwyj/Mq53nqjytn+KaSepRgCp7WxAyZF314lPirr7yiotN
 vBzPJJPwB06DLzYIXxrOTdbPg2Y3hIMoeNaRZnPwH2Llk7PfQ6IKk5Q1iXNafTfQlJka
 MevYWSOk3zaRpxjki1pBCljnpkxUcnN3gvZYONAeTOg93WYDKR87oNSQ8iINdQwCoqMU
 c1wm36oynN7K+k5HuUzEALWofEJvzOGyVdylmjLoY21avWIw5fAM5/ttxYTMCamvBJLe
 Zl0OT2FujCi1dm3MlmR1/EC5BP/bAAXtjlS1s93RtvPKgXUsR+b48hQyg+jWGHu8aLDQ
 wEGw==
X-Gm-Message-State: AOAM532Gz6+NHNQNKmI1Vq7ViQP7S5byqBx98x2+nbNQsCOTpT3QjjMM
 DYut7EVV0REVd5ilHYSwz+QrPg==
X-Google-Smtp-Source: ABdhPJxWIWdCoI/7TxhGiOBTrw0MI77xf16c72Is9XrcUOhOP6ZdjS+Kj24bGSPtoSJBDk0RAOCeqA==
X-Received: by 2002:a17:902:ead2:b029:d7:ed4b:5624 with SMTP id
 p18-20020a170902ead2b02900d7ed4b5624mr2858663pld.27.1604970084973; 
 Mon, 09 Nov 2020 17:01:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id u197sm7283233pfc.127.2020.11.09.17.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 17:01:24 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 4/5] drm: panel: simple: Add BOE NV110WTM-N61
Date: Mon,  9 Nov 2020 17:00:58 -0800
Message-Id: <20201109170018.v4.4.I71b2118dfc00fd7b43b02d28e7b890081c2acfa2@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
In-Reply-To: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
References: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the BOE NV110WTM-N61 panel.  The EDID lists two modes
(one for 60 Hz refresh rate and one for 40 Hz), so we'll list both of
them here.

Note that the panel datasheet requires 80 ms between HPD asserting and
the backlight power being turned on.  We'll use the new timing
constraints structure to do this cleanly.  This assumes that the
backlight will be enabled _after_ the panel enable finishes.  This is
how it works today and seems a sane assumption.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Rebased atop changes in earlier patches.

Changes in v2:
- Adjust for shorter names in patch #1.

 drivers/gpu/drm/panel/panel-simple.c | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a54f42cb3adc..9bb723696e94 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1396,6 +1396,49 @@ static const struct panel_desc boe_nv101wxmn51 = {
 	},
 };
 
+static const struct drm_display_mode boe_nv110wtm_n61_modes[] = {
+	{
+		.clock = 207800,
+		.hdisplay = 2160,
+		.hsync_start = 2160 + 48,
+		.hsync_end = 2160 + 48 + 32,
+		.htotal = 2160 + 48 + 32 + 100,
+		.vdisplay = 1440,
+		.vsync_start = 1440 + 3,
+		.vsync_end = 1440 + 3 + 6,
+		.vtotal = 1440 + 3 + 6 + 31,
+	},
+	{
+		.clock = 138500,
+		.hdisplay = 2160,
+		.hsync_start = 2160 + 48,
+		.hsync_end = 2160 + 48 + 32,
+		.htotal = 2160 + 48 + 32 + 100,
+		.vdisplay = 1440,
+		.vsync_start = 1440 + 3,
+		.vsync_end = 1440 + 3 + 6,
+		.vtotal = 1440 + 3 + 6 + 31,
+	},
+};
+
+static const struct panel_desc boe_nv110wtm_n61 = {
+	.modes = boe_nv110wtm_n61_modes,
+	.num_modes = ARRAY_SIZE(boe_nv110wtm_n61_modes),
+	.bpc = 8,
+	.size = {
+		.width = 233,
+		.height = 155,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+		.prepare_to_enable = 80,
+		.unprepare = 500,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 /* Also used for boe_nv133fhm_n62 */
 static const struct drm_display_mode boe_nv133fhm_n61_modes = {
 	.clock = 147840,
@@ -4086,6 +4129,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv101wxmn51",
 		.data = &boe_nv101wxmn51,
+	}, {
+		.compatible = "boe,nv110wtm-n61",
+		.data = &boe_nv110wtm_n61,
 	}, {
 		.compatible = "boe,nv133fhm-n61",
 		.data = &boe_nv133fhm_n61,
-- 
2.29.2.222.g5d2a92d10f8-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
