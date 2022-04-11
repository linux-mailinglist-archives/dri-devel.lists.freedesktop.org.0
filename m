Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53974FC673
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149B110F775;
	Mon, 11 Apr 2022 21:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36B210F775
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 21:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649711578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jEFGMcteZ+nA9cu4YEj6hFyYlLNIHH/8HV43Q6c+F0=;
 b=Yat9zgxd2KiFdrF8VyCgeGg0AaqUTrpRavCVu3CKAHXtFyNz35hXLsG28HJqbpP0ZKQ0Jv
 L2BZ4e3UwcKF83PqtbsDRaR0EbLYiYtZMIn0oC6M7eEAck5Ww5uwSGSUtpLlzrX1eXiRVj
 icHpxC6SE27ApdXYi2taoqrdyBWxfJM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-nqVgLTCHPdOKsNs2WPT9-Q-1; Mon, 11 Apr 2022 17:12:55 -0400
X-MC-Unique: nqVgLTCHPdOKsNs2WPT9-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a05600c501100b0038e731cf5e1so219380wmr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9jEFGMcteZ+nA9cu4YEj6hFyYlLNIHH/8HV43Q6c+F0=;
 b=avWNCcM57lTeH/dMH1xMJPHA2NNt5KYPcRAyxEFFHh6VazvgQLnuj07dF8esKDR9ri
 WMCsvKr9CKeAgUj5u2I0s1ZHNGEtZCr+9m/mQNiO48Gl5uIyK9WsCQT3o4z95siQUBHf
 ZsYPIMp1TwsepacrV0MOBaLhfVrTdzSs/1EXtlL7Yl8aaWU+W9Khj5n5TjYYUtzq+TYZ
 OMix8kKXHhDNTVUBP7DzfDqdizTySrz0oN0y5byRNlHcivR4DnvftkOplB6H0CotTSdN
 kiOFw18lnLfuDRqTnlgeBt767m/oDqgFJPL4tjDuLE1zFUpxRe7Jfj8WFwRi04RKe8dI
 eYjQ==
X-Gm-Message-State: AOAM532cnlSEGb0eulRqhFZtOL7cS/hnomfENga8A3uvM160UJjTeyAD
 TYPAJpCU28XsQV0u91tfh9Sc2CCQcAJZagoBdpp2tBMmurfDinaXwaPpdpCX8sxHTU4JbYdRUfk
 XLIxuif2SnQ4mK9VB4LCE9LhnYXOp
X-Received: by 2002:a5d:6d0e:0:b0:207:8ecd:2dbf with SMTP id
 e14-20020a5d6d0e000000b002078ecd2dbfmr16797881wrq.660.1649711574112; 
 Mon, 11 Apr 2022 14:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTmfCgkAAd79bXAApXOp928kNiObmsrvzqdhHe087nR1AzkXYxJTev+H7I9+izveEH7z5uMA==
X-Received: by 2002:a5d:6d0e:0:b0:207:8ecd:2dbf with SMTP id
 e14-20020a5d6d0e000000b002078ecd2dbfmr16797873wrq.660.1649711573895; 
 Mon, 11 Apr 2022 14:12:53 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm28723722wrs.43.2022.04.11.14.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:12:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] drm/solomon: Move device info from ssd130x-i2c to the
 core driver
Date: Mon, 11 Apr 2022 23:12:42 +0200
Message-Id: <20220411211243.11121-5-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411211243.11121-1-javierm@redhat.com>
References: <20220411211243.11121-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are declared in the ssd130x-i2c transport driver but the information
is not I2C specific, and could be used by other SSD130x transport drivers.

Move them to the ssd130x core driver and just set the OF device entries to
an ID that could be used to lookup the correct device info from an array.

While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
bytes. Since even though are used by the I2C interface, it could also be
useful for other transport protocols such as SPI.

Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
---

Changes in v2:
- Drop ssd13x_variant_to_info() and just use the array index (Neil Armstrong).

 drivers/gpu/drm/solomon/ssd130x-i2c.c | 53 +++++----------------------
 drivers/gpu/drm/solomon/ssd130x.c     | 45 +++++++++++++++++++++--
 drivers/gpu/drm/solomon/ssd130x.h     | 12 ++++++
 3 files changed, 63 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index 87abe1fe31fc..8259b10db966 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -53,80 +53,47 @@ static void ssd130x_i2c_shutdown(struct i2c_client *client)
 	ssd130x_shutdown(ssd130x);
 }
 
-static struct ssd130x_deviceinfo ssd130x_sh1106_deviceinfo = {
-	.default_vcomh = 0x40,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 5,
-	.page_mode_only = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1305_deviceinfo = {
-	.default_vcomh = 0x34,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 7,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1306_deviceinfo = {
-	.default_vcomh = 0x20,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 8,
-	.need_chargepump = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1307_deviceinfo = {
-	.default_vcomh = 0x20,
-	.default_dclk_div = 2,
-	.default_dclk_frq = 12,
-	.need_pwm = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
-	.default_vcomh = 0x34,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 10,
-};
-
 static const struct of_device_id ssd130x_of_match[] = {
 	{
 		.compatible = "sinowealth,sh1106",
-		.data = &ssd130x_sh1106_deviceinfo,
+		.data = (void *)SH1106_ID,
 	},
 	{
 		.compatible = "solomon,ssd1305",
-		.data = &ssd130x_ssd1305_deviceinfo,
+		.data = (void *)SSD1305_ID,
 	},
 	{
 		.compatible = "solomon,ssd1306",
-		.data = &ssd130x_ssd1306_deviceinfo,
+		.data = (void *)SSD1306_ID,
 	},
 	{
 		.compatible = "solomon,ssd1307",
-		.data = &ssd130x_ssd1307_deviceinfo,
+		.data = (void *)SSD1307_ID,
 	},
 	{
 		.compatible = "solomon,ssd1309",
-		.data = &ssd130x_ssd1309_deviceinfo,
+		.data = (void *)SSD1309_ID,
 	},
 	/* Deprecated but kept for backward compatibility */
 	{
 		.compatible = "sinowealth,sh1106-i2c",
-		.data = &ssd130x_sh1106_deviceinfo,
+		.data = (void *)SH1106_ID,
 	},
 	{
 		.compatible = "solomon,ssd1305fb-i2c",
-		.data = &ssd130x_ssd1305_deviceinfo,
+		.data = (void *)SSD1305_ID,
 	},
 	{
 		.compatible = "solomon,ssd1306fb-i2c",
-		.data = &ssd130x_ssd1306_deviceinfo,
+		.data = (void *)SSD1306_ID,
 	},
 	{
 		.compatible = "solomon,ssd1307fb-i2c",
-		.data = &ssd130x_ssd1307_deviceinfo,
+		.data = (void *)SSD1307_ID,
 	},
 	{
 		.compatible = "solomon,ssd1309fb-i2c",
-		.data = &ssd130x_ssd1309_deviceinfo,
+		.data = (void *)SSD1309_ID,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index a7e784518c69..7d5b43023213 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -39,11 +39,9 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-#define SSD130X_DATA				0x40
-#define SSD130X_COMMAND				0x80
-
 #define SSD130X_PAGE_COL_START_LOW		0x00
 #define SSD130X_PAGE_COL_START_HIGH		0x10
+
 #define SSD130X_SET_ADDRESS_MODE		0x20
 #define SSD130X_SET_COL_RANGE			0x21
 #define SSD130X_SET_PAGE_RANGE			0x22
@@ -94,6 +92,37 @@
 
 #define MAX_CONTRAST 255
 
+static const struct ssd130x_deviceinfo ssd130x_variants[] = {
+	[SH1106_ID] = {
+		.default_vcomh = 0x40,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 5,
+		.page_mode_only = 1,
+	},
+	[SSD1305_ID] = {
+		.default_vcomh = 0x34,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 7,
+	},
+	[SSD1306_ID] = {
+		.default_vcomh = 0x20,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 8,
+		.need_chargepump = 1,
+	},
+	[SSD1307_ID] = {
+		.default_vcomh = 0x20,
+		.default_dclk_div = 2,
+		.default_dclk_frq = 12,
+		.need_pwm = 1,
+	},
+	[SSD1309_ID] = {
+		.default_vcomh = 0x34,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 10,
+	}
+};
+
 static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 {
 	return container_of(drm, struct ssd130x_device, drm);
@@ -846,6 +875,7 @@ static int ssd130x_get_resources(struct ssd130x_device *ssd130x)
 struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 {
 	struct ssd130x_device *ssd130x;
+	enum ssd130x_variants variant;
 	struct backlight_device *bl;
 	struct drm_device *drm;
 	int ret;
@@ -860,7 +890,14 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 
 	ssd130x->dev = dev;
 	ssd130x->regmap = regmap;
-	ssd130x->device_info = device_get_match_data(dev);
+
+	variant = (enum ssd130x_variants)device_get_match_data(dev);
+
+	if (variant >= NR_SSD130X_VARIANTS)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+					     "Invalid SSD130x variant\n"));
+
+	ssd130x->device_info = &ssd130x_variants[variant];
 
 	if (ssd130x->device_info->page_mode_only)
 		ssd130x->page_address_mode = 1;
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index f5b062576fdf..ec349239e945 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -18,6 +18,18 @@
 
 #include <linux/regmap.h>
 
+#define SSD130X_DATA				0x40
+#define SSD130X_COMMAND				0x80
+
+enum ssd130x_variants {
+	SH1106_ID,
+	SSD1305_ID,
+	SSD1306_ID,
+	SSD1307_ID,
+	SSD1309_ID,
+	NR_SSD130X_VARIANTS
+};
+
 struct ssd130x_deviceinfo {
 	u32 default_vcomh;
 	u32 default_dclk_div;
-- 
2.35.1

