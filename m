Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6CD1D3C1B
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E8E6EBB2;
	Thu, 14 May 2020 19:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56766EBB2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r17so3583934lff.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62dugcWsovCeCskk/LKWdY/i7tcZK4WDkmw+PPDUYp0=;
 b=hmEzwt90DZ7x99DPyRV6/hvrG2vuVWtFc62KnUO3UBwXxpBa4RO+CO0Yd4cwPS1GPU
 PsZhmR/YGuJbKV1hs5Ah0j2oll5bCnbp+SJLk4CiL76I9JpIYfKvDGXMs410dHKyLFVV
 2QFgL0oKBOSbKK5nfGLrWpfz1AzvNAuWO2G7nlYD1KwjaqZd6efLZLTcWEg6kdCXkq/y
 d08f96AQ7fGekUXvVfIVuvX7qjp3qfJaEa7Nry04lPM8p5aJDuJJoZAX19OX4qydbEH3
 ewBrwT57tPyR9qdrYGwCDHi59X+F8Z/b5cpdzF83DmfGG6VIgbzDjX0u/NH0SbSfxZP5
 d1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=62dugcWsovCeCskk/LKWdY/i7tcZK4WDkmw+PPDUYp0=;
 b=ijkQ2U5U1ye1lUCw0Ihd5htwr/dyVfFSlOSum/4HQqIoqynv9+ly3AN6Y2L3Cdb5/t
 sdrVwJyhC5N1bvPzqY46tv/viHlYTQfZo3tg+1kb72yCDNXJkbC1DAR5EncIYQC1NxtE
 uFqfePn8ACqVfbITkACM+dJrkSg6qf6xIIa3yGmPKK0MOxnXqVsPpc8qc0SX0Doejx4k
 kS0Uedl8G8SGdahACw8aTjzIaZrAxa9fh5xoTHiOzug7OynTwLgfICT66jMLU06gSdKX
 1py+JNPes5eHGfHh2c1woUnmjtiq8HmQ4bfZmSpnvxhE/tPsQymzMtB5IqVd6vUhFmxX
 lPiA==
X-Gm-Message-State: AOAM533PPg8b8af3tmuHWrqbmlAq5qF37GCB+FVAKUdckazZS6yN+Wki
 Wv7Oy4vjZY/7KPw1LGlp88QbRkAB/n9Q+Q==
X-Google-Smtp-Source: ABdhPJw+1WHsEHe6VbX3gtcUnN10QNwuwD64Zx0hRMjc16fHurTG/QV6aCvAhZrWJ1MOCzc4ALaROA==
X-Received: by 2002:ac2:4da1:: with SMTP id h1mr4242794lfe.152.1589483434518; 
 Thu, 14 May 2020 12:10:34 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 09/18] backlight: improve backlight_ops documentation
Date: Thu, 14 May 2020 21:09:52 +0200
Message-Id: <20200514191001.457441-10-sam@ravnborg.org>
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

Improve the documentation for backlight_ops and
adapt it to kernel-doc style.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 60 +++++++++++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index e67e926de1e2..51f0d0abea25 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -55,19 +55,67 @@ enum backlight_scale {
 struct backlight_device;
 struct fb_info;
 
+/**
+ * struct backlight_ops - backlight operations
+ *
+ * The backlight operations are specifed when the backlight device is registered.
+ */
 struct backlight_ops {
+	/**
+	 * @options:
+	 *
+	 * The options parameter is used to adjust the behaviour of the core.
+	 * Set BL_CORE_SUSPENDRESUME to get the update_status() operation called
+	 * upon suspend and resume.
+	 */
 	unsigned int options;
 
 #define BL_CORE_SUSPENDRESUME	(1 << 0)
 
-	/* Notify the backlight driver some property has changed */
+	/**
+	 * @update_status:
+	 *
+	 * Notify the backlight driver some property has changed.
+	 * The update_status operation is protected by the update_lock.
+	 *
+	 * The backlight driver is expected to use backlight_is_blank()
+	 * to check if the display is blanked and set brightness accordingly.
+	 * update_status() is called when any of the properties has changed.
+	 *
+	 * RETURNS:
+	 *
+	 * 0 on sucees, negative error code if any failure occured.
+	 */
 	int (*update_status)(struct backlight_device *);
-	/* Return the current backlight brightness (accounting for power,
-	   fb_blank etc.) */
+
+	/**
+	 * @get_brightness:
+	 *
+	 * Return the current backlight brightness.
+	 * The driver may implement this as a readback from the HW.
+	 * This operation is optional and if not present then the current brightness
+	 * property value is used.
+	 *
+	 * RETURNS:
+	 *
+	 * A brightness value which is 0 or a positive numer.
+	 * On failure a negative error code is returned.
+	 */
 	int (*get_brightness)(struct backlight_device *);
-	/* Check if given framebuffer device is the one bound to this backlight;
-	   return 0 if not, !=0 if it is. If NULL, backlight always matches the fb. */
-	int (*check_fb)(struct backlight_device *, struct fb_info *);
+
+	/**
+	 * @check_fb:
+	 *
+	 * Check if given framebuffer device is the one bound to this backlight.
+	 * This operation is optional and if not implemented it is assumed that the
+	 * fbdev is always the one bound to the backlight.
+	 *
+	 * RETURNS:
+	 *
+	 * If info is NULL or the info matches the fbdev bound to the backlight return true.
+	 * If info does not match the fbdev bound to the backlight return false.
+	 */
+	int (*check_fb)(struct backlight_device *bd, struct fb_info *info);
 };
 
 /* This structure defines all the properties of a backlight */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
