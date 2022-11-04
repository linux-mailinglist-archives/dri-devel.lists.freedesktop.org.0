Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E16198F4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE21610E0C1;
	Fri,  4 Nov 2022 14:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399C989AC3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:13:34 +0000 (UTC)
Received: from [192.168.31.208] (unknown [194.29.137.22])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6BE033F635;
 Fri,  4 Nov 2022 15:13:31 +0100 (CET)
Message-ID: <109c5c9f-5786-c27c-18c9-db214d088cbb@somainline.org>
Date: Fri, 4 Nov 2022 15:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 1/5] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_D1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-2-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221104131358.1025987-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/11/2022 14:13, Dmitry Baryshkov wrote:
> Add another power saving state used on SM8450. Unfortunately adding it
> in proper place causes renumbering of all the opp states in sm8450.dtsi
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

>   arch/arm64/boot/dts/qcom/sm8450.dtsi   | 20 ++++++++++++--------
>   include/dt-bindings/power/qcom-rpmpd.h |  1 +
>   2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index eeff62d0954b..250e6b883ca3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3197,35 +3197,39 @@ rpmhpd_opp_min_svs: opp2 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>   					};
>   
> -					rpmhpd_opp_low_svs: opp3 {
> +					rpmhpd_opp_low_svs_d1: opp3 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +					};
> +
> +					rpmhpd_opp_low_svs: opp4 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>   					};
>   
> -					rpmhpd_opp_svs: opp4 {
> +					rpmhpd_opp_svs: opp5 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>   					};
>   
> -					rpmhpd_opp_svs_l1: opp5 {
> +					rpmhpd_opp_svs_l1: opp6 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>   					};
>   
> -					rpmhpd_opp_nom: opp6 {
> +					rpmhpd_opp_nom: opp7 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>   					};
>   
> -					rpmhpd_opp_nom_l1: opp7 {
> +					rpmhpd_opp_nom_l1: opp8 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>   					};
>   
> -					rpmhpd_opp_nom_l2: opp8 {
> +					rpmhpd_opp_nom_l2: opp9 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
>   					};
>   
> -					rpmhpd_opp_turbo: opp9 {
> +					rpmhpd_opp_turbo: opp10 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>   					};
>   
> -					rpmhpd_opp_turbo_l1: opp10 {
> +					rpmhpd_opp_turbo_l1: opp11 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>   					};
>   				};
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 578e060890dd..69aef395d85b 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -168,6 +168,7 @@
>   /* SDM845 Power Domain performance levels */
>   #define RPMH_REGULATOR_LEVEL_RETENTION	16
>   #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>   #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
>   #define RPMH_REGULATOR_LEVEL_SVS	128
>   #define RPMH_REGULATOR_LEVEL_SVS_L0	144
