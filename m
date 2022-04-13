Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BBE4FFE1C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 20:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4BC10E1D0;
	Wed, 13 Apr 2022 18:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB77F10E1D0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 18:46:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FB92B8272B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 18:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75CCC385AD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649875589;
 bh=ysrPtaTYb8EyW5VHJIP8kmaecK5XOai6g/Tx5uvuzMc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HifCVjTyYmnCyys0GagMzajpFi5s2br8b7c+XHv7DHYIJzrdFhnAbBf3FkZu3qSWP
 s17MFMgODFGfpkBV5AscPelCEh6z0AhZgHVzb9rbTw/jrao+66i+tH/JLlcBF2kVXQ
 KTctZBJL3Q1a7/12vV6yV9E4S3g+SXq6W2qPxQliijDSkdF1sA9+98+beDedPiCOua
 A7qtMNXhn1Qysd/O9HOH0mIQfCarGoETMkb3v/Gox0CQEbmKoLUoKLjxO/13qnmuip
 kSC2loFpBokA9hshSpQ3RaojFDk8A9Gw6Rck9OwXpeFMZAGhtl0WYRH6CjSXryMQh7
 OyrSBCBCfTzVg==
Received: by mail-io1-f53.google.com with SMTP id p21so2929972ioj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 11:46:29 -0700 (PDT)
X-Gm-Message-State: AOAM530cwkjqudRt8zjvJYcaIDH1V64RV1xbTyCQ3+pDzM21KuqHlH3Q
 f43xZuGS0aih+ys8tu4cW6G1mgEM1nbrv8nl4Q==
X-Google-Smtp-Source: ABdhPJxBoCyvmmSYBlR3CPMXkWfpbJbFlu0q65XwYXKzyqlRpm9qS1dexycZeKMQZVXe6ksNkSG9HXnYOujJ9Kbb334=
X-Received: by 2002:a02:1107:0:b0:321:78dc:890d with SMTP id
 7-20020a021107000000b0032178dc890dmr22807402jaf.236.1649875588926; Wed, 13
 Apr 2022 11:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
 <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
In-Reply-To: <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 13 Apr 2022 13:46:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdYjd=P4Nhd9E+=OjOb2A-=_txBUtWsDL1FWqZ0phD+g@mail.gmail.com>
Message-ID: <CAL_JsqJdYjd=P4Nhd9E+=OjOb2A-=_txBUtWsDL1FWqZ0phD+g@mail.gmail.com>
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

On Wed, Apr 13, 2022 at 12:58 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 13.04.22 um 14:51 schrieb Rob Herring:
> > On Wed, Apr 13, 2022 at 4:24 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Create a platform device for each OF-declared framebuffer and have
> >> offb bind to these devices. Allows for real hot-unplugging and other
> >> drivers besides offb.
> >>
> >> Originally, offb created framebuffer devices while initializing its
> >> module by parsing the OF device tree. No actual Linux device was set
> >> up. This tied OF framebuffers to offb and makes writing other drivers
> >> for the OF framebuffers complicated. The absence of a Linux device
> >> prevented real hot-unplugging. Adding a distinct platform device for
> >> each OF framebuffer solves both problems. Specifically, a DRM drivers
> >> can now provide graphics output with modern userspace.
> >>
> >> Some of the offb init code is now located in the OF initialization.
> >> There's now also an implementation of of_platform_default_populate_init(),
> >> which was missing before. The OF side creates different devices for
> >> either OF display nodes or bootx displays as they require different
> >> handling by the driver. The offb drivers picks up each type of device
> >> and runs the appropriate fbdev initialization.
> >>
> >> Tested with OF display nodes on qemu's ppc64le target.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>   drivers/of/platform.c      | 73 ++++++++++++++++++++++++++--
> >>   drivers/video/fbdev/offb.c | 98 +++++++++++++++++++++++++-------------
> >>   2 files changed, 134 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> >> index a16b74f32aa9..4c63b9a73587 100644
> >> --- a/drivers/of/platform.c
> >> +++ b/drivers/of/platform.c
> >> @@ -447,6 +447,60 @@ int of_platform_bus_probe(struct device_node *root,
> >>   }
> >>   EXPORT_SYMBOL(of_platform_bus_probe);
> >>
> >> +static int __init of_platform_populate_framebuffers(void)
> >> +{
> >> +       struct device_node *boot_display = NULL;
> >> +       struct device_node *node;
> >> +       struct platform_device *dev;
> >> +       int ret;
> >> +
> >> +       node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> >> +       of_platform_device_create(node, NULL, NULL);
> >> +       of_node_put(node);
> >> +
> >
> > The rest is PPC only, so bail out here if !PPC.
> >
> >> +       /* Check if we have a MacOS display without a node spec */
> >> +       if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL)) {
> >> +               /*
> >> +                * The old code tried to work out which node was the MacOS
> >> +                * display based on the address. I'm dropping that since the
> >> +                * lack of a node spec only happens with old BootX versions
> >> +                * (users can update) and with this code, they'll still get
> >> +                * a display (just not the palette hacks).
> >> +                */
> >> +               dev = platform_device_alloc("bootx-noscreen", 0);
> >> +               if (WARN_ON(!dev))
> >> +                       return -ENOMEM;
> >> +               ret = platform_device_add(dev);
> >> +               if (WARN_ON(ret)) {
> >> +                       platform_device_put(dev);
> >> +                       return ret;
> >> +               }
> >> +       }
> >> +
> >> +       /*
> >> +        * For OF framebuffers, first create the device for the boot display,
> >> +        * then for the other framebuffers. Only fail for the boot display;
> >> +        * ignore errors for the rest.
> >> +        */
> >> +       for_each_node_by_type(node, "display") {
> >> +               if (!of_get_property(node, "linux,opened", NULL) ||
> >> +                   !of_get_property(node, "linux,boot-display", NULL))
> >> +                       continue;
> >> +               dev = of_platform_device_create(node, "of-display", NULL);
> >> +               if (WARN_ON(!dev))
> >> +                       return -ENOMEM;
> >> +               boot_display = node;
> >> +               break;
> >> +       }
> >> +       for_each_node_by_type(node, "display") {
> >> +               if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
> >> +                       continue;
> >> +               of_platform_device_create(node, "of-display", NULL);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   /**
> >>    * of_platform_populate() - Populate platform_devices from device tree data
> >>    * @root: parent of the first level to probe or NULL for the root of the tree
> >> @@ -541,9 +595,7 @@ static int __init of_platform_default_populate_init(void)
> >>                  of_node_put(node);
> >>          }
> >>
> >> -       node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> >> -       of_platform_device_create(node, NULL, NULL);
> >> -       of_node_put(node);
> >> +       of_platform_populate_framebuffers();
> >>
> >>          /* Populate everything else. */
> >>          of_platform_default_populate(NULL, NULL, NULL);
> >
> > I'm pretty sure it's just this call that's the problem for PPC though
> > none of the above existed when adding this caused a regression. Can we
> > remove the ifdef and just make this call conditional on
> > !IS_ENABLED(CONFIG_PPC).
>
> Together with the changes in of_platform_populate_framebuffers(), the
> code is more or less an "if-else" depending on PPC. I'll drop
> of_platform_populate_framebuffers() from the patch and make a separate
> implementation of of_platform_default_populate_init for PPC. Seems like
> the easiest solution to me.

That just moves us farther from PPC ever using
of_platform_default_populate_init(). But I don't know that anyone in
PPC cares about that, so fine I guess.

Rob
