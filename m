Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC1B243726
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175596E5A4;
	Thu, 13 Aug 2020 09:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091D06E195
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:05:27 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id z11so1070529oon.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AvIhR4VMBCPleNB4MD/t7+rUWOqAWwlH0ujr1BxGlw=;
 b=SOgshk3q+S6vGToMz/QgN/qDgtfiV5tsuzdygMXEKXv7GgtS5M88SV6ssJZDWQXjUv
 beQCbmiil6kSofcfv2fkbuKgKkpguNj06MEd2Dzy15s2BfeaosTmSgvMtoU8LtM3E12s
 /TmuRkKOFwamj0x7ipj6SEKIuZoiz7AnxItKVsOChtZt15DPqnXnQ9fqU6W+Yf1JUUzM
 XZeO81DMUEY/UpHqm5Kz4m6wF694JR5RXh/oEqkHs1MrGNG4yI9S0uOI4el2t/Cs2cg6
 eywLQITcDqLjOaZtMdvtRSWv2A+niypW1BBp2YSwFZQWWO+0rzxRO9dwHBtVich02Ozg
 ki9g==
X-Gm-Message-State: AOAM531jUPxwD4HDlHW08UreDQEGq9rJHPWDPdc7vf72gahHJYGiQ+Nf
 HKrJx6/Hc14SsfqWnGP3znX2j7kvI1SwlOirK7I=
X-Google-Smtp-Source: ABdhPJyUVskr8e/cEyjDxvkGzZdvsxqJxwiGe6jUX0tZXjbkklpncAUVA0TsyDuRFcZ55z9cv4D0LKrgJqG/ccdMfWs=
X-Received: by 2002:a4a:6c13:: with SMTP id q19mr3744544ooc.11.1597309527049; 
 Thu, 13 Aug 2020 02:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 11:05:14 +0200
Message-ID: <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,
 du: Document r8a774e1 bindings
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar, Laurent, Kieran,

On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index 51cd4d162770..67cded5ad827 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -10,6 +10,7 @@ Required Properties:
>      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
>      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
>      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
>      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
>      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
>      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> @@ -75,6 +76,7 @@ corresponding to each DU output.
>   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
>   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
>   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -

As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
instead of port 2?

I know we did it the same for R-Car M3-N and RZ/G2N.
But my main worry is adding support for R-Car H3-N later.

>   R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
>   R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
>   R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

{oetje,eeting}s,

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
