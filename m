Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD552641DCD
	for <lists+dri-devel@lfdr.de>; Sun,  4 Dec 2022 17:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E50310E048;
	Sun,  4 Dec 2022 16:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818F910E048
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 16:09:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w15so15242440wrl.9
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Dec 2022 08:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSY/soRdbw3l7VfX1MPIQXbuFJkETcDbjbzdvzg9U1E=;
 b=nmnnLHjQQPJyJNBEfVfdOPXpOYw99+Ew34YDKQSA7EUqQ1wRE7HB99k+5HnDEsFXs6
 s/Wti8lfe/gDF0GC8HfFWK6SarmOEHUEk9+mOcTopjhIelQOQdkwrwTaJ2Nuha5VsgW2
 2H6F26qSiuyp8Kq/ZSHMfpgdbHvQFcFP1JzgfnxoezYYiNxdqBEBTLKe4Lp5bAtojZvR
 8CRQD22BJyoRVHfXHYamci85e1A3cN4zPEaRD05DJf6yKSFDZhxfON8l9cCNMXaL7xNB
 p3PM7GEe2pPEVM3wrIgGfBatgwqg3XW8DZRAw5uxGi7GSWYN8djxxtisjrQ0JrQ2Emxp
 xjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mSY/soRdbw3l7VfX1MPIQXbuFJkETcDbjbzdvzg9U1E=;
 b=HV08EkA9sEQJU1VqEMNGKy0NhhI4GEhSJJKKAZE1P28Hze3WsZ2bOk6qO9iLM5jIut
 5o0uL32PX1Vmjp1TCrFLwtMJiJbLr1iSpVz5cGaqSiTkJC4yklsVjdybb9/ywQ8eiNZM
 6k5L8zvLaLyKeWtqd1T71ijGbzPoOr1CAyd6qq/XyElT2ehPS1zCESRVa4R+TkTMUgyB
 y250VIj82mGkVGnIsk9tLzRdJqBElKTCGsp/0mSZgGi49yJjj1Ylkk2W+c+YkvI+eQoM
 YRTgKEse72tBqCF9QgBlWRDNuanqTx2SXDu5Gf83c74ObLfyUUWfQL9MZJ0/c1vbNGYX
 3i6A==
X-Gm-Message-State: ANoB5pme1y1A8YqxD/qFRWmp/Jq/cOdGYmnZpp3kJhq0d+O40zmZYItS
 yBBTJxvREXTKEUgeUadfJxc=
X-Google-Smtp-Source: AA0mqf5OXVS1lM5QoKtCTGOYBnrpmscrGHlaSSO7Jq8/Dc8cy0PB5VfXUZBhR9OrsdWfWopJ4DW8pw==
X-Received: by 2002:a5d:6dd1:0:b0:236:75a8:58d with SMTP id
 d17-20020a5d6dd1000000b0023675a8058dmr49641323wrz.295.1670170184810; 
 Sun, 04 Dec 2022 08:09:44 -0800 (PST)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 j13-20020a056000124d00b002421db5f279sm11847154wrx.78.2022.12.04.08.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 08:09:44 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Ban Tao <fengzheng923@gmail.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Benson Leung <bleung@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stephan Gerhold <stephan@gerhold.net>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, 
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
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
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Paul Cercueil <paul@crapouillou.net>, Jee Heng <jee.heng.sia@intel.com>, 
 Lubomir Rintel <lkundrak@v3.sk>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 Rohit kumar <rohitkr@codeaurora.org>, Derek Fang <derek.fang@realtek.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, ChiYuan Huang <cy_huang@richtek.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Matt Flax <flatmax@flatmax.com>, 
 Ricard Wanderlof <ricardw@axis.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: Reference common DAI properties
Date: Sun, 04 Dec 2022 17:09:41 +0100
Message-ID: <2251607.XGVbBG2WQu@archbook>
In-Reply-To: <20221203160442.69594-2-krzysztof.kozlowski@linaro.org>
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
 <20221203160442.69594-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Samstag, 3. Dezember 2022 17:04:41 CET Krzysztof Kozlowski wrote:
> Reference in all sound components which have '#sound-dai-cells' the
> dai-common.yaml schema, which allows to use 'sound-name-prefix'
> property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This is an output of discussion here:
> https://lore.kernel.org/all/Y255C+TGNVJ9fs8A@sirena.org.uk/
> 
> This patch supersedes previous WSA883x one.
> ---

Hello,

for rockchip,i2s-tdm, we get some (new?) warnings with W=1:

    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    DTC_CHK arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.2.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    DTC_CHK arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    DTC_CHK arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    DTC_CHK arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml

Apparently we don't have separate resets for tx/rx on i2s2 on this
hardware. Should we add 'm' to the allowed reset-names for this
case?

Cheers,
Nicolas Frattaroli



