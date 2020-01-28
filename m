Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09A714C19E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 21:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95946F3F5;
	Tue, 28 Jan 2020 20:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE0D6F3F6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 20:32:24 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r11so7630275pgf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 12:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ou5WOu7VfwZ76/Tpb4nFYplCE03cb+mvprqzOSe8BeY=;
 b=Fq9IgoEGk1XnnT33IfofL6cze71y8yseMo4RTglFvYjfOiiFEHohk3X2ZwzW6obsSQ
 JGLTF9Wwo/azBiJ72vO/K8fXg05WMJzqe89NKs9eYC5HmfjEtN8R3aty9yUewttbOA2k
 y2Z1/UBWU7klja4flHnxu2Il/S5jBz7DTgQeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ou5WOu7VfwZ76/Tpb4nFYplCE03cb+mvprqzOSe8BeY=;
 b=gmyvlTn/ZD3L1Faf6kLFa1HjjkYmetyPkgXe4sRTPCQDt4CXaz4fZC/A+0YZ+N2y8N
 edLRCouPM75GiBEkDu+8OKMxUk27ud/Or8Sm/m63tFWPWRGjJwzAiJsarbUdZUwemdHz
 sN1M5anvsuXBKqVG+ncV+6XDEXXs8Qsuy7ND/ZD/ONH93d8S3uXydieRbo5djtfXM5lM
 DKcN3UYSXP877YRnEKVAprdlBLYnTj4Kw/OdGWT+z9lhAit862UmVltlGGmFP/bbdLfj
 qOuVo2g2JEaRL0jG7m539SngSw3zqIMipcu4+6KNtLVOyuzlAldPeN6ua/rLtdkTb5K4
 +HEw==
X-Gm-Message-State: APjAAAW/riJlcmXLNVdXdwm+kiXf/BSmcqp1/gmhEJ891kxoIOTLLeuC
 UNFcObL4jMlQyiLyVGiFma55ew==
X-Google-Smtp-Source: APXvYqzk/RCeSgih6aYRRZY6EYuOxyQ3AHi0iBRGvjfg9rwaUzCUjS6yYJBDVRHFkAOT5eesEFor9A==
X-Received: by 2002:a63:d40d:: with SMTP id a13mr27443204pgh.9.1580243543869; 
 Tue, 28 Jan 2020 12:32:23 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id b12sm16516982pfr.26.2020.01.28.12.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 12:32:23 -0800 (PST)
Date: Tue, 28 Jan 2020 12:32:22 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [v4] arm64: dts: sc7180: add display dt nodes
Message-ID: <20200128203222.GD46072@google.com>
References: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 28, 2020 at 06:54:44PM +0530, Harigovindan P wrote:
> Add display, DSI hardware DT nodes for sc7180.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
> 	-Added display DT nodes for sc7180
> Changes in v2:
> 	-Renamed node names
> 	-Corrected code alignments
> 	-Removed extra new line
> 	-Added DISP AHB clock for register access
> 	under display_subsystem node for global settings
> Changes in v3:
> 	-Modified node names
> 	-Modified hard coded values
> 	-Removed mdss reg entry
> Changes in v4:
> 	-Reverting mdp node name
> 	-Setting status to disabled in main SOC dtsi file
> 	-Replacing _ to - for node names
> 	-Adding clock dependency patch link
> 	-Splitting idp dt file to a separate patch
> 
> This patch has dependency on the below series
> https://lkml.org/lkml/2019/12/27/73
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 128 +++++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..c3883af 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,134 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss: mdss@ae00000 {
> +			compatible = "qcom,sc7180-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface", "gcc_bus", "ahb", "core";
> +
> +			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			assigned-clock-rates = <300000000>;
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x800 0x2>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss_mdp: mdp@ae01000 {
> +				compatible = "qcom,sc7180-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>,
> +				      <0 0x0af03000 0 0x16>;
> +				reg-names = "mdp", "vbif", "disp_cc";
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "iface", "rot", "lut", "core",
> +					      "vsync";
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <300000000>,
> +						       <19200000>;

The clock rate for DISP_CC_MDSS_MDP_CLK is already specified in the
parent node, do we really want/need to specify it twice?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
