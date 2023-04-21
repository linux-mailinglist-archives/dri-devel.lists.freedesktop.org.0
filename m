Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D7A6EA4C9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 09:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B4110EDB2;
	Fri, 21 Apr 2023 07:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296B010EDB2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:30:53 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94ed301bba0so207700366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 00:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682062251; x=1684654251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TXD0SvfVpb5ArVlwxwukJNvZ7FQ4i6U8HJTH0x40wOc=;
 b=jHa4yP8uRXfKtQYslv7gA8gGzGt6bHpcNBBVQkD9GcwARGlxayyqhdRiIBBQY9H1Bb
 SyZU4yixxQM+XsojFJjtucU3i3wen2yRTp6zX48UroM+P9SpyNM7Goe7igAPHzmRXAec
 5oYIBMyA43zod8w/yMsgwjaU3x/F93FJSjXiodloLojrzOAMmINH5JkXL5uSsn1Tkikb
 tBe3WAOiF+rJFvyDRe/d0fYqAQNwa+8nDuoAGBeogng7SGfB6kMOa6BEvIAEsfJAdpmt
 t5pAhDO4F5E3UKc4ZJ+0e/BrjMttO6ouKWwQ0fMnyy5VbXMympEy2ttY8yJgRLOJO18k
 0V0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682062251; x=1684654251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TXD0SvfVpb5ArVlwxwukJNvZ7FQ4i6U8HJTH0x40wOc=;
 b=ZtpbLuorPxm2ox6337UQWZXufGlwHQAT/TzgptUHiL2SEjcNcJJUtLhhBu12CXTxiK
 ONOyLHBuh709Aim+Z+2ocLuGp0TANMnSjM88WYr8Qy9h5y+JcGchR7eVqInf8cslEzuN
 d+G0tGoa5g7oKNUSPqz/eBUuWTBceEwvEo3PUbN1EzFL2obIMp3yq5wMVZKvGmwehryc
 j8MtiZlO/AuWPpnl5qY9TfJP2fop2uEpyqk7l0n4N0hxMVLHo4DgNkpERfOXVnnqBGpJ
 3ZBxjUslyVQuWtaX2VXI4xFY/KG4ZwSVak0Am0/BTXRI40oagMcv6oTJQ2pz+OHnKEvM
 EJyQ==
X-Gm-Message-State: AAQBX9eOSyIbSZRtk+UcCaqJ2ap9xbOqQDxsGwJ0emfid61jz5tZsuUa
 /wU1WPIge4DVDQFi3jq3Yi1a5w==
X-Google-Smtp-Source: AKy350YiW/RgBcdrDWvcsi4/QmLqcZmY+jKO98eibRooGmPHFN7cNE5Nwwltck2kC0aIMnW0VwZMow==
X-Received: by 2002:a17:907:7851:b0:94f:3b29:e0a5 with SMTP id
 lb17-20020a170907785100b0094f3b29e0a5mr1216357ejc.20.1682062251073; 
 Fri, 21 Apr 2023 00:30:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:668b:1e57:3caa:4d06?
 ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a17090633db00b0094ed0370f8fsm1734575eja.147.2023.04.21.00.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 00:30:50 -0700 (PDT)
Message-ID: <3adc1c05-b707-6caf-874e-dfef065c8ab8@linaro.org>
Date: Fri, 21 Apr 2023 09:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next 2/6] dt-bindings: net: brcm,unimac-mdio: Add
 asp-v2.0
Content-Language: en-US
To: Justin Chen <justinpopo6@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, bcm-kernel-feedback-list@broadcom.com
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
 <1681863018-28006-3-git-send-email-justinpopo6@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681863018-28006-3-git-send-email-justinpopo6@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 02:10, Justin Chen wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> The ASP 2.0 Ethernet controller uses a brcm unimac.
> 
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> index 0be426ee1e44..6684810fcbf0 100644
> --- a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> @@ -22,6 +22,8 @@ properties:
>        - brcm,genet-mdio-v3
>        - brcm,genet-mdio-v4
>        - brcm,genet-mdio-v5
> +      - brcm,asp-v2.0-mdio
> +      - brcm,asp-v2.1-mdio

Same concerns as on previous patch.

Best regards,
Krzysztof

