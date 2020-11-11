Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E365F2AEA87
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7A489F53;
	Wed, 11 Nov 2020 07:54:50 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9064889BFC
 for <dri-devel@freedesktop.org>; Wed, 11 Nov 2020 04:50:57 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t143so766828oif.10
 for <dri-devel@freedesktop.org>; Tue, 10 Nov 2020 20:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TgiY8fdn90Uls12wgNKgzxp/Onwmpb1Il5B5p1lyVJU=;
 b=VYELtnjAV5Ls0k8ZJfZ7zELRqNDR4/IyfkC7nMGABdnGpdE/Zb9PwJSfoGKyU92gq4
 7UiACwrRNIlrGnDXh7NNg/dHqywhUpUiTH97Emo5n0MQ/QsUQfNb1lkeRe/4BZeWAKW9
 5HbP/pl2a7ByW7MhaXMYXIgqX4pKvlIufMf9WOq182jsV7cCbhTBC0ukB46Zc191LFey
 BX8SF6f4cJdzGZ39ZM61Q2WktAgjlYYaJspMZjosGtj/3qA9+WDGkAj4MoH3qi7ysQ6J
 9/krSDyGAmatCg5vZTv3xqVOKoGRIUTREQBkirg6ltpjdDKe8J5DE9uUYjU+SB1XyAX1
 vh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TgiY8fdn90Uls12wgNKgzxp/Onwmpb1Il5B5p1lyVJU=;
 b=STjPEsSL9rAnSivFZUY1JWd9wW9+WdYXFkfblef33U/t8foU/Soa/sowFNwXQVL29e
 e2BbdDY2mfmCvOEZuO6Ol6iMgM9T6g3jSG2cK5FzhHmQocxh2O+XxZ30wWNV1bomKcML
 tc/9ecHcVv5rJUpeC9aJqvMdfSeAEZFGt6pEsJ236Qrs82CiWRQOXb+dkT16VXMYI0RY
 5K+gY41iBTh2lLfXSCsZkr3eAFlIlM3hukIxRpHxc3NNeAlX6kI1oNBEv4mhzaJlc+nF
 9N0iggj44S0SlkB7feBSqZc1EoFM7L1LNP2X9BunquUOFTywfe9uoz+HdNOP28XDsoeF
 m0Ww==
X-Gm-Message-State: AOAM532DehkIi+aUIAvbWlZ6+tujm/yfzSYpQiNQD6vuJv3VWltx0p9m
 pk5kcFpwEQ46eZZPtSSvdgp9dA==
X-Google-Smtp-Source: ABdhPJwzPtqe2oFKM2VjVJi3f9w9NPihcWFT8lNK7ABdSE3qphYjo0s4kjlFgvKpRXgW+uj2DIxPeQ==
X-Received: by 2002:aca:afd3:: with SMTP id y202mr968450oie.135.1605070256818; 
 Tue, 10 Nov 2020 20:50:56 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l19sm277147otp.65.2020.11.10.20.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 20:50:56 -0800 (PST)
Date: Tue, 10 Nov 2020 22:50:54 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sc7180: Add gpu cooling support
Message-ID: <20201111045054.GE173948@builder.lan>
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604054832-3114-2-git-send-email-akhilpo@codeaurora.org>
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 30 Oct 05:47 CDT 2020, Akhil P Oommen wrote:

> Add cooling-cells property and the cooling maps for the gpu tzones
> to support GPU cooling.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..8e2000c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * SC7180 SoC device tree source
>   *
> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.

I took the liberty of spelling out 2020 here, as I applied this patch.

Regards,
Bjorn

>   */
>  
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> @@ -1886,6 +1886,8 @@
>  			operating-points-v2 = <&gpu_opp_table>;
>  			qcom,gmu = <&gmu>;
>  
> +			#cooling-cells = <2>;
> +
>  			interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>  			interconnect-names = "gfx-mem";
>  
> @@ -3825,16 +3827,16 @@
>  		};
>  
>  		gpuss0-thermal {
> -			polling-delay-passive = <0>;
> +			polling-delay-passive = <100>;
>  			polling-delay = <0>;
>  
>  			thermal-sensors = <&tsens0 13>;
>  
>  			trips {
>  				gpuss0_alert0: trip-point0 {
> -					temperature = <90000>;
> +					temperature = <95000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				gpuss0_crit: gpuss0_crit {
> @@ -3843,19 +3845,26 @@
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&gpuss0_alert0>;
> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		gpuss1-thermal {
> -			polling-delay-passive = <0>;
> +			polling-delay-passive = <100>;
>  			polling-delay = <0>;
>  
>  			thermal-sensors = <&tsens0 14>;
>  
>  			trips {
>  				gpuss1_alert0: trip-point0 {
> -					temperature = <90000>;
> +					temperature = <95000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				gpuss1_crit: gpuss1_crit {
> @@ -3864,6 +3873,13 @@
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&gpuss1_alert0>;
> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		aoss1-thermal {
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
