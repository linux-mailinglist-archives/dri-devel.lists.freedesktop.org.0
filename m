Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974056C6B1E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 15:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E2410EAB8;
	Thu, 23 Mar 2023 14:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDA910EAB0;
 Thu, 23 Mar 2023 14:35:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F2E3B8213C;
 Thu, 23 Mar 2023 14:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D58C433EF;
 Thu, 23 Mar 2023 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679582103;
 bh=XAJilagdFHAbyDVNopysdHU+xHd7bXMhpJwcbv1bR/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lK5N2wJS7Ucyla2zQSLVgPiIR/FhN37JCun+95PHKCELxsixTmFqYSF7WGdYJl6lO
 AKyzJRY6pfUxOUKxsefZNCVKh3QJiCzZb89onDOJ+GXF+5mcTmeqEN8/yYrquDFi+U
 FSk8PlVusxToRj1tU0CaOSiQS04q+Md4debja8HpHA4itGp5VSdr6Dqlyh/BOu2aus
 QZOCSZLWKXA5G0orfx0Ap5ZC5/5iw+VrnpR7fp8C4156KWH0ENaYU42RP1uFhfyGgE
 amq7/vDWPRyy1tC0m5HWcM5ElERp8gka8tzhLVsam1KfepwHHE//YP3+qqHxAifBGe
 Tg7ah7zT7H8KA==
Date: Thu, 23 Mar 2023 07:38:14 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8450: add dp controller
Message-ID: <20230323143814.cdfbgzlnlbnocx5z@ripper>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v6-5-d78313cbc41d@linaro.org>
 <b1e6ca00-348b-4d61-6e90-30bef756732c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1e6ca00-348b-4d61-6e90-30bef756732c@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 09:51:34PM +0100, Konrad Dybcio wrote:
> On 17.03.2023 16:06, Neil Armstrong wrote:
> > @@ -2783,6 +2790,78 @@ opp-500000000 {
> >  				};
> >  			};
> >  
> > +			mdss_dp0: displayport-controller@ae90000 {
> > +				compatible = "qcom,sm8450-dp", "qcom,sm8350-dp";
> > +				reg = <0 0xae90000 0 0x200>,
> > +				      <0 0xae90200 0 0x200>,
> > +				      <0 0xae90400 0 0xc00>,
> > +				      <0 0xae91000 0 0x400>,
> > +				      <0 0xae91400 0 0x400>;
> > +				interrupt-parent = <&mdss>;
> > +				interrupts = <12>;
> > +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> > +				clock-names = "core_iface",
> > +					      "core_aux",
> > +					      "ctrl_link",
> > +			                      "ctrl_link_iface",
> I applied this locally and noticed line has 2x 8 spaces.. Bjorn, could
> you please take care of that when applying?
> 

Thanks for pointing it out. I did correct it, and I had to do the same
in sm8350.dtsi.

@Neil, please run checkpatch --strict, it will highlight these errors.

Thanks,
Bjorn
