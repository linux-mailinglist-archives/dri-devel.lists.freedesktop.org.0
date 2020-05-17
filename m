Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD2E1D6C10
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8636E6E114;
	Sun, 17 May 2020 19:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824D46E114
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:29 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h188so6120763lfd.7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Owbva2nI3N+6cL1et4Ic0vlFkieZkLc8sBPTb4V9KjM=;
 b=hN+B0ncxMnsYjbsNPzAOQsDQ1qNfQEAee8Rvy/Sg1Das5/j4oJocjdDj3+zUWjVMY/
 Dn1HbNv8rwOVhhVZ1nCiOWwjdpPS9yJnfkL0QjnAZVdiY62ymOIF5YU//tQtx1jtvO2c
 v6XonIDeEYjlmafpyWPih0jaXeot4mRN33AGnB5LG96gpM0fNP3NZeekqkIFt9sY01ow
 i83ATMywsCNBR9JON4RBAZks7gyS4/ItAmHqfCOsQZvN45s9HfIxX3mzUFKkZ+tMZNtP
 ihIUbPtQqttBQ44NqCeRVCWEPWhlXlIHogpbe/axqcbMgxF5bTnq+vX/9TAFAUZIOnUT
 F7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Owbva2nI3N+6cL1et4Ic0vlFkieZkLc8sBPTb4V9KjM=;
 b=NpunGI7EpGaShmMUmawu8RER5ISJ0wC4RFLJGpxky+o3+wB5dP1ZjxZ2LOAkoKkRyN
 xsRDjTfX/HfmaF4M9hhmqJrxlj/jDIKEh3FVY42tqyd7/h8M+bXNY9Cq/+f4awcmVeiY
 DA0n2PqIZJsaWzt3ReQUmRXUaO0XhyGi86YOoP4jTNSMQkVHzoAkC5/eiYdCjl/dF0f+
 TmoKOaFeBqPkjN9OL3iXcpaHYDJRxLBF13vVcKUs8JguEFk5t933l/xVuXzRi1iuUj40
 MFfQ6Vw7sxNbnd/OnBHia09cWoGI1Wc3Mrnsm+JJ/D3ZP8MltlbjAeMso1V0TVWOF93p
 4cmA==
X-Gm-Message-State: AOAM532Y58jQlCsx8xIzFWlUATwPEuKA9dli9+PQU7rR04RVDARdXui7
 TOtX2umo5xe5yDOr2/pT3IutXMpfbpc=
X-Google-Smtp-Source: ABdhPJxl/7pzFvOlBBOcqYBTHrjSV2Qiq2U2NVwdgfJ71Q9y2fMdtw/rpOeZnDVh1WqQvHbXKGDzZA==
X-Received: by 2002:a19:be11:: with SMTP id o17mr8841315lff.187.1589742147479; 
 Sun, 17 May 2020 12:02:27 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:27 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 15/16] backlight: make of_find_backlight_by_node() static
Date: Sun, 17 May 2020 21:01:38 +0200
Message-Id: <20200517190139.740249-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517190139.740249-1-sam@ravnborg.org>
References: <20200517190139.740249-1-sam@ravnborg.org>
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
 Jonathan Corbet <corbet@lwn.net>, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 patches@opensource.cirrus.com,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no external users of of_find_backlight_by_node().
Make it static so we keep it that way.

v2:
  - drop EXPORT of of_find_backlight_by_node

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 23 +++++++++--------------
 include/linux/backlight.h           | 10 ----------
 2 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 7f3eecaf8317..3fa29330a820 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -627,19 +627,9 @@ static int of_parent_match(struct device *dev, const void *data)
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
 
@@ -647,7 +637,12 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
 
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
index d92e523650ec..1e29ab43f4f6 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -473,16 +473,6 @@ static inline void * bl_get_data(struct backlight_device *bl_dev)
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
