Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31362250B1
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CD26E4DD;
	Sun, 19 Jul 2020 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991D46E4DD
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:17 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e8so17080238ljb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMIhGECQ39mxsFBNf2RZfIR0vNjqITM52PNfMW2B2fM=;
 b=DrMCaLN734Ri4P8SqhdAMQEzdVLEPUC0MbptJBkJOnJWDe8EH1rk+SQWDmT3yoWYvs
 7KqXeMmpHxTy9CDma8rd9kRmSY5z/Okp5TWV+MjNhlmA5gK0FAhVYtv4WcKOFlnPzNF1
 3BbrfZ/FgOljtsOUcVipDIjOHZE+o7twRqZFPcUCa9eS1gfikEY6L+edCgRcECKJzBNu
 dXaUbib8vR9jC3nECUUdBjiLzCf8XuMa0Y9SJ6v4i7X7PSssefA6DANpkmRPkDGHgi6A
 mNqr00GuAbVbEq04HWnjnV0DZguN3vK5OlGYOG78UbW631bJBUoeGTD8Nqrp9qPKPn6i
 TWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QMIhGECQ39mxsFBNf2RZfIR0vNjqITM52PNfMW2B2fM=;
 b=oQccnY6fIDHWFUpF/xv5vydpAKSACR7yNJcybjNwCAIiVV6Xh4tCXooin7LX6vreaf
 sFpWYhOIh2A3pSCDooVjbspMAZ8+lMJHiMntkoqw+kYb+P8S3E8MWBO2kVQt71ymN0CM
 CldrfrCiaWYBqS3YAIt2CKSFSTNPFJ6HF3/VFHh0ddkm0/sUpuTKEDPJGQsMOSJWtIxo
 PqY2tc9UD8YVPT2AvEzCWAy5a9TlvtVbrR/1nFabEvPPKBAq1NOr9BW9MMWt/Lt4D9dV
 40OpCFa1ItFWH+8CtA2QofbxkwAKaYii113aGj9bxYJriiG8hFmJlUoYOeFj8FyjShFv
 e01A==
X-Gm-Message-State: AOAM532r7ocBaMqKi7iR/dhkQdVveD64dyY0YCCM27H/qNqaBJI5Q0iQ
 dI+gVp0rK9UeC0/77J/KZs0bd1Zhxg4=
X-Google-Smtp-Source: ABdhPJykvLiMLexX3kWmPLDd9DX4t2wM3QhET+M7lM4xMxR7y0hTe4TGEX4+xcoiOxnSENfu2ss8sQ==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr8270437ljj.143.1595146095864; 
 Sun, 19 Jul 2020 01:08:15 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:15 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 09/19] backlight: drop extern from prototypes
Date: Sun, 19 Jul 2020 10:07:33 +0200
Message-Id: <20200719080743.8560-10-sam@ravnborg.org>
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
