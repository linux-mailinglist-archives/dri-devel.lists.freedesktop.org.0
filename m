Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A70D809A76
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 04:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7436310E013;
	Fri,  8 Dec 2023 03:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A86A10E013;
 Fri,  8 Dec 2023 03:34:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C2F02CE25D8;
 Fri,  8 Dec 2023 03:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AF4C433C7;
 Fri,  8 Dec 2023 03:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702006439;
 bh=gvbTjN36aMg/8pd0wDaFdxIHv1L9nizj9pVmZyQNfvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XT/f7OFCQw+yUyR8eYvAXk3PZ0ZScodSRv43KEThVVXSFdT5lRTRXm6vr8zT5m1og
 P+W4Drkj4mrQiNkL4zSo6u24njZNzCpBzxEStx2lKX7Bn2elODmrJRjdjK0MRG4j2L
 osOT9U3Q1XSJseKVhrQW6Qz1PI+THOt65SN6d7jzHeRydw918SG1k2sX+H3IcEIi+v
 nAYqXYWjK1AF09RPymVhJ6ZgiS72sRLnnRfucYOY6yZ61/pXK8ASkWT5QCqhs8S0al
 PVsoIOxs3t1WTniTWQ+HIrYHRaIlwqrfnDC5EirMXD4KrpMfkHKkyMk3dw6MbvEA/Z
 TaMmtJO8IjRRg==
Date: Thu, 7 Dec 2023 19:38:33 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Add DisplayPort device nodes
Message-ID: <bcecxzpogq6pndwmhgrl52ia3orni2q5brg6mpc6fkn5widigb@v6dy4minwajx>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
 <20231207-topic-sm8650-upstream-dp-v1-3-b762c06965bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-3-b762c06965bb@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 05:37:19PM +0100, Neil Armstrong wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
[..]
> +
> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,sm8650-dp";
> +				reg = <0 0xaf54000 0 0x200>,
> +				      <0 0xaf54200 0 0x200>,
> +				      <0 0xaf55000 0 0xc00>,
> +				      <0 0xaf56000 0 0x400>,
> +				      <0 0xaf57000 0 0x400>;
> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +
> +				power-domains = <&rpmhpd RPMHPD_MX>;

Are you sure the DP TX block sits in MX? I'd expect this to be
RPMHPD_MMCX, and then the PHY partially in MX...

> +
> +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp0_out: endpoint {
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {

Is there any reason why we keep sorting 'o' after 'p' in these nodes?

Regards,
Bjorn
