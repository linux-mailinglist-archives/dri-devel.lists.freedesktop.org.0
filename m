Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A66FBB77
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 01:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B39510E00A;
	Mon,  8 May 2023 23:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9704910E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 23:38:38 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-b99f0a0052fso6984514276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683589117; x=1686181117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QpInRDjlrjefHENxTi6PbvAhSvnYLexmCSsadI4wFac=;
 b=UhVxZq3JzM7d0h6UsF+RUfthBDlTsYAYRKc19Vofl+wX5Njn6MVp4SjnFC6eufIxM9
 lMQH9GF6EaOpYigkrj8wAfHQ1sdfJ0/bOVwav+I2cAu21FWtU7XwXvWmtmeVJQq16SqH
 x+UWyg+Ciowb9rtWl8rvqs3Sd4RD8cUl3FilrOU6Vn2BtIEoOolHpTw8+GHNThL4pHNr
 mHBJrjoepFcnXb1rf990NpP3reF8hpi1mNJSiFh4m/rsgxToGpXnTrptnvZylwkk7mmQ
 qryfGTD8xO60N5C+DgixWDKZgEgUygMVM3OhfpvFa5d/2D5Hx0zt/9+B5Ml4fCU8CZ1c
 y1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683589117; x=1686181117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QpInRDjlrjefHENxTi6PbvAhSvnYLexmCSsadI4wFac=;
 b=ehbWQTPj62U92yNtwLohQv8aaYbZfgOp9G0PSZFy2EdzXKMlyUBVmB7SQb3LvDkjsy
 C4Janbb7LYWfSeZqUENbNZAqWzjmYmnWsWjFQKUVSTukn1HNQl4+WljJb/vQEY7ihmZk
 2282zz4yh0kOwFSYyqNT+ZUMkZA3f7RKz5ehW9Diawbcq/y1WSvaLci1pAyp1mcY7wxa
 MezzVkmci8nUwd4oHqP5Bv2vHPofUHFW2MV6hpvjHqDH68U1qpNdpqQO7S2MT0kfsxpJ
 I+FLVhAAkpGY/IMVPPS7hHN80kpcxKF1FxKreQWcOkuigr5pkCIwWwl7a4F5uukrz5LF
 yAlg==
X-Gm-Message-State: AC+VfDxQpx67bpufpv9ZaPo34mTS2LUOiY6HR/OuL5WMIDERk366zoCK
 aB8D/AxXRd2UYtOJba7yT3WniYMikICgE+xO6n7KYA==
X-Google-Smtp-Source: ACHHUZ5eZYukvdWK4iatmoaz2aBhr21Shnob76z8/ebYTm64+RgnU4RRvrniz9STAsrpyjIvDh9wvKuPnxXM4iBw06I=
X-Received: by 2002:a25:ab8e:0:b0:b80:8d4c:f427 with SMTP id
 v14-20020a25ab8e000000b00b808d4cf427mr13644085ybi.15.1683589117589; Mon, 08
 May 2023 16:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
 <a86cfa8b-c205-6887-a64e-d51241b74b15@linaro.org>
 <ca274ec9-81bf-c426-6ad6-93eb34b52b05@linaro.org>
 <11863653-84aa-8edf-676f-e55174fb4539@linaro.org>
 <7b90ed61-7789-275d-a743-6065ab6ecdbb@linaro.org>
 <c4775bde-9594-ab35-6765-5d2fe3e9f3b3@linaro.org>
In-Reply-To: <c4775bde-9594-ab35-6765-5d2fe3e9f3b3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 May 2023 02:38:26 +0300
Message-ID: <CAA8EJppAkE8cBPc2ij8ax6VhsHKOzg1jCs51mSz_+x16oW8Tzw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and
 MSS
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 May 2023 at 21:01, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 08/05/2023 13:49, Dmitry Baryshkov wrote:
> > On 08/05/2023 13:38, Konrad Dybcio wrote:
> >>
> >>
> >> On 8.05.2023 12:33, Dmitry Baryshkov wrote:
> >>> On 08/05/2023 11:33, Konrad Dybcio wrote:
> >>>>
> >>>>
> >>>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
> >>>>> Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
> >>>>> differs from the one defined in the msm8974, so it overriden locally.
> >>>>>
> >>>>> The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
> >>>>> similarity with other platforms). This requires a patch for remoteproc
> >>>>> to be applied [1].
> >>>>>
> >>>>> [1]
> >>>>> https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>    .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28
> >>>>> +++++++++++++++++++
> >>>>>    1 file changed, 28 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> >>>>> b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> >>>>> index 6b047c679370..c893afc00eb4 100644
> >>>>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> >>>>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> >>>>> @@ -4,6 +4,8 @@
> >>>>>    #include "qcom-pm8841.dtsi"
> >>>>>    #include "qcom-pm8941.dtsi"
> >>>>>    +/delete-node/ &mpss_region;
> >>>>> +
> >>>>>    / {
> >>>>>        model = "Qualcomm APQ8074 Dragonboard";
> >>>>>        compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
> >>>>> @@ -17,6 +19,13 @@ aliases {
> >>>>>        chosen {
> >>>>>            stdout-path = "serial0:115200n8";
> >>>>>        };
> >>>>> +
> >>>>> +    reserved-memory {
> >>>>> +        mpss_region: mpss@ac00000 {
> >>>>> +            reg = <0x0ac00000 0x2500000>;
> >>>>> +            no-map;
> >>>>> +        };
> >>>>> +    };
> >>>>>    };
> >>>>>      &blsp1_uart2 {
> >>>>> @@ -39,6 +48,25 @@ eeprom: eeprom@52 {
> >>>>>        };
> >>>>>    };
> >>>>>    +&remoteproc_adsp {
> >>>>> +    cx-supply = <&pm8841_s2>;
> >>>>> +
> >>>>> +    firmware-name = "qcom/apq8074/adsp.mbn";
> >>>>> +
> >>>>> +    status = "okay";
> >>>>> +};
> >>>>> +
> >>>>> +&remoteproc_mss {
> >>>>> +    cx-supply = <&pm8841_s2>;
> >>>>> +    mss-supply = <&pm8841_s3>;
> >>>>> +    mx-supply = <&pm8841_s1>;
> >>>>> +    pll-supply = <&pm8941_l12>;
> >>>> High time to move this to rpmpd!
> >>>> I won't object to adding this though, as it obviously works
> >>>> and is already used on other boards..
> >>>
> >>> I think the problem is that they are not level-voted on this
> >>> platform, so they are regulators, not PDs.
> >> They're corner-voted.
> >
> > Hmm. Indeed. In msm8974-regulators I see both voltage and corner entries
> > for these regulators.
>
> Checked. Only CX and GFX (yes, MX not included) are enabled as corners
> in vendor dtsi. So this probably doesn't gain us a lot.

I did a check. Implementing CX as a powerdomain here makes things
worse for now. We should first teach mss/pas/etc drivers to properly
handle the case when there is a single power-domain, which should be
unbound after staring the DSP Consider e.g. ADSP and CDSP on sm8150 or
CDSP on sm8250. But that's definitely a topic for a different patch
series. After that we can consider landing msm8974_genpd.

>
> >
> >>
> >> Konrad
> >>>
> >>>>
> >>>>> +
> >>>>> +    firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
> >>>> Could you please keep it one entry per line?
> >>>
> >>> Sure.
> >>>
> >>>>
> >>>> Otherwise,
> >>>>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>>
> >>>> Konrad
> >>>>> +
> >>>>> +    status = "okay";
> >>>>> +};
> >>>>> +
> >>>>>    &rpm_requests {
> >>>>>        regulators-0 {
> >>>>>            compatible = "qcom,rpm-pm8841-regulators";
> >>>
> >
>
> --
> With best wishes
> Dmitry
>


-- 
With best wishes
Dmitry
