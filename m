Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E44396711
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 19:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725DC6E1A3;
	Mon, 31 May 2021 17:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0CB6E881
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 17:29:08 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id m6so2736296qvg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tlJYeynpem95GlivsS9mo23qyjeyOx4+nRXtzT2rN2Y=;
 b=s4wv2tTLDH82DV92z8R2Bl5VwluiOFIRuiYrCkvxLA5NZbIu6SzQp8EzJPnhAVBcW8
 74stT22ivUiSh1SEOB6XAQKYrQGdzXAqXZ3w73PRMb0D6mSb0BsCI0E0xr1c8KSdQZdg
 qpRfoJjsHc8vmpHrYX4q+e9G/Bx5pUBme2uvW41asTo04qmHGlm1hHxC8Maqkds/r3C0
 xdOGL0dh6BWyoBtiYWjMACnbY2ndmUIERFspcrsfWhznkukwAJZaqn0BYKeGqpuDy9rG
 cdU/1i5wSKeT3ogiMo2M3Jmf3oeq4vcn9cJzfifEPtiKq7WLgqxBdK8EC8RQgQEyLgv6
 8qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tlJYeynpem95GlivsS9mo23qyjeyOx4+nRXtzT2rN2Y=;
 b=iNN+xBwhFx9/Qy2ND7jgLvlad2KuxSOTZr90Ga7O7sMhNXh2RBkK+MbCqvsynHCgZS
 1GxF15aVJH3eNOL7GFyjIbEQLTjIVTXj6DhMqHvSTX/NSC7+q6uzijkv8AURjbfGVvia
 Ojuse9uDykITkpnJQJCmSB0l/cOoKakwYCLHxZFPnhlwkBJ2PnfPvi8zpV03BcDDShEA
 WhTh0xzepThv3hkQRzxK7+bRTCcG6Zd+ZXRpbU0Tvk3qDQhHN0yTC1I1rjCQdLuJJ+Rf
 NbqQDn1AlqK2ZtiqqeVjj0Em+N+2T4IMJcP2WIERU1ZuO6ED8HpXHJNR6Wo2+lQeJJnB
 WZyg==
X-Gm-Message-State: AOAM533l567/HN+8G4YteM3LEkdz0mZmanDF+wcn0JZinbFRGFItFMW9
 mjRa0Qsrpj4MkY/ieFnoreIp73EXnJhP9gkXLavRHw==
X-Google-Smtp-Source: ABdhPJww25osANxF+wuj9r9EKSJM610gXxVGDaByN1ywimNNxznUIv9NYrcRVbPYupEHXG79B8VOcPxJeDHndpzElyU=
X-Received: by 2002:ad4:450f:: with SMTP id k15mr18267932qvu.4.1622482147698; 
 Mon, 31 May 2021 10:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
 <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
 <YLT5gGKP3lUkpmG8@builder.lan>
In-Reply-To: <YLT5gGKP3lUkpmG8@builder.lan>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 31 May 2021 20:28:56 +0300
Message-ID: <CAA8EJpqeaLdqT6OpGN7hceL09nLVa9AaUSOu46_g-Cyq6g_RkA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: sm8250: move bus clock to mdp node for
 sm8250 target
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 May 2021 at 17:58, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 07 Apr 10:01 CDT 2021, Dmitry Baryshkov wrote:
>
> > Move the bus clock to mdp device node,in order to facilitate bus band
> > width scaling on sm8250 target.
> >
> > The parent device MDSS will not vote for bus bw, instead the vote will
> > be triggered by mdp device node. Since a minimum vote is required to
> > turn on bus clock, move the clock node to mdp device from where the
> > votes are requested.
> >
>
> This commit message makes sense for the other commit, where you move the
> "bus" into the mdp. Do you mind me changing this to:
>
> The bus clock is voted by the DPU, so remove it from the MDSS node.

I don't mind, please update the commit message as you see fit.

>
> Regards,
> Bjorn
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 394973e778f7..60fe2eaf06c5 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -2294,10 +2294,9 @@ mdss: mdss@ae00000 {
> >                       power-domains = <&dispcc MDSS_GDSC>;
> >
> >                       clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > -                              <&gcc GCC_DISP_HF_AXI_CLK>,
> >                                <&gcc GCC_DISP_SF_AXI_CLK>,
> >                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > -                     clock-names = "iface", "bus", "nrt_bus", "core";
> > +                     clock-names = "iface", "nrt_bus", "core";
> >
> >                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> >                       assigned-clock-rates = <460000000>;
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
