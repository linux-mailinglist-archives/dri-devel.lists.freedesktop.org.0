Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B26EA3A773
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 20:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC85410E109;
	Tue, 18 Feb 2025 19:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rTwWdGeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666F610E109
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 19:30:40 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e04cb346eeso5574014a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907039; x=1740511839;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0T8F81F4dclX+rJ/ZeU1mJZ2+c2tosLP5JZ1w46AvKI=;
 b=rTwWdGeRGlnydw+xbc/Czr3//d3IofYKmkL+R/5VLQJ8B0aY2jPBbHjkGoaswUzI/1
 RwY+E3QvnDi0hCeyZLmDFc/mkpwIXzbLVc+fxxzQNRUMv6qyb71pr5+/a8c/no6+kMES
 F7LByO065qA6nLdbHeHQtHBD4SANwznrHsroaKtB/TGGLmSEIGY3p+ZM44bJt52TAcNx
 WQkblFJlWVdTvU6JuOulOSEJ+BckxMyDgdhEDr2xZSjQDP24+DAH3mTyx50pCLRfDl76
 FzmI2Y5L8SCvfvjuDWZHWRnefbvympSH/yrh+uUnUPC64FhY85LIEcjuBWu+y9qowNNb
 n/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739907039; x=1740511839;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0T8F81F4dclX+rJ/ZeU1mJZ2+c2tosLP5JZ1w46AvKI=;
 b=NnVaLTrWkDUuxr9ypwbBbCc7siCHVdGEaKU7y6xsK3S8THg3XD36xhtJJ0ivfVsz4p
 ZupHmd7FECnBe79jnwCDQVGGRUwTiwYucr6clz4Exa80ob6cZOHXCf1vV4KwqKTxtze2
 m64ZCCaSMsICAhjYuP4uXQNbBFJ2bKKLbYXbAbzPDD3iot/IAzpH6UyhLUfuoeQEp5+Q
 UdksiLGfaoeDP32YEyV5wobmItKo6+aPhTx1UrJIXd+BUxPkZkM/rO5+ZFCOiiW/Tbrm
 Va/TO5m54wHvbRSBRJlHhFpWxkWpErCKXXv52dfOwz4Ss5SFm1bSbABBa6LhPmlLakSY
 0VOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr0dyfdK1lwGk+rGv/e5RkEp40Y1g4ejVKdtPzvycRnyRYPhsfhc/GVEf2H2kh8J6pw7atnMQGNbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPcd4iM1b1ftA2Pkx6WDVv3WcJqDMqjOD90bI4fjuIeWuS/tqq
 2hFSUQgK8C2SFK3GIHlwSjbXl9p2U8r4PYqT20+DPtpBwfNS6SBDzV8yECWLja8=
X-Gm-Gg: ASbGnctfOMtRdsmpn0NLVd+yqfOx6mNGBdir1R+8qT2VQg9ONF5syZatf10tbn0ND3n
 S1bi+TUYu2O65X+pcIAWHAnXckmdGrDeStEgSwBOMA9MEa5wzj1KjkEX0iOeor67g3YSJMzdbu8
 aix12LwakMgJ87IMB+cTa/xTXIhmmQjmfVPTUDrhUTY8wDYG8MIrenfDwx+6rX5/l0qd2rXl9rQ
 uT7Jg4T80+4XXj3VCeRCDLxJ0yPk1JRaGDH6M2FZ0forhiU7pfdT9U3USbSireyzbg5tOdqdikW
 qF4ktoRopiLzWYVHUKFJlSqNirCc
X-Google-Smtp-Source: AGHT+IE38d9H2TgXTyTup8jkjPe2nCO1VlNwQJGJqEx5dpp48IZsz14VskWGHfiixxpwINWmEkNfGA==
X-Received: by 2002:a05:6402:13ce:b0:5e0:4a92:6b45 with SMTP id
 4fb4d7f45d1cf-5e04a926cd7mr12713674a12.24.1739907038738; 
 Tue, 18 Feb 2025 11:30:38 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 11:30:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:47 +0100
Subject: [PATCH v4 2/8] reset: mpfs: use the auxiliary device creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-2-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=jbrunet@baylibre.com; 
 h=from:subject:message-id;
 bh=lC4JGAW79Gffs1TQMyzi5K8iGZRUrc3LT4D+fKp54fk=; 
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/QcUQEhOWVZzyl8Bk6xzmnH//yZHJXSRo9/
 qRN2pMyjUyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0AAKCRDm/A8cN/La
 hWnTD/9N7uDw2MgUMxhgsAUT5/+278puGBABcsLjbLLras1TheSQNvuJ2k6CxLv1JzCY2D66v4g
 1IZyaW6xKXiWnXsDJvRMfcjRdcEROcGnF3UC4ySSisSHu/ZQztXxFB+ZWe/fkAj0Yr8I5rv9jdi
 CVlbgdypg0F/xyy31QioTBrNDzru3kX+AZPogf8//n1HoaxOA5nRQAU+AMJDDJE4Tu3ZuwXujs8
 eHY+xCL7EVf2v0LnCxVtOkWdzWc1WD/1f83AvRqQh8zo/ADR5A8bcX432Ca2efhXfpTiJtTGV3C
 nkRAlV3jUon29+Atl1cui8KDavDFHk/+0IIwCMvrCreR+4YHxT4f+w2ay7hyiJ93zHmOpeBNwlD
 nsa+oMRZdeU6vHD2y2GJHX7m9CSFp1E8zmd2evt/+ZCvVMPhdfGJInOpC0HIWUKb46a8NeJxWly
 0eI7MOS4MfFJow59r73kkCyYHBPv3mfqUg+oCigQGJHFaP5irNw8C9yO4xX7Rabili/pwsYyI7G
 JTcCo+pvGbCJ2MnXqS0x6JpyZ/ZFrneZmwpN5fi3gPKSYljCbeXbCHd8pjuzg/Gu0I9u//RPWWo
 ufdtuzliUyzrzCu0/+O2KjwjCQuyA3XbhhDaA6uUq+TsSZbwdcJ6nKs4JMfwO9I4wruQJBQ8Dxc
 0NFwBr/IpdOtN0g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-mpfs.c | 56 +++++-----------------------------------------
 1 file changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..f6fa10e03ea889e5434110156f7bece808a6ae92 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 	return devm_reset_controller_register(dev, rcdev);
 }
 
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name = "reset-mpfs";
-	adev->dev.parent = clk_dev;
-	adev->dev.release = mpfs_reset_adev_release;
-	adev->id = 666u;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
 int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = mpfs_reset_adev_alloc(clk_dev);
-	if (IS_ERR(adev))
-		return PTR_ERR(adev);
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
+	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
+					    (__force void *)base);
+	if (!adev)
+		return -ENODEV;
 
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

-- 
2.47.2

