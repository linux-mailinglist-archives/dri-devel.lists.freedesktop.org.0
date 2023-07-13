Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13AE751C9C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C136710E646;
	Thu, 13 Jul 2023 09:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DFE10E646
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:05:11 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-c15a5ed884dso417107276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689239108; x=1689843908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xn6ei9/9nS3M5OJwomJN5UPa70NekYkgBc6ibiFgkyQ=;
 b=xXXWLGivZPS53UODz4dM7TyUnoncEK5FE86gyc4bHY71qNzZeJmJb7w06cH4dFSdQR
 P0x4CQqUTz9BiB+Qglq2I7MSPbtS+dJ5ItOA7QlFES435E7+Mf3mUb2I3tiNeoybdi7L
 DqkicFGq+98dJizdYCYAz5xzgciVAWvFO2uELgtAJEfzfSwCsf8HJCf3DOeenRLzQpqr
 9QqiWiDW3adGV24n9d4MOkj4Zzhj31CxxVZPlJcAMz2uIBY/biLf437FI+zp+L2HvZdc
 tfGxdpDL6IH4vvexo9VaKW2x2eLCLDNHNWPYV+6cpdg2jvB9cuWvfBiU2YH3FpL+uvdl
 2NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239108; x=1689843908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xn6ei9/9nS3M5OJwomJN5UPa70NekYkgBc6ibiFgkyQ=;
 b=JuPSpFKoklRd/4kRmPEDSNqx7CsEpQSfrOBUsmHipVlL5U1B2Q+I+Bh7Q+XYJdjZ1g
 dVm1/9RDuxvZfuh1M6HBOoShYeaMG8q+m2ZTg4+lk63TNoD1oxmr0pa2ZGU0zxufo80s
 xtYe3l4DodQhHfTdJiUv/8bscKBny2f+vxG+m1PhcVR341PG0PuWp18oDPoPewLQY+3E
 bBXugR1foC8HxQvGMHV5gsv4V2ZDlCIKWTx9tYMXGTxNaMsFQNMCzD1CnZOUMuIqWW3J
 cE4pJBFRSpgMVcgdmk7UoMDmoXvvGo6oV3stitsWQmd+t/4L/UFWwPy0O8Vv5vTbs+cK
 9eQw==
X-Gm-Message-State: ABy/qLYkr7Ig7WDoNWrliF3osVsVLhX7D6HLfqDcnHawvvVUSn1F1twL
 VXp90TsYgsEMbchhTr5pwfSuYFxTlUPp7tSIf0y+Ng==
X-Google-Smtp-Source: APBJJlGXJvvYoDza1StirRlGQElXF0pCyCiFnb5V8pzk8ik9XDgwvV9D9fD7+yABjfcZa47O94WvNoZjX60yu5f73II=
X-Received: by 2002:a25:aba2:0:b0:bad:125f:9156 with SMTP id
 v31-20020a25aba2000000b00bad125f9156mr895305ybi.35.1689239108637; Thu, 13 Jul
 2023 02:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-9-dmitry.baryshkov@linaro.org>
 <9587baf4-2316-494d-fbd1-73a86e742741@linaro.org>
In-Reply-To: <9587baf4-2316-494d-fbd1-73a86e742741@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jul 2023 12:04:57 +0300
Message-ID: <CAA8EJpqTBpUgpQSwhhLtctn=r8XwX-NwdFgUst3rARQSaGMrcg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8450: provide MDSS cfg
 interconnect
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023 at 11:41, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 12.07.2023 14:11, Dmitry Baryshkov wrote:
> > Add support for the MDSS cfg-cpu bus vote on the SM8450 platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > index 595533aeafc4..0b01f3027ee3 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > @@ -13,6 +13,7 @@
> >  #include <dt-bindings/mailbox/qcom-ipcc.h>
> >  #include <dt-bindings/phy/phy-qcom-qmp.h>
> >  #include <dt-bindings/power/qcom-rpmpd.h>
> > +#include <dt-bindings/interconnect/qcom,icc.h>
> >  #include <dt-bindings/interconnect/qcom,sm8450.h>
> >  #include <dt-bindings/soc/qcom,gpr.h>
> >  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > @@ -2672,8 +2673,12 @@ mdss: display-subsystem@ae00000 {
> >
> >                       /* same path used twice */
> >                       interconnects = <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
> > -                                     <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>;
> > -                     interconnect-names = "mdp0-mem", "mdp1-mem";
> > +                                     <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
> > +                                     <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > +                                      &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> Looking at icc_set_tag occurences in msm-5.10/techpack/display,
> I *think* active-only is only possible for the data bus (MDP-EBI)

Here I followed the vendor mdss fbdev driver (mdss_mdp.c), which
explicitly states:

static struct msm_bus_scale_pdata mdp_reg_bus_scale_table = {
        .usecase = mdp_reg_bus_usecases,
        .num_usecases = ARRAY_SIZE(mdp_reg_bus_usecases),
        .name = "mdss_reg",
        .active_only = true,
};

>
> Moreover, I think Linux is supposed to cast MDSS votes through the
> APPS RSC (so, nodes without _DISP [1][2]) and conversely, DISP_RSC is
> supposed to active-only votes

We can change this once your DISP_RSC lands. Anyway, I think we will
have to add the LLCC-MEM vote at some point later.

>
> Konrad
>
> [1] not that it matters today because it's not implemented yet
> [2] https://lore.kernel.org/linux-arm-msm/20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org
>
> > +                     interconnect-names = "mdp0-mem",
> > +                                          "mdp1-mem",
> > +                                          "cpu-cfg";
> >
> >                       resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> >



-- 
With best wishes
Dmitry
