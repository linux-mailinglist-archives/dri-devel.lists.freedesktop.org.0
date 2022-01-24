Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF8497A1B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 09:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB0E10E160;
	Mon, 24 Jan 2022 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587CD10E160
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:19:05 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id 2so29433619uax.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 00:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/c+3F2pmQ34Zp5zM0VZln6fe/9uq04UqlvKTdCwGTM=;
 b=lfYwjT1ZShlUyf597379glADwaFTi/TWSlLMu9uO1IWxNA99HX8aDTB4oasV1CpTDU
 glxAUx2qqyHA6NjijYJ79upciSayGoA3I7OHMNZHVsf0FNjr5EuUkIi1c1kP73okjk5f
 SSpkCrt/4EZMpfGZdH5vWvkPojY7CrpTxyjih6IJ5ntElPRQMMk2qEvLeFUO6G45DqnW
 +yrlj2hIusMAfanai/o/OGNd+uZXjqjVN6ACcDDGdyy9UwZngKHqxGpUZr5V54flZiwF
 B78I16n5aVv9ppkG22agS5TpzKf/LaHvuPDoiHzxxs5yaZa+GRMjlRoS++BSJyUrqHEU
 ZqMg==
X-Gm-Message-State: AOAM532r6bniAjCYs4w81DVgkapOPr3aXYs114FbVtCHQp3rMij0PZCQ
 gdnnLRmFJwtwoAZT2WsrwFvMHmCyqcB4Dg==
X-Google-Smtp-Source: ABdhPJzysj5D1/8b2h63/DoAWeZ+XqqmVb5m7aVF+30p5gU7CWes64Je0nm0R0IYPxLimf9bEzV7SA==
X-Received: by 2002:a67:cd86:: with SMTP id r6mr4952357vsl.19.1643012344284;
 Mon, 24 Jan 2022 00:19:04 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id q4sm1001038vke.15.2022.01.24.00.19.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 00:19:03 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id y4so29449728uad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 00:19:03 -0800 (PST)
X-Received: by 2002:a05:6102:a04:: with SMTP id t4mr143613vsa.77.1643012343460; 
 Mon, 24 Jan 2022 00:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
 <Ye1dhPKT2FGgXKLO@pendragon.ideasonboard.com>
In-Reply-To: <Ye1dhPKT2FGgXKLO@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jan 2022 09:18:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWQeumgcHMNnG7Zntxnc0y=B6C_V_cYVYk2L45vujywg@mail.gmail.com>
Message-ID: <CAMuHMdWWQeumgcHMNnG7Zntxnc0y=B6C_V_cYVYk2L45vujywg@mail.gmail.com>
Subject: Re: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible
 variable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sun, Jan 23, 2022 at 2:52 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jan 14, 2022 at 11:17:19AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Increase buff size for compatible variable to avoid stack corruption
> > > with RZ/G2L SoC's(renesas,du-r9a07g044l) which requires a buff size
> > > more than the current allocated size.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > > @@ -200,7 +200,7 @@ static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
> > >         struct device_node *lvds_node;
> > >         struct device_node *soc_node;
> > >         struct device_node *du_node;
> > > -       char compatible[22];
> > > +       char compatible[24];
> > >         const char *soc_name;
> > >         unsigned int i;
> > >         int ret;
> >
> > What about changing the code to use kasprintf() instead, to prevent
> > this from ever happening again?
>
> Or maybe it's time to drop this backward compatibility code altogether ?

The last R-Car Gen2 DTS was converted in commit edb0c3affe5214a2
("ARM: dts: r8a7793: Convert to new LVDS DT bindings") in v4.17.
The last RZ/G1 DTS was converted in commit 6a6a797625b5fe85 ("ARM:
dts: r8a7743: Convert to new LVDS DT bindings") in v5.0.

Both are older than commit 58256143cff7c2e0 ("clk: renesas: Remove
R-Car Gen2 legacy DT clock support") in v5.5, so I'd say let's get
rid of it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
