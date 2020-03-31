Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F09199D4D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 19:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4559A89C60;
	Tue, 31 Mar 2020 17:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D21289BD4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 17:56:22 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id j9so20376322ilr.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 10:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0Yp77BX0CNsI0E9W0U3Z3mSHpIexs+AJy6eqRXEJQU0=;
 b=NUFgolGtgSyS9XVJiDD76tkjGXirnThQRj8GviEu/P6WVfNgpt/aW8hscb99blWdqv
 1/fribG4zBfUYDQtSaOMcKKsRXcCwCSN4nnLwhUe68P9Sw2CrZDs15w75tETAQ9mL721
 IRq74w8G+XXcv7GC8Irk002VLrX0MKofRJ/wrQOKfPeUdgfIxu8DSeLAkBLJzE5iJJc0
 cOdPA/JTZ2Il4Dd61n0PVmkjJcgZjULEoUJtIY/2nJJ48D7ntMhNnIHXzUCcT61rAxV9
 ORxuO9YKG9nUBPSwRSJRKrciAYVKkoyCMFr4GkKNGcjJERERcqoREGZ9/6+hNdoOQVVJ
 6TOw==
X-Gm-Message-State: ANhLgQ0T6oVuqPHJjx9PELYP9NlNSBeba1BwB7RtaI+zC74ujcteA6aD
 yPKiWm0IUHLOKM/emSSxAQ==
X-Google-Smtp-Source: ADFU+vtpX68rVrNJUeA4Xd7HfNw0GlkZdMwR56tGbxSge2H9UtVNk87hzwLKVeKvE6Buoj/X3b/XtA==
X-Received: by 2002:a92:5e14:: with SMTP id s20mr18027047ilb.101.1585677381521; 
 Tue, 31 Mar 2020 10:56:21 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id x4sm4742966ilj.6.2020.03.31.10.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 10:56:20 -0700 (PDT)
Received: (nullmailer pid 27986 invoked by uid 1000);
 Tue, 31 Mar 2020 17:56:19 -0000
Date: Tue, 31 Mar 2020 11:56:19 -0600
From: Rob Herring <robh@kernel.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V4 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200331175619.GA25466@bogus>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 23, 2020 at 11:16:57PM +0530, Kiran Gunda wrote:
> Add WLED5 specific bindings.
> 

More of the same comments here...

> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index 8a388bf..159115f 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -20,6 +20,7 @@ properties:
>         - qcom,pm8941-wled
>         - qcom,pmi8998-wled
>         - qcom,pm660l-wled
> +       - qcom,pm8150l-wled
>  
>    reg:
>      maxItems: 1
> @@ -28,10 +29,23 @@ properties:
>      maxItems: 1
>      description:
>        brightness value on boot, value from 0-4095.
> +      For pm8150l this value vary from 0-4095 or 0-32767
> +      depending on the brightness control mode. If CABC is
> +      enabled 0-4095 range is used.

Constraints.

>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/uint32
>          default: 2048
>  
> +  max-brightness:
> +    maxItems: 1
> +    description:
> +      Maximum brightness level. Allowed values are,
> +      for pmi8998 it is  0-4095.
> +      For pm8150l, this can be either 4095 or 32767.

Constraints!

> +      If CABC is enabled, this is capped to 4095.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

Standard property. Assume it has a type definition.'

> +
>    label:
>      maxItems: 1
>      description:
> @@ -124,6 +138,31 @@ properties:
>        value for PM8941 from 1 to 3. Default 2
>        For PMI8998 from 1 to 4.
>  
> +  qcom,modulator-sel:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Selects the modulator used for brightness modulation.
> +      Allowed values are,
> +               0 - Modulator A
> +               1 - Modulator B
> +      If not specified, then modulator A will be used by default.
> +      This property is applicable only to WLED5 peripheral.
> +
> +  qcom,cabc-sel:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Selects the CABC pin signal used for brightness modulation.
> +      Allowed values are,
> +              0 - CABC disabled
> +              1 - CABC 1
> +              2 - CABC 2
> +              3 - External signal (e.g. LPG) is used for dimming
> +      This property is applicable only to WLED5 peripheral.
> +
>    interrupts:
>      maxItems: 2
>      description:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
