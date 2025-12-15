Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD42CBD40C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D7E10E3C1;
	Mon, 15 Dec 2025 09:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Spfcgzx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00AF10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:47:46 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5945510fd7aso2790119e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765792065; x=1766396865; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rbKlkWxiAX2TjHlXxATTwuLMILne1kJWYscDW2ei324=;
 b=Spfcgzx7g0NCDvUL2hsfWVQ1/P7zDH3+PQza0nCfOl/Bn8coVMePA9MziEWK+YL3vP
 DkiaAQe63ZL1mhfXz6nsOId9xRTYjUyQbzioTcD3ErkG096Icm8UzaJTnDWcERVkxSfl
 /IIfudS01/+wbClLYLyd1SsXFS+zRxlvX/A0kGjzMKewD5cXWsGSWPethUXfSFBWUzZI
 Q5Mc2/4xM31kOEAdBKLE05m2SSGnGItm+spAIQz6SepGTcww5Idv+gJiXeMX2EpvdZ6V
 1FzffgI1NgbtCxLWx+p+2NRiXKjQMVKpaebWHYPsn03JN3iEsvJEq39zep5LxCcbPiuS
 tRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765792065; x=1766396865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rbKlkWxiAX2TjHlXxATTwuLMILne1kJWYscDW2ei324=;
 b=I8q/xDTR0twPUNgl0Cbu1jOug6YUowAxShXYqecvpjS2K6rkvVLUWOskIUU7Ej2aT3
 0bEZq5G8eAVrhvEKGW54hsnc0ygeos/NWLcCeJUe3MvUNjhWGdys+JoTG0L9H/BPQuUl
 wOwt11hULRbk5lUj4tgeCZjUUEWGh5si46seWHxfmffUQnn1/FayAkdweTQizLKs+9Pf
 OBK9EsqizuX4lGpTg9Wntj44PsnFUxjQPMwhwTnn33X+t4MPMx2bGS6k7IKD/nWxHiEy
 Tpb6SDOKB/AOU5QXOOkXVIj1Rc244ct3R0gDEdtYekgt5cEPdYSpk2x7RLNNE9eisLSR
 px+g==
X-Gm-Message-State: AOJu0Yyc9jMN/d6ztOwPxa9X8xcrjOvvegqz55sbGX3iCj+fWKG1GKLD
 BRShqVavIAvWalDeidxqlaIBtxda5+9H/UrH+o4UkFL0UEArHo6Xp6h2
X-Gm-Gg: AY/fxX70p/QU/AKY0ys5oflDA1FW4Rjt/OU8h2scmOW5c5ooNijIe5ne6cfBvpq+mqJ
 bFC8iPoO+yGzRTNjzejqIAXK9Tkc0vjZ+OXtkhkpzuJ0GrhWNv3Vktejfqe0NMa7vP/CKpvuVav
 zcrUvhFFpNT59pSFqedPNnsUpYSoVamoA4HO1qI4KNwU3JWJcP5vGZd/C6OFlw5P+7vJsFcwrWn
 CChyRhbyxI3di/mT9c534cm/qDSyoWJp3+KbeWpIwNmQCenAuRmZoFS5DVi4DGUlYztyIrbblTv
 kr3+R6OTByCpdHkJR7oNrFX/A4m3QMDu70NxxBlurkM/hBMNMvR9M5tYRLmGrUzU/qjAvOwu/L9
 CriJ8B8sdjOONA28WM9Znwk+q3AsKLS78iDQ/W5XqTDSwHi0c09q8QD2pjE6DyB45YJbHYW0IG7
 8zti39YJIMlbD64EpoWZ+DLhqzLbK31v/DtrxhLWiIKj65dpcdIM6MuEzV
X-Google-Smtp-Source: AGHT+IEC65xV9vgij1sh8uTFEV4NwkWc1wHzBBscrzb8bMXqszqukAOgifVaQaARxDBgkyHE6aaimA==
X-Received: by 2002:a05:6512:33d2:b0:594:314d:ac53 with SMTP id
 2adb3069b0e04-598faa59526mr3627657e87.23.1765792064867; 
 Mon, 15 Dec 2025 01:47:44 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f37ae8sm5397546e87.15.2025.12.15.01.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:47:44 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 15 Dec 2025 10:46:44 +0100
Subject: [PATCH v3 2/7] drm/sitronix/st7571-i2c: add 'struct device' to
 st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-st7571-split-v3-2-d5f3205c3138@gmail.com>
References: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
In-Reply-To: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4488;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=rGWG5VB+SYJwiLQ5k2bpIRqRjhxs+agQ84bFzEyGkzY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpP9khNYUMKk9cqbQMbSmEWadmv3PEbO1aiBSDM
 b85j50VirOJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaT/ZIQAKCRCIgE5vWV1S
 MgkSD/wIJT0+UBpXpPDB9rWJHqLkOYtLWLIYofdttBU6nHn0RtewsobL7IAcjGu/MQ/HlOeEXWB
 bsgKEzTqCYL4xFAPcQtg6LchK7ZmzU5aRAitD1KLHxMoFNQ9b2YUXS6KWAYLkXwpGSPXcMHQVn+
 ctQLDE6p3k/TLH/IjPhC9KSBYHjBzQ6nwOOt77NGKm/ubuqEbeih4cZ4u7DWnF2bWNU7XTsFne5
 wkLNhWiBYbXTH8XgCb6fyBHUWyd8Czn+WkRKP0a2gAw4OCuqXAl7gJ9H5/kIQTUODFCURpBG8Yq
 H5jAFhI2+jWYU64Ol/ElPAg+OUTw6kpVO+meR3wCwZmUkU6XC3eTC5a5L24KztuuPtp9u2rz50H
 XoDDsbCwCLJMd0/bYKHbU91DHtrr9qlmgyfiSavVRYZ+U0xUDgKxIhJpKte+0h1wIp3DD0XsfvV
 yjFWQcIL8WMBNDXs+/qRnkq4iguzGJxXrvOsjRMxr4dyUkhK7ahjHdkBNJZsj54yCTh3OjLxz7G
 gQFxqqr1JI+xaN6/N1aQYsiMjIBuAmMUeQAuiSFe5uTb1YmtN053TcHJODjfzdKsaGS92lK8/Ca
 gMZW+5rT+6tpUqmrRyF3E1CjlHDCeQxTq08WDSkEtKtt+udNx+aMGYcPQNOU4ZYQLyNIFsGOpB2
 KlXBwbnRj4oToCQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Keep a copy of the device structure instead of referring to i2c_client.
This is a preparation step to separate the generic part from all i2c
stuff.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 71814a3eb93b..2b52919d7dd4 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -113,6 +113,7 @@ struct st7571_panel_format {
 
 struct st7571_device {
 	struct drm_device drm;
+	struct device *dev;
 
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
@@ -741,7 +742,7 @@ static const struct regmap_config st7571_regmap_config = {
 
 static int st7571_validate_parameters(struct st7571_device *st7571)
 {
-	struct device *dev = st7571->dev.dev;
+	struct device *dev = st7571->dev;
 	const struct st7571_panel_constraints *constraints = &st7571->pdata->constraints;
 
 	if (st7571->width_mm  == 0) {
@@ -781,7 +782,7 @@ static int st7571_validate_parameters(struct st7571_device *st7571)
 
 static int st7567_parse_dt(struct st7571_device *st7567)
 {
-	struct device *dev = &st7567->client->dev;
+	struct device *dev = st7567->dev;
 	struct device_node *np = dev->of_node;
 	struct display_timing dt;
 	int ret;
@@ -808,7 +809,7 @@ static int st7567_parse_dt(struct st7571_device *st7567)
 
 static int st7571_parse_dt(struct st7571_device *st7571)
 {
-	struct device *dev = &st7571->client->dev;
+	struct device *dev = st7571->dev;
 	struct device_node *np = dev->of_node;
 	struct display_timing dt;
 	int ret;
@@ -943,9 +944,10 @@ static int st7571_probe(struct i2c_client *client)
 		return PTR_ERR(st7571);
 
 	drm = &st7571->drm;
+	st7571->dev = &client->dev;
 	st7571->client = client;
 	i2c_set_clientdata(client, st7571);
-	st7571->pdata = device_get_match_data(&client->dev);
+	st7571->pdata = device_get_match_data(st7571->dev);
 
 	ret = st7571->pdata->parse_dt(st7571);
 	if (ret)
@@ -966,20 +968,20 @@ static int st7571_probe(struct i2c_client *client)
 	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
 		st7571->ignore_nak = true;
 
-	st7571->regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
+	st7571->regmap = devm_regmap_init(st7571->dev, &st7571_regmap_bus,
 					  client, &st7571_regmap_config);
 	if (IS_ERR(st7571->regmap)) {
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->regmap),
+		return dev_err_probe(st7571->dev, PTR_ERR(st7571->regmap),
 				     "Failed to initialize regmap\n");
 	}
 
-	st7571->hwbuf = devm_kzalloc(&client->dev,
+	st7571->hwbuf = devm_kzalloc(st7571->dev,
 				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
 	if (!st7571->hwbuf)
 		return -ENOMEM;
 
-	st7571->row = devm_kzalloc(&client->dev,
+	st7571->row = devm_kzalloc(st7571->dev,
 				   (st7571->ncols * st7571->bpp),
 				   GFP_KERNEL);
 	if (!st7571->row)
@@ -987,34 +989,34 @@ static int st7571_probe(struct i2c_client *client)
 
 	ret = st7571_mode_config_init(st7571);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize mode config\n");
 
 	ret = st7571_plane_init(st7571, st7571->pformat);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize primary plane\n");
 
 	ret = st7571_crtc_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize CRTC\n");
 
 	ret = st7571_encoder_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize encoder\n");
 
 	ret = st7571_connector_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize connector\n");
 
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to register DRM device\n");
 
 	drm_client_setup(drm, NULL);

-- 
2.51.2

