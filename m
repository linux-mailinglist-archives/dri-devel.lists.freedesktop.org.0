Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92F213F71
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948596EB98;
	Fri,  3 Jul 2020 18:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43BB6EB95
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:10 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d21so19026118lfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IVQg6N9Y7IT+7TfYzwS4f6zi+ddclNT7W4+DeE2wDo=;
 b=NN0cF9PcXBtt5ay+WTZ71waV5oPagPhgRWuVg7vbghnZ6i5YM5Re+IGejakQTtnmpm
 1t0DuQJ4FdwcWhZxHPKkInyIhxys8OAYMv+vJ7eISf33Oy3E41Big2T+T41oXJyRX1eB
 JktCqfQoZtFje5t/bocmLZNm6vE4XrNISrS55nH3VlIktDKm1/+pDCA03NOhvcoj/7KV
 Cp8bHHRMdWehBhYbjpM9LC/Rgpi0zF8dayMGJK0zURWeBVAQIS8za2L9hxBLT8iFD/oI
 c5SXHtPHIAprvz+8WQh/Whch7xVPggIpuMQh9LFsRhS4EY/DOiayCWxuVIcV9O5UMLN6
 Mpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7IVQg6N9Y7IT+7TfYzwS4f6zi+ddclNT7W4+DeE2wDo=;
 b=LF5cZYkVhMvYYO5JwqvxC/t5njnuAgf8FKz5cOEA/OXes00BdWYywI+iTfB7tU4XPP
 luHP1c7eYN7d8VHzEbOFr0iIghE0cAzCcZAzErObJZl+v1V6KmZITYq2G1kHzz9FCJiD
 QSQxzSRjXiYTcYL0VzkBQFyqpFxCLsKqKqVd0oLVxbMWi1J0mBfeDBysEcqjK5w0dOxg
 WjywJVQgzvGcbhLLx+rrYhLVfovzamDP6ounM7+leIJ2ooF4XzndEPn06oFLpy5VDUY+
 t5GgLjGVsmBZJNvLGAXCJP6DppYdG8JUPmMVCrKTFE6jtSSbnN5ssxyYq5/65Ad+6kqI
 7OZA==
X-Gm-Message-State: AOAM531A0/86HWhbRIquCP0Y/7Y7+kL5L2dIGwQLttGHCRE9s0voa8BA
 22ZUEmF6xmCRPDkNODZVRP342J3z0xo=
X-Google-Smtp-Source: ABdhPJzceajSEflpyNDbvmbQ5SE9lYyuwdyQ3ujHp2eBq+Gvz2qzAiPY5DvHTg24oWc7pxGMT9Y9hA==
X-Received: by 2002:ac2:508d:: with SMTP id f13mr8858766lfm.65.1593801968942; 
 Fri, 03 Jul 2020 11:46:08 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:08 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 03/20] backlight: improve backlight_ops documentation
Date: Fri,  3 Jul 2020 20:45:29 +0200
Message-Id: <20200703184546.144664-4-sam@ravnborg.org>
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

Improve the documentation for backlight_ops and
adapt it to kernel-doc style.

v2:
  - Add intro for each field (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 59 +++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 56e51ebab740..dfb43ee02ea0 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -55,19 +55,66 @@ enum backlight_scale {
 struct backlight_device;
 struct fb_info;
 
+/**
+ * struct backlight_ops - backlight operations
+ *
+ * The backlight operations are specifed when the backlight device is registered.
+ */
 struct backlight_ops {
+	/**
+	 * @options: Configure how operations are called from the core.
+	 *
+	 * The options parameter is used to adjust the behaviour of the core.
+	 * Set BL_CORE_SUSPENDRESUME to get the update_status() operation called
+	 * upon suspend and resume.
+	 */
 	unsigned int options;
 
 #define BL_CORE_SUSPENDRESUME	(1 << 0)
 
-	/* Notify the backlight driver some property has changed */
+	/**
+	 * @update_status: Operation called when properties have changed.
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
+	 * @get_brightness: Return the current backlight brightness.
+	 *
+	 * The driver may implement this as a readback from the HW.
+	 * This operation is optional and if not present then the current
+	 * brightness property value is used.
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
+	 * @check_fb: Check the framebuffer device.
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
