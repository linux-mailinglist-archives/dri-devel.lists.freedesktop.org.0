Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D622509C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4CC89FA6;
	Sun, 19 Jul 2020 08:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6889C89FA6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:10 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f5so17026146ljj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbqgxv/h5SeSHOXMolpp1BPamIvzkqESgLDvhPwqMhU=;
 b=FeXCC5uWIx+xcOi69FiCd1WNxp1c/0jhf4TeSjclL5MQ77bSEs6eYcrjtY3c5MC2Kd
 pXnWznTPbn1EC8xVG2HU9EqNJHM7HiZ7QY10MsYNw05o+K3H+g426JRiY2HJMomejE05
 iknc8vjgLAXT9POoZMjTVAAqfs5H4ARBf8CJKejX7PxYmW92/4TWwbTtiu8DXMtrfxqc
 aj5eHo0ic5j/N+HCl+zgtVeGL7vcQroTB8o1+bHOZndpn+y3YdaLyW1GzDBKzupjA9oj
 axFgVOOEew7dJ/Uz0JNPWu1rv9a3MhJxNILabroCh+Zs8LIhuYrTktu6ljiNwd8+kp+C
 ekVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nbqgxv/h5SeSHOXMolpp1BPamIvzkqESgLDvhPwqMhU=;
 b=e4Z6C9yXGsi2Al952hr3+IrObIq69Eydf/S7rucmDApUV3GjaQ20Cu6RLnuSeZmE8m
 m556VXRGIoZWpdqHLKe3GwyrWt6WuUrXqhh7qkQPnu7T9z6iVedTKZTwIoIexI+6ru8z
 XeJtZ4PX59Tj+zLQBwepUK36+TqSXf5uJ1AiEBNNtBu759nPfsF+o/6FM49BRovnNj6w
 7Ya+zrV/ZwNGu3k4dLl0GqkSl6LM27f/1gjOs+CghOT4imPzYdmKPbuhd6B+Kk94qdOF
 +PyBGdd6UALuJojT50FTWDSlZ7oCBGyNP4ZeKByyfJA9ns0C9OpPk/02t/9F0Kc8QJsc
 z75Q==
X-Gm-Message-State: AOAM5339JXs8wH7PzMtdkeug9YB2vp+RtoQDnmE2FxNlcDcDdEJ2ZwXD
 KB97l4C40FbpnHiOlv63tQIPCa5YGdo=
X-Google-Smtp-Source: ABdhPJyNcZ5EJA4eLpDENaVjpjfmWTUn7NaB1GxtAlwE27Hcf1R33YPb6lzXpJNzB9cCUKkhmuZ2AQ==
X-Received: by 2002:a2e:9cc2:: with SMTP id g2mr7060773ljj.442.1595146088632; 
 Sun, 19 Jul 2020 01:08:08 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:08 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 04/19] backlight: improve backlight_properties documentation
Date: Sun, 19 Jul 2020 10:07:28 +0200
Message-Id: <20200719080743.8560-5-sam@ravnborg.org>
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

Improve the documentation for backlight_properties and
adapt it to kernel-doc style.

v3:
  - Added missing '@' in kernel-doc

v2:
  - Added into for each field (Daniel)
  - Re-written some parts to explain what to do, rather
    than what not to do.
    Partly based on suggestions from the review (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 96 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 11 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index dfb43ee02ea0..10518b00b059 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -117,28 +117,102 @@ struct backlight_ops {
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
+	 * @brightness: The current brightness requested by the user.
+	 *
+	 * The backlight core makes sure the range is (0 to max_brightness)
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
+	 * @max_brightness: The maximum brightness value.
+	 *
+	 * This value must be set in the backlight_properties passed to
+	 * devm_backlight_device_register() and shall not be modified by the
+	 * driver after registration.
+	 */
 	int max_brightness;
-	/* Current FB Power mode (0: full on, 1..3: power saving
-	   modes; 4: full off), see FB_BLANK_XXX */
+
+	/**
+	 * @power: The current power mode.
+	 *
+	 * User space can configure the power mode using the sysfs
+	 * attribute: /sys/class/backlight/<backlight>/bl_power
+	 * When the power property is updated update_status() is called.
+	 *
+	 * The possible values are: (0: full on, 1 to 3: power saving
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
+	 * @fb_blank: The power state from the FBIOBLANK ioclt.
+	 *
+	 * When the FBIOBLANK ioctl is called @fb_blank is set to the
+	 * blank parameter and the update_status() operation is called.
+	 *
+	 * When the backlight device is enabled @fb_blank is set
+	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
+	 * @fb_blank is set to FB_BLANK_POWERDOWN.
+	 *
+	 * Backlight drivers should avoid using this property. It has been
+	 * replaced by state & BL_CORE_FBLANK (although most drivers should
+	 * use backlight_is_blank() as the preferred means to get the blank
+	 * state).
+	 *
+	 * fb_blank is deprecated and will be removed.
+	 */
 	int fb_blank;
-	/* Backlight type */
+
+	/**
+	 * @type: The type of backlight supported.
+	 *
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
+	 * @state: The state of the backlight core.
+	 *
+	 * The state is a bitmask. BL_CORE_FBBLANK is set when the display
+	 * is expected to be blank. BL_CORE_SUSPENDED is set when the
+	 * driver is suspended.
+	 *
+	 * backlight drivers are excpected to use backlight_is_blank()
+	 * in their update_status() operation rather than reading the
+	 * state property.
+	 *
+	 * The state is maintained by the core and drivers may not modify it.
+	 */
 	unsigned int state;
-	/* Type of the brightness scale (linear, non-linear, ...) */
-	enum backlight_scale scale;
 
 #define BL_CORE_SUSPENDED	(1 << 0)	/* backlight is suspended */
 #define BL_CORE_FBBLANK		(1 << 1)	/* backlight is under an fb blank event */
 
+	/**
+	 * @scale: The type of the brightness scale.
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
