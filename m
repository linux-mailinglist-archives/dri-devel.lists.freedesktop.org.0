Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C176C25F3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 00:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF6E10E682;
	Mon, 20 Mar 2023 23:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A2310E680
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 23:45:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i13so1341972lfe.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 16:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679355920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6yNR8X23A98sblDxbw5Poz4eMrkTW4BedLygWYr/QqY=;
 b=zhreF+PljbDmKvP/Iu8G+igR5OmJ+q+rU5tYXa5BiCuhvU2aEL0hqMDkE1X3CBtvYq
 rlQPLKAkZkvoOyAUg86pz6otZJz5A+fLwDHzGsPp0EN1g2hTEr0CxiZsbIBPIXLFqYkx
 p5t4JPKg2aLkVadeG6d5hFz+pAxd8i2q1/LXw0qlUc9oEwZwdETPzo4JL5CNSZy4exeh
 BfO6Dwx8A1EhpO1q5OrU+lJK1EMc4iCXNaJbfQKqMxzE89PBrzPpgzrsP01BQoSrmwhX
 ANIU33RxUUEZa1DLvHUgf0Z4WQzagFOZzgzzicvpUYefiWMpiTzbnCwwQGs8mXHzYfyJ
 JGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679355920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6yNR8X23A98sblDxbw5Poz4eMrkTW4BedLygWYr/QqY=;
 b=NGYjjM/5GV2bC9ZBY2j7tih81qWb/EMgHairYDRD9lOnSTUz43NF6IyvW9LsQehKxb
 YV5ouTP7qMKh35BMNomFIE6ywYuuVp2VipHVdDpDefGcye7yz1OFB6/o0/POW+wOs3CN
 ecGUMhNx8QB8mbawdldOkk9CVadbWlcaJbXkRaUiuxs9dAcewnM5pdopMtVpZpS5fWmT
 KrHjPjdAH/I6odCEGKW5E6P+e8ChcH5QHXT88iZMQeOLELza0aiNEnalIgzBVFTZ8uJx
 +33NMqEo2K/wJBxrVgQ076coINqD1Gh47zab8vOK0o6uWgZytswdUACsTb19/wr3FTqG
 Ufag==
X-Gm-Message-State: AO0yUKUpOWyuUiGbBk8K5Cfhmo/JQhsbwLlOodcY4oAnz5Kp/H/hSBev
 E1BAp34dziHLQZKbW/zUq/SYpw==
X-Google-Smtp-Source: AK7set8MGVhASxzEwrHlVBfW2UlJo/rZ2P+TFZs8vUWIrx9O7hrMJAGVckUytY/qAEStsErgqHNslw==
X-Received: by 2002:ac2:4310:0:b0:4dd:af76:d3c with SMTP id
 l16-20020ac24310000000b004ddaf760d3cmr170842lfh.48.1679355920301; 
 Mon, 20 Mar 2023 16:45:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a2e98c9000000b00293534d9757sm1982264ljj.81.2023.03.20.16.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 16:45:19 -0700 (PDT)
Message-ID: <2e352a73-181e-7539-7932-f753b29ee967@linaro.org>
Date: Tue, 21 Mar 2023 01:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] dt-bindings: display: Drop unneeded quotes
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230320233823.2919475-1-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230320233823.2919475-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/03/2023 01:38, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>   - Also drop quotes on URLs
> ---
>   .../bindings/auxdisplay/holtek,ht16k33.yaml   |  2 +-
>   .../display/amlogic,meson-dw-hdmi.yaml        |  4 ++--
>   .../bindings/display/amlogic,meson-vpu.yaml   |  4 ++--
>   .../display/bridge/analogix,anx7625.yaml      |  4 ++--
>   .../display/bridge/cdns,mhdp8546.yaml         |  4 ++--
>   .../bindings/display/bridge/nxp,ptn3460.yaml  |  2 +-
>   .../display/bridge/toshiba,tc358767.yaml      |  2 +-
>   .../bindings/display/dp-aux-bus.yaml          |  2 +-
>   .../bindings/display/imx/nxp,imx8mq-dcss.yaml |  4 ++--
>   .../display/mediatek/mediatek,hdmi.yaml       |  2 +-
>   .../display/msm/dsi-controller-main.yaml      |  8 +++----
>   .../bindings/display/msm/dsi-phy-10nm.yaml    |  2 +-
>   .../devicetree/bindings/display/msm/gmu.yaml  |  4 ++--
>   .../devicetree/bindings/display/msm/gpu.yaml  |  4 ++--
>   .../devicetree/bindings/display/msm/mdp4.yaml |  4 ++--

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #display/msm

>   .../display/panel/ronbo,rb070d30.yaml         |  2 +-
>   .../bindings/display/renesas,du.yaml          |  4 ++--
>   .../display/tegra/nvidia,tegra114-mipi.yaml   |  2 +-
>   .../display/tegra/nvidia,tegra124-sor.yaml    | 12 +++++-----
>   .../display/tegra/nvidia,tegra186-dc.yaml     |  4 ++--
>   .../tegra/nvidia,tegra186-dsi-padctl.yaml     |  2 +-
>   .../display/tegra/nvidia,tegra20-dsi.yaml     | 12 +++++-----
>   .../display/tegra/nvidia,tegra20-hdmi.yaml    |  6 ++---
>   .../bindings/display/ti/ti,am65x-dss.yaml     |  6 ++---
>   .../bindings/display/ti/ti,j721e-dss.yaml     |  4 ++--
>   .../bindings/display/ti/ti,k2g-dss.yaml       |  4 ++--
>   .../display/xylon,logicvc-display.yaml        | 22 +++++++++----------
>   27 files changed, 66 insertions(+), 66 deletions(-)


-- 
With best wishes
Dmitry

