Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FEB1D3AEF
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E76889CAD;
	Thu, 14 May 2020 19:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC9089BA3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:03:06 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w22so3081213otp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NuQFLQ72I0J0DKeS9L7b1iMxSobCW1C+Qb2KkEUowaM=;
 b=bKxxNbKoaoj91eCAhwYbAX5pe44cGggN+aVaWXMcjVyq2w/jiVHgVwqH0GAPJ2aDr+
 zV5Dphwz86uhlFepc9cyMH7nLnnxSBw9MKUFQBfCRL/sxVFua+KZ85k/qWbxz3v0fUlT
 LDsLeBfazezSzAc6zJhxF0GdUmk8i6DlNrWdBMKGVxpUrLrFVYBA5cDynkG8ajsAplWf
 +JwIUdiHM/51gVk6aURtRtNNb/pEaGFrfrUhf7M1p3/1mquaJve6rKC+hUouQ3KZvw7y
 ZF3B/isi1fGjtvvymZvIjw3xMQy3fVhci3oD94xlAp5d0dYG1wP3nPX6u37BrS8MGL6K
 aXFg==
X-Gm-Message-State: AOAM531vW38e9XCXz0+KpIgt/Cb3bXyTkVbnm+J8sGZhjfP2oySXOGy/
 /tjSuernOmEnz1DKBqwYja1ES8KaRl7Pw/5Dm1s=
X-Google-Smtp-Source: ABdhPJxS/x6khHmLb+BuWxzhx5jsDw8uFHomhEbhTkk23nKiA6DF1SpbqxI4DkSPB4fSmxLf/QvEVGoNgyYH9rONp9Q=
X-Received: by 2002:a9d:564:: with SMTP id 91mr4736276otw.250.1589482986051;
 Thu, 14 May 2020 12:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
 <20200514151721.GF5955@pendragon.ideasonboard.com>
In-Reply-To: <20200514151721.GF5955@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 May 2020 21:02:54 +0200
Message-ID: <CAMuHMdVrO8WfKVdp2wONSYg=cbK=CWyXMyC+Hqv4tkiuCm5WAQ@mail.gmail.com>
Subject: Re: [PATCH v1.1 4/4] dt-bindings: display: bridge: renesas,lvds:
 Convert binding to YAML
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, May 14, 2020 at 5:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, May 14, 2020 at 09:31:53AM +0200, Geert Uytterhoeven wrote:
> > On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart wrote:
> > > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Acked-by: Maxime Ripard <mripard@kernel.org>
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> >
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > > +
> > > +    lvds@feb90000 {
> > > +        compatible = "renesas,r8a7795-lvds";
> > > +        reg = <0 0xfeb90000 0 0x14>;
> >
> > #{address,size}-cells = <1> for examples.
> > Applies to all nodes below, too.
>
> Why ?

See "[PATCH 5/5] dt-bindings: Fix incorrect 'reg' property sizes"
https://lore.kernel.org/linux-devicetree/20200512204543.22090-5-robh@kernel.org/

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
