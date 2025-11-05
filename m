Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DEEC34874
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CAD10E6DA;
	Wed,  5 Nov 2025 08:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CzGUfFRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C9B10E6D9;
 Wed,  5 Nov 2025 08:44:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6CF7D4376F;
 Wed,  5 Nov 2025 08:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CD0C4CEF8;
 Wed,  5 Nov 2025 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762332276;
 bh=B1mrzqdCotHeUPx6GmeRphi3vwwxC29uywn7AUaYpIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzGUfFRLTsL19Qi/+XP0OzEpr4fmO4sluqZzOHVtWApYci0N543doqZb2LYPRMQR4
 dY3EVAfT1DZ2vwrO7fYLaNlYaTSnc+KirvRrrwMu6Ew/NsyGtBg43SQTwVp6Sir5ET
 ODovueBinj4gWGjlSR5zIFRhClia0uE1HD8cXIzP6s91aSZItsvOjfYekB9LCByPlR
 +owTzT/WQLgiiks5rvCRODfMhUIKdFzoFYtM9H1JdeJAQTf3yvj8hbxZfQPqTT8I9z
 ILgsXLWk6nWUVl6SrnknhDK+0kpfZ5ka+Z1NQgsi801m2a32GWLRkoYE2Gd55ZaGeu
 mZFe9LQ00RxUA==
Date: Wed, 5 Nov 2025 09:44:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ritesh Kumar <riteshk@qti.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_mahap@quicinc.com, 
 andersson@kernel.org, konradybcio@kernel.org, mani@kernel.org, 
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, 
 cros-qcom-dts-watchers@chromium.org, Ritesh Kumar <quic_riteshk@quicinc.com>, 
 linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom-edp: Add eDP ref clk for
 sa8775p
Message-ID: <20251105-juicy-rhino-of-action-b6be48@kuoka>
References: <20251104114327.27842-1-riteshk@qti.qualcomm.com>
 <20251104114327.27842-2-riteshk@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104114327.27842-2-riteshk@qti.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 04, 2025 at 05:13:26PM +0530, Ritesh Kumar wrote:
> From: Ritesh Kumar <quic_riteshk@quicinc.com>
> 
> When the initial contribution of eDP PHY for sa8775p was done,
> eDP reference clock voting was missed. It worked fine at that
> time because the clock was already enabled by the UFS PHY driver.
> 
> After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor
> phy_power_on/off calls"), eDP reference clock started getting
> turned off, leading to the following PHY power-on failure:
> 
> phy phy-aec2a00.phy.10: phy poweron failed --> -110
> 
> To fix this, explicit voting for the eDP reference clock is
> required. This patch adds the eDP reference clock for sa8775p
> eDP PHY and updates the corresponding example node.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index e2730a2f25cf..6c827cf9692b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -200,9 +200,11 @@ examples:
>                    <0x0aec2000 0x1c8>;
>  
>              clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> -                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_EDP_REF_CLKREF_EN>;
>              clock-names = "aux",
> -                          "cfg_ahb";
> +                          "cfg_ahb",
> +                          "ref";
>  
>              #clock-cells = <1>;
>              #phy-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..ba757b08b9b1 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -72,6 +72,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,sa8775p-edp-phy
>              - qcom,x1e80100-dp-phy

I don't have such code in latest next, which makes it impossible to
review.

>      then:
>        properties:
> -- 
> 2.17.1
> 
