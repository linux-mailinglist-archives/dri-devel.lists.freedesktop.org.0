Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62736213F80
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB1C6EB9F;
	Fri,  3 Jul 2020 18:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7396EB9F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:23 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q4so2358923lji.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMIhGECQ39mxsFBNf2RZfIR0vNjqITM52PNfMW2B2fM=;
 b=CQPQFiOfJOvQsfgdhUU3Zl+ZYMCyX8a6t2TCYHjiTn6hqmlUvooqT7C30hg6ilj/ek
 k1a0AXbEzGYW10pu8eooF8kgdF1CTZ/euzASPYmGbZgDrcktTg/pO5GESva7pwfIpTxt
 gEUZgTaRdy+zoJempzZdVNW3CYj8DaVYqdLVJ/rWvECgL6q2WMDFJ+tUNMCKNIBexq2a
 305I0tMVL0ZTOvJY3VPdnWpIOaRV9J2Xcx0eN044vqLbVuZqEISB6ezM9UtTfqWCiH9r
 sbsnuvI0P66OmceZ0X8mTW+f9kB3GY60oUECWOQlPaGT9PDQ7jmpFBAwVfmsmQgsn6CJ
 5VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QMIhGECQ39mxsFBNf2RZfIR0vNjqITM52PNfMW2B2fM=;
 b=eSUThK6X9l+1S5BVF3Z5SiA9bEXHCoJgudSRjEYQorTj8Mnk1abz1XlhVD0M0yYdlK
 8FoxpbheK1M4m0G1/7Qp8GXB+Rc+G8ogH685wxyGUtFJPKS2ahixZYgrq5QJgdJNq5nG
 LvQ9z9ILohj8IjuSKjmq+pCTy3xco7UI0wCL4IPoOKWAOc+zHrHy+rBCAOaL6oBVlbGS
 sLv3dTiTF7ev3j647U+ep8gDDzKvutPh9/2NDo0UzBM5+3Z0KVZNnMFNYBUGaz+q4wHa
 qQp5uC9E8/zLSsq+cReSRq/ehS0rTqPg0JSxWMkxiIPKsJWmTSejCVgGNDtyfyV2csRh
 l9MQ==
X-Gm-Message-State: AOAM531uwXKsxrlGGiP1+0t8bfYdZ+mzccf4U+esdQ3vUnlIoAFnKwX/
 JQbefQX6Lw59ktLWZCP5bmCOw5OsSwA=
X-Google-Smtp-Source: ABdhPJzf9L8N4cz0RXnl+kds2M1mB9xgIlwVmFXhdkQBQtHfhvqbYqt46eq1HskHMqSbdEDRhNeGlw==
X-Received: by 2002:a2e:91da:: with SMTP id u26mr14772411ljg.311.1593801981314; 
 Fri, 03 Jul 2020 11:46:21 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:20 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 09/20] backlight: drop extern from prototypes
Date: Fri,  3 Jul 2020 20:45:35 +0200
Message-Id: <20200703184546.144664-10-sam@ravnborg.org>
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

No need to put "extern" in front of prototypes.
While touching the prototypes adjust indent to follow
the kernel style.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 8f2005a6f8a9..c6ac4cbb9ddb 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -417,23 +417,26 @@ static inline bool backlight_is_blank(const struct backlight_device *bd)
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
 struct backlight_device *backlight_device_get_by_name(const char *name);
-extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
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
