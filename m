Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC432C9AAB5
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBC410E5BB;
	Tue,  2 Dec 2025 08:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dqKAE98c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C46A10E5CA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:26:14 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-595910c9178so4010192e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764663973; x=1765268773; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qjFvsbFPyFbyPgm+bw1kDJa74CcXAQQRLv+LVg1qWAo=;
 b=dqKAE98c0RzgnVKxuBzALsOC2GcaMIrl5EJXz+VCglbqxz9udgJNcZPJ2c6YgH2aCw
 g7O8Ot5kzGTPOb4EU+eRzkMWG4I+abscT1mJngvCBbC0Zo7tYuUWT3jJbmvlFHE67fcm
 WOb2EbedPMqnMrx4grb7PAURrit8KmZZ7qw6AG4KXg/6lsdtA7JJTbYt2RNeakgzbqPa
 4NYn39OTjfkckKM4Xepz3Rs3GBVoqdZHqMG3pRbCMuHH7OK5/PT3lZCjG+V4kmUYNi2h
 zYthJrCcjJeWSTrmRLeYAkRs9M5HFlDpYSsI9A5V6KJDawLI5XfI+noc6D2E6WNPge1p
 UUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764663973; x=1765268773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qjFvsbFPyFbyPgm+bw1kDJa74CcXAQQRLv+LVg1qWAo=;
 b=qDURphEyTnqT5o57RhoHyajCLrewYSKeg2pr0tPVPZK2MZUHGutlZtu5D5AHbzkgDw
 8ShlnQwIBeuyyFToZ0lSCx/+uNOtIJDWqOuGMRbqWToeqLGv5ddu5idtatIcivr7MP/Q
 3hMDP6TyoD2YYM5vagfjsaRVdeZLSKanoL4+vXQnfHfjqbUSWmLL+ukrMesxUBx4ATwy
 D2a6pm4j5GLe41yxZgxhFFDy07NCOpeeunuo4ajtQQrWFRaxwQBN7dznNf2T9t9XcvfL
 ZvDZONLNMxFyOtoD3enSJN5ve2FuZIpptNWDDx5+4+hpIRAQ6nX/0sKk8Xteu9X4l1jr
 E4xw==
X-Gm-Message-State: AOJu0YwQEMP83b9ysGtdW3MaagomDKzqyJ88UTFatBGAudI/y9dzzfA0
 U527PrjGYitgHHIcmkrLGR0VABk96jOAQ0M5qXWH3f8meZDnmybSiNSb
X-Gm-Gg: ASbGncvhm0M0tSfytxcFJteQ+BEWvv/mewpcyt+G1nCxQc2w9cNkRJhZQT3NZioEpD5
 fxzw2oYPdxbGridVbTZDhxRSMKaL5Z2ak4p5P2BZaN7/ABhJSFBZIu6HR9X/TGMKFe9bLz1L/Cq
 IZixwLnXcE1GCDfURTTx9h2RPnUIbdOcw8bclhzfFtjCqlv8q6425A5vHP7psTctTkeqQGjNyfx
 zyJmxrFxBRKQdo6UahaGXRbDaC5jeXUCRyFwpOlDgNjA8uVLNwl6MRZzH1M2w5fMiF3O/Vxa2tz
 xUJuANyBcpdcIdUpoACpXJMk9kJSO67UJ76OMa3mMieK6zPUh5Vxya3wanv5Lsvm4QE9bS0hEtA
 Sruds8zcPsTp/NVexTff3oBRinghjV/2vRFCWbgQttghsQbYeAeFTZQRjXVmenHLYSd2PNxzeJk
 IcTxhW9idiXl+uBEJBKm4YRRbIl/LgoUo7f4BM21GixThMwg6S1unbrdPw
X-Google-Smtp-Source: AGHT+IFwxaM2IiPGn4MOHVsKaCaP/v/ou7oxjEHZpSh7J8Mix5S3dLuX5eAiiZy2HYqvwv4c0DCszQ==
X-Received: by 2002:a05:6512:15a4:b0:579:f0fc:429f with SMTP id
 2adb3069b0e04-596a3ee6beemr13544582e87.49.1764663972427; 
 Tue, 02 Dec 2025 00:26:12 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bf8b06bcsm4423727e87.25.2025.12.02.00.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 00:26:11 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:25:18 +0100
Subject: [PATCH RESEND v2 2/6] drm/sitronix/st7571-i2c: add 'struct device'
 to st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-st7571-split-v2-2-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
In-Reply-To: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4428;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=NSG4vmX1Rk5OzSdVkKZf/U2bncKPRRHJC4jH6QsSl/w=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLqKHM0GcyuWnfaUL20/f0iBAUwPNqsxTQkTO3
 yJLmFFEBcSJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6ihwAKCRCIgE5vWV1S
 MuvAD/4it2vUbP0CXMbrkSEf7I6BdDAETLZ1kGPSy9Fi7jGRuAo5X12yIsm/rCGJaFIXzYnyPK1
 Lfu9YXdhcw1u9a9CHRsfhZxWeWn2HR13vz3yN6ojodjhuwS+UZ4N1TTfI9WX2UDVDS34bPyczor
 77epKE+XxnDXun/dVwiP8QhpBwAIWLZ6H84Fl2nh94h0mgt4z67Szy4eN5hBcAfin5dCtXqJ+zj
 n6J8eCxS3Wgg2wKw5fAIdhTXE3Uh1KvBDE2HmSUmZbajsUOJFGpY4jtjS6nXwxTvw2uAeOHzB4n
 D2qJTlZgGLy5hSt3RHbBs5fjtoDEud5HO0NCt6deqYzmqEQGpJtifHxAjDxmtr21SkScCrykLzL
 /Os8KUcbbnhO+Lmn/lZ8hMK0RpM51AW27FJBD4HYoFOYar85uLePD7S1PRNuOvRKtsOrxDPzZCx
 /idHo3zKO36v8mqFc5zSsNuaf9xzz4vJg/8itCMRknMEwFkHgJZetnKuNSsi9CO7ZUaSyzk9xyI
 zLpk4JSbHulLQgfVlvp0h/dEcdGP3TgXIjvfhj1wuHo+YeAbA78Yd2zGmU7zEpt1fvfOCiWB6qH
 oUguUAHChrFZS9KgdRgWWFYwl1gOQuSPigSbdpFMEdP2CWvkRwKqCDCGgLJjKhTkFFNzyU3GymU
 +HgQl4UoTI58kTQ==
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

