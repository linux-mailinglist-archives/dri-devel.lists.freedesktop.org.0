Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C534A24375A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8FB6E5BD;
	Thu, 13 Aug 2020 09:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9884D6E5BD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:10:57 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id v13so4399137oiv.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GPmtgk3UOLJyUFtIWjda2Ey4ufiXCs6NyJGP6KSP1T0=;
 b=VzFJ5SK4YKsuEuyFdWPN9fmZNlQ+SWtkTeUa9xREtDNANznY3QnRiAuKPxYZkw9UP3
 gOettDSBmTz7IsZZ3tket0BZtqrcfve8PyJxp7jK3uStF8/OkePwxiZaTVXXcw25Mrbh
 5nlBvXLQ1IFa/4Ems6SzjBvimmst2PiOeaQdwi9oAtcjCZOHjlzOIFcLK7cswFj6UnCd
 BdZjxM5jVqEqB5f8iJaihKcDz0gLArSaXyuxVrfa/W4lH0wQAcjeUC8sQcAWpL6v4KdW
 RGS9gO9J4GLe89k/sFCDTj7y/8n+M7pM4wb4YUyNkGbJLULD+GMmdsZdwibkitbQ3Q/l
 cjhg==
X-Gm-Message-State: AOAM531ms/wjk17UHKFB/5LJ+lTyJHKkPmhGK5m105zaVLxJPIplQB2Q
 urlx5umVqymKJKu7lB6KkFhDxMDctjEB5dVHjkE=
X-Google-Smtp-Source: ABdhPJzZf6b7lgD23TEIGqf8zFMYGU1TQwhpl7558bFXmh9ftqkP75P5/VISFKwMg9x4HFnw0vv2b9onWPZyUjQE09s=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr2568681oia.54.1597309856979; 
 Thu, 13 Aug 2020 02:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 11:10:45 +0200
Message-ID: <CAMuHMdXTKUSsDyfjuj5AmtoBrRsBZoXtcvgK7mCz6W6CfDTJeg@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: display: renesas,
 dw-hdmi: Add r8a774e1 support
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
> Document RZ/G2H (R8A774E1) SoC bindings.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
