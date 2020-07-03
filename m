Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F5213F7B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD016EB9C;
	Fri,  3 Jul 2020 18:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97EE6EB9C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:18 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u25so19059451lfm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vYmiCB0MtpvvbRewOLH7Fp+n6izpRPTScgvaYJf2yds=;
 b=oqlozcFWehIysU86i5aW350PmfFrB7Ra6isNeLOds2GK3ZvMtIbcb8V7a6Nu9BAOfh
 HDZ5zc/BsZ2NkN+tQ+IcbtTiHEmghORPoE1t/GJBgr5Eec7J03qDdSVkjBR0QunAIrQW
 l6EC7yv12PfmCpcmAeB3G1UfNFSXmdciCV3w8f+9vHwtgu2ixi+O9fsYxLTbuIoDrWNM
 M+6oSKwMMWe1cKaWKMQRj3I6w5Fgs4lwkIuU9E2ggfKh6fNe1AXRL5dwJDbGvZTnkb4U
 j/NJWIG21fTGVtGrtPV0oy2vmvAh7TgF9MghMs8S54emllM+WBbis+OyhrFMK5hqMTkg
 +A5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vYmiCB0MtpvvbRewOLH7Fp+n6izpRPTScgvaYJf2yds=;
 b=lwO0TPv61lLGvIX6mJovFkJZ9rp6caVD/1mZUdIk/qTiJF6aI/dGwIpEjD5vN3c/UQ
 dOrKffoKml9oAUHoo73Kb6m4sNuXBsvWlbEd1+tuJpBxSRk0fNAdPS1BLc7Xg/T4sYXs
 wk2ocLVROlob4JNxQx9/D76bQcqbGz6PNPvsYRzXBEhzZUqcXRTJYhRstk1+yHlP2VkX
 dK81iz6OrbLzTFK/V6U/JKRew0PxKAjjhOoE2I8EgcGmbFB2m8XCeNrWu/bX8M77WUae
 kvzAw2YATxkn0LUP3vbP6y6xDEMxHHTQW5Ms/BJzxD/X1TgZ6sm8Gs2twXLfbwPU7p5u
 f2Ig==
X-Gm-Message-State: AOAM533TjXrajG90k+nL+0C0+rg/SsKK9aegfvKdKl9rZj0MJft8QFU/
 izX+8PiHtOl+2D3BXR0uy16aCj027Fw=
X-Google-Smtp-Source: ABdhPJzzse2Tcvz14qq7VJIffxIIsoOKapJx3DrpiEf2jHlq+xTMPZVqx19W0DYg0TKZm/6G4csY3g==
X-Received: by 2002:a19:3f42:: with SMTP id m63mr22876684lfa.104.1593801977166; 
 Fri, 03 Jul 2020 11:46:17 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:16 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 07/20] backlight: document enums in backlight.h
Date: Fri,  3 Jul 2020 20:45:33 +0200
Message-Id: <20200703184546.144664-8-sam@ravnborg.org>
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

Add kernel-doc documentation for the backlight enums

v2:
  - Add intro to each enum member (Daniel)
    Except backlight type as line lenght was too long.
    The generated HTML is the same.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 72 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 7d6cb61e10f5..0f425b32e6be 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -14,26 +14,98 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 
+/**
+ * enum backlight_update_reason - what method was used to update backlight
+ *
+ * A driver indicates the method (reason) used for updating the backlight
+ * when calling backlight_force_update().
+ */
 enum backlight_update_reason {
+	/**
+	 * @BACKLIGHT_UPDATE_HOTKEY: The backlight was updated using a hot-key.
+	 */
 	BACKLIGHT_UPDATE_HOTKEY,
+
+	/**
+	 * @BACKLIGHT_UPDATE_SYSFS: The backlight was updated using sysfs.
+	 */
 	BACKLIGHT_UPDATE_SYSFS,
 };
 
+/**
+ * enum backlight_type - the type of backlight control
+ *
+ * The type of interface used to control the backlight.
+ */
 enum backlight_type {
+	/**
+	 * @BACKLIGHT_RAW:
+	 *
+	 * The backlight is controlled using hardware registers.
+	 */
 	BACKLIGHT_RAW = 1,
+
+	/**
+	 * @BACKLIGHT_PLATFORM:
+	 *
+	 * The backlight is controlled using a platform-specific interface.
+	 */
 	BACKLIGHT_PLATFORM,
+
+	/**
+	 * @BACKLIGHT_FIRMWARE:
+	 *
+	 * The backlight is controlled using a standard firmware interface.
+	 */
 	BACKLIGHT_FIRMWARE,
+
+	/**
+	 * @BACKLIGHT_TYPE_MAX: Number of entries.
+	 */
 	BACKLIGHT_TYPE_MAX,
 };
 
+/**
+ * enum backlight_notification - the type of notification
+ *
+ * The notifications that is used for notification sent to the receiver
+ * that registered notifications using backlight_register_notifier().
+ */
 enum backlight_notification {
+	/**
+	 * @BACKLIGHT_REGISTERED: The backlight device is registered.
+	 */
 	BACKLIGHT_REGISTERED,
+
+	/**
+	 * @BACKLIGHT_UNREGISTERED: The backlight revice is unregistered.
+	 */
 	BACKLIGHT_UNREGISTERED,
 };
 
+/** enum backlight_scale - the type of scale used for brightness values
+ *
+ * The type of scale used for brightness values.
+ */
 enum backlight_scale {
+	/**
+	 * @BACKLIGHT_SCALE_UNKNOWN: The scale is unknown.
+	 */
 	BACKLIGHT_SCALE_UNKNOWN = 0,
+
+	/**
+	 * @BACKLIGHT_SCALE_LINEAR: The scale is linear.
+	 *
+	 * The linear scale will increase brightness the same for each step.
+	 */
 	BACKLIGHT_SCALE_LINEAR,
+
+	/**
+	 * @BACKLIGHT_SCALE_NON_LINEAR: The scale is not linear.
+	 *
+	 * This is often used when the brightness values tries to adjust to
+	 * the relative perception of the eye demanding a non-linear scale.
+	 */
 	BACKLIGHT_SCALE_NON_LINEAR,
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
