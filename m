Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825D272386F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 09:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4758310E263;
	Tue,  6 Jun 2023 07:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D9210E263
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 07:10:12 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-514953b3aa6so7619622a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 00:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686035410; x=1688627410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LisFXxO/Zq5NzPlsNvfDE27JudIL0xXgnokQiH5CFkg=;
 b=Tp7aA1tetcMXR3NmkTpppp8ctzFm310/IxY7dr4udMqjbhxvVsAVnjEjVDFjFHG5r0
 26nfXTeCftd7ibz0Ger4E16G02bfbYH1RBuKs9GpRs3Irky9dRwd5P2LnXUQ18gfn13W
 03jU2X9FzHbDEVVN087UEpnuvgxBv4/uVpb/djJrnMT/avsyawDuR4/cdzALcJm8M80b
 kJP+7fm1xXXUdInfE+tV/FKLrNYMAL6ncRxJfJGzY23CY9/KyFKjNM+TYVTlYWutG158
 0SO1GarqMJLyIU7H+KS/a1xKxIM+kvCE1Chpjyz3ba9/TzIbylnGdwytm2cTfstevXw+
 6N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686035410; x=1688627410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LisFXxO/Zq5NzPlsNvfDE27JudIL0xXgnokQiH5CFkg=;
 b=CqxOuil2uZPJ6hF+aHugajy87h8EGQQMpn8ZEpgnnSHNjCYwzIAs/L0Qg2xuNgJHmI
 ZoAzp8QA6PYl7BvmXFPV1xOiobkoruClyYVNNHAWxuczhlrO1xW9ko3fRDH5N0sDGVV4
 vZZZN5jZog5oo8ZgpVEtgg8vw2ZrgUUY1g9/pTYgiL1dYuqw1Lq5HQsOs5nQkFANY13q
 cWLmvpWCwQzWkeeAfkpGuViYiEa12VEoyX+1i6JzopwX+ywxh/OJuHLpTbhKLpcZmrYE
 V2v9zuiKWWHfnFI85xWTQXAiRixir834qtW4Rh0k0Bl8Xq1/xLkBeXNNgWWkVQPhJqoU
 dCCw==
X-Gm-Message-State: AC+VfDxFj7G6GLO37/AVPXNfKuIJdNbTtgMte8AtAy/rUB9x8TpfuqkB
 7DErlDIbTD6asbcNdTd5bJzTPg==
X-Google-Smtp-Source: ACHHUZ6Bw2R/3N0tQrQg3MAgzfrTK7S3Fu0Ps1sWt88Aosi9bHUp048ui/ckWGF3EaIH8l2jRRM0Ig==
X-Received: by 2002:aa7:d28c:0:b0:514:90de:423e with SMTP id
 w12-20020aa7d28c000000b0051490de423emr1159906edq.36.1686035410439; 
 Tue, 06 Jun 2023 00:10:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 u6-20020aa7d0c6000000b0050488d1d376sm4706904edo.0.2023.06.06.00.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 00:10:10 -0700 (PDT)
Message-ID: <7255ff65-9dac-3cce-fb74-09a8984775f2@linaro.org>
Date: Tue, 6 Jun 2023 09:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add fannal,c3004
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20230605153539.497602-1-pavacic.p@gmail.com>
 <20230605153539.497602-3-pavacic.p@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605153539.497602-3-pavacic.p@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/06/2023 17:35, Paulo Pavacic wrote:
> Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
> Fannal C3004 is a 480x800 MIPI DSI Panel which requires
> DCS initialization sequences with certain delays between certain
> commands.


> +    #include <dt-bindings/gpio/gpio.h>
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "fannal,c3004";
> +            reg = <0>;
> +            pinctrl-0 = <&pinctrl_mipi_dsi_rst>;
> +            pinctrl-names = "default";
> +            reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> +            vdd-supply = <&reg1>;
> +            vddio-supply = <&reg2>;
> +            width-mm = <93>;
> +            height-mm = <56>;
> +            panel-timing {
> +                clock-frequency = <27000000>;
> +                hactive = <480>;
> +                vactive = <800>;
> +                hfront-porch = <30>;
> +                hback-porch = <30>;
> +                hsync-len = <8>;
> +                vback-porch = <30>;
> +                vfront-porch = <30>;
> +                vsync-len = <8>;
> +            };
> +        };
> +    };


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c22c828ab46..62374c8424b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6427,6 +6427,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
>  F:	drivers/gpu/drm/panel/panel-ebbg-ft8719.c
>  
> +DRM DRIVER FOR FANNAL C3004373132019A
> +M:	Paulo Pavacic <pavacic.p@gmail.com>
> +S:	Maintained
> +C:	matrix:r/mipi-dsi-bringup:matrix.org

I don't think we have chat channels for individual, small drivers. Add a
channel for entire subsystem.

Best regards,
Krzysztof

