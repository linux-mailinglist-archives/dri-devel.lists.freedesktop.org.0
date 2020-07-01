Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C541210E61
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 17:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B5D6E91D;
	Wed,  1 Jul 2020 15:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E077C6E91D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 15:06:22 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id bj10so4795666plb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dLJbOj3weGuPoGEm8Q6BpPocRqtRJNsyr2+B1hO3Q2k=;
 b=Tac+073Gs4Yz9fnZoHmNM/3l3vwjU4nRfnBMpJcyd4ZxtlpOFBqM54IEqy6jgljJQh
 1CM4An+UyXRPAMlFTPKmFSKV0SW84bNHt/vl81NZJboRBuROaByH5MU/DUKePPjkFsF0
 jNUwWp4j+pigGNxsz2Va7Jf/P7TIrVOVBN5Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dLJbOj3weGuPoGEm8Q6BpPocRqtRJNsyr2+B1hO3Q2k=;
 b=FVMnRydYxdBs0kMfli9MbKn3E67SqMRtwtk9j9S+Hz2dvdxUKWxfWY3L5+xHYydGlG
 FMraUFrlePPWhbpRI66XQP2oNBfuQJ2AwB53J6o/2+wbzvqEI6AAUlbg/e7iJnyX/8fo
 +OxNjIoiaih86katFPp7O6AEC7fnlIIYqGyU02oxeITZ+b5XBOi90yInbbKQa1qtP6il
 77EFrHTuJXlKWDDp1gBLrr1tcZYs8j/ttBTNO+Zbr3EFObdyTnJyaaGFE9+JI1VE3nky
 yeS8kHNjyWF7pAQ/VwUiroKaBcRvPm6zMZYf7XO2tM8YeTZ3NHLhVXkig9ZVTnct8QPe
 aGXw==
X-Gm-Message-State: AOAM533gVxSjRm62pgcZeq6UhQ1bsK3sHMF+QkeMgiTN722BO2SeAVIV
 6cwLg1gDqzXY2x8FwxYNLCHpnw==
X-Google-Smtp-Source: ABdhPJytwmuQKVsDHcQnD/m9ZVn64MGAI0QRRqQ5h+0IfFzfY/v+88L6j6n9J5wCQwK19xbs052i6A==
X-Received: by 2002:a17:902:7b85:: with SMTP id
 w5mr11843135pll.22.1593615982469; 
 Wed, 01 Jul 2020 08:06:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id n19sm6211028pgb.0.2020.07.01.08.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 08:06:21 -0700 (PDT)
Date: Wed, 1 Jul 2020 08:06:19 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 3/4] arm64: dts: sdm845: Add DSI and MDP OPP tables and
 power-domains
Message-ID: <20200701150619.GM39073@google.com>
References: <1593518176-24450-1-git-send-email-rnayak@codeaurora.org>
 <1593518176-24450-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593518176-24450-4-git-send-email-rnayak@codeaurora.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 05:26:15PM +0530, Rajendra Nayak wrote:
> Add the OPP tables for DSI and MDP based on the perf state/clk
> requirements, and add the power-domains property to specify the
> scalable power domain.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 59 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 8eb5a31..b6afeb2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3296,6 +3296,35 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		dsi_opp_table: dsi-opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-19200000 {
> +				opp-hz = /bits/ 64 <19200000>;
> +				required-opps = <&rpmhpd_opp_min_svs>;
> +			};
> +
> +			opp-180000000 {
> +				opp-hz = /bits/ 64 <180000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-275000000 {
> +				opp-hz = /bits/ 64 <275000000>;
> +				required-opps = <&rpmhpd_opp_svs>;
> +			};
> +
> +			opp-328580000 {
> +				opp-hz = /bits/ 64 <328580000>;
> +				required-opps = <&rpmhpd_opp_svs_l1>;
> +			};
> +
> +			opp-358000000 {
> +				opp-hz = /bits/ 64 <358000000>;
> +				required-opps = <&rpmhpd_opp_nom>;
> +			};
> +		};
> +

I still don't like the shared OPP tables to be positioned inmidst of the
device nodes, but it seems we currently don't have a better convention.

>  		mdss: mdss@ae00000 {
>  			compatible = "qcom,sdm845-mdss";
>  			reg = <0 0x0ae00000 0 0x1000>;
> @@ -3340,6 +3369,8 @@
>  						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>  				assigned-clock-rates = <300000000>,
>  						       <19200000>;
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmhpd SDM845_CX>;
>  
>  				interrupt-parent = <&mdss>;
>  				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> @@ -3364,6 +3395,30 @@
>  						};
>  					};
>  				};
> +
> +				mdp_opp_table: mdp-opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-19200000 {
> +						opp-hz = /bits/ 64 <19200000>;
> +						required-opps = <&rpmhpd_opp_min_svs>;
> +					};
> +
> +					opp-171428571 {
> +						opp-hz = /bits/ 64 <171428571>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-344000000 {
> +						opp-hz = /bits/ 64 <344000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-430000000 {
> +						opp-hz = /bits/ 64 <430000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
>  			};
>  
>  			dsi0: dsi@ae94000 {
> @@ -3386,6 +3441,8 @@
>  					      "core",
>  					      "iface",
>  					      "bus";
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SDM845_CX>;
>  
>  				phys = <&dsi0_phy>;
>  				phy-names = "dsi";
> @@ -3450,6 +3507,8 @@
>  					      "core",
>  					      "iface",
>  					      "bus";
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SDM845_CX>;
>  
>  				phys = <&dsi1_phy>;
>  				phy-names = "dsi";

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
