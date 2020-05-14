Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3E1D2EC7
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 13:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC326E32D;
	Thu, 14 May 2020 11:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7416E32D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 11:51:16 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id k4so834595uaq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fz/sODwE4TRlAOUOF7rSWmB5p5vCnF20YLXRpjtRNR8=;
 b=fAoerFnOqYJzGocVX8Id2ilnoOiWw9tjf6UV3fKEYbOvg/kHrbnP/C65NbI59Xi0v4
 UxhU3GHuwaHdeJztSATlKlF9pKzjvjuw4mhzkkdTOCQR8BLxUPcGGM7p5toepgNmjsKH
 XTW8A+gOuYLB3pBMRrN/Jz9lQ0NTXe0SbQZ7d8+Lh5sUo5nCpQzJ7Ixk2nfuYLaPuLc8
 u7E9ivRsvS87+z0XhwvuRAxP4jN3mUuEi/gn9h/l64H4GWHihtLGm3qNS+Jul7EZOBIo
 eBnwqDOe16oXRAG26LmjNVwlLFzWWnWEAlhg9btfai30pziMNZAycFz/gKGHiIz8qdNI
 Hd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fz/sODwE4TRlAOUOF7rSWmB5p5vCnF20YLXRpjtRNR8=;
 b=bFuwDGST9reqsl0YjlJZ+ghS74BttaOfYR/XrDubwQ79HnAZH0g/40ZpX0JWukC44E
 bssMxzIjUOODPUZcUZbcr1VXRcHNHVtAh0h4HhP64IvXFWykuPVLHbZuFIzj5qC25LMr
 iireOJMluDTlsSI8wp051hp/AZxQAsz59TEUO2X5oQhz3G7ehK3uXrsDUXfKEhnncos/
 /7WQCvodWrqXzh3Ox/oo+aZ7QXF7PVHXyVEXLjwtGA33U4XqhSuc/B0hceuTh4h2bmAR
 2HovWmCjyVU9zxll8FSWWrioafix//tlvdv6ASpnXTL88oT9uE1HiXw8+k7rcC5zlgyz
 4jcQ==
X-Gm-Message-State: AOAM530prRE/b3HJD5gsXrFWSHY9T6caMXRg5SxG4eCR6ks/HAFiIWUA
 x3iEmE85fAJAC8vneTH42CFDPVEe6uB2xoI/mUo=
X-Google-Smtp-Source: ABdhPJxSk3G3P52SjjYVN5dey+t6hO6IzipIL9onpZ2v3nEYxcmFje21OU68uGtXk/NMjDQSpwIAtCNk2p/z79SJzCM=
X-Received: by 2002:ab0:1ea:: with SMTP id 97mr3527388ual.106.1589457075715;
 Thu, 14 May 2020 04:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws> <20190802104633.GA14823@kroah.com>
 <CACvgo52+Uqx4GJFwadJoFzzt5EMc69HcW-+K9uxv9t25TtSDBg@mail.gmail.com>
 <20200514071631.GA1566388@kroah.com>
In-Reply-To: <20200514071631.GA1566388@kroah.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 14 May 2020 12:48:32 +0100
Message-ID: <CACvgo52Mqag6wzWqJPMqbtbSsqDgPyyG33huAd+cQgFKQhfQUw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: platform-driver-x86@vger.kernel.org,
 linux-fbdev <linux-fbdev@vger.kernel.org>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Tony Prisk <linux@prisktech.co.nz>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Borislav Petkov <bp@alien8.de>,
 linux-input@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, LAKML <linux-arm-kernel@lists.infradead.org>,
 Richard Gong <richard.gong@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 May 2020 at 08:16, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 13, 2020 at 11:18:15PM +0100, Emil Velikov wrote:
> > Hi Greg,
> >
> > On Fri, 2 Aug 2019 at 11:46, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >
> > >
> > > I have now done this with patch 1/10.  Here's the pull info if any
> > > subsystem maintainer wants to suck this into their tree to provide the
> > > ability for drivers to add/remove attribute groups easily.
> > >
> > > This is part of my driver-core tree now, and will go to Linus for
> > > 5.4-rc1, along with a few platform drivers that have been acked by their
> > > various subsystem maintainers that convert them to use this new
> > > functionality.
> > >
> > > If anyone has any questions about this, please let me know.
> > >
> > > thanks,
> > >
> > > greg k-h
> > >
> > > -------------------
> > >
> > > The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
> > >
> > >   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/dev_groups_all_drivers
> > >
> > > for you to fetch changes up to 23b6904442d08b7dbed7622ed33b236d41a3aa8b:
> > >
> > >   driver core: add dev_groups to all drivers (2019-08-02 12:37:53 +0200)
> > >
> > > ----------------------------------------------------------------
> > > dev_groups added to struct driver
> > >
> > > Persistent tag for others to pull this branch from
> > >
> > > This is the first patch in a longer series that adds the ability for the
> > > driver core to create and remove a list of attribute groups
> > > automatically when the device is bound/unbound from a specific driver.
> > >
> > > See:
> > >         https://lore.kernel.org/r/20190731124349.4474-2-gregkh@linuxfoundation.org
> > > for details on this patch, and examples of how to use it in other
> > > drivers.
> > >
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >
> > > ----------------------------------------------------------------
> > > Dmitry Torokhov (1):
> > >       driver core: add dev_groups to all drivers
> > >
> > >  drivers/base/dd.c      | 14 ++++++++++++++
> > >  include/linux/device.h |  3 +++
> > >  2 files changed, 17 insertions(+)
> > > _______________________________________________
> >
> > Was planning to re-spin DRM a series which uses .dev_groups, although
> > I cannot see the core patch.
> > Did the it get reverted or simply fell though the cracks?
>
> Nope, it's in there:
>         23b6904442d0 ("driver core: add dev_groups to all drivers")
> which showed up in the 5.4 kernel release.
>
> Lots of other subsystems have already been converted to use this, do you
> not see it in your tree?
>
A case of PEBKAC it seems - I was looking at a 5.3 checkout somehow.

Thanks for the core work. Will check/merge the fbdev patches over the
next few days and polish drm land.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
