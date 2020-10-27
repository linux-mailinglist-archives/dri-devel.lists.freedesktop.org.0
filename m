Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5E29A71A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009DD6EB2B;
	Tue, 27 Oct 2020 08:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FB86EB2B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 08:57:23 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v19so578870edx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 01:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lUl+o/7xg/oQWEkHSv+Sd9NIOES//4+6SIoc9etOZOE=;
 b=OznDuhYLcJ0Q2v62md/33A8jJQVAO3xUeAnQxrt2cca84rm3pEE4hAx34MIjRqoYEz
 mrO9BeTIFsQ8iR92Aw4OVBkBXPmWX1jL4h0WxxOxMIK1PvHjmuqPLVvlJydeXwzIM/id
 xyobOvbfLTXL8KHtKiNBUto+aBFBn3+i3nWLb4V/mxhNRU/A0R7l7o30VK4Ap3EA9QgQ
 B7Sb+RfqNhLdHSAI9YtYR/je5YQnuzDDDD0VlrLdGb97agGNMTPyvzeHBF1gFh/HKuxy
 /DF0E6u1LQslv1Iq6GMOKLTnIn4gdsTq46GefM78ufo7A9ZB8Z/xUjk6ZMm7i5ePVhVb
 vKjg==
X-Gm-Message-State: AOAM530oPUvussLPXqjP/2TzJvaoGJF/nSFMvmy231zOSJCRjRZVCFtz
 KOHEbpxel4CYfCUinDCgbo0=
X-Google-Smtp-Source: ABdhPJz1HXUDOFZ/JUJ/wbYV21cxZO30liKh11vnxTXHeeuT2qryjv96syz//4EvKya3F2LDe8npww==
X-Received: by 2002:aa7:c792:: with SMTP id n18mr1099285eds.209.1603789041727; 
 Tue, 27 Oct 2020 01:57:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id hb6sm591383ejb.65.2020.10.27.01.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 01:57:20 -0700 (PDT)
Date: Tue, 27 Oct 2020 09:57:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 07/52] dt-bindings: memory: tegra20: emc: Document OPP
 table and voltage regulator
Message-ID: <20201027085718.GF4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-8-digetx@gmail.com>
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

On Mon, Oct 26, 2020 at 01:16:50AM +0300, Dmitry Osipenko wrote:
> The SoC core voltage can't be changed without taking into account the
> clock rate of External Memory Controller. Document OPP table that will
> be used for dynamic voltage frequency scaling, taking into account EMC
> voltage requirement. Document optional core voltage regulator, which is
> optional because some boards may have a fixed core regulator and still
> frequency scaling may be desired to have.

You need to document that property is optional in the binding.

Best regards,
Krzysztof

> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.txt      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> index 0a53adc6ccba..8d09b228ac42 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> @@ -14,11 +14,23 @@ Properties:
>  - clocks : Should contain EMC clock.
>  - nvidia,memory-controller : Phandle of the Memory Controller node.
>  - #interconnect-cells : Should be 0.
> +- core-supply: Phandle of voltage regulator of the SoC "core" power domain.
> +- operating-points-v2: See ../bindings/opp/opp.txt for details.
>  
>  Child device nodes describe the memory settings for different configurations and clock rates.
>  
>  Example:
>  
> +	emc_icc_dvfs_opp_table: emc_opp_table0 {
> +		compatible = "operating-points-v2";
> +
> +		opp@36000000 {
> +			opp-microvolt = <950000 950000 1300000>;
> +			opp-hz = /bits/ 64 <36000000>;
> +		};
> +		...
> +	};
> +
>  	memory-controller@7000f400 {
>  		#address-cells = < 1 >;
>  		#size-cells = < 0 >;
> @@ -28,6 +40,8 @@ Example:
>  		interrupts = <0 78 0x04>;
>  		clocks = <&tegra_car TEGRA20_CLK_EMC>;
>  		nvidia,memory-controller = <&mc>;
> +		core-supply = <&core_vdd_reg>;
> +		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
>  	}
>  
>  
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
