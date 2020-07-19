Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07032250AB
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A8D6E4DE;
	Sun, 19 Jul 2020 08:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96C889BF0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:14 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y18so8160217lfh.11
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vYmiCB0MtpvvbRewOLH7Fp+n6izpRPTScgvaYJf2yds=;
 b=rTe9EDHIqjM1Y00rFLXvWizwbnluID02ic9eaNLptmDFg1+P+fR85RzF9W3iqnSjrp
 rCAolR1X67UJVyrkwypTtwh1c+lvqmS/8tRTQiqnBh4P+84UR3qzXt1GIpuVHM59GbIC
 Odgy2JF9olhe400rEGFfSokVU0Gwga/Np+PPRwYPcd9r4JJkw7a2/plpVdnw4W0+r998
 TiJLttDKR2aUOK8450vjW2R+KtW1jsrP2+brgSikBVG3kz/iIwiWmnhsHTVOgReqHPv4
 s1MJgRYy2lERhU62sGp4Zw7iVSlo9iFz4fa/ppCcRNjkCDoOpAf31wI+t04ksGEtt96p
 eYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vYmiCB0MtpvvbRewOLH7Fp+n6izpRPTScgvaYJf2yds=;
 b=fI+7OcQA5IZFS4YwvpQBUmA4AYiY+wPp2j6m0GnZs5Elkxg/0jzXIe2LpWW5SRK/PS
 geN1hlE3frFS4HTRHilDdjQCnLJOD3yBl5Eiq5sLZhS9VrmIz6zoIfZl3qgAGNE6v4Z2
 XqqW0WUNPk8xjEuXIzYasuYymmgxD5dpGArIhomnlb46VXtxqTgPGA5GcCpDIkvGerIN
 seN+cL/yhpPJYSxgxOuGuHCM+aMOiFrVulxCwPkNZGGTeR8y1khmw6FDQskAZWQQ9DMD
 V9e8tDhrBLa1ps2Ez6mMOOAtZ95wd2rFPg1StxW/8/PimEhPInRJAALUw+QRfmLU4xq7
 ShJA==
X-Gm-Message-State: AOAM533Gh9dhR8YGJdUhcelkqfPNj98vASJQXGJq2PvUMqX3FFuUcaBt
 oF0Jp0Rws/KL7bb3omMgKkfavt54VrU=
X-Google-Smtp-Source: ABdhPJy5cVGtNAuiTzKiKirU3wZgRjcJT9PYjTM+yqqzPVpq8sqJDG+GwWU81AtzClvSAXr+4RCc3A==
X-Received: by 2002:a05:6512:1105:: with SMTP id
 l5mr8207304lfg.76.1595146092914; 
 Sun, 19 Jul 2020 01:08:12 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:12 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 07/19] backlight: document enums in backlight.h
Date: Sun, 19 Jul 2020 10:07:31 +0200
Message-Id: <20200719080743.8560-8-sam@ravnborg.org>
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
