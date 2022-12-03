Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8546417A2
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 17:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54310E1C7;
	Sat,  3 Dec 2022 16:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ABE10E1C7
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 16:05:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f13so11943858lfa.6
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Dec 2022 08:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bs98NVdnF/6VPq5vIlCxterkT2OJfCVrqP9P4g0Syyo=;
 b=KBI+3S+Bi0gjNHb+BnTZgrTtbd/RgKl+ZTHehPtG9nCvwQ6wryjSYx5qwuutKzZXNY
 eu4G6eoqDqGetE61e4y06moJ20SvmtUroQuzz9g418VxdKglPBTPmRGL9ZnWzGKweUlf
 j3xwWJMTuwtQc5ofilzGdd1O5WxLdsAScX5XYLx9Zp+cYDYQ0uP2EjObq/V1t/oCbsjs
 PqyE9J078A3rAGQcJrIIBR3tH6Gw71+sgF8GLcAr6OM+FS9qdrTUSWh82H7T6xyLIgTv
 /G0grKMMSMKGnX/bTib8CcxmuRHCC+pbIMeB51pe8nGg6heugwn1UU/1JtiBEVIyvqEc
 nBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bs98NVdnF/6VPq5vIlCxterkT2OJfCVrqP9P4g0Syyo=;
 b=fAudJKsZKPsu5z8r/02vreyN881VLJFT3YRRyN8/eAZTgvZIRSI/w6NJp+1MOg7m0W
 izh7lzRurA6ucLb4KwQlz9ijKEnqDmfQKJiKwbXnC5kiORIdoawSJ28KhVS1uNqEqXhM
 L/P/QQ7k5Ipt985v0GsekoWKZq0+VonVP4bnCUfYRzFrmVPTjjoGdKNzzNEBwqBmkBpj
 cwv+BazL9Ww+vkgiZe4gv6VWbEhUFw722hxCa3S4wGh8ZA1yzbkhTBWaSTmVI/JqrOGZ
 X0dlA0gy/yN2mpY/JBfY6ZPFZ+BpxP3AwD5eFliki1UOxbLn06f163uCGWCOpzNj24H9
 frMg==
X-Gm-Message-State: ANoB5pnT/QcM4q7oHuwQ4e4QRvCU8VeKcCk8vvVGwRH52Ngcx6F8zRiN
 lrt/l8szItJ+ndWWqyN+9N6jLQ==
X-Google-Smtp-Source: AA0mqf53J+Oo1Bhg6i1vFd9gDrnJUlViDvHhD+stuY++ykYqVbRH8B1fLzAeE7k+UmIJkRQCdQQI0g==
X-Received: by 2002:a05:6512:74d:b0:494:7551:b764 with SMTP id
 c13-20020a056512074d00b004947551b764mr20333420lfs.574.1670083502802; 
 Sat, 03 Dec 2022 08:05:02 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 d11-20020ac2544b000000b004946bb30469sm1441320lfn.82.2022.12.03.08.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 08:04:59 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: dt-bindings: Reference common DAI properties
Date: Sat,  3 Dec 2022 17:04:41 +0100
Message-Id: <20221203160442.69594-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reference in all sound components which have '#sound-dai-cells' the
dai-common.yaml schema, which allows to use 'sound-name-prefix'
property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is an output of discussion here:
https://lore.kernel.org/all/Y255C+TGNVJ9fs8A@sirena.org.uk/

This patch supersedes previous WSA883x one.
---
 .../bindings/sound/adi,adau1372.yaml          |  5 +++-
 .../bindings/sound/adi,adau1977.yaml          |  1 +
 .../bindings/sound/adi,adau7118.yaml          |  5 +++-
 .../devicetree/bindings/sound/ak4375.yaml     |  5 +++-
 .../devicetree/bindings/sound/ak4613.yaml     |  5 +++-
 .../devicetree/bindings/sound/ak4642.yaml     |  5 +++-
 .../sound/allwinner,sun4i-a10-codec.yaml      |  3 +-
 .../sound/allwinner,sun4i-a10-i2s.yaml        |  3 +-
 .../sound/allwinner,sun4i-a10-spdif.yaml      |  3 +-
 .../sound/allwinner,sun50i-h6-dmic.yaml       |  5 +++-
 .../sound/allwinner,sun8i-a33-codec.yaml      |  5 +++-
 .../devicetree/bindings/sound/apple,mca.yaml  |  5 +++-
 .../bindings/sound/cirrus,cs35l41.yaml        |  3 +-
 .../bindings/sound/cirrus,cs35l45.yaml        |  5 +++-
 .../bindings/sound/cirrus,cs42l51.yaml        |  5 +++-
 .../bindings/sound/cirrus,lochnagar.yaml      |  5 +++-
 .../bindings/sound/cirrus,madera.yaml         |  3 ++
 .../bindings/sound/davinci-mcasp-audio.yaml   |  3 +-
 .../bindings/sound/everest,es8316.yaml        |  5 +++-
 .../devicetree/bindings/sound/fsl,sai.yaml    |  3 +-
 .../bindings/sound/google,cros-ec-codec.yaml  |  5 +++-
 .../bindings/sound/ingenic,aic.yaml           |  5 +++-
 .../bindings/sound/ingenic,codec.yaml         |  5 +++-
 .../bindings/sound/intel,keembay-i2s.yaml     |  5 +++-
 .../bindings/sound/linux,bt-sco.yaml          |  5 +++-
 .../bindings/sound/marvell,mmp-sspa.yaml      |  5 +++-
 .../bindings/sound/mchp,i2s-mcc.yaml          | 18 ++++++-----
 .../bindings/sound/mchp,spdiftx.yaml          |  5 +++-
 .../bindings/sound/microchip,pdmc.yaml        |  5 +++-
 .../bindings/sound/nvidia,tegra20-spdif.yaml  |  5 +++-
 .../bindings/sound/qcom,lpass-cpu.yaml        |  3 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml   |  5 +++-
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |  5 +++-
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  5 +++-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |  5 +++-
 .../bindings/sound/qcom,q6adm-routing.yaml    |  5 +++-
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  5 +++-
 .../devicetree/bindings/sound/qcom,q6apm.yaml |  1 +
 .../bindings/sound/qcom,wcd938x.yaml          |  5 +++-
 .../bindings/sound/qcom,wsa883x.yaml          |  7 ++++-
 .../bindings/sound/realtek,rt5682s.yaml       |  5 +++-
 .../bindings/sound/renesas,fsi.yaml           |  5 +++-
 .../bindings/sound/renesas,rsnd.yaml          |  3 +-
 .../bindings/sound/renesas,rz-ssi.yaml        |  5 +++-
 .../bindings/sound/richtek,rt9120.yaml        |  5 +++-
 .../bindings/sound/rockchip,i2s-tdm.yaml      |  5 +++-
 .../bindings/sound/rockchip,pdm.yaml          |  5 +++-
 .../bindings/sound/rockchip,rk3328-codec.yaml |  5 +++-
 .../bindings/sound/rockchip-i2s.yaml          |  5 +++-
 .../bindings/sound/rockchip-spdif.yaml        | 23 +++++++-------
 .../bindings/sound/rohm,bd28623.yaml          |  5 +++-
 .../bindings/sound/samsung-i2s.yaml           |  5 +++-
 .../devicetree/bindings/sound/sgtl5000.yaml   |  5 +++-
 .../bindings/sound/snps,designware-i2s.yaml   | 30 +++++++++----------
 .../sound/socionext,uniphier-aio.yaml         |  5 +++-
 .../sound/socionext,uniphier-evea.yaml        |  5 +++-
 .../bindings/sound/st,stm32-i2s.yaml          |  5 +++-
 .../bindings/sound/st,stm32-spdifrx.yaml      |  5 +++-
 .../devicetree/bindings/sound/tas2562.yaml    |  5 +++-
 .../devicetree/bindings/sound/tas2770.yaml    |  5 +++-
 .../devicetree/bindings/sound/tas27xx.yaml    |  5 +++-
 .../bindings/sound/ti,tlv320adc3xxx.yaml      |  5 +++-
 .../bindings/sound/wlf,arizona.yaml           |  3 ++
 .../devicetree/bindings/sound/wlf,wm8731.yaml |  1 +
 .../devicetree/bindings/sound/wlf,wm8940.yaml |  5 +++-
 .../devicetree/bindings/sound/wlf,wm8961.yaml |  5 +++-
 .../devicetree/bindings/sound/wlf,wm8962.yaml |  5 +++-
 .../devicetree/bindings/sound/wlf,wm8978.yaml |  5 +++-
 .../devicetree/bindings/sound/zl38060.yaml    |  5 +++-
 69 files changed, 276 insertions(+), 95 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
index 59f7c60a14ba..f1ba70723e6a 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
@@ -14,6 +14,9 @@ description: |
   Analog Devices ADAU1372 four inputs and two outputs codec.
   https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1372.pdf
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -42,7 +45,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/adi,adau1977.yaml b/Documentation/devicetree/bindings/sound/adi,adau1977.yaml
index 847b83398d3d..dba3023a45e5 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1977.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau1977.yaml
@@ -51,6 +51,7 @@ required:
   - AVDD-supply
 
 allOf:
+  - $ref: dai-common.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
index fb78967ee17b..12f60507aed7 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
@@ -15,6 +15,9 @@ description: |
   standalone mode.
   https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU7118.pdf
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -57,7 +60,7 @@ required:
   - iovdd-supply
   - dvdd-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/ak4375.yaml b/Documentation/devicetree/bindings/sound/ak4375.yaml
index 5f0fc584bb38..587598e122c6 100644
--- a/Documentation/devicetree/bindings/sound/ak4375.yaml
+++ b/Documentation/devicetree/bindings/sound/ak4375.yaml
@@ -9,6 +9,9 @@ title: AK4375 DAC and headphones amplifier
 maintainers:
   - Vincent Knecht <vincent.knecht@mailoo.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: asahi-kasei,ak4375
@@ -35,7 +38,7 @@ required:
   - avdd-supply
   - tvdd-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/ak4613.yaml b/Documentation/devicetree/bindings/sound/ak4613.yaml
index aa8a258a9f1c..010574645e6a 100644
--- a/Documentation/devicetree/bindings/sound/ak4613.yaml
+++ b/Documentation/devicetree/bindings/sound/ak4613.yaml
@@ -9,6 +9,9 @@ title: AK4613 I2C transmitter
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: asahi-kasei,ak4613
@@ -35,7 +38,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/ak4642.yaml b/Documentation/devicetree/bindings/sound/ak4642.yaml
index 48a5b2c3934e..437fe5d7cae1 100644
--- a/Documentation/devicetree/bindings/sound/ak4642.yaml
+++ b/Documentation/devicetree/bindings/sound/ak4642.yaml
@@ -9,6 +9,9 @@ title: AK4642 I2C transmitter
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -37,7 +40,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 292fcb643999..78273647f766 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -102,6 +102,7 @@ required:
   - dma-names
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -228,7 +229,7 @@ allOf:
               - Mic
               - Speaker
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index dd30881ad2f5..739114fb6549 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -61,6 +61,7 @@ properties:
     maxItems: 1
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -128,7 +129,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
index 68c84e29ce57..8108c564dd78 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
@@ -54,6 +54,7 @@ properties:
     maxItems: 1
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -104,7 +105,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
index 0920f2f81a1c..763b876047c1 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -9,6 +9,9 @@ title: Allwinner H6 DMIC
 maintainers:
   - Ban Tao <fengzheng923@gmail.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -59,7 +62,7 @@ required:
   - dma-names
   - resets
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
index 4eb11a8e622b..63eadc4200ac 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Chen-Yu Tsai <wens@csie.org>
   - Maxime Ripard <mripard@kernel.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   "#sound-dai-cells":
     minimum: 0
@@ -49,7 +52,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
index d5dc92b5b654..40e3a202f443 100644
--- a/Documentation/devicetree/bindings/sound/apple,mca.yaml
+++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
@@ -14,6 +14,9 @@ description: |
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     items:
@@ -106,7 +109,7 @@ required:
   - power-domains
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
index 51d815d0c696..82062d80d700 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
@@ -146,6 +146,7 @@ required:
   - "#sound-dai-cells"
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         cirrus,boost-type:
@@ -171,7 +172,7 @@ allOf:
           cirrus,gpio1-src-select:
             enum: [1]
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 184a1344ea76..88a0ca474c3d 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -14,6 +14,9 @@ description: |
   CS35L45 is a Boosted Mono Class D Amplifier with DSP
   Speaker Protection and Adaptive Battery Management.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -52,7 +55,7 @@ required:
   - reg
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
index 963a871e74da..422cbf38bfdb 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
@@ -9,6 +9,9 @@ title: CS42L51 audio codec DT bindings
 maintainers:
   - Olivier Moysan <olivier.moysan@foss.st.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: cirrus,cs42l51
@@ -46,7 +49,7 @@ required:
   - reg
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/sound/cirrus,lochnagar.yaml
index cea612d3d4a7..52f024f5302a 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,lochnagar.yaml
@@ -24,6 +24,9 @@ description: |
   This binding must be part of the Lochnagar MFD binding:
     [1] ../mfd/cirrus,lochnagar.yaml
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -49,4 +52,4 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/sound/cirrus,madera.yaml b/Documentation/devicetree/bindings/sound/cirrus,madera.yaml
index 23138ddcb62d..014d4eaa8793 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,madera.yaml
@@ -22,6 +22,9 @@ description: |
 
   The properties are all contained in the parent MFD node.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   '#sound-dai-cells':
     description:
diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
index f46c66bc6b2d..7735e08d35ba 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
@@ -167,6 +167,7 @@ required:
   - interrupt-names
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         opmode:
@@ -177,7 +178,7 @@ allOf:
       required:
         - tdm-slots
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index 3b752bba748b..d9f8f0c7f6bb 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Daniel Drake <drake@endlessm.com>
   - Katsuhiro Suzuki <katsuhiro@katsuster.net>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: everest,es8316
@@ -33,7 +36,7 @@ required:
   - reg
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 022da1f4583d..5b28d2d51327 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -140,6 +140,7 @@ properties:
     description: optional, some dts node didn't add it.
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -181,7 +182,7 @@ required:
   - dma-names
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index ab86e4a36b2a..1434f4433738 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -17,6 +17,9 @@ description: |
   subnode of a cros-ec node.
   (see Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: google,cros-ec-codec
@@ -42,7 +45,7 @@ required:
   - compatible
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index c4f9b3c2bde5..ba44406c9caf 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -9,6 +9,9 @@ title: Ingenic SoCs AC97 / I2S Controller (AIC) DT bindings
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   $nodename:
     pattern: '^audio-controller@'
@@ -53,7 +56,7 @@ properties:
       - const: rx
       - const: tx
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/ingenic,codec.yaml b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
index 48aae54dd643..a07d607e9b93 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
@@ -9,6 +9,9 @@ title: Ingenic JZ47xx internal codec DT bindings
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   $nodename:
     pattern: '^audio-codec@.*'
@@ -37,7 +40,7 @@ properties:
   '#sound-dai-cells':
     const: 0
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
index b2603f611af9..2ac0a4b3cd18 100644
--- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -13,6 +13,9 @@ maintainers:
 description: |
  Intel KeemBay I2S
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -64,7 +67,7 @@ required:
   - clock-names
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
index b97e0fcbdba3..a67b79cbe006 100644
--- a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
+++ b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
@@ -9,6 +9,9 @@ title: Bluetooth SCO Audio Codec
 maintainers:
   - Mark Brown <broonie@kernel.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   '#sound-dai-cells':
     enum:
@@ -26,7 +29,7 @@ required:
   - '#sound-dai-cells'
   - compatible
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
index 81f266d66ec5..92d896e0d323 100644
--- a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
+++ b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
@@ -9,6 +9,9 @@ title: Marvel SSPA Digital Audio Interface Bindings
 maintainers:
   - Lubomir Rintel <lkundrak@v3.sk>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   $nodename:
     pattern: "^audio-controller(@.*)?$"
@@ -73,7 +76,7 @@ required:
   - dma-names
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml b/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
index 0481315cb5f2..621022872c8d 100644
--- a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
+++ b/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
@@ -66,13 +66,15 @@ properties:
     enum: [0, 1, 2, 3]
     default: 0
 
-if:
-  properties:
-    compatible:
-      const: microchip,sam9x60-i2smcc
-then:
-  properties:
-    microchip,tdm-data-pair: false
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: microchip,sam9x60-i2smcc
+    then:
+      properties:
+        microchip,tdm-data-pair: false
 
 required:
   - "#sound-dai-cells"
@@ -84,7 +86,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml b/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
index d218e4ab9a7a..c383162140bb 100644
--- a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
+++ b/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
@@ -13,6 +13,9 @@ description:
   The Microchip Sony/Philips Digital Interface Transmitter is a serial port
   compliant with the IEC-60958 standard.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   "#sound-dai-cells":
     const: 0
@@ -53,7 +56,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
index 04414eb4ada9..c37b89d94c12 100644
--- a/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
@@ -13,6 +13,9 @@ description:
   The Microchip Pulse Density Microphone Controller (PDMC) interfaces up to 4
   digital microphones having Pulse Density Modulated (PDM) outputs.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: microchip,sama7g5-pdmc
@@ -75,7 +78,7 @@ required:
   - dma-names
   - microchip,mic-pos
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
index 60a368a132b8..dc76a4dc0ed2 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
@@ -16,6 +16,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-spdif
@@ -66,7 +69,7 @@ required:
   - dma-names
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index ef18a572a1ff..5e26b3e9db2c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -109,9 +109,10 @@ required:
   - interrupt-names
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 14016671f32b..23564fd394a2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -9,6 +9,9 @@ title: LPASS(Low Power Audio Subsystem) RX Macro audio codec DT bindings
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -58,7 +61,7 @@ required:
   - reg
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index e647ba392a0f..38708578ee29 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -9,6 +9,9 @@ title: LPASS(Low Power Audio Subsystem) TX Macro audio codec DT bindings
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -62,7 +65,7 @@ required:
   - reg
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index c36caf90b837..188883a2e671 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -9,6 +9,9 @@ title: LPASS(Low Power Audio Subsystem) VA Macro audio codec DT bindings
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -61,7 +64,7 @@ required:
   - reg
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 155c7344412a..bebca3e3f86f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -9,6 +9,9 @@ title: LPASS(Low Power Audio Subsystem) VA Macro audio codec DT bindings
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -52,7 +55,7 @@ required:
   - reg
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml b/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
index b7ed2d3f21f9..3f11d2e183e1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
@@ -14,6 +14,9 @@ description:
   Qualcomm Audio Device Manager (Q6ADM) routing node represents routing
   specific configuration.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -26,7 +29,7 @@ required:
   - compatible
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 4b3ce779206b..894e653d37d7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -22,7 +25,7 @@ required:
   - compatible
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
index cd434e8268ce..ef1965aca254 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
@@ -11,6 +11,7 @@ maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 allOf:
+  - $ref: dai-common.yaml#
   - $ref: /schemas/soc/qcom/qcom,apr-services.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 51547190f709..67d84463eaeb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -13,6 +13,9 @@ description: |
   Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC.
   It has RX and TX Soundwire slave devices.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -106,7 +109,7 @@ required:
   - qcom,micbias4-microvolt
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 99f9c10bbc83..65b0e67f82a3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -15,6 +15,9 @@ description: |
   Their primary operating mode uses a SoundWire digital audio
   interface. This binding is for SoundWire interface.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: sdw10217020200
@@ -43,7 +46,7 @@ required:
   - "#thermal-sensor-cells"
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -61,6 +64,7 @@ examples:
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            sound-name-prefix = "SpkrLeft";
         };
 
         speaker@0,2 {
@@ -70,6 +74,7 @@ examples:
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            sound-name-prefix = "SpkrRight";
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
index dc418652f241..e631ace7aad1 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -12,6 +12,9 @@ maintainers:
 description: |
   Rt5682s(ALC5682I-VS) is a rt5682i variant which supports I2C only.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,rt5682s
@@ -104,7 +107,7 @@ properties:
     description: Regulator supplying power to the digital core and charge pump
       through the LDO1_IN pin.
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index 0dd3f7361399..df91991699a7 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -9,6 +9,9 @@ title: Renesas FIFO-buffered Serial Interface (FSI)
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   $nodename:
     pattern: "^sound@.*"
@@ -64,7 +67,7 @@ required:
   - power-domains
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 7df40c38e865..cb90463c7297 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -274,6 +274,7 @@ required:
   - "#sound-dai-cells"
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -304,7 +305,7 @@ allOf:
               - ssi
               - audmapp
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 0d9840375132..196881d94396 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -9,6 +9,9 @@ title: Renesas RZ/{G2L,V2L} ASoC Sound Serial Interface (SSIF-2)
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     items:
@@ -90,7 +93,7 @@ required:
   - resets
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/richtek,rt9120.yaml b/Documentation/devicetree/bindings/sound/richtek,rt9120.yaml
index 5655ca568240..a1242e8e0687 100644
--- a/Documentation/devicetree/bindings/sound/richtek,rt9120.yaml
+++ b/Documentation/devicetree/bindings/sound/richtek,rt9120.yaml
@@ -16,6 +16,9 @@ description: |
   applications like as TV, monitors. home entertainment, electronic music
   equipment.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -42,7 +45,7 @@ required:
   - dvdd-supply
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index 0503f4f3fb1a..4c95895de75e 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -14,6 +14,9 @@ description:
 maintainers:
   - Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -138,7 +141,7 @@ required:
   - reset-names
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
index 22e1cf6c0592..ff9e400494f3 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
@@ -16,6 +16,9 @@ description:
 maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -83,7 +86,7 @@ required:
   - dma-names
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
index 75b3b33b5f1f..5cdb8bcc687b 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
@@ -8,6 +8,9 @@ title: Rockchip rk3328 internal codec
 
 maintainers:
   - Heiko Stuebner <heiko@sntech.de>
+allOf:
+  - $ref: dai-common.yaml#
+
 
 properties:
   compatible:
@@ -53,7 +56,7 @@ required:
   - rockchip,grf
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index 7e36e389e976..1cb4da300607 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -13,6 +13,9 @@ description:
 maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -111,7 +114,7 @@ required:
   - dma-names
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index d0a24bf928d6..4f51b2fa82db 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -75,17 +75,18 @@ required:
   - dma-names
   - "#sound-dai-cells"
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: rockchip,rk3288-spdif
-
-then:
-  required:
-    - rockchip,grf
-
-additionalProperties: false
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3288-spdif
+    then:
+      required:
+        - rockchip,grf
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml b/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
index 859ce64da152..5abcf92bc484 100644
--- a/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
+++ b/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
@@ -14,6 +14,9 @@ description:
 maintainers:
   - Katsuhiro Suzuki <katsuhiro@katsuster.net>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: rohm,bd28623
@@ -50,7 +53,7 @@ required:
   - VCCP2-supply
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
index 84c4d6cba521..8d5dcf9cd43e 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     description: |
@@ -124,7 +127,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/sgtl5000.yaml b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
index 2bc7f00ce4a2..02059d66b084 100644
--- a/Documentation/devicetree/bindings/sound/sgtl5000.yaml
+++ b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
@@ -9,6 +9,9 @@ title: Freescale SGTL5000 Stereo Codec
 maintainers:
   - Fabio Estevam <festevam@gmail.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: fsl,sgtl5000
@@ -88,7 +91,7 @@ required:
   - VDDA-supply
   - VDDIO-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
index 4b0795819064..56e623d4e168 100644
--- a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
@@ -50,21 +50,21 @@ properties:
       - const: rx
     minItems: 1
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: canaan,k210-i2s
-
-then:
-  properties:
-    "#sound-dai-cells":
-      const: 1
-
-else:
-  properties:
-    "#sound-dai-cells":
-      const: 0
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: canaan,k210-i2s
+    then:
+      properties:
+        "#sound-dai-cells":
+          const: 1
+    else:
+      properties:
+        "#sound-dai-cells":
+          const: 0
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml b/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
index 70f62ecd6eb2..9cf0efaed88e 100644
--- a/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
+++ b/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
@@ -9,6 +9,9 @@ title: UniPhier AIO audio system
 maintainers:
   - <alsa-devel@alsa-project.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -70,7 +73,7 @@ patternProperties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml b/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
index be6acfda9999..985277648de1 100644
--- a/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
+++ b/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
@@ -9,6 +9,9 @@ title: UniPhier EVEA SoC-internal sound codec
 maintainers:
   - <alsa-devel@alsa-project.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: socionext,uniphier-evea
@@ -48,7 +51,7 @@ patternProperties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index d3966ae04ad0..a040d4d31412 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -13,6 +13,9 @@ description:
   The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
   Only some SPI instances support I2S.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -68,7 +71,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
index 837e830c47ac..bc48151b9adb 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
@@ -13,6 +13,9 @@ description: |
   The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
   IEC-60958 and IEC-61937.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -57,7 +60,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
index 30f6b029ac08..1085592cefcc 100644
--- a/Documentation/devicetree/bindings/sound/tas2562.yaml
+++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
@@ -22,6 +22,9 @@ description: |
     https://www.ti.com/lit/gpn/tas2564
     https://www.ti.com/lit/gpn/tas2110
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -58,7 +61,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/tas2770.yaml b/Documentation/devicetree/bindings/sound/tas2770.yaml
index bc90e72bf7cf..982949ba8a4b 100644
--- a/Documentation/devicetree/bindings/sound/tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/tas2770.yaml
@@ -16,6 +16,9 @@ description: |
   Integrated speaker voltage and current sense provides for
   real time monitoring of loudspeaker behavior.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -60,7 +63,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/tas27xx.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
index 66a0df8850ea..0957dd435bb4 100644
--- a/Documentation/devicetree/bindings/sound/tas27xx.yaml
+++ b/Documentation/devicetree/bindings/sound/tas27xx.yaml
@@ -16,6 +16,9 @@ description: |
   loudspeakers. Integrated speaker voltage and current sense provides
   for real time monitoring of loudspeaker behavior.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -53,7 +56,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
index 83936f594d1a..ede14ca2c07a 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
@@ -14,6 +14,9 @@ description: |
   https://www.ti.com/product/TLV320ADC3001
   https://www.ti.com/product/TLV320ADC3101
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -106,7 +109,7 @@ required:
   - reg
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/wlf,arizona.yaml b/Documentation/devicetree/bindings/sound/wlf,arizona.yaml
index 1627c0bb69be..8156f30eadd6 100644
--- a/Documentation/devicetree/bindings/sound/wlf,arizona.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,arizona.yaml
@@ -16,6 +16,9 @@ description: |
   This document lists sound specific bindings, see the primary binding
   document ../mfd/arizona.yaml
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   '#sound-dai-cells':
     description:
diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
index 15795f63b5a3..858c0f689581 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
@@ -61,6 +61,7 @@ required:
   - DCVDD-supply
 
 allOf:
+  - $ref: dai-common.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8940.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8940.yaml
index 7386abb3a250..3e809217c4ca 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8940.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8940.yaml
@@ -9,6 +9,9 @@ title: Wolfson WM8940 Codec
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   '#sound-dai-cells':
     const: 0
@@ -27,7 +30,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
index 795d34e1e97a..f58078545569 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
@@ -9,6 +9,9 @@ title: Wolfson WM8961 Ultra-Low Power Stereo CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8961
@@ -24,7 +27,7 @@ required:
   - reg
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
index 5e172e9462b9..5fe0b2c9f99f 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
@@ -9,6 +9,9 @@ title: Wolfson WM8962 Ultra-Low Power Stereo CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8962
@@ -87,7 +90,7 @@ required:
   - SPKVDD1-supply
   - SPKVDD2-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
index 1c8985d4dd5a..efb5f9f6cc7a 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
@@ -9,6 +9,9 @@ title: Wolfson WM8978 Codec
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   '#sound-dai-cells':
     const: 0
@@ -27,7 +30,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/zl38060.yaml b/Documentation/devicetree/bindings/sound/zl38060.yaml
index 338e2a13c775..2c5c02e34573 100644
--- a/Documentation/devicetree/bindings/sound/zl38060.yaml
+++ b/Documentation/devicetree/bindings/sound/zl38060.yaml
@@ -15,6 +15,9 @@ maintainers:
   - Jaroslav Kysela <perex@perex.cz>
   - Takashi Iwai <tiwai@suse.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: mscc,zl38060
@@ -48,7 +51,7 @@ required:
   - gpio-controller
   - '#sound-dai-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

