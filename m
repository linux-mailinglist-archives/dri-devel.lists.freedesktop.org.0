Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024D29A782
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D8789020;
	Tue, 27 Oct 2020 09:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD1D89020
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:15:20 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w25so657593edx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g6bHoMhiwcmZw1/CSnlFqJcYBMkTv5s8A4syHXJYESk=;
 b=V5nxYpjJAwZgI1O2+PY7hAqJnB2R0qtKEXoUvN4/JI1idDWtaKfpR9U69LMxzmu85X
 xSNC9+8ZnQH00GfZ+xtYh3IlMY+FgTFswtOlf2BG5X0E6C8qPGgjZh2QI/Uj8HHRfoLX
 c+sujjf4Ro1g3AD+p1md4m5HOtPf1In8IQVtTXxeri1q5mBClGJn/zXWLZ7I2Lgx006d
 Zx/88/9NCxPeYZ4cREIlQ47alMd/1VuY7Lt2vDvLqdvRPV9WgKCB54A/iz3A8l+Xhp6r
 MFwhNarBnTwlVTc4WZ74is18nLvz+bPYRrHlVbr6L99e+HJoWOoqUdBYT6apbpa7byKb
 4/pA==
X-Gm-Message-State: AOAM530NCb37jK0dPuunUWREM8jFhR8hfwXWFjPxZ9YTN5bTpnvj4SCF
 ZQkqf/z9kQPPps6r3SjnUbM=
X-Google-Smtp-Source: ABdhPJxd6ufTfpcGWYE02ffhR1QhXCCQSQWXm5hhrDvcb+FyIyVie9373Y/Qw2lKZrkAXRmUqyj8Fg==
X-Received: by 2002:aa7:de95:: with SMTP id j21mr1204973edv.199.1603790119475; 
 Tue, 27 Oct 2020 02:15:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id t5sm546479edw.45.2020.10.27.02.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:15:18 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:15:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 22/52] ARM: tegra: Add interconnect properties to
 Tegra30 device-tree
Message-ID: <20201027091516.GA10762@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-23-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-23-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 01:17:05AM +0300, Dmitry Osipenko wrote:
> Add interconnect properties to the Memory Controller, External Memory
> Controller and the Display Controller nodes in order to describe hardware
> interconnection.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra30.dtsi | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index aeae8c092d41..2caf6cc6f4b1 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -210,6 +210,17 @@ dc@54200000 {
>  
>  			nvidia,head = <0>;
>  
> +			interconnects = <&mc TEGRA30_MC_DISPLAY0A &emc>,

Does not compile.

> +					<&mc TEGRA30_MC_DISPLAY0B &emc>,
> +					<&mc TEGRA30_MC_DISPLAY1B &emc>,
> +					<&mc TEGRA30_MC_DISPLAY0C &emc>,
> +					<&mc TEGRA30_MC_DISPLAYHC &emc>;
> +			interconnect-names = "wina",
> +					     "winb",
> +					     "winb-vfilter",
> +					     "winc",
> +					     "cursor";
> +
>  			rgb {
>  				status = "disabled";
>  			};
> @@ -229,6 +240,17 @@ dc@54240000 {
>  
>  			nvidia,head = <1>;
>  
> +			interconnects = <&mc TEGRA30_MC_DISPLAY0AB &emc>,
> +					<&mc TEGRA30_MC_DISPLAY0BB &emc>,
> +					<&mc TEGRA30_MC_DISPLAY1BB &emc>,
> +					<&mc TEGRA30_MC_DISPLAY0CB &emc>,
> +					<&mc TEGRA30_MC_DISPLAYHCB &emc>;
> +			interconnect-names = "wina",
> +					     "winb",
> +					     "winb-vfilter",
> +					     "winc",
> +					     "cursor";
> +
>  			rgb {
>  				status = "disabled";
>  			};
> @@ -748,15 +770,18 @@ mc: memory-controller@7000f000 {
>  
>  		#iommu-cells = <1>;
>  		#reset-cells = <1>;
> +		#interconnect-cells = <1>;
>  	};
>  
> -	memory-controller@7000f400 {
> +	emc: memory-controller@7000f400 {
>  		compatible = "nvidia,tegra30-emc";
>  		reg = <0x7000f400 0x400>;
>  		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&tegra_car TEGRA30_CLK_EMC>;
>  
>  		nvidia,memory-controller = <&mc>;
> +

No need for blank line.

Best regards,
Krzysztof

> +		#interconnect-cells = <0>;
>  	};
>  
>  	fuse@7000f800 {
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
