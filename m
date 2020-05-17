Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D61D6BF4
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5086E0F5;
	Sun, 17 May 2020 19:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A866E0F5
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:02 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h26so6112859lfg.6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OyaYsRmUmiUCUJvfITROQWLR97jO+0C0lYl9AH4WQU=;
 b=sd5HbQvPYXGthPeXNT11+XC5IhL8tbrEv/tlpWGQWuboEtz8ooQZ/w/i2X1nXpuJ/w
 r3uus8JDr37mS9l1TO2Tzf/YwFvPIJuZFBnCr3y3xtQjnPHuhEZ7vrX4TYRV5L4uJKqW
 14kVX8mzHfgNDFkFSlhM8tG1sadfn0FZkdsWfhVVoMkXz2A8OtsVK7e92kP7sVxcnUEj
 KpnUYTqobTSk1CHA4yhFpmRk9IdPJyrHJVd+pm2rLfAKtmS/wJ1fN1Bz0RXPOeoxz8F9
 LY42Vc24W2BShHMZV9aiWEB0yYP1dwTphg+nrJYvhe7DwG0YkWeylaLBD3ZCqJ87Ow0G
 JC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2OyaYsRmUmiUCUJvfITROQWLR97jO+0C0lYl9AH4WQU=;
 b=imB7yi2JcGOQTj2qgmBez3Qpuk2tqtZmndYndMqbIckhb4GvhoWcmOttHi0W1Zpbd9
 rvGjPj0hIrLHcNZ+Ai3XOJJ0y701NBZXyfQo76507ppvkwK8R3Wwkf6pqpG6tzXbEmyx
 4aMyzIdTPmwMLiB28Ke0x6cUpYRJ+D93/r4kqwQnM07oN+X1AQQHljTRUjYlMd3HLJvl
 5MzQI3T92bJXtywGuZEFA+Y5RWZKwgMC8oXEvGVMwdf/4VAi4X1v3qs/roDNd6zI0/hx
 /3n7iOxkb1eMYmQm+OLdRZwXdBNHsMBV+hvg60nmrfFSpBIG7usWdo1cfhtsVddH+LO2
 +iuQ==
X-Gm-Message-State: AOAM530l/T2dD0qvaOzUX4yNE86BxIRhR1dz/vYyIVVx7CF4N8UF+lX7
 OW7aC6QRj+GEJHI9Uu801MgG4VbjgPc=
X-Google-Smtp-Source: ABdhPJwtH/nrY4fYZN9bngE/KOq8tn+zlHFgPBjISYbmUybw4qvIbTRjRsnxPXL0IdqN9jk3hvN7iw==
X-Received: by 2002:a05:6512:3082:: with SMTP id
 z2mr9189578lfd.32.1589742120583; 
 Sun, 17 May 2020 12:02:00 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:00 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 05/16] backlight: improve backlight_properties documentation
Date: Sun, 17 May 2020 21:01:28 +0200
Message-Id: <20200517190139.740249-6-sam@ravnborg.org>
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

Improve the documentation for backlight_properties and
adapt it to kernel-doc style.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 101 +++++++++++++++++++++++++++++++++-----
 1 file changed, 90 insertions(+), 11 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 519dc61ce7e4..7f9cef299d6e 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -118,28 +118,107 @@ struct backlight_ops {
 	int (*check_fb)(struct backlight_device *bd, struct fb_info *info);
 };
 
-/* This structure defines all the properties of a backlight */
+/**
+ * struct backlight_properties - backlight properties
+ *
+ * This structure defines all the properties of a backlight.
+ */
 struct backlight_properties {
-	/* Current User requested brightness (0 - max_brightness) */
+	/**
+	 * @brightness:
+	 *
+	 * The current requested brightness by the user.
+	 * The backlight core makes sure the range is (0 - max_brightness)
+	 * when the brightness is set via the sysfs attribute:
+	 * /sys/class/backlight/<backlight>/brightness.
+	 *
+	 * This value can be set in the backlight_properties passed
+	 * to devm_backlight_device_register() to set a default brightness
+	 * value.
+	 */
 	int brightness;
-	/* Maximal value for brightness (read-only) */
+
+	/**
+	 * @max_brightness:
+	 *
+	 * The maximum brightness value.
+	 *
+	 * This value must be set in the backlight_properties passed
+	 * to devm_backlight_device_register().
+	 *
+	 * This property must not be modified by a driver except
+	 * before registering the backlight device as explained above.
+	 */
 	int max_brightness;
-	/* Current FB Power mode (0: full on, 1..3: power saving
-	   modes; 4: full off), see FB_BLANK_XXX */
+
+	/**
+	 * @power:
+	 *
+	 * The current power mode. User space configure the power mode using
+	 * the sysfs attribute: /sys/class/backlight/<backlight>/bl_power
+	 * When the power property is updated update_status() is called.
+	 *
+	 * The possible values are: (0: full on, 1..3: power saving
+	 * modes; 4: full off), see FB_BLANK_XXX.
+	 *
+	 * When the backlight device is enabled @power is set
+	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
+	 * @power is set to FB_BLANK_POWERDOWN.
+	 */
 	int power;
-	/* FB Blanking active? (values as for power) */
-	/* Due to be removed, please use (state & BL_CORE_FBBLANK) */
+
+	/**
+	 * @fb_blank:
+	 *
+	 * When the FBIOBLANK ioctl is called fb_blank is set to the
+	 * blank parameter and the update_status() operation is called.
+	 *
+	 * When the backlight device is enabled @fb_blank is set
+	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
+	 * @fb_blank is set to FB_BLANK_POWERDOWN.
+	 *
+	 * This property must not be modified by a driver.
+	 * The backlight driver shall never read this variable,
+	 * as the necessary info is avaialble via the state.
+	 *
+	 * fb_blank is deprecated and will be removed.
+	 */
 	int fb_blank;
-	/* Backlight type */
+
+	/**
+	 * @type:
+	 *
+	 * The type of backlight supported.
+	 * The backlight type allows userspace to make appropriate
+	 * policy desicions based on the backlight type.
+	 *
+	 * This value must be set in the backlight_properties
+	 * passed to devm_backlight_device_register().
+	 */
 	enum backlight_type type;
-	/* Flags used to signal drivers of state changes */
+
+	/**
+	 * @state:
+	 *
+	 * The state property is used to inform drivers of state changes
+	 * when the update_status() operation is called.
+	 * The state is a bitmask. BL_CORE_FBBLANK is set when the display
+	 * is expected to be blank. BL_CORE_SUSPENDED is set when the
+	 * driver is suspended.
+	 *
+	 * This property must not be modified by a driver.
+	 */
 	unsigned int state;
-	/* Type of the brightness scale (linear, non-linear, ...) */
-	enum backlight_scale scale;
 
 #define BL_CORE_SUSPENDED	(1 << 0)	/* backlight is suspended */
 #define BL_CORE_FBBLANK		(1 << 1)	/* backlight is under an fb blank event */
 
+	/**
+	 * @scale:
+	 *
+	 * The type of the brightness scale (linear, non-linear, ...)
+	 */
+	enum backlight_scale scale;
 };
 
 struct backlight_device {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
