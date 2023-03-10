Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD746B5AAE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 11:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F8710E0A8;
	Sat, 11 Mar 2023 10:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BCE10E2A9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 17:07:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so5030214wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 09:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thegoodpenguin-co-uk.20210112.gappssmtp.com; s=20210112; t=1678468019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PIAvOROP0L7TQ2SFroIyECoNXmnbgQ0/2/pG6xOMZOg=;
 b=GflYWfRY6FBEFFLdKkvHhY7dccDZhQAwpbAehx/JKaEXpmV2UarHWxFFGlsbEB/Xci
 vXj13zgviHuW0jsB2sssbQsZrolK81mmjZYMOqDneZah5mgVpYpcoDoH5suTSn0Gg2PZ
 jJELaGLNBRtKnn1YLQbxJdhLkNVN3jLJ/RO4QsHao8PLJcduzjA//KiunkG0yHaxF2SY
 wEuVM4LD6m6S9ycmoomb2Zr4Vb45SJCbxbhlVDSbRxsFWOLA+qQOFB9WoepsgXYroGVA
 6Ha4PIAzheTWT+xsl43VheBya7i5+CTc4IzTLLSTxmbvzZ3qye+4zTM0ZjvW9Uxn858x
 Gt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678468019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PIAvOROP0L7TQ2SFroIyECoNXmnbgQ0/2/pG6xOMZOg=;
 b=EIvDW71rb9hhjH9O2wiCphyyqiRYZnw9h7Ea5w7aIKxo3yrzCsMEpJT5qd5nJIjBUT
 f8CPAM5xGTQaJpt36Szixdkgscxw17MK62OAdAyRCpbJiOR2ZWZiZRKh44ekSblJtQ9m
 oqdCcyjkj64SaXOHkELMHRSLiKllm5GoE9HTjy1UgKOPmh08/vul+XjgxVtDIKRj+b3L
 81qZ7oa9gIUD3+SKqMOXQItPZF/8aUFYuygR2radfFOUkKc1ewetlwxjjRrjUbOxCCTh
 KqlpQAomofQFMHvUVE8BLHSPo6RCa7/1EHo5oJsdVUOTIhqy05mhkt8hE0cyoFJBxZ/3
 hNvQ==
X-Gm-Message-State: AO0yUKX6Vs/EaovBQdj2KAb+1GNRLPgpcWT3e06Lyr+F30dGe4c9+sg2
 SI78udNFGXdc0rseEMAewT8RCIlrqfZGSLvwJAw=
X-Google-Smtp-Source: AK7set+EppxYzOsRe0saodkObRN4s0qv1mlDCNJcmD7u6PjvyqBZwoxl7tQ30ad0CavEwKdPgysfKA==
X-Received: by 2002:a05:600c:5254:b0:3dc:4313:fd1e with SMTP id
 fc20-20020a05600c525400b003dc4313fd1emr3255061wmb.34.1678468019481; 
 Fri, 10 Mar 2023 09:06:59 -0800 (PST)
Received: from pawel-TGP.home ([91.110.164.91])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c450700b003daffc2ecdesm512870wmo.13.2023.03.10.09.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 09:06:59 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: add support for innolux at070tn83
Date: Fri, 10 Mar 2023 17:05:35 +0000
Message-Id: <20230310170535.2971809-1-pzalewski@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 11 Mar 2023 10:52:10 +0000
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
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 amurray@thegoodpenguin.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add config for innolux at070tn83 [1] which is a 152x91 display.
Tested on a stm32mp1 based platform.

[1] https://elinux.org/images/0/07/AT070TN83.pdf

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..ad84e9b21299 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2120,6 +2120,31 @@ static const struct panel_desc innolux_at043tn24 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
+static const struct drm_display_mode innolux_at070tn83_mode = {
+	.clock = 40000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 1,
+	.htotal = 800 + 210 + 1 + 45,
+	.vdisplay = 480,
+	.vsync_start = 480 + 132,
+	.vsync_end = 480 + 132 + 1,
+	.vtotal = 480 + 132 + 1 + 22,
+};
+
+static const struct panel_desc innolux_at070tn83 = {
+	.modes = &innolux_at070tn83_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode innolux_at070tn92_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -4095,6 +4120,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,at043tn24",
 		.data = &innolux_at043tn24,
+	}, {
+		.compatible = "innolux,at070tn83",
+		.data = &innolux_at070tn83,
 	}, {
 		.compatible = "innolux,at070tn92",
 		.data = &innolux_at070tn92,
-- 
2.34.1

