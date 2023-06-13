Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06B72EAAB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8F410E3D6;
	Tue, 13 Jun 2023 18:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B61B10E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:17:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f6370ddd27so7282483e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686680237; x=1689272237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3eLJxUkGwEhV3L4pfZK45Zz/NqrL+/LdhPQYtZgAc5Y=;
 b=d445rOahKAWBdoKCCt6Ljhdoc8txuIdE8gFQ0Zim1iUxv4xckznCmZjcH0td68mCaZ
 LLRhRnMcjm0xYCkSsyIokE9MTyJ4hLNeJ5EU8M7nTTGsa3Z3RxSDUe2g7OdkaIrx2Nx2
 xX80IwONVu9RlLhsLOuJfmF6v60UTDNuydmlRm1FaET153qsfPdYGc/g6VLLEmQZXSQW
 gnAPexJRiE9PAGheUW6d3SVYYvcoew+OeAzqm4RjuGQVQ3NTKvuVgVpprfSdobcStisz
 b0DzBLjr0JNg4yBg2m0vwCOqnpQUALPuzRoKgBTWPpH9Oy82hDITcvbGk6TGV3KiE+38
 StJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686680237; x=1689272237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3eLJxUkGwEhV3L4pfZK45Zz/NqrL+/LdhPQYtZgAc5Y=;
 b=iAH2DnptaQYALv/WDTG/JlvIPv/0HewummVUC7Nj9FZff36t++fyTNdZKZLgF3aKub
 Hscdtz2I1Ceev7PD2S3yesektRJb15w+yU5uhWkzj7D8S+gZzq6rhVkptS8nGBRIHo/3
 b4BW3c4rLgFYk8W+OBz9wg2oEDtHGkd37URX/guiCs4rX1ob5DnLjYSKBCNEvLoj7DQN
 IN8jaNEZT9TBku+GfZQXQbZwoAl+TrYPTcLoch+Ozp22zNJdZIBeu1im7jG/d7Mg3xA/
 InO8iKGcy4B6gH1aV8fUJvC6J3TjBGrisybxV8nXA5HM08uFQA0e99G5rCUQQ5lJGAX0
 XJhQ==
X-Gm-Message-State: AC+VfDw5VEKBEm7Fo88EyvkMZXIts7Kct9bjkWwiEY9HyljZ3bYeS5yb
 fvMw8W4Siuq07MJ//aw21E6H2g==
X-Google-Smtp-Source: ACHHUZ4AuHUoFogcm9YXsuPvppxWikUukfl4gp7Sr64iT0Fiq1NCuxkfSUj2TSBJdR6Tn6k4xBuWDQ==
X-Received: by 2002:a19:5e12:0:b0:4f4:b28d:73eb with SMTP id
 s18-20020a195e12000000b004f4b28d73ebmr6122291lfb.12.1686680236841; 
 Tue, 13 Jun 2023 11:17:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c9d0000000b0050d83a39e6fsm6786653edt.4.2023.06.13.11.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 11:17:16 -0700 (PDT)
Message-ID: <a0b059d1-df4d-10ce-fb7c-7acea0a20793@linaro.org>
Date: Tue, 13 Jun 2023 20:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, lee@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, sam@ravnborg.org, bbrezillon@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-2-manikandan.m@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613070426.467389-2-manikandan.m@microchip.com>
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2023 09:04, Manikandan Muralidharan wrote:
> Add new compatible string for the XLCD controller on SAM9X7 SoC.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> index 5f8880cc757e..7c77b6bf4adb 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> @@ -8,6 +8,7 @@ Required properties:
>     "atmel,sama5d3-hlcdc"
>     "atmel,sama5d4-hlcdc"
>     "microchip,sam9x60-hlcdc"
> +   "microchip,sam9x7-xlcdc"

Google says sam9x7 is a series, not a SoC. Please add compatibles for
specific SoCs, not for series.

Best regards,
Krzysztof

