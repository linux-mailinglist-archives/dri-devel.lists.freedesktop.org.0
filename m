Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FDC5E8D7B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 16:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C4D10E051;
	Sat, 24 Sep 2022 14:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C90210E051
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 14:47:20 +0000 (UTC)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl
 [95.49.29.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5178A1F8F0;
 Sat, 24 Sep 2022 16:47:17 +0200 (CEST)
Message-ID: <83658ff9-5fc1-c9bc-9c21-98d7e08d534c@somainline.org>
Date: Sat, 24 Sep 2022 16:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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



On 24.09.2022 11:00, Dmitry Baryshkov wrote:
> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
> them with generic phy@ names.
> 
> Dmitry Baryshkov (9):
>   ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>   ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8996: change DSI PHY node name to generic one
>   arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
>   arm64: dts: qcom: sm8250: change DSI PHY node name to generic one
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

for the entire series

Konrad
> 
>  arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 2 +-
>  arch/arm/boot/dts/qcom-apq8064.dtsi                | 2 +-
>  arch/arm/boot/dts/qcom-msm8974.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi              | 2 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm660.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 4 ++--
>  10 files changed, 13 insertions(+), 13 deletions(-)
> 
