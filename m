Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344D1AAB86
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BD36EA0B;
	Wed, 15 Apr 2020 15:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CAB6EA0B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:12:40 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f52so208518otf.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZFCMh2H9Eh+ryRXkXK/V7+2w4B+PUgVzUEm1sj08lm0=;
 b=nrbDKPV2n/SQ4di/0K44jxB8Q98qNM04RoPHiMKXwffgxtMg5l8cokUsQjEPHHEg9t
 tnaggFNWlGvDaLUgNgJS/ondDkJ10OrG2v8SptarmUNd4l0Z0TBgOXZqgczUNpX2O005
 LbdsdgXyDxD2F8EqgKdSQdjWhMO9Rr/Ua7qRaubqKavdv0IUbpQ+swKn86FwkvnwM48d
 GmfRI2my4pdY4zC6HHM9XK8z6SwgalP/7cFIwb0lCsOhEqDqaDPFbM5Vnsao8r3vtTzu
 PRHB4oBCnrSlOit99CSBZawuFUT37xQscJXtW0vUdR5glkWgUueFFaoarWabsNNsa6Hy
 ByUg==
X-Gm-Message-State: AGi0PuboeJ03NV+pXVTuMI0XCWcQW4Dsp6KLKk+yl/BqIyyHBoLx5aaC
 l25ScoEmprAkb8QlaGZerQ==
X-Google-Smtp-Source: APiQypIKxwXtUrjwfyuCqVzzKfMogJVdKDlcIeltnelwgqKhG6bH+DblCsEbrigze1USzStBxtor4A==
X-Received: by 2002:a9d:4102:: with SMTP id o2mr22206640ote.98.1586963559689; 
 Wed, 15 Apr 2020 08:12:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r205sm6395829oih.47.2020.04.15.08.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 08:12:35 -0700 (PDT)
Received: (nullmailer pid 30324 invoked by uid 1000);
 Wed, 15 Apr 2020 15:12:34 -0000
Date: Wed, 15 Apr 2020 10:12:34 -0500
From: Rob Herring <robh@kernel.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V5 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200415151234.GA25862@bogus>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
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

On Tue, Apr 07, 2020 at 09:17:09PM +0530, Kiran Gunda wrote:
> Add WLED5 specific bindings.
> 

checkpatch.pl complains about some trailing whitespace. The previous 
patch too.

> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
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

Need a '|' at the end to preserve formatting.

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

Need a '|'.

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

Wrong indentation.

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
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
