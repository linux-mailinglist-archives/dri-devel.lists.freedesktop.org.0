Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C774CAAF8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AF410ED20;
	Wed,  2 Mar 2022 17:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CF410ED20
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:00:22 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id e26so2588991vso.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 09:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/CQ2tRN20O0vTd2HoHl5grBk0Fd3L9QBnj1oPiNL2hc=;
 b=50/Ew1CDecqU3YUvfQwpDk0S3VQu0HY/wVCaBB4xovsGH9wtjalnRmrRjwzBFd1F88
 LQTpBag2vrTXZQsgYdrgaZ5tQ0cJ5TDqgC2k7nJNdw7Vr5AD2nXq+wDlXLidLJS2eQQw
 MJcdGJ3P+lHQ/NpZz6yu2gRFahELeNhAggfqu9ilgENRQhWaPioLx6WYLs9IbbH8ppt+
 kRj8u+Z8QEAX5G4tlc+Lt+essueftacAB0v0d03Jd9deTYK3PHo/jqv5hU6vcztHyjbz
 AIwREP2kaLKbuBDo2ockiJZbh0Gz4PaS4BdA8LLURFePwH4dfZfPryeaHMzZTRCixM/d
 VUPQ==
X-Gm-Message-State: AOAM532FkP3iAEPIDcI23NBabNYRydyoBkEGl5nFmIB7t03rnDLURGGi
 twEYe4I6TD2UDXZw+WOfIBw8u5SI43PZ2Q==
X-Google-Smtp-Source: ABdhPJz1PBPPHwTtO3cK0gq8SSc+iGM1G+JfiODdSutxX/E5nhd0KGhC9+kRb6fUxSg9k2PzM0dP4A==
X-Received: by 2002:a67:d81e:0:b0:31b:a09a:1c4d with SMTP id
 e30-20020a67d81e000000b0031ba09a1c4dmr13948532vsj.0.1646240421239; 
 Wed, 02 Mar 2022 09:00:21 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05610234f200b0031b441be417sm2265508vsb.15.2022.03.02.09.00.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 09:00:20 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id g20so2567396vsb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 09:00:20 -0800 (PST)
X-Received: by 2002:a67:c499:0:b0:320:2cd8:9e1a with SMTP id
 d25-20020a67c499000000b003202cd89e1amr1008147vsk.38.1646240419913; Wed, 02
 Mar 2022 09:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-4-nikita.yoush@cogentembedded.com>
 <YcyRAk/d2728mDgH@pendragon.ideasonboard.com>
In-Reply-To: <YcyRAk/d2728mDgH@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Mar 2022 18:00:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkgEwgSEBrNt57nMPuMvyCSPsSbKFuQTGX8qX0-mrDLA@mail.gmail.com>
Message-ID: <CAMuHMdWkgEwgSEBrNt57nMPuMvyCSPsSbKFuQTGX8qX0-mrDLA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: bridge: renesas, lvds: Document
 r8a77961 bindings
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 29, 2021 at 5:47 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Dec 24, 2021 at 08:23:09AM +0300, Nikita Yushchenko wrote:
> > Document the R-Car M3-W+ (R8A77961) SoC in the R-Car LVDS encoder
> > bindings.
> >
> > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> > ---
> >  .../devicetree/bindings/display/bridge/renesas,lvds.yaml         | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > index acfc327f70a7..ca5443e5c2e3 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > @@ -27,6 +27,7 @@ properties:
> >        - renesas,r8a7791-lvds # for R-Car M2-W compatible LVDS encoders
> >        - renesas,r8a7793-lvds # for R-Car M2-N compatible LVDS encoders
> >        - renesas,r8a7795-lvds # for R-Car H3 compatible LVDS encoders
> > +      - renesas,r8a77961-lvds # for R-Car M3-W+ compatible LVDS encoders
>
> I'll move this line after the next to keep them sorted. No need to
> resubmit.

Any chance this will happen soon? Same for patch 1/3 .
Patch 2/3 is already queued in soc/for-next.

Thank you!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
