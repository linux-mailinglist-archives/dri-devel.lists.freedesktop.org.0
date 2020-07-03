Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD7213F9F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E334F6EBAC;
	Fri,  3 Jul 2020 18:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3108E6EBAC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d21so19026909lfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q86XdCJfHm4NXa8RPuVpLMGPelEiFzOicNNaQKmE/Tg=;
 b=nBiBGqmR5JNs/DnxM/smCnXHsf8bZ9h+pbLeNYLjLQ2Rcovhk3ODpGdV50KiQt+Kca
 cuoq6henFkcNUS076lI9Ebou281QOyaIPCUw+yjymXUm30BXc/mVq9b+1WYkoCozQDo6
 i93T7vFV75j/Br4G3oixOkU86XkZCZGiK9F9pITDefqczikdFNmARPU3TcHWm9r0r6Ir
 ew4YX0S8lj3zWQ2vY1q/kTWWH77/XC72/vYsaSpaY3pWXmv7MjaLxlECYEGHrM7sv5/h
 ww5+gcgyjh/hmLUtWYFClvOccaVoOkUz2qsANjO8qhpe/VtvNCELy58jkG1Q+YUJ6eTG
 9lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q86XdCJfHm4NXa8RPuVpLMGPelEiFzOicNNaQKmE/Tg=;
 b=Ft4M3dUQRYc4Dz/Bm+c/bKiRxaI+OIC2hrvClxqqAI+dVkKFVPuF8ksvuiYvwF3yyh
 DyALN0FapUQXeLrLSNj49TF9sHBFW0O/V97dKtMubrc2TasAqcbZikcLEWUr4Se85uZD
 QnHfxLSOY/Ee9aewSORDDBUS7U2hMgR78lC/F2Ouzv+ul5ftv5mU3SPYoakXXIawuue2
 KIQz4qJHbt9eW6PitqE4CGaPmwirnPIAkU+a/DUr2ryqNhZLrK/K7cKV27jEHWytM+qx
 AJV4LL54FEhDsMvVLVLvzczJ/wa3oYG3LXV1GIVK+7OiIX9IxWcACn8WotZnnzbvnWey
 UWVQ==
X-Gm-Message-State: AOAM533WDjTzg5m77LkcJbal834PzwT9MsNhiaURyx9epnDKuEmbO6bN
 PbipKV4jZoPJ27SKYipU/Sa2hqubnCo=
X-Google-Smtp-Source: ABdhPJyac79zADQ53wcZqwr2NvTksQGiIwtv5yruNnDCMzz6vo8jWzvXmY58HB/AOxGojDo5ENwokA==
X-Received: by 2002:a19:787:: with SMTP id 129mr22863367lfh.147.1593802002408; 
 Fri, 03 Jul 2020 11:46:42 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:41 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 19/20] backlight: make of_find_backlight static
Date: Fri,  3 Jul 2020 20:45:45 +0200
Message-Id: <20200703184546.144664-20-sam@ravnborg.org>
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

There are no external users of of_find_backlight,
as they have all changed to use the managed version.
Make of_find_backlight static to prevent new external users.

v3:
  - Move doc for devm_of_find_backlight out of this patch

v2:
  - Editorial corrections (Daniel)
  - Returns => RETURNS (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 18 +-----------------
 include/linux/backlight.h           |  6 ------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 099023771ab1..06f4da3c58e1 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -672,22 +672,7 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
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
@@ -713,7 +698,6 @@ struct backlight_device *of_find_backlight(struct device *dev)
 
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
