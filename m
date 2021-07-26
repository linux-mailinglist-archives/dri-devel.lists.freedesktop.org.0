Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD363D5715
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F74B6E942;
	Mon, 26 Jul 2021 10:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6276E942
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 10:08:41 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so9462476oth.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1W8BM33E8I7Rg6qQkHpIq24nb3jtDXTVrJEtrhyQpY=;
 b=mhxSo+BtVhr0w+J9JSXO8eV4u/xQHPXbnkT1CJPffjjbaxEUzQHPRFm9j8Er6+4DyB
 7jFZhKMOOZ/9DEfrCUmxS3cO4159fI3JHkWf+itkWMBYAXmhPG4T6qO0/hJM/ecd6KRM
 +fBwalsP8KMrcDjZPg/r1d9qdCagN6ec2r9TQgaWMnpldEetamoI1WIPPPrwyFzhGQcR
 Jh/3NOTVKIMMWCUYMXSZHv8rD0/eOWpgxdbYDnwJNUITjcPzQHNjZaNc6zmZstvviRjl
 PbVDcIszcZEdawhBkh2zIjxEd2nqOiuIIUkx1TpoU8MGw265fNFfAYcCZ1x97CLBxr+T
 BeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1W8BM33E8I7Rg6qQkHpIq24nb3jtDXTVrJEtrhyQpY=;
 b=gOhI3XpIVQeoHIv7xCpbttCq9bYTYAqZ3I5NGVKP/KbxyTWAqb5b3rgn9X/4LrEWPB
 pcAypE8Bzs0QL8z6NWqmq7viJm4c90RD7e8Z1fsA/xm+CtGBTvzBNMo7KzZi+bv/0wu2
 Asu0068YqDWP3s1YuDJdwKu58/Iuju2VUj21S1LsGTdYcT/fqZxSaEDWagfS0ELY2v4U
 0veR6Oz9l3BuHK+AU9KJxglD6Fhgab8yS4ZU2TmMUXxGQyfgH/HoSFJ161DV2y35UshV
 PJ6A2NdJ7dfTrZlv8A9LtdzWDB4m+3qcnKympw4vfxatruXed8vnaV4dVwAxF8KSEctR
 J4aw==
X-Gm-Message-State: AOAM533rAJo6nkfoRODUy12daoeJu1QgPg7uPbeCsZNTuA7+Zf8Cs+0l
 SMwL66AO7/XSnZYpukJcYZeT4M/pgvrY+3nAW44=
X-Google-Smtp-Source: ABdhPJwcFKNYI6+KwnCa9bmjN5KGLG4/G0IOcDqm6ZBsn9Z8heUe+7xQBKSswL+u6yHDGeIWzLR0FC8ZXJ5dmHqbbiY=
X-Received: by 2002:a9d:6490:: with SMTP id g16mr1584823otl.184.1627294120561; 
 Mon, 26 Jul 2021 03:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
 <20210722092624.14401-2-jason-jh.lin@mediatek.com>
 <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
 <4c0fe16988c559a5a4b1ce714eeaa31f4628f68f.camel@mediatek.com>
In-Reply-To: <4c0fe16988c559a5a4b1ce714eeaa31f4628f68f.camel@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 26 Jul 2021 12:08:28 +0200
Message-ID: <CAFqH_512RCNBufS=zL5hQSQJya3565dm2D3zznWie9rKUN_sAw@mail.gmail.com>
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

Missatge de Jason-JH Lin <jason-jh.lin@mediatek.com> del dia dl., 26
de jul. 2021 a les 9:02:
>
> On Fri, 2021-07-23 at 13:13 +0200, Enric Balletbo Serra wrote:
> > Hi Jason,
> >
> > Thank you for your patch.
> >
> > Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 22
> > de jul. 2021 a les 11:26:
> > >
> > > There are 2 display hardware path in mt8195, namely vdosys0 and
> > > vdosys1, so add their definition in mtk-mmsys documentation.
> > >
> >
> > Just having 2 display hardware paths is not a reason to have two
> > compatibles, isn't the IP block the same? Why do you need to
> > introduce
> > the two compatibles?
> >
> > Thanks,
> >   Enric
> >
>
> Hi Enric,
>
> Thanks for reviewing my patch.
>
> The reason for using two compatibles is that vdosys0 and vdosys1 are
> different IP blocks.
>

With that there are different IP blocks, what do you mean? Do you mean
that there are two completely different blocks with completely
different functionalities?

Or that there is the same IP block twice? I mean, of course, the
registers are different but has exactly the same functionality.

> Because mmsys provides clock control, other display function blocks may
> use them as clock provider.
>
> E.g.
> 1. mmsys with compatible="mediatek,mt8195-vdosys0"
> [v4,1/6] arm64: dts: mt8195: add display node for vdosys0
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-2-jason-jh.lin@mediatek.com/
>
> ovl0: disp_ovl@1c000000 {
>         ...
>         clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
>         ...
> };
>
> 2. mmsys with compatible="mediatek,mt8195-vdosys1"
> [v2,06/14] arm64: dts: mt8195: add display node for vdosys1
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-7-nancy.lin@mediatek.com/
>
> vdo1_rdma0: vdo1_rdma@1c104000 {
>         ...
>         clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
>         ...
> };
>

Note that I am talking without knowing the hardware in detail, but I
am wondering why I can't have something like this, where every mmsys
is a clock and reset controller provider.

vdosys0: syscon@14000000 {
          compatible = "mediatek,mt8195-mmsys", "syscon";
          reg = <0 0x14000000 0 0x1000>;
          #clock-cells = <1>;
          #reset-cells = <1>;
};

vdosys1: syscon@15000000 {
          compatible = "mediatek,mt8195-mmsys", "syscon";
          reg = <0 0x15000000 0 0x1000>;
          #clock-cells = <1>;
          #reset-cells = <1>;
};

ovl0: disp_ovl@1c000000 {
        ...
       clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
        ...
};

vdo1_rdma0: vdo1_rdma@1c104000 {
        ...
        clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
        ...
};

What are the differences between vdosys0 and vdosys1 from a hardware
point of view?

Cheers,
  Enric

> Regards,
> Jason-JH.Lin
>
> > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > ---
> > > this patch is base on [1][2]
> > >
> > > [1] dt-bindings: arm: mediatek: mmsys: convert to YAML format
> > > -
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/__;!!CTRNKA9wMg0ARbw!ycgPEK4yBDojiiZJC2E9mGwvxJbaLqhyUxzJIq0ckEP-JVteBcjFdc6ixkNbmknH8f2P$
> > >
> > > [2] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC binding
> > > -
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-2-fparent@baylibre.com/__;!!CTRNKA9wMg0ARbw!ycgPEK4yBDojiiZJC2E9mGwvxJbaLqhyUxzJIq0ckEP-JVteBcjFdc6ixkNbmju2GBrD$
> > >
> > > ---
> > >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
> > > 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > > l
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > > l
> > > index 2d4ff0ce387b..0789a9614f12 100644
> > > ---
> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > > l
> > > +++
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > > l
> > > @@ -30,6 +30,8 @@ properties:
> > >                - mediatek,mt8173-mmsys
> > >                - mediatek,mt8183-mmsys
> > >                - mediatek,mt8365-mmsys
> > > +              - mediatek,mt8195-vdosys0
> > > +              - mediatek,mt8195-vdosys1
> > >            - const: syscon
> > >        - items:
> > >            - const: mediatek,mt7623-mmsys
> > > --
> > > 2.18.0
> > >
> --
