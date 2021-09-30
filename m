Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CBD41D1BE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 05:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D756EB3D;
	Thu, 30 Sep 2021 03:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804146EB3D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 03:05:59 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so5526143otb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 20:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+OqbWheVa9fktnks13xlGqW75vpzjA26oxz+hbw1HY=;
 b=znAFf3H00WKsy4tsdN/blEqQS1FQG4hLSnbrDru8KT0e+dYyY6FgCCbU6nkQvMc9kq
 SJHNZa4NxUImqemIzWZvsR4xLbVwebZV96Uq+4O9gslI5AA3PILSzVt3MN9iRzCxN7LP
 CAOkIM66hRORXfnLoVjBK5ViWi+/2qbnTwEoD0QjvdkaXGB3FQYmPwQbiPOboybsrmwm
 DE9u0o1/rvbW7VapxxR3YIwrBMaH4pW+6ScA57bR5fusCVomI1ucPNmrFfT026NLrtHJ
 NlrxGS4OGI0VeL/xk00FV8UVemIGjLVj6YTBiWym/5PzHtU5XsY1XX/qRrIyyeFQ6fv+
 g1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+OqbWheVa9fktnks13xlGqW75vpzjA26oxz+hbw1HY=;
 b=1Q6Y1sawn623aLEH3D1H8u9i6d42AhUffuzzLxWmJQ2XVB7y/GBTKaimurndrDz9PH
 MKX+vorvZMLjDxs/90+/6XRopil7jJy7T3O93LkUjiRHGr18tuScYpgKajQiZQar+u6o
 A6hKNv2WndGe+tDmOANYX5wBYypCAXGwTfAowxmPYmCGFNzOO4YwPjL5LL7MIetdUWlZ
 UUaNGoPGozLwy+p5dhM6S8+K/ZaBDPBHpxZ4fVG/JRxTSd/FzSPdZY41hxvawmTJsPdW
 1HtjvIXWumtOgTW6lhf7tkkfo7uNkB0cjz2g2TQB8k78wDnjQ+Gi8B7Bec90mXeSEmeH
 VEJw==
X-Gm-Message-State: AOAM532WClVtat3u0JSslIprG9MSuRtXisEZVSX641hDSkquHA+B+0Pj
 FIqOEvnx5tVd4QOUKUzJnno0Iw==
X-Google-Smtp-Source: ABdhPJwrm4+8HvOM3408QItprRiTxBwBoUQDHQwU7ALRSUHafsGrE5bjj3mvpHhabTKMRmMGbgo9mA==
X-Received: by 2002:a05:6830:31ae:: with SMTP id
 q14mr3156053ots.66.1632971158712; 
 Wed, 29 Sep 2021 20:05:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s16sm323358otq.78.2021.09.29.20.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 20:05:57 -0700 (PDT)
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
 linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Doug Anderson <dianders@google.com>
Subject: [PATCH v6 1/3] pwm: Introduce single-PWM of_xlate function
Date: Wed, 29 Sep 2021 22:05:55 -0500
Message-Id: <20210930030557.1426-1-bjorn.andersson@linaro.org>
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

