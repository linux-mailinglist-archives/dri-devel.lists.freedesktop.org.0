Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2981B1F1D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D083A6E8A2;
	Tue, 21 Apr 2020 06:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080F36E85F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 21:57:06 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id a22so451076pjk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w13L/ezkU/9Ek4TJ2p0jEnyPwOgfgHGWvOSyt05WFh4=;
 b=oZ0FhwZrFu/bCQOIbzwgeJPvCd3z18uNL9IMxUc5390+CmpsieWN6M9GfLMcmp9QNc
 hIpdZwvOZ1p+F9Xj2TAGyXi/+QPTp5dYEwAMukJbTdCXHT5CYarTuVB9HPRpj+luMNFK
 eQIM/XcOg3M1dH5JelqR+QajIGIx3fDNhvZmtE0jx+CnxuDyII//e9eqbTU4+d16wjqq
 cPSAcZ46Tia7vU67ZPztwyA/lGQtGAFDOA8VSkd7jYnvGkpwAyfP0nAsWOY5aF1HxOZP
 g9f0p1HXyUESzdnFuV4UytqNfocvcjXoJjo+35PWxEoAhBpWw2TrWPTSIgobukiCj0oh
 j5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w13L/ezkU/9Ek4TJ2p0jEnyPwOgfgHGWvOSyt05WFh4=;
 b=bCkQX3iF0beeYlYcr5+Z4C1d2OSCE+shaZHQ/hxO499fghWt/JxWw92wJSyKPqaEvE
 ag5sDShLBnaJ172BqQUErVWIiwP34VLdcpDKL2vS+CFzbEM8ls+d1S3Sx7wNP61qPSMX
 uXZgI9HpW4wmgMydrxXjJzGV8hTx9zPcPGlCxNxtklbhBg5Tstc62/kXxgNB1f0QC6s6
 vgzxuahtI5YYl3xbrmJ91NytRK9BgJZpwVb7GYz5sjRSz1sbhQhmIOVPkKbytkloir+V
 mUDXBesnEf12z+8DytWBEC0eKE7K2XGHQe0PZ3DEdn4xlFELVRLVevoQxC5HWEwvJaE7
 EXOw==
X-Gm-Message-State: AGi0Puay+qCibBMxHuBmNms8Mg6ul55ep9idkGArWXPHQ35D8QDI1FHM
 5J1K04MY5Pl/29DlmVNK380U+w==
X-Google-Smtp-Source: APiQypJpihiwJRryjS/UJF2bkGHPXlLDYV0x3LSZKA7/I8+h9FiscMuwFCune3ypxmgcZprSovFQhA==
X-Received: by 2002:a17:90a:fa17:: with SMTP id
 cm23mr1795903pjb.121.1587419825533; 
 Mon, 20 Apr 2020 14:57:05 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f30sm365863pje.29.2020.04.20.14.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:57:04 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] panel: simple: Add Ivo M133NWF4 R0
Date: Mon, 20 Apr 2020 14:57:28 -0700
Message-Id: <20200420215728.1927434-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
References: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
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

The InfoVision Optoelectronics M133NWF4 R0 panel is a 13.3" 1920x1080
eDP panel, add support for it in panel-simple.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Specified bus_format, bus_flags and connector_type

 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5b92583bccdf..50ee1b842748 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2010,6 +2010,37 @@ static const struct panel_desc innolux_zj070na_01p = {
 	},
 };
 
+static const struct drm_display_mode ivo_m133nwf4_r0_mode = {
+	.clock = 138778,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 24,
+	.hsync_end = 1920 + 24 + 48,
+	.htotal = 1920 + 24 + 48 + 88,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 12,
+	.vtotal = 1080 + 3 + 12 + 17,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc ivo_m133nwf4_r0 = {
+	.modes = &ivo_m133nwf4_r0_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 294,
+		.height = 165,
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
 static const struct display_timing koe_tx14d24vm1bpa_timing = {
 	.pixelclock = { 5580000, 5850000, 6200000 },
 	.hactive = { 320, 320, 320 },
@@ -3619,6 +3650,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
+	}, {
+		.compatible = "ivo,m133nwf4-r0",
+		.data = &ivo_m133nwf4_r0,
 	}, {
 		.compatible = "koe,tx14d24vm1bpa",
 		.data = &koe_tx14d24vm1bpa,
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
