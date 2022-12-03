Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E16417A5
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 17:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DB310E1C8;
	Sat,  3 Dec 2022 16:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A5110E1C8
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 16:05:10 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f13so11944155lfa.6
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Dec 2022 08:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQQgA2B6JuQCl9Sn47gIOr5BLct1XCSVPgZ5wpqRd04=;
 b=Kj4DNPgsIyL3BIhG4CqIcBbcV1s+qCWiZr8CGSJQs9OvpzKtotQ465N2CNEnsvvZ1A
 3QpfbS43IgnSlXlDAYeRa7K+Olx/mZUocnOqdyDFZreb57z32+RvduL2PrG9zQHtbDcu
 73pdpp0PHB80Rl1+seCpOf9SYbLR7mNG159IaxkTLXTzFv0jxrgyezAxeLnjtcx5F1dn
 Hjf1PA4M8aFbQaCLterflhYSLXdvYo0sjQcKB4h4jgHBH+FrTaO+QAaCw4JQ96x0JYNW
 Wc28txwTUMBoRrciXidG353d4zSfbOpNnvzJODZQMCT+ey5IySIBHDdnwMUbIHqSVzBS
 Kq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQQgA2B6JuQCl9Sn47gIOr5BLct1XCSVPgZ5wpqRd04=;
 b=syLbUBheF3D1wEBHNsf649aHeY48V8JuTkMzQI404eNhMIyFT1Nhl8D/eLNJ7JSnpk
 iIUROTFGR2OGcnLd3RZk9a6jz28v+iK7npT3/4qkmuBQ/KJ5VR/lltLH3e4UpyPg1/Ix
 aVmPt3QRoZIlOZvGWkPvJaabIDknUPct2IE0P7bZkyRr+TCdm4P+RxL7mWeDwyYc6Z71
 EzzhoyNQwYhCsRdzAg1owvGYj7vV34ztW0ERv0D42vbNr7CiFwj7n1AMD1GsOWJmOBQ5
 KddVP8ANrmfMmDGrN6EkqlSUvc8Qa5k9fwMa06qtFbanwYCdXirQICNHwrDCLsHJNF4D
 chhw==
X-Gm-Message-State: ANoB5pnI0OJyMj4vVIUDCfk/01NZaIUYG6F3DhdkHxU5aTrYhBDPd9Gh
 6lnaZuJWtGhrfQ4FnXwgKqG9bg==
X-Google-Smtp-Source: AA0mqf72BVKnpn+MA5xJGVYlL5SnIsGDKLeZoYK756z5Q92VunWvwd331oN9TV1SKnOL4zeD/GFMxg==
X-Received: by 2002:ac2:4310:0:b0:4a2:3e6c:a32b with SMTP id
 l16-20020ac24310000000b004a23e6ca32bmr24364674lfh.54.1670083510167; 
 Sat, 03 Dec 2022 08:05:10 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 d11-20020ac2544b000000b004946bb30469sm1441320lfn.82.2022.12.03.08.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 08:05:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Benson Leung <bleung@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stephan Gerhold <stephan@gerhold.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.om>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, Jee Heng <jee.heng.sia@intel.com>,
 Lubomir Rintel <lkundrak@v3.sk>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Derek Fang <derek.fang@realtek.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 ChiYuan Huang <cy_huang@richtek.com>, Jose Abreu <joabreu@synopsys.com>,
 Andrew Davis <afd@ti.com>, Shi Fu <shifu0704@thundersoft.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Matt Flax <flatmax@flatmax.com>,
 Ricard Wanderlof <ricardw@axis.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, chrome-platform@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/3] ASoC: dt-bindings: maxim,max98357a: Convert to DT schema
Date: Sat,  3 Dec 2022 17:04:42 +0100
Message-Id: <20221203160442.69594-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
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

Convert the Maxim Integrated MAX98357A/MAX98360A amplifier bindings to
DT schema.  Add missing properties ('#sound-dai-cells' and
'sound-name-prefix' from common DAI properties).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

As a maintainer I added recent contributor to this driver/bindings:
Tzung-Bi Shih.  Please ack if you agree to keep an eye on the bindings.
---
 .../devicetree/bindings/sound/max98357a.txt   | 28 ----------
 .../bindings/sound/maxim,max98357a.yaml       | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/max98357a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98357a.yaml

diff --git a/Documentation/devicetree/bindings/sound/max98357a.txt b/Documentation/devicetree/bindings/sound/max98357a.txt
deleted file mode 100644
index 75db84d06240..000000000000
--- a/Documentation/devicetree/bindings/sound/max98357a.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Maxim MAX98357A/MAX98360A audio DAC
-
-This node models the Maxim MAX98357A/MAX98360A DAC.
-
-Required properties:
-- compatible   : "maxim,max98357a" for MAX98357A.
-                 "maxim,max98360a" for MAX98360A.
-
-Optional properties:
-- sdmode-gpios : GPIO specifier for the chip's SD_MODE pin.
-        If this option is not specified then driver does not manage
-        the pin state (e.g. chip is always on).
-- sdmode-delay : specify delay time for SD_MODE pin.
-        If this option is specified, which means it's required i2s clocks
-        ready before SD_MODE is unmuted in order to avoid the speaker pop noise.
-        It's observed that 5ms is sufficient.
-
-Example:
-
-max98357a {
-	compatible = "maxim,max98357a";
-	sdmode-gpios = <&qcom_pinmux 25 0>;
-};
-
-max98360a {
-	compatible = "maxim,max98360a";
-	sdmode-gpios = <&qcom_pinmux 25 0>;
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max98357a.yaml b/Documentation/devicetree/bindings/sound/maxim,max98357a.yaml
new file mode 100644
index 000000000000..83ba8666fbb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98357a.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98357a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98357A/MAX98360A amplifier
+
+maintainers:
+  - Tzung-Bi Shih <tzungbi@kernel.org>
+
+description:
+  Maxim Integrated MAX98357A/MAX98360A is a digital pulse-code modulation (PCM)
+  input Class D amplifier.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - maxim,max98357a
+      - maxim,max98360a
+
+  '#sound-dai-cells':
+    const: 0
+
+  sdmode-gpios:
+    maxItems: 1
+    description:
+      Chip's SD_MODE pin.  If missing the chip is always on.
+
+  sdmode-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Delay time for SD_MODE pin changes intended to make I2S clocks ready
+      before SD_MODE is unmuted in order to avoid the speaker pop noise.
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    amplifier {
+        compatible = "maxim,max98360a";
+        #sound-dai-cells = <0>;
+        sdmode-gpios = <&qcom_pinmux 25 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.34.1

