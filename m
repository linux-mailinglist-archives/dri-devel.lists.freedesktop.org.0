Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC356D853
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 10:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC17F18B863;
	Mon, 11 Jul 2022 08:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21C518B797
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 08:39:50 +0000 (UTC)
Received: from [192.168.1.101] (abxi46.neoplus.adsl.tpnet.pl [83.9.2.46])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 174001F53E;
 Mon, 11 Jul 2022 10:39:46 +0200 (CEST)
Message-ID: <81d2e86e-ed60-293c-1157-e3f076f7e058@somainline.org>
Date: Mon, 11 Jul 2022 10:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/11] arm64: dts: qcom: sc7180: rename DPU device node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220710090040.35193-3-dmitry.baryshkov@linaro.org>
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



On 10.07.2022 11:00, Dmitry Baryshkov wrote:
> Rename DPU device node to display-controller@ae01000 to follow the
> DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 72994f599825..e63b4515453f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2911,7 +2911,7 @@ mdss: mdss@ae00000 {
>  
>  			status = "disabled";
>  
> -			mdp: mdp@ae01000 {
> +			mdp: display-controller@ae01000 {
>  				compatible = "qcom,sc7180-dpu";
>  				reg = <0 0x0ae01000 0 0x8f000>,
>  				      <0 0x0aeb0000 0 0x2008>;
