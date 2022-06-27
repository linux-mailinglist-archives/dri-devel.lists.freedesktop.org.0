Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9882255BB5F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981C111A418;
	Mon, 27 Jun 2022 17:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F89111A3EE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 17:51:37 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id u124so7355604qkb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2l/JZxFBA6ruYVDfbOKe6Nh7SNRkHtjSUP/JeJUMaQk=;
 b=PmprGVvlBwrXtl5CKj51xhYdOTYCBWGz/xtgCcNoy+otrCDCKJZrLkuticFOK1pFEW
 rfZxv1+nKiFWfMkou+SyT5E9Kn5YQaOXCzUKyX0M+ieyUM26jABqmdCXyfd3TBDeY4r/
 tBUpEf8G4jAOjFnxrJa9hbPdfEfO5Wj22TyBl5/+/zRtkz5kEBf0gfh75JJfVhqXvbDd
 tOpJhytuvaU4HNoc+8sZBROTz2Q12nGKrs0CZlGDTZbi4SGjPROkVXv+WzVicjQ/XIGH
 C61kG89nXpVPaQUqwtDcsS06FPU3cjS/mqhvXCsPJZMGr3Af5LpoIbthjqa2eFSDsyPe
 bvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2l/JZxFBA6ruYVDfbOKe6Nh7SNRkHtjSUP/JeJUMaQk=;
 b=R0bVgus4MzDonsag4wexfoJM7bFktcwb63lcVdTlbJmqBZNOvCq1oZ2CRkvVFoieZR
 ZdKd55zsHg3UhfWYmFAnQK2aRPpG5P6gGSIREhGa460/fHUzovNP5IYNnKNoaxbbL4yZ
 NrIxCOtvcrhBO6mO1ReG43Cn3brz5zWB/VDF7RTGWd8TOTA4SzBU0IVvfbM64xGq8SPd
 z5RnEFT8ZfhLHewoiA+legFXpGngm8B21YnZp+yWlM2k9qM+jv+nKLFT3HwJSasPA6qh
 JGC2QzqBoDvHtkDZi3Y3tfBsEoWildwEgJgaY1kVFryciL9m2XQvDdUaGUgeXSgLBydk
 sPeA==
X-Gm-Message-State: AJIora9IlwxtLM3ZDFZQA4/BVqRaIFmvcaUBvoEWKBV7/ND8EAQIpuB3
 1NTQcfyWHM8bkJbKkElCYeXH8YMHIVTHQjpvTJQ2ug==
X-Google-Smtp-Source: AGRyM1stDXuv0fuJqFJ3eHrWX+eMJJ+43GZhpt0Aw+nmja1w31Js3JeXZTCdTQiRB+ipLhmvVXZlGvQTjEo6gNQ98BU=
X-Received: by 2002:a05:620a:31aa:b0:6af:24d1:507 with SMTP id
 bi42-20020a05620a31aa00b006af24d10507mr4317527qkb.203.1656352296597; Mon, 27
 Jun 2022 10:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
 <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
 <20220627171756.GA2610798-robh@kernel.org>
In-Reply-To: <20220627171756.GA2610798-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Jun 2022 20:51:25 +0300
Message-ID: <CAA8EJpqUraiE3f23URKFnSXTfBO+E4DtcRS+HuHDrsSDN58iiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add
 clock-cells and XO clock
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jun 2022 at 20:17, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jun 20, 2022 at 04:02:58AM +0300, Dmitry Baryshkov wrote:
> > As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> > property. For the compatibility with older DTs the property is not
> > marked as required. Also add the XO clock to the list of the clocks used
> > by the driver.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
>
> Doesn't apply, so no checks ran.

Dependencies: https://patchwork.freedesktop.org/series/105285/. I'll
include this in v3.

>
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> > index eea2e02678ed..41e6492d4a0f 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> > @@ -28,12 +28,14 @@ properties:
> >        - const: hdmi_phy
> >
> >    clocks:
> > -    maxItems: 2
> > +    minItems: 2
> > +    maxItems: 3
> >
> >    clock-names:
> >      items:
> >        - const: iface
> >        - const: ref
> > +      - const: xo
>
> minItems: 2

Ack

>
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -44,6 +46,9 @@ properties:
> >    vddio-supply:
> >      description: phandle to VDD I/O supply regulator
> >
> > +  '#clock-cells':
> > +    const: 0
> > +
> >    '#phy-cells':
> >      const: 0
> >
> > @@ -75,9 +80,12 @@ examples:
> >                    "hdmi_phy";
> >
> >        clocks = <&mmcc 116>,
> > -               <&gcc 214>;
> > +               <&gcc 214>,
> > +               <&xo_board>;
> >        clock-names = "iface",
> > -                    "ref";
> > +                    "ref",
> > +                    "xo";
> > +      #clock-cells = <0>;
> >        #phy-cells = <0>;
> >
> >        vddio-supply = <&vreg_l12a_1p8>;
> > --
> > 2.35.1
> >
> >



-- 
With best wishes
Dmitry
