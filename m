Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597B87D9A3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 10:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3346D10E5DC;
	Sat, 16 Mar 2024 09:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ml+lzZc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42CA10E5DC
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 09:45:32 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso7377615e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710582331; x=1711187131; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gmf+EhkCbPD4zN6pmu9jbRwb1AOtk+4/VyFIevrMxPI=;
 b=ml+lzZc3EiqNh1NlvQRcN0EBzEqLIWqASuO5ck4H0sVeR0hkYzc335qCWPZuvTby15
 6VWNYP9y4dPuaNke5SwSK1DhbCWk5FX4zwmi+pPgyejBvgkAAGO5eTUyBTrxP/NA/tIx
 XGY3oztzOwnCwLaCP4nEBK6NF/YL/yCjmm8E2V3pUToG0jr6C8XfxTGpPyDUfYF978gw
 T0qldPmwLQiEXAQNP8PpsyU4mDa0/k+dqyXmZvUy+kiV7EPFsCf4Ir6EJnglY1E0gxX3
 qZTEppZ4nyAp+rJMQN6fzmRaIzDpli9FAso5slc49kQlj/IbfmTkxgG6bw2OXSXdLzK2
 RyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710582331; x=1711187131;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gmf+EhkCbPD4zN6pmu9jbRwb1AOtk+4/VyFIevrMxPI=;
 b=YrHA+3prbbnJO8I28ffKV0rWOoDwUnRxRn9Ky4v+EUPhYmvyLU9TaDIzZQtHgUch9o
 elJt7NwimVebbomSDoNTFr1n8ryHdQZStc8RSknm95lpwc+8o8OtYXbokuB+du1ECSQ5
 On09hP2GjeT7abuNyIy8LloUEjBIeHOMp32eZ9JvmmKvuFL6D4txOUU1FY2OpEJIk4hA
 cY+yBp6aBBhHAF/SV0aQoHKSWt4rU0SisMk+7pC1nl++ttFbtJLnVaBGolCYu3bejLOV
 92qkTHtrGeDR/d5Z19WN8An35j+IvndeyPA55G3aKb75yK48eJJ/9p5eCx8s15IM2Zce
 Q3eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJLVxskPcc93tiU0j344mvxBPwXw7p7S/a4dqXTS1Zlv1h12Nl0aRw03jhsJ/W/5ra+UOEUuV+O2lT7sZJp9vcwCsmdz+FrgUy9PHM9/x7
X-Gm-Message-State: AOJu0YweyfFTrylP/CZdJGWtZNaLmi2Fa3HE5WliL6/zaNaguTHKXaPB
 P2LKg/lggBavlOJhP0f12vB8vzEdbyf3L6RKtCdJzsleB+gl5DhRVQAGZfsqYk8=
X-Google-Smtp-Source: AGHT+IHauOfu90GrAhcslu1pR8/IgIcfemYw9G775rZSF8H7HGHaPyO9in3oux43aPDC6swiuJd29w==
X-Received: by 2002:a5d:6a89:0:b0:33e:c236:ccb1 with SMTP id
 s9-20020a5d6a89000000b0033ec236ccb1mr7746624wru.15.1710582330925; 
 Sat, 16 Mar 2024 02:45:30 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 bs8-20020a056000070800b0033e3a24f17esm5221863wrb.76.2024.03.16.02.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Mar 2024 02:45:30 -0700 (PDT)
Date: Sat, 16 Mar 2024 12:45:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] backlight: mp3309c: fix signedness bug in
 mp3309c_parse_fwnode()
Message-ID: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The "num_levels" variable is used to store error codes from
device_property_count_u32() so it needs to be signed.  This doesn't
cause an issue at runtime because devm_kcalloc() won't allocate negative
sizes.  However, it's still worth fixing.

Fixes: b54c828bdba9 ("backlight: mp3309c: Make use of device properties")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/backlight/mp3309c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index c80a1481e742..4e98e60417d2 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -205,8 +205,9 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 				struct mp3309c_platform_data *pdata)
 {
 	int ret, i;
-	unsigned int num_levels, tmp_value;
+	unsigned int tmp_value;
 	struct device *dev = chip->dev;
+	int num_levels;
 
 	if (!dev_fwnode(dev))
 		return dev_err_probe(dev, -ENODEV, "failed to get firmware node\n");
-- 
2.43.0

