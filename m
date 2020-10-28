Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930E929D0B1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A046E110;
	Wed, 28 Oct 2020 15:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A946F899A7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:28:38 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j7so5323187oie.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C6fODSQ4vr9/XMdY27bSNaiMwe4c2CZ3zY9crW4kgXQ=;
 b=IBIa+DBeerQBSHR+7esScDJQh6xUbwF60O9Y6ziY2GaUD5vF+wJ2ApYRvlTyxS/Hra
 EaFDYbzMFrTeJiazDt3dsomAY8Sbcj7O5qIsI35B4AZNXAObFKOm5q1aqx/BptqjvHEK
 utUuMJL2QaDGwrqkMA9CDFFz/+mRwT3bM5WYvbO4coTAQ2NnPNecwEnLU4fvnE1m9PUj
 ADfkBzijLR7+84cKLnQ4WofJt2jvMiPrOvGd4FZVWn/ikPPIc2cKJ0Nvfz2KgkCQxlWN
 MPgBwTZn7WtuwKBUKraGW8LLvzzShoHWSpq0ASdlg8mExcvdiqFr+7T39ACgK3I+G+8Z
 mI2A==
X-Gm-Message-State: AOAM5330VbiicmEXolyrKVs3qlcvJHgMY5A2h947lAGEMsihkZk+MbMY
 IX5V7JYylE0t0qjwKiQAaw==
X-Google-Smtp-Source: ABdhPJzrQ/sPPiQh1XWKgR+EAUUZ9HS2ocEuKqdVfGw3aS3RICzkEg8FJnv6OaOSMDEQcXRlXFSJlA==
X-Received: by 2002:a05:6808:198:: with SMTP id
 w24mr5539933oic.69.1603898917913; 
 Wed, 28 Oct 2020 08:28:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s20sm307873oof.39.2020.10.28.08.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:28:37 -0700 (PDT)
Received: (nullmailer pid 4057539 invoked by uid 1000);
 Wed, 28 Oct 2020 15:28:35 -0000
Date: Wed, 28 Oct 2020 10:28:35 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
Message-ID: <20201028152835.GB4051913@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-9-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 01:16:51AM +0300, Dmitry Osipenko wrote:
> External Memory Controller can gather various hardware statistics that
> are intended to be used for debugging purposes and for dynamic frequency
> scaling of memory bus.
> 
> Document the new mfd-simple compatible and EMC statistics sub-device.

It's simple-mfd.

That should only be used if the child has no dependencies on the parent 
node (and driver).

> The subdev contains EMC DFS OPP table and interconnect paths to be used
> for dynamic scaling of system's memory bandwidth based on EMC utilization
> statistics.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.txt | 43 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> index 8d09b228ac42..382aabcd6952 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> @@ -4,7 +4,7 @@ Properties:
>  - name : Should be emc
>  - #address-cells : Should be 1
>  - #size-cells : Should be 0
> -- compatible : Should contain "nvidia,tegra20-emc".
> +- compatible : Should contain "nvidia,tegra20-emc" and "simple-mfd".
>  - reg : Offset and length of the register set for the device
>  - nvidia,use-ram-code : If present, the sub-nodes will be addressed
>    and chosen using the ramcode board selector. If omitted, only one
> @@ -17,7 +17,8 @@ Properties:
>  - core-supply: Phandle of voltage regulator of the SoC "core" power domain.
>  - operating-points-v2: See ../bindings/opp/opp.txt for details.
>  
> -Child device nodes describe the memory settings for different configurations and clock rates.
> +Child device nodes describe the memory settings for different configurations and clock rates,
> +as well as EMC activity statistics collection sub-device.
>  
>  Example:
>  
> @@ -31,17 +32,34 @@ Example:
>  		...
>  	};
>  
> +	emc_bw_dfs_opp_table: emc_opp_table1 {
> +		compatible = "operating-points-v2";
> +
> +		opp@36000000 {
> +			opp-hz = /bits/ 64 <36000000>;
> +			opp-peak-kBps = <144000>;
> +		};
> +		...
> +	};
> +
>  	memory-controller@7000f400 {
>  		#address-cells = < 1 >;
>  		#size-cells = < 0 >;
>  		#interconnect-cells = < 0 >;
> -		compatible = "nvidia,tegra20-emc";
> +		compatible = "nvidia,tegra20-emc", "simple-mfd";
>  		reg = <0x7000f400 0x400>;
>  		interrupts = <0 78 0x04>;
>  		clocks = <&tegra_car TEGRA20_CLK_EMC>;
>  		nvidia,memory-controller = <&mc>;
>  		core-supply = <&core_vdd_reg>;
>  		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
> +
> +		emc-stats {
> +			compatible = "nvidia,tegra20-emc-statistics";
> +			operating-points-v2 = <&emc_bw_dfs_opp_table>;
> +			interconnects = <&mc TEGRA20_MC_MPCORER &emc>;
> +			interconnect-names = "cpu";
> +		};
>  	}
>  
>  
> @@ -120,3 +138,22 @@ Properties:
>  						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
>  						 0 0 0 0 >;
>  		};
> +
> +
> +
> +Embedded Memory Controller statistics gathering sub-device
> +
> +EMC statistics subdev gathers information about hardware utilization
> +which is intended to be used for debugging purposes and for dynamic
> +frequency scaling based on the collected stats.
> +
> +Properties:
> +- name : Should be emc-stats.
> +- compatible : Should contain "nvidia,tegra20-emc-statistics".
> +- operating-points-v2: See ../bindings/opp/opp.txt for details.
> +- interconnects: Should contain entries for memory clients sitting on
> +                 MC->EMC memory interconnect path.
> +- interconnect-names: Should include name of the interconnect path for each
> +                      interconnect entry. Consult TRM documentation for
> +                      information about available memory clients, see MEMORY
> +                      CONTROLLER section.
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
