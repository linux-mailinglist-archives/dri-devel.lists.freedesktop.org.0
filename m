Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F69619860
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C25510E7DC;
	Fri,  4 Nov 2022 13:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5F910E7DC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:45:46 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id z6so3032018qtv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vavmHFdy2UqqtSaeoQXAprIbQNUxvGgL2a6sfjfX8bo=;
 b=iAwllB/irUDcT6SbXQoW5KiHw7T62PcFpUyb6zPCWHLco9hXoKvpnr7HPeLKGHupX0
 EFbxZluDtrNTuq0mMuGmqKbVVHtPW8mmg/BLLQaY8neKBSp+ivsalguEathuGmeiVmhv
 MALOVfW1deKpH440RYNHLHhpzVaF8kpwV6+5bDFBFWGKSK6S258syC5PTfDGsfXulUIf
 CaqoE2c2lP4fgCywLW3DKz2n8Vhff7/MejTJcm/PSeSwr8+0+s8dVHMTBKFiuKidhOze
 I5SSKyj/zlAZNjs3lwrfRgKEJPfZ5CXMN2+UKq2D8OJRTx7wy/Y5nMezey8TZFmp3+e7
 YiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vavmHFdy2UqqtSaeoQXAprIbQNUxvGgL2a6sfjfX8bo=;
 b=xH6WX84LvPYGhi2J537zQsDMrF0qJPNIZ0BdFUMiow/tV79qSfhJUp2lK39ynWN6ku
 wXXc/VfJpB9hLGBjmzGFhvzzHIEeSHwkr58DCdjhEC6o6UduLVt0r4PJJeIoRZmYzbLK
 J10yY/OvjebZN1NIG4qDv1LbF+dhbZmJwSeh7WdJ87sqB88+zU/YVCXAyW57tZ7xbyAL
 1wLCYSPCNXbBp/BxyY9E1IIpaECjA3PZZK6nKZdk+bSJX4s/ey5vOyBefSKET7osxmhk
 nlDILhrZu9qP/08H7sSyi2UL+fwnyk1yORu9jc9YISbb8gh+XaouhrRa/1RfwcZqsp6g
 OMcQ==
X-Gm-Message-State: ACrzQf1AShw6eS/1/tClGaXY/52lg6hygSUkFpl/VSfmYdxVo19oFB3o
 4q51ycmhA0AmUFw8LwiX2M02gQ==
X-Google-Smtp-Source: AMsMyM5zQlLo8OgUbaae5LuaNGlR9OiqXZ/GlpPgTSOHs/IrBoDuUR7UyTkOWYg4+o9aO140bphOxQ==
X-Received: by 2002:a05:622a:1c15:b0:3a5:2602:7b99 with SMTP id
 bq21-20020a05622a1c1500b003a526027b99mr21380164qtb.127.1667569545298; 
 Fri, 04 Nov 2022 06:45:45 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac87541000000b003a56d82fd8csm603940qtr.91.2022.11.04.06.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:45:44 -0700 (PDT)
Message-ID: <e2ea63b4-3be1-0a5a-9618-8495026ccead@linaro.org>
Date: Fri, 4 Nov 2022 09:45:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [v2 07/10] dts-bindings: phy: Add Cadence HDP-TX DP PHY bindings
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
References: <cover.1667463263.git.Sandor.yu@nxp.com>
 <bea6eb888717e1c0a3efc58761b0e75e4104f737.1667463263.git.Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bea6eb888717e1c0a3efc58761b0e75e4104f737.1667463263.git.Sandor.yu@nxp.com>
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
> Add bindings for Cadence HDP-TX DisplayPort PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../bindings/phy/phy-cadence-hdptx-dp.yaml    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml
> new file mode 100644
> index 000000000000..ab6f4e25c425
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml

Use filename matching compatible, so cdns,hdptx-dp-phy.yaml

> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/phy-cadence-hdptx-dp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both lines.

> +
> +title: Cadence HDP(HDMI/DisplayPort) TX PHY for DisplayPort protocol binding

Drop binding

> +
> +description:
> +  This binding describes the Cadence HDP-TX PHY for DispalyPort protocol.

Drop "This binding describes"

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
> +    description:
> +      Offset of Cadence HDPTX APB configuration registers.

Same comments as usual.

> +
> +  clocks:
> +    items:
> +      description:
> +        PHY reference clock. Must contain an entry in clock-names.

Drop "Must contain an entry in clock-names."

> +
> +  clock-names:
> +    items:
> +      - const: refclk
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  cdns,num-lanes:
> +    description:
> +      Number of lanes.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3, 4]
> +    default: 4
> +
> +  cdns,max-bit-rate:
> +    description:
> +      Maximum DisplayPort link bit rate to use, in Mbps
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2160, 2430, 2700, 3240, 4320, 5400]
> +    default: 5400
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +    dp_phy: dp_phy@32c00000 {

phy
(and no underscores in node names)

> +        compatible = "cdns,hdptx-dp-phy";
> +        reg = <0x32c00000 0x100000>;
> +        #phy-cells = <0>;
> +        clocks = <&hdmi_phy_27m>;
> +        clock-names = "refclk";
> +        cdns,num-lanes = <4>;
> +        cdns,max-bit-rate = <5400>;
> +    };

Best regards,
Krzysztof

