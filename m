Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF45ACAAF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B05F10E1B6;
	Mon,  5 Sep 2022 06:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224E310E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 06:31:17 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id l65so7730262pfl.8
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JcNarHX5vDGjVT4u3bJlQD1+cgrqWKhTPjcJ8WgPV+Y=;
 b=DxvplDrIsh+KijXXFdPyzxvt874fwO8Mrl8/8AeOKCJE+XbHxvUZFRKCE2GWxXKh/D
 umFYRihOe+jne0ztML2y6mc0jbRPpGBhC1g0NvUfpp6EeLk7jk01cUaRoaJOQGKx5afd
 lMrQqjCzBLO0lmmWRuQTMiLdS80KFr2EMlRBbDQ43Cvwei0LgWRjAJ8gs1Hh7H+I8nL+
 T7StbBazi7jgrWFhxeXo3Gac0AKQAJdX41kNsF1jErc6zj3GvAoSXS8rPqIvQoiy9CfD
 STWwhnuDN61n/ngUeJ4+XMum2eLhXHNuROQUxZWikj/bqGNqJIg0uK7dakXt3T7vhKRj
 +Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JcNarHX5vDGjVT4u3bJlQD1+cgrqWKhTPjcJ8WgPV+Y=;
 b=D1tnmQT377brgc+y3Ho3t3Ecb6JaxN1PPYcJ/ekzuyonzcYNQQztrXFdR515LHFHKx
 jVTAKuPS/wj9RE/u0XUKYKPEbyglEn88xCGwodk6dNRxYz9cBE7J/oDcQHy2FeyZyS/L
 eXMuA9q8gK9U4owGEHB2apSuD5ZXGARn4ZHR3j/k3fEfkS46TjY7zE42ZBuiqgxCUvKi
 85ixBn7CCHY+Ex/0m3NAE7wDTnYOzUiGsxe2J34FTrEX5+4tD/6i7LCeDvBTP+b67nyI
 okoeLf+TOsXkg78Ffs1PJene9+NrSONkziaqeonKosT+8GulkUrR0DhWOJjnFkPbGUUO
 h8jg==
X-Gm-Message-State: ACgBeo3x15/eD3FBr8zOeh900zA9a5xWwgPBn05Z1BtsXKsq5srjX5r4
 17cjeZlwXrcDg5mVvGwHK1o=
X-Google-Smtp-Source: AA6agR7ElJwXFJbXTWS13gywL0+xg7ynmUWpG94uiTchE1mDeAqtJvkeWg4KKm6lqy6WE6s/yuBdHA==
X-Received: by 2002:a63:fc11:0:b0:430:41b4:acf5 with SMTP id
 j17-20020a63fc11000000b0043041b4acf5mr19872386pgi.408.1662359476546; 
 Sun, 04 Sep 2022 23:31:16 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v1 03/11] mtd: rawnand: stm32_fmc2: switch to using
 devm_fwnode_gpiod_get()
Date: Sun,  4 Sep 2022 23:30:55 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-3-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-fc921
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
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
fwnode property API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 87c1c7dd97eb..7e466b840368 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1799,9 +1799,8 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
 		nand->cs_used[i] = cs;
 	}
 
-	nand->wp_gpio = devm_gpiod_get_from_of_node(nfc->dev, dn,
-						    "wp-gpios", 0,
-						    GPIOD_OUT_HIGH, "wp");
+	nand->wp_gpio = devm_fwnode_gpiod_get(nfc->dev, of_fwnode_handle(dn),
+					      "wp", GPIOD_OUT_HIGH, "wp");
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		if (ret != -ENOENT)

-- 
b4 0.10.0-dev-fc921
