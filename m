Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D041B1F13
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0655D6E8B9;
	Tue, 21 Apr 2020 06:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171436E85F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 21:57:20 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y22so4466061pll.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ERuQZuCLk01x2KDiDzTtYEWNEw864gDAxj/pZ9kbAY=;
 b=vfIBvPwsW2MNCKWGAxhh5yAxrDMGifvsxaF+4So1WZxSF7vP1lW//oLDySbQAMBPnI
 LkGncBPyr9PbQbH/Jc5RUiNbIQeFATTGh6AsRoKv5G0WVeN3OhNWAZbet4FVHF09fBZr
 8K8W2QWAqU6pqDR/inMq0eNMP1W0UR/hu/AMHsycnRuRVetlWfMzc90SOny6tNIEGX/M
 2+M2LeNSr4X1ZpmQrNAYjorDqYedGwCAgsA+WTr9O0Nrh+gZnRLrG1cAWYToXC7B+2Mf
 rDcycMc+JyjRT0wSuyd2j6PuEmcwDnica5yMZoTZIY5KGk8Q/nUflv0ZgUxPa/IXoCO/
 fz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ERuQZuCLk01x2KDiDzTtYEWNEw864gDAxj/pZ9kbAY=;
 b=dLvRCxY8gRA60qCjRfwUkq3KfDSJ4sys4FTLOITkzfAT87AwqKjWn7bqJ6a7OJqKom
 d9WZN7pokT2gcacSpyY46Eqn3JJ3T78Jmb8xOpEdjokfJc3ltbE/SmQfih/6RxDFygYP
 n9FRx8IR6ZQ3sJBYEd02JFv/+LdMssiOft274TFylaUvAlrfklXSTqEdiW+tCWi3eu59
 zyzqXNhZgO9RSc2vmVuJygd0p4B8qEx2LOIhKN2MTicPApi1/y1rpSGrsYPYCFCP1dW7
 gFN4Qc7BtpDF65jDfXJUz9tJ36iEI+F7CgsZE+wi8I9lsqvk33WZnyGrp2EAmneM59bf
 vXow==
X-Gm-Message-State: AGi0Pub2TuGZm0B7m2ehC4L6oRRHnT9Y0tTqN0FtabKw7p7WL7WYU/0v
 oFg9RPoqJ4GxHawHu5l4sRIX0Q==
X-Google-Smtp-Source: APiQypJebqWLBt7PWYbUounxjinvwFHZmqwHIZzsMiNPPcvtKjGnPEhbjTMcSAPX1khY32okPttWWA==
X-Received: by 2002:a17:902:7793:: with SMTP id
 o19mr11532864pll.107.1587419839603; 
 Mon, 20 Apr 2020 14:57:19 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 62sm455565pfu.181.2020.04.20.14.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:57:18 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] panel: simple: Add BOE NV133FHM-N61
Date: Mon, 20 Apr 2020 14:57:42 -0700
Message-Id: <20200420215742.1927498-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200420215742.1927498-1-bjorn.andersson@linaro.org>
References: <20200420215742.1927498-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BOE NV133FHM-N61 panel is a 13.3" 1920x1080 eDP panel, add support
for it in panel-simple.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3ad828eaefe1..5b92583bccdf 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1124,6 +1124,36 @@ static const struct panel_desc boe_nv140fhmn49 = {
 	.connector_type = DRM_MODE_CONNECTOR_eDP,
 };
 
+static const struct drm_display_mode boe_nv133fhm_n61_modes = {
+	.clock = 147840,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 200,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 6,
+	.vtotal = 1080 + 3 + 6 + 31,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc boe_nv133fhm_n61 = {
+	.modes = &boe_nv133fhm_n61_modes,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 300,
+		.height = 187,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+		.unprepare = 500,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct drm_display_mode cdtech_s043wq26h_ct7_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -3478,6 +3508,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv101wxmn51",
 		.data = &boe_nv101wxmn51,
+	}, {
+		.compatible = "boe,nv133fhm-n61",
+		.data = &boe_nv133fhm_n61,
 	}, {
 		.compatible = "boe,nv140fhmn49",
 		.data = &boe_nv140fhmn49,
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
