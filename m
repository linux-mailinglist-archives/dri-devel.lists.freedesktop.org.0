Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9E40704D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 19:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF466EA49;
	Fri, 10 Sep 2021 17:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B256EA40;
 Fri, 10 Sep 2021 17:11:45 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so3113471otg.11; 
 Fri, 10 Sep 2021 10:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2HAZ66n8XyPtrBgaRn37Y3arskzhFWBsMyDucYRHQ+4=;
 b=RDaWgHMffMLm3uyBxhOkBVfSCT0Zk83hg5MpXcb6aJ6MT26HBAlrp7rEyBj7ZYJuR1
 f5reWuu6Q36j4s1sQwOphkrlnSXNKnIMzwkekPOTF9eA2FcHDi/uaSh8c73F4lY1cdod
 Y7zt1Nk2Pof8Vyt0XsHDLDJiDpfzuqcRTiefMd1+TGhYGXd4jMc/V0phd1CJwox/Yc0m
 82Glauuneb1RG6UjBpvcHEMzbSCSAJ+og3o/n79l7HC5/4WMdg+pizHBbig3NTTU7iAQ
 KlVJD/BCkeXrAm9L6iOP36rGAUFN6hjhu/gdgoY4RI/Bizovfm3CXLgLhfWtzb66i41g
 68FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2HAZ66n8XyPtrBgaRn37Y3arskzhFWBsMyDucYRHQ+4=;
 b=rPb4ol9g9VVBnzZLTknbU0YLMyR2C3AJGWin+vRpC5XNNy3CdAHw7WyCPV5gEmCLlb
 oQsIvE92z7zJqrvibwgu9ZO3HXuFDoTVpiXNqoq0kW0mhcO9/15fYYpIsWfdU2QaT+vv
 wXYJsTqfynAF341HmVYXRwAMv5uu6D702paEesNctZ1CjEhzqu49Amh1P+OtOfKmQ32z
 gos0h/X5L3pmYBIk3t2KrCbniUTJnsXoDiqJZBNYcc63BK77QjZUx/5vjNHprWLbpuch
 qVY5A08IbnEBX/1mw5G1Mc855jS6Mm+cl6Kc091H06qnQ5CivGXT4PNh/5famKUnrUmV
 na2w==
X-Gm-Message-State: AOAM5318vWbrYgOtpJp8HoqSrhUVSrAZuusAXwTneOqaHgy4WxVxsMip
 hsWQWNZzkruDkQk45SWi5JM=
X-Google-Smtp-Source: ABdhPJzQhrxd77ILY6qcA5Sww9nwuttExHwDPJ3UDbQcLPJ+akzxSqBiMt+koNmgPX+0IZNWbWO6hQ==
X-Received: by 2002:a9d:7416:: with SMTP id n22mr5610917otk.309.1631293903649; 
 Fri, 10 Sep 2021 10:11:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w23sm1415041oih.4.2021.09.10.10.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 10:11:43 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: More use 'enum' instead of 'oneOf' plus
 'const' entries
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Jonathan Marek <jonathan@marek.ca>, Aswath Govindraju <a-govindraju@ti.com>,
 Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20210910165153.2843871-1-robh@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <84a288a9-336e-78c6-a971-b12710e1b502@roeck-us.net>
Date: Fri, 10 Sep 2021 10:11:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910165153.2843871-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/10/21 9:51 AM, Rob Herring wrote:
> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
> is more concise and yields better error messages.
> 
> Fix a couple more cases which have appeared.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Aswath Govindraju <a-govindraju@ti.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/display/msm/dsi-phy-7nm.yaml          |  8 ++++----
>   .../devicetree/bindings/spi/omap-spi.yaml          |  6 +++---
>   .../bindings/watchdog/maxim,max63xx.yaml           | 14 +++++++-------

For watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>

>   3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index 4265399bb154..c851770bbdf2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -14,10 +14,10 @@ allOf:
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - const: qcom,dsi-phy-7nm
> -      - const: qcom,dsi-phy-7nm-8150
> -      - const: qcom,sc7280-dsi-phy-7nm
> +    enum:
> +      - qcom,dsi-phy-7nm
> +      - qcom,dsi-phy-7nm-8150
> +      - qcom,sc7280-dsi-phy-7nm
>   
>     reg:
>       items:
> diff --git a/Documentation/devicetree/bindings/spi/omap-spi.yaml b/Documentation/devicetree/bindings/spi/omap-spi.yaml
> index e55538186cf6..9952199cae11 100644
> --- a/Documentation/devicetree/bindings/spi/omap-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/omap-spi.yaml
> @@ -84,9 +84,9 @@ unevaluatedProperties: false
>   if:
>     properties:
>       compatible:
> -      oneOf:
> -        - const: ti,omap2-mcspi
> -        - const: ti,omap4-mcspi
> +      enum:
> +        - ti,omap2-mcspi
> +        - ti,omap4-mcspi
>   
>   then:
>     properties:
> diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> index f2105eedac2c..ab9641e845db 100644
> --- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> @@ -15,13 +15,13 @@ maintainers:
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - const: maxim,max6369
> -      - const: maxim,max6370
> -      - const: maxim,max6371
> -      - const: maxim,max6372
> -      - const: maxim,max6373
> -      - const: maxim,max6374
> +    enum:
> +      - maxim,max6369
> +      - maxim,max6370
> +      - maxim,max6371
> +      - maxim,max6372
> +      - maxim,max6373
> +      - maxim,max6374
>   
>     reg:
>       description: This is a 1-byte memory-mapped address
> 

