Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F154EC28
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5B310E864;
	Thu, 16 Jun 2022 21:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C0C10E864
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:09:24 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id i64so2509400pfc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zhpZ+GjXampjNpe+tQocPabcYpHKe+t5MxtxSoAd/gk=;
 b=c/mnodrbMqdEEZtK4ydiC51al8PB7S6Cw/2mpPGAnndPSmu2+WM1Ll5DPr4l2TlOQS
 nqxcxIqTkzcsEO3ksP2QW/htFKuizhTMRc2FmleMjdWDxtyteBBiNyVAp83VADdUQn3X
 G/hCcE8fhF8THykoNLr9837Zpz64pICy6pXDGznnY2WIMG93RYJ0Cm2F5tQqmGHz/ew2
 yqiJMi3apylM6BgwpGCG/sfJ83FiC5EaO/9MBOx8Ti2RX8TKdRByxdJEyDRw3bdyXr/x
 BWCtUHy2R46F/HtRQqol9dJaSnsHI9AI05hVUXfj35TZbFtNdUodT4OBz0pviOs5GdPx
 gbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zhpZ+GjXampjNpe+tQocPabcYpHKe+t5MxtxSoAd/gk=;
 b=xyNLR/BfoILFhzOb6Z1M5w7PJ8ul8PyD9/QxhrpsEdhJZ/Q7K4A83iY8XSW15V1sT+
 JzTNSgWD1tFyBKbt7vuEWmS/eAlqZ1iLxIsgERJAxdrJnE0pVLHSWg2072S5bDiANHaw
 DRsyesSigt6Ot605XsRnrd4atUwLM27ujY1XV/5e38RDogMw+wN+xa+bEI2goByOt9kR
 LM93FDpG5hdfEGUSkKqHUtaFsPoRrO096Qr+VZoSiIcaF3bjMUssPgpoYLXSwe0+XYTX
 YTeF6UqFNWS/XRbONeAf73otrBeozpqRzcxerOYPblm+MEAOi7LaXhA4r5PV2sbKdvzu
 h/Rw==
X-Gm-Message-State: AJIora+m3/Crzi2RSaY1Ss1YbSZotblE8oTUTXiWJl4YzcBw3MCUArx4
 BrLRWqSRQ7Anm6KRQAm5PxhUuQ==
X-Google-Smtp-Source: AGRyM1tDcKhZpWC6x4Z99cOnzfLaqqe5JLXzIahj3Uu4wTqFJmQBE7GebAoPUSjcUlojxk8MyILZ2Q==
X-Received: by 2002:a63:3c3:0:b0:3fc:5864:7412 with SMTP id
 186-20020a6303c3000000b003fc58647412mr6068104pgd.138.1655413763706; 
 Thu, 16 Jun 2022 14:09:23 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a17090a4bc200b001e2ebcce5d5sm1929001pjl.37.2022.06.16.14.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 14:09:23 -0700 (PDT)
Message-ID: <91e9e3af-8208-7535-1864-08744f934593@linaro.org>
Date: Thu, 16 Jun 2022 14:09:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/15] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-4-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-4-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiYuan Huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek mt6370 current sink type LED indicator binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../leds/mediatek,mt6370-indicator.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> new file mode 100644
> index 000000000000..42b96c8047a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6370 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Alice Chen <alice_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-indicator
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^(multi-)?led@[0-3]$":

If this is multi-led, then you should reference
/schemas/leds/leds-pwm-multicolor.yaml

See other examples using it.



Best regards,
Krzysztof
