Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468151D6BF7
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D526E0FA;
	Sun, 17 May 2020 19:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DE36E0FB
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u15so7540235ljd.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRf5WUBfqQs/V8w51zkp9QQ7Mmu72mV/gJplPplr/Sc=;
 b=BeOEi5gGXeqqP0dDmjdY/mDJKm9g0mPHZC+M9GxAoPMbaL7Yq56NK1aocMUBf7b2rL
 1upO9us9O8BOMbRKMGxzyXLQTLgpAiuplXHz7fhnpimpttBs5DJPdCJGj5d5ByWkqKib
 Vtufpl54zTg7Hr9bkBYlDU7xVwJ7vsKhlBeh5mCeurlKhWEAH8DH5Rx7giO3xmB3Pauf
 w9olTIj72VTIOvhQBChvTprkHURaqzCMORQUHSk3VHKuefvhCt1nD4ZPfVNmhqHjONPE
 bqaYkH3eRdVdMObRLuAWAHhstNIFWuMlQp17A62KrzNV611vf6grAnGhvYgKj8MSGbzZ
 M2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YRf5WUBfqQs/V8w51zkp9QQ7Mmu72mV/gJplPplr/Sc=;
 b=jq/mPbc8OWekbxpzH7dL06zRbMJehQVd8pZAjzWL89BG731lOcIincIhLnYeVSRIAR
 F2SQSgwMjvXyAHAXiqo0aKX3iV7zCY0A02rNptROMioDfI8zlidIe0qNEUlt4hXmppJ4
 QhKvX7E55H/nCPEM8CzR0dTMj7+JTLf6tu8ht55PaI2Tp3ebsfHWZg81q53ddkZhs0BW
 zORQfXEmZAutDSRV/N414gpkWMzyTKaMhO+dAT5F8Oi67uRU4JBeql3vcBgtF54FgMjU
 KIdYwFyeoFmx02oLfar7pxwEa17fIrvQhTq1Fi/5TX5BSWlCTfZZQw/2bsAYtuYT5NFd
 vkeA==
X-Gm-Message-State: AOAM5325LYQNJsM3cHI23rhy7i9ust+jyV6aw1dE063ZinAbq6xeffjw
 9X/Z26UHVkwmr0OKa1IUEOkIq8biRKI=
X-Google-Smtp-Source: ABdhPJx6pGHL6HHZkTI0jH6tl6NalUG9TNmcHIJNTUkjdiFjEiQZTVGygZjvLWcOL9MU24LoRlwZnQ==
X-Received: by 2002:a2e:8549:: with SMTP id u9mr7758313ljj.24.1589742123210;
 Sun, 17 May 2020 12:02:03 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:02 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 06/16] backlight: improve backlight_device documentation
Date: Sun, 17 May 2020 21:01:29 +0200
Message-Id: <20200517190139.740249-7-sam@ravnborg.org>
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

Improve the documentation for backlight_device and
adapt it to kernel-doc style.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 81 ++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 23 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 7f9cef299d6e..e2d72936bf05 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -14,21 +14,6 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 
-/* Notes on locking:
- *
- * backlight_device->ops_lock is an internal backlight lock protecting the
- * ops pointer and no code outside the core should need to touch it.
- *
- * Access to update_status() is serialised by the update_lock mutex since
- * most drivers seem to need this and historically get it wrong.
- *
- * Most drivers don't need locking on their get_brightness() method.
- * If yours does, you need to implement it in the driver. You can use the
- * update_lock mutex if appropriate.
- *
- * Any other use of the locks below is probably wrong.
- */
-
 enum backlight_update_reason {
 	BACKLIGHT_UPDATE_HOTKEY,
 	BACKLIGHT_UPDATE_SYSFS,
@@ -221,30 +206,80 @@ struct backlight_properties {
 	enum backlight_scale scale;
 };
 
+/**
+ * struct backlight_device - backlight device data
+ *
+ * This structure holds all data required by a backlight device.
+ */
 struct backlight_device {
-	/* Backlight properties */
+	/**
+	 * @props:
+	 *
+	 * Backlight properties
+	 */
 	struct backlight_properties props;
 
-	/* Serialise access to update_status method */
+	/**
+	 * @update_lock:
+	 *
+	 * update_lock is an internal backlight lock that serialise access
+	 * to the update_status() method. The iupdate_lock mutex shall not be used
+	 * by backlight drivers.
+	 */
 	struct mutex update_lock;
 
-	/* This protects the 'ops' field. If 'ops' is NULL, the driver that
-	   registered this device has been unloaded, and if class_get_devdata()
-	   points to something in the body of that driver, it is also invalid. */
+	/**
+	 * @ops_lock:
+	 *
+	 * ops_lock is an internal backlight lock that protects the ops pointer
+	 * and is used around all accesses to ops and when the operations are
+	 * invoked. The mutex shall not be used by backlight drivers.
+	 */
 	struct mutex ops_lock;
+
+	/**
+	 * @ops:
+	 *
+	 * Pointer to the backlight operations. If ops is NULL, the driver that
+	 * registered this device has been unloaded, and if class_get_devdata()
+	 * points to something in the body of that driver, it is also invalid.
+	 */
 	const struct backlight_ops *ops;
 
-	/* The framebuffer notifier block */
+	/**
+	 * @fb_notif:
+	 *
+	 * The framebuffer notifier block
+	 */
 	struct notifier_block fb_notif;
 
-	/* list entry of all registered backlight devices */
+	/**
+	 * @entry:
+	 *
+	 * List entry of all registered backlight devices
+	 */
 	struct list_head entry;
 
+	/**
+	 * @dev:
+	 *
+	 * Parent device.
+	 */
 	struct device dev;
 
-	/* Multiple framebuffers may share one backlight device */
+	/**
+	 * @fb_bl_on:
+	 *
+	 * Multiple fbdev's may share one backlight device. The fb_bl_on
+	 * records the state of the individual fbdev.
+	 */
 	bool fb_bl_on[FB_MAX];
 
+	/**
+	 * @use_count:
+	 *
+	 * The number of uses of fb_bl_on.
+	 */
 	int use_count;
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
