Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9888D6FE12A
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 17:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B5810E4C8;
	Wed, 10 May 2023 15:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC98A10E466
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 08:52:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30786c6082dso2994993f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683708770; x=1686300770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sRhXhkL36qHDCTJUPZJ0gK4JtbzzIKwrgaPUffLmcS4=;
 b=oG8mhrPN17kkUirhBiS9xZM7Nax7ezuXWWn0z7PndTZ7BTrMJoaOch4OdduhXkfI/f
 F1tcjT9OW1w49Za65TxRxLWsa9AL+CNPIfkH/jdoiHdrE6d0se+xpilb9SaU/rerV+Wt
 4GFVTbr+8REGG65ejKLrTU1YW1y+aLP4O00vl9Bh8M5xPYuySq67zgv6JW+bn7harRR+
 oLOzsTjCdD0tHiDuZeOM9QnRzJR5PXNTlGnUH7wrqVbXaQqk0WXabCF5fX8h+zMKdVm1
 WferQ9/7qxOGapUd9MCkFIUIyz7ci2aXsW9lKl6Ou1AO7idtk9agds/AY87tU/a901/B
 Zy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708770; x=1686300770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sRhXhkL36qHDCTJUPZJ0gK4JtbzzIKwrgaPUffLmcS4=;
 b=ZCpayx70v5toA8Blivl60wQSXROBrQcUCWPGdKsmxOK6AZfFeQ303g5w//dtQDSTYY
 pSmlhYcMLPXajqR1MrnV/yKGHJTktXinmvye10YBnTtJKuSRGKRTHiWnNrLC9siHtBHr
 RMp7ZfyXeWRWS/HuraHWF0+dErrLO/WtCmnCNoeny9dpd2mNBunOTqDJ/edlvCBWdeFr
 pp6SD19nyjrew9uT64zN1eP/zVxDRb0O9zdI4wNIq97CG4ThYtKmUOUzMkBeuT9thtm1
 77egKJRXse9XcPtjP4VsAXKh4zkhA9v7Qt4W9jYTkhz1ZtzyfQGMBL2SAnMv7a7wdndY
 yQaw==
X-Gm-Message-State: AC+VfDzGAtCYNixPlCyqKIgueNJVhfeigXv3hohJ7xuc3R7wV4dRipz6
 tCk1GOsMOqZzYChkLpOd8tg=
X-Google-Smtp-Source: ACHHUZ7ih61hE9Yfr+pU8+QPzsVKR+QvTP+Uv980w8E1G8xoVAtDcpQ/O5PinNK/Mlk2eFtDJjKS/g==
X-Received: by 2002:a5d:5082:0:b0:307:a36b:e7a5 with SMTP id
 a2-20020a5d5082000000b00307a36be7a5mr3554624wrt.60.1683708769923; 
 Wed, 10 May 2023 01:52:49 -0700 (PDT)
Received: from koko.localdomain (cgn-89-1-213-9.nc.de. [89.1.213.9])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d4e8f000000b0030629536e64sm16730766wru.30.2023.05.10.01.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:52:49 -0700 (PDT)
From: Maximilian Weigand <mweigand2017@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v2] backlight: lm3630a: turn off both led strings when display
 is blank
Date: Wed, 10 May 2023 10:52:39 +0200
Message-Id: <20230510085239.1253896-1-mweigand2017@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 May 2023 15:07:55 +0000
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

Use backlight_is_blank() to determine if the led strings should be turned
off in the update_status() functions of both strings.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
---
Changes in v2:
- fix description, replace display_is_black() with backlight_is_black()
- use backlight_get_brightness() instead of accessing the property
  directly

 drivers/video/backlight/lm3630a_bl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index d8c42acecb5d..faf92c8d70c1 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -202,7 +202,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 	usleep_range(1000, 2000);
 	/* minimum brightness is 0x04 */
 	ret = lm3630a_write(pchip, REG_BRT_A, bl->props.brightness);
-	if (bl->props.brightness < 0x4)
+
+	if (backlight_is_blank(bl) || (backlight_get_brightness(bl) < 0x4))
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
+	if (backlight_is_blank(bl) || (backlight_get_brightness(bl) < 0x4))
+		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDB_ENABLE, 0);
 	else
 		ret |= lm3630a_update(pchip, REG_CTRL,

base-commit: ac9a78681b921877518763ba0e89202254349d1b
--
2.39.2

