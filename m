Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369F5ACAB6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5CE10E1BF;
	Mon,  5 Sep 2022 06:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D032D10E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 06:31:24 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t70so1478702pgc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 23:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wtbsIN0G6G4Rk7NZw280WIou3MxCBWt+mxKFWMG1Byk=;
 b=V8iL1hdeCP411j7WuyV0RKuzlQrPJroM9XqkRFVvCrpK5bPAPTQyE3nfxPRzAf22UM
 NdSbdYACGTqUH/jKS6oq3P2avtZxFrHjmK+37r3HM6hSTlwP5zMTrLgtHcunRzXS7wMw
 MLZe8oKnvo6VJsVi46R1kynkLOywScoAoQvo19TSTMHFDsHauT8z363qjjda0HgeiYKj
 huXRCccitr3elT9rdkidc7YsLzXzhKdBuKVC9nAAEu81j9W3fv8DO1eNUEeEVii/KGJq
 9BBdMvEozmLc0fRzk0Ub2eeNBu38hun0rdIUAhS3h9SBA/pWcydN9r0W5OPOyH/yn5ft
 K/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wtbsIN0G6G4Rk7NZw280WIou3MxCBWt+mxKFWMG1Byk=;
 b=1LWAUEUXr9YMDr9rC1NAKTHwHG3uwJvaW17odeTIdGTv3H3l2hfmvYlsUt+u88Rw4T
 +u54/v8EvZfpRnz8q0//H02d+AgFDN56+myIOLen8Pw/np8q38vHvj6PEOOuNz35K0TG
 eKviQfnBVP5oQWqln8/XQc28sE0SLGnt88m7ta2oAmFfRqBbjWnUsznAlnxn1j6EJSXp
 EJ30Q9XSvkdI97Utxms215lrzZN9SRoU8rrfUSPhRVmMpCvAPIvFjt7OmBw4khsE955k
 AyVukTI9p8s+enSxufor+Y8CcBSJ7p7YIcRA7R22GOKQ++Bi3pMnT7Qp05y2jwp/qXvV
 dAxw==
X-Gm-Message-State: ACgBeo2fcs9imqiMvtAVqZdyU0ba0bom3XmddeiJLfDGPtCJZfxXaDBM
 J0Th4nSR6W+963Ce4E7YnQDlJJrkDfE=
X-Google-Smtp-Source: AA6agR4FBFN+x/sadubmd0SYUEKWfxGwwbu9hv38iBqADEsB7NAUvJK2vZMuiOES3OuHFLGr7mqtfA==
X-Received: by 2002:a62:4c2:0:b0:52e:bd4d:50e1 with SMTP id
 185-20020a6204c2000000b0052ebd4d50e1mr49629750pfe.8.1662359484138; 
 Sun, 04 Sep 2022 23:31:24 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:23 -0700 (PDT)
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
Subject: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Date: Sun,  4 Sep 2022 23:30:58 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
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
device property API.

I believe that the only reason the driver, instead of the standard
devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
because it wanted to set up a pretty consumer name for the GPIO,
and we now have a special API for that.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 4834198cc86b..4a8a4a8522cb 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1856,20 +1856,19 @@ static int advk_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pcie->reset_gpio = devm_gpiod_get_from_of_node(dev, dev->of_node,
-						       "reset-gpios", 0,
-						       GPIOD_OUT_LOW,
-						       "pcie1-reset");
+	pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	ret = PTR_ERR_OR_ZERO(pcie->reset_gpio);
 	if (ret) {
-		if (ret == -ENOENT) {
-			pcie->reset_gpio = NULL;
-		} else {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get reset-gpio: %i\n",
-					ret);
-			return ret;
-		}
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get reset-gpio: %i\n",
+				ret);
+		return ret;
+	}
+
+	ret = gpiod_set_consumer_name(pcie->reset_gpio, "pcie1-reset");
+	if (ret) {
+		dev_err(dev, "Failed to set reset gpio name: %d\n", ret);
+		return ret;
 	}
 
 	ret = of_pci_get_max_link_speed(dev->of_node);

-- 
b4 0.10.0-dev-fc921
