Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C251D3C1A
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196DF6EBB3;
	Thu, 14 May 2020 19:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45326EBB2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:38 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 82so2080447lfh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DU9BwH5P6JpnKqtdKJ6tqvGSR4Gzunk38snlPE5mOfk=;
 b=cidQOtSQ/2cvmUi149fw0puJ03Rou6Ou3yGl+kps97oZSBOHCqwFqaes1QXK3q8lyp
 nuNk+dbzYSoQnX0F061oC5j8HDGQMuhdkqoGoW5xJRX7nSw4D7x3xrkn2nQ6n0Q5alqw
 3OIhhmAT0SN4V5SN4/GC5TQB/rkJoq/XopbU5UVXTu+cslDxLjZrlYueolViXrKKoDuL
 hGR8uCjg/ypoQS423tRoCcD9K6DMisYG8T3KxVUT7cYp51U+T5ESQcye8Fk4dOAmBxY3
 AdmEJy3Ek/x0/cQeAG4aac5OJNc/0Dt8HtN5BORz4zNyQQoICTlTjf/Jdk8qw/8j1R1T
 zT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DU9BwH5P6JpnKqtdKJ6tqvGSR4Gzunk38snlPE5mOfk=;
 b=QjWyLfeJqQwcdHf8qEFT5ehkFG9Lm+/1CGHTZ55ICjgNz8xFEgYXi6PoNQ8n5Mx7Ti
 ztJkeMXhEwmlmtLWrQoau0I2fXaSIo6qjc9BOJdAYnjkL0uMGsgrhe+XDE3M8H4KgAHJ
 YwhDo+gnUtsHULyQCNGugYvkI4un2l5Dgqa4zyXQRQkAKoqUk8Ng1rzk3ibYBZ5FvWCQ
 Ic8XmjM+CYZo8sBR8ay819j1s8grgiUDht0i02QZpe5aUlJXVtro9/t+sk0rM44MyfAZ
 MdxMvqhSwXYgO3+nZzsUzbsvqEALR4iFWOUxs4uA5UNl74OdeY0EeUq3gc2HAXPShDjS
 c4/w==
X-Gm-Message-State: AOAM532FwnEvaMy6IqgLGV5OPn056jKhMAYqhklLfkCWRUWftX0r5JIG
 OPNIvXrHV+hGtF9bbEd/uZ9VyYWTWJNobw==
X-Google-Smtp-Source: ABdhPJzMUI3wXjuWNAVuLeVxiJIQ+xHYSiwpRZJ0PPAitpNM8uo7AAQUzfKu+agdL1tLH8/i1w/U2A==
X-Received: by 2002:a19:c04:: with SMTP id 4mr3990355lfm.17.1589483436799;
 Thu, 14 May 2020 12:10:36 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 10/18] backlight: improve backlight_properties documentation
Date: Thu, 14 May 2020 21:09:53 +0200
Message-Id: <20200514191001.457441-11-sam@ravnborg.org>
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
index 51f0d0abea25..c81b77af44d4 100644
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
