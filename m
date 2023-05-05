Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C736F9132
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 12:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9328210E254;
	Sat,  6 May 2023 10:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F0910E660
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:58:11 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so15025965e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683313090; x=1685905090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1b+OLvSRoYfyljr8mg5KeVPnX55ONCXJ476XEVumh/s=;
 b=oY2AQu9BVNjD3rwPFri5qbdOkPAjl7SrIGW9Ei9AmmSOu2oV2+G/beYc90CDGkjJIN
 WTSL3cPsucYZ447qlImb2JtqhI6aty5P2Z/LTF8ZWp3nVzA9CJDqRupN8sd2FekjDFJO
 9v/iVdx5Uch4kEmRJk9vqtfsQ57sPvHCJQu6TfiPCDF1TbBgygBgNH0QX/P2G8lFDjuX
 W+oT5yq+4tQ/0FSzEbBY3gVSJnboeZhLFywzBA+nw1N30AeE16ltvStZwUWIvPCR/usj
 7Bcvo/acWnikPWTiY/YPx/Tgin/jDb8fHkoV24523JrUt2zj1dBEEqWGNccwnS/1JA0/
 70cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683313090; x=1685905090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1b+OLvSRoYfyljr8mg5KeVPnX55ONCXJ476XEVumh/s=;
 b=fA3S53Qsk7PREBdGdz/rtBkVM8CU1A+drc2sceP7CHm7DiWwd6VzosezW5IcJg9DaA
 Pmgb86Zm3zeBhXR6hClb5O/7OVJOr8d4blgDbQlTf9K022kg7Y7BU6rPhbtUpofZ6ccS
 TBRmojOJwvyXyzPa7HZnmqynRUAQzR3JFPqAeXaxLUmtXdnT9X0ZBSQmiiiN4VZ3KO+a
 qeBSHS1x5OYBErIUB4j2ltuua/oAm8fpfIkLS6ZBxbs8+6FvwRBV6PVpEGA4zxJgxf5w
 fxIf23t7Ff68uivpsnYgBrG836wifw8gD+Vst+du8Sf9QbDHHRtFyvptV6sgG9w8HeU3
 XjPw==
X-Gm-Message-State: AC+VfDziPpuFqFcvvSTwPTtl1qZjn1htKJvrLh49RVom5lrsdZdhDpEw
 iCzkc86MJWIPgOQ7fDtFg5Y=
X-Google-Smtp-Source: ACHHUZ6fJO8vyrwjBhFmq93Y3W8Pkix0SQ38ShAcZelUn741btCGidGkn5mGRo4vUfDutDIFv5ll7Q==
X-Received: by 2002:a05:600c:d7:b0:3f1:82d5:997b with SMTP id
 u23-20020a05600c00d700b003f182d5997bmr1773498wmm.18.1683313089697; 
 Fri, 05 May 2023 11:58:09 -0700 (PDT)
Received: from koko.localdomain (cgn-89-1-213-9.nc.de. [89.1.213.9])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b003f4069417absm5825061wmz.24.2023.05.05.11.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 11:58:09 -0700 (PDT)
From: Maximilian Weigand <mweigand2017@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v1] backlight: lm3630a: turn off both led strings when display
 is blank
Date: Fri,  5 May 2023 20:57:52 +0200
Message-Id: <20230505185752.969476-1-mweigand2017@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 May 2023 10:33:25 +0000
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
Cc: Maximilian Weigand <mweigand@mweigand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maximilian Weigand <mweigand@mweigand.net>

Use display_is_blank() to determine if the led strings should be turned
off in the update_status() functions of both strings.

Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
---
 drivers/video/backlight/lm3630a_bl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index d8c42acecb5d..5498b57329f9 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -202,7 +202,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 	usleep_range(1000, 2000);
 	/* minimum brightness is 0x04 */
 	ret = lm3630a_write(pchip, REG_BRT_A, bl->props.brightness);
-	if (bl->props.brightness < 0x4)
+
+	if (backlight_is_blank(bl) || (bl->props.brightness < 0x4))
+		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDA_ENABLE, 0);
 	else
 		ret |= lm3630a_update(pchip, REG_CTRL,
@@ -277,7 +279,9 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
 	usleep_range(1000, 2000);
 	/* minimum brightness is 0x04 */
 	ret = lm3630a_write(pchip, REG_BRT_B, bl->props.brightness);
-	if (bl->props.brightness < 0x4)
+
+	if (backlight_is_blank(bl) || (bl->props.brightness < 0x4))
+		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDB_ENABLE, 0);
 	else
 		ret |= lm3630a_update(pchip, REG_CTRL,

base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
--
2.39.2

