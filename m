Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A86641EDD
	for <lists+dri-devel@lfdr.de>; Sun,  4 Dec 2022 19:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA8810E03F;
	Sun,  4 Dec 2022 18:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C2E10E03F
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 18:32:31 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso10250675wme.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Dec 2022 10:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cT6XsFeikKqtH1/hCcOrW6pF6YKm2yjZrCCnG8JeZLE=;
 b=YY31dTp15ts/Sd2mG4d4Znp5cd0G0qqvDj3IRWl0XuNT9Yto3NXrjJS5gszXn7RWHn
 RpjCotoEVSlLlonPHNwJP1TCiJRRkkKAcGEZ8EfBRcsG6yvbfZB1inHPervKq6osS7xm
 NJIx2owTgSqNCsFpFYl9tQejPnYMEDG2FBAY3KJnV+ZLsPiVQ4zahlOuWLRbRj4EcxRl
 6U9NUiY070rRU3dQeHmHym3VcILeTFk1q21u8fCl630Atust2KqldbbvqZwRlvHqft27
 J5n1jMlZ2Cmg94qlkwYAUJ5lo/Thj627DGaQuxdxtNNouDyvDo4QcPZbYLhaGDYxMLAh
 btNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cT6XsFeikKqtH1/hCcOrW6pF6YKm2yjZrCCnG8JeZLE=;
 b=78KEZBkvcij/mlPuVyh/r//ys8SH7Ei8Ts++mQbi2KljJUNzcKeM1PovlieVFqs3Om
 iTFWpOSVwRwcvAAht8VHmdi33IynWXnlywZVw/5Td7i3mbQ+r4l/zsGGjKCXv/7/zP8g
 lediM0lbVWiRQrXiIbSXGG2k256XadRJW+l3JsG3uaNb/cpjHGyhStb4LhpNd33WXCwU
 ZGYcb325V8Myjpii1JlOaI6+wWx6UkGgasQQn4jzca6PKckwItePcXZaGmODtbAc2Vjd
 mItJ5csMaG4SaNQYmXRBETSjTXJzKthb9cF8qoFV9baczj6CJzkgBiSFKgdcVKk132ih
 hP1w==
X-Gm-Message-State: ANoB5pkcwj4EPI1ywR5ZMOp8u3f5t0noy97S4L4CZqQMnMloAz3PsofD
 +hMnj8BvArLo1lQo3WztbY4=
X-Google-Smtp-Source: AA0mqf5w9S5gt2nyROsIJ/KepCdghxD2S5KWJ22n53ipvP7a98YVBzA2u2fA7xIwo0AsFvdt9OTByA==
X-Received: by 2002:a05:600c:3590:b0:3d0:1489:78c4 with SMTP id
 p16-20020a05600c359000b003d0148978c4mr47437513wmq.167.1670178749708; 
 Sun, 04 Dec 2022 10:32:29 -0800 (PST)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 i2-20020adff302000000b002421a8f4fa6sm12120806wro.92.2022.12.04.10.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 10:32:29 -0800 (PST)
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
Date: Sun, 04 Dec 2022 19:32:26 +0100
Message-ID: <13951589.OODuZ4BQiV@archbook>
In-Reply-To: <7c258f71-23d0-36bd-8abf-b227d2522267@linaro.org>
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
 <2251607.XGVbBG2WQu@archbook>
 <7c258f71-23d0-36bd-8abf-b227d2522267@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sonntag, 4. Dezember 2022 17:47:05 CET Krzysztof Kozlowski wrote:
> On 04/12/2022 17:09, Nicolas Frattaroli wrote:
> > On Samstag, 3. Dezember 2022 17:04:41 CET Krzysztof Kozlowski wrote:
> >> Reference in all sound components which have '#sound-dai-cells' the
> >> dai-common.yaml schema, which allows to use 'sound-name-prefix'
> >> property.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> This is an output of discussion here:
> >> https://lore.kernel.org/all/Y255C+TGNVJ9fs8A@sirena.org.uk/
> >>
> >> This patch supersedes previous WSA883x one.
> >> ---
> > 
> > Hello,
> > 
> > for rockchip,i2s-tdm, we get some (new?) warnings with W=1:
> > 
> >     /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
> >             From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> 
> I did not touch reset names, so are you sure these are not old warnings?
> 
> 
> Best regards,
> Krzysztof
> 
> 

You are correct, these aren't new, I thought they were due to it now
actually checking reset-names or something. However, checking with
linux-next/master shows that these were already there. Apologies for
the noise.

For rockchip,i2s-tdm:

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Acked-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Kind regards,
Nicolas Frattaroli


