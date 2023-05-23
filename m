Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED25170DC82
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E79110E429;
	Tue, 23 May 2023 12:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B197610E427;
 Tue, 23 May 2023 12:24:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AEE661447;
 Tue, 23 May 2023 12:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF27FC433D2;
 Tue, 23 May 2023 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684844689;
 bh=gj5qIIuM/4Kg3jC5/WRQLFgOl7Twqxvxi08WIIuci8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KgWNdxltwGQqe77/yXQP1OUs5hUYMlAa7cWzRlcniVlKNMKSR2Fu4pf9sJ1z5+O9J
 JemQW2C7EWNrKRljOPe/LVd7yWtEzsnv1g+mPi2m3oM4LOfartq8L3cHNSGbMQTv5i
 YNoHXYpTrSPo9wOlwmkoaxfEkrBR8vjJ1SD2/BfjvaB2QixOWH3m0YNWVDmtzN+gl2
 3y4GmJe0BBepLjBPw92WBqLDkfYLBz4locVt+GEP0QZXrtVhDR6U/Vg/l3dWTkehDw
 TtQlgcR+5lBvSHHq6APpu5allzmRN7iRgDWFtSoSQIqgXu7oPGv8Fi5Zwoy8NQKsXg
 kWIjjqfBrLKLA==
Date: Tue, 23 May 2023 05:28:42 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Enable GPU related
 nodes
Message-ID: <20230523122842.cueyeovuzpx63def@ripper>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <20230523011522.65351-4-quic_bjorande@quicinc.com>
 <1669ecc5-1845-e671-83f4-19ee14d37ce5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1669ecc5-1845-e671-83f4-19ee14d37ce5@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
 mani@kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, johan@kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 10:04:40AM +0200, Konrad Dybcio wrote:
> 
> 
> On 23.05.2023 03:15, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Add memory reservation for the zap-shader and enable the Adreno SMMU,
> > GPU clock controller, GMU and the GPU nodes for the SC8280XP CRD and the
> > Lenovo ThinkPad X13s.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> > 
> > Changes since v1:
> > - None
> > 
> >  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 26 +++++++++++++++++++
> >  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 26 +++++++++++++++++++
> >  2 files changed, 52 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > index 5b25d54b9591..547277924ea3 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > @@ -210,6 +210,11 @@ vreg_wwan: regulator-wwan {
> >  	};
> >  
> >  	reserved-memory {
> > +		gpu_mem: gpu-mem@8bf00000 {
> The ZAP region is very seldom moved around, and I wouldn't expect it
> to be uncommon among the very usecase-specific 8280 machines.
> 
> > +			reg = <0 0x8bf00000 0 0x2000>;
> > +			no-map;
> > +		};
> > +
> >  		linux,cma {
> >  			compatible = "shared-dma-pool";
> >  			size = <0x0 0x8000000>;
> > @@ -259,6 +264,10 @@ usb1_sbu_mux: endpoint {
> >  	};
> >  };
> >  
> > +&adreno_smmu {
> > +	status = "okay";
> > +};
> Ugh. Should definitely be enabled by default.
> 
> > +
> >  &apps_rsc {
> >  	regulators-0 {
> >  		compatible = "qcom,pm8350-rpmh-regulators";
> > @@ -376,6 +385,23 @@ &dispcc0 {
> >  	status = "okay";
> >  };
> >  
> > +&gmu {
> > +	status = "okay";
> > +};
> You can keep the GMU enabled by default as well, it won't "probe" on
> its own (the GPU's hw_init calls its registration)
> 
> > +
> > +&gpu {
> > +	status = "okay";
> > +
> > +	zap-shader {
> > +		memory-region = <&gpu_mem>;
> > +		firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
> > +	};
> > +};
> > +
> > +&gpucc {
> > +	status = "okay";
> > +};
> Clock controllers have no reason to be off by default.
> 

On sa8295p/sa8540p the GPU is powered differently, so if I leave it
enabled by default I need to disable it (or configure it) for those, or
they won't boot.

Regards,
Bjorn

> Konrad
> > +
> >  &mdss0 {
> >  	status = "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > index bdcba719fc38..5ef3f4c07d75 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > @@ -264,6 +264,11 @@ vreg_wwan: regulator-wwan {
> >  	};
> >  
> >  	reserved-memory {
> > +		gpu_mem: gpu-mem@8bf00000 {
> > +			reg = <0 0x8bf00000 0 0x2000>;
> > +			no-map;
> > +		};
> > +
> >  		linux,cma {
> >  			compatible = "shared-dma-pool";
> >  			size = <0x0 0x8000000>;
> > @@ -359,6 +364,10 @@ usb1_sbu_mux: endpoint {
> >  	};
> >  };
> >  
> > +&adreno_smmu {
> > +	status = "okay";
> > +};
> > +
> >  &apps_rsc {
> >  	regulators-0 {
> >  		compatible = "qcom,pm8350-rpmh-regulators";
> > @@ -518,6 +527,23 @@ &dispcc0 {
> >  	status = "okay";
> >  };
> >  
> > +&gmu {
> > +	status = "okay";
> > +};
> > +
> > +&gpu {
> > +	status = "okay";
> > +
> > +	zap-shader {
> > +		memory-region = <&gpu_mem>;
> > +		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
> > +	};
> > +};
> > +
> > +&gpucc {
> > +	status = "okay";
> > +};
> > +
> >  &mdss0 {
> >  	status = "okay";
> >  };
