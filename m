Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBF1D6C02
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC556E102;
	Sun, 17 May 2020 19:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0056E102
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:15 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z22so6128791lfd.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ej6ukq+60uPTP3MIHc3/HurH6JGEh6Vx0QT7mCROCYs=;
 b=AuqrU1ueWhxi0LOT8AQ8EKPM60KewpmUdt239G59yuYr3Tx6mulNuq6eboBbLIIz1V
 33ignFrjSIKgpjtvIfdiSg7Pqe681yC0iFvaO+O0YwzVaqnmO8/2GiM7pgdrjjnp2EUJ
 3rEV8ffQWuEdJpTyabljDFq25LYs3SeqGVlJHxGA1hUsmdTd4xhlkiuEzE/BeBmAtY/I
 VuNNU4lbuGRBnkxfigH6eEYXBvx0FmZGIaAowjr4E+t8hqkIOr5S84xQDw+coA6OFbLD
 oUvgbC6hHP/4sk1vF0H8V3iSBJmrIOZkNST812+y5/yycH/XPSMyWernKwtn+iTLlJM4
 hp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ej6ukq+60uPTP3MIHc3/HurH6JGEh6Vx0QT7mCROCYs=;
 b=Zo0kGOD82lmDIlBWxI6Gm0jrhX2hrIM//3/gww5hqWT6WKPFwmrriM6FAUjqpaJ1RC
 D0wpwlCq8egVs3uhXCVryyXwPlqreyjUFHED/e2Wc2U9vNL2yVxks0Y83F5gqZxv50TZ
 I2mQO8tYqlXx2/lJNmchliAqGwCsgpGQvxdkGLBn7mRIIoYYN4r6GxsDg3nDPXq/A/s5
 rRY+b5zupQxw4Fx+KY/nYWwsQacRqFFPuK86diRHL1gFopdtFhpo2cKmWn+0yd697nbA
 kbp3beeQoleS2biUecl/A5bU1/PnYv1+w7o3ahXLoVK686NoGUJu6XgV+U6+XNzD1rEt
 5Hrg==
X-Gm-Message-State: AOAM533RNXNiUYCZ+cj9Dgb4E6iu8tOFmocEttFAlN2DszMLz28DAt5a
 GHzUL6qbIxqE0E5U7iQHjBFiaN2sLnE=
X-Google-Smtp-Source: ABdhPJwxy8XBEDB8HEDtsuefFUzmp0iN6Azy4WO6eudwOO5aKM2R0tejYGT4yHurWN45UzLvMsvYOg==
X-Received: by 2002:ac2:59c3:: with SMTP id x3mr2623468lfn.117.1589742133936; 
 Sun, 17 May 2020 12:02:13 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:13 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 10/16] backlight: drop extern from prototypes
Date: Sun, 17 May 2020 21:01:33 +0200
Message-Id: <20200517190139.740249-11-sam@ravnborg.org>
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

No need to put "extern" in front of prototypes.
While touching the prototypes adjust indent to follow
the kernel style.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index eae7a5e66248..308aec67fa4f 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -444,22 +444,25 @@ static inline bool backlight_is_blank(struct backlight_device *bd)
 	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
 }
 
-extern struct backlight_device *backlight_device_register(const char *name,
-	struct device *dev, void *devdata, const struct backlight_ops *ops,
-	const struct backlight_properties *props);
-extern struct backlight_device *devm_backlight_device_register(
-	struct device *dev, const char *name, struct device *parent,
-	void *devdata, const struct backlight_ops *ops,
-	const struct backlight_properties *props);
-extern void backlight_device_unregister(struct backlight_device *bd);
-extern void devm_backlight_device_unregister(struct device *dev,
-					struct backlight_device *bd);
-extern void backlight_force_update(struct backlight_device *bd,
-				   enum backlight_update_reason reason);
-extern int backlight_register_notifier(struct notifier_block *nb);
-extern int backlight_unregister_notifier(struct notifier_block *nb);
-extern struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
-extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
+struct backlight_device *
+backlight_device_register(const char *name, struct device *dev, void *devdata,
+			  const struct backlight_ops *ops,
+			  const struct backlight_properties *props);
+struct backlight_device *
+devm_backlight_device_register(struct device *dev, const char *name,
+			       struct device *parent, void *devdata,
+			       const struct backlight_ops *ops,
+			       const struct backlight_properties *props);
+void backlight_device_unregister(struct backlight_device *bd);
+void devm_backlight_device_unregister(struct device *dev,
+				      struct backlight_device *bd);
+void backlight_force_update(struct backlight_device *bd,
+			    enum backlight_update_reason reason);
+int backlight_register_notifier(struct notifier_block *nb);
+int backlight_unregister_notifier(struct notifier_block *nb);
+struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
+int backlight_device_set_brightness(struct backlight_device *bd,
+				    unsigned long brightness);
 
 #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
