Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE8A213FA0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C1D6EBAD;
	Fri,  3 Jul 2020 18:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225C96EBAD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so22207369ljj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hT0shvcR5E7UTkS/zrKMtVL3+oENb6Mn/8BtotMdc8Y=;
 b=IJ2pvZZu0XFyrYCZR2R+QxMO9PRsdBwoi67YSGTnXEoC6Xq35Un0PVtT9vh44xnDXP
 TEGeRIMsZGiYY6Awzwdq+jUzsSGLB4ADGwQ5ok8jjv4wOuWndRvZyE5OMfDznoZo90Th
 pQcuWXf8XYXOT5JioZmngSaaYWiRgjJLjdtvcWBOXqXAbHLIakqb1FUs9Jj7IOY1MgLt
 ONhxzqoJfYbWq2QSd6qoKs6tCTsLdmwEw77REvuGMEl0iwJS2rQFwTCmd9xNtGeisMjM
 gjOHzaRw4srWPfNxRglgv6ILapKfzB1ETl+0v76GQhbHDgft/Z8QaE1QiJoHBEmHxr1+
 y7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hT0shvcR5E7UTkS/zrKMtVL3+oENb6Mn/8BtotMdc8Y=;
 b=oUI2wnJXUR/fGei/4LOwkrrpgB6cKKiGhBQmyOOuIs0x8gqZrkRBqxhsBopoblDBOR
 ZEi958hdDTsDrW+t2JLKuYhkVIYRR+0WCRlBaT7nsK7cCnaGIKHf0V1iNyUE4oXRjOhu
 lVpibP+GaYPuykvJDgSbhkxcaeUME1lxbZXBQvkFU2zrSgr+wE2Jti1KGxdeq5HxXwJ+
 GIJjm3GAHJSVMsgTQUjgUOt8aLi+JwrAUuXUFVToajpfPqh+M5gNSMJIfxr3l+NYz3P5
 n+Uf84yM6aVkNxpitBgf8GBmulHY0Af8guy9qPlX2s9D7jdMDI9AygVQPT06UtpyAZCU
 qjTw==
X-Gm-Message-State: AOAM530L9B9cS1VEoVy4lpEqLnxTMSXusqA3MpR/aQzeCMXUHpmltnah
 LRq/hrDqBDV2arTLbWuzBhqdGkLXoY4=
X-Google-Smtp-Source: ABdhPJxYcPNmrmNBGSR3OEKzHcluG3e3qxVbhV/zKtVskDiIRKCh+SQkMLB/z9B+fykgAg9N0oyykQ==
X-Received: by 2002:a2e:3311:: with SMTP id d17mr19563882ljc.13.1593802004416; 
 Fri, 03 Jul 2020 11:46:44 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:44 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 20/20] backlight: make of_find_backlight_by_node() static
Date: Fri,  3 Jul 2020 20:45:46 +0200
Message-Id: <20200703184546.144664-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703184546.144664-1-sam@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no external users of of_find_backlight_by_node().
Make it static so we keep it that way.

v2:
  - drop EXPORT of of_find_backlight_by_node

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 23 +++++++++--------------
 include/linux/backlight.h           | 10 ----------
 2 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 06f4da3c58e1..ff84e6607486 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -649,19 +649,9 @@ static int of_parent_match(struct device *dev, const void *data)
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
 
@@ -669,7 +659,12 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
 
 	return dev ? to_backlight_device(dev) : NULL;
 }
-EXPORT_SYMBOL(of_find_backlight_by_node);
+#else
+static struct backlight_device *
+of_find_backlight_by_node(struct device_node *node)
+{
+	return NULL;
+}
 #endif
 
 static struct backlight_device *of_find_backlight(struct device *dev)
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 8b43fd90d84a..fa443899b4ee 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -466,16 +466,6 @@ static inline void * bl_get_data(struct backlight_device *bl_dev)
 	return dev_get_drvdata(&bl_dev->dev);
 }
 
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
