Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096B336551E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A626E4E3;
	Tue, 20 Apr 2021 09:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6394A6E4D0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:16:22 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id d25so12389928vsp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 02:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uP55GvNxmqa154x7zBMI5pifzTMvppax2nMlHT01uhQ=;
 b=iTQnWMSmV5Ypl14cE07CFSPT3vDE7nSY7hFhwpDoEgzrh/voYkuD6GQ/1yTpu7iOZ2
 ynQdKht6tmhIdQ4AES5+Xd7tASMvsbbSf8EDl7CFAyFB6Hj7KpNfzBgWMjj/yTbSRjtt
 bbsX2AscUD5ukE8h45W0JvJ/DHr6vDA6Rn8zsSO9YE4T2meDqiE+W6RlK7+f/CvQWxeH
 HgRMVN+YIH20z/QZvZvbJ8RKsxdLn77w9QtWZ55wTPBAFTAD6oF3Ulve4YV2PVOR42FO
 8zBGRMi2A4rkPGeXx+StZh1sdla/2I3Px2GlRnIZhftRRrbIITz1lL31r9bSON7T49yR
 IXHg==
X-Gm-Message-State: AOAM533XSx6XDNitLEJE9fR95nlLWZTsXKhWOeCKn+az8mA2l6QDZ3az
 +id+VsGhuyYhyKyOfAhSSlxxSCuupOsppGY0UMA=
X-Google-Smtp-Source: ABdhPJyqjmGX3OnB4biL5E0m5o4GJ98N03BW81GWgSF08q3NwpxNGSQhoujnYb0pAPeIay+ye8/EKvIXD8MRF5C4Bbw=
X-Received: by 2002:a67:fc57:: with SMTP id p23mr19084812vsq.40.1618910181231; 
 Tue, 20 Apr 2021 02:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
In-Reply-To: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Apr 2021 11:16:09 +0200
Message-ID: <CAMuHMdU7BXN0P29wqWo2w3BWr=vQ=UHZHUnfFbMC--29ZBph-w@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Apr 20, 2021 at 10:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, Apr 19, 2021 at 10:00:56AM +0200, Geert Uytterhoeven wrote:
> > On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > This patchset adds support for simple-framebuffer platform devices and
> > > a handover mechanism for native drivers to take-over control of the
> > > hardware.
> > >
> > > The new driver, called simpledrm, binds to a simple-frambuffer platform
> > > device. The kernel's boot code creates such devices for firmware-provided
> > > framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> > > loader sets up the framebuffers. Description via device tree is also an
> > > option.
> >
> > I guess this can be used as a replacement for offb, too...
> >
> > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> >
> > .... if support for 8-bit frame buffers would be added?
>
> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former

8-bit indexed with 256 entry palette.

> shouldn't be a big thing, but the latter is only really supported by the
> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> works, and we keep that illusion up by emulating it in kernel for hw which
> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> best. The uapis are all there for setting the palette, and C8 is a defined
> format even with atomic kms interface, but really there's not much
> userspace for it. In other words, it would work as well as current offb
> would, but that's at least that.

Oh, that's good to know!
Does this mean fbdev is not deprecated for anything <= C8? ;-)

A while ago, I was looking into converting an fbdev driver to drm, and
one of the things I ran into is lack of C4, C2, C1, Y8, Y4, Y2, and
monochrome support.  On top of that, lots of internal code seems to
assume pixels are never smaller than a byte (thus ignoring
char_per_block[]/block_w).  The lack of support for planar modes isn't
that bad, combined with the need for copying, as c2p conversion can be
done while copying, thus even making life easier for userspace
applications that can just always work on chunky data.
Then real work kicked in, before I got anything working...

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
