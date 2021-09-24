Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636AB4169E1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 04:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD506EDC8;
	Fri, 24 Sep 2021 02:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BF96EDC7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 02:12:27 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 j11-20020a9d190b000000b00546fac94456so11211244ota.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 19:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+OqbWheVa9fktnks13xlGqW75vpzjA26oxz+hbw1HY=;
 b=vEfgYoBd1uy4uw21qPlVjMm4lVwO79mNExibZzRfifZ28TnMrs0HNo5qciIOofN2FH
 jSd4MMPKStWT1K6CJiRSNR01oCebCQjtcq2q9frODSYhraVakAF2c+1ho5rYxEG28Qmx
 1sQKZ4nJ68H95skwuK6qJxfgJAZUNYTz0ctrAJOUnX5DmvJZbVobOONwPZhqFacR2QfF
 nWgeb1wc6/Lbfnu7WMLVeUi8PVsLRbWtcrY1FlA3jdVNtVVRCvHX6y8SZl3dOznQjUQO
 jnSV46X0wiPuN/Q/GZlZ89S3CPJaPvIj92k2zkwNzGXjhZYAZf6euQz/XWdakDr4nhj7
 VY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+OqbWheVa9fktnks13xlGqW75vpzjA26oxz+hbw1HY=;
 b=FBodWDb1yw2JG5llMwhVXqrzCthy1e3mOYeuGMtyDuYK+4HwY9xPAW2fI6f084nLXy
 4LJTDCflmbt4yQeEhravTykltSlv7LncS8pygAnSg1fD61A/pTWqdpA+dU52tCa9Jow+
 Sm+Ka3KAWXHx1c6D0N+04IO6u8+2uJv0gAppYPfnxJJjsjt0pQKtc+7ChSXaOGnjD8Bu
 j5A6PjhmsV7g3QgmX8pFurkDrlnfsBD1I6bSD4t6mRmrC1BftC8lUXnhxs3lp5Y1c6C2
 TQ9ebdsrG8f0rjpFTVJqmRxOvCrWpjub90gPFp59Rr6EEwRjVNP5RlqyYtZjElAgL7oo
 E0GQ==
X-Gm-Message-State: AOAM531UuLMfQk3Urigj8LOGLwRIO1frW/UOBUwg0R7pf7frMHwt4Iwf
 1cvofB9sjMmdld8IkAZAJezrUA==
X-Google-Smtp-Source: ABdhPJyFrqOvBELXZU49xevMj3q+4OYVTM4ncKXZfhr5AyA4cARflYqi1vBngPG0DUSN2HALcMLpiw==
X-Received: by 2002:a05:6830:441f:: with SMTP id
 q31mr1765846otv.204.1632449547008; 
 Thu, 23 Sep 2021 19:12:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x28sm1884336ote.24.2021.09.23.19.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 19:12:26 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, Doug Anderson <dianders@google.com>
Subject: [PATCH v5 1/2] pwm: Introduce single-PWM of_xlate function
Date: Thu, 23 Sep 2021 21:12:24 -0500
Message-Id: <20210924021225.846197-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The existing pxa driver and the upcoming addition of PWM support in the
TI sn565dsi86 DSI/eDP bridge driver both has a single PWM channel and
thereby a need for a of_xlate function with the period as its single
argument.

Introduce a common helper function in the core that can be used as
of_xlate by such drivers and migrate the pxa driver to use this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- None

 drivers/pwm/core.c    | 26 ++++++++++++++++++++++++++
 drivers/pwm/pwm-pxa.c | 16 +---------------
 include/linux/pwm.h   |  2 ++
 3 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 4527f09a5c50..2c6b155002a2 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -152,6 +152,32 @@ of_pwm_xlate_with_flags(struct pwm_chip *pc, const struct of_phandle_args *args)
 }
 EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
 
+struct pwm_device *
+of_pwm_single_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
+{
+	struct pwm_device *pwm;
+
+	if (pc->of_pwm_n_cells < 1)
+		return ERR_PTR(-EINVAL);
+
+	/* validate that one cell is specified, optionally with flags */
+	if (args->args_count != 1 && args->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
+	pwm = pwm_request_from_chip(pc, 0, NULL);
+	if (IS_ERR(pwm))
+		return pwm;
+
+	pwm->args.period = args->args[0];
+	pwm->args.polarity = PWM_POLARITY_NORMAL;
+
+	if (args->args_count == 2 && args->args[2] & PWM_POLARITY_INVERTED)
+		pwm->args.polarity = PWM_POLARITY_INVERSED;
+
+	return pwm;
+}
+EXPORT_SYMBOL_GPL(of_pwm_single_xlate);
+
 static void of_pwmchip_add(struct pwm_chip *chip)
 {
 	if (!chip->dev || !chip->dev->of_node)
diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index a9efdcf839ae..238ec88c130b 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -148,20 +148,6 @@ static const struct platform_device_id *pxa_pwm_get_id_dt(struct device *dev)
 	return id ? id->data : NULL;
 }
 
-static struct pwm_device *
-pxa_pwm_of_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
-{
-	struct pwm_device *pwm;
-
-	pwm = pwm_request_from_chip(pc, 0, NULL);
-	if (IS_ERR(pwm))
-		return pwm;
-
-	pwm->args.period = args->args[0];
-
-	return pwm;
-}
-
 static int pwm_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -187,7 +173,7 @@ static int pwm_probe(struct platform_device *pdev)
 	pc->chip.npwm = (id->driver_data & HAS_SECONDARY_PWM) ? 2 : 1;
 
 	if (IS_ENABLED(CONFIG_OF)) {
-		pc->chip.of_xlate = pxa_pwm_of_xlate;
+		pc->chip.of_xlate = of_pwm_single_xlate;
 		pc->chip.of_pwm_n_cells = 1;
 	}
 
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 725c9b784e60..dd51d4931fdc 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -414,6 +414,8 @@ struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
 
 struct pwm_device *of_pwm_xlate_with_flags(struct pwm_chip *pc,
 		const struct of_phandle_args *args);
+struct pwm_device *of_pwm_single_xlate(struct pwm_chip *pc,
+				       const struct of_phandle_args *args);
 
 struct pwm_device *pwm_get(struct device *dev, const char *con_id);
 struct pwm_device *of_pwm_get(struct device *dev, struct device_node *np,
-- 
2.32.0

