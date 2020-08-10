Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A224036C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 10:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4724D6E397;
	Mon, 10 Aug 2020 08:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CFB6E397
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 08:28:08 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id h16so6648755oti.7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 01:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eh3W9EtO5pIjBRNzAhGPiTVpKKJqj3aKGwA7TcnbRiM=;
 b=Bq2eqYzjhVbkrXwqpF2xCFU3pPeNSPbmUFS6e93G4y6/fnXrf/7XpuXI0fsrADw7Mn
 yQwBOK2lMkMdt38XWrZ74xae83NpGpOFx3kTe0Lw8gI9s05mMh0nCh330QR05m25CaJ8
 cxZLiNnUuGXsbutjdauZDhb0JoKMoQoJDihpFLfgFWa2absFVjAYb3VPt5fxVcRVg9RE
 LGXgOSwFvVJp5wPKpyA7oJu2/9PtUeTDioIzMowGy68t+8GHfPCdtkO6v2WuXYQH+Rv1
 0pSFsZTrtOnGcg0CqbtouLU0+ToD32IBb+Gyk2//0enNtbQvgT9t5BRQ+n1tkMADCRs4
 SXCQ==
X-Gm-Message-State: AOAM530Ceg8muAvNmufWFhJk5QZ5Okk4IJa4m5zs3iLfbd55csmGA1CM
 D0l5JSrdMsukA/XVjHP/SSLqJw3Gg1qCjXrsfOQ=
X-Google-Smtp-Source: ABdhPJxQulcE7/JusbTYnqwHYnQVJLDRBysRxEAhgyWpRidsDiU/4VQm001qLWGLopsYWkEwjeMlWoNhcMBoGoX0YDc=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr21101979ote.107.1597048088183; 
 Mon, 10 Aug 2020 01:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808205543.GL6186@pendragon.ideasonboard.com>
 <CA+V-a8tisbiAuk6sVDokAjxwrLv1Xjkd6ydU_2haqtOKJucB2w@mail.gmail.com>
In-Reply-To: <CA+V-a8tisbiAuk6sVDokAjxwrLv1Xjkd6ydU_2haqtOKJucB2w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2020 10:27:57 +0200
Message-ID: <CAMuHMdXBR1t8gCfEiE88QvAaJ6diohmZnhOZxLYES6n5cSxYpg@mail.gmail.com>
Subject: Re: [PATCH 0/7] r8a7742: Enable DU and LVDS
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

On Sun, Aug 9, 2020 at 11:44 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Sat, Aug 8, 2020 at 9:55 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Aug 07, 2020 at 06:49:47PM +0100, Lad Prabhakar wrote:
> > > This patch series adds support for DU and LVDS to r8a7742
> > > SoC and enables LCD support on r8a7742-iwg21d-q7 board.
> > >
> > > This patch series applies on top of [1].
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> > >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> >
> > The driver changes will need to go through the DRM/KMS tree, and I'd
> > recommend the DT binding changes to go the same route as well. I can
> > handle the rebase when applying, and once the bindings get accept, you
> > can ask Geert to upstream the last 3 patchs. Would that work for you ?
> >
> I'm OK with it as long as Geert is happy. (Fyi I still have bunch of
> patches for G1H)

I'm fine with that.  BTW, I use an R-b from Laurent on the DT bindings
as the acceptance criterium, so you're good.

> > > Lad Prabhakar (7):
> > >   dt-bindings: display: renesas,du: Document the r8a7742 bindings
> > >   drm: rcar-du: Add r8a7742 support
> > >   dt-bindings: display: renesas,lvds: Document r8a7742 bindings
> > >   drm: rcar-du: lvds: Add r8a7742 support
> > >   ARM: dts: r8a7742: Add DU support
> > >   ARM: dts: r8a7742: Add LVDS support
> > >   ARM: dts: r8a7742-iwg21d-q7: Add LCD support

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
