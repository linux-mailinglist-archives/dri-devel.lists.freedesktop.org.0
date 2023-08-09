Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ABA775DF6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 13:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817010E40B;
	Wed,  9 Aug 2023 11:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDC310E40B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 11:42:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe1d462762so56884685e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691581363; x=1692186163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7b0FNEltUgJre7QUi/LlASENLPDFiW1RiJtPuEPcdsk=;
 b=H8bxlFuEJAgtd/W8tH75enhERPJK8n1rNmG7P1oaBuUdwMEbeVDeV8AFbviUIsf0mH
 L79na/TmkmFu1gjUUH/sP0SO9j8XQgOew6Z5h6lX7S+NBciQ7/gtGkCqB7U7GnJbSbLU
 JX0V+S4/Vi/pmNYsA+UYUns4yF6HK/6ur3f/YSJaCNPeb0rICJhAoFbMVr8nFXdF8+b7
 4Zrpng/iX6JbBvRzpVXE33vXPPaUkp92fxJmqaesWhXDHRYQZsfIWz5+LpKvTbnUonTG
 LxudexIvdvdxUUgNJMeLVtk0I4MGi0sxootYT7F96hgSLWBFws8YM5Psla7H88O4YARw
 JtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691581363; x=1692186163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7b0FNEltUgJre7QUi/LlASENLPDFiW1RiJtPuEPcdsk=;
 b=lWrK3nllX4WvAy0UAvUBRG3u2YiQzhFt9Ff4627RF6XD3wqbfsh4BvY090wEuEIW0S
 f/ARjCCuGugD1kGlLX/DshwybB6eO9iFtCDWx/Wf7MGT0cYdsX/O7ehIlYR7kb84cH00
 KWGoB6OUBjtKapvKdCWj5+GyAnhJFKviQNiP4Ql2BSLoXtr6C0EeoZMtCo6BIBIedwdM
 IYI8CqjMJMPFTHbu0gPV/bl13kG+b2vSLUmFEiYbfqKutpZ3S3r/nk/bM67WxJYh78yb
 U+44jV7gnVQml4StL/gJsS3kium84V5wM8irfZMBBOflPG/oakMtuDE4tn8CxDWRYg7L
 U/jw==
X-Gm-Message-State: AOJu0YzxWIRkPEQiVxoCa9tE8PpL5xliH3SjB2WHv6Gqyr/uv8euBP70
 ncjtGAADsK5YfcW1hXjQxXA=
X-Google-Smtp-Source: AGHT+IEPX6iqfJAofbYRgtwhfoVTbBfQv99Q0SLYNlvol7nryGa7eR81jSaBuhS6K5USsGMESw/AOQ==
X-Received: by 2002:a1c:7213:0:b0:3fe:179d:d42e with SMTP id
 n19-20020a1c7213000000b003fe179dd42emr1932458wmc.23.1691581362742; 
 Wed, 09 Aug 2023 04:42:42 -0700 (PDT)
Received: from tablet.my.domain
 (ip-5-172-235-199.multi.internet.cyfrowypolsat.pl. [5.172.235.199])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1c4c04000000b003fe11148055sm1727938wmf.27.2023.08.09.04.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 04:42:42 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>
Subject: [PATCH] backlight: lp855x: Drop ret variable in brightness change
 function
Date: Wed,  9 Aug 2023 13:42:16 +0200
Message-ID: <20230809114216.4078-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following warning:

drivers/video/backlight/lp855x_bl.c:252:7: warning: variable 'ret' is used
uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
Fixes: 5145531be5fb ("backlight: lp855x: Catch errors when changing brightness")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308091728.NEJhgUPP-lkp@intel.com/
---
 drivers/video/backlight/lp855x_bl.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 61a7f45bfad8..da1f124db69c 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -241,19 +241,17 @@ static int lp855x_bl_update_status(struct backlight_device *bl)
 {
 	struct lp855x *lp = bl_get_data(bl);
 	int brightness = bl->props.brightness;
-	int ret;
 
 	if (bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
 		brightness = 0;
 
 	if (lp->mode == PWM_BASED)
-		ret = lp855x_pwm_ctrl(lp, brightness,
+		return lp855x_pwm_ctrl(lp, brightness,
 				      bl->props.max_brightness);
 	else if (lp->mode == REGISTER_BASED)
-		ret = lp855x_write_byte(lp, lp->cfg->reg_brightness,
+		return lp855x_write_byte(lp, lp->cfg->reg_brightness,
 					(u8)brightness);
-
-	return ret;
+	return -EINVAL;
 }
 
 static const struct backlight_ops lp855x_bl_ops = {

base-commit: 21ef7b1e17d039053edaeaf41142423810572741
-- 
2.41.0

