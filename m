Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0709C05B6F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 12:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24F910EA69;
	Fri, 24 Oct 2025 10:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hAzcLn3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAACC10EA66
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 10:57:35 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-37775ed97daso32089381fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 03:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761303454; x=1761908254; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cLWjaKLx+X0gG/JQr9xbszcB6rfPVQrK0WJygsJNUrg=;
 b=hAzcLn3U2cs/adHd+45unfNQgrhSKn65+7w4xnXgwZ4feAnHlbTMsPmnEkldeGA/jR
 3Ck9HuHQcA8YppurH+CBcU4hveWdunB6jorHSuM8XLBRqQepF9+zRVtTmHR764kH5BXZ
 nt1QBywQ7DpWC0Q0KYQpzHb+UfEaLDDiXAK7I2WXQdeeVpaCCtVH1GanRx+6HSI5HvwC
 za3R5cBAi1jGK6jflkxhm0sc+aVqPJbNWSUeq1gen8C6tH+Epv3/RNO9AxszAsgMaFwR
 MwczzJehimJ9BM/f4IkHWDE4Qk+TA+PB+oLmsCl3L062LVJ73zrEmDp/M5aSq5tEqx1b
 78Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761303454; x=1761908254;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cLWjaKLx+X0gG/JQr9xbszcB6rfPVQrK0WJygsJNUrg=;
 b=CEht7GJgoh97MYhzDgrRbHZhBYF5LzQfbJXzEfX27jJCyujHmC2gvqPn3bMjFsIITO
 tQK1xF7VLAiORus+9gJuL6GpVFUd242a9OZs8RG13zxYvf8K3OXt0TObLwyMYQP1MUfU
 JDc9KxZt1/sx7bqgjvWSbOP4tYonw3hjOQtsqZjpfj3saSS6GuRFQd3xY83mtfYEcNNP
 k9tn2VKjY+9t5DOjGddewAGkH8ToGhpqj8+DG/BQ3DwCvqcKuNOXov/QA/acmTJC5+b1
 NYaXoaGNDvhOjVnW4aCVWySIGnuJp5RPZ2LQofbhOd7YO0QLcSmtyoiOfCjtQMstU12q
 UR+A==
X-Gm-Message-State: AOJu0YxFinmLyaij3dymqgBuSK+6gleGROyHLS/EGH3eixM7jK4yMUJ7
 QjAeIKdzGkoPgclaM/FZwNuYxEm0czbhynz7z3p4QTR1bNnTBgXLaEhL
X-Gm-Gg: ASbGncvw+aqAv9uSozYWnlcIgkOa7I6bmWkxsLkNdyaZcuMdZQ6m/eSKSEKwFoVwY1l
 gwbJ6DmxaBVIBAfw7GRyj8bnNPdjND/Z7H2tkvLRKlU6KDy6GqAY4uH5paSYWOfwBjGMPOx11zX
 N9sk2YKcoligQXb4SlGkHK6khL5B0iAOVbBgJWZNt05CwdJTWvcTNIzEWUIXMb9RnrCH0Rtb9ke
 no8QH96rOBS+zClbRs8nKSnvFjq/dF5aPRkuOhrmIMhpBGX49N5BJGofMNJuDP06Jv4hRSZm8PR
 dCmPClnjp/bRF3ghB0dX+w69YSMRSIYdC5N7Xh7hWIxTFm3O8yMnYx3K3gsjrbewuwm2+rPYUO1
 GK19eB93iy/z8pOZMdcqo3CDA9fHOJPBnAeT5xkD0rKMOkXfY3fwpplIdUwgoc2NATaZdZwUpxi
 1afaHhHnJNUqh+q8YNKMeUThZFmpVyizbVBRcrPEXwikDO
X-Google-Smtp-Source: AGHT+IHPZEuRVXC0U6odZEYH6VBzGyuljeXi8z12j70VD9t0T+mgQIsAZPcf5xRYome74LIjGDBMJQ==
X-Received: by 2002:a05:651c:2545:10b0:376:2802:84c3 with SMTP id
 38308e7fff4ca-378e3e9bb0amr5386011fa.24.1761303453825; 
 Fri, 24 Oct 2025 03:57:33 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67db8fesm10375671fa.38.2025.10.24.03.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 03:57:33 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 24 Oct 2025 12:56:53 +0200
Subject: [PATCH 2/6] drm/sitronix/st7571-i2c: add 'struct device' to
 st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-st7571-split-v1-2-d3092b98130f@gmail.com>
References: <20251024-st7571-split-v1-0-d3092b98130f@gmail.com>
In-Reply-To: <20251024-st7571-split-v1-0-d3092b98130f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4484;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=LfOcWsXvHf24Rmlqiz3/HxiBo5dw0vDuG1TwXuVbpUw=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo+1uBJtoReNeQpGPnf9grYHc5UoxKbA4Kyu5cC
 CaRuM790I2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPtbgQAKCRCIgE5vWV1S
 MlnoD/4s36kKAjNEWR+7hAVQ9SN+DEYe3XbUGK0AhlenjxjuvEznj9kv9Rch29yP2XhCmHE+GHC
 1CsxW5P7IXBEvTM3tuAJN7Ys4B5XXXRyiazz1LLmre+4lSkWmh7ukJcgoy1jCLzIIUCY9NgHimK
 7PkQMhOXgkNAw4TlQlBgvrxv2TReCEA19SES2cvaOZBva87BrbBwZOsGoECsuGU6+97Pwvg+9Pi
 fwrue9gdRUHIVZv09BI8WAPVOtlq6ojHfVVJtbSTiegNYRijGIwsVkJfHg0unsvRYpjpxnZ6AzX
 1PXyADKhgiYDCMgZq4Vh8GzsdFdh2B2DaA9C8mECPqF1jw100nrbpdTdQPejKc+/KuRFDUi6hZv
 oK7verRQS1Vk0FRoHgIO6pcCTK8BYR2sg9ezXGMYqNJmIw2BoF6oc3RJvmoE/LNRsyw2CCCIKr8
 47iZaI9Mk6OMb9DDox3KR1zEHgYGh1dncx+L0SX+D+hMPdKeOlDZBAati8IERmJEAW0IzsLG13E
 AqJQpRrQcGeMrF4dfoi3pIvtrwrVZLpkO5btb22tbuvAUXjxH7Z6RerEEWFkzzQlApNHOc5DTJ8
 fo3cFE21WOfNmghuv7DgQbZ1FXaTUiuZBjz51sijFAbtYS0Gtw9ee5GHijYf1fdusoOObHxkkPF
 9KlIxa2EqcW22Fg==
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
index 71814a3eb93b7adf554da082a0237da371e5f5b5..2b52919d7dd434bb16aa66274eae8730649f62f1 100644
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
2.50.1

