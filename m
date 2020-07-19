Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F642250BD
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600FD6E505;
	Sun, 19 Jul 2020 08:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FD76E4F1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:32 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id k15so8184863lfc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uNwKzv8b/C+0SI0qOFOrsb7npxZ7PTzq2BdWF06ubw=;
 b=GY8/416esOptHiTcw/hru9S/6/vqdc0yetjpC6SPZf7xPtxO7FP6ADL0+LdKqYdNX5
 MZJHj3PUr6ys19l9+TGsMvagycygO8p25T8ixdmvOgRNAHQ2VomonsNYPX06+tBCnFjo
 GJaZn4IM50ItSes0ZOX4hOMHOYGW278fxUtfyTOklTkUErjNwtDEmLqUxnOzHfEYDMH+
 W54+6nwZl0n5aGK8NW2W3tslN6ZiJw+15pQuv3wC6/kdV00bfIp0TUCXCVnxKoIzWbUe
 cdMEKz1sGLGNsnO9EukHPzelYqK57AqIDGf9mqxP2VXeBL4HEtJ9xjpOYYEBADn7VUKo
 e6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9uNwKzv8b/C+0SI0qOFOrsb7npxZ7PTzq2BdWF06ubw=;
 b=HWJ2qMXRZ03qhpIAF6zM4NyQ2/r9fFeJiO5iGRvt2iQ8p2abCzK3W30DrXCa+FvNYW
 8Zg6XFwVD1lTBgeDM3ro7pRb4skNgXNz+z5KgFsh/7COqStwed/SwE2ah6ovfSBWntuW
 yQ9ra2+ksBCvnseuUo/oW3XAuX4fNlRJI/dY2io4v/+Rb8C4Et8g7MHiDhtsodhlKyg9
 ztuDq2ig6E6iuRisV0bTdDr1EcD6bzSJf7h4dRS6J97p5wijISujYKu2T+Jt1u1kLVcO
 qlj6RqCzohEy6kraFqXUj10ruwqtQurLr/gNn7mECrkLlgdN8BOszWleP2mJT10zKHS8
 sQLw==
X-Gm-Message-State: AOAM531bRSv+I9N3FlNducVr99RMOiv2s5oWKjejKgclryegxrHoKp4a
 dtd7O1ZkLhBRF6pAXmNWiLPCuqer7oo=
X-Google-Smtp-Source: ABdhPJwIH7f1kYdsfJVH3BGHUjihRFZqPKBCA9Z4ih5Z5OGknuirQDjZF0kxMmmxuEi/yIgniGV3rA==
X-Received: by 2002:ac2:4ec9:: with SMTP id p9mr779615lfr.142.1595146111102;
 Sun, 19 Jul 2020 01:08:31 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 19/19] backlight: make of_find_backlight static
Date: Sun, 19 Jul 2020 10:07:43 +0200
Message-Id: <20200719080743.8560-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200719080743.8560-1-sam@ravnborg.org>
References: <20200719080743.8560-1-sam@ravnborg.org>
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

There are no external users of of_find_backlight,
as they have all changed to use the managed version.
Make of_find_backlight static to prevent new external users.

v3:
  - Move doc for devm_of_find_backlight out of this patch

v2:
  - Editorial corrections (Daniel)
  - Returns => RETURNS (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 18 +-----------------
 include/linux/backlight.h           |  6 ------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index d8387c8e7112..ff8406a15545 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -673,22 +673,7 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
 EXPORT_SYMBOL(of_find_backlight_by_node);
 #endif
 
-/**
- * of_find_backlight - Get backlight device
- * @dev: Device
- *
- * This function looks for a property named 'backlight' on the DT node
- * connected to @dev and looks up the backlight device.
- *
- * Call backlight_put() to drop the reference on the backlight device.
- *
- * Returns:
- * A pointer to the backlight device if found.
- * Error pointer -EPROBE_DEFER if the DT property is set, but no backlight
- * device is found.
- * NULL if there's no backlight property.
- */
-struct backlight_device *of_find_backlight(struct device *dev)
+static struct backlight_device *of_find_backlight(struct device *dev)
 {
 	struct backlight_device *bd = NULL;
 	struct device_node *np;
@@ -714,7 +699,6 @@ struct backlight_device *of_find_backlight(struct device *dev)
 
 	return bd;
 }
-EXPORT_SYMBOL(of_find_backlight);
 
 static void devm_backlight_release(void *data)
 {
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index f3b484c99789..8b43fd90d84a 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -477,14 +477,8 @@ of_find_backlight_by_node(struct device_node *node)
 #endif
 
 #if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
-struct backlight_device *of_find_backlight(struct device *dev);
 struct backlight_device *devm_of_find_backlight(struct device *dev);
 #else
-static inline struct backlight_device *of_find_backlight(struct device *dev)
-{
-	return NULL;
-}
-
 static inline struct backlight_device *
 devm_of_find_backlight(struct device *dev)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
