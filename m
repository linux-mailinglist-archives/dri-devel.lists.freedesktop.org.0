Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC31629A21
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E50C10E3D8;
	Tue, 15 Nov 2022 13:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FDB10E3D9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:27:01 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g12so24444406lfh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c1ts3WN+RK4DUBdlD4M3Bwnl561dvzeyCNo0CvSc+zE=;
 b=uVQaMXfcVvgl6dY7WMPggsTDm0+KfwTZI7cWciTCNUSEZCUs+x6piaaNQwsxTfhwRh
 uOWKjHFFg4Re5C4G/wRe/7enXuo39uj90ALGEWMAySjuuu1eCEi8AQihRFil8jxymSvn
 fKWpCGoULpMN074yjNjTRMZeeYISUzf8+MctxAOQJIC+jAmQz/T8RRZT4teiLCGzH7fN
 d9oU4p6M5d6+ySdmSXQ3XR4vdls4MHZJghumAxwG1OsgOBEl3zvIN4VLX2flTpRMKlCs
 BKMPWKSNQM5dHDPqry+lg3kYW2d8Z90X/th4rvGxQdtLbTPCFPHnUNHJugm47Cg2diOy
 IOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c1ts3WN+RK4DUBdlD4M3Bwnl561dvzeyCNo0CvSc+zE=;
 b=VODtPIUlFRW8/wocXzHfzgbDXRlWlyrLCnqvrkPWcnmngAe4St1iJNZAFPrnFDaJHH
 GBxIYN5fvBulg3gZWm82rB2nhyAVtg/ggoIZZFnTF5Oor94t7dqmoX+ZtWdX0Ln1f+sh
 deDwLPVQUu6m2Mujf/0NlElC5zJjV0NPDLVhvJetz/pzeyceYq3GoFyriCBFbWenCKvq
 gFuyPgOB70GAvAvUcl2NTgFWDpUjjSaO3XSEDWMCYzjFvKwyxYoJ7pmwZpG34Ib4SUjM
 vLOXPfra+fShwjMcHH5XDZENHjeeW/k1AnjM/mATX4SYKlgli5q5dzewmsOGRnVWjx8/
 cprw==
X-Gm-Message-State: ANoB5pkfdNMc4iHhggWckrp3tSQ/oZdjFuIun3O1ZojW5Rg4Xj2ByCR4
 CvFzWsl7iw8y1c3dlX17BtnzBK1zvLNXFqq9
X-Google-Smtp-Source: AA0mqf7Fu+p+QJN27fSwZXLyKZi1beoLQadBDtK20wEhdBa9hUNak27U2LuRZwAIe1ezmM5grv/amg==
X-Received: by 2002:ac2:5fce:0:b0:494:8b3d:bb84 with SMTP id
 q14-20020ac25fce000000b004948b3dbb84mr5257707lfg.48.1668518820123; 
 Tue, 15 Nov 2022 05:27:00 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a2eb622000000b0026fe0a052c5sm2499675ljn.129.2022.11.15.05.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:26:59 -0800 (PST)
Message-ID: <9af79043-09b9-91dd-60d5-6dc41c197763@linaro.org>
Date: Tue, 15 Nov 2022 14:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 07/10] dt-bindings: phy: Add Cadence HDP-TX DP PHY
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
References: <cover.1667911321.git.Sandor.yu@nxp.com>
 <31ddc1508e01618db62bb9421d15745d525a6d10.1667911321.git.Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <31ddc1508e01618db62bb9421d15745d525a6d10.1667911321.git.Sandor.yu@nxp.com>
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 14:00, Sandor Yu wrote:
> Add bindings for Cadence HDP-TX DisplayPort PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../bindings/phy/cdns,hdptx-dp-phy.yaml       | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
> new file mode 100644
> index 000000000000..8f9b8ba7d1c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cdns,hdptx-dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence HDP-TX(HDMI/DisplayPort) PHY for DisplayPort protocol
> +
> +maintainers:
> +  - Sandor Yu <sandor.yu@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,hdptx-dp-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      description:

Missing -

> +        PHY reference clock.

Join with previous line.

     - description: foo bar


Best regards,
Krzysztof

