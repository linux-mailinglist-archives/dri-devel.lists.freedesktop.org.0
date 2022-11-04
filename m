Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D311261984E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BACC10E7D2;
	Fri,  4 Nov 2022 13:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E0B10E7D2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:43:11 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id l9so3019974qkk.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7aFvSvKZV6J4j21H0wqTwTzV7dfZuRBIYj/wdHuln8A=;
 b=GaMee9e2GzV8cLSut9QKldsYQBEDoZfjIgBJdR8+LfWuj4/JzhrzKVSfN1KAXap1O+
 1KJpue8Xyhld3zHiktciY9r3VG3Lq0aCNDXL0/iYG8EDhQfHauzvuSOtRJzsIYfxkfNp
 eeJUnw+S51V8Lnh2BVryNy6s2Mq2AB0O41Z1mPVBqgegcqjqMDLnHu0xHBHAZfhpUplD
 MrEOloMQnAdHlZfQnu54tuPdjXNnsGavUEkBGNklZCS1Yxsj068ndfxvda/AeNUcv4Iq
 CjTo0LhZxPFNG41mDhTD+v0sLuiaLTHwLzc/2sVydKfe11FDM4dtTpZHzW/JyoaVeFIm
 FbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7aFvSvKZV6J4j21H0wqTwTzV7dfZuRBIYj/wdHuln8A=;
 b=vttx8Fxi6U8I1pvgPiGkNHy62z202wTd1a2amwvSVGypL/0iBw2m8sm7Z+oqDrcTlT
 oQBT57FMVsTVtXDLdlAqFwhE3h1OR3AM0a9LC5TXXk9buI3gjMInpqZTloHZ4nS+4I6f
 80b/bxC5KpxtGhvh/s0XwvTvdR2u/lumvtKKQfj/gfBYmXbm+STdd/rq8L+NN7T+6LKn
 myzTOT97UFDJ3O3CPw44g+T1F84BpwzGLDA/gE8ftcqUhJxj2X606uppTdGJCaHaMTxu
 47BWRRhrJX01wDOV7AaE91EqiXIjaSJsrUX1gddte81aP00h3a/+iCh5KCvA12rWd8tN
 X2zA==
X-Gm-Message-State: ACrzQf15PifyRCBdSiODSQjdaLspK+J6oSyuXmrIP2djzHKLjZPW4bYI
 qPu9XppD/xHZjiM6Ep2iEZepKQ==
X-Google-Smtp-Source: AMsMyM5h2Jt7+jT0RAOVbn0CG1cTAgwDsfRgt0Uidh3TtbGhH9wXo6gIn09S9DeruASfBxpjxXvjuw==
X-Received: by 2002:a05:620a:1256:b0:6fa:2370:a7e8 with SMTP id
 a22-20020a05620a125600b006fa2370a7e8mr21569937qkl.374.1667569390902; 
 Fri, 04 Nov 2022 06:43:10 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 fa3-20020a05622a4cc300b003a4f14378d1sm2461421qtb.33.2022.11.04.06.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:43:10 -0700 (PDT)
Message-ID: <6babddd0-13d8-0f55-1981-ac5cfed8e5ad@linaro.org>
Date: Fri, 4 Nov 2022 09:43:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [v2 05/10] dts-bindings: display: bridge: Add MHDP DP bindings
 for i.MX8MQ
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
References: <cover.1667463263.git.Sandor.yu@nxp.com>
 <aa8e5153d0ad12a2039ce44039f9ecf39e4a39d0.1667463263.git.Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aa8e5153d0ad12a2039ce44039f9ecf39e4a39d0.1667463263.git.Sandor.yu@nxp.com>
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
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, p.yadav@ti.com,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 02:44, Sandor Yu wrote:
> Add bindings for i.MX8MQ MHDP DisplayPort.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>

Same comments as for HDMI bindings patch. Everywhere.

> ---
>  .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> new file mode 100644
> index 000000000000..06ed881247ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-dp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence MHDP Displayport bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  The Cadence MHDP Displayport TX interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp-imx8mq-dp
> +
> +  reg:
> +    items:
> +      - description:
> +          Memory mapped base address and length of mhdptx apb registers.
> +
> +  phys:
> +    description:
> +      phandle to the Displayport PHY.
> +
> +  phy-names:
> +    items:
> +      - const: dpphy
> +
> +  interrupts:
> +    items:
> +      - description: Hotplug detect interrupter for cable plugin event.
> +      - description: Hotplug detect interrupter for cable plugout event.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node pointing to the output port of a display controller..
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mhdp: mhdp@32c00000 {

dp@

> +        compatible = "cdns,mhdp-imx8mq-dp";
> +        reg = <0x32c00000 0x100000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "plug_in", "plug_out";
> +        phys = <&dp_phy>;
> +        phy-names = "dpphy";
> +
> +        port {
> +            hdmi_in: endpoint {
> +                remote-endpoint = <&dcss_out>;
> +            };
> +        };
> +    };

Best regards,
Krzysztof

