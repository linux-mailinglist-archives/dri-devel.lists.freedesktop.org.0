Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC82250AE
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898016E4D7;
	Sun, 19 Jul 2020 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CA389FDD
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:13 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j11so17021498ljo.7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76GYwHJgmpg1D+ufO0JSzMv0fcAJAUH2Ai/nlDiORJQ=;
 b=fH3SGUi6PCNnnzkTN7BquDl+u2btMvTf81oi3LU+7FneCF2MCGfqc7CKzni3O2OX6L
 KWnF534GMBpMZGFDjscLbUeFGk1AuYP5sDRxPStQJgp6W+Mh+rN6Ja54z6uvnAZ5LBUk
 DviY2+kn/YsIwezhGuLxaL4k5PJORjV3yCT3lcPcnNX4/ZWxydT9svNvr+OkZmHalkx5
 vNpnpvg/lvJ7ZneIWDRrAvn5/Ng18ORLvC8Y9AKo2Nmwla7p+pT59d+uqegZZftgP+pJ
 kU4hss2AXLRGa5XO+M5rcOQvYA8MvVuHPG3mQWa+jRoB6vaNtZFm6PgQDcBfS8VcMidK
 dSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=76GYwHJgmpg1D+ufO0JSzMv0fcAJAUH2Ai/nlDiORJQ=;
 b=rn5gp//z3t7Rm9nuEHU5mpnConMuCnhBAJU37fn4wO0UZ/lLS8jznIQckVjnpcqn6H
 8xsBbuGVGFwdc1oOkJRC7/hhB0ltR9pIfcg0RhjKZrr3yq0Eb6d59yVkqFxqJY05OcAs
 xwyVqBE6YUZAMQ6VZpfsC+bSe2esVdhYeQ8/vB6DtuAacLFS84eZitMJ2XFBSo4KSH40
 3GB+Yy09RsHWn+gmbW6qB9fUEew2cYwepohdODlWsR2pjQFFIC8TPut6Kqf1L7G+fEjh
 i38lgaEJiA703Ye0Wb60tQwTZMCcDKxwiwlw1Iqi1NRB6sPwdno4IMMMXHf7zicmKz7S
 jdog==
X-Gm-Message-State: AOAM532eeWu/WtoaZmMgT+7htFSUz0hqMZ2/CN0o8ufVTwApTw12c2ps
 GSSFhIUxQFSswxLpOzxruA7fBTW3H/c=
X-Google-Smtp-Source: ABdhPJwYCyvEJr4JKQu2wAiVlSR8RATflYb7drCCKaX0jVaBWgPcevLelVojOMKCgG3v5B+FO+PQvg==
X-Received: by 2002:a05:651c:1b6:: with SMTP id
 c22mr6893563ljn.421.1595146091482; 
 Sun, 19 Jul 2020 01:08:11 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:11 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 06/19] backlight: document inline functions in backlight.h
Date: Sun, 19 Jul 2020 10:07:30 +0200
Message-Id: <20200719080743.8560-7-sam@ravnborg.org>
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

Add documentation for the inline functions in backlight.h

v2:
 - Fix spelling (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 7654fe5f1589..7d6cb61e10f5 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -268,6 +268,10 @@ struct backlight_device {
 	int use_count;
 };
 
+/**
+ * backlight_update_status - force an update of the backlight device status
+ * @bd: the backlight device
+ */
 static inline int backlight_update_status(struct backlight_device *bd)
 {
 	int ret = -ENOENT;
@@ -361,6 +365,18 @@ extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned
 
 #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
 
+/**
+ * bl_get_data - access devdata
+ * @bl_dev: pointer to backlight device
+ *
+ * When a backlight device is registered the driver has the possibility
+ * to supply a void * devdata. bl_get_data() return a pointer to the
+ * devdata.
+ *
+ * RETURNS:
+ *
+ * pointer to devdata stored while registering the backlight device.
+ */
 static inline void * bl_get_data(struct backlight_device *bl_dev)
 {
 	return dev_get_drvdata(&bl_dev->dev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
