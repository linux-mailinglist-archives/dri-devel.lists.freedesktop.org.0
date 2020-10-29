Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D322529DE13
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 01:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3256E14F;
	Thu, 29 Oct 2020 00:49:53 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94B66E14F
 for <dri-devel@freedesktop.org>; Thu, 29 Oct 2020 00:49:51 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c20so897144pfr.8
 for <dri-devel@freedesktop.org>; Wed, 28 Oct 2020 17:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QjqMc7l+70GPiHEtdcLDE2w5wxCubKj+e+9vvDhN4jw=;
 b=KWesP9d25XLLiCMeDoho0aDAfWKj5ghD7xuB9bZ/rz7fD2ZttLECup+c3B9hOey+de
 moHDsKZEfVZM/JNlZYMtKT3rx8fgMoLiz62UGRQXQk6zoHpZaStlCtIJNNz5EFLWD5o0
 zBTVsxNKNkaI6yNaolffTZybUeJVIAtd622/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QjqMc7l+70GPiHEtdcLDE2w5wxCubKj+e+9vvDhN4jw=;
 b=p9Vd5XOMxib1b4U4pYXPebRdAdqe6MFRr/d+owVPfm5WGjzkaJRN5hqvTEPJOvuGcR
 V5v6CDBbl2Mg+JLqi/PLRtYnFHgl9xYIYD4/TDoSXRZjlnKtYrxoFWAIqWHiXZIGygEb
 EIn2XaAfqUA+2bOB+iOw6lGWFwRa7v3JrZuESQwdt+yJ8ozSxzZwkR92YWBoKC8Lq7zJ
 iucceLF3pbLvAWm5aVwWMwUfCEQWL0+zgnJqrEboI8QUQGJxVPdOIacdmAltnoGCd+Kz
 wHmF/jQWleWMtII7sbFg3cybFcjqSSIpGC7heBJv6pYx7TNPMOvTX4osBqv7pSYxTIQ9
 HFIg==
X-Gm-Message-State: AOAM533olDAqXGj1Kbart13EYOTgWKtOATU1Me756RhoqsIiOKxXsRW5
 /tGKm121fDQThG6b2lNpTLs9ag==
X-Google-Smtp-Source: ABdhPJwEq/sau27VV7p4hVDzceI1BjScm1N5vyp0R9X8+H9CxHrUZkAC08SATGsvPL31v7pDv5VeSw==
X-Received: by 2002:a63:f502:: with SMTP id w2mr1727045pgh.186.1603932591575; 
 Wed, 28 Oct 2020 17:49:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id 17sm789966pfj.49.2020.10.28.17.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 17:49:51 -0700 (PDT)
Date: Wed, 28 Oct 2020 17:49:49 -0700
From: mka@chromium.org
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [v3,3/3] dt-bindings: drm/msm/gpu: Add cooling device support
Message-ID: <20201029004949.GB1855806@google.com>
References: <1603892395-3570-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603892395-3570-3-git-send-email-akhilpo@codeaurora.org>
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

On Wed, Oct 28, 2020 at 07:09:54PM +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 1af0ff1..090dcb3 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -39,6 +39,10 @@ Required properties:
>          a4xx Snapdragon SoCs. See
>          Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
>  
> +Optional properties:
> +- #cooling-cells: The value must be 2. For details, please refer
> +	Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.
> +
>  Example 3xx/4xx:
>  
>  / {
> @@ -61,6 +65,7 @@ Example 3xx/4xx:
>  		power-domains = <&mmcc OXILICX_GDSC>;
>  		operating-points-v2 = <&gpu_opp_table>;
>  		iommus = <&gpu_iommu 0>;
> +		#cooling-cells = <2>;
>  	};
>  
>  	gpu_sram: ocmem@fdd00000 {
> @@ -98,6 +103,8 @@ Example a6xx (with GMU):
>  		reg = <0x5000000 0x40000>, <0x509e000 0x10>;
>  		reg-names = "kgsl_3d0_reg_memory", "cx_mem";
>  
> +		#cooling-cells = <2>;
> +
>  		/*
>  		 * Look ma, no clocks! The GPU clocks and power are
>  		 * controlled entirely by the GMU

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
