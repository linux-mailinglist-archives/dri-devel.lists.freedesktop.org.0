Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D1539814
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B288910E250;
	Tue, 31 May 2022 20:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4DD10E250
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:40:16 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id h11so19087082eda.8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Alpwe54um/pAMi391V2OXK5ebcRXESWz/C1BKY6Vx2U=;
 b=bpXiaXVheIuoXS4qYPJJkBRiRLc0xdm8fJsiezzNxaSbqbM0HnHijdjFweVTNkO5Bt
 OZqNy/x48s3aknETcJSY51qRmtTvaefEriEEJgQKisgFjaP183xCgKHWGQMMuAEHM6iq
 Tc3YKXQYkPZ94qbC96FiM34BqIpNNbIw3S8bJFm37gUnEIpXhZlKzpuEHXf1T8hzTbUW
 Du1P41pKola5rfLIqjTtayOOX87K1DlGcQtFT+ikof7IHHBi0DGNf1t+EUD7xcGMBNpZ
 EvT5U5w/Mdqm9rktSC9cQ0mZie8pKoeXyPlTqMEFXnEeubuvBemuKrU2SexCdF1YgbDO
 BdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Alpwe54um/pAMi391V2OXK5ebcRXESWz/C1BKY6Vx2U=;
 b=dR3GCfTecWYoVtvneuHuaiZZkmuBiUGXmqKbA/ICDqkzg7BEVUcyJtX0k+thv9Kl3q
 fVcZWfxOWin5AcvQb/7Z22JFzkkPS0gHkva0mmCar9qCP0WvKvJEygQstnb+lhIMUkc5
 l9nNHRxX+qe3rXiXZc9MJFcYfHi47uc1cQfRXdEb8CUWSqm0e5QhRgTH4eZhAI/hcrmw
 wy2ZquQ3q0mxv6G/uNV5oK9XtQpo5EEqJzbAvW98F+1ETlNlZY+JSDfNPkl7PbgisTgO
 NcppoiObXB5e1s3mG4SPtBHCsTT5ECKCrkUAu3qS07A335eVUlU6qfhFYQFr3E5gPC+j
 OBHA==
X-Gm-Message-State: AOAM531pLoVbVHbX9rnqWk7gME8weX3KnUZCEBELKPo3USxBBr/WW7SZ
 PbMg6Bq850IE3idt/XDg4PxnfA==
X-Google-Smtp-Source: ABdhPJzdZx04tPobjk6aL2VQPYwY9rAKwfMAkoP+ACgtkB/OwGTdsTuE3oT/JNLygYdZnn9MWjUmsw==
X-Received: by 2002:a05:6402:c1:b0:42a:b8a5:8d5e with SMTP id
 i1-20020a05640200c100b0042ab8a58d5emr67401586edu.266.1654029614622; 
 Tue, 31 May 2022 13:40:14 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gt2-20020a170906f20200b006ff01fbb7ccsm5299610ejb.40.2022.05.31.13.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 13:40:14 -0700 (PDT)
Message-ID: <3ab7892e-cee0-f5d6-7b58-1a9bfc803ea9@linaro.org>
Date: Tue, 31 May 2022 22:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 12/14] dt-bindings: leds: Add Mediatek MT6370 flashlight
 binding documentation
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
 <20220531104211.17106-4-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531104211.17106-4-peterwu.pub@gmail.com>
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2022 12:42, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 

Subject - same comment as previous #10 patch.

> Add Mediatek MT6370 flashlight binding documentation
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---
>  .../leds/mediatek,mt6370-flashlight.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> new file mode 100644
> index 000000000000..b1b11bd3d410
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-mt6370-flashlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Alice Chen <alice_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  see Documentation/devicetree/bindings/mfd/mt6370.yaml
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
> +    description:
> +      Properties for a single flash LED.

Same as patch #11.

> +
> +    properties:
> +      reg:
> +        description: Index of the flash LED.

As well.

> +        enum:
> +          - 0 #Address of LED1
> +          - 1 #Address of LED2

'#' starts a comment, so there is always a space after '#'

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
