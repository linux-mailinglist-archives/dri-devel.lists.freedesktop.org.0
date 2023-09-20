Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1BE7A740D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 09:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F7710E161;
	Wed, 20 Sep 2023 07:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C463A10E162
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:28:02 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-59c2ca01f27so41617587b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695194882; x=1695799682; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gwW/aKgkBI8jvoRbmdXukbiIBoNPv5CCX3I1vI78hY0=;
 b=whfn6B49YV+aXQ0xP/vIm8YzUst5z/UBqttdmpQEBPBN7F+G60c1MHfm7J88qIsZGX
 MSAiizcySFkjTJgXh/2ltoAOSqHUVL4k/RGrfkvbptFXppmjT3MEvbyYy2a7FxwScRlw
 nPkmaMyX/f3VaIXSl+fGun8JPt6DrQrF4wh3ZlW4tihnZHCmQx4PCATy4UGgTixc6P8Q
 HJYmuT2/2HjStQUE5A5BWYr25RWY0gMEBzYoH6TAayykC2NLKcjR2nTIRJ38Fqotu4EQ
 Uw37ylIymbkaSpXjPLyKYDrdsVuK/GzzFX2BBTxEBr8I5c0xDYeUew9Fjt/BaXO7kekT
 G64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695194882; x=1695799682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwW/aKgkBI8jvoRbmdXukbiIBoNPv5CCX3I1vI78hY0=;
 b=VWCl9ABZF6QJ/rKqk92bqLc1cAKVvlFHa6zZgdlP8rjgCjs30wikzk3WRYhgI0ILoj
 MXwFx2XILyKnvuNaDt1iZruUBnH+d5NHF6ZHnCKb41p+Sfn67hR2k9MqMkdRbDNXlRnA
 RADYnCogJPp6loo/z0KWbu3/9pOi2uG+RlKpW0wB7ggZqqxb8VGIb3f9AVqqcWQIVBxe
 MkGaUTsVr4huz5trEuK7IUAromyUxZxWbB42o+mqhQWWdVHGGU4qUJz+FDhdGYeGx320
 lZZqHdX8FpW98HvBeEjSWemhqtfC1FsQjjW/xw7tZtHAY4aDLaaPmXu1ZPuT15mVAkE8
 jDiQ==
X-Gm-Message-State: AOJu0YxzVBPjP8VStHlRNlDQldV/g/Sp/HC8ArwTO/Mk4iF804o1Yc6G
 wNpaqn30nqCmDv+zWd/ACQV2vIJV0h5/Edoo8UclNg==
X-Google-Smtp-Source: AGHT+IFcGwxsD14iTBsfb5A6WM9HKpgER1VektslYkA2MPFERnEZVoaEsnHQM17447rTKPxBIUUzlSQbAxSsLf5oFEA=
X-Received: by 2002:a81:9e10:0:b0:579:effb:ae1c with SMTP id
 m16-20020a819e10000000b00579effbae1cmr1828509ywj.26.1695194881940; Wed, 20
 Sep 2023 00:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-2-dmitry.baryshkov@linaro.org>
 <4eaekxgmikdacvvprysb6btdqootbc6paomzhuqjtzd6rgqxkc@birohtqp4rbo>
In-Reply-To: <4eaekxgmikdacvvprysb6btdqootbc6paomzhuqjtzd6rgqxkc@birohtqp4rbo>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Sep 2023 10:27:50 +0300
Message-ID: <CAA8EJpozPp2-oqr2mWAuA_8mTSc8whnOAg+zYZSWNmQBg_eLxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm8250: Add DisplayPort device
 node
To: Bjorn Andersson <andersson@kernel.org>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sept 2023 at 05:08, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Aug 17, 2023 at 05:59:37PM +0300, Dmitry Baryshkov wrote:
> > Declare the displayport controller present on the Qualcomm SM8250 SoC.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 89 ++++++++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index eb00bbd3e1f3..8d705a1713fb 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -3638,6 +3638,8 @@ port@1 {
> >
> >                               port@2 {
> >                                       reg = <2>;
> > +
> > +                                     usb_1_qmpphy_dp_in: endpoint {};
> >                               };
> >                       };
> >               };
> > @@ -4405,6 +4407,14 @@ dpu_intf2_out: endpoint {
> >                                                       remote-endpoint = <&mdss_dsi1_in>;
> >                                               };
> >                                       };
> > +
> > +                                     port@2 {
> > +                                             reg = <2>;
> > +
> > +                                             dpu_intf0_out: endpoint {
> > +                                                     remote-endpoint = <&mdss_dp_in>;
> > +                                             };
> > +                                     };
> >                               };
> >
> >                               mdp_opp_table: opp-table {
> > @@ -4432,6 +4442,85 @@ opp-460000000 {
> >                               };
> >                       };
> >
> > +                     mdss_dp: displayport-controller@ae90000 {
>
> displayport-controller does not seem to be a valid child node of the
> sm8250 mdss. Please make sure that the binding is updated, if not
> already done.

True. I added the compatibility string to dp-controller.yaml, but
missed the mdss schema. I'll send a fix ASAP.

>
> Thanks,
> Bjorn



-- 
With best wishes
Dmitry
