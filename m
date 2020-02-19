Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D645164A93
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCA688905;
	Wed, 19 Feb 2020 16:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19F688905
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:37:09 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j132so24394514oih.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7rRoePCXLenJKJs25759T+dJnc77Ex7N5JA7PK6Z3+Q=;
 b=Wwf90s/R23UCbRhfGS22sWeYcuAehMIIkDiw8Dqvv0ZMpfewQcPKI01lncDKqOoCrq
 chD1Rb82EbLlqK68BCeLFdXN7LgwmhkNaljckXkpA9PLl26eRAuvWUfh0NNoNJD5UJ+e
 /X3CwaIKcRXqrmxYXaMMUcLkwt0GLWD+XHoqDX9KEi8NwCLOcY+FC6NHhq0LnRoaIh8C
 ezFCzx9koPNaur4QZeEQrR6rbo59YVbLlrjHhYhPX/M2rBw9+mZ8YgLwDnoJkHpZLdIQ
 CJdpc6L8s5Zmgo3tvIVlDtucIbagpnwptboyY87gBlHAd/LmgNyxs4nh9p46cUJRys++
 V2Gw==
X-Gm-Message-State: APjAAAVy2ox7l00HfpiwWEDQJ394Ejp+FkHs8j4bhYQebmc8rS1kD5sY
 a5EbzAMBKKcSD0sqN90BW4xoXP6q5Fts418r6vg=
X-Google-Smtp-Source: APXvYqx08pSGJcuoMLIaR52zuY8+/osu9/5KPYAmb+0hdBw22ViVlz/NPC2E9/o34osIcYjKCbe3wLnFRo24kXZb+IM=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr5348791oia.102.1582130228412; 
 Wed, 19 Feb 2020 08:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20200214082623.4893-1-geert+renesas@glider.be>
 <20200219160410.GX5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219160410.GX5070@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2020 17:36:57 +0100
Message-ID: <CAMuHMdVEW1pjg=mf55dzi0uJ6f-qQCGXzzvTikffX+JAeJQEsQ@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: display: renesas: du: Document optional
 reset properties
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Feb 19, 2020 at 5:04 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Feb 14, 2020 at 09:26:23AM +0100, Geert Uytterhoeven wrote:
> > Document the optional properties for describing module resets, to
> > support resetting display channels on R-Car Gen2 and Gen3.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Rob Herring <robh@kernel.org>

> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > @@ -50,6 +50,14 @@ Required Properties:
> >      VSP instance that serves the DU channel, and the channel index identifies
> >      the LIF instance in that VSP.
> >
> > +Optional properties:
> > +  - resets: A list of phandle + reset-specifier pairs, one for each entry in
> > +    the reset-names property.
> > +  - reset-names: Names of the resets. This property is model-dependent.
> > +    - All but R8A7779 use one reset for a group of one or more successive
> > +      channels. The resets must be named "du.x" with "x" being the numerical
> > +      index of the lowest channel in the group.
>
> I've now reviewed the patches that add those properties to our .dtsi
> files, and I wonder how we should handle the two SoCs that have DU0, DU1
> and DU3, but not DU2. The reset resource is tied to a group of two
> channels, so we would use du.0 and du.2 respectively, but that conflicts
> with the above text.
>
> I'm trying to think about the implementation on the driver side, where
> group resources are associated with a group object, whose index is
> computed by dividing the channel number by 2. We could have a special
> case in group initialization that uses du.3 instead of du.2 for the
> second group.
>
> What do you think ? Probably overkill, and we should go for du.3 ?

The "division by 2" rule is valid for R-Car Gen3, but not for R-Car
Gen2, where there is only a single reset for all channels.

Originally we had "du.0-1" and "du.2-3" (hmm, somehow I missed adding
this to the changelog for the bindings,  but it is present in the
changelog for the DTS files), but after switching to "du.0" and "du.2",
I always envisioned implementing this by finding a "du.x" reset by
looping from the current channel index to 0.  That algorithm works for all
supported SoCs (irrespective of naming the second reset on R-Car H3-N
and M3-N "du.2" or "du.3" ;-)

As per your comment about single resets, we could drop reset-names on
R-Car Gen2, but doing so would mean another special case in the driver.

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
