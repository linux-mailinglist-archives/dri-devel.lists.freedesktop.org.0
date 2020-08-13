Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4D243753
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2C26E5A2;
	Thu, 13 Aug 2020 09:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259406E5A2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:10:02 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id b22so4414115oic.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFMezuvSe3SKrMQIzsU7calM1hohwotMeVW3G3XCg7k=;
 b=kDglKgZzjRHmZqSmRgOJNx3EJQITt00EqB3du1BjLAzSh1PHbPYWKatYESvld/dwqu
 rAXWE1b04AIdAChRXRaW6FqLDxH2MpJJ1HERop4Zibdvy7zHmjwLKp0radvoCuyJkn1v
 DlvigQ1i8yCdDmEt4RnIx8ZQiywzk+mVwl5huHxG8DuZLCK1OCvAzNZecSxJplByUNDK
 KWTLws/G8kXhck+E3Xi6tDTATXFb7fnp0u/fXNEcs76lA8cIe3+jMgdhNY4QoguLiVly
 mMS5UuPRM1t8u3bc8T1F9n6at7Gs/rCcM8+kFDL8joAFw1fW4q/fKOMoRCnLxZeYz13G
 Ga9w==
X-Gm-Message-State: AOAM532te3Ini83HoURkoVaRz0cN3tK6X/mayivCAuZwmRsx0S8+G43A
 tOfMxleW37yWSPFL7NQGYGsD3K4lOLALSrpt4MA=
X-Google-Smtp-Source: ABdhPJzPc4BxFza9KeAbG78MDR54iNiEFsW2Ry0hmfIVXU1snC6Y09cLyREs/EwBnuaR3sFXtTWjL+41a4m/TmCRNl4=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr2437706oie.153.1597309801507; 
 Thu, 13 Aug 2020 02:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 11:09:50 +0200
Message-ID: <CAMuHMdW04aC5Tusba=S4Sf4Gbu9VwgZ5Kar4HOjZaQXpF9F27Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: display: renesas,
 lvds: Document r8a774e1 bindings
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
 <devicetree@vger.kernel.org>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 David Airlie <airlied@linux.ie>,
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
> Document the RZ/G2H (R8A774E1) LVDS bindings.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For the logical change (ported to .yaml):
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
