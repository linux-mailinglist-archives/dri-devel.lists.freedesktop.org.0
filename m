Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B067FEA2
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 12:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A868903B;
	Sun, 29 Jan 2023 11:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6531E8903B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 11:46:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r2so8695240wrv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 03:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q7mkqEU4uSNcC/souhhQCKfdHQR1f/GwKbFACfeiSw8=;
 b=ZZiVMpPR4dCSS0JCrzqkIIP9+6EKR1VAw7I2B+SKearBzD6dhIhthOHbPJr6botL32
 k2Wr11VSSmxu3YbPRhQ1B56kWn7xNCH9ftDdplBR34cXxHxo69Ma+2iS7iGhfiBoZXUR
 CZfU+Be/5zIUahSgTsEDCn9x04J+F3h4c6KRNltlCdzsVV8Y4aDcx6W3UFuAdTKcaJSc
 1UkxNk6ixU4DJqKa+M2AxATMSkIL9wf17NPXNQinQ4SAEDyIBhxYXaPJ0J2a6KpPI7f9
 7FuZeeedlPvMcFYrCV4h+AeKkjvLcaNICDyV1lM5iCyGgwFTXXTGOhfPc9VhfqaWh2eP
 EmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q7mkqEU4uSNcC/souhhQCKfdHQR1f/GwKbFACfeiSw8=;
 b=yvbYY6AplmtTnntAMzVweGWZQfwHoLZvKcU/4GDUO8vhp8c2MYW8Lf/4ws5pS/8BBv
 5ZHx5akX5rLnzq9UJ/7yhkyU+fWFBMEo1UTRojKih1fO5HLLpuiYSR8D2NeO35wmiGAM
 ja2hGNPxmHjoiRhlCeWcM4vDoKN+Vc0AJODTi5LxTGwNupYGZcZEWmSEwmE8UognRZb0
 vU5uKXQv9FaOHkgjfNxKbGOzWrObz+gGD/9gBCHq7lz6cin3UsEwN20tj7DaABodx6sn
 gziyG1hEg2pelbFSOSDpPtosV6o/0yGyiKa0ES/2lHvJY4Gp/t4JcjFD7+BrEOoN5at0
 Ve0Q==
X-Gm-Message-State: AFqh2kqDMyaCzzESn2WG0EhztbXXaV+6oAQq4896c+eRZiXdkPsIh+WA
 oHICWoJueQCQ6yDCKkA7N7gYcg==
X-Google-Smtp-Source: AMrXdXssrHw6STGJ3GmPU/EnWu/3lii26xImgKRkdovDdo14zXU3VG6dhI/ytRUzw6RFBBRwulZPkg==
X-Received: by 2002:adf:f0c1:0:b0:2bc:67d:c018 with SMTP id
 x1-20020adff0c1000000b002bc067dc018mr40432601wro.48.1674992810832; 
 Sun, 29 Jan 2023 03:46:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 b11-20020adfe30b000000b002bfcc940014sm7736284wrj.82.2023.01.29.03.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 03:46:50 -0800 (PST)
Message-ID: <3c07b9bd-1981-2945-9efe-80afb0195de8@linaro.org>
Date: Sun, 29 Jan 2023 12:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Add NXP i.MX93 parallel
 display format configuration
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230128034713.1530218-1-victor.liu@nxp.com>
 <20230128034713.1530218-2-victor.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128034713.1530218-2-victor.liu@nxp.com>
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
Cc: neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-imx@nxp.com, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, kernel@pengutronix.de,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/01/2023 04:47, Liu Ying wrote:
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add device tree bindings for the display format configuration.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/nxp,imx93-pdfc.yaml        | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml
> new file mode 100644
> index 000000000000..a84bfb46b01d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/nxp,imx93-pdfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX93 Parallel Display Format Configuration
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> +  configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> +  field.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx93-pdfc


Based on description, I have doubts this is a separate bridge device.
Why this is not part of display driver/bindings?

We do not create usually devices for single registers, because they are
not a devices. Devices are a bit more complex - have some pin
inputs/outputs, not a register only. Of course there are exception, but
this one does not look like one.

> +
> +  reg:
> +    maxItems: 1

Your driver tells different story:

syscon_node_to_regmap(dev->of_node->parent);

(which also points to fact this is not a separate device)

Best regards,
Krzysztof

