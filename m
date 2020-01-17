Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56053140597
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2420C6F44F;
	Fri, 17 Jan 2020 08:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1676F44F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 08:47:35 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w21so21894063otj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 00:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pz6+/xs8T4dEEblCt+UUKFDi8/LXzdFKEsZrzO5UHGk=;
 b=Z9OoV1Rk+x8x8kqRMCvPcEgJeEZ/Wqx9pGiELH/Bal4I0dqdmkIRhoms3/o6r5vNov
 cUnpl3LkSLOLSpKU6DE/lNQbTW6w9MOH3wW/Sk0DlqGeb21AanPA2RCl0vg8bQLnYFwd
 SoCYJY6lBJhM92oqPPk5dF/qJDluRbSI19rGQnt3NTekuqs8jx8gcOix4pDaASEfwizn
 LT2QmFe3nspTV0POQ+u8szMJh6eJXYRg2qO5gEZsbvxBwuhvJQGvN9BSmTOxJhVz7n17
 UnsuDN5NMFuj0s9oayOnSOAQNeLe4i8GfHfOVMdRy4fdKXQ+iDFDLff4TkUut6pKkhz8
 4X3A==
X-Gm-Message-State: APjAAAUNmPyaG7bieU5adcJLHEg7+xkccwT+QvQb3jRlthGLmF2Kwgx4
 tAEvBAJ4smCt6yL8c9AgPrZvUT/W5bQRnJlcMcQ=
X-Google-Smtp-Source: APXvYqwPm6MtbyAOSCi9UiBhMZ4PpzpzXrNfcsnaLGfKDZqdHNnurHqn4SJJX9I9yrPnM/Q7dnOgZvD5f79Eq6Wg3as=
X-Received: by 2002:a05:6830:2141:: with SMTP id
 r1mr5358243otd.39.1579250854871; 
 Fri, 17 Jan 2020 00:47:34 -0800 (PST)
MIME-Version: 1.0
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191217231326.GG4874@pendragon.ideasonboard.com>
In-Reply-To: <20191217231326.GG4874@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2020 09:47:22 +0100
Message-ID: <CAMuHMdWaZBfsHi9E57B8Mr6QSCATVxpdRtg=9_H-urBaK_iRJw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Add dual-LVDS panel support to EK874
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Magnus Damm <magnus.damm@gmail.com>, ebiharaml@si-linux.co.jp,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

(woops, forgot to press sent)

On Wed, Dec 18, 2019 at 12:13 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Dec 17, 2019 at 01:45:55PM +0000, Fabrizio Castro wrote:
> > this series adds support for dual-LVDS panel IDK-2121WR
> > from Advantech:
> > https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> >
> > V6 reworks patch "drm: rcar-du: lvds: Allow for even and odd pixels swap",
> > and rebases the series on top of patch:
> > https://patchwork.kernel.org/patch/11295991/
>
> I've taken patch 1/6 to 4/6 in my tree. I expect Geert to take 6/6. For
> 5/6, I'll give Rob a chance to review the patch. Sam, could you handle
> it afterwards ?

Queuing 6/6 in renesas-devel for v5.6.

> > Fabrizio Castro (6):
> >   drm: of: Add drm_of_lvds_get_dual_link_pixel_order
> >   drm: rcar-du: lvds: Improve identification of panels
> >   drm: rcar-du: lvds: Get dual link configuration from DT
> >   drm: rcar-du: lvds: Allow for even and odd pixels swap
> >   dt-bindings: display: Add idk-2121wr binding
> >   arm64: dts: renesas: Add EK874 board with idk-2121wr display support
> >
> >  .../display/panel/advantech,idk-2121wr.yaml        | 128 +++++++++++++++
> >  arch/arm64/boot/dts/renesas/Makefile               |   3 +-
> >  .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 +++++++++++++
> >  drivers/gpu/drm/drm_of.c                           | 116 +++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c                | 180 ++++++++++++---------
> >  include/drm/drm_of.h                               |  20 +++
> >  6 files changed, 483 insertions(+), 80 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> >  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

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
