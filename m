Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7D651003
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0E710E2B5;
	Mon, 19 Dec 2022 16:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CC410E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 16:12:03 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-14449b7814bso12091424fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=opNyEy4Hga2S+HSZGwYoo4n70oAUrhY/I95QJwBLXGw=;
 b=GLXF0a9hN4NDrxSiyquzet3CYHgBek4M8xB9NgCoRur+3SiWUQ7U0TpQ80vS2Ey3yF
 7Z9I/KAw6ATX613YDJ3PomP8p4XMs41nnalAMwU6+QkQFUhMm8vvsM/K4MpnHj4V1b0x
 +YaWd5cjgjBFDIyenlffSYdjzvSma6xkeJIJvjxWrd9sI8mBIlSsddTfnkbhYVUCIDzB
 Lw7vc0hRHHp2zRSkxqQG/nmlTh1KEbHJdzruUiUK2ggEdHmzJdhNBQQ55yhkimSIbzcJ
 ORq78PFUdH2Oq9tfhYAjIghbEMkSxUcC+jVPPGxbu/HWGDnWbImG5UrI6v8+r37GhsdB
 tXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opNyEy4Hga2S+HSZGwYoo4n70oAUrhY/I95QJwBLXGw=;
 b=3EkPNMZyfhZemcFKtVaAzW1tltnxiKqIFAyuAQ5mV1sPt7oIWDF/73f867MLHXS69e
 C6p/9j5wS+o/txBSJumoJEya5PKuECwd8akh75mMIMYerWOrgX9VFwVlfuGdkqgsZw7u
 dz20QxPAWy44I7gS0K1uwlMb59YYHBsXrTtDeuq6NZLr3XrTwH2BlYXhAWLUefBxNgJM
 ibI/O5d3fqjI1zhtt+4QTXVf+NFhkGilKCFCkmemFqz6vBlv5ZS+7znmR8HBZYyfyDck
 dpUod9zHGj42jqjEt0dmEOLnwZAVZKifNM8fOe6Xu6G+Zt0JaYr0vcKQ2MO3cEp/5DNP
 ZoJw==
X-Gm-Message-State: AFqh2krWnSOz44mY+O4NAs33tYsg9C3hoBBiVrfNAASRsWEX1MJBkE4u
 jkoIMkHoALC5p64tmLbu56Ojq776ceRKIyqPvXBs0A==
X-Google-Smtp-Source: AA0mqf55kS80V69FV3FbQLl+xTi2OHqecJQT7VNkb/GHotEghsH04avx+8ln6J+VXS2w3SXe+3JAgEmw1jbdGZgvIyg=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr1717322oab.14.1671466323100; Mon, 19
 Dec 2022 08:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-11-robert.foss@linaro.org>
 <853d49f9-cd97-e8a0-53fd-9f673c2720a1@linaro.org>
In-Reply-To: <853d49f9-cd97-e8a0-53fd-9f673c2720a1@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 19 Dec 2022 17:11:52 +0100
Message-ID: <CAG3jFysRXykUgOqRiPVYSRtjQ5Rfj+DQQqPzhzA8j9B9LToj5g@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sm8350-hdk: Enable display &
 dsi nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 andersson@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Dec 2022 at 17:44, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 05/12/2022 18:37, Robert Foss wrote:
> > Enable the display subsystem and the dsi0 output for
> > the sm8350-hdk board.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index e6deb08c6da0..39462c659c58 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -213,10 +213,32 @@ &cdsp {
> >       firmware-name = "qcom/sm8350/cdsp.mbn";
> >   };
> >
> > +&dispcc {
> > +     status = "okay";
> > +};
> > +
> > +&dsi0 {
>
> Bjorn suggested using mdss_dsi0 / mdss_dsi0_phy labels for DSI host and
> PHY, as it allows us to group them nicely. WDYT?

Sounds quite reasonable, fixing it in dts/dtsi/binding.

>
> > +     vdda-supply = <&vreg_l6b_1p2>;
> > +     status = "okay";
> > +};
> > +
> > +&dsi0_phy  {
> > +     vdds-supply = <&vreg_l5b_0p88>;
> > +     status = "okay";
> > +};
> > +
> >   &gpi_dma1 {
> >       status = "okay";
> >   };
> >
> > +&mdss {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_mdp {
> > +     status = "okay";
> > +};
> > +
> >   &mpss {
> >       status = "okay";
> >       firmware-name = "qcom/sm8350/modem.mbn";
>
> --
> With best wishes
> Dmitry
>
