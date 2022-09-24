Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D71B5E8D81
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 16:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14BA10E3AE;
	Sat, 24 Sep 2022 14:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D16F10E3B6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 14:48:07 +0000 (UTC)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl
 [95.49.29.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 09B0E1F8F0;
 Sat, 24 Sep 2022 16:48:04 +0200 (CEST)
Message-ID: <192ee84a-d77e-fc0d-b5be-c3b1930b0c93@somainline.org>
Date: Sat, 24 Sep 2022 16:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom-apq8064: change HDMI PHY node name to
 generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
 <20220924094347.178666-2-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220924094347.178666-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.09.2022 11:43, Dmitry Baryshkov wrote:
> Change HDMI PHY node names from custom 'hdmi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 +-
>  arch/arm/boot/dts/qcom-apq8064.dtsi        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> index 0322cb88d448..497c4012a65b 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> @@ -361,7 +361,7 @@ endpoint {
>  			};
>  		};
>  
> -		hdmi-phy@4a00400 {
> +		phy@4a00400 {
>  			status = "okay";
>  
>  			core-vdda-supply = <&pm8921_hdmi_switch>;
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 1b704c7ea890..58f239218639 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -1453,7 +1453,7 @@ hdmi_out: endpoint {
>  			};
>  		};
>  
> -		hdmi_phy: hdmi-phy@4a00400 {
> +		hdmi_phy: phy@4a00400 {
>  			compatible = "qcom,hdmi-phy-8960";
>  			reg = <0x4a00400 0x60>,
>  			      <0x4a00500 0x100>;
