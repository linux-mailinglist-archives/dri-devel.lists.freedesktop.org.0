Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B755981A22E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 16:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186E910E5DF;
	Wed, 20 Dec 2023 15:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 31123 seconds by postgrey-1.36 at gabe;
 Wed, 20 Dec 2023 15:23:30 UTC
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [46.30.211.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D910E5DF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 15:23:30 +0000 (UTC)
X-HalOne-ID: 955a2286-9f4b-11ee-a08e-2b733b0ff8f0
Received: from mailrelay3.pub.mailoutpod3-cph3.one.com (unknown [104.37.34.40])
 by mailrelay1 (Halon) with ESMTPS
 id 955a2286-9f4b-11ee-a08e-2b733b0ff8f0;
 Wed, 20 Dec 2023 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sfJdNm2lEIQrBamytj/tsjayfAn2mE9Fqg6pTRTtass=;
 b=V7JO3UfrJBPi8Mr4OiXidEj06nbi+4dGqF8lTDUxAatPOa3Mlnk4cPWWCp6rGFSmlg84dMYhGH/wx
 4eh7YufTH9Qozp7hyl38p0/Vv1AI7NML/gCxBRIhhZLfnIbFn3caGKYQ/7wivxRtQN/16oNIZzSo2V
 N2s36hSKm4Pt5lKXpk0BXH5WGbx7T/X0mH1z2U+ITgvz27/1ufXwAp1FScDIWkBWTsDWNjTd/Emckp
 WETFeHTLl3ZUd/z5sZBLDt1vXIn83aLFyP3iYwoSs+yVIt/MXx8fX/UB1wnfyTb/ziMcH3Pr/2CIs5
 D2IOP+s/C4QBkFTkqlNSczAHv+lQTtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sfJdNm2lEIQrBamytj/tsjayfAn2mE9Fqg6pTRTtass=;
 b=wuQzVB+0GMurqsA05DzExqKKRiWf8flOefeaAYoYt6rspJIl/01szyGy0a5mE+hUuX/vB2ZkfXV8H
 ABCWeGuDg==
X-HalOne-ID: 938bf566-9f4b-11ee-b5cb-85e425223685
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 938bf566-9f4b-11ee-b5cb-85e425223685;
 Wed, 20 Dec 2023 15:22:26 +0000 (UTC)
Date: Wed, 20 Dec 2023 16:22:24 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 00/27] sparc32: sunset sun4m and sun4d
Message-ID: <20231220152224.GA867968@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <01ea8c41-88cd-4123-95c7-391640845fc3@app.fastmail.com>
 <e897e6d5a88ec2f9024c62f7bee5c13bfb2cab55.camel@physik.fu-berlin.de>
 <dbb60b13-565f-43b8-8cb8-6f8cd98b06df@app.fastmail.com>
 <3d733b57-884a-4755-a32a-74061b48e182@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d733b57-884a-4755-a32a-74061b48e182@ilande.co.uk>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 sparclinux@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

On Wed, Dec 20, 2023 at 11:30:27AM +0000, Mark Cave-Ayland wrote:
> On 20/12/2023 10:47, Arnd Bergmann wrote:
> 
> > On Wed, Dec 20, 2023, at 09:54, John Paul Adrian Glaubitz wrote:
> > > On Wed, 2023-12-20 at 08:36 +0000, Arnd Bergmann wrote:
> > > > All of these were found through inspection rather than testing,
> > > > so there is a good chance that other fatal kernel bugs prevent
> > > > testing in qemu, at least until the fixes from Andreas' tree
> > > > are included.
> > > 
> > > Andreas has fixes for these issues?
> > 
> > Not sure, all I know is that
> > 
> > - Andreas has some fixes for Leon in his tree
> > - Sam is unable to boot mainline in qemu
> > - There is an unknown set of bugs in sparc32 since it has not
> >    been tested for many years without Andreas' patches
> > 
> > it appears that the qemu developers are still testing the sun4m
> > model against old Linux and Solaris installations [1], but
> > failure to run the leon3 model could still be any combination
> > of kernel, qemu or configuration problems.
> > 
> >          Arnd
> > 
> > [1] https://wiki.qemu.org/Documentation/Platforms/SPARC#Compatibility
> 
> Hi all: I'm one of the QEMU sun4m and sun4u maintainers so thought it would
> be worth a few comments here.

I can imagine that the proposal to drop sun4m from the kernel is then
not the best news this December - sorry about that.

> 
> My SPARC work on QEMU is unsponsored, so of course it is reliant upon me
> finding time between work and family to fix various bugs. This means that I
> simply don't have the time to constantly build and test the latest kernels:
> what generally happens is that someone pings me a regression bug report when
> something breaks and provides a test kernel/rootfs for me to look at. In the
> past both Rob Landley and Guenter Roeck have often flagged regressions and
> kindly provided these for me.
> 
> Other than that I just assume that everything is still working against the
> upstream kernel.

It is a fantastic tool that we can build and boot a kernel using qemu
and your work is appreciated - thanks!

> 
> The leon3_generic machine is maintained by different people so I'd suggest
> contacting them: see [1] for their contact details. I see there is an
> avocado boot test for the leon3_generic machine included within the QEMU
> source tree, but it uses a downloadable image of HelenOS rather than Linux.

Thanks for the pointer, I will try to reach out to them when I have
something a bit more solid than "it does not work".

I tried to hack around a little in qemu and I have an idea where things
goes wrong. The leon_generic assumes another address layout than what is
used by the kernel, so the very first jump to a kernel address fails.

	Sam
