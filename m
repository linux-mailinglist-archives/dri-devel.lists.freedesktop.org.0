Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED98192CB4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 16:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D0A6E87C;
	Wed, 25 Mar 2020 15:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4829E6E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 15:37:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d5so3739721wrn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rhpfx4/m5UT7Xzs51ZxQ03MQcWW4S3aHcV6k0fxCgW8=;
 b=J5cfQtP2IIFUEbxhdInPj+h0Pr08nmDXVvEoAiHkRcUhApMPv+9kGmE22t5XJkLIlo
 J3ntJB0cVM00iT4bGkgdPULTN0af8r1F2/kGRjEDLDhCvj71lEDk82Op1oz+UTjbwAe6
 ebkQ9qfIZsgmNDJtLgMlWLsVq1dC8EonjZAIKhhkf3WMkPDnUyjXzwCYqqseOJa0eTY0
 Nm/K2QPOZ0T7SnJn3RtErSbh+SoUGHtZQDR426H2zGajpzuzmKTebQSnp3AFnJ2KySyC
 MRg/T+kx9XuF791FNcTFtVP+eeKs8t8XoocVmLSMlSuiL0XaNvgiia1HOi10aGrXvTEz
 9VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rhpfx4/m5UT7Xzs51ZxQ03MQcWW4S3aHcV6k0fxCgW8=;
 b=p//hCDrLcyHHMVw5bJxgf1ukDt6IxArJVwo9xA68wMf63kTft4xD20ezsu/4078fwS
 EbGPgFYJb4GVBTRYa6gIKbSuOVAFxNMIAT7gfheb2EFLfy2GghROrimdpkGTPC27MN/Y
 VBx2kJZSR3NZtsl7YJTloTAdHICmOD0blf0g1cr+SPf8xWXH5R7emM4F3rgVroo3a6Uk
 E1peBw0VC2uOxjeitYBfeKcBoZKVPaqKoIH67VJDx5wNMG6omulbsrt1aM9hutfr/yrX
 4ibKgAtl59leoL2JgTRwuPNJzQywk/TPo+SBJAG3lvFA0QhwJzMLUhQLbWlKZLwyaEOq
 InSA==
X-Gm-Message-State: ANhLgQ11+tNIgOLJVWW2ehGKreQHQ+qgdPcYkzlfzHscT287KtE2UPD0
 bCDEfkzCjbFPfoP5g7LhpyjtSw==
X-Google-Smtp-Source: ADFU+vtbCx/qzTnNrFqm0cBm6DM0BazSQKDuz/1yNhs2QgSHiwkVDNNDvOCUr4fzyCbs355QcF6C+A==
X-Received: by 2002:adf:a343:: with SMTP id d3mr3855930wrb.50.1585150638866;
 Wed, 25 Mar 2020 08:37:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n2sm36691078wro.25.2020.03.25.08.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 08:37:18 -0700 (PDT)
Date: Wed, 25 Mar 2020 15:37:16 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V4 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200325153716.tcx3t4bd6p3gr2x6@holly.lan>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
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

On Mon, Mar 23, 2020 at 11:16:57PM +0530, Kiran Gunda wrote:
> Add WLED5 specific bindings.
> 
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

I rather dislike some of the property descriptions using PMIC version
numbers to distinguish between peripheral versions and others using
WLEDx version numbers.

Could the property description be rephrased to use WLED3/4/5 terminology
instead?


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
> +      If CABC is enabled, this is capped to 4095.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +

Similar thing here, is PMI8998 simply a synonym for WLED4 or there
something special about the PMIC versioning that requires it to be used?


Daniel.


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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
