Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8492B7B6672
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 12:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5925010E09F;
	Tue,  3 Oct 2023 10:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367510E0A3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 10:31:53 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-59f6e6b7600so8491877b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696329113; x=1696933913; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/lF9B+2dpTS8/Po6eS2skpxFPjbGsje6xB3H5xe9qeo=;
 b=Az9bL/AENsCsdpi7Pn6LuC/Z9X3qKwZSWtq+KgAkDSVlRjp73T+UtI6yMFQjMTPB0w
 cD67E5ELBLiITAuT2/u5RyjZlusQBnnwkgbB68KNLdth+5TquXPIWQeNZRM6p9+v+3Ce
 xJ3pz5IULm/1aY35AxQxu9yfMSsxpqPrymF9EUIu9nQuxIzoC6Pk6q2BKTOqowvSvIAE
 MSqK+PLZk9rplSwiQIsKGitbklQYlRf/5RWdq7ahvTJysGcZa2hm3wxlxHIbvRJzGQXS
 2+x8p/aeFajgWyfcd1hAdFzRdMJ0yTLimKHPP3f9ps/pM1hVIj4gT1RvUB689s5hZ1nQ
 LZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696329113; x=1696933913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/lF9B+2dpTS8/Po6eS2skpxFPjbGsje6xB3H5xe9qeo=;
 b=quVyCbDomprsvT8GbFB8R7luchSc+4dWVfxGgFpKeOWepHcBcooeIbLsvXze/McvL4
 LB+qmQSb+oVQGgsFxbkgXVhs+6oNfR06JRIAPdye7googv/Rnq9GRTMS/kcu/fePaGgZ
 jFVfAeRJePIug+iv9zFxWDPnnFR8PM8dC4+6MA6ySdiVVs3oyuj1YGExx7321HJh4qzr
 X+EkbDQYo95tizlEcc8MjTNtkSkExR+bP+VTnFzusthF+n1ivW2nrO3JATWPTEc2tEW4
 U4/PhDAvmLWrsvvT5OX1AUnrJVN4ExZ5+CqknVQ+pV44UIURp9UXAg4fpFLFVY+tTiQI
 bmOQ==
X-Gm-Message-State: AOJu0Yz33hKzfGJ5ZAoUssfQ6za0l3TK7ELIhuQagaCwD0fOztsKOPHf
 vH7Aqbp/Wk4hikoPBWCVVd2gH7071E5T77Vgcsh4Sw==
X-Google-Smtp-Source: AGHT+IFElae2Chizu09rbxtsGekkDJqYVsUMzlbpa3Ag9xBlODTikxqoTX1U/6YW+bG8ZRBAEjRX06W8BzrJ3AzuxAs=
X-Received: by 2002:a81:8356:0:b0:59f:519e:3e7c with SMTP id
 t83-20020a818356000000b0059f519e3e7cmr14992115ywf.24.1696329112725; Tue, 03
 Oct 2023 03:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231003012119.857198-9-mailingradian@gmail.com>
 <20231003012119.857198-12-mailingradian@gmail.com>
 <fa926d91-f748-4886-ae6d-f55541e40f5c@linaro.org>
In-Reply-To: <fa926d91-f748-4886-ae6d-f55541e40f5c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Oct 2023 13:31:41 +0300
Message-ID: <CAA8EJpqPP=X8-jD_mwSmO8OMaxb_0Yo3j-b9chyChORDyvdWAQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: msm: Add SDM670 MDSS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Ryan McCann <quic_rmccann@quicinc.com>, dri-devel@lists.freedesktop.org,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Oct 2023 at 11:48, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/10/2023 03:21, Richard Acayan wrote:
> > Add documentation for the SDM670 display subsystem, adapted from the
> > SDM845 and SM6125 documentation.
> >
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  .../display/msm/qcom,sdm670-mdss.yaml         | 287 ++++++++++++++++++
> >  1 file changed, 287 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
> > new file mode 100644
> > index 000000000000..9995b018cd9e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
> > @@ -0,0 +1,287 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sdm670-mdss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SDM670 Display MDSS
> > +
> > +maintainers:
> > +  - Richard Acayan <mailingradian@gmail.com>
> > +
> > +description:
> > +  SDM670 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
> > +  like DPU display controller, DSI and DP interfaces etc.
> > +
> > +$ref: /schemas/display/msm/mdss-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sdm670-mdss
> > +
> > +  clocks:
> > +    items:
> > +      - description: Display AHB clock from gcc
> > +      - description: Display core clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: core
> > +
> > +  iommus:
> > +    maxItems: 2
> > +
> > +  interconnects:
> > +    maxItems: 2
> > +
> > +  interconnect-names:
> > +    maxItems: 2
> > +
> > +patternProperties:
> > +  "^display-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        const: qcom,sdm670-dpu
> > +
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        const: qcom,sdm670-dp
> > +
> > +  "^dsi@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          const: qcom,sdm670-dsi-ctrl
> > +
> > +  "^phy@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        const: qcom,dsi-phy-10nm
>
> This does not look right. Why the compatible is generic, not SoC-specific?

Because for 10nm DSI PHY we don't have SoC-specific compatibles other
than the ugly 8998 compat string.

>
> > +
> > +required:
> > +  - compatible
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> > +    #include <dt-bindings/clock/qcom,rpmh.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    display-subsystem@ae00000 {
> > +        compatible = "qcom,sdm670-mdss";
> > +        reg = <0x0ae00000 0x1000>;
> > +        reg-names = "mdss";
> > +        power-domains = <&dispcc MDSS_GDSC>;
> > +
> > +        clocks = <&gcc GCC_DISP_AHB_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > +        clock-names = "iface", "core";
> > +
> > +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <1>;
> > +
>
> Please add interconnects. They do not have to be 100% exact with DTS
> (unless interconnect header is not merged?). This is just an example.
>
> > +        iommus = <&apps_smmu 0x880 0x8>,
> > +                 <&apps_smmu 0xc80 0x8>;
>
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry
