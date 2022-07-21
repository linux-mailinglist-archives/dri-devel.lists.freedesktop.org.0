Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84857CF0D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 17:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA76510E517;
	Thu, 21 Jul 2022 15:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A1D10E21D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 15:32:21 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a10so2264935ljj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qkcak79PKqus0FBcBxREwIPQ11TDFoKGG7oCkfoXPQc=;
 b=SwxDA2lsFKhk6eufWqim1Ro7JRbs5otwloShXKdIpq6ZcJReMBAY58gN0E7UQp6NHa
 wSI10aoScdzw8YSJQKeSc8ZiJ2/jQrOCKox3W9A7U/I4/PTgvHSf9xW7a1onx8EY9iYk
 BwZQ4PSquN8zdyaSiAFB/pFTprslWTyuIlKIe7mpnyuqWJ+aqoU9wNkMOSOkuizT6zdW
 8Ju7sAzettoIlO1AWlALjN59qJamLNafzIFzH9m8ccBNUht5Z2U3T63oAK2mFdYRALZa
 LdJNeykJiUPFRDhNj+y5tpsvd0/5F8ceDQgABQr50RMi820tS3INbLiOe9iCmBOrhtxQ
 /Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qkcak79PKqus0FBcBxREwIPQ11TDFoKGG7oCkfoXPQc=;
 b=zx1DkdEkHmmCHh+kpcYnL+pESiAmgGLwk5s738ISxNUzVLQKj8uSQ6N57kjh5UF7Tf
 S5PL2mWkvx7l8tbgkytY1jNKTPysYn0mE7zy1Wm80OwTtTasb2xH+z9VhR1xwYxSSL71
 ktTmOsPjveXROi+++vjFIvLIY7GACKuMD+BqUXI9c9DBbaYGwg8iiy8/5OYw4btV2COb
 QkG0bzy+ZrEFav3Vd/t2TMK7Fgk00kXizvVH+ayKjDy+qKXLP61HXQoqf6giLFtlS1mM
 lVRRB/mWAz8VYsuNfEeDUypJuDx2r0jpNfMXRTobkuT3nZ6EaRoqBOEPBQD/nIaPa5+N
 hGbQ==
X-Gm-Message-State: AJIora9Q+mWK4VbyoD+MbC9x0gL1evvhKYz4j/Mgtzu48Spah797G9HW
 WxBKvzcD73VUshKATSumrcMs4A==
X-Google-Smtp-Source: AGRyM1t5FpFk3c1ZpM6yYyF3OrMRK1RSMfVVWmGiA4wJJR3dTOcfJAhsvvr1fmUCOx5XIdCoKvqclQ==
X-Received: by 2002:a2e:b947:0:b0:25d:d6f6:adaf with SMTP id
 7-20020a2eb947000000b0025dd6f6adafmr3741489ljs.230.1658417539757; 
 Thu, 21 Jul 2022 08:32:19 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
 by smtp.gmail.com with ESMTPSA id
 a27-20020ac25e7b000000b0048a2995772asm504604lfr.73.2022.07.21.08.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:32:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Tomislav Denis <tomislav.denis@avl.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>, Nuno Sa <nuno.sa@analog.com>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Mark Brown <broonie@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Marek Belisko <marek@goldelico.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Christian Eggers <ceggers@arri.de>, Beniamin Bia <beniamin.bia@analog.com>,
 Stefan Popa <stefan.popa@analog.com>,
 Oskar Andero <oskar.andero@gmail.com>,
 =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli@axis.com>,
 Dan Murphy <dmurphy@ti.com>, Sean Nyekjaer <sean@geanix.com>,
 Cristian Pop <cristian.pop@analog.com>, Lukas Wunner <lukas@wunner.de>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Matheus Tavares <matheus.bernardino@usp.br>,
 Sankar Velliangiri <navin@linumiz.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Stefan Wahren <stefan.wahren@in-tech.com>, Pratyush Yadav <p.yadav@ti.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, netdev@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: net: explicitly list SPI CPHA and CPOL
Date: Thu, 21 Jul 2022 17:31:54 +0200
Message-Id: <20220721153155.245336-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
References: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The spi-cpha and spi-cpol properties are device specific and should be
accepted only if device really needs them.  Explicitly list them in
device bindings in preparation of their removal from generic
spi-peripheral-props.yaml schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/nfc/marvell,nci.yaml     | 12 ++++++++++--
 .../devicetree/bindings/net/vertexcom-mse102x.yaml   | 12 +++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml b/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml
index 1bcaf6ba822c..00b3918a9bf2 100644
--- a/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml
@@ -56,8 +56,16 @@ properties:
     description: |
       For UART type of connection. Specifies that the chip is using RTS/CTS.
 
-  spi-cpha: true
-  spi-cpol: true
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
+
   spi-max-frequency: true
 
 required:
diff --git a/Documentation/devicetree/bindings/net/vertexcom-mse102x.yaml b/Documentation/devicetree/bindings/net/vertexcom-mse102x.yaml
index 8156a9aeb589..9dc1609f6d06 100644
--- a/Documentation/devicetree/bindings/net/vertexcom-mse102x.yaml
+++ b/Documentation/devicetree/bindings/net/vertexcom-mse102x.yaml
@@ -34,9 +34,15 @@ properties:
   interrupts:
     maxItems: 1
 
-  spi-cpha: true
-
-  spi-cpol: true
+  spi-cpha:
+    type: boolean
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    type: boolean
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
 
   spi-max-frequency:
     minimum: 6000000
-- 
2.34.1

