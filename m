Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC7A6299FF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB50E10E3D6;
	Tue, 15 Nov 2022 13:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AC610E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:23:02 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id u11so17418883ljk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/o/3zwA1NwkP3vmamqHJzmINORKwtRnCyTK8X6rmfAY=;
 b=Fp/yh30hTCyxhHXOGgmHXKUy+b/GnFmVdNFACkGhNIF4QJas8UQyMBe0ZXMkaGc9hv
 RPBIgtKdUwfecY2HmklmKGh6a5yvsqJjZYcSwkPVTjJAjNpEh+nGKAu7SlqXd0GEQoj1
 S7aQZxTwySUt18174hxlfphLdUzzrazFROeVor69sXxnd8gyl/l1IeDVai4jV7IcTVKC
 E7+0k7S3W4gKClg5ZFqn7dD2I2PNoNTU/l06oUwBtXZwibpL2YPpVgYw20ixrSlRoXj0
 kOdMOj0/aVJs9BzWrrZx81ASunCXeipCjuH4qxgtDSdGMppq37i1ynC/yLNMKo31DYlc
 1rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/o/3zwA1NwkP3vmamqHJzmINORKwtRnCyTK8X6rmfAY=;
 b=zSn4UxxG7bF4PZSA3VSZfOkGYxU9LhAD/5YpusMXdqugkCshZqjnt6hlVvUgevrn0e
 hkUa13/c7sf17zQ+JVYAzJq44UabMlKzw/zYI04vOFVr5TjGXYHxXRsg3vBskoNfQMcY
 BEb8wkolArX5cM5SQC5eI7Jrd0+wVFu/veRC7ObJE9S11P7bVCx+pphWmICGu3G1eN9H
 DwJpXfTSV2t2pdZF3K6uGIMpKp0JrtNaM8K9bBUnP4bZofpLrq8y1s4PIJX4BdQo/1iF
 v9nK2dKs1pciMsd7V447F8XAaqHFO160WT/R9/6r4HdPd3nkljrtM4BBPZRqRhW6yTq9
 /cdA==
X-Gm-Message-State: ANoB5plqbxyDOVlubX47G8c6onuLXkJ9SVQNuhI/3TSNNyZ9S0l+u4PQ
 mMvi4baAScdvBlNOLU57rgVrXQ==
X-Google-Smtp-Source: AA0mqf4aI+PJ9CJYgPMHCCNlHjXG0ZEMQwuDfBpPge/N1r2HjXKeLCm1NzbPASZH5ZPVo1BO/jHh1A==
X-Received: by 2002:a2e:8e75:0:b0:277:3e88:4fb6 with SMTP id
 t21-20020a2e8e75000000b002773e884fb6mr5512224ljk.509.1668518580553; 
 Tue, 15 Nov 2022 05:23:00 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b41-20020a2ebc29000000b0026acc9edecdsm2504460ljf.47.2022.11.15.05.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:23:00 -0800 (PST)
Message-ID: <073ed7fc-e276-738c-d25e-7ef0baa11745@linaro.org>
Date: Tue, 15 Nov 2022 14:22:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/10] dt-bindings: display: bridge: Add MHDP HDMI for
 i.MX8MQ
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
References: <cover.1667911321.git.Sandor.yu@nxp.com>
 <9ccf53cad7f735f985f4ca37b3b0159ef78a2103.1667911321.git.Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9ccf53cad7f735f985f4ca37b3b0159ef78a2103.1667911321.git.Sandor.yu@nxp.com>
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
> Add bindings for i.MX8MQ MHDP HDMI.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> new file mode 100644
> index 000000000000..8c0afef157aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP HDMI bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  The Cadence MHDP TX HDMI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp-imx8mq-hdmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Hotplug detect interrupter for cable plugin event.
> +      - description: Hotplug detect interrupter for cable plugout event.

I don't know what is interrupter, so maybe just "cable plugin/plugout"
or "Hotplug cable plugin/plugout"?

Sorry for not bringing this earlier.

> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node pointing to the output port of a display controller.
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mhdp_hdmi: hdmi-bridge@32c00000 {
> +        compatible = "cdns,mhdp-imx8mq-hdmi";
> +        reg = <0x32c00000 0x100000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;

Align with opening <



Best regards,
Krzysztof

