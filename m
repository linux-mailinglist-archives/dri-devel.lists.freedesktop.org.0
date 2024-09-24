Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2EE984122
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A975310E670;
	Tue, 24 Sep 2024 08:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xj8q3SNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2710E144
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:55:24 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f75aa08a96so54710901fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727168122; x=1727772922; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3zPekBBQnYE9h1wNiBnPJ1W27ZUNg/CsS+5seicJ1+I=;
 b=Xj8q3SNVu7dN6Nn5r/exRJRPqhNaLepPggDtamgpC4P4Ce6cSo/7Gu5AH+TcuZKkLI
 v6KBm6qU3ieG/qPagXhcLE0kHEReNcrKd2jwFbOXr8KYZCBZSuGZPohMaMdFmWcPXWuT
 vsH1QKcUkYnHJtDpabVTUTd5tZQT9JkX8h5r5dqwQ+XG25t2y1KVuATbvQ+Ddtcuxlr8
 glWqFD7QO+IPoayOJ9402jzzh1k96gdVvOYxfHvcYSAgjbdozfwZ78hfK8n88Fq/L74a
 ra9vhemT9HWC1mRS5kJajqC4wNXVwJ6zp8hkF+LjYNFjHbiymitXlXkJ3X1H1ZxigiPc
 DjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727168122; x=1727772922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3zPekBBQnYE9h1wNiBnPJ1W27ZUNg/CsS+5seicJ1+I=;
 b=uFmLZ0v4tpkaNWtg54LpkrCUsFEKVmzrkC7wMIyJHAH20mjA/SsXXO/gFjkurc/BIa
 t5MDzvv3PAjjW/xVPzqcRWlfStkQktCDcr+LJAuWPsxTgTc3q7Z2w3NM8sdCggOFJym2
 yYJXMQDhevDfOa/xHlixbAeoQTlgS9J3E6/yLtpnMKQkFsFHQbg78kqJWgLEz6voZxWD
 2N8hKHo4XSFrTMmfIkYo1cDhHX2p1JaodK8gkEuKZxuWePPIRGQgeq/HbGukryzgPxUW
 XBOaIK4zfz9PvwR/hfQmnlXVPuxR6LgWq1AEWP+sAr802niDFfDN8NE1pPy/TvlluTmp
 TmcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEN2uxXJOgXoAUX2onCnIB05LppCBMPRGGEQgSo0zyKtl8ZofXWRuxwoa2zamSA42un/KqcZPM1BA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdX4MWQdRfk6+rSvKhXGgjx+BJHBK2ZVN0h7Anzr3Y/5ic41Mx
 WzNAjIlhB28dhjgMxgw5w8zf/2dOGlAT0IHOrie9bRPCO+TD6IyZr8H6ESEoB8Y=
X-Google-Smtp-Source: AGHT+IF6kGMJj95pD29Vie/S8ZFE7+n7j8iD9RC3u4NBK76/EBw9rwODDmYNVV5BSqgST6bsdkOcKg==
X-Received: by 2002:a2e:510a:0:b0:2f6:5f0a:9cfe with SMTP id
 38308e7fff4ca-2f7cb36059dmr56161761fa.30.1727168122127; 
 Tue, 24 Sep 2024 01:55:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289b68fsm1458611fa.115.2024.09.24.01.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 01:55:20 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:55:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v17 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Message-ID: <w72m4bxymngdadhp4x3mxyvv4j6k3mgtoqg3tcw4p3xdmhfpmx@wbkmfj3zmwcv>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <b2e1d26f964a03163ec7a1ba6ac8d7c88d6cb111.1727159906.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2e1d26f964a03163ec7a1ba6ac8d7c88d6cb111.1727159906.git.Sandor.yu@nxp.com>
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

On Tue, Sep 24, 2024 at 03:36:48PM GMT, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> v16->v17:
> - Add lane-mapping property
> 
> v9->v16:
>  *No change
> 
> .../display/bridge/cdns,mhdp8501.yaml         | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> new file mode 100644
> index 0000000000000..3f79f328c7425
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP8501 DP/HDMI bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  Cadence MHDP8501 DisplayPort/HDMI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mhdp8501
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: MHDP8501 DP/HDMI APB clock.
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      phandle to the DP/HDMI PHY
> +
> +  interrupts:
> +    items:
> +      - description: Hotplug cable plugin.
> +      - description: Hotplug cable plugout.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  lane-mapping:
> +    description: lane mapping for HDMI or DisplayPort interface.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port from display controller output.
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port to DisplayPort or HDMI connector.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - interrupt-names
> +  - phys
> +  - lane-mapping
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mhdp: display-bridge@32c00000 {
> +        compatible = "fsl,imx8mq-mhdp8501";
> +        reg = <0x32c00000 0x100000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "plug_in", "plug_out";
> +        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +        phys = <&mdhp_phy>;
> +        lane-mapping = <0xe4>;

What does this value mean? The DT should be describing the hardware, not
the register values. Can it be expressed as the data-lanes property of
the corresponding port?

> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mhdp_in: endpoint {
> +                    remote-endpoint = <&dcss_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                mhdp_out: endpoint {
> +                    remote-endpoint = <&dp_connector>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
