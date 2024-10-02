Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDA198D111
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 12:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE2D10E083;
	Wed,  2 Oct 2024 10:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aPXIcG32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDB110E083
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 10:21:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 636A2A43A23;
 Wed,  2 Oct 2024 10:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF0AC4CEC5;
 Wed,  2 Oct 2024 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727864490;
 bh=+KbXQBTEnttmeTjZtiwlSGU3lx5UCSPyQIe7qGJO+bs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPXIcG32HgxQOp2RQoeJmOMIVHnXHStdGizxI6uxqcgCJ3teztOPPpY/85oE3KBa7
 hSlTS2fKBsMeCTucs7HOvuTDlleAP63Cq1wvdQT0mV2RlxlNUMP54YFIJyNRwk6I7r
 8uYFpEjO3ZQLyHyanHwAwMrEfGIU5XH8zDq+6eL/bDLEfPfCPCpELUa+52IXv/RXUt
 jZKekeT41R/u0gyDMrz7UrlIGopKlSUcziXeGqgE2FL5kN2AF/yJiflYAUMHG45x37
 LUaidFOpxa/Cp+h9+7bf9QQjhH+/KJ5A/jhx+/vOzvw7Rj04vRwnP/lnqqjVWBo0n8
 ckjKoJAaGfc0g==
Date: Wed, 2 Oct 2024 12:21:24 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <hdahq2vfi3bnvaqswwdtave2kc2qm3ngvcwn6cgfiirfjfbqnz@zk77mbs3yktp>
References: <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
 <rdo2yyy5dxsxrfm7bweuuvsqjzjelyevo5xvufixuiyrdlf7pc@mprc7pzbpnla>
 <Zv0YI3qIEg88Dx4c@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv0YI3qIEg88Dx4c@duo.ucw.cz>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Oct 02 2024, Pavel Machek wrote:
> On Wed 2024-10-02 10:13:10, Benjamin Tissoires wrote:
> > On Oct 01 2024, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> > > > all of the requirements here:
> > > > - need to be dynamic
> > > > - still unsure of the userspace implementation, meaning that userspace
> > > >   might do something wrong, which might require kernel changes
> > > > - possibility to extend later the kernel API
> > > > - lots of fun :)
> > > 
> > > Please don't do this.
> > > 
> > > We have real drivers for framebuffers. We don't make them emulate
> > > USB-display devices.
> > 
> > Except that they are not framebuffer for multiple reasons. I know you
> > disagree, but the DRM maintainers gave a strong NACK already for a
> 
> Person not linking the DRM stuff was not a maintainer.
> 
> > DRM-like interface, and the auxdisplay would need some sort of tweaking
> > that is going too far IMO (I'll explain below why I believe this).
> 
> 
> 
> > > Yes, this is a small display, and somewhat unusual with weird pixel
> > > positions, but it is common enough that we should have real driver for
> > > that, with real API.
> > 
> > It's not just weird pixel positions. It's also weird shapes. How are you
> > going to fit the space bar in a grid, unless you start saying that it
> > spans accross several pixels. But then users will want to address
> > individual "grouped" pixels, and you'll end up with a weird API. The
> > Enter key on non US layouts is also a problem: is it 1 or 2 pixels wide?
> > Is is 2 pixel in heights?
> 
> Have you seen one of those keyboards?

I already refrain from mention this once or twice, but please, try not
being aggressive in suggesting I'm dumb.

> 
> (Hint: it is LEDs below regular keyboard.)

Yes, I know, and if you read this email and the few others, you'll read
that I own a few of them already (for a long time), and I worked on a
cross vendor userspace API to configure them. So I know what I am
talking about.

> 
> > The positions of the pixels also depend on the physical layout of the
> > keyboard itself. So with the same vendor ID/Product ID, you might have
> > different pixel positions if the device is sold in Europe, or in the
> > US.
> 
> If vendor sells different hardware with same IDs, well 1) that's a
> nono, a 2) that's what kernel parameters are for.

This is already the case (hello hid-uclogic), and no, kernel parameters
are not helping. In that case (uclogic), we ask the device a specific
USB string which has the information, but is not part of HID. This is
dumb, but we don't control hardware makers.

> 
> > It's also luminance problem IIRC. Some keys might have a different range
> > of luminance than others. I remember Bastien Nocera telling me we
> 
> Have you seen one of those keyboards?

Again, please refrain any aggressive comments.

> 
> > But that's just the "easy" part. We can define a kernel API, for sure,
> > but then we need users. And there are several problems here:
> > 
> > - first, users of this new kernel API need to be root to address the
> >   LEDs. They probably won't, so they'll rely on a third party daemon for
> >   that, or just use uaccess (yay!). But that part is easy
> 
> Eventually, desktop environment should talk the interface. (Plus, how
> does HID or BPF craziness help with his?)

HID helps because we already have the case with game controllers. Steam
and SDL (both widely use), put rules giving uaccess to hidraw nodes on
those controllers. So we finally made the jump and now provide in v6.12
a new hidraw ioctl to allow logind to revoke the hidraw node. This
should allow us to not give uaccess to those hidraw nodes.

So in the near future, there will be a portal available, that says
"please give me a fd for this hidraw node", the compositor will then ask
logind to open the file for it and then will pass that fd to the final
application. Once there is a vt-switch, logind will revoke the fd,
meaning that the application will not have access to the device.

> 
> > - then, user sees a new kernel interface, and they have to implement it.
> >   OK, fair enough, but more code to maintain
> 
> Yep. At least there's single interface to talk to.
> 
> > - but that new kernel API doesn't give enough information: all you have
> >   is an approximation of the keyboard layout, which will not match
> >   the
> 
> Have you seen OpenRGB? It already aproximates keyboard as a grid. Or
> maybe we give them enough information.
> 
> Below you were just inventing problems.

A simple "IMO" would makes this kind of comments acceptable. But this is
really offensive TBH.

> 
> > - but then, even if you make everyones happy, the GUI project is
> >   actually cross-platform (OpenRGB is, Steam is, SDL is). And what is
> >   done on Windows is simple: raw access to the HID device. And the
> >   raw
> 
> Yes, Windows is a mess. We don't want to emulate them.
> 
> > I've been through this exact same process with Input and game
> > controllers, and even for libratbag for configuring gaming devices. In
> > the end, the kernel developer never wins, but the userspace
> 
> Yes, we have been in this exact situation. Userland was directly
> accessing mice. It was called "gpm" and we moved away from that for
> good reasons.

There is a slight difference between mouse support and LEDs on your
keyboard. The former is actually required to bring up the machine and to
use it, the latter is nice to have.

And if you want to take that mouse comparison, we are already seeing the
limits of the input subsystem, because we are running out of bits for
defining usages. A few years ago we talked about creating evdev2, but we
ended up nowhere. Now we are realizing that HID has way more
inforamtions on the device that the kernel provides, so we also need a
new way to export those information (pending proposal already).

> 
> > If you want a 100 lines of code program to control your keyboard, with
> > LampArray, you can, as long as you don't require a GUI and don't require
> > to be generic. Just write the values directly on the hidraw device,
> > and
> 
> Haha, no. Kernel part was 400+ lines, no way you can parse that in 100
> lines.

I'm not saying "parsing", I mean adapt to your use case. If you know
your device, your simple CLI is just writing a static array of bytes to
the hidraw interface.

> 
> > You might agree with me or not, but this is actually not relevant to the
> > discussion here IMO: all what Werner is doing (with crazy arrays) is to
> > take a proprietary protocol and convert into a HID standard. He is
> 
> Yes, we should never have had input subsystem. We should simply
> convert all mice to PS/2 standard protocol. ... And yes, we have that,
> that's /dev/mice, yet input layer is very useful.

Again, apple and oranges. Input is required for everything. The LEDs
under a keyboard is not a vital component. And there is already a HID
standard to it.

> 
> What is relevant that these crazy arrays are not going to be merged,
> and better solution is needed.

Again, you seemn to miss the point: those crazy arrays should have been
in the firmware from day one. They are not, so the idea is to convert
proprietary protocol into a standard. Then we can start thinking what
comes next.

> 
> > I'm also under the impression that you are scared by BPF. BPF is just a
> > tool here to "fix" the device with an easy path forward. BPF is
> > safer
> 
> I should not need to run just-in-time compiler to get support for my
> hardware. If you are not scared by BPF, take a look at modern CPU
> design, with emphasis on speculation vulnerabilities such as Spectre
> and Meltdown.
> 

Cheers,
Benjamin
