Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ABE60E006
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 13:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E9C10E4E6;
	Wed, 26 Oct 2022 11:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A870810E4BF;
 Wed, 26 Oct 2022 11:50:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1CAB0B821D2;
 Wed, 26 Oct 2022 11:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAA1C433C1;
 Wed, 26 Oct 2022 11:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666785032;
 bh=e4D3lQz4+6tCFxLCts5XSeAOHbOoeUxEUEpqzho9PdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p+MWACUi7/i7gYWdUSIqZr3RegX07DN8fuz5kvakaii6Yz2/3FnAWu7Xq+bel0YOR
 NKb0jXSZ2XHD7Bz1w3NQxI6L6mnr5E6j7Lj80Ktu0dL2h5s+hXWsHfV7xgz/uTWpzy
 aJCMHM9oMHZpKKZhvW65/vKKlM9EjYOiwD6KGg+4xu1yPycx5U7t3TyYI19qn+3ei1
 +JGoYisuFfZWcCENEdc0GQYNIEsXYJhPKlgSqIo8dYrbOkCEKz+2MvkWAj1S+1Ytib
 Q1e9g0qe0rMuFkzZ0PKRaVEDC1MN25FZ64R3F/1CwwsNwMjRZblcqq4d5PF9QDH0U5
 jfxMO67myaKOw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1onevH-0007At-P7; Wed, 26 Oct 2022 13:50:15 +0200
Date: Wed, 26 Oct 2022 13:50:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: sa8295-adp: Enable DP instances
Message-ID: <Y1ke9xp8m5zWg+Mu@hovoldconsulting.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-13-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026032624.30871-13-quic_bjorande@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 08:26:24PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The SA8295P ADP has, among other interfaces, six MiniDP connectors which
> are connected to MDSS0 DP2 and DP3, and MDSS1 DP0 through DP3.
> 
> Enable Display Clock controllers, MDSS instanced, MDPs, DP controllers,
> DP PHYs and link them all together.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

>  &apps_rsc {
> @@ -156,13 +240,169 @@ vreg_l7g: ldo7 {
>  
>  		vreg_l8g: ldo8 {
>  			regulator-name = "vreg_l8g";
> -			regulator-min-microvolt = <880000>;
> -			regulator-max-microvolt = <880000>;
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;

Did you really intend to allow set-load here?

I'm guessing this wasn't the case, but otherwise you also need to
specify the valid modes.

> +		};
> +
> +		vreg_l11g: ldo11 {
> +			regulator-name = "vreg_l11g";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  };

> +&mdss0_dp2_phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l8g>;
> +	vdda-pll-supply = <&vreg_l3g>;
> +};

Johan
