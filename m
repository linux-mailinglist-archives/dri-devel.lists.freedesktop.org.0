Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999E983CD0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 08:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EC910E0BE;
	Tue, 24 Sep 2024 06:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V5TA6nRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873B010E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 06:14:29 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6dffe3fe4fcso27219857b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727158468; x=1727763268; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/VjSBYA8cGtVWX7UwzKIdqqC/5t90VWcah768k+1m10=;
 b=V5TA6nRvX+xRf1+2bkVibMExdjmOpWRxAY9NqsvqKJmuprKaNOOt0UWP8FdOV+VY1w
 jWq6qKEcBH97Ja2UXeM3sG6YAGGsHHnkpOnlsuFZlRXHRTgcG+CD/93NKvqjk4d8eMyl
 244q9A0b3KOE3vJngPEqXcW3E6zXSoObtzfPODDuZjojBZG7s0nWwxb7HLoqCS73ZJDK
 7p/LaidwBkjVzZkKuPI21iILaewp0Qk4MOe73VyGLbQelX7fjfF0MvVBvqZGLlWZ1XIp
 mzRXRsLY9+krQVCHPmitFA1s7AHordLjkl5wF1RT5gHj5+GTHAZqNJMJe4KKS7e/0z9O
 p57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727158468; x=1727763268;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/VjSBYA8cGtVWX7UwzKIdqqC/5t90VWcah768k+1m10=;
 b=PJDO1sUQFqM6s5vtP4kiRKJb+NEdrIcEl/wsxBX4q1w5YxiAh7gaWVIVsnKPGtQo9e
 VXnlqRDFes9UW7r+g2+oZdju74fYGpgW79xRwxF3BafEeexa2DsTBomzlDL+pzvv2NYn
 rwJDJh8tt2F+3+/Hp0f3OZNVgXc3snCuk/B7j5TCABbT5pkLyml3E+MKfnS31tWZOspJ
 KkwSqZyviDNK/s0E+GEULddzCkLPIjG6+2g816+thxJupSQAnEnm96eZYazU84YPyeUe
 fPUB73WL6u1zid/NvR0gMpMmeAy90rjAE4go6C4QC9c1uxLVr39r+KhJACHvT4r0u39m
 6krw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMSvQDk0+7porxdMLmvRd0xjIju5S+jJR0iLnxyrO89DdAw+hJr3/OxP3XWgazXFaZB2cIrr7c1p8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq6ObhCtHcBDcFhyIlEsbrhVCAPNPQSmjqLr4hhXW5grMWnWdD
 kQpF+QFmLO5wA01VQw5iF8uTeniRQ7KshjiUQm1yUiKdh4EOftKzOezvFN8P9akuxGJ8Qv4muly
 KfqeIMRvWRhCJefraYtYUPI6priSB/eqq+OpspA==
X-Google-Smtp-Source: AGHT+IG72jBrJpCMbV8xmaTG1rW1NrWV8soeY10kze37FjgyQ6JCaV/IOnv2E1o6c7zVnMf1sRd7+1dpErtm2GfwguA=
X-Received: by 2002:a05:690c:f0a:b0:6dd:d34b:373f with SMTP id
 00721157ae682-6dfeed222ebmr130914267b3.8.1727158468586; Mon, 23 Sep 2024
 23:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <20240918-a663-gpu-support-v1-3-25fea3f3d64d@quicinc.com>
 <udt76i3sl7zekhudqpnvhvhfxchvixwoinz7metuwfrpynl47k@wlpforwv7mcf>
 <20240923200537.q5rcw66wmqnwmtpk@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240923200537.q5rcw66wmqnwmtpk@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 08:14:17 +0200
Message-ID: <CAA8EJpqNXb+pJp0OQXi5Pn7d2u2zGeJmVkTvsgFXzvkHn6FjqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 23 Sept 2024 at 22:05, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Wed, Sep 18, 2024 at 12:27:03AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 18, 2024 at 02:08:43AM GMT, Akhil P Oommen wrote:
> > > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > >
> > > Add gpu and gmu nodes for sa8775p based platforms.
> >
> > Which platforms? The commit adds nodes to the SoC and the single RIDE
> > platform.
> >
> > >
> > > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  8 ++++
> > >  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 75 ++++++++++++++++++++++++++++++
> > >  2 files changed, 83 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > index 2a6170623ea9..a01e6675c4bb 100644
> > > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > @@ -407,6 +407,14 @@ queue3 {
> > >     };
> > >  };
> > >
> > > +&gpu {
> > > +   status = "okay";
> > > +
> > > +   zap-shader {
> >
> > It's easier to add gpu_zap_shader_link label in the DTSI file and then
> > reference it instead of using the subnode again.
> >
> > > +           firmware-name = "qcom/sa8775p/a663_zap.mbn";
> > > +   };
> > > +};
> >
> > Separate patch, please.
> >
> > > +
> > >  &i2c11 {
> > >     clock-frequency = <400000>;
> > >     pinctrl-0 = <&qup_i2c11_default>;
> > > diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > > index 23f1b2e5e624..12c79135a303 100644
> > > --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > > @@ -2824,6 +2824,81 @@ tcsr_mutex: hwlock@1f40000 {
> > >                     #hwlock-cells = <1>;
> > >             };
> > >
> > > +           gpu: gpu@3d00000 {
> > > +                   compatible = "qcom,adreno-663.0", "qcom,adreno";
> > > +                   reg = <0 0x03d00000 0 0x40000>,
> > > +                         <0 0x03d9e000 0 0x1000>,
> > > +                         <0 0x03d61000 0 0x800>;
> >
> > I think it's suggested to use 0x0 now
> >
> > > +                   reg-names = "kgsl_3d0_reg_memory",
> > > +                               "cx_mem",
> > > +                               "cx_dbgc";
> > > +                   interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> > > +                   iommus = <&adreno_smmu 0 0xc00>,
> > > +                            <&adreno_smmu 1 0xc00>;
> > > +                   operating-points-v2 = <&gpu_opp_table>;
> > > +                   qcom,gmu = <&gmu>;
> > > +                   interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> >
> > QCOM_ICC_TAG_ALWAYS instead of 0
> >
> > > +                   interconnect-names = "gfx-mem";
> > > +                   #cooling-cells = <2>;
> >
> > No speed bins?
>
> Thanks for the review. Agree on all comments.
>
> Speedbins were missed because we are sharing these changes early in the
> developement cycle, sort of like what we did for chromeos develeopment.
> Will try to pick it up in the next patchset.

Ack. If you mention this in the commit message, that would be great!

>
> -Akhil
>
> >
> > > +
> > > +                   status = "disabled";
> > > +
> > > +                   zap-shader {
> >
> > gpu_zap_shader: zap-shader
> >
> > > +                           memory-region = <&pil_gpu_mem>;
> > > +                   };
> > > +
> > > +                   gpu_opp_table: opp-table {
> > > +                           compatible = "operating-points-v2";
> > > +
> > > +                           opp-405000000 {
> >
> > Just a single freq?
> >
> > > +                                   opp-hz = /bits/ 64 <405000000>;
> > > +                                   opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > +                                   opp-peak-kBps = <8368000>;
> > > +                           };
> > > +
> >
> > Drop the empty line, please.
> >
> > > +                   };
> > > +           };
> > > +
> > > +           gmu: gmu@3d6a000 {
> > > +                   compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> > > +                   reg = <0 0x03d6a000 0 0x34000>,
> > > +                           <0 0x3de0000 0 0x10000>,
> > > +                           <0 0x0b290000 0 0x10000>;
> >
> > Wrong indentation, please align to the angle bracket.
> > Also I think it's suggested to use 0x0 now
> >
> > > +                   reg-names = "gmu", "rscc", "gmu_pdc";
> > > +                   interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                   <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> >
> > And here
> >
> > > +                   interrupt-names = "hfi", "gmu";
> > > +                   clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > > +                            <&gpucc GPU_CC_CXO_CLK>,
> > > +                            <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > > +                            <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> > > +                            <&gpucc GPU_CC_AHB_CLK>,
> > > +                            <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> > > +                            <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> > > +                   clock-names = "gmu",
> > > +                                 "cxo",
> > > +                                 "axi",
> > > +                                 "memnoc",
> > > +                                 "ahb",
> > > +                                 "hub",
> > > +                                 "smmu_vote";
> > > +                   power-domains = <&gpucc GPU_CC_CX_GDSC>,
> > > +                                   <&gpucc GPU_CC_GX_GDSC>;
> > > +                   power-domain-names = "cx",
> > > +                                        "gx";
> > > +                   iommus = <&adreno_smmu 5 0xc00>;
> > > +                   operating-points-v2 = <&gmu_opp_table>;
> > > +
> > > +                   gmu_opp_table: opp-table {
> > > +                           compatible = "operating-points-v2";
> > > +
> > > +                           opp-200000000 {
> > > +                                   opp-hz = /bits/ 64 <200000000>;
> > > +                                   opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> > > +                           };
> > > +                   };
> > > +           };
> > > +
> > >             gpucc: clock-controller@3d90000 {
> > >                     compatible = "qcom,sa8775p-gpucc";
> > >                     reg = <0x0 0x03d90000 0x0 0xa000>;
> > >
> > > --
> > > 2.45.2
> > >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
