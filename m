Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF54243778
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14E8892ED;
	Thu, 13 Aug 2020 09:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB26892ED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:17:23 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a65so4242749otc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V07KhpRlm+XyrUY9W/wqJIuuVTBiRrW7230tHoTMcI8=;
 b=GvPkNu1SrPZ1YUSn5f81FsWRaGxPeT3SBXUN3QtNTds3/Gd5tDpi9tMIHjGeyNLEJg
 MLszBZGZShdAkHGO0ks63k89vRL0cNcByRdcvKk/nbZgIlHhgE58p28Ffst4Mfealale
 ExRPqXZcYuCwmNxIM8hmdnUSFg6+FcfZwi81ANB/xLUtOQOZPCzo5UWWPb8KER9068Zl
 BNv3JS2KXBM5PFDoRqfymf1vqtI1ur6jRoAldWGd/VSXS8slOcwbqQEubT0XNM7IhjNZ
 4ZMi1aexjwObeUcrktv9gwbH5TBTDcPf6prNujSdi8VPOZwRclVUXvAopBK44ZccjGZz
 hccw==
X-Gm-Message-State: AOAM5339bzwfp+qA1JlYq2uJLDH8Ybo4B63N9dYTb31ghYLyPeoO5uC1
 4Ah+zT+gvwLOpMqZ0NJQD+j9JssEMbe+ceNLK20=
X-Google-Smtp-Source: ABdhPJxdPkdRpPWiNCOIxmN2JxvlePZTVF3T8bGebJ7eRWYMeJA5GOIXNkf4wj0qjwTCLwg6p4yGtROhDO1jLcqkr3g=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr3428687otn.250.1597310243034; 
 Thu, 13 Aug 2020 02:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 11:17:10 +0200
Message-ID: <CAMuHMdX0L-TcdHbmvdVGmwQCNuteXnCFLyt=e9qaSYq7BTdFWA@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a774e1: Add LVDS device node
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
> Add the LVDS device node to R8A774E1 to SoC dtsi and connect it with
> the DU node.
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
