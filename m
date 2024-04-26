Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EAB8B3D43
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 18:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345201124FA;
	Fri, 26 Apr 2024 16:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="MoHD/9VX";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="UoBFHtU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BE41124FF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=QtZJ+LaGtIZ9ah30lpFZvZR00WRRy58GXdQC7OFQJvU=;
 b=MoHD/9VXVJdzxrnQFpHynPdxGTbT/vbJiwcQ89Bth3NPZNEnworXAklQwsjFYCyV06ASHH9qeeBjc
 L1yHijxar53c9gWDEWhiyzlrk8Fm9LY7eM3kOKvNK8ZhXUEjAkdWnMt4lYS/JdIhZLaeNP3TkhtVg2
 8XkKHKrqIuXItkQ3X6016KOeHFYI+XBcHXTmcSPHKEpi26K5TVVjw3umF3oZtHjwtToDYOrkUjjI4W
 R8Ht9IhvfH8wj5M/93zD2v22VXMWcZyQDrFKAwYwcHEvhXS6o0Psk3n9atX642heDucQFCr3K7duxP
 RZNLCCIJtIbEpc/d+6ftbiLoheAS0wA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=QtZJ+LaGtIZ9ah30lpFZvZR00WRRy58GXdQC7OFQJvU=;
 b=UoBFHtU2GhTQiRAYO19X9G1fRST8HcVcM02AGyrOgGn6HCCRO212CV3fr67lyIksMV2Fwh6mjubCq
 gYCnLc5Cg==
X-HalOne-ID: 91560707-03ed-11ef-827c-edf132814434
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 91560707-03ed-11ef-827c-edf132814434;
 Fri, 26 Apr 2024 16:53:57 +0000 (UTC)
Date: Fri, 26 Apr 2024 18:53:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andreas Larsson <andreas@gaisler.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Arnd Bergmann <arnd@kernel.org>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kjetil Oftedal <oftedal@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/28] sparc32: sunset sun4m and sun4d
Message-ID: <20240426165355.GA1092388@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
 <20240423180216.GA906720@ravnborg.org>
 <7749e9f4-2540-4618-8689-b6bb757f9cd0@gaisler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7749e9f4-2540-4618-8689-b6bb757f9cd0@gaisler.com>
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

Hi Andreas.

On Fri, Apr 26, 2024 at 06:31:12PM +0200, Andreas Larsson wrote:
> On 2024-04-23 20:02, Sam Ravnborg wrote:
> > Please let me know if you expect me to rebase this on for-next.
> > I have not yet tried if there are merge conflicts but can take a look in
> > a some days if required.
> 
> My local testing branch for this patchset rebased with trivial fixups,
> so no immediate rebase and resubmission is needed. I do run into some
> strange problems on SMP with this patchset plus your CAS patchset, that
> I do not get when I rebase the Linux patches from our kernel release
> that has my CAS patchset. With no CAS at all these things fails even
> worse, so do I need one or the other for these tests.
:-(

> 
> I will need to dig deeper into figuring out the problems seems to be due
> to something in any of your two patchsets in themselves or if it is
> something else. I do need some additional fixes from our kernel release
> for SMP to work properly, so it could also be that there is something
> with my combination of your patches and my patches adapted on top of
> yours.
> 
> There are also some needed fixes for LEON that relies upon code removed
> in this patchset. Maybe the best solution for that would be if I submit
> those and you then rebase upon them.
If you can make LEON stable before starting the code removal that would
be the best way forward. Then it should be easier to identify when
the removal patches breaks things.

With all the surgery I had to do to remove stuff it would have been a
big surprise if it just worked - so it goes as expected. qemu only
verify so much - the real target (and SMP) is way better.

> > That is assuming you agree with the sunset of the sun platforms...
> 
> I do agree with the idea in general, but being busy with other things I
> have had little time to dig into this lately.

If this round could be used to stabilize LEON and apply other more
trivial stuff, then I am happy to rebase the "sunset" patchset sometimes
after next -rc1.

I have accumulated a bit more on top of what I already posted, and I
will include a few more patches in the next round.

In other words - take your time!

	Sam
