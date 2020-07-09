Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495C621A505
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 18:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202C96E42D;
	Thu,  9 Jul 2020 16:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525456E42D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 16:44:05 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F8172077D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594313045;
 bh=L7QAL8lLLumFtYMjQECXrFQsCftj7J1a3RLe7kGg4jE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Sr9bqUrUJxcwi5HS1CgSWWGaqFMTqqcOY8byhe06CPkksoKQvMLzFgC0iVZoWUGuC
 12SSqbhZNMN7Edmkf4m/TDZaS+lNdJ9L1nca37gu9xoki6klAu+9wmNMFD2hgTEFTR
 H5I1clHpa4/DGUI+mNJmjebu7pVIGSaiopXDA0Go=
Received: by mail-oi1-f169.google.com with SMTP id t198so2394748oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 09:44:05 -0700 (PDT)
X-Gm-Message-State: AOAM533F4Df4EhIyxAtWy35jZvC2p+DO8zFsTrhxRP+iaefXdCjjnUt9
 ojTmi5a0yoz8FSWD8zprcf2ajXbulDEXrOqifA==
X-Google-Smtp-Source: ABdhPJwuJLOgE4dZrJb/0wVo3GpaQESIDFZRLbjdN78LiqQVgkh5D4In9QEr2TPSL5gQzegA25PHztiQWy7EmbrkWy4=
X-Received: by 2002:aca:30d2:: with SMTP id w201mr810251oiw.147.1594313044489; 
 Thu, 09 Jul 2020 09:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200704143544.789345-1-sam@ravnborg.org>
 <20200704143544.789345-2-sam@ravnborg.org>
 <CAMuHMdXWXk=QUbpFeX6bjwp+JWKgHqiQALTdQJgSgwBRkyvkRA@mail.gmail.com>
 <20200704212615.GA1693435@ravnborg.org>
In-Reply-To: <20200704212615.GA1693435@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Jul 2020 10:43:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+T8QZmH3RSx-mj_HPE0qW0pemRE6rYV9-QEbooa-oiVg@mail.gmail.com>
Message-ID: <CAL_Jsq+T8QZmH3RSx-mj_HPE0qW0pemRE6rYV9-QEbooa-oiVg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: fix simple-framebuffer example
To: Sam Ravnborg <sam@ravnborg.org>
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
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 4, 2020 at 3:26 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sat, Jul 04, 2020 at 11:03:21PM +0200, Geert Uytterhoeven wrote:
> > Hi Sam,
> >
> > Thanks for your patch!
> >
> > On Sat, Jul 4, 2020 at 4:37 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > Now that dt-extract-example gained support for using root nodes
> > > in examples, update the example for the simple-frambuffer binding to use it.
> >
> > simple-framebuffer
> Thanks, will fix.
>
> >
> > > This gives us a better example and kill a long standing warning:
> > >
> > > simple-framebuffer.example.dts:23.16-39.11:
> > > Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> > >
> > > Note: To get the update dt-extract-example execute:
> > > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >
> > > --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > > +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > > @@ -152,28 +152,29 @@ additionalProperties: false
> > >
> > >  examples:
> > >    - |
> > > -    aliases {
> > > -      display0 = &lcdc0;
> >
> > Why drop the aliases example?
> I did not see it had any value for the binding that the example shall
> demonstrate. But it was not somthing I have given much thought of.

I don't think anything actually supports 'display' aliases and it is
beyond the scope of this binding, so I'd drop.

stdout-path should be dropped too as it points to this.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
