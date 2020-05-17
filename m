Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D01D6BF1
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957736E0F2;
	Sun, 17 May 2020 19:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F1E6E0F2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:01:59 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h188so6119995lfd.7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XV8ji1IDXAzgoqiTjEkmwRFdCjcd4KoRPZRb8vwPSkM=;
 b=CPPI6Nv0NmK6Jgf2qWm7LYYc+OuCbj2lFpHs1PWenFVqPIVubsIY83GZvYfeDuppos
 UkKB3SeT6wmalj7wHr0oN6C1ufkJOkyXOcJqgi8JvXafMrk3IxyVYUBqxIQpxz8M1BRu
 m8uCTaCRadc6URt5l2kNGHcofVYu/BUShyR2qfoPk/5F4JHzLNg2Hy9fS7252RoAuqYv
 mAvgo0uEuHFzYcTcs6oom0VuAihNXBJ7jfkOIP555X56lPxO72xF3KeO2fxuRVY6QiHH
 qzbbyIMyEa1FaULMciY+6rD5k6LCqb1L9z4LhPk6eQmA3GTSvgWlPfUZ1OSAt8aimkDl
 P/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XV8ji1IDXAzgoqiTjEkmwRFdCjcd4KoRPZRb8vwPSkM=;
 b=GGxTPV/c6KwOmOqcHRkSUYcvuReuS0tx4Us7CtrZhBUzYrQ7fFYDEnRZISVvAVeaZl
 Nz7kr7xBlt5upPGVMGM7M3SetpnDBag5pkWakO0yvZg4cBBJhBZ9gH4Pth3P7rN6k8kH
 +GHaA+s1oft5NWSkdk/V9z1+ymtN04BAASpwNlt+jHC5vNrDbDN9NK9NHyRDzseADjdW
 gL/9rrJH7+qcXcgHDelJpvh41Wv03Z+RnXKShzIfrm6myDOwPn4EpTUFPFO9fGReZEnx
 NqSPuPzdkDR+Lfy6wP7VmPZqCNEnSWOoUf23QMOVBClTs1uQ9mHzfG0mEpmpKAZKVYzM
 sNLQ==
X-Gm-Message-State: AOAM532QTMxzSFn1fE7cruLVcFMOfF9i1PAMHzuzD3jZKahulC0LTYx0
 I/1yN1bgd5aacCxWPPf9pegDQybssXM=
X-Google-Smtp-Source: ABdhPJxELt7Vi9287IQwgCidWZHrUTSvjwrWfyZWE3Fzz5jgr5WONsYAndwhLNaQsrNw5sDoIgf/1g==
X-Received: by 2002:a05:6512:3384:: with SMTP id
 h4mr9221349lfg.150.1589742117777; 
 Sun, 17 May 2020 12:01:57 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:01:57 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 04/16] backlight: improve backlight_ops documentation
Date: Sun, 17 May 2020 21:01:27 +0200
Message-Id: <20200517190139.740249-5-sam@ravnborg.org>
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
index a0a083b35c47..519dc61ce7e4 100644
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
