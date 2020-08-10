Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E94582403A3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 10:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF056E3A4;
	Mon, 10 Aug 2020 08:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6534C6E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 08:53:28 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id h22so6666608otq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 01:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xmzp7fk+vIO5KhMWu8O9IbD4bDIyRfJdP7iP0tIOvno=;
 b=rGxABv+ljtfQqO5x3dPLYRjGhDYDOE7M2ZkG/MerEaxkAE1quAS45+fZs+zOKyg5BO
 /INJdtuHKcBi/UUFUmATNqnevuCkQfyB1DUoO1PhMCcL1Bql2KN6FIBG85PFTpW+GTWy
 stxFrtXKTLpUAVUCCwLryQBmOn6mQLYMKqKlzQkqiamztsRr9ux1lWmEsLJ0fL8zHivz
 fAZ7pD9IeIxIG1RX+6NtfEl4EUj+kuxbM3CPO0ShQ6S2CG799EONVZ5BiEuJfUVj0p4u
 rZjinFdy7ohWdDgINVZ6gCi2fFtPesmM3a0RwmoFyNLmXY7/xPAapqH1xDXKMNTf7D9n
 jRXw==
X-Gm-Message-State: AOAM533KOvWdUyqg2DLGHOO9i/o68mYiSsBU5n04sC+6qs27DbFuxjvd
 nby5DSYelkgP2U18AVIVq/QqbmG5DT8bqvNo4S4=
X-Google-Smtp-Source: ABdhPJzSt76d0ygTKVbbokZXs04MvcLY5RinH8EKwMctMbjh/IruKDAr8twMrh9yrF5whd8fFKWBPfGLT5IiuTy66Aw=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr3284otn.250.1597049607701;
 Mon, 10 Aug 2020 01:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <e67a94e8-c9ed-dc9e-cab8-453a09441bcb@gmail.com>
 <CA+V-a8snp3EUFRuMHLxVhnc=zPq-LaQL8du7LgGcswi+6NthLQ@mail.gmail.com>
In-Reply-To: <CA+V-a8snp3EUFRuMHLxVhnc=zPq-LaQL8du7LgGcswi+6NthLQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2020 10:53:16 +0200
Message-ID: <CAMuHMdVEqc1JVeZrLdDfRo1EwyzaVq-ORStO39NyTqwwkh8YLQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: dts: r8a7742: Add DU support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 7, 2020 at 10:22 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Aug 7, 2020 at 8:48 PM Sergei Shtylyov
> <sergei.shtylyov@gmail.com> wrote:
> > On 8/7/20 8:49 PM, Lad Prabhakar wrote:
> > > Add du node to r8a7742 SoC DT. Boards that want to enable the DU
> >
> >   Both "du" and "DU" on a single line? :-)
> >
> Argh my bad.

No worries, I can replace the former one by "Display Unit (DU)" while
applying.

> > > need to specify the output topology.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

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
