Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AE3AAD64
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 09:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD35A6E884;
	Thu, 17 Jun 2021 07:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657BB6E884
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 07:22:53 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id c17so1743591uao.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 00:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cEv8QQ6il/6NkwppAWjKCYYqz8xPWh7pjmkGPTD+a34=;
 b=hl/w2FQ7wF6vR3FkOOO9dbFhiWfHr98VyCZH/c9zHXAEPRRs0Ib2IFo4X7n8/6nTQR
 gUlVm4QuFv3jUE7vWccNy6CNaHwwezFIZ61F5oeCh/k1WS33ngYYaukxSzcEKNBBizzW
 XXS7iaKezCf0IXEho6iGNPuWP8h59Jpvli4AdTfziNlATL9+4t6BQaszy0LrOgq8JVdy
 VdrNpTk7dQ72vGnY+0E1J9zu8kC3629U3UUDV5dqzMOgtz5CNc9HJJWnF0W3hkC/BAcR
 BhL4R4nFYYYz8jShkdIWMlEH2OkSO9AKLYPuxh2Seubu1KphM5LXlbhJwDmdDYuwQ0Xx
 b+uw==
X-Gm-Message-State: AOAM532yAQMn6WJRTF8pQv48YxZ0ES264R8+xvOYU73Kd6IZn4o9Yr47
 DoRtgrqxdvwYTuu9a/PV6S0P/EXVwQO78YlKkMc=
X-Google-Smtp-Source: ABdhPJwMcA0YpYRPCJAZ9bnGz/2Pg25idgRHpclYxTS0kaMVMyFb5dPU4W1UkU43d9V5qdplDXdplYoI8kdY08U/tJ4=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr3877741ual.2.1623914572130;
 Thu, 17 Jun 2021 00:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <2da75fd2e971dfab8dd05a2a28bb1d6d9cbe5adb.1619700420.git.geert+renesas@glider.be>
 <YIrU+tdcfQ/6ODRz@pendragon.ideasonboard.com>
 <YMqsAkFfAU02t4oD@pendragon.ideasonboard.com>
In-Reply-To: <YMqsAkFfAU02t4oD@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Jun 2021 09:22:40 +0200
Message-ID: <CAMuHMdWe-84ga-f4GC7h+jZnAPu5ayvV=xnB7mNgQs3XqRVW=w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas, du: Make resets optional on
 R-Car H1
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
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, Jun 17, 2021 at 3:57 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Apr 29, 2021 at 06:47:06PM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 29, 2021 at 02:47:31PM +0200, Geert Uytterhoeven wrote:
> > > The "resets" property is not present on R-Car Gen1 SoCs.
> > > Supporting it would require migrating from renesas,cpg-clocks to
> > > renesas,cpg-mssr.
> > >
> > > Reflect this in the DT bindings by removing the global "required:
> > > resets".  All SoCs that do have "resets" properties already have
> > > SoC-specific rules making it required.
> >
> > Should we drop the
> >
> >         resets:
> >         maxItems: 1
> >
> > from renesas,du-r8a7779 then ? And maybe the
> >
> >   resets: true
> >
> > in the general case ?
>
> Any opinion on this ?

Oops, I did reply to this on April 29, but accidentally dropped
all CCs, which made it disappear from your radar, too?

| R-Car H1 does have a reset controller, we just don't have support for
| it in the DT bindings and Linux driver yet.  So from that point of view
| it makes sense to keep it.
|
| Of course we can remove it, and re-add it later if we ever add support,
| as at that time we probably will want to change the bindings anyway
| to make it required again.

And you replied on April 30, also in private:

|> R-Car H1 does have a reset controller, we just don't have support for
| > it in the DT bindings and Linux driver yet.  So from that point of view
| > it makes sense to keep it.
|
| Not sure what we would "keep", given that there's no reset controller
| available :-)
|
| > Of course we can remove it, and re-add it later if we ever add support,
| > as at that time we probably will want to change the bindings anyway
| > to make it required again.
|
| Let's not bother. I doubt H1 will get support for a reset controller as
| that's an old platform, and the DT bindings thus don't matter too much.
| I'll take this patch as-is.
|
| Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > > Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > index 552a99ce4f1280d7..e955034da53b86e2 100644
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > @@ -89,7 +89,6 @@ required:
> > >    - reg
> > >    - clocks
> > >    - interrupts
> > > -  - resets
> > >    - ports
> > >
> > >  allOf:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
