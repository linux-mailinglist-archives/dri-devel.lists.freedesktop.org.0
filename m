Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C529DD7A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 01:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469FA89DD3;
	Thu, 29 Oct 2020 00:39:35 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F15E89DEA
 for <dri-devel@freedesktop.org>; Thu, 29 Oct 2020 00:39:34 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x13so876041pfa.9
 for <dri-devel@freedesktop.org>; Wed, 28 Oct 2020 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZedC2vigvm5YIn/fNFp5FXPUqakrWVfWwG+npbhFrco=;
 b=a0s8idfnoRHJpK/+DESXypox99Vruk0+O4DxZW30HW8gOKipZ0aPYM4b6SdecDlU5u
 FVXRZje7gGtILOMRJEDC4r/0++H2soJ7X2pBGgjQBi/Lt/Qx6BoCqLgHwO8ITqSrDgl4
 YQ5cRpMxtT/xxtSGhwB7gw9nr+A2yLv1+jVLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZedC2vigvm5YIn/fNFp5FXPUqakrWVfWwG+npbhFrco=;
 b=tnkOF7ja556OjzbUm/aG7IPjGqCwRO2ucKHRNUQX05SMzmgKBeaRbv8xsaBeWlrEFm
 ExPHjMJcVJbG2ttuolDAHMYs59hnFKsy5sm7T/ubOFfAt9XQ7LMsiTP1JexhuOYDz9Ko
 ZxNH/F1uYOtraYA8p16uJLP3NHlHbc0UfFV38k31+maSyS9zkJzHoptsJSDkJbNE5wn/
 t6NXmgLn/l0jIQV5Ao2545ZRUVg1wXBA9XvcLyd4nDnD6d9vDzWGChucIUQi6a4i6CBw
 +7HkqbP/HsoqmhN0MFXBY91RM4k5lNgzA7g3fwEVIyPpl+Zk5I0UxGjISfs75qLSU5vH
 olwQ==
X-Gm-Message-State: AOAM531cADdR704D/lrmTb8MdAKjt5xvZy9oFBtYoS1Op8SmB4vubCJN
 YgWOVUw/78nfcRrAvrXg3k2aRA==
X-Google-Smtp-Source: ABdhPJzqiMaBmN3vNxFrIabWhxn0PccdODJ8yXJGQuNfW1GBQC4WTzmNeQ9Ufdfb1aV1Bu+P38TCDw==
X-Received: by 2002:a17:90b:230d:: with SMTP id
 mt13mr1445385pjb.177.1603931973929; 
 Wed, 28 Oct 2020 17:39:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id n64sm754497pfn.134.2020.10.28.17.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 17:39:33 -0700 (PDT)
Date: Wed, 28 Oct 2020 17:39:31 -0700
From: mka@chromium.org
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [v3,2/3] arm64: dts: qcom: sc7180: Add gpu cooling support
Message-ID: <20201029003931.GA1855806@google.com>
References: <1603892395-3570-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603892395-3570-2-git-send-email-akhilpo@codeaurora.org>
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
 dianders@chromium.org, linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Akhil,

On Wed, Oct 28, 2020 at 07:09:53PM +0530, Akhil P Oommen wrote:
> Add cooling-cells property and the cooling maps for the gpu tzones
> to support GPU cooling.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..a7ea029 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * SC7180 SoC device tree source
>   *
> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
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
> +					trip = <&gpuss0_alert0>;

Copy & paste error, this should be 'gpuss1_alert0'.

> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		aoss1-thermal {


Other than the C&P error:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
