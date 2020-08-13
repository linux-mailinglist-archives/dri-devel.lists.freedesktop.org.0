Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB99245D1F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E946E4EC;
	Mon, 17 Aug 2020 07:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3370C6E9A5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:38:30 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id m200so3034907ybf.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMZSesP5yzJziVUDR23hWsW+wrdDKjDsymbEjLFqlsQ=;
 b=sa5APNLzKf8++yFtOdgr0UmEUTQkjLHKmS98JuZjQU8iiXX9W5fsI/pxHxvkQp/pre
 L1wPQ8UHos5VVPsod04HhKTtIHOLqCwGOMlyfvXCcfcYtXAd05//mXXnj+9Nr9O79lig
 Gmg5K5MyoBIiiK++bUONSQhbZz3DX0telXDWdsqeEvvcmoILrHlY/SnhCJIMArT17mfw
 Rf3FgbdozoaaWJpGB9uqw7ZTRP2fGpvxNJCXU52ayjvkDrIsZAC3ZDEurBGTgXoxpL4I
 2nTC1uKgB/j8/gZ5YLYOkzCNzufavMKERpimxZM9fsOm3Zqt4weTSFvTBDax4QRTAziy
 xivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMZSesP5yzJziVUDR23hWsW+wrdDKjDsymbEjLFqlsQ=;
 b=JytYm6uKN57hNZp2BU21iQ4ll2fFgEmPgN95r2IQHmuIht4KXVViDuyp/Am+7kMMDe
 gDjbWr9h4qjPMiVKqvIwqC9tGbvXUTwbdnBFGC/eGffAbfB7nKJfZlc33kn+Atui4iVj
 MhKtrvQYoTQD3K9PUlysNBX2bM1OdKfdSjaw1gyCLiaggw8/jw6rAoUaUZ0Uri8GgbhK
 hU43Dsx0cd8dV/+i6kr/ER5u9XpHNEAP2jYlis6l91a6qwDlAE8DkWK1Cdh4Ap+MzmLG
 RdJdip51wiV0rtA6wsw/aIikf5jlaam779dF2GhJ7sHbYjIKrg21EkXPEdXNfwRY6i2F
 vZ8Q==
X-Gm-Message-State: AOAM530tt7mIVNjC3HL2waIm4+dVrUKQFmOZ9UF1KjGCLYzJRExSEbw0
 3YTJqLjku/Ufb5ZDcjRrm52XNSiYr8p+ack8ZOg=
X-Google-Smtp-Source: ABdhPJxlD8cvv3MGdWdeGBFCofqNyFiyRzL6aLDFdKQMT546vAVCQ0J4+sbcoOKuURBKl4JSRx8EFeWSlvxap8nxl8c=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr5654937ybc.76.1597315109361; 
 Thu, 13 Aug 2020 03:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Aug 2020 11:38:03 +0100
Message-ID: <CA+V-a8svAuDx51vuTCH4w5g0oF9qf8sWAEjMDMm+0+9u-UQhQw@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,
 du: Document r8a774e1 bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the review.

On Thu, Aug 13, 2020 at 10:05 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar, Laurent, Kieran,
>
> On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
> >
> > Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > index 51cd4d162770..67cded5ad827 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > @@ -10,6 +10,7 @@ Required Properties:
> >      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
> >      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
> >      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> > +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
> >      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> >      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> >      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> > @@ -75,6 +76,7 @@ corresponding to each DU output.
> >   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
> >   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
> >   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> > + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
>
> As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
> instead of port 2?
>
> I know we did it the same for R-Car M3-N and RZ/G2N.
> But my main worry is adding support for R-Car H3-N later.
>
I do agree too, with the below diff I tested the LVDS output on RZ/G2N
Rev2 board and things work fine. But only thing it doesn't explain is
why does LVDS work on DU2 for G2[H/N] boards :D

Geert, Laurent, Kieran If you agree with the below changes I shall
post a proper patch fixing it for RZ/G2[HN]

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index d661724fc28a..0b087d287202 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2540,8 +2540,8 @@
                                                remote-endpoint =
<&dw_hdmi0_in>;
                                        };
                                };
-                               port@2 {
-                                       reg = <2>;
+                               port@3 {
+                                       reg = <3>;
                                        du_out_lvds0: endpoint {
                                                remote-endpoint = <&lvds0_in>;
                                        };
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 3e67cf70f040..419d81c7763e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -153,7 +153,7 @@ static const struct rcar_du_device_info
rcar_du_r8a774b1_info = {
                },
                [RCAR_DU_OUTPUT_LVDS0] = {
                        .possible_crtcs = BIT(0),
-                       .port = 2,
+                       .port = 3,
                },
        },
        .num_lvds = 1,

Cheers,
Prabhakar


> >   R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
> >   R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
> >   R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -
>
> Apart from that:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> {oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
