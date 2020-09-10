Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601852654C4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 00:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C856E24B;
	Thu, 10 Sep 2020 22:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294C96E249;
 Thu, 10 Sep 2020 22:03:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k18so2308844wmj.5;
 Thu, 10 Sep 2020 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XwFesGR4NbCLq0zixfOqhv5ARStJ9CjQZ3o4UAP9K2k=;
 b=Ryg27q/gAZXbg6huhbkDvo7fSvYgt+GSFoQpCeq1JnM98lYeNn1mU0FPPQjx8+zCR7
 HO7cWjwGxLY+h/9hS+8lXwfAdzU25b/SOByjCW516cHROFpUlc4E84piriVXDA48SJ/M
 /AAdslZCcSarc31hmEtZQSGY8Q4GXkfi1BfK/281hA6gGFH62+hTlrfivfTpcxXfECkf
 b6MATUAd7FQDf1Fer5hJHd61DSrCV/PjwZVnBYKKUMSGFBT0prFUD2qcQ0Lupkp1ye7H
 uJOdx9f4noBxv6I1KggJpV17U/pj6gg3zA/oppkQKW1iCBL5V1OelDW1gvcGqFZhjCqW
 SFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XwFesGR4NbCLq0zixfOqhv5ARStJ9CjQZ3o4UAP9K2k=;
 b=U5P8isAuN+K31x2LsVCPc3exTYaYOu9G8qC8YCUObiNS+UjtGE+C6vphhaNTnvlhBE
 FhwvDTTnYHEv/ri7/S2pHfV2a4NW5Jh5fPdI08ApJ4oAc1X+hVgcdmPGGWjk/2mMUm0y
 vkBxqW8xO1SOYoSxhS1NK1GzLqFiTle2NuIQnCnyzd+GQ92PcadYmIsSfcXUMbawxfkh
 IRyqIvH1Cq7k739NGJO1iQTK88ne72k3NwI+LFTk6yOBh8ImBd92VGSCzwqxzFBi3NEy
 krixUqJtgjLLq3VCaxbF+Fb/ERRiw1dmverh+7GHOW5hlLX1YWKrY6aEa4GOgnviTEbz
 zOZQ==
X-Gm-Message-State: AOAM531sdxhD0hHyFS9uWlo2b5lTeN1blrx70GbKJFiEXp1LSqEnafaW
 PaMCg+n6KVgv/3g4vzpgZrVKmQBALZ7LtWw44W8=
X-Google-Smtp-Source: ABdhPJzKmH/rmiHX/MqNIlb9eckwnYeH5cxMnEa8h0PE/vcCG2cB5ok8HqYzXdjuavUOrjkKgumjScxKYz3UVx9VSr4=
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr2030447wmg.164.1599775431560; 
 Thu, 10 Sep 2020 15:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
 <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
 <20200910220037.GA472@uller>
In-Reply-To: <20200910220037.GA472@uller>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Sep 2020 15:04:47 -0700
Message-ID: <CAF6AEGvriNYkeaBVmK2mEG1OVojun2nQ7c2X6BuE-E-B4DRujA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: sc7180: add bus clock to mdp node for
 sc7180 target
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 3:00 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 16 Jul 11:35 UTC 2020, Kalyan Thota wrote:
>
> > From: Krishna Manikandan <mkrishn@codeaurora.org>
> >
> > Move the bus clock to mdp device node,in order
> > to facilitate bus band width scaling on sc7180
> > target.
> >
> > The parent device MDSS will not vote for bus bw,
> > instead the vote will be triggered by mdp device
> > node. Since a minimum vote is required to turn
> > on bus clock, move the clock node to mdp device
> > from where the votes are requested.
> >
> > This patch has dependency on the below series
> > https://patchwork.kernel.org/patch/11468783/
> >
>
> Isn't this dependency on an old revision of patch 3/3 in this series?
>
> Regardless, I don't see either the linked patch or patch 3 merged in
> linux-next, so I presume I should not merge this?

I guess that would be "drm/msm/dpu: add support for clk and bw scaling
for display" on msm-next-staging[1] (about to be msm-next)

[1] https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-staging


> Regards,
> Bjorn
>
> > Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 4f2c0d1..31fed6d 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -1510,10 +1510,9 @@
> >                       power-domains = <&dispcc MDSS_GDSC>;
> >
> >                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> > -                              <&gcc GCC_DISP_HF_AXI_CLK>,
> >                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > -                     clock-names = "iface", "bus", "ahb", "core";
> > +                     clock-names = "iface", "ahb", "core";
> >
> >                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> >                       assigned-clock-rates = <300000000>;
> > @@ -1539,12 +1538,13 @@
> >                                     <0 0x0aeb0000 0 0x2008>;
> >                               reg-names = "mdp", "vbif";
> >
> > -                             clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >                                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> >                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> >                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > -                             clock-names = "iface", "rot", "lut", "core",
> > +                             clock-names = "bus", "iface", "rot", "lut", "core",
> >                                             "vsync";
> >                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > --
> > 1.9.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
