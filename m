Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC753B1AC5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848696E8D9;
	Wed, 23 Jun 2021 13:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596326E8D9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 13:09:18 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id r4so827466uap.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 06:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2GyvRMqzd0j7dU3QjG5cKA3SND3uzGcIE5fba+nRyaE=;
 b=fncO9XKGAZpf77AxDPDoUrWBAhKzoX/l6kApkXHFL5LwJq0Tnv1+nJDKVF9nOcva9n
 +iMmgUgIP2HvW0bGOTjVMELrr/gMvccBwGDO7bYOKfIBsmPgKIWyqkAwNwOsV0Bhyeoz
 iW3MPI6Tbd0hmjnnbHFDwgWn5BEWamhKYamh5bigPd+8QCL5rXNstrl2jF2WR8WOsndd
 30zMlqKmSvM9tnwT0a43Je4ecJHP1kRdcq/aMqxbB6DwKJX/JxnnKn0kLa2f0vVzS0nm
 NBq7P6Tts6OXonk4fyt4qc/evATWD1JWPn7Co44eUE/2D3K/ZyMEnvbC4Mga/GPwvk2e
 BEHg==
X-Gm-Message-State: AOAM531Wsgct4ebRiSCuEnCp3N/NTv0l/xsvm7Lu16rWe+UbMi61iieI
 6UvD4ips4Q5cQ18Paferp+8vTe7cAp5XknSx1Xo=
X-Google-Smtp-Source: ABdhPJy7fEj+42hR8loz80KZeBpk8m6cSVSkPMGaM+vOPsqzJ7EuBgra5HjzbA2XO5FoOuNmfwqhB3mqOHbBdX7nzSE=
X-Received: by 2002:ab0:1e4c:: with SMTP id n12mr4441015uak.58.1624453757600; 
 Wed, 23 Jun 2021 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
 <YNMv2KSjbwX5aAK2@pendragon.ideasonboard.com>
In-Reply-To: <YNMv2KSjbwX5aAK2@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Jun 2021 15:09:06 +0200
Message-ID: <CAMuHMdXJTCyfMX3nN6pbAHeqqf5OCqJR4+7GJ=71+o1iKRrHhg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,
 du: Provide bindings for r8a779a0
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Jun 23, 2021 at 2:58 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jun 23, 2021 at 02:53:33PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham wrote:
> > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> > >
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > @@ -39,6 +39,7 @@ properties:
> > >        - renesas,du-r8a77980 # for R-Car V3H compatible DU
> > >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> > >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > > +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -774,6 +775,57 @@ allOf:
> > >          - reset-names
> > >          - renesas,vsps
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,du-r8a779a0
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: Functional clock for DU0
> > > +            - description: Functional clock for DU1
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: du.0
> > > +            - const: du.1
> >
> > The hardware block has only a single function clock for both channels,
> > like on R-Car H1.
> >
> > And what about DU_DOTCLKIN?
>
> As far as I can tell, there's no DU_DOTCLKIN in V3U.

See Table 6.13 of the Hardware User's Manual, pin IPC_CLKIN.
Note that the register bits to configure it are present in
drivers/pinctrl/renesas/pfc-r8a779a0.c, but the actual pin group is
missing.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
