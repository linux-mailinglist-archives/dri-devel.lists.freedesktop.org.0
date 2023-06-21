Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDE17391DB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 23:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1840910E356;
	Wed, 21 Jun 2023 21:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE32010E356
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 21:55:09 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51878f8e541so7567679a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 14:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1687384506; x=1689976506; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRUDsn4e6Ks8YzmKCfn5h1mpk0f1GA6PVcpiiIMFAtA=;
 b=ryqDqOAnnAJv9G8ZbZBMXI5Qf+NLTe4Z9G/CWY3yA0+dio5cKumyowL69kJfe4FSZ4
 3/YwzXdHBxwfWqgXBexKcev4SCbeY75p0+Quq+Bsmx0dkRqAKi2foN/NHk93KSSNpt2G
 9valT+R/D0YupatdQ9mJ8e5ogQnivBeohbZwy6luFduk0m0SvbuZiIrjiL16lPrlLM2U
 MfxFXJLqzPuZB48nubuzvOwBk/aLqDI2j+FKXY3iB8oBsDhng/Hr87OGMFObUMd0MQdI
 SedfW0L6q9PhuH+pS1qiEl/qbActqTHvoDcdHM/LKVs+o4yDOGpAUSke/eC4IuFGqaGh
 C7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687384506; x=1689976506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kRUDsn4e6Ks8YzmKCfn5h1mpk0f1GA6PVcpiiIMFAtA=;
 b=YXvvmsmOn1nSwepHVNZcoMR8rInDjAnQ5joA4C64jEEBJr5HGUV0TvMAXRV9KILphB
 2lAQjhtefq0YAMF3VO6Die8J1jEBJVlB1vFzoklZ8ymGZO3sEJgHOPEjIan1MYjJ7KiS
 usic14xKLuyv8C6k8B9FyKiJVjKQg8yecNdkE4Is7z8W+mNx8uR3leujfyIDghD2MckI
 UF0pDGg8oxaFFILG1N+TBD6N2O7nYwgrIuImfxocFfPZgaAC+HJqwZfaOndPChRmEeCr
 ZKIA4lEaoqYBg0bsxevdTRS9ofqZVJHsfgum9X6DGIt15z6GKZ9+DUc2cwkzULTlWFhD
 hj0Q==
X-Gm-Message-State: AC+VfDxtaJEGESoV/RwPrPf+CIY26azPnMJNX/k+MjHgGE6TOLa3JIci
 CYqBAr+sbmhUQHzayG1tuvlr+348Vv0ylSofAI1bSA==
X-Google-Smtp-Source: ACHHUZ68KU6zeF4KhP/4rSB+WCwcso3Hz0SCmqZuTCSqxgmUfmsCgyUVJ5ghWnoL72nCuOtxLztz5A==
X-Received: by 2002:aa7:c3cc:0:b0:51a:4b53:e3f9 with SMTP id
 l12-20020aa7c3cc000000b0051a4b53e3f9mr7987253edr.31.1687384506197; 
 Wed, 21 Jun 2023 14:55:06 -0700 (PDT)
Received: from localhost.localdomain ([188.27.132.2])
 by smtp.gmail.com with ESMTPSA id
 d16-20020aa7d5d0000000b0051a358a76c9sm3115417eds.72.2023.06.21.14.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 14:55:05 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v2 2/2] backlight: gpio_backlight: add new property
 default-brightness-level
Date: Thu, 22 Jun 2023 00:54:57 +0300
Message-Id: <20230621215457.11297-2-alex@shruggie.ro>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621215457.11297-1-alex@shruggie.ro>
References: <20230621215457.11297-1-alex@shruggie.ro>
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
Cc: daniel.thompson@linaro.org, pavel@ucw.cz, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, conor+dt@kernel.org,
 Alexandru Ardelean <alex@shruggie.ro>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Yannick Fertre <yannick.fertre@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yannick Fertre <yannick.fertre@foss.st.com>

Add new property to set a brightness by default at probe.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---

Link to original patch:
  https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14ffd49892c4ce663cdafe98

Changelog v1 -> v2:
* https://lore.kernel.org/dri-devel/20230519200520.10657-1-alex@shruggie.ro/
* removed 'Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>' as
  requested
* patch is now second patch of 2 (was first in series)
* added 'Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>'

 drivers/video/backlight/gpio_backlight.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 6f78d928f054..d3fa3a8bef4d 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -53,6 +53,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness, def_value;
+	u32 value;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -93,7 +94,11 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	else
 		bl->props.power = FB_BLANK_UNBLANK;
 
-	bl->props.brightness = 1;
+	ret = device_property_read_u32(dev, "default-brightness-level", &value);
+	if (!ret && value <= props.max_brightness)
+		bl->props.brightness = value;
+	else
+		bl->props.brightness = 1;
 
 	init_brightness = backlight_get_brightness(bl);
 	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
-- 
2.40.1

