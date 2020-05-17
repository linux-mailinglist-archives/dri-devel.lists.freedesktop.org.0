Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82271D6C0A
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF20F6E108;
	Sun, 17 May 2020 19:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10956E108
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:23 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h188so6120606lfd.7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IvDsy/nPUi02XD/vfbNhyiPf7njrVCeQx3+gL16YDUg=;
 b=czbyCVEw53JapFDgPo5oUqLk+4ZpOVDDGegu4yOGim/1D2iWS5LoJ4s+WO986t4Oca
 QYdPzvpcnbinj/gMkr8AGQJnSGX9/PpX1YsMM1iCQkybIRFzRfnLhy/OKyD6Y2e5EQpf
 iUcstdjY2Q1zwjtH9KwAccx5AKbadwx7zIakR4kj4GnJu3BZAkuN4rld16ch04aCqXRJ
 7K/zgUfwm+2r4nPkAoccrJv76FqVZZBljDlI3MsO75hcDAbcbb6xoy3O5mLvyDDs9bCI
 A4UQFkaihP7w768jWRGqH7j2Z93jaTWvNnhepZ4B5Gia8GTxaIoqjvLJcmmlz4TtW2L5
 r5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IvDsy/nPUi02XD/vfbNhyiPf7njrVCeQx3+gL16YDUg=;
 b=UpYPChM0j9SmYfFuNvlPd/dnVPrke1nqbDbuldKFSrX5YHa1o6OqjA47L1Izg9fIOx
 o96cvWtazoy/zsQ4K3W6VmhFvLYh0Yd9zXnft3j8/j3j4xdDVIpzHtXII4/Sv+nkw+u+
 rCDKzl9DyloS+M7Xwr+QPBY52X7HwYKaKsgpwCjKIvtXHx5xOBW2mf9KuNA1pULx24Pr
 fKYlZRcc6J5d15nJWG3c5JkrnBSAUjO3Ufc/Vaz44aoeZGSyUibaMbUYPjGH/1W0LLVX
 lNOTU7p3DySAI0MVWeX5LoqWwtlX7EKxpJVI3GLcXITAaJ1A4Gf045A93CDqvj1TBGhX
 Y2CA==
X-Gm-Message-State: AOAM530RS/RBK/F+NlhjSCA/3B2lu122aX8fj40ZTIljlP21rZo8uend
 amk+6muBHx5zuXWOz2aFFsyK4sM17YI=
X-Google-Smtp-Source: ABdhPJxJEsVz8vUKYsbXCKwcWbHSyuHi0wKOTOertCRfru+9AvoX2lvlXxp8S+s1/M35SOwFd5ubPQ==
X-Received: by 2002:a19:5f5c:: with SMTP id a28mr9085446lfj.98.1589742142136; 
 Sun, 17 May 2020 12:02:22 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:21 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 13/16] backlight: make of_find_backlight static
Date: Sun, 17 May 2020 21:01:36 +0200
Message-Id: <20200517190139.740249-14-sam@ravnborg.org>
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

There are no external users of of_find_backlight,
as they have all changed to use the managed version.
Make of_find_backlight static to prevent new external users.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 31 ++++++++++-------------------
 include/linux/backlight.h           |  6 ------
 2 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 2212f0e3570e..e23b09d03a65 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -650,22 +650,7 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
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
@@ -691,7 +676,6 @@ struct backlight_device *of_find_backlight(struct device *dev)
 
 	return bd;
 }
-EXPORT_SYMBOL(of_find_backlight);
 
 static void devm_backlight_release(void *data)
 {
@@ -702,9 +686,16 @@ static void devm_backlight_release(void *data)
  * devm_of_find_backlight - find backlight for a device
  * @dev: the device
  *
- * Device managed version of of_find_backlight().
- * The reference on the backlight device is automatically
- * dropped on driver detach.
+ * This function looks for a property named 'backlight' on the DT node
+ * connected to @dev and looks up the backlight device.
+ * The lookup is device managed so the reference to the backlight device
+ * is automatically dropped on driver detach.
+ *
+ * Returns:
+ * A pointer to the backlight device if found.
+ * Error pointer -EPROBE_DEFER if the DT property is set, but no backlight
+ * device is found.
+ * NULL if there's no backlight property.
  */
 struct backlight_device *devm_of_find_backlight(struct device *dev)
 {
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 308aec67fa4f..99e7cdace2be 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -494,14 +494,8 @@ of_find_backlight_by_node(struct device_node *node)
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
