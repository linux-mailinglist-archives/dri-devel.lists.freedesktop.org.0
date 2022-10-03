Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBC5F28EF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 09:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926A610E214;
	Mon,  3 Oct 2022 07:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D9510E214
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 07:01:52 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id a20so5876006qtw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 00:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Mzq8GUPXLj/qJn76tNsIRQ6nN87ZuT/aWLrknBlMx3w=;
 b=JEAEOnR9gN24oHM62QvbwC58WTXgUj2o4INaS8g2pLEntutNCBdlqk87vss8XqdGfq
 TWpAUs+ycIKgQHbIF/gReQSHVKmu57WtFbO3IuZBU+0aRfF3WDE7G+h8sa3GfABv64zl
 Itcw7aC7VD5lhtF/z7ei/UESid5YncVZ0B+OHX7hJL+9e88fVHfsekfXjvar+ip6hNmT
 G9JRSLIZkd0ihuf2S6P4ZLIVxj25bEIKtZ2SfjLoRbEP5yThtJ8K/yclzuGqtj2X3nNL
 alGK9+Kq02V4pbu2UmKZrTW5L9vxhkqNAhUDl0+mPfmC7tYCnCobmXvY2uLByJ78oWRG
 PVFg==
X-Gm-Message-State: ACrzQf3KiutfAFedEfAxEcT19io9wuFXHsuU37uESoiVGbY4r7L/i7PH
 yUWQ55Z1UdycGEVvwxUt1DsxeoRGHRaTBA==
X-Google-Smtp-Source: AMsMyM5AK6FXPfsIigSi5Kvgq76i+nS1nDsgMR9DFwn17rhLve+nRR4qcnm/Ppu1uXhHcoUZigvbiA==
X-Received: by 2002:ac8:5716:0:b0:35c:bd68:d34 with SMTP id
 22-20020ac85716000000b0035cbd680d34mr14672243qtw.50.1664780511219; 
 Mon, 03 Oct 2022 00:01:51 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05622a030600b0035badb499c7sm9121989qtw.21.2022.10.03.00.01.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 00:01:50 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-345528ceb87so97749497b3.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 00:01:50 -0700 (PDT)
X-Received: by 2002:a81:a24e:0:b0:358:934b:980c with SMTP id
 z14-20020a81a24e000000b00358934b980cmr6493790ywg.383.1664780510447; Mon, 03
 Oct 2022 00:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
 <b1425f66-29cf-ce13-fe29-895cd2140c77@ideasonboard.com>
In-Reply-To: <b1425f66-29cf-ce13-fe29-895cd2140c77@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Oct 2022 09:01:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUV7TY=mfTS6ShOqPbT8JAC-nQFmUWdsyGtP86Op+0SaQ@mail.gmail.com>
Message-ID: <CAMuHMdUV7TY=mfTS6ShOqPbT8JAC-nQFmUWdsyGtP86Op+0SaQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and
 RCAR_MIPI_DSI
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Mon, Oct 3, 2022 at 8:56 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 02/10/2022 01:03, Laurent Pinchart wrote:
> > When the R-Car MIPI DSI driver was added, it was a standalone encoder
> > driver without any dependency to or from the R-Car DU driver. Commit
> > 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> > added a direct call from the DU driver to the MIPI DSI driver, without
> > updating Kconfig to take the new dependency into account. Fix it the
> > same way that the LVDS encoder is handled.
> >
> > Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   drivers/gpu/drm/rcar-du/Kconfig | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index c959e8c6be7d..fd2c2eaee26b 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
> >       select OF_FLATTREE
> >       select OF_OVERLAY
> >
> > +config DRM_RCAR_USE_MIPI_DSI
> > +     bool "R-Car DU MIPI DSI Encoder Support"
> > +     depends on DRM_BRIDGE && OF
> > +     default DRM_RCAR_DU
> > +     help
> > +       Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> > +
> >   config DRM_RCAR_MIPI_DSI
> > -     tristate "R-Car DU MIPI DSI Encoder Support"
> > -     depends on DRM && DRM_BRIDGE && OF
> > +     def_tristate DRM_RCAR_DU
> > +     depends on DRM_RCAR_USE_MIPI_DSI
> >       select DRM_MIPI_DSI
> > -     help
> > -       Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> >
> >   config DRM_RCAR_VSP
> >       bool "R-Car DU VSP Compositor Support" if ARM
> >
> > base-commit: 7860d720a84c74b2761c6b7995392a798ab0a3cb
>
> Interesting dependency issue. Took me a while to understand it =).
>
> But is there a reason to not have "depends on DRM_RCAR_DU" for
> DRM_RCAR_USE_MIPI_DSI and DRM_RCAR_USE_LVDS? Now the menu items are
> available even if RCAR_DU is n. That's also the case for
> DRM_RCAR_DW_HDMI, but I'm not sure if that's supposed to be usable even
> without RCAR_DU.

See
https://lore.kernel.org/linux-renesas-soc/cover.1639559338.git.geert+renesas@glider.be/

Didn't get to implement the suggested improvements yet...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
