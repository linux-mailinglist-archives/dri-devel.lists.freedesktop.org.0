Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8CE4756D3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007A110E1DE;
	Wed, 15 Dec 2021 10:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4A110E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:47:40 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id y22so4212229uap.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tnK6iZmPqhF99bjgw7sRIlPbHYD4Dtq9IXFbVtwSE8=;
 b=FyBxmOCEy1RWSUv/DDM+PR95GwOCSr7N2JuggJF+ymv7e/LWFU4WqqyUvppC2qcj/3
 UdA1CEKv9gxN4opSt6BVOirYKmZmhhv/F6MLSzKcTcHLmx2lWcmIt62aRJ11Wpv21c1Y
 TJSjb6XqbgXUztZd0meTbdDyzCmchzZ5fjYiMviReBEqCiS6M3+Bk8ecD/p2bFZqO8WT
 LQI76lNNDcO0V8PiEzP0chANLiISY2BgOUsGhNxNdg83eCotAKXva/a5dvkA6X65cNqL
 zCNDYqHPF1q8WO0lZNlOzSIJg3JSh0q4AVq7lh0Fna4DItec8xySKWD3cvVujxoYy1qu
 5rKA==
X-Gm-Message-State: AOAM530HBERuTTf/XOypS/vzHy406Mo4GxFl2TmKQ3ekrMaGMKbDBgbm
 ukJQweQbENJSZFMgnS1lSCPiMd9RET09hQ==
X-Google-Smtp-Source: ABdhPJwnu8jTF+aaUK6o05tkcemRvISBv+aGjicakl00IzrFY3XqouexW/81w8iCKy5/c4naNaQrrg==
X-Received: by 2002:a67:e896:: with SMTP id x22mr2582916vsn.0.1639565259606;
 Wed, 15 Dec 2021 02:47:39 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id e7sm338131vkn.20.2021.12.15.02.47.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:47:38 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id t13so40131440uad.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:47:38 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr2308516vsj.77.1639565258205;
 Wed, 15 Dec 2021 02:47:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be>
 <b1fa94f611a5c32c5d70516d1a39973f518fb06a.1639559338.git.geert+renesas@glider.be>
 <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com>
 <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
 <YbnCKpL7m+m2nmrI@pendragon.ideasonboard.com>
 <YbnD3RwTC9su+8WQ@pendragon.ideasonboard.com>
In-Reply-To: <YbnD3RwTC9su+8WQ@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Dec 2021 11:47:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkoJ=VFqWhN9fyZcSncdaypSOwG1yNSPN=tsuv=WW=vg@mail.gmail.com>
Message-ID: <CAMuHMdWkoJ=VFqWhN9fyZcSncdaypSOwG1yNSPN=tsuv=WW=vg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: DRM_RCAR_USE_LVDS should depend on
 DRM_RCAR_DU
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 15, 2021 at 11:30 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 12:23:39PM +0200, Laurent Pinchart wrote:
> > On Wed, Dec 15, 2021 at 11:17:37AM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Dec 15, 2021 at 11:12 AM Laurent Pinchart wrote:
> > > > On Wed, Dec 15, 2021 at 10:27:46AM +0100, Geert Uytterhoeven wrote:
> > > > > The Renesas R-Car LVDS encoder driver is a subdriver of the R-Car
> > > > > Display Unit driver, and enabling DRM_RCAR_USE_LVDS while DRM_RCAR_DU is
> > > > > disabled doesn't have any impact on the kernel built.  Hence add a
> > > > > dependency on DRM_RCAR_DU, to prevent asking the user about this driver
> > > > > when configuring a kernel without R-Car Display Unit support, like is
> > > > > already done for DRM_RCAR_CMM.
> > > > >
> > > > > Fixes: 42d95d1b3a9c649b ("drm/rcar: stop using 'imply' for dependencies")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > The problem pre-existed before commit 42d95d1b3a9c649b, as the
> > > > > dependency of DRM_RCAR_LVDS on DRM_RCAR_DU was accidentally removed
> > > > > before.
> > > > > Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > > > > ---
> > > > >  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > > > index 65d72be50f46f19e..a7aa556e301d1087 100644
> > > > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > > > @@ -32,7 +32,7 @@ config DRM_RCAR_DW_HDMI
> > > > >
> > > > >  config DRM_RCAR_USE_LVDS
> > > > >       bool "R-Car DU LVDS Encoder Support"
> > > > > -     depends on DRM_BRIDGE && OF
> > > > > +     depends on DRM_BRIDGE && OF && DRM_RCAR_DU
> > > >
> > > > Shouldn't the same be done for DRM_RCAR_DW_HDMI ? Even better, we could
> > >
> > > DRM_RCAR_DW_HDMI can be enabled and built with CONFIG_COMPILE_TEST=y
> > > and CONFIG_DRM_RCAR_DU=n (yes I've tried on RISC-V ;-)
> >
> > It would seem so indeed, my question is whether that shouldn't be fixed
> > as well.

What is there to fix? You can build the HDMI fine without the DU driver,
when compile-testing.

> > > > wrap all the entries for the subdrivers in a 'if DRM_RCAR_DU'.
> > >
> > > That might work.  It can be tricky with bool/tristate, as sometimes m
> > > is not properly propagated.
> >
> > Would you give it a try for a v2 ?
>
> Another option is to introduce DRM_RCAR_USE_HDMI and DRM_RCAR_USE_DSI.
> I'd like to keep Kconfig consistent, with the same method to handle all
> subdrivers if no specific reason requires doing otherwise.

The HDMI and DSI drivers are separate drivers that can be (test)compiled,
regardless of DRM_RCAR_DU is enabled or not.

The DRM_RCAR_USE_LVDS symbol is different: enabling it does not
have any impact on the kernel build when DRM_RCAR_DU=y.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
