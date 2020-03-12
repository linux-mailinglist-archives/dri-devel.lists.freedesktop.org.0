Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842F182D16
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 11:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE39189D00;
	Thu, 12 Mar 2020 10:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD8589D00
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 10:10:23 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id v19so4887379oic.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 03:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zwwoiowfHNPz9HpeeIjPtaOJgNXOTQ/vvDnMi1D629A=;
 b=AkHuQLtvxTkG7lVzxkkwkpc2R405xvZx1XTEvEPtPGOmd2+VBcE/LN0Wje2DSrbprU
 RgVfrQBDmqKywD/XlkX+cg1VDSGH2DmRfuHFEzbl3meC70ZmdMZLa8KOKZWRACzKDisK
 2N02yPBkXSIzl4VH1bt/dNQvo1Yi3JoJ8HcpwTz1opApIyly6Y+AtMVvSnz8LNAZQzjC
 fYfjZQ841bUvoeW0lUzYaAgTWHhrrI1zCe45ZyNE4/rOiTRfQ2gqnJ5/BPE6aDLhyi4n
 HlqkUPlumGowxeq4QHMWQgyqh/RiKv1VcNWeBUy59uh34AhjJBsxu+BCU9f3T0k53av3
 Rd2A==
X-Gm-Message-State: ANhLgQ22pYEoD2WcT6ejm/kv8hvl7qCoKxEDLESpkwuJybzyu00uUMO0
 bD268DIoFGe6xhAi1ofNN1mnECNsurISxE8s65U=
X-Google-Smtp-Source: ADFU+vt2xrdAlnM+K+3Hl7KD8Ot0CPxqX+cCiLIRU6jFW7JpfLC+f9+Lgd1azWcf6NufNcnKkmCIgjYifaSTuSjCeA8=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1923995oia.148.1584007822268; 
 Thu, 12 Mar 2020 03:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <1583957020-16359-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1583957020-16359-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Mar 2020 11:10:11 +0100
Message-ID: <CAMuHMdWqMHGeENswnfk-Hra4JrfELQkLuzY_6JHFRJZWJZPJog@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add LVDS panel support to HiHope RZ/G2M
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lad,

On Wed, Mar 11, 2020 at 9:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The HiHope RZ/G2M is advertised as supporting panel idk-1110wr from
> Advantech, but the panel doesn't come with the board, it has to purchased
> separatey, therefore this series adds panel support to a new DT.
>
> v3->v4
>  * Included rzg2-advantech-idk-1110wr-panel.dtsi in
>    r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts file instead of re-inventing
>    the wheel.
>  * Dropped the Ack from Laurent for patch 2/2 due to above changes
>
> v2->v3
>  * Included Reviewed-by from Rob and Laurent
>  * Switched to dual license
>  * Added myself as the maintainer
>  * Updated copyright year
>  * Rebased the patches
>
> v1->v2
>  * fixed a space according to Geert's feedback.
>
> Thanks,
> Prabhakar
>
> Fabrizio Castro (2):
>   dt-bindings: display: Add idk-1110wr binding
>   arm64: dts: renesas: Add HiHope RZ/G2M board with idk-1110wr display
>
>  .../display/panel/advantech,idk-1110wr.yaml        | 69 ++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/Makefile               |  1 +
>  .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts        | 52 ++++++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts

Thanks for the update!
I've queued the second patch in renesas-devel for v5.7.

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
