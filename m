Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1391C3446B0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2F66E4A1;
	Mon, 22 Mar 2021 14:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D4B6E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:08:03 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hq27so21492509ejc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cSaipbSVMssVKdn3oghoqwHfL83IRjMc2QFj89+7tnA=;
 b=Jd5CD1X1hKibjat1Dpvod6s73STjD6zQrsO7GJDXi5CV8KBp4lEdckj8ckqK4AU4bI
 4Cq/aNV6X7ofvmKP+8DtmLWuEPC9/7wXNqQVCuZrqidWjS7/ao0Ivghu5jiHrInK0229
 HiqwaxfLOwK5/pFj926hJ+5jW7ZpFux6evV6XtAyMQDiQK7vLzzzckn/l6rxhj3HESfd
 Vin8ToVSTFsb8FsVhvzh38oK67ZMft5uy7ke93hFkCwlLC9Z616OmOsd6z+e1tzuQbQa
 w4sVrY9gv0u/2ZWVmnTUkEEg0Zjj0FnNl4TFYxAjB1Hy4pVrkM1jS//bABiD/rx7+NeQ
 LpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cSaipbSVMssVKdn3oghoqwHfL83IRjMc2QFj89+7tnA=;
 b=L1YLqe6sRu29M53cqDdiI6Odv9AmJ3+O061y52258rVnyCYbY0R9+fHPaEexlGjPlv
 3Rmh+9eob5psn79DkHPm3ozULvR+Uqn4nG8XVIAnikN5ehCyPfID6APXLiA4Fa4PJe5P
 8X2+TEz9ClFMAALFzwwYpUd/bA2atnEzM3nN8umkX3dTeD8rN64CvNF83nRq/TUYQnqF
 NqOLZhZmvSkBfgv0dKHup4gy0GXDObtxaYfsD24z4gsfDl7zzFfKWQ3vSwJuE51sT33Y
 Kx9pf+7ywPUKGPLwyDGVDsL1De69bmfMa/Q/ZeINwuQ0KvH/bznO44iwv2EwSpJ5d+1/
 nj9w==
X-Gm-Message-State: AOAM5328AxX6WYoaUuje8EwNe6MS8lVu+ZHYqjb1vpS+hQkPWSUgiq1d
 EcAuPlUs0gTzHPBkp4I8p0QeEA==
X-Google-Smtp-Source: ABdhPJxw57h/I3+xiA9ts4zcxkZW2Qi/xxa+fCGIztm2s0liULHSxrjOTUHyj5C2ZR6WZqcOAGee4w==
X-Received: by 2002:a17:906:33da:: with SMTP id
 w26mr19627847eja.302.1616422082037; 
 Mon, 22 Mar 2021 07:08:02 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id p24sm11385407edt.5.2021.03.22.07.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:08:01 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:08:00 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Add Kinetic KTD259 bindings
Message-ID: <20210322140800.rnpriwxdrzendz5e@maple.lan>
References: <20210321114341.944696-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210321114341.944696-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 21, 2021 at 12:43:40PM +0100, Linus Walleij wrote:
> The KTD259 is just a newer version of the KTD253 and works
> all the same.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

(For Lee) Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
>  .../bindings/leds/backlight/kinetic,ktd253.yaml          | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> index 7a6ec1f8c0f3..73fa59e62181 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> @@ -4,13 +4,13 @@
>  $id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Kinetic Technologies KTD253 one-wire backlight
> +title: Kinetic Technologies KTD253 and KTD259 one-wire backlight
>  
>  maintainers:
>    - Linus Walleij <linus.walleij@linaro.org>
>  
>  description: |
> -  The Kinetic Technologies KTD253 is a white LED backlight that is
> +  The Kinetic Technologies KTD253 and KTD259 are white LED backlights
>    controlled by a single GPIO line. If you just turn on the backlight
>    it goes to maximum backlight then you can set the level of backlight
>    using pulses on the enable wire. This is sometimes referred to as
> @@ -21,7 +21,10 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: kinetic,ktd253
> +    items:
> +      - enum:
> +          - kinetic,ktd253
> +          - kinetic,ktd259
>  
>    enable-gpios:
>      description: GPIO to use to enable/disable and dim the backlight.
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
