Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBFF52DA40
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ACD10F213;
	Thu, 19 May 2022 16:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4F610F213
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:29:56 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 s11-20020a4ab54b000000b0035f0178dfcfso1082697ooo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sJZWCWBHIS8OyZEeA82nz/0fHFZSXZpGhVz4hbd1tCU=;
 b=Zy0e0jaIz3/kOZQl0yiKnsVUnNJLmZJUA3DOmJAwVwoOE/iDucxc244U+6MTtP/H1i
 sBlI1raTgMuODdiJZql81w//3SZl8N960K24YeJjjDhxcfd0O/DNiKwNPE6B6F1v1x3x
 UZG9rONkgr7M9hCuxVWUGeEpI3D9cYZI5GvWGPIxpVDkzvTwKQJRAi+M0fSCH2JiM49d
 w/7ykfu4HGBOQay4LbAkmgDsA2UNwCN5G3W7PN4hQr3SLiRDLjwXSmhqiBK7gRxeD4pC
 kKdzSSC4EsPRLdZzPuOqbItD+q2EI1ZkjDUmo1aIUJGPb7DVekKWaPSO2RA3esfpxZz0
 58bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJZWCWBHIS8OyZEeA82nz/0fHFZSXZpGhVz4hbd1tCU=;
 b=tV286tX7rxt8tHdZEvomoP+r3+iRzoLf5pDkQ8fNWl/Aw6b/Yb9ZklMtX+Io21Pt0V
 HQCwygOX7Ky89PSzq00Ax0WsJPThd5glGh/fVJ8CNGNPnHTjJF4dL1AMpCok5hb0mR++
 7j9pTCDiC0crjm4X3f6FIm8jZREV//D5Id32waEOd9k9LKN3s79DJ7sBdjp7tNVZD9+1
 2V917sgMEJWfahTOIpxs+9wKxT/jcJYEPc7DUNB5zgZLfzj7BKX7uPlCn/RfzgOmbBzP
 j4xiNcV01h/CIBFczwRVc5S0S7PqCBv9S0O5ZQHOF1JQLRpmdMOF91ARsiIZB1HdcWwT
 qOxA==
X-Gm-Message-State: AOAM530jSgkfIi+GZAAdbEaAJuceyOS9p81MddMrrFRsl+jDPhLsoEYL
 UWgfALXAIcvt2hHan1BYaVxC9+4noEPXgA==
X-Google-Smtp-Source: ABdhPJxJjU2pH6l+o2xDYzsp8fe9RBPxDDkaTo4MTaGjXFoHYtrRz/E7SW8maQfxG+inGcRuRX/oJg==
X-Received: by 2002:a4a:a6c8:0:b0:35f:7a3a:77c6 with SMTP id
 i8-20020a4aa6c8000000b0035f7a3a77c6mr2357115oom.11.1652977795608; 
 Thu, 19 May 2022 09:29:55 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:29:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND 5/6 v2] drm/panel: simple: add Geekworm MZP280 Panel
Date: Thu, 19 May 2022 11:29:34 -0500
Message-Id: <20220519162935.1585-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 Maxime Ripard <maxime@cerno.tech>, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Geekworm MZP280 Panel

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e46db5e3..cbc1a4fd1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1824,6 +1824,32 @@ static const struct panel_desc friendlyarm_hd702e = {
 	},
 };
 
+static const struct drm_display_mode geekworm_mzp280_mode = {
+	.clock = 32000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 41,
+	.hsync_end = 480 + 41 + 20,
+	.htotal = 480 + 41 + 20 + 60,
+	.vdisplay = 640,
+	.vsync_start = 640 + 5,
+	.vsync_end = 640 + 5 + 10,
+	.vtotal = 640 + 5 + 10 + 10,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc geekworm_mzp280 = {
+	.modes = &geekworm_mzp280_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 47,
+		.height = 61,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB565_1X24_CPADHI,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -3790,6 +3816,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "friendlyarm,hd702e",
 		.data = &friendlyarm_hd702e,
+	}, {
+		.compatible = "geekworm,mzp280",
+		.data = &geekworm_mzp280,
 	}, {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
-- 
2.25.1

