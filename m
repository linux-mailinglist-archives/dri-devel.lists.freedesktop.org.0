Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91E4FFE35
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 20:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAA710E21F;
	Wed, 13 Apr 2022 18:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2511E10E2FF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 18:53:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BEF2619FC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 18:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCFCC385AE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649875994;
 bh=+b/3aEisGHFiXRfEXwGkQ8elGx5edRKC+eZFp8mRdN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qEJZEnsIXHeUegVdo32QCL6tUzkY0bm9NIWRJija2QSjMOd+J9uvyZp7E4/1SZZuM
 vPR+rp3xXcKvLwj0cZgkr051fdgbTvxq0Bmgi3Uk1CmRiZ4skeVFLioCuJyBKq7DSx
 b1ufxihZ1o1t6XhA4Jgf101SoyPB/x/vRdkMDOoT58JL8fJFHhdYrkJMtjn95ktSYx
 grgqrz2oL5jgQ4fjHXlGUGHgkGrSIlgj3ptkjHiN6tCZibWXc5hbtxMm2fUOvVXqdm
 kbDUL/z/SUCiY3MrbhaoTtbanRKLKF+tUuSNi86FymuLX5LDDXICmB8OcDNLyhCmfB
 5smGqTxrSAv8w==
Received: by mail-io1-f45.google.com with SMTP id r2so2927202iod.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 11:53:13 -0700 (PDT)
X-Gm-Message-State: AOAM533upOAba/otTNtZx4e6XEnWr5vyd8tSohf1NSKjtOn09a/FT6vG
 Xv01UVeXoK5pE5ngnOGK3WPVuLGJaFs0urFl4Q==
X-Google-Smtp-Source: ABdhPJx8aDr1E+tCrRAFbG+lY50PvgkTHBZ9KMQKWYl31B/+g1cB6zkeaCnf+kqIY0ywg9/I8Uks5DznbHfKVJ0teLA=
X-Received: by 2002:a05:6602:27c5:b0:631:a30f:143a with SMTP id
 l5-20020a05660227c500b00631a30f143amr18552265ios.40.1649875992993; Wed, 13
 Apr 2022 11:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
 <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
 <CAL_JsqJdYjd=P4Nhd9E+=OjOb2A-=_txBUtWsDL1FWqZ0phD+g@mail.gmail.com>
In-Reply-To: <CAL_JsqJdYjd=P4Nhd9E+=OjOb2A-=_txBUtWsDL1FWqZ0phD+g@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 13 Apr 2022 13:53:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKGXNJFPe3wt4O8ns1xzopNg4AtWYcZWDbtaP+F22omrw@mail.gmail.com>
Message-ID: <CAL_JsqKGXNJFPe3wt4O8ns1xzopNg4AtWYcZWDbtaP+F22omrw@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 eOn Wed, Apr 13, 2022 at 1:46 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Apr 13, 2022 at 12:58 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 13.04.22 um 14:51 schrieb Rob Herring:
> > > On Wed, Apr 13, 2022 at 4:24 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >>
> > >> Create a platform device for each OF-declared framebuffer and have
> > >> offb bind to these devices. Allows for real hot-unplugging and other
> > >> drivers besides offb.
> > >>
> > >> Originally, offb created framebuffer devices while initializing its
> > >> module by parsing the OF device tree. No actual Linux device was set
> > >> up. This tied OF framebuffers to offb and makes writing other drivers
> > >> for the OF framebuffers complicated. The absence of a Linux device
> > >> prevented real hot-unplugging. Adding a distinct platform device for
> > >> each OF framebuffer solves both problems. Specifically, a DRM drivers
> > >> can now provide graphics output with modern userspace.
> > >>
> > >> Some of the offb init code is now located in the OF initialization.
> > >> There's now also an implementation of of_platform_default_populate_init(),
> > >> which was missing before. The OF side creates different devices for
> > >> either OF display nodes or bootx displays as they require different
> > >> handling by the driver. The offb drivers picks up each type of device
> > >> and runs the appropriate fbdev initialization.
> > >>
> > >> Tested with OF display nodes on qemu's ppc64le target.
> > >>
> > >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >> ---
> > >>   drivers/of/platform.c      | 73 ++++++++++++++++++++++++++--
> > >>   drivers/video/fbdev/offb.c | 98 +++++++++++++++++++++++++-------------
> > >>   2 files changed, 134 insertions(+), 37 deletions(-)
> > >>
> > >> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > >> index a16b74f32aa9..4c63b9a73587 100644
> > >> --- a/drivers/of/platform.c
> > >> +++ b/drivers/of/platform.c
> > >> @@ -447,6 +447,60 @@ int of_platform_bus_probe(struct device_node *root,
> > >>   }
> > >>   EXPORT_SYMBOL(of_platform_bus_probe);
> > >>
> > >> +static int __init of_platform_populate_framebuffers(void)
> > >> +{
> > >> +       struct device_node *boot_display = NULL;
> > >> +       struct device_node *node;
> > >> +       struct platform_device *dev;
> > >> +       int ret;
> > >> +
> > >> +       node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> > >> +       of_platform_device_create(node, NULL, NULL);
> > >> +       of_node_put(node);
> > >> +
> > >
> > > The rest is PPC only, so bail out here if !PPC.
> > >
> > >> +       /* Check if we have a MacOS display without a node spec */
> > >> +       if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL)) {
> > >> +               /*
> > >> +                * The old code tried to work out which node was the MacOS
> > >> +                * display based on the address. I'm dropping that since the
> > >> +                * lack of a node spec only happens with old BootX versions
> > >> +                * (users can update) and with this code, they'll still get
> > >> +                * a display (just not the palette hacks).
> > >> +                */
> > >> +               dev = platform_device_alloc("bootx-noscreen", 0);
> > >> +               if (WARN_ON(!dev))
> > >> +                       return -ENOMEM;
> > >> +               ret = platform_device_add(dev);
> > >> +               if (WARN_ON(ret)) {
> > >> +                       platform_device_put(dev);
> > >> +                       return ret;
> > >> +               }
> > >> +       }
> > >> +
> > >> +       /*
> > >> +        * For OF framebuffers, first create the device for the boot display,
> > >> +        * then for the other framebuffers. Only fail for the boot display;
> > >> +        * ignore errors for the rest.
> > >> +        */
> > >> +       for_each_node_by_type(node, "display") {
> > >> +               if (!of_get_property(node, "linux,opened", NULL) ||
> > >> +                   !of_get_property(node, "linux,boot-display", NULL))
> > >> +                       continue;
> > >> +               dev = of_platform_device_create(node, "of-display", NULL);
> > >> +               if (WARN_ON(!dev))
> > >> +                       return -ENOMEM;
> > >> +               boot_display = node;
> > >> +               break;
> > >> +       }
> > >> +       for_each_node_by_type(node, "display") {
> > >> +               if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
> > >> +                       continue;
> > >> +               of_platform_device_create(node, "of-display", NULL);
> > >> +       }
> > >> +
> > >> +       return 0;
> > >> +}
> > >> +
> > >>   /**
> > >>    * of_platform_populate() - Populate platform_devices from device tree data
> > >>    * @root: parent of the first level to probe or NULL for the root of the tree
> > >> @@ -541,9 +595,7 @@ static int __init of_platform_default_populate_init(void)
> > >>                  of_node_put(node);
> > >>          }
> > >>
> > >> -       node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> > >> -       of_platform_device_create(node, NULL, NULL);
> > >> -       of_node_put(node);
> > >> +       of_platform_populate_framebuffers();
> > >>
> > >>          /* Populate everything else. */
> > >>          of_platform_default_populate(NULL, NULL, NULL);
> > >
> > > I'm pretty sure it's just this call that's the problem for PPC though
> > > none of the above existed when adding this caused a regression. Can we
> > > remove the ifdef and just make this call conditional on
> > > !IS_ENABLED(CONFIG_PPC).
> >
> > Together with the changes in of_platform_populate_framebuffers(), the
> > code is more or less an "if-else" depending on PPC. I'll drop
> > of_platform_populate_framebuffers() from the patch and make a separate
> > implementation of of_platform_default_populate_init for PPC. Seems like
> > the easiest solution to me.
>
> That just moves us farther from PPC ever using
> of_platform_default_populate_init(). But I don't know that anyone in
> PPC cares about that, so fine I guess.

Actually, no. Make it work with IS_ENABLED(CONFIG_PPC) rather than an
#ifdef. Currently, I don't have to build this (or any of drivers/of/)
for PPC because it is IS_ENABLED(CONFIG_PPC) everywhere. Yes, there's
an #ifdef already, but there's not an #else and no PPC only code
compiled.

Rob
