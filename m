Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B711D3C17
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3632D6EBAF;
	Thu, 14 May 2020 19:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D246EBAD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:28 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z22so3634247lfd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=es7L7BT5X1JhlaIi9tn96sUgeVkIuHpmkzZvtAwIcug=;
 b=CVItBRgQEjiAp4UKpopUfv37fyjDo1mY+XLZ8itHw+itr+e6Dc2W1Vwv+h7O94kTKO
 ojVnxcMI0XuVLhYbZThBf7xSndRQhUZSUZygweq503IdIl7oGa+TRkVU/DAqknpwVA6X
 5bEKgfcjbRZqcFUz+Thpwnr7oStu1zNdb2ghP8iQ/wS46V6lMGfIv0ZJItty3by/0hQ4
 IQRDi7Kk0xZ39rzzeWMQM6XgJ+9P9vc5XpXlmbrKDKLDNbvetdJN+utHwluVYHA91VyE
 sn4qpE62jAztmy4V6sw51DHoW0Gb2YlPqpjmqYegPOojTKEuWN9eAiXcYRW6u0eIXkJU
 udHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=es7L7BT5X1JhlaIi9tn96sUgeVkIuHpmkzZvtAwIcug=;
 b=GGCXJgPEPWCubuoQRe/H5yl1KOLRQCjkntfPQKqdympK3nRpLidZHwFtZcwhSQbdFS
 L73RkRdostHOwX9EBlFuiXIS4rOayRUZ+KJ5gE6lBJL6YLp90Hd/wGUu3h+1CFHmTEeO
 8pRfDvtz6cgShGYVyBFqy5ZqpIn+v+p0Lw35bK/06/MTvRfdP4nmP8qI8wCcTbX2gwFD
 1lhKlLhyrwYoz8QKg/yYnZ8rOtgptnc8ag/kRsGyggmq8fb++0m7l0MjTySVHP1WZEEZ
 davXHrhbwoXyjDOo9W3/2M/HhSiMY+/XujT/2MyOksG9zGf3WvSxqoj9lORItAxdzs+Y
 xpBQ==
X-Gm-Message-State: AOAM532yRkTrYC1PxX57qNcNHhSlr3vQKO+j7eUuGyrW8EdM0r4FuUbP
 HFWNqXh5vX3akNQKGNyBOCWrCk2toknE+g==
X-Google-Smtp-Source: ABdhPJz8pGerusE9OOKAKVj0mi5K/KXSSEFkTv+0WU6pZ/84b7vD0iKdmma7g9JVVyDE/6Qynkos6Q==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr4268011lfl.55.1589483426792; 
 Thu, 14 May 2020 12:10:26 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:26 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 06/18] backlight: make of_find_backlight_by_node() static
Date: Thu, 14 May 2020 21:09:49 +0200
Message-Id: <20200514191001.457441-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514191001.457441-1-sam@ravnborg.org>
References: <20200514191001.457441-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Douglas Anderson <dianders@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no external users of of_find_backlight_by_node().
Make it static so we keep it that way.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 22 +++++++++-------------
 include/linux/backlight.h           | 10 ----------
 2 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 547aa3e1a03a..91dfcf4a2087 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -577,19 +577,9 @@ static int of_parent_match(struct device *dev, const void *data)
 	return dev->parent && dev->parent->of_node == data;
 }
 
-/**
- * of_find_backlight_by_node() - find backlight device by device-tree node
- * @node: device-tree node of the backlight device
- *
- * Returns a pointer to the backlight device corresponding to the given DT
- * node or NULL if no such backlight device exists or if the device hasn't
- * been probed yet.
- *
- * This function obtains a reference on the backlight device and it is the
- * caller's responsibility to drop the reference by calling put_device() on
- * the backlight device's .dev field.
- */
-struct backlight_device *of_find_backlight_by_node(struct device_node *node)
+/* Find backlight device by device-tree node */
+static struct backlight_device *
+of_find_backlight_by_node(struct device_node *node)
 {
 	struct device *dev;
 
@@ -598,6 +588,12 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
 	return dev ? to_backlight_device(dev) : NULL;
 }
 EXPORT_SYMBOL(of_find_backlight_by_node);
+#else
+static struct backlight_device *
+of_find_backlight_by_node(struct device_node *node)
+{
+	return NULL;
+}
 #endif
 
 static struct backlight_device *of_find_backlight(struct device *dev)
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 3d757a850b88..b7839ea9d00a 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -198,16 +198,6 @@ struct generic_bl_info {
 	void (*kick_battery)(void);
 };
 
-#ifdef CONFIG_OF
-struct backlight_device *of_find_backlight_by_node(struct device_node *node);
-#else
-static inline struct backlight_device *
-of_find_backlight_by_node(struct device_node *node)
-{
-	return NULL;
-}
-#endif
-
 #if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
 struct backlight_device *devm_of_find_backlight(struct device *dev);
 #else
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
