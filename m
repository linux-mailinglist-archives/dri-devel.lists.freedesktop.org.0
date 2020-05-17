Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A051D6BFC
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BA86E0FF;
	Sun, 17 May 2020 19:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A086E0FF
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:11 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u15so7540470ljd.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyTJITcxbDoToUmt6gTU2FHs3keUF4hOsb+KMKr7qJs=;
 b=eoE0PhsisEt28HtrVh4X5nCR+AoiL+Q5jLEietNjDvIwlyfUxLXxquwSalpfjJwZ6d
 vKQKIODKuFRZSzXB/NFYX/KoYgJBig42V06iPjcF08/ET9ZrNp1WlTn02taDvrIZ/RH7
 THp9ytiS8zEgaZoUlJsAWkrQb+qQKXMrpGTU36T8GhWL75qeh1wv8/JPtwSrBF/P2YDL
 QcGWvNBNsmM+Tr7wG+aeEUtYvG9j84izjTIJQlCNaeVMRq6eZJP+iIu5Zw8lInLDZ2H3
 IKbX7GLwh9SvtRSkh1nMVAv4Otu1xAbueGQ4ahWgfps7A7oa4TJh4sjohZyLX+wOP/+4
 oh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lyTJITcxbDoToUmt6gTU2FHs3keUF4hOsb+KMKr7qJs=;
 b=Gvr7l0nHUmch3o5t0siFzPr4PEDuxWTNe0YGMj+RTMDNItpPdTUe9V+zF8RAekuIF0
 VyaYGLL7nJ9TplLajj0ZTcId5uVoMSkeb6XoUuWuwv1b+4SI5Mu8tpGwCsIHQj4VRHdY
 Yj/Wgm7iMN/gEsTZ0XXWfwnJy0ZYy5vtxoGWVyptYLa/kUrNoyE7gbW279v9/w7qr2pa
 OZDwRNH7nieEJWca+R9KSXn54gITGrQWFQ1O8cSYL9242vSWaSRbsHeC2DH6bY4aL/5I
 GPyK8NiZjubOYZw7iashSzImNF4zhbm8Wfi/QjE5nlQMPkD7cC0OWbc0tKWWMTpZG3wy
 EPfw==
X-Gm-Message-State: AOAM5312GYNriFlA1YonpeWKuIAjOHzzmGbtItEwYTNwHYoWOf6NfpuB
 UrNgOleLzx0C7ikHve5JjGNGa2085LA=
X-Google-Smtp-Source: ABdhPJwbi9nqxI/Wfee0MxLKNIZNWnQzw01xW5En90ZvR4pUn1myrePBdXE5gGFsHcaY0A3tC6IW4A==
X-Received: by 2002:a2e:9641:: with SMTP id z1mr8313148ljh.201.1589742128521; 
 Sun, 17 May 2020 12:02:08 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:07 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 08/16] backlight: document enums in backlight.h
Date: Sun, 17 May 2020 21:01:31 +0200
Message-Id: <20200517190139.740249-9-sam@ravnborg.org>
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

Add kernel-doc documentation for the backlight enums

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 84 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 98349a2984dc..b779c29142fd 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -14,26 +14,110 @@
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
+	 * @BACKLIGHT_UPDATE_HOTKEY:
+	 *
+	 * The backlight was updated using a hot-key.
+	 */
 	BACKLIGHT_UPDATE_HOTKEY,
+
+	/**
+	 * @BACKLIGHT_UPDATE_SYSFS:
+	 *
+	 * The backlight was updated using sysfs.
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
+	 * The backlight is controlled using hardware registers directly.
+	 */
 	BACKLIGHT_RAW = 1,
+
+	/**
+	 * @BACKLIGHT_PLATFORM:
+	 *
+	 * The backlight is controller using a platform-specific interface.
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
+	 * @BACKLIGHT_REGISTERED:
+	 *
+	 * The backlight device is registered.
+	 */
 	BACKLIGHT_REGISTERED,
+
+	/**
+	 * @BACKLIGHT_UNREGISTERED:
+	 *
+	 * The backlight revice is unregistered.
+	 */
 	BACKLIGHT_UNREGISTERED,
 };
 
+/** enum backlight_scale - the type of scale used for brightness values
+ *
+ * The type of scale used for brightness values.
+ */
 enum backlight_scale {
+	/**
+	 * @BACKLIGHT_SCALE_UNKNOWN:
+	 *
+	 * The scale is unknown.
+	 */
 	BACKLIGHT_SCALE_UNKNOWN = 0,
+
+	/**
+	 * @BACKLIGHT_SCALE_LINEAR:
+	 *
+	 * The scale is linear, so the brigness increase is the same
+	 * when increasing with the same steps (more or less).
+	 */
 	BACKLIGHT_SCALE_LINEAR,
+
+	/**
+	 * @BACKLIGHT_SCALE_NON_LINEAR:
+	 *
+	 * The scale is not linear. This is often used when the brightness
+	 * values tries to adjust to the relative perception of the eye
+	 * demanding a non-linear scale.
+	 */
 	BACKLIGHT_SCALE_NON_LINEAR,
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
