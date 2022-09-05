Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF65ACAAB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDDC10E1B1;
	Mon,  5 Sep 2022 06:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51D510E1B0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 06:31:14 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 202so7282464pgc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 23:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U194c+dv3L8PGxjQRUqmKsyVJlhonDrX8vTPY/i9hXs=;
 b=Fkbc/qOj6ZS7IqaqFcyPDPM8EDvYCU7OGChWB/9DpWkiWqS2dcKh9l1ojNoGhPTnaD
 njtjyQXo+Rn/WKjPbWSgQwcSRXqdDOgJDGXNJQq5SFjXCfctlSjW18o5uDca1l2zvr9s
 qI1PzrfdfgBUibYLHx0f78UFpIn7lM4srMFlpQG6GGUAs+9ir4zw3UO2CcA6EiK7Fjf1
 bf4cjTs1g6ppz8vMIVX34VakImJ62Z/3L44MxW6WWlAwFP7SjkuSosBV+uw4t/dQJPMK
 jdTwvre314VlwpC1eofIVn09IiP/lYmwjM75pESkwXfDC4BXtIhlz1s+2S/HOBFZhOcr
 KREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U194c+dv3L8PGxjQRUqmKsyVJlhonDrX8vTPY/i9hXs=;
 b=kgM5sB2JsodkODhZMecZ4APqvyOpdg1JF7LWd8DiQrllbnkCHiFUk+6SeXp0bcS0e2
 f6iRB/XZZZApj4lcfM1bREoklJpRdcMKh5CxzpkboVGJCkRHdGmmIcEQLaETZ1HkgijV
 t8Am686xE2tEGdFdTk7uvBKyDW+dPM6NSbephhg3mRE/GWzUVpcI9pCPPlciq3k/byUw
 rOjTRLpraGElbOjzeI2HnW+3Pkht7qF2Q8g26/X2clDX5iFfO8heFB57s4uB7Ez3tl8H
 pZgkHF6XTXD7j4QJv+q5WxuA5dXjzKircCpA0qdEQlxyaDKYBTFWqIz4LA+q0XKQkPNB
 EUzg==
X-Gm-Message-State: ACgBeo1AcWjQA1CdoSeqT0AYEdYe9qkktdPHryrAC9v6ImixJQygUZkJ
 MzqY12nAFqZrENGVYC0y/WY=
X-Google-Smtp-Source: AA6agR5AcoEUClPAM45JZ1w1Bqqw5txpdGe6Mc9rimWxG6gO38z3tQNrUedFo00QOImtqhFwVKAqJg==
X-Received: by 2002:a63:914c:0:b0:42b:a8fa:eb4a with SMTP id
 l73-20020a63914c000000b0042ba8faeb4amr34343614pge.481.1662359473959; 
 Sun, 04 Sep 2022 23:31:13 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:13 -0700 (PDT)
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
Subject: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
Date: Sun,  4 Sep 2022 23:30:54 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
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

I would like to limit (or maybe even remove) use of
[devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
a bit, so let's switch to the generic device property API. It may even
help with handling secondary fwnodes when gpiolib is taught to handle
gpios described by swnodes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 47d26b5d9945..a8925dcd7edd 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -133,11 +133,11 @@ int tegra_output_probe(struct tegra_output *output)
 		}
 	}
 
-	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-						       output->of_node,
-						       "nvidia,hpd-gpio", 0,
-						       GPIOD_IN,
-						       "HDMI hotplug detect");
+	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
+					of_fwnode_handle(output->of_node),
+					"nvidia,hpd",
+					GPIOD_IN,
+					"HDMI hotplug detect");
 	if (IS_ERR(output->hpd_gpio)) {
 		if (PTR_ERR(output->hpd_gpio) != -ENOENT)
 			return PTR_ERR(output->hpd_gpio);

-- 
b4 0.10.0-dev-fc921
