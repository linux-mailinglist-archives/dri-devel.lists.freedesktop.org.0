Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F310B7C78B3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 23:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E5210E555;
	Thu, 12 Oct 2023 21:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9A510E552
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 21:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697146753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHqLtwUAaD2dDREXiqZ2XaEcrQiR2C2+WBV3WmiOV5E=;
 b=h3fyPaxgsx48fPvJN+OMkJGeIFOILSbgnCZnKrhHWy2ro4/2io0mTVka7MZzBBgrVvH642
 nOYZu18TMv5S4NeCASFRj20bQkLL1Dt1RaW0mEvE9lEOsl1JdNhHzRxaA0mVKqAM6f9HEF
 Pp01RgGqF9sIUt8pkOgnq6tjr3hlVv0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-tSnYhBTdNCqkC2VDn3cSng-1; Thu, 12 Oct 2023 17:39:10 -0400
X-MC-Unique: tSnYhBTdNCqkC2VDn3cSng-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30e3ee8a42eso911711f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 14:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697146749; x=1697751549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHqLtwUAaD2dDREXiqZ2XaEcrQiR2C2+WBV3WmiOV5E=;
 b=U71Rd6TlC4chGmcieV2iAjVQXnlh7dqJTtINVgvYtZ6LhpjHxpxVS99KxOrdlt7hGn
 kuklXYE1WsUT9kINdUPrbyZ/r/8SQXpvRt9iBArOLyIo9aORGTKGxrQzeAV/lgdjjop2
 MsRB3DmzRIy7TkteUQv5lICE+WeE2jVjkUjbrqdu58hZOOZ0hfLDEo378Afe3Hg7luQi
 p90lHXgDK7nfNUhmw4gcWbAG6XqfIH6CH4eyrLuCVJEAK/Xe/J1bqaKzwp9o85NbemYP
 MiW6dKathoetnUAL6iBYzRj8trkMVeygnsblk1iFpbNGYQ/QK7rVA/eWN1LyAq6rv0pu
 WwMQ==
X-Gm-Message-State: AOJu0YzK+IL9rObMqVxR+iZBqcbuloINOtnbqWa2qNLqSdT63kK2vb9m
 S/69+lOofwJ9YU9tWALeNu+rYY1RBQaeGAfpZXTWuOhKc2X5A3p+bUgB1Sdv0lTYUKlSunYX6QZ
 hQZgd+D2YvWxmwIbqtvHwJUjAZYVk
X-Received: by 2002:adf:cd06:0:b0:32d:9789:6066 with SMTP id
 w6-20020adfcd06000000b0032d97896066mr896812wrm.5.1697146749147; 
 Thu, 12 Oct 2023 14:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAjF0vCXT8TsSMSp2rxeCB08EEo5MwrMP0eMHg3wN8N+ODxNLGwSHHaVpR61BRU2PAIQc5Ug==
X-Received: by 2002:adf:cd06:0:b0:32d:9789:6066 with SMTP id
 w6-20020adfcd06000000b0032d97896066mr896796wrm.5.1697146748871; 
 Thu, 12 Oct 2023 14:39:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d4d11000000b0032d9548240fsm1895222wrt.82.2023.10.12.14.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 14:39:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] drm/ssd130x: Rename commands that are shared across
 chip families
Date: Thu, 12 Oct 2023 23:38:33 +0200
Message-ID: <20231012213843.1151060-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012213843.1151060-1-javierm@redhat.com>
References: <20231012213843.1151060-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some commands that are shared between the SSD130x and SSD132x
controller families, define these as a common SSD13XX set of commands.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x-spi.c |  4 +--
 drivers/gpu/drm/solomon/ssd130x.c     | 47 +++++++++++++++------------
 drivers/gpu/drm/solomon/ssd130x.h     |  4 +--
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 257819bccbc8..89989da705d7 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -34,10 +34,10 @@ static int ssd130x_spi_write(void *context, const void *data, size_t count)
 	struct spi_device *spi = t->spi;
 	const u8 *reg = data;
 
-	if (*reg == SSD130X_COMMAND)
+	if (*reg == SSD13XX_COMMAND)
 		gpiod_set_value_cansleep(t->dc, 0);
 
-	if (*reg == SSD130X_DATA)
+	if (*reg == SSD13XX_DATA)
 		gpiod_set_value_cansleep(t->dc, 1);
 
 	/* Remove control byte since is not used in a 4-wire SPI interface */
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 4df4c4ed61f1..b63c28f0e86e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -44,18 +44,24 @@
 
 #define SSD130X_PAGE_HEIGHT 8
 
+/* ssd13xx commands */
+#define SSD13XX_CONTRAST			0x81
+#define SSD13XX_SET_SEG_REMAP			0xa0
+#define SSD13XX_SET_MULTIPLEX_RATIO		0xa8
+#define SSD13XX_DISPLAY_OFF			0xae
+#define SSD13XX_DISPLAY_ON			0xaf
+
+#define SSD13XX_SET_SEG_REMAP_MASK		GENMASK(0, 0)
+#define SSD13XX_SET_SEG_REMAP_SET(val)		FIELD_PREP(SSD13XX_SET_SEG_REMAP_MASK, (val))
+
+/* ssd130x commands */
 #define SSD130X_PAGE_COL_START_LOW		0x00
 #define SSD130X_PAGE_COL_START_HIGH		0x10
 #define SSD130X_SET_ADDRESS_MODE		0x20
 #define SSD130X_SET_COL_RANGE			0x21
 #define SSD130X_SET_PAGE_RANGE			0x22
-#define SSD130X_CONTRAST			0x81
 #define SSD130X_SET_LOOKUP_TABLE		0x91
 #define SSD130X_CHARGE_PUMP			0x8d
-#define SSD130X_SET_SEG_REMAP			0xa0
-#define SSD130X_DISPLAY_OFF			0xae
-#define SSD130X_SET_MULTIPLEX_RATIO		0xa8
-#define SSD130X_DISPLAY_ON			0xaf
 #define SSD130X_START_PAGE_ADDRESS		0xb0
 #define SSD130X_SET_COM_SCAN_DIR		0xc0
 #define SSD130X_SET_DISPLAY_OFFSET		0xd3
@@ -65,13 +71,12 @@
 #define SSD130X_SET_COM_PINS_CONFIG		0xda
 #define SSD130X_SET_VCOMH			0xdb
 
+/* ssd130x commands accessors */
 #define SSD130X_PAGE_COL_START_MASK		GENMASK(3, 0)
 #define SSD130X_PAGE_COL_START_HIGH_SET(val)	FIELD_PREP(SSD130X_PAGE_COL_START_MASK, (val) >> 4)
 #define SSD130X_PAGE_COL_START_LOW_SET(val)	FIELD_PREP(SSD130X_PAGE_COL_START_MASK, (val))
 #define SSD130X_START_PAGE_ADDRESS_MASK		GENMASK(2, 0)
 #define SSD130X_START_PAGE_ADDRESS_SET(val)	FIELD_PREP(SSD130X_START_PAGE_ADDRESS_MASK, (val))
-#define SSD130X_SET_SEG_REMAP_MASK		GENMASK(0, 0)
-#define SSD130X_SET_SEG_REMAP_SET(val)		FIELD_PREP(SSD130X_SET_SEG_REMAP_MASK, (val))
 #define SSD130X_SET_COM_SCAN_DIR_MASK		GENMASK(3, 3)
 #define SSD130X_SET_COM_SCAN_DIR_SET(val)	FIELD_PREP(SSD130X_SET_COM_SCAN_DIR_MASK, (val))
 #define SSD130X_SET_CLOCK_DIV_MASK		GENMASK(3, 0)
@@ -171,20 +176,20 @@ static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 }
 
 /*
- * Helper to write data (SSD130X_DATA) to the device.
+ * Helper to write data (SSD13XX_DATA) to the device.
  */
 static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
 {
-	return regmap_bulk_write(ssd130x->regmap, SSD130X_DATA, values, count);
+	return regmap_bulk_write(ssd130x->regmap, SSD13XX_DATA, values, count);
 }
 
 /*
- * Helper to write command (SSD130X_COMMAND). The fist variadic argument
+ * Helper to write command (SSD13XX_COMMAND). The fist variadic argument
  * is the command to write and the following are the command options.
  *
- * Note that the ssd130x protocol requires each command and option to be
- * written as a SSD130X_COMMAND device register value. That is why a call
- * to regmap_write(..., SSD130X_COMMAND, ...) is done for each argument.
+ * Note that the ssd13xx protocol requires each command and option to be
+ * written as a SSD13XX_COMMAND device register value. That is why a call
+ * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each argument.
  */
 static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
 			     /* u8 cmd, u8 option, ... */...)
@@ -197,7 +202,7 @@ static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
 
 	do {
 		value = va_arg(ap, int);
-		ret = regmap_write(ssd130x->regmap, SSD130X_COMMAND, value);
+		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, value);
 		if (ret)
 			goto out_end;
 	} while (--count);
@@ -341,13 +346,13 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 	int ret;
 
 	/* Set initial contrast */
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_CONTRAST, ssd130x->contrast);
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_CONTRAST, ssd130x->contrast);
 	if (ret < 0)
 		return ret;
 
 	/* Set segment re-map */
-	seg_remap = (SSD130X_SET_SEG_REMAP |
-		     SSD130X_SET_SEG_REMAP_SET(ssd130x->seg_remap));
+	seg_remap = (SSD13XX_SET_SEG_REMAP |
+		     SSD13XX_SET_SEG_REMAP_SET(ssd130x->seg_remap));
 	ret = ssd130x_write_cmd(ssd130x, 1, seg_remap);
 	if (ret < 0)
 		return ret;
@@ -360,7 +365,7 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 		return ret;
 
 	/* Set multiplex ratio value */
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
 	if (ret < 0)
 		return ret;
 
@@ -914,7 +919,7 @@ static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
 	if (ret)
 		goto power_off;
 
-	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
+	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_ON);
 
 	backlight_enable(ssd130x->bl_dev);
 
@@ -933,7 +938,7 @@ static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
 
 	backlight_disable(ssd130x->bl_dev);
 
-	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
+	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_OFF);
 
 	ssd130x_power_off(ssd130x);
 }
@@ -1009,7 +1014,7 @@ static int ssd130x_update_bl(struct backlight_device *bdev)
 
 	ssd130x->contrast = brightness;
 
-	ret = ssd130x_write_cmd(ssd130x, 1, SSD130X_CONTRAST);
+	ret = ssd130x_write_cmd(ssd130x, 1, SSD13XX_CONTRAST);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index c562c2d00c16..a5a25e054d2f 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -21,8 +21,8 @@
 
 #include <linux/regmap.h>
 
-#define SSD130X_DATA				0x40
-#define SSD130X_COMMAND				0x80
+#define SSD13XX_DATA				0x40
+#define SSD13XX_COMMAND				0x80
 
 enum ssd130x_family_ids {
 	SSD130X_FAMILY
-- 
2.41.0

