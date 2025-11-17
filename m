Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA9C63092
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F16710E329;
	Mon, 17 Nov 2025 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gczIA78e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3371C10E311
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:04:28 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59590eef553so845726e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 01:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763370266; x=1763975066; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JNPr1GR6LTMqIj8RiE65mwHD5mctt4yEgU/pajOvYyE=;
 b=gczIA78evmeK2yWE92+5YOHC0jNq+QQ1z2xDDJ6Lsao/2bkrffBfZQM5Nn3GxEileP
 oMESrQ746WRKldNjP8xmGNL+dVQv3n58ao1BAdeC2GBqP6pDxPqwrBUrvUnp+Kd8eTcI
 PqZUnP5PD4aqC/wVDMqf3yIRWAP4MxttefbxTh0GpIlZO3JTPBjz0p+QpspPRA2on+T3
 F3k1zgmX+7q6aCtt4P+nlW78jfbN3Jaw33/NVHUcO8ei2iEIH9Ux9DZ4p5npOzbd3P3b
 e00+fDKrIm+aEaEYzkHlp1P6R+0EGNhT2T5QPd8QafZjAPyRr0AS3QXq9xOqlVtLhGF3
 33Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763370266; x=1763975066;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JNPr1GR6LTMqIj8RiE65mwHD5mctt4yEgU/pajOvYyE=;
 b=WEyaeqQav4dICF66TRdiGEiblhQLjj0hET/RnFi8mS32+sw5f2VrF2b778lhykAdzE
 MsXVIZrHra0hyhVaBSGx8xXx4rGqto8bQbir4rFDb/fCZQRhGtrnvd5GzivpgNJFPTUv
 E5+NSfpYJ5gHbU9rulIAIfC5l7rnQnH4ta9Y4ZqMVJX+TAQmFI92r5jl5lOzbL+t3ckJ
 ee69msd19/kAWSb9gPXH9/MuO3/qvCsSZb6P2WoSYTyKsHlF4qUxnhMFJLK86zQhuOMT
 TBFJzLQ9qzWbxntj5rr9jh0sHDxlOD6ep6Dse517TTyc09NaHnzYoWSoOCwCj1JbI8x2
 xryw==
X-Gm-Message-State: AOJu0YxhZ7rs609zw0P34rnbZoOdNpgVwH+M110D0qaGTARvweOBD+xb
 3e/q16HJGh9Bb1NCxu0cnrEOKwZW8hzPBB8sDXBMKFjvR2dUstiqKn6Y
X-Gm-Gg: ASbGncuLRDs2Dl6q4FUcnipaeTc4wX9lK8NdSjdnXFnhg9CtxSr6y0X2A1nKry5GTKa
 OzwyTjb7XilqNnk52O3euJe0qrMHqZjc7kPTBfCeNjDAZq31dFRG+FYudcX76Ij0zpjYtMBjBBN
 GAdfBp4TOadWoOT6YtbQxxpRJtI87+FisC7wQnaAV/04u8/vl4PpVvzgvE+5H02LLTcHsQePRt1
 qDiKp/nMjED1k7xzgBGDesIZB1R8ZO8NKdrcAE1nbMhqganfITlXzG5shDcTvbOxDauB8pFDSpa
 7tpKn/GSDWP1482SOLUZZ2cuGEdEoSsoqR6pEL5DaK84nzSqVyK56kxWBKckJUZ4LUteecXGUBi
 TCZkBjOkTTFPmrw6jMGnrAO72DCXxkT8ugjkmDDWv1u/sDIBk4M0GpqQqJYt7I4lumV63dtkyUy
 RvndfeP7xfCJFvzJj6vwqgD8nhk8BNDzrUGyCLND3T7Fybhw==
X-Google-Smtp-Source: AGHT+IHzwAtthbnpv5tO6EPBxWoyH+xMFmyJmr8ZuBdUmturHDh+oj8nU3zYcMeP8VF4gexHR739+w==
X-Received: by 2002:a05:6512:2351:b0:594:2e9b:f28f with SMTP id
 2adb3069b0e04-595841df071mr3938841e87.7.1763370264609; 
 Mon, 17 Nov 2025 01:04:24 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b77e5sm2982498e87.42.2025.11.17.01.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 01:04:23 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:03:46 +0100
Subject: [PATCH RESEND v2 4/6] drm/sitronix/st7571-i2c: make probe
 independent of hw interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-st7571-split-v2-4-13189da95265@gmail.com>
References: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
In-Reply-To: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10468;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=2gB/R9568q3Lz+zMQSvxmvd9sl7V4TvMscZtlHQKZ5A=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuUEOmjG++s2eB7XLN8lpqMsoRmSXZu4Yayhs
 cxKRXSP+lKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlBAAKCRCIgE5vWV1S
 MqosD/4/LuCVIAHObu+lWciHp/BH3SaW0cs8mZbeSglPdz5EG0GNdH83Gizu+A1MzTgPsMJ6lf0
 qxybWgoncVae4Gl/ETEEtj70eXsegxTFEKq1goWxpL47qQBkONGsz42k4mcD7dYg6Kzg8x0u9/5
 Hn5rFIqYB/CoqL+9Ws9aBw00yeOY6U9sOaxuvIJMsiXrpaMID+NQRts2BTqqZNbEZ+NbyxA0Fkr
 uL4M4kXw/UwE804ueGqvF5fT9QRgCzxi4ksUPbnaG0xSqQ2Tztlsjqf8CvMhjK7v/wlrlOPC22R
 RkCll12X3HBxWzLB9uCLFqvS6hUXan4uMoGJvWd/pPY3biFHd3XMy4MNsntOzOPYNdc3KyMSLLn
 Fyfj1bgjXzUA61/mvYXU8+xQdBqQzZgubacqejidAfb/r6oO5m9ZlgIgZrNaKQHlqRqduRSP578
 EWuEaCd1YrCQ5fNhxsHN3GngS1X3u7bl5mXhmUHwmptTuIz6+OsZaVZuFh0pJZpD6DFvjmM7IZf
 CV/2C0WdZmbOnDARPXd2owozk0UajRq3qYW0B0kdhJqCl59KhEY1Ml8Es+NH9n0OA0kg+UhNJaZ
 yC5wGSOUFGer3XCf5y6/UV1s+E3Z1Pt9DTaydcYkC6MV8MqCD6LQ+HYvDbbMsnzQN0d9lc/NioJ
 VPSPph3QxeQVesQ==
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

Create a interface independent layer for the probe function. This to
make it possible to add support for other interfaces.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 165 +++++++++++++++++++++++-----------
 drivers/gpu/drm/sitronix/st7571.h     |  25 +-----
 2 files changed, 113 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index af27658a5e15..f994ace40739 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -80,6 +80,33 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
+struct st7571_i2c_transport {
+	struct i2c_client *client;
+
+	/*
+	 * Depending on the hardware design, the acknowledge signal may be hard to
+	 * recognize as a valid logic "0" level.
+	 * Therefor, ignore NAK if possible to stay compatible with most hardware designs
+	 * and off-the-shelf panels out there.
+	 *
+	 * From section 6.4 MICROPOCESSOR INTERFACE section in the datasheet:
+	 *
+	 * "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
+	 * I2C interface compatible.
+	 * Separating acknowledge-output from serial data
+	 * input is advantageous for chip-on-glass (COG) applications. In COG
+	 * applications, the ITO resistance and the pull-up resistor will form a
+	 * voltage  divider, which affects acknowledge-signal level. Larger ITO
+	 * resistance will raise the acknowledged-signal level and system cannot
+	 * recognize this level as a valid logic “0” level. By separating SDA_IN from
+	 * SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
+	 * For applications which check acknowledge-bit, it is necessary to minimize
+	 * the ITO resistance of the SDA_OUT trace to guarantee a valid low level."
+	 *
+	 */
+	bool ignore_nak;
+};
+
 static inline struct st7571_device *drm_to_st7571(struct drm_device *drm)
 {
 	return container_of(drm, struct st7571_device, drm);
@@ -87,18 +114,17 @@ static inline struct st7571_device *drm_to_st7571(struct drm_device *drm)
 
 static int st7571_regmap_write(void *context, const void *data, size_t count)
 {
-	struct i2c_client *client = context;
-	struct st7571_device *st7571 = i2c_get_clientdata(client);
+	struct st7571_i2c_transport *t = context;
 	int ret;
 
 	struct i2c_msg msg = {
-		.addr = st7571->client->addr,
-		.flags = st7571->ignore_nak ? I2C_M_IGNORE_NAK : 0,
+		.addr = t->client->addr,
+		.flags = t->ignore_nak ? I2C_M_IGNORE_NAK : 0,
 		.len = count,
 		.buf = (u8 *)data
 	};
 
-	ret = i2c_transfer(st7571->client->adapter, &msg, 1);
+	ret = i2c_transfer(t->client->adapter, &msg, 1);
 
 	/*
 	 * Unfortunately, there is no way to check if the transfer failed because of
@@ -106,7 +132,7 @@ static int st7571_regmap_write(void *context, const void *data, size_t count)
 	 *
 	 * However, if the transfer fails and ignore_nak is set, we know it is an error.
 	 */
-	if (ret < 0 && st7571->ignore_nak)
+	if (ret < 0 && t->ignore_nak)
 		return ret;
 
 	return 0;
@@ -845,102 +871,135 @@ static int st7571_lcd_init(struct st7571_device *st7571)
 	return st7571_send_command_list(st7571, commands, ARRAY_SIZE(commands));
 }
 
-static int st7571_probe(struct i2c_client *client)
+static struct st7571_device *st7571_probe(struct device *dev,
+					  struct regmap *regmap)
 {
 	struct st7571_device *st7571;
 	struct drm_device *drm;
 	int ret;
 
-	st7571 = devm_drm_dev_alloc(&client->dev, &st7571_driver,
+	st7571 = devm_drm_dev_alloc(dev, &st7571_driver,
 				    struct st7571_device, drm);
 	if (IS_ERR(st7571))
-		return PTR_ERR(st7571);
+		return st7571;
 
 	drm = &st7571->drm;
-	st7571->dev = &client->dev;
-	st7571->client = client;
-	i2c_set_clientdata(client, st7571);
+	st7571->dev = dev;
 	st7571->pdata = device_get_match_data(st7571->dev);
 
 	ret = st7571->pdata->parse_dt(st7571);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	ret = st7571_validate_parameters(st7571);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	st7571->mode = st7571_mode(st7571);
+	st7571->regmap = regmap;
 
-	/*
-	 * The hardware design could make it hard to detect a NAK on the I2C bus.
-	 * If the adapter does not support protocol mangling do
-	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
-	 * cruft in the logs.
-	 */
-	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
-		st7571->ignore_nak = true;
-
-	st7571->regmap = devm_regmap_init(st7571->dev, &st7571_regmap_bus,
-					  client, &st7571_regmap_config);
-	if (IS_ERR(st7571->regmap)) {
-		return dev_err_probe(st7571->dev, PTR_ERR(st7571->regmap),
-				     "Failed to initialize regmap\n");
-	}
 
 	st7571->hwbuf = devm_kzalloc(st7571->dev,
 				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
 	if (!st7571->hwbuf)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	st7571->row = devm_kzalloc(st7571->dev,
 				   (st7571->ncols * st7571->bpp),
 				   GFP_KERNEL);
 	if (!st7571->row)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	ret = st7571_mode_config_init(st7571);
-	if (ret)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize mode config\n");
+	if (ret) {
+		dev_err(st7571->dev, "Failed to initialize mode config\n");
+		return ERR_PTR(ret);
+	}
 
 	ret = st7571_plane_init(st7571, st7571->pformat);
-	if (ret)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize primary plane\n");
+	if (ret) {
+		dev_err(st7571->dev, "Failed to initialize primary plane\n");
+		return ERR_PTR(ret);
+	}
 
 	ret = st7571_crtc_init(st7571);
-	if (ret < 0)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize CRTC\n");
+	if (ret < 0) {
+		dev_err(st7571->dev, "Failed to initialize CRTC\n");
+		return ERR_PTR(ret);
+	}
 
 	ret = st7571_encoder_init(st7571);
-	if (ret < 0)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize encoder\n");
+	if (ret < 0) {
+		dev_err(st7571->dev, "Failed to initialize encoder\n");
+		return ERR_PTR(ret);
+	}
 
 	ret = st7571_connector_init(st7571);
-	if (ret < 0)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize connector\n");
+	if (ret < 0) {
+		dev_err(st7571->dev, "Failed to initialize connector\n");
+		return ERR_PTR(ret);
+	}
 
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);
-	if (ret)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to register DRM device\n");
+	if (ret) {
+		dev_err(st7571->dev, "Failed to register DRM device\n");
+		return ERR_PTR(ret);
+	}
 
 	drm_client_setup(drm, NULL);
+	return st7571;
+}
+
+static void st7571_remove(struct st7571_device *st7571)
+{
+	drm_dev_unplug(&st7571->drm);
+}
+
+static int st7571_i2c_probe(struct i2c_client *client)
+{
+	struct st7571_device *st7571;
+	struct st7571_i2c_transport *t;
+	struct regmap *regmap;
+
+	t = devm_kzalloc(&client->dev, sizeof(*t), GFP_KERNEL);
+	if (!t)
+		return -ENOMEM;
+
+	t->client = client;
+
+	/*
+	 * The hardware design could make it hard to detect a NAK on the I2C bus.
+	 * If the adapter does not support protocol mangling do
+	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
+	 * cruft in the logs.
+	 */
+	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
+		t->ignore_nak = true;
+
+	regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
+				  t, &st7571_regmap_config);
+	if (IS_ERR(regmap)) {
+		return dev_err_probe(&client->dev, PTR_ERR(regmap),
+				     "Failed to initialize regmap\n");
+	}
+
+	st7571 = st7571_probe(&client->dev, regmap);
+	if (IS_ERR(st7571))
+		return dev_err_probe(&client->dev, PTR_ERR(st7571),
+				     "Failed to initialize regmap\n");
+
+	i2c_set_clientdata(client, st7571);
 	return 0;
 }
 
-static void st7571_remove(struct i2c_client *client)
+static void st7571_i2c_remove(struct i2c_client *client)
 {
 	struct st7571_device *st7571 = i2c_get_clientdata(client);
 
-	drm_dev_unplug(&st7571->drm);
+	st7571_remove(st7571);
 }
 
 static const struct st7571_panel_data st7567_config = {
@@ -986,8 +1045,8 @@ static struct i2c_driver st7571_i2c_driver = {
 		.name = "st7571",
 		.of_match_table = st7571_of_match,
 	},
-	.probe = st7571_probe,
-	.remove = st7571_remove,
+	.probe = st7571_i2c_probe,
+	.remove = st7571_i2c_remove,
 	.id_table = st7571_id,
 };
 
diff --git a/drivers/gpu/drm/sitronix/st7571.h b/drivers/gpu/drm/sitronix/st7571.h
index c6fd6f1d3aa3..f62c57ddb99e 100644
--- a/drivers/gpu/drm/sitronix/st7571.h
+++ b/drivers/gpu/drm/sitronix/st7571.h
@@ -13,6 +13,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_format_helper.h>
 
 #include <linux/regmap.h>
 
@@ -62,33 +63,9 @@ struct st7571_device {
 
 	const struct st7571_panel_format *pformat;
 	const struct st7571_panel_data *pdata;
-	struct i2c_client *client;
 	struct gpio_desc *reset;
 	struct regmap *regmap;
 
-	/*
-	 * Depending on the hardware design, the acknowledge signal may be hard to
-	 * recognize as a valid logic "0" level.
-	 * Therefor, ignore NAK if possible to stay compatible with most hardware designs
-	 * and off-the-shelf panels out there.
-	 *
-	 * From section 6.4 MICROPOCESSOR INTERFACE section in the datasheet:
-	 *
-	 * "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
-	 * I2C interface compatible.
-	 * Separating acknowledge-output from serial data
-	 * input is advantageous for chip-on-glass (COG) applications. In COG
-	 * applications, the ITO resistance and the pull-up resistor will form a
-	 * voltage  divider, which affects acknowledge-signal level. Larger ITO
-	 * resistance will raise the acknowledged-signal level and system cannot
-	 * recognize this level as a valid logic “0” level. By separating SDA_IN from
-	 * SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
-	 * For applications which check acknowledge-bit, it is necessary to minimize
-	 * the ITO resistance of the SDA_OUT trace to guarantee a valid low level."
-	 *
-	 */
-	bool ignore_nak;
-
 	bool grayscale;
 	bool inverted;
 	u32 height_mm;

-- 
2.51.2

