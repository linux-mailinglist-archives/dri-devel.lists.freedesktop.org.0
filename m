Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CC12C2D5
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F0189FAC;
	Sun, 29 Dec 2019 14:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C7B89ABA
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 06:07:36 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id n9so8940649pff.13
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 22:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bh9mEGHD8yEkETedFVdZfcZkqXbQcfH7QQFnd8PatL8=;
 b=wCYfy+DiqvTPeE4PuVoNL2FU1hG+FM4oPNtihtwX6YnVlimuXh+vhNDxWafNVR9xch
 eV5t0hy8laPj/2d5R+fh89/y9moyIaXH1t1gOsCiWP0RZS/akCygAFGjdwA3HymzELJW
 YEpOzjae8vfDX/23c3uj/yiMd+8vN3gbY9+90n1EhHVOZ+u6yEG6o+aM13rqXWofVenT
 fmjFMbLEHpmM/n0NsTefVDwWWg3c/9qQdjR9ZuqCA84Hwp0v9Z/UyjB8JZ9BZmba9lw3
 YSOeYrz/THMDq254XzNE1uzTgBBsHb0Q5fQbp/1nZ13a4Tjc85PTz7/93UmnCP61kLep
 FcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bh9mEGHD8yEkETedFVdZfcZkqXbQcfH7QQFnd8PatL8=;
 b=HzoU5KhzdE5kh6lx6dQUlLaowUo2T4SShuQuwmlHnuNbkAoZzkBXYdJLPLP5zlmLF2
 SZEpS6NFUwzAxYcaHzM5Qd/8bUZZlbkHQlD3JdO2S6CABGywp5nm8WPd+FU28sFa8ZD/
 p0WypY2dT7NFtOLac7vLizUPQyG/HJmUm2t3BzW6kH6BIkzLGTyhyaioFiXd6QaDIG/d
 EGIhUUG2OEWRsOdtvsEeP03MNTeg5um8rnmNPuEHD4GB4hgASIS1xqVTKQX311NkSKCq
 BIyg2wHF/aJPore3qhumBUy8ffFz6qnEQv6CWBXC4f2Qp3Es+FuCPAUSRVtg4p9J5Qu5
 TQIA==
X-Gm-Message-State: APjAAAUR4Z7BLEeMiGUAl1CaCR6S7lTTMGF2IMkOzUsiVihyIdl1NAen
 +oClZUnaAb9Pg9nNvLOE9NXLJQ==
X-Google-Smtp-Source: APXvYqw7T3nji34vO/btgtEenzlUjOnI1rtxZ6ocaf//g8wgqa3384y+RhDo98oPa4usrISA1a3G8Q==
X-Received: by 2002:a63:774a:: with SMTP id s71mr64704696pgc.57.1577599655541; 
 Sat, 28 Dec 2019 22:07:35 -0800 (PST)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id b193sm37899600pfb.57.2019.12.28.22.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 22:07:34 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] panel: simple: Add Ivo M133NWF4 R0
Date: Sat, 28 Dec 2019 22:06:58 -0800
Message-Id: <20191229060658.746189-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The InfoVision Optoelectronics M133NWF4 R0 panel is a 13.3" 1920x1080
eDP panel, add support for it in panel-simple.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ba3f85f36c2f..d7ae0ede2b6e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1806,6 +1806,34 @@ static const struct panel_desc innolux_zj070na_01p = {
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
+};
+
 static const struct display_timing koe_tx14d24vm1bpa_timing = {
 	.pixelclock = { 5580000, 5850000, 6200000 },
 	.hactive = { 320, 320, 320 },
@@ -3266,6 +3294,9 @@ static const struct of_device_id platform_of_match[] = {
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
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
