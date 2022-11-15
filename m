Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87966629AF1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18BC10E3FD;
	Tue, 15 Nov 2022 13:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B86D10E3F6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:45:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id be13so24499073lfb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6C4qzSxJODnTx3c8m8GXC7Qrtvk8RrOjz6X2ODydhg=;
 b=pY51M7M/UwSYTsg5DV+5DQ0w5thPCNM1RQxRVuzP/72UBvJa5K+Bucxwuqg3K79Ldd
 zqv6vBDd7GKivSGkZ/+tsIY6CEMrfYkCD13XZdlrfMb76O4a69jbmDl/Bl6/ZgmX5j3K
 oys37HLAi70w/78m+g/BNjvYiyEXeKTfwmN3E1a1fOyFLtSibgwNLG+54huhseb4bBWq
 z3k9ZR0/o8xKHoTzfuWtWGW393iIb5nRMDAK9xIj6Pd7wILhXcqHosFvYrb/VLxCaSeo
 VbQdUoCUYkcRd6i7tI3y3Xt10hRW0U/5itOGHh9jOqnOFUP8vygd+WoFS923DPBK8HpQ
 ofGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x6C4qzSxJODnTx3c8m8GXC7Qrtvk8RrOjz6X2ODydhg=;
 b=JPW82/4TRSF0A+gpGR6W3KDjKtAioNlXBKaBN/pDyPdBwjeXvb6jNmi7ePupPBi2Ra
 lGuvvwwFEpmtzVPPW4EmQn6CBuN+Z27vKC1JJfRQTMppW7EcZGjrF3UG1Gf71HUaFywN
 z6z1ESeQPZSZ+cSI/ZPWtDn6VYSw9I7VlM3rJovWApjEB10dSlC7/wZPB3O4XU57sycG
 IaX/Zl2gEuDMKDrtpkWRlvq1dgaGIAbCKQhPSiyQsDk21Osa6eO/8sbAO9ths1yb9KdE
 QwBqkxxEc5CitW88P1U/Y2oqBM9f+pxi7LzmIr9viqtFHsIgnB9fJ/svW9r1NFawgVQY
 V2CQ==
X-Gm-Message-State: ANoB5pmOO0Cuam4dlP/u+3MAHrH8xo2DqY/oOBukWfKzPm6u4NIGxgXY
 ytwiihrW10OZRPqs3zxRIRBqsA==
X-Google-Smtp-Source: AA0mqf50TlTdoUfXi64mbj+svVdUrwEsS9ZdgXwMQ5nQHsStzJxYzvsyunoaUV6LQ6PAUzgSkSY0rg==
X-Received: by 2002:a05:6512:3766:b0:4ac:2fae:8a9e with SMTP id
 z6-20020a056512376600b004ac2fae8a9emr5404754lft.413.1668519920779; 
 Tue, 15 Nov 2022 05:45:20 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a2eb553000000b002776eb5b1cesm2530344ljn.8.2022.11.15.05.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:45:20 -0800 (PST)
Message-ID: <760918b4-e94e-38b0-8a66-629f2eaf89af@linaro.org>
Date: Tue, 15 Nov 2022 14:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/12] arm64: dts: qcom: sm8350: Use 2 interconnect
 cells
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-10-robert.foss@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115133105.980877-10-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 15/11/2022 14:31, Robert Foss wrote:
> Use two interconnect cells in order to optionally
> support a path tag.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 805d53d91952..434f8e8b12c1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1543,56 +1543,56 @@ apps_smmu: iommu@15000000 {
>   		config_noc: interconnect@1500000 {
>   			compatible = "qcom,sm8350-config-noc";
>   			reg = <0 0x01500000 0 0xa580>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
>   		mc_virt: interconnect@1580000 {
>   			compatible = "qcom,sm8350-mc-virt";
>   			reg = <0 0x01580000 0 0x1000>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
>   		system_noc: interconnect@1680000 {
>   			compatible = "qcom,sm8350-system-noc";
>   			reg = <0 0x01680000 0 0x1c200>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
>   		aggre1_noc: interconnect@16e0000 {
>   			compatible = "qcom,sm8350-aggre1-noc";
>   			reg = <0 0x016e0000 0 0x1f180>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
>   		aggre2_noc: interconnect@1700000 {
>   			compatible = "qcom,sm8350-aggre2-noc";
>   			reg = <0 0x01700000 0 0x33000>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
>   		mmss_noc: interconnect@1740000 {
>   			compatible = "qcom,sm8350-mmss-noc";
>   			reg = <0 0x01740000 0 0x1f080>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
>   		lpass_ag_noc: interconnect@3c40000 {
>   			compatible = "qcom,sm8350-lpass-ag-noc";
>   			reg = <0 0x03c40000 0 0xf080>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
>   		compute_noc: interconnect@a0c0000{
>   			compatible = "qcom,sm8350-compute-noc";
>   			reg = <0 0x0a0c0000 0 0xa180>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
> @@ -1620,8 +1620,8 @@ ipa: ipa@1e40000 {
>   			clocks = <&rpmhcc RPMH_IPA_CLK>;
>   			clock-names = "core";
>   
> -			interconnects = <&aggre2_noc MASTER_IPA &mc_virt SLAVE_EBI1>,
> -					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_IPA_CFG>;
> +			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
>   			interconnect-names = "memory",
>   					     "config";
>   
> @@ -1661,7 +1661,7 @@ mpss: remoteproc@4080000 {
>   					<&rpmhpd SM8350_MSS>;
>   			power-domain-names = "cx", "mss";
>   
> -			interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
> +			interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1 0>;
>   
>   			memory-region = <&pil_modem_mem>;
>   
> @@ -2239,7 +2239,7 @@ cdsp: remoteproc@98900000 {
>   					<&rpmhpd SM8350_MXC>;
>   			power-domain-names = "cx", "mxc";
>   
> -			interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
> +			interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
>   
>   			memory-region = <&pil_cdsp_mem>;
>   
> @@ -2421,14 +2421,14 @@ usb_2_ssphy: phy@88ebe00 {
>   		dc_noc: interconnect@90c0000 {
>   			compatible = "qcom,sm8350-dc-noc";
>   			reg = <0 0x090c0000 0 0x4200>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
>   		gem_noc: interconnect@9100000 {
>   			compatible = "qcom,sm8350-gem-noc";
>   			reg = <0 0x09100000 0 0xb4000>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
