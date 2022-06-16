Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893554EC34
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D46710EBC3;
	Thu, 16 Jun 2022 21:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89A010EBBF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:10:14 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id e9so2378019pju.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1NvKVp9EY1lQLLZ0Uj/3ziHPWB5PBfQnDPktmmL6XEk=;
 b=Q6kggNEwsYy473XSBdvlOd5aXGi14mWaUXKCRel2oNoa9ukMQEm6VLZ36BSmEzjUw8
 xVjg+yj2Cf7WYniqQWa061j05YQBrlt3J8sWSdxuzyoIGAnHdsSZK0OPY2rgLYkZCGdz
 RGHvnW9PyQpZtnrKN3TNt9/AMOmKe76T+/caN0MOE3lbxICjjK5bFR+Qhp/bDFV7LEnZ
 ygPkdnsJl4x4bJeL8fdqMJEOMIyvVNtRqEeXO2BdN/B+P+LbfjtD4WyGc67vqWXugVv3
 iNbUjj0Z+ZhCSCUDlVRSwcvWTlaYCTp/0ixXT9BwdhOZGpaNiy9JJrytROI9rct/lCCR
 7ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1NvKVp9EY1lQLLZ0Uj/3ziHPWB5PBfQnDPktmmL6XEk=;
 b=rlLPorDfMDsdaXXv4dTU/ZjRa89PzzfRoU07YsZu0v5sYWQwzC5pZQySI8tPnRw1XO
 1M73FBlkNxgueqzM/YXDwj6JzWj22W+mSlLvbxOBSKwyHq2jkKAoVVLHJW+uo9V854MK
 jGFnrAvTSCL9sPfHwhMVrG8WemSq5G9jwrN3tO9Hh/ebnkeI/7S5A3WkhbKbQnotdQk4
 3uNFHB4cTsd/ZtaAnlqozPPo7nVUDYAokIpqqlRMEazo6nTK2GEIGD9MRsofjcyVegnT
 /PIgoa+vvccwz3C7G4CFKUtHUSXg4voeAMSF6orVYyu3M3cJsvm5KukXEeOvozEZCVKC
 yZbQ==
X-Gm-Message-State: AJIora/tVxsOUEkyw3LW1zr9tGHmYUkNJ5ZxZX9r/t9wf1bojEEdWUs1
 Vb9s8lhCEOyvvZiEWPfUUNEAJg==
X-Google-Smtp-Source: AGRyM1tx14RVi2zqlwVdwcg3qpvX916m1pZt9IXn7u8YC0Z2HVZLOyuzbvgSYCSqY81bOJn+l9i+nw==
X-Received: by 2002:a17:90b:4c8f:b0:1e6:9bf9:1ab8 with SMTP id
 my15-20020a17090b4c8f00b001e69bf91ab8mr6904606pjb.215.1655413814235; 
 Thu, 16 Jun 2022 14:10:14 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 n46-20020a056a000d6e00b0051868418b06sm2167316pfv.35.2022.06.16.14.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 14:10:13 -0700 (PDT)
Message-ID: <f230c9b0-6e23-7409-62e8-58f849925e2e@linaro.org>
Date: Thu, 16 Jun 2022 14:10:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 04/15] dt-bindings: leds: Add Mediatek MT6370 flashlight
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-5-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-5-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add Mediatek MT6370 flashlight binding documentation.
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---
>  .../leds/mediatek,mt6370-flashlight.yaml      | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> new file mode 100644
> index 000000000000..13610bc23d0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Alice Chen <alice_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-flashlight
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-1]$":
> +    type: object
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        enum:
> +          - 0 # Address of LED1
> +          - 1 # Address of LED2

Just: enum: [0, 1]
No need for description.


> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false


Best regards,
Krzysztof
