Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0ED240366
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 10:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0DA6E393;
	Mon, 10 Aug 2020 08:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772B36E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 08:27:36 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id r21so6630381ota.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 01:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//ZK6+SFvrkRSTwRR61xNq9XPyj33yV4vd1Xm7D7328=;
 b=s0IPq9Pcu9O+DhAfYf5Seytf3vC5n12lyRyN769syfghmezfGHXdESUJbwVKGER2tn
 fnihmrDL04Zp+t0Bn309Z9Iuqw+5qh888LN1iTvf91sFWgGU0WmhOvxf8hnQ4mC/sYRj
 hfH7fFJpckyMvRC0GYJvwdW2mGIMewX+vG1S1CcV9MlWwxfwv5bW0ZmW3plWtinW2J3u
 8Tt8x/b1d4O2P1XgFGw76fdaqcxVkD67UChjhYAvlvkRi8eDezE6IK+5eSs9R8n+zpGY
 QMVyCdnmnVsXQxWCBsw1RAlxYeDU9/3JVGigEc37lAytDHnuWyoMrlBt2ziErym5PhzP
 Ixjg==
X-Gm-Message-State: AOAM530nsxt7rXfJzeZZRS/ZCvZdXEri47BFtWTaDi6WXQEF5PbOL2Pt
 2pMwwfdvzFt07EG4bf/784PJNBvM9EPpqrphYqY=
X-Google-Smtp-Source: ABdhPJxwJlWiihOYnopaBk+U2KL7gmjD5NzWrgNpwHGalMg3unmme5HI285YIPGLyiOjEUmWDvwr253KoLAdDpnJgHA=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr11199918otl.145.1597048055761; 
 Mon, 10 Aug 2020 01:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808211323.GR6186@pendragon.ideasonboard.com>
 <CA+V-a8v0nXwe0iN2ymqE5YgcgOymWYv-Xf6N+rw_nJnUgx4yMQ@mail.gmail.com>
In-Reply-To: <CA+V-a8v0nXwe0iN2ymqE5YgcgOymWYv-Xf6N+rw_nJnUgx4yMQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2020 10:27:24 +0200
Message-ID: <CAMuHMdXH_ttYNrKpMxxkSTvhYcxkCD6v_ueXMGN6mXhkbpoyPA@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: r8a7742: Add LVDS support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar, Laurent,

On Sun, Aug 9, 2020 at 11:30 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Sat, Aug 8, 2020 at 10:13 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Aug 07, 2020 at 06:49:53PM +0100, Lad Prabhakar wrote:
> > > Add LVDS encoder node to r8a7742 SoC DT.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > ---
> > >  arch/arm/boot/dts/r8a7742.dtsi | 54 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 54 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
> > > index a979a4b3de61..a7e66220d63a 100644
> > > --- a/arch/arm/boot/dts/r8a7742.dtsi
> > > +++ b/arch/arm/boot/dts/r8a7742.dtsi
> > > @@ -1534,11 +1534,65 @@
> > >                               port@1 {
> > >                                       reg = <1>;
> > >                                       du_out_lvds0: endpoint {
> > > +                                             remote-endpoint = <&lvds0_in>;
> > >                                       };
> > >                               };
> > >                               port@2 {
> > >                                       reg = <2>;
> > >                                       du_out_lvds1: endpoint {
> > > +                                             remote-endpoint = <&lvds1_in>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             lvds0: lvds@feb90000 {
> > > +                     compatible = "renesas,r8a7742-lvds";
> > > +                     reg = <0 0xfeb90000 0 0x1c>;
> >
> > Isn't 0x14 enough for the size ? 0x1c won't hurt though. Same comment
> > below.

I can fix that while applying.

> Agreed, 0x1c comes from Gen-3 manuals.

All R-Car Gen3 and RZ/G2 .dtsi use 0x14 or 0x20.
All R-Car Gen2 and RZ/G1 .dtsi use 0x1c, but their manual suggests 0x14, too?

Doesn't matter much, as the hardware address decoder probably uses a
multiple of 2, and page mapping granularity is at least 4 KiB anyway.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
