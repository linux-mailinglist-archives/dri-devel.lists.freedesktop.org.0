Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899552402C7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087AC6E375;
	Mon, 10 Aug 2020 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FAA6E039
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 21:44:08 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id e14so4149825ybf.4
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Aug 2020 14:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AY8il3Wt49EokcoJKHZYjeimbzzjX5ulhSQxuFxM9VQ=;
 b=L+3X8gR120+/AszKDfAq8knBOg+qtogECisCO3G9vB8LxxEFyPISbzURj9LiksUG21
 G4WQ/vmbteeBB0VErwZNlAbFv6MDCDpVdA+yfyAYzGaydQDOhM2/VYhRFVGeMAt91bHk
 ovK8fqMmmhtGchqiDd8n5flhruvOOawqIV4CfZFOQHQPvbgrW6bXp5TrAEVE47/HfrLl
 4KlpeJqGVcNMYHCeljQ0wCHVshwIWKr/hmqqgwOtM4UAxT4PkCntFkLzGkPEyhQTi3gs
 pxwiDoOweJwFJQiYYTj75FT+pqcyfavxHi4jCU6eAedTtkMVe84bzAHEwUv4vN7wQKF3
 ncew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AY8il3Wt49EokcoJKHZYjeimbzzjX5ulhSQxuFxM9VQ=;
 b=dc50bnoCTFeTd9SfN0urSFEi/Mmdr54XNgqC40DSXJoojL8mnTC5Tt7r120eEJTNOi
 QG9hjrqU9gCvp7rndkZMwV7lMixwgi5+9J0JLwURFcvX3xrld82Xcus27MJ1qRrIXh2C
 dnY0F3y73Q7FiAumTMhCsB/m0HAmEllLc2xkoG0XO3y5fjkpTSAxqGe70qfIJ2RhlkLq
 utKq3Rrp3hhUaFqu4ZonxbZ61DHNljuGu0GDRDrHhQRZDU5nL8JPV4geiSA+cqvkizVy
 FdNvec/l0225/rH91c4ciUHoe+BTyQb7ifMBZrUVTWwQqUyog6waNEs6hiUWYzSDsQY8
 GJEA==
X-Gm-Message-State: AOAM532f5EpvzfRQ2YzF4fPSXJFJ+DCA47m+5OXYxqejB/dUz8zDzK5B
 ODopCifi+0bCFzmotNujfDRCJ/41nZfwaxHA0TM=
X-Google-Smtp-Source: ABdhPJxI4pCVKXBSAk81XQXXkNUql/V+LGhgpGXDjZGBg+PuJHyb/00tCJJ2MNhe9buIQ1Hrvof0VNq51l9Xprh9tdQ=
X-Received: by 2002:a5b:40f:: with SMTP id m15mr32241076ybp.25.1597009448057; 
 Sun, 09 Aug 2020 14:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808205543.GL6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808205543.GL6186@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 9 Aug 2020 22:43:42 +0100
Message-ID: <CA+V-a8tisbiAuk6sVDokAjxwrLv1Xjkd6ydU_2haqtOKJucB2w@mail.gmail.com>
Subject: Re: [PATCH 0/7] r8a7742: Enable DU and LVDS
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:59 +0000
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank you for the quick review.

On Sat, Aug 8, 2020 at 9:55 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patches.
>
> On Fri, Aug 07, 2020 at 06:49:47PM +0100, Lad Prabhakar wrote:
> > Hi All,
> >
> > This patch series adds support for DU and LVDS to r8a7742
> > SoC and enables LCD support on r8a7742-iwg21d-q7 board.
> >
> > This patch series applies on top of [1].
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
>
> The driver changes will need to go through the DRM/KMS tree, and I'd
> recommend the DT binding changes to go the same route as well. I can
> handle the rebase when applying, and once the bindings get accept, you
> can ask Geert to upstream the last 3 patchs. Would that work for you ?
>
I'm OK with it as long as Geert is happy. (Fyi I still have bunch of
patches for G1H)

Cheers,
Prabhakar

> > Lad Prabhakar (7):
> >   dt-bindings: display: renesas,du: Document the r8a7742 bindings
> >   drm: rcar-du: Add r8a7742 support
> >   dt-bindings: display: renesas,lvds: Document r8a7742 bindings
> >   drm: rcar-du: lvds: Add r8a7742 support
> >   ARM: dts: r8a7742: Add DU support
> >   ARM: dts: r8a7742: Add LVDS support
> >   ARM: dts: r8a7742-iwg21d-q7: Add LCD support
> >
> >  .../bindings/display/bridge/renesas,lvds.txt  |  1 +
> >  .../bindings/display/renesas,du.txt           |  2 +
> >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts       | 84 +++++++++++++++++
> >  arch/arm/boot/dts/r8a7742.dtsi                | 89 +++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  5 +-
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
> >  6 files changed, 180 insertions(+), 2 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
