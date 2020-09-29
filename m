Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F427BD4E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 08:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB02A89DA6;
	Tue, 29 Sep 2020 06:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF5F89DB4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 06:47:24 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id u126so4255321oif.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 23:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eQxENvsyMWS22qKPMiworJ58ghi2NcksAJutpCi0NkU=;
 b=P7jVuw6zfE1KyPEWxaD2/yR8tfnGviNSsyxSPazBIgZVUVdq8gPe7J16jX5oXkZJy4
 IDAV52/obMB8z30p5wHEOZ35Bwg7evAOAvXEp8h6400rNfiI19xtr9wZnVVeKyqSEdAA
 McYPYVoRYy4JPk8ltto4tcsJopl5btBNFaPPXWp2DLllfqnjW5Gc3Ed4nRTXJLi9XgvJ
 x1kJuKBIjf+Rd2UDnA3pw3oD3f/PsQ6BWX7JDP95LYB2UbbB0OYlBi9l4F2Rg2J3E3vW
 98siYxGwJ4UKt66EJgP+4gkqtSrfITHnoZq4j0u10e2PdqneRQOZ95xqrgnts7VGV0Cd
 KioA==
X-Gm-Message-State: AOAM532iaW7apfQBFVtS+fuID8suy9oBzARKM5D8N37ffw87SsaZdlfo
 a8UKhlr+6qv7Q1jm8td5qkbVb+TVtCSrPwzsTKg=
X-Google-Smtp-Source: ABdhPJwCxCGIdhoc6Arzmd5fdzaebLgPJZk0Xi6OttQFUI4UCwkVKHL9xVA8kyId/LWk1n30Q5fKOSTVwC2ovpDk1dk=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr1622307oib.54.1601362044107; 
 Mon, 28 Sep 2020 23:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824004816.GS6002@pendragon.ideasonboard.com>
 <CA+V-a8uq44hKOxbwBXZ_90q6e4JjCEPwOWp4BDY7BJJaP1Cg6g@mail.gmail.com>
 <20200927200418.GA3986@pendragon.ideasonboard.com>
 <CAMuHMdX0_VDVw41ZuGy0M+d6sgNMujSas4x+YqZMWwpF-TvOZg@mail.gmail.com>
 <OSBPR01MB5048ABBC3F74E1DF49374E7DAA350@OSBPR01MB5048.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB5048ABBC3F74E1DF49374E7DAA350@OSBPR01MB5048.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2020 08:47:13 +0200
Message-ID: <CAMuHMdWgAD+ugVyPVGjOVx-0zranRqRTEinbPZ9_T24EOg0Vag@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

On Mon, Sep 28, 2020 at 9:52 AM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > On Sun, Sep 27, 2020 at 10:04 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > On Sun, Sep 27, 2020 at 02:01:50PM +0100, Lad, Prabhakar wrote:
> > > > On Mon, Aug 24, 2020 at 1:48 AM Laurent Pinchart wrote:
> > > > > On Thu, Aug 13, 2020 at 03:00:41PM +0100, Lad Prabhakar wrote:
> > > > > > The iwg21d comes with a 7" capacitive touch screen, therefore
> > > > > > add support for it.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > > >
> > > > > Everything seems to match the schematics :-)
> > > > >
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > >
> > > > > > ---
> > > > > > v1->v2
> > > > > > * This patch is part of series [1] (rest of the patches have be accepted
> > > > > >   by Geert [2]).
> > > > > > * Added regulator for lvds
> > > > > > * Added reset pin for touchpanel
> > > > > > * This patch is based on series [3]
> > > > > >
> > > > > > [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > > > >     ?series=330277
> > > > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> > > > > >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> > > > > > [3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > > > >     ?series=330957
> > > > > > ---
> > > > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
> > > > > >  1 file changed, 99 insertions(+)
> > > >
> > > > Would you be queueing this patch along with DRM driver patches for v5.10 ?
> > >
> > > No, I expect Geert to do so, DT patches go through his tree. I handle
> > > the drivers and DT bindings.
> >
> > Indeed.
> >
> > As the dependencies are now in linux-next, I'm queueing this in
> > renesas-devel for v5.11, after fixing all conflicts due to recent
> > additions, and sorting &lvds0 before &pfc.
> >
> This also needs changing vcc-supply to power-supply for lvds receiver due to recent binding changes, probably Ill do the above and post a v3.

Oh, I didn't know that.  So please send a v3, so I can replace the commit
in my renesas-arm-dt-for-v5.11 branch.
Thanks!

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
