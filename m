Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BD1B1160
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 18:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959476E7DA;
	Mon, 20 Apr 2020 16:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FCA6E7DA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 16:20:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x25so189409wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FcnrI1Xxn9roHL22ABKQnHw7igB0r3eb2Ibyo+D5Gg4=;
 b=eZCwHwJxiMW2kK0w8LBTT3gjw8hxb43UE0ZIYeUhXGGC3EOBNQdXrrZyEaDgTEptoE
 mV1KNSMKmKvvq5fZRtlIsxFVJMmI9F48caGM3a2+ch4sdjmChqYnSaU2ncRdiNrc4piz
 GujU5OpBRl3MRD3/s4/LE1Cs6cZwlphd+R06dlO3vQXZiqdD71ZIa89l2u1IUyEI7XiI
 onkoRwPnYq3mcJnbUKG7kZcsVTkK57s0Cs42vYf4l91LN1tfAqIrGNiSw+1tTAWrP0n4
 H7ueU03BLtYkD/8Na4HPsRXMLX1ixtWckPCoafEUQ233Eiyj8bacETzoIwTG6wY/9rXp
 ynZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FcnrI1Xxn9roHL22ABKQnHw7igB0r3eb2Ibyo+D5Gg4=;
 b=OcbGYjaXDwJBNZu/DHy44vP6S4O0khpYTilpNsQdmv9hAIF8SgBt44AOLIusOS6Bqu
 M2apcuI1nI0vwJGjpp0mYqadyy9w6JxJuxyXql8obp/wKiH6heBzRaV/xTG4QOTAlxn2
 xRzWhiKh0PWL8k9R/3sEDk7V4pyjxbIyVZ0aBix++8iBI3kq4mBJlMN/jtu077O2Mb7f
 e4WtRjFYe+PjpSXWwwWnHTNko+4fe/9CvFTZAcdsoratR0lDywlOILaQM4SG2/mj/PJI
 6nJx9ZedH0pYZFX2Pt1iD0BfISsAduUaM3eSZncloMYoHJYVG9LbfbH2pH8O1i1jlP7Z
 OSxg==
X-Gm-Message-State: AGi0Puakw38Es/1DxMwpGK9STVvA2sY7kLmBodnAuytPOhRUZE44i3vE
 d81ypNRK0qaTkK6yoJnbgH3DdQ==
X-Google-Smtp-Source: APiQypIOjWhJPhp1gW4daPR8VO7+/mdSIWT0KSBh3hGPhAZCL+dM5mz/ByFEpRzyuFVtWYhCm99huQ==
X-Received: by 2002:a1c:154:: with SMTP id 81mr139993wmb.48.1587399603257;
 Mon, 20 Apr 2020 09:20:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t63sm95597wmt.37.2020.04.20.09.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 09:20:02 -0700 (PDT)
Date: Mon, 20 Apr 2020 17:20:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V5 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200420162000.cmqhk5kphijd2m2d@holly.lan>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 09:17:09PM +0530, Kiran Gunda wrote:
> Add WLED5 specific bindings.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>

If v6 is just reacting to Rob's feedback then feel free to add the
following when you recirculate:

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 60 ++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index 770e780..5714631 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -21,6 +21,7 @@ properties:
>        - qcom,pm8941-wled
>        - qcom,pmi8998-wled
>        - qcom,pm660l-wled
> +      - qcom,pm8150l-wled
>  
>    reg:
>      maxItems: 1
> @@ -28,12 +29,13 @@ properties:
>    default-brightness:
>      description:
>        brightness value on boot.
> -    minimum: 0
> -    maximum: 4095
> -    default: 2048
>  
>    label: true
>  
> +  max-brightness:
> +    description:
> +      Maximum brightness level.
> +
>    qcom,cs-out:
>      description:
>        enable current sink output.
> @@ -130,6 +132,31 @@ properties:
>        This feature is not supported for WLED3.
>      type: boolean
>  
> +  qcom,modulator-sel:
> +    description:
> +      Selects the modulator used for brightness modulation.
> +      Allowed values are,
> +           0 - Modulator A
> +           1 - Modulator B
> +      This property is applicable only to WLED5 peripheral.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 1 ]
> +      - default: 0
> +
> +  qcom,cabc-sel:
> +    description:
> +      Selects the CABC pin signal used for brightness modulation.
> +      Allowed values are,
> +           0 - CABC disabled
> +           1 - CABC 1
> +           2 - CABC 2
> +           3 - External signal (e.g. LPG) is used for dimming
> +      This property is applicable only to WLED5 peripheral.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 1, 2, 3 ]
> +
>  allOf:
>    - if:
>        properties:
> @@ -179,6 +206,33 @@ allOf:
>              - const: ovp
>              - const: short
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pm8150l-wled
> +
> +    then:
> +      properties:
> +        default-brightness:
> +          minimum: 0
> +          maximum: 32767
> +        
> +        max-brightness:
> +          minimum: 0
> +          maximum: 32767
> +
> +    else:
> +      properties:
> +        default-brightness:
> +            minimum: 0
> +            maximum: 4095
> +        
> +        max-brightness:
> +          minimum: 0
> +          maximum: 4095
> +
>  required:
>    - compatible
>    - reg
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
