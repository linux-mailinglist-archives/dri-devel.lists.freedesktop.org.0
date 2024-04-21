Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B408ABEF5
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 12:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2CF10EF8F;
	Sun, 21 Apr 2024 10:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fIYKPK2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BF810EF8F
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 10:49:57 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1e36b7e7dd2so29614675ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 03:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713696596; x=1714301396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5YMdAkat8vhxj4dx4OSt4iQjjgWZ4TG1gL8TgMmCIgQ=;
 b=fIYKPK2XrZEtuLZU3ljQeAQhWL4m3caWf48KxQ65Spf7rOo4Bb+SWuSTbxc8gDXVXK
 1DqOF52FigEHNk5w5j/3ni6rnUvV9JQTDC9tfTsljalnFCHnVup3k6tVUL4huFGY7+6J
 JCHY4/GTVG8wBpnddKWID5m5IWna3U7rtuIQoec/rs5JdVQ0/cFP5Aejp3C/y6HrcWj0
 ePsrSZDtwCRtE0/D7BwfJN3HTV2NywEGWeY+hDGNpqEUsYJMHk7JTHDAug+GWMhk18r7
 9UYSOsYJoLgwQVrPm1hcOeGXY3TKdqyFjYa1aJnO2CuJcxDFYx8tFVqeDEpxRac2pBhJ
 9Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713696596; x=1714301396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5YMdAkat8vhxj4dx4OSt4iQjjgWZ4TG1gL8TgMmCIgQ=;
 b=TwA7/Yn+CKrkGzhQsOBVm39wNzxkzn6hFLi9ezN0QDtNVNimKvdRuq4DmKGfceqEKC
 pTR7xM8Vf2383rjOVmgE3IKvGM1d9Uhwx5KBk2lOGsYUY7OlTa2TksBq8Pmpc/k9Zioj
 rfn2F6kGoYBMVRpNOnlNoISBDzMEDuP2PS4+7DBLz2kZ9cjehsVKibxr/2+JVv4vZ6aP
 rQgApMleb59S7NrGPzsD4/+V8BCUQrc32q7Lj6WEBL1oHuMiLgjJMksMM/VQjbumB2RZ
 GoOUTZfvtsu+I5UktLvkARnY2A8Hm+4nhmgemKn4ehtOic1miHKe+2osUeht47pelel1
 0MMw==
X-Gm-Message-State: AOJu0YzgnFuArOjx0P8KA5pUtrY0lrcqniPx+JlShfvnk+uJzNNZY917
 hqybHmo7RUHkbdRvEX4RvaZ47idQGPWScH/AtCgVJ8N0tWk+GdPw
X-Google-Smtp-Source: AGHT+IEQvoqu3PAcMjoIH/OZqy7yDGFXPIPisC1PaUDN4HjBqxOcFxicJw16ppg1tMDfL8/OtDH0uw==
X-Received: by 2002:a17:902:e5d2:b0:1e4:6938:6fbd with SMTP id
 u18-20020a170902e5d200b001e469386fbdmr7137713plf.7.1713696596443; 
 Sun, 21 Apr 2024 03:49:56 -0700 (PDT)
Received: from shresth-aspirea71576g.abesec.ac.in ([139.5.197.158])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a170902969800b001e49bedbfa0sm6133088plp.285.2024.04.21.03.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 03:49:56 -0700 (PDT)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 javier.carrasco.cruz@gmail.com, Shresth Prasad <shresthprasad7@gmail.com>
Subject: [PATCH v2][next] backlight: sky81452-backlight: Remove unnecessary
 call to of_node_get
Date: Sun, 21 Apr 2024 16:19:17 +0530
Message-ID: <20240421104916.312588-2-shresthprasad7@gmail.com>
X-Mailer: git-send-email 2.44.0
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

`dev->of_node` already has a reference to the device_node and calling
of_node_get on it is unnecessary. All conresponding calls to
of_node_put are also removed.

Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
---
Changes in v2:
    - Change commit header and body to better reflect changes
    - Remove call to of_node_get entirely

 drivers/video/backlight/sky81452-backlight.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index eb18c6eb0ff0..e7cae32c8d96 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -182,7 +182,7 @@ static const struct attribute_group sky81452_bl_attr_group = {
 static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 							struct device *dev)
 {
-	struct device_node *np = of_node_get(dev->of_node);
+	struct device_node *np = dev->of_node;
 	struct sky81452_bl_platform_data *pdata;
 	int num_entry;
 	unsigned int sources[6];
@@ -195,7 +195,6 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata) {
-		of_node_put(np);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -217,7 +216,6 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 					num_entry);
 		if (ret < 0) {
 			dev_err(dev, "led-sources node is invalid.\n");
-			of_node_put(np);
 			return ERR_PTR(-EINVAL);
 		}
 
@@ -237,7 +235,6 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 	if (ret < 0)
 		pdata->boost_current_limit = 2750;
 
-	of_node_put(np);
 	return pdata;
 }
 #else
-- 
2.44.0

