Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0B507131
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851CB89D61;
	Tue, 19 Apr 2022 14:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1CF89D61
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:58:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1694421wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7ghNXW0NodixkgL8T98CLlpDZH/0jSgrfBNvM5ej23s=;
 b=hlZSGMyqcDPTQx6RmtGj1koskcBFnvovRkA/NkQQc1kdKfUCK/xvxNwK2/QMga//vt
 gvgPCxHQlSAHj+yHIujC+BRmhj1gLP7ekLjV7ZD7NrecJ3BdrZHOw6YBvn/B6cItuKKf
 MdBYEq0rFmbIYogIZIjdsOO2THvp40Dfj3qsPVPkMBNI2i35smPdCI7UEoXt/JwhcW9Q
 gx7Jeu3EnBQWxS746ict9bmJuk74OzwMEBkyzbwQJSY3huu8lXCtxwI5vk9YhVDeGMl8
 YXCw7i4742XSHTgAlzm+90dybKw5PvgRAAqbic2G3krhErrfckVz+/ESYOyynHb2tL31
 7WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7ghNXW0NodixkgL8T98CLlpDZH/0jSgrfBNvM5ej23s=;
 b=o2+uCHaydqF9vkIp7C5xiKNcmSC2FIH3AxwgI5AHHqF49f/Ol6mHeX6ehvy7CsfWWU
 Of4Cf5mPz/YhUqeQPPYl/OObff3r4gUXVYvzWU7bayUDBJCcsoZYCnIpmeyXRyWMQbJ9
 YIS8jgz9I3538YhqvQsR3tftpZ/WCMDiZuM6fzIwu2dLYSWLbb6OSur0DZN25m6lKz5S
 TG4tvPIe8FoXnDnZEcHEjUQqrqFVRU7FFaUNmgCC/vk165dLd752dnlWxsgqmA7yEHqg
 wwUwYT2cmxZiCglhNrCGkgePEy+vFcqQie+FuqVAXEZeYcCRqFcLeswd4ptdKEqS9TGb
 up1Q==
X-Gm-Message-State: AOAM533RKGN56R6c4S5OcI84udnM5cIn5E+9D3+Onn4DNdioZcEQXAy0
 uiYz2nxppw6H1HBJu52/CwU=
X-Google-Smtp-Source: ABdhPJybiVLTSTP7L0aETG6uMJhUECVA5p62Vy3/QCjle5pk3JlVskw99zgtPeLU158U++lWgJMu7w==
X-Received: by 2002:a05:600c:3785:b0:38e:bca8:f0c1 with SMTP id
 o5-20020a05600c378500b0038ebca8f0c1mr19958744wmr.56.1650380314825; 
 Tue, 19 Apr 2022 07:58:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a5d59a3000000b0020a9132d1fbsm6605119wrr.37.2022.04.19.07.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 07:58:34 -0700 (PDT)
Message-ID: <83a7f222-f62c-fa47-9370-f9b709c3110e@gmail.com>
Date: Tue, 19 Apr 2022 16:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: add power and gce
 properties
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-2-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419033237.23405-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/04/2022 05:32, Rex-BC Chen wrote:
> From: "jason-jh.lin" <jason-jh.lin@mediatek.com>
> 
> Power:
> 1. Add description for power-domains property.
> 
> GCE:
> 1. Add description for mboxes property.
> 2. Add description for mediatek,gce-client-reg property.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Applied, thanks.

Matthias

> ---
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b31d90dc9eb4..6c2c3edcd443 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -41,6 +41,30 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.
> +
> +  mboxes:
> +    description:
> +      Using mailbox to communicate with GCE, it should have this
> +      property and list of phandle, mailbox specifiers. See
> +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function blocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
>     "#clock-cells":
>       const: 1
>   
> @@ -56,9 +80,16 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/power/mt8173-power.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +
>       mmsys: syscon@14000000 {
>           compatible = "mediatek,mt8173-mmsys", "syscon";
>           reg = <0x14000000 0x1000>;
> +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>           #clock-cells = <1>;
>           #reset-cells = <1>;
> +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>       };
