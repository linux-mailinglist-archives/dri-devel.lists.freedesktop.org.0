Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C9624376B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDCE6E97E;
	Thu, 13 Aug 2020 09:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615456E977
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:14:14 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v6so4212190ota.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6deScSjL4QPU+1nm9bXBybyRqV1GDJ1sApO6/RiKbQU=;
 b=O6UUJEJf5S83LWJqqhAyq6vKdTO+2iZn32Pfb12zMwIHi8JcjwzfA54c2JNFVIxKXA
 JXBidTiUpu5DtyJd7w6k+wn+/zrQ4aORUevp2FdLaWfa7y2YtTxY4MexdoBFJS6e8/fL
 Eaenhl2BaItP0lJdttOE0P5kaiMliclxfH6xgW2mi12qmMjY6cZFUtzUlUjqbKLyUwR5
 j7om5RzsLe59iwoHhEP0Fih20pzibiY3VmDGqVCfKKTBJpdVlQO6Cr4smihDytSILB7F
 Lu6kbOg/eBFdHw9XVungM7v6RcHqNBS927hUt19cgOSE/TpDEVZ89fKHu4NZNZ/hyq+m
 6T8g==
X-Gm-Message-State: AOAM533IDqMYL2Ob/JM/b8B/KSR19IjR2r+UcPcnDWQEpFtIFuaShBuf
 8LxdxzqNDMMcRWPiY28RiFrcHC4v5bKWdMa2d+I=
X-Google-Smtp-Source: ABdhPJxZzEDqr9QJqNG51CIenvHAo83Rhirby8BLtJumtqG8XOC3gc7VCxo0DqRRIU++IWQ6D6dQIcAZYqRgLk9McTQ=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr3418868otn.250.1597310053733; 
 Thu, 13 Aug 2020 02:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 11:14:02 +0200
Message-ID: <CAMuHMdU-hHmLeGkgC+mBD5nwWXGsD=fGcywyQgx86cPtxgyrSw@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: renesas: r8a774e1: Populate HDMI encoder
 node
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 4:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Populate HDMI node properties in R8A774E1 SoC dtsi.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10 (after resolving the port numbering).

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
