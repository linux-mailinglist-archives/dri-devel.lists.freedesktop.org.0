Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473E529BD34
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF766E1E6;
	Tue, 27 Oct 2020 16:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552D06EB7B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:46:30 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id o129so1255832pfb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ce/BR9EvmcTAIeIYrOWfvF2OF7XiiVdVxJ6AxLXXsFs=;
 b=baxFJDb6sot5krD0lCUz+OcmDp7BBWlfWIlLSCfvgmLi1zfMZ7XDqI0cKalI2AzreD
 6A65fg+O9UnoHsHaY7cXOvpHRZ0hupmQ4KvtLKjKyUbCO34snLFSQIMdiqSpsBW45blg
 z5y2jk16KyMZeF0OB0BGNxIqrgHSSTz1PIIRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ce/BR9EvmcTAIeIYrOWfvF2OF7XiiVdVxJ6AxLXXsFs=;
 b=fYCH2vdjaNETGee0L+WwK0RQSh21PP9nhweQPN8XW1CWeDMnn1ZqCtg4SPu3LZN/XG
 UxNn9oZNWb8D5dC8rnOhj0TlAb39F/PsYMo5GAv3b7+WjDQAQ7aZiHPOO3CGOfWwUUq1
 +FqxjEfYJKj1aSBNnKeoOxWTxnO4HWMvbaQgdy9HXMNr+3R2c/U8BLCU/fH3QhSZecsX
 ziIVH7jv+zauY1GPnT4TKybtUaS3ZsjyGua7vBqqjtlxasn0Ut86bXKWkLBOdZNjSLtQ
 fZZmiRCM1gzlxrx9/32pScr64p6aeMSbMjai2ThtsRMPAqNGbTDuTqFQ3g2Y5sUajsPm
 //qw==
X-Gm-Message-State: AOAM533IJmDBAAJ+jLIfAVE2J1b98UJN3DOzSTBguOX763Na0dmLzqnY
 XhALFsfN0sG4QqcYcS22vtnOg7Uxi5Zz+w==
X-Google-Smtp-Source: ABdhPJyuctKanzoH2Y1JSOzp4lVWCyh94EsnS26HaeUQmYUQXRmGP/xOtRVBTOFbDv82CsEtGNidgQ==
X-Received: by 2002:a63:1357:: with SMTP id 23mr2633527pgt.13.1603817189868;
 Tue, 27 Oct 2020 09:46:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id c12sm3002688pgi.14.2020.10.27.09.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:46:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/3] drm: panel: simple: Add BOE NV110WTM-N61
Date: Tue, 27 Oct 2020 09:45:55 -0700
Message-Id: <20201027094553.2.I71b2118dfc00fd7b43b02d28e7b890081c2acfa2@changeid>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
In-Reply-To: <20201027094553.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
References: <20201027094553.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
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

 drivers/gpu/drm/panel/panel-simple.c | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index cbbe71a2a940..c17c1203734a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1353,6 +1353,51 @@ static const struct panel_desc boe_nv101wxmn51 = {
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
+	},
+	.timing_constraints = {
+		.prepare_to_enable_ms = 80,
+		.unprepare_to_prepare_ms = 500,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 /* Also used for boe_nv133fhm_n62 */
 static const struct drm_display_mode boe_nv133fhm_n61_modes = {
 	.clock = 147840,
@@ -4015,6 +4060,9 @@ static const struct of_device_id platform_of_match[] = {
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
2.29.0.rc2.309.g374f81d7ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
