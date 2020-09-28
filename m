Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8D27A883
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9A6E32F;
	Mon, 28 Sep 2020 07:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CF46E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 07:26:28 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id t3so57116ook.8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 00:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FIXuEXH1Fk3QAlLQe9GSnuwlSzVtMlZPFzZmwI9UqQo=;
 b=q8cUou8WudwzV52MGD/6BFzA8cJqJ5LMJMANxw5R+C004qepLRh+0rrAN3FWnghk1+
 AXXGPeiudZEPOMxoFJpn2+afXd7j3Eeq/LIajQbPXViEDy9r0zn8PX+2eYXvLS56AQ6+
 oWvMMH3LFDqGrECuyJhnu364Oiz4cctw1bUe494DtCOgbfLfQnLKwqWGmNkmbbGfdmWe
 dhOxMgAcJ5M+wklWT0SlLlNj8nwgwxr1a0RFNaTXw2MHpcgyjcWaLBHEx8T38n7S+6da
 eA//dFTsEsuIiazSSPq+LUAQiiE8XUSa4BH1SCZWGE+veBXp4S3dC2AiWCd8Krg0sVOY
 IY5w==
X-Gm-Message-State: AOAM531+JlhvH8G7AUvfRx4tXzIyLmhxrcL65I2V80BCG/WCoJTGAhgT
 kIcc14//prcWo7YHJ4d7nN7trV3nTVrsCMfJj+m7Sjj7kGg=
X-Google-Smtp-Source: ABdhPJwi1FqBvCqk6eXHKuHxD5zI6xr62zVsPkSsss785K8jM34uDKUyzRoSrlbneMqYlq2BfkG/5PiagZhx5YxubQ0=
X-Received: by 2002:a4a:e616:: with SMTP id f22mr155254oot.11.1601277987442;
 Mon, 28 Sep 2020 00:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824004816.GS6002@pendragon.ideasonboard.com>
 <CA+V-a8uq44hKOxbwBXZ_90q6e4JjCEPwOWp4BDY7BJJaP1Cg6g@mail.gmail.com>
 <20200927200418.GA3986@pendragon.ideasonboard.com>
In-Reply-To: <20200927200418.GA3986@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2020 09:26:15 +0200
Message-ID: <CAMuHMdX0_VDVw41ZuGy0M+d6sgNMujSas4x+YqZMWwpF-TvOZg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
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
 <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

On Sun, Sep 27, 2020 at 10:04 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Sun, Sep 27, 2020 at 02:01:50PM +0100, Lad, Prabhakar wrote:
> > On Mon, Aug 24, 2020 at 1:48 AM Laurent Pinchart wrote:
> > > On Thu, Aug 13, 2020 at 03:00:41PM +0100, Lad Prabhakar wrote:
> > > > The iwg21d comes with a 7" capacitive touch screen, therefore
> > > > add support for it.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >
> > > Everything seems to match the schematics :-)
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > > ---
> > > > v1->v2
> > > > * This patch is part of series [1] (rest of the patches have be accepted
> > > >   by Geert [2]).
> > > > * Added regulator for lvds
> > > > * Added reset pin for touchpanel
> > > > * This patch is based on series [3]
> > > >
> > > > [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > >     ?series=330277
> > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> > > >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> > > > [3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > >     ?series=330957
> > > > ---
> > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
> > > >  1 file changed, 99 insertions(+)
> >
> > Would you be queueing this patch along with DRM driver patches for v5.10 ?
>
> No, I expect Geert to do so, DT patches go through his tree. I handle
> the drivers and DT bindings.

Indeed.

As the dependencies are now in linux-next, I'm queueing this in
renesas-devel for v5.11, after fixing all conflicts due to recent
additions, and sorting &lvds0 before &pfc.

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
