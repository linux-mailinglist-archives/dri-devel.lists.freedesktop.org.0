Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E7633ABA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 12:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF5910E3CB;
	Tue, 22 Nov 2022 11:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F81210E3C5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 11:03:56 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id s8so23019942lfc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 03:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zcinWTUxzmlD4ETHKdNfDgH3HuvcezRo5wS9GT3LS6U=;
 b=VK+gZmXqaDrn/uu3zDv9bml7Bq/CdP84f5gKch5vTxrzFx0j4BF1qx5rzxGApvrIsA
 5Eu7PO9kyK0VwIqazcJxh2hYz7i2k8jEEBSlkpVTryuIZRc+zdiP654jBspBaGwmlwky
 5XyO2IKbwxQFsOHAYo+cKtAPwbnQjQZnXzWYCB3K9N0Hn4HIYtI/Eq/yVhCysKjCZbVl
 cXuuet/YXxh1Hw6v29pwAlo2Z8vk/9Uy0aKFIWwbpOQVPFAEwqTE7AfILmhvnZVok35Y
 +BCLX8hiXgBjwWfjZy0cgkvgczMFCqY8LWjPFSQh2DX2XnReiBmIpLGVtX6v4jSV+dt2
 zM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcinWTUxzmlD4ETHKdNfDgH3HuvcezRo5wS9GT3LS6U=;
 b=ZkNTupgTcdMch9oBb0JrRiAKZ2GePttgRUBcuZv620talmPWJX+VCq34iTSMaDJHOO
 ut079X+uRSm3icexj7p+lqoy1KKqwP++gTcavcji7Mff+c4BYgLGafnKFc9PSVQzAQLI
 1iGl7HpuYL6WpW1bPrsAHlcdA/FrfqryKHOcwO37bo5thKuxN/pUxQo2BOsgOjzsgjLF
 n7lcqQzDV4fI56Qox7UlZUcw1dCJoIwYo5mIIvnw8+GfyVbr9Dnz0vzkAsIM+aHuYyEC
 zMKKb/JTwkqsDVZFs82tiow5envdTCpWNzrtFT7wku+VKcCpWfI3mBlqhAeaF3Ntxiok
 Mmvg==
X-Gm-Message-State: ANoB5pkBQVuAR6RdEkKEyB204mUZ5sU+inMUznResSqH5AejfvTC9iHt
 0FfLAtziwYcNG7Ua7X9jcjQ51Q==
X-Google-Smtp-Source: AA0mqf5e0DuqvZwYG6CYp8J8pYkWb7Fa/PJ9p3aq6DrglvSC6J24tlD1cUzaZ9rzXnecRgt0Ah/ddg==
X-Received: by 2002:ac2:5618:0:b0:4a2:455c:622a with SMTP id
 v24-20020ac25618000000b004a2455c622amr998103lfd.508.1669115034440; 
 Tue, 22 Nov 2022 03:03:54 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05651233c300b004a0589786ddsm2431100lfg.69.2022.11.22.03.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 03:03:53 -0800 (PST)
Message-ID: <bea11c30-09a1-2b13-db7e-25dadc6e43ec@linaro.org>
Date: Tue, 22 Nov 2022 12:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 09/10] dt-bindings: phy: Add Cadence HDP-TX HDMI PHY
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, kishon@ti.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, alexander.stein@ew.tq-group.com
References: <cover.1669013346.git.Sandor.yu@nxp.com>
 <2c5da069419541e22b29079467887f1a1bd3cc69.1669013346.git.Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2c5da069419541e22b29079467887f1a1bd3cc69.1669013346.git.Sandor.yu@nxp.com>
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
Cc: oliver.brown@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/11/2022 08:23, Sandor Yu wrote:
> Add bindings for Cadence HDP-TX HDMI PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../bindings/phy/cdns,hdptx-hdmi-phy.yaml     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
> new file mode 100644
> index 000000000000..99352e655eec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cdns,hdptx-hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence HDP-TX(HDMI/DisplayPort) PHY for HDMI protocol
> +
> +maintainers:
> +  - Sandor Yu <sandor.yu@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,hdptx-hdmi-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PHY reference clock.
> +      - description: APB clock.
> +
> +  clock-names:
> +    items:
> +      - const: refclk
> +      - const: apbclk

Drop "clk" suffix.

Best regards,
Krzysztof

