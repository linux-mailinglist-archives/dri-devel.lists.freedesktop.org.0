Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDBA3D8C51
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 12:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8335F6E873;
	Wed, 28 Jul 2021 10:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D291A6E873
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 10:56:56 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 k7-20020a4abd870000b029025e4d9b0a3dso559374oop.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HgnExBYa2gTaeibHXdJ8oTvUmAKuMsg/HHG0wab43Mk=;
 b=hz2dvuGMcdc7S1Jgpa1u7LCHEwNw/m+mz1IxUyytl/i4QaF8IIVT+5JRT6VusnIGnG
 RNhaQ16Te2OcFrCTYqODuKdjS1mpIoIqDrNhhkKItnCzoz8fd7a8M6TOPmPtLA14x/Wb
 bMr1Cc+lQBfOJ3hleR7q/HO8zVe1AzMbVWMlpYcO+1+ESF6f5zOzg+xrKkPZ4QvzNblo
 drDBNCUbQFipxo5m2w6C4JA/SkYmCMycW5kjf57N7fGpT88nvynfJQGZcVdSQWx/QRBk
 aOX9RITMhtrO1PT5NcmWZLQ5/iMUC8iT4oBeGJdrAD8nx521b6JczdEydfpccbDYroxn
 CXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HgnExBYa2gTaeibHXdJ8oTvUmAKuMsg/HHG0wab43Mk=;
 b=dEdsooeT08hVCzAkFEc9Y/vXmx2pjLUKZrFJ0YVgdbdT9TSd4egnmjHMgy6BIBluHx
 fmcnUlJnXbUBaxEfqdieAf+ADrSIhPTzz7rXBFjMK9Adt0CnWbuJ1pIeczl5Av+3YhrG
 jZLGbnL7ymvc2BsjQYqF/SH6dS5BBQ2YXFFWA3Nb+m9O2Qehw2197d84dsHk2XIJogBt
 siYqp9ejqp1p3b/QmL1cz1ouCtz0lhrAHWRUPMWriYv7UCzibFGNutKkgm0FRF0+OhW6
 SAZdotvKIW+3PbkyHN1vpuvrsw655o8D/PwhqAajhBre6YH/wBTPsxKxXcWoqrSipEIn
 sN7Q==
X-Gm-Message-State: AOAM53038/2RNt5dZMOybWlpjUKvfQAnK/qtUN+J8WMPOFGf1M5uyBnY
 O3qSNnbv322T/tM3eKi3A0zgV/s22sAiJLlZjzA=
X-Google-Smtp-Source: ABdhPJyjDPb/U0fmRePpkJIM3U2Qqs+/FvNE7XmK6KTJ7LldIdxDqogO2j4y8UqmvArdIw3Mfuz01aLSzShqYibdkOM=
X-Received: by 2002:a05:6820:444:: with SMTP id
 p4mr16687743oou.75.1627469816164; 
 Wed, 28 Jul 2021 03:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
 <20210722092624.14401-2-jason-jh.lin@mediatek.com>
 <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
 <4c0fe16988c559a5a4b1ce714eeaa31f4628f68f.camel@mediatek.com>
 <CAFqH_512RCNBufS=zL5hQSQJya3565dm2D3zznWie9rKUN_sAw@mail.gmail.com>
 <a0e5322bdde4d1b51de57cbfe98e9d9ed64490ed.camel@mediatek.com>
In-Reply-To: <a0e5322bdde4d1b51de57cbfe98e9d9ed64490ed.camel@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 28 Jul 2021 12:56:44 +0200
Message-ID: <CAFqH_51_Ns-ZLqwaj+_8P_49rGse0h9GTu4Jk6R+0FVO8Rq1pw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>, devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

Missatge de Jason-JH Lin <jason-jh.lin@mediatek.com> del dia dt., 27
de jul. 2021 a les 4:53:
>
> Hi Enric,
>
> On Mon, 2021-07-26 at 12:08 +0200, Enric Balletbo Serra wrote:
> > Hi Jason,
> >
> > Missatge de Jason-JH Lin <jason-jh.lin@mediatek.com> del dia dl., 26
> > de jul. 2021 a les 9:02:
> > >
> > > On Fri, 2021-07-23 at 13:13 +0200, Enric Balletbo Serra wrote:
> > > > Hi Jason,
> > > >
> > > > Thank you for your patch.
> > > >
> > > > Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj.,
> > > > 22
> > > > de jul. 2021 a les 11:26:
> > > > >
> > > > > There are 2 display hardware path in mt8195, namely vdosys0 and
> > > > > vdosys1, so add their definition in mtk-mmsys documentation.
> > > > >
> > > >
> > > > Just having 2 display hardware paths is not a reason to have two
> > > > compatibles, isn't the IP block the same? Why do you need to
> > > > introduce
> > > > the two compatibles?
> > > >
> > > > Thanks,
> > > >   Enric
> > > >
> > >
> > > Hi Enric,
> > >
> > > Thanks for reviewing my patch.
> > >
> > > The reason for using two compatibles is that vdosys0 and vdosys1
> > > are
> > > different IP blocks.
> > >
> >
> > With that there are different IP blocks, what do you mean? Do you
> > mean
> > that there are two completely different blocks with completely
> > different functionalities?
> >
> > Or that there is the same IP block twice? I mean, of course, the
> > registers are different but has exactly the same functionality.
> >
>
> They are not the same IP block twice.
> Although both vdosys0 and vdosys1 will probe meiatek-drm driver, but
> the components on their hardware path are different and their output
> panel are also different.
>
> > > Because mmsys provides clock control, other display function blocks
> > > may
> > > use them as clock provider.
> > >
> > > E.g.
> > > 1. mmsys with compatible="mediatek,mt8195-vdosys0"
> > > [v4,1/6] arm64: dts: mt8195: add display node for vdosys0
> > >
> > >
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-2-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!xHjKwv34W7ETFcmQPXRViylF2LbV7C7pE8OeJeNvA93jDdzr_ZBRRm8aIUCvAHSD_qGo$
> > >
> > >
> > > ovl0: disp_ovl@1c000000 {
> > >         ...
> > >         clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
> > >         ...
> > > };
> > >
> > > 2. mmsys with compatible="mediatek,mt8195-vdosys1"
> > > [v2,06/14] arm64: dts: mt8195: add display node for vdosys1
> > >
> > >
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-7-nancy.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!xHjKwv34W7ETFcmQPXRViylF2LbV7C7pE8OeJeNvA93jDdzr_ZBRRm8aIUCvAP0FOfkc$
> > >
> > >
> > > vdo1_rdma0: vdo1_rdma@1c104000 {
> > >         ...
> > >         clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> > >         ...
> > > };
> > >
> >
> > Note that I am talking without knowing the hardware in detail, but I
> > am wondering why I can't have something like this, where every mmsys
> > is a clock and reset controller provider.
> >
> > vdosys0: syscon@14000000 {
> >           compatible = "mediatek,mt8195-mmsys", "syscon";
> >           reg = <0 0x14000000 0 0x1000>;
> >           #clock-cells = <1>;
> >           #reset-cells = <1>;
> > };
> >
> > vdosys1: syscon@15000000 {
> >           compatible = "mediatek,mt8195-mmsys", "syscon";
> >           reg = <0 0x15000000 0 0x1000>;
> >           #clock-cells = <1>;
> >           #reset-cells = <1>;
> > };
> >
> > ovl0: disp_ovl@1c000000 {
> >         ...
> >        clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
> >         ...
> > };
> >
> > vdo1_rdma0: vdo1_rdma@1c104000 {
> >         ...
> >         clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> >         ...
> > };
> >
> > What are the differences between vdosys0 and vdosys1 from a hardware
> > point of view?
> >
> > Cheers,
> >   Enric
> >
> > > Regards,
> > > Jason-JH.Lin
> > >
>
> From a hardware point of view, the components and the ouptut panel of
> vdosys0 and vdosys1:
> 1. The components on meiatek-drm of vdosys0 are OVL0, RDMA0, COLOR0,
> CCORR, AAL0, GAMMA, DITHER, DSC0, MERGE0, DP_INTF0 and its output panel
> is eDP.
>
> 2. The components on meiatek-drm of vdosys1 are PSEUDO_OVL, MERGE5,
> DP_INTF1 and its ouptut panel is DP.
>
>
> The resaon for using two compatibales is that we use different driver
> data in mtk-mmsys.c and mtk_drm_drv.c to identify the corresponding
> mmsys is vdosys0 or vdosys1.
>

So IIUC the two mmsys block ares basically the same, they provide the
same, a reset controller, a clock controller and being able to write
to the routing registers, and what you only need to identify is which
one is is vdosys0 and which one is vdosys1 to apply different routing
tables? Can these routing tables change at runtime? Or are they
hardware fixed?

Regards,
 Enric

> Their driver data in mtk_drm_drv.c is defined here:
> [v4,4/6] drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-5-jason-jh.lin@mediatek.com/
> [v2,14/14] drm/mediatek: add mediatek-drm of vdosys1 support for MT8195
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-15-nancy.lin@mediatek.com/
>
> I think using the same compatible is unable to do this. Or do you have
> other suggestions to do this with the same compatibe?
>
> Regards,
> Jason-JH.Lin
>
> > > > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > > > ---
> > > > > this patch is base on [1][2]
> > > > >
> > > > > [1] dt-bindings: arm: mediatek: mmsys: convert to YAML format
> > > > > -
> > > > >
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/__;!!CTRNKA9wMg0ARbw!ycgPEK4yBDojiiZJC2E9mGwvxJbaLqhyUxzJIq0ckEP-JVteBcjFdc6ixkNbmknH8f2P$
> > > > >
> > > > > [2] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC binding
> > > > > -
> > > > >
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-2-fparent@baylibre.com/__;!!CTRNKA9wMg0ARbw!ycgPEK4yBDojiiZJC2E9mGwvxJbaLqhyUxzJIq0ckEP-JVteBcjFdc6ixkNbmju2GBrD$
> > > > >
> > > > > ---
> > > > >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> > > > >   |
> > > > > 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > > .yam
> > > > > l
> > > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > > .yam
> > > > > l
> > > > > index 2d4ff0ce387b..0789a9614f12 100644
> > > > > ---
> > > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > > .yam
> > > > > l
> > > > > +++
> > > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > > .yam
> > > > > l
> > > > > @@ -30,6 +30,8 @@ properties:
> > > > >                - mediatek,mt8173-mmsys
> > > > >                - mediatek,mt8183-mmsys
> > > > >                - mediatek,mt8365-mmsys
> > > > > +              - mediatek,mt8195-vdosys0
> > > > > +              - mediatek,mt8195-vdosys1
> > > > >            - const: syscon
> > > > >        - items:
> > > > >            - const: mediatek,mt7623-mmsys
> > > > > --
> > > > > 2.18.0
> > > > >
> > >
> > > --
> --
> Jason-JH Lin <jason-jh.lin@mediatek.com>
