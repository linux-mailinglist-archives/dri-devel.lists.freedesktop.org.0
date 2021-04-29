Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC30836EECB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023C26F404;
	Thu, 29 Apr 2021 17:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B936F404
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:22:46 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id m17so4102462vsn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 10:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IipN+JHy/GHloboiBlg+J8C/w+MqkgnZBETYvu9afi8=;
 b=A54byJ56kfYG2rmFA2T9z9avR7ABbvPJA9csrmxjN67Oz29+9+919UvSPKSWR71UwH
 yGJVIvG1gfYs90XM4mfT6Em6qr/5ICybElrhcNp+fmdd7uI3ZSuz3iKkwDs0jrH9w+ns
 gHkiAPja4cpq9bK/XuiK/gctsdQEeu6szBuZcC0OXpgtc4XWaissHsZZjbI0L9CkTfPf
 1KpnDD1oih/cjalyafjHhJkpqweMkkpSACpxyuaLc3geHgmVxNmNq9fkVLNK8FPW7OAn
 bUyMQecAAq8JrZVawVr1htrekeDDqAFZbpnP8U81sB7AH+936vYlDqUT6lgz+yDhLwCj
 Ut3w==
X-Gm-Message-State: AOAM5308ISJOOhsYkcsC0QkkMxGiBQq8RL3dc2GY8+EeBEa+zI6SboUg
 EzVEHWbwfTYXuF1btpNu44gJg+f/g/7RDaXx3V0=
X-Google-Smtp-Source: ABdhPJwntEMdXe4iH454WyGzfl3NxgkqigXREwYM2E5ls823gHlXZ8uCvDYYfvETE8D1NZwkQY/9uYdAvPkQ3+7ShVU=
X-Received: by 2002:a67:f614:: with SMTP id k20mr1510686vso.42.1619716965113; 
 Thu, 29 Apr 2021 10:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <600d42256515f180bc84b72e8bdb5c5d9126ab62.1619700459.git.geert+renesas@glider.be>
 <YIrXxWbJ2LmcoQn1@pendragon.ideasonboard.com>
In-Reply-To: <YIrXxWbJ2LmcoQn1@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Apr 2021 19:22:33 +0200
Message-ID: <CAMuHMdUe0wA-BXXiJKuSjCrPFwbs3V4x6O=OAvTsmgYKt8bMHA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Add missing
 power-domains property
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, Apr 29, 2021 at 5:59 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Apr 29, 2021 at 02:47:56PM +0200, Geert Uytterhoeven wrote:
> > "make dtbs_check" complains:
> >
> >     arch/arm/boot/dts/r8a7779-marzen.dt.yaml: display@fff80000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     arch/arm64/boot/dts/renesas/r8a77970-v3msk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     arch/arm64/boot/dts/renesas/r8a77970-eagle.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     arch/arm64/boot/dts/renesas/r8a77980-condor.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> >
> > Fix this by documenting the power-domains property.
> >
> > Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > index e955034da53b86e2..0dad87cdd8735542 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -51,6 +51,9 @@ properties:
> >    resets: true
> >    reset-names: true
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
>
> Mind if I move this just before resets: ? I can handle it when applying.

Probably you will start minding once you have read the (out-of-context)
comment above all grouped ": true" properties above....

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

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
