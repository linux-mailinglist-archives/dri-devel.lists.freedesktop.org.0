Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BF7A7024
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 04:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A041210E2C0;
	Wed, 20 Sep 2023 02:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EE610E2BC;
 Wed, 20 Sep 2023 02:08:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A420FB8171C;
 Wed, 20 Sep 2023 02:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426BBC433C8;
 Wed, 20 Sep 2023 02:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695175687;
 bh=YUTPoteLEsnI9uYlbmDVFgO/ezPSaPVSmDi66jXEgj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5wWhvhVK0q6mN8GzybymtBfptjKK6Kk9ncXw2rJL58oP6UNhOMi6YLNr7QqikZ6G
 Q+z3QVzyyvXRQ5pkvLpsqP0+h8hUxw30Si3mCtkA79TzPbshOF2qzkxiQ62OpTrIir
 I5nFmLX67VH8BBodvHclrsbbNvTt250oU4VOnRCwqFW2xCk3KRCu4sJC+vOC8U8ito
 HS+euQbZA2wWH66n9Ks0JNKVyZe+ZziYe6AxtpYVJt+fkPlb9cnli0rvtCwv/wb5YB
 fyzVS6FycCfjC+Pv2lHesvFRFwkZJO3hI0Y+n+aCcvlrw33e9CkE963rBYuBnlXX3+
 b7ts/F6s5Mx/g==
Date: Tue, 19 Sep 2023 19:12:15 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm8250: Add DisplayPort device
 node
Message-ID: <4eaekxgmikdacvvprysb6btdqootbc6paomzhuqjtzd6rgqxkc@birohtqp4rbo>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817145940.9887-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 05:59:37PM +0300, Dmitry Baryshkov wrote:
> Declare the displayport controller present on the Qualcomm SM8250 SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 89 ++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index eb00bbd3e1f3..8d705a1713fb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3638,6 +3638,8 @@ port@1 {
>  
>  				port@2 {
>  					reg = <2>;
> +
> +					usb_1_qmpphy_dp_in: endpoint {};
>  				};
>  			};
>  		};
> @@ -4405,6 +4407,14 @@ dpu_intf2_out: endpoint {
>  							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp_in>;
> +						};
> +					};
>  				};
>  
>  				mdp_opp_table: opp-table {
> @@ -4432,6 +4442,85 @@ opp-460000000 {
>  				};
>  			};
>  
> +			mdss_dp: displayport-controller@ae90000 {

displayport-controller does not seem to be a valid child node of the
sm8250 mdss. Please make sure that the binding is updated, if not
already done.

Thanks,
Bjorn
