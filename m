Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB1641E08
	for <lists+dri-devel@lfdr.de>; Sun,  4 Dec 2022 17:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC1E10E00C;
	Sun,  4 Dec 2022 16:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C0410E00C
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 16:47:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id d3so11015254ljl.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Dec 2022 08:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IBSaaBdFn+BP+xzbg2xAiyjV0AjU3IsjmFiKfeCqqvI=;
 b=wJTrVXJOn+oqKMcWQtvULX7ulDXWLrtPzSQaCY4aUPic6EJRnTU8lpjcSCs4NXujGa
 5B/GwS81kHr5ShQHFdRjt18fi0NXOrNAxrT32DzlDZqRkiOO5QiTijH3HjRfEmwPz/hA
 1XRsGbRqG4MCscTzmETpOCXB8HlJc04gBwdTPqQUbctpbJDffiaNKZ5OjZmS+oaGNOEw
 k4gP18xu7u1DfYB80LqsTWgMRMj2XnMS8u/wnDxGaqKvhZQc4/fOU45+Lhn+N04UZVc6
 IJlhricGMUAFHmurSmdMVqg9SwBN3M2FwtGiSoFgVVS5Ly1wTyC/jXRj8agENVJkzVw+
 KPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IBSaaBdFn+BP+xzbg2xAiyjV0AjU3IsjmFiKfeCqqvI=;
 b=c04wUQKNRM4d9+HZeph9tM58jDyekmJ1EBtlDNv4iUzkjGZk4gRYGCJOkraF4w6bAW
 w9y91N5JPzP2L+XfnisIKmwub+xcvIg1bsXEZIxTNG0AG/23y+qJqq3XJ+zkk1S1CS4e
 lEA0csQQ68pz0vR/vVusdmBehSDmZwzUyo2gt0rbm1u2RQB6Kyq/9qdNh/inpXglVQD1
 CrSb8Gs13/xBuuxSCPQExHXx/bfXyOpoAI4+/HvT7itrvnbY3E5PEjp4QaB88X0BhwmF
 oXQKwQmvOKYHU3BkZJzZZlkgujT9ONr1uJ4doDvSmibUiB5jHJYnjIhrp/VsAw0+y7VE
 xNQA==
X-Gm-Message-State: ANoB5pmxRZX2mhTlmbPFm0zX25Q1ORalP1FG827sJpUCfwG/XUtaU4yi
 o3ME5HdkJ9JCocYun3QulOcpUA==
X-Google-Smtp-Source: AA0mqf4kBdTo6SDQ4Um37LTIlSLql9Lw0iLy1FQ9H6KpXZOkmUBpkamfuV9PNogA/0JeVQ7HB2Tjjw==
X-Received: by 2002:a05:651c:1510:b0:277:75fb:1fc5 with SMTP id
 e16-20020a05651c151000b0027775fb1fc5mr24664380ljf.405.1670172429042; 
 Sun, 04 Dec 2022 08:47:09 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a0565120b8d00b004b373f61a60sm1828538lfv.96.2022.12.04.08.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 08:47:08 -0800 (PST)
Message-ID: <7c258f71-23d0-36bd-8abf-b227d2522267@linaro.org>
Date: Sun, 4 Dec 2022 17:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: Reference common DAI properties
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>,
 =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stephan Gerhold
 <stephan@gerhold.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Heiko Stuebner <heiko@sntech.de>,
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
 Bogdan Togorean <bogdan.togorean@analog.com>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <nuno.sa@analog.com>, Vincent Knecht <vincent.knecht@mailoo.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki
 <katsuhiro@katsuster.net>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, Jee Heng <jee.heng.sia@intel.com>,
 Lubomir Rintel <lkundrak@v3.sk>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Derek Fang <derek.fang@realtek.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Matt Flax <flatmax@flatmax.com>, Ricard Wanderlof <ricardw@axis.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
 <20221203160442.69594-2-krzysztof.kozlowski@linaro.org>
 <2251607.XGVbBG2WQu@archbook>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2251607.XGVbBG2WQu@archbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 04/12/2022 17:09, Nicolas Frattaroli wrote:
> On Samstag, 3. Dezember 2022 17:04:41 CET Krzysztof Kozlowski wrote:
>> Reference in all sound components which have '#sound-dai-cells' the
>> dai-common.yaml schema, which allows to use 'sound-name-prefix'
>> property.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> This is an output of discussion here:
>> https://lore.kernel.org/all/Y255C+TGNVJ9fs8A@sirena.org.uk/
>>
>> This patch supersedes previous WSA883x one.
>> ---
> 
> Hello,
> 
> for rockchip,i2s-tdm, we get some (new?) warnings with W=1:
> 
>     /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
>             From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml

I did not touch reset names, so are you sure these are not old warnings?


Best regards,
Krzysztof

