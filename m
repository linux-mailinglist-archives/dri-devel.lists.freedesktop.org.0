Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E529C6F0AA8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17C610E225;
	Thu, 27 Apr 2023 17:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 78980 seconds by postgrey-1.36 at gabe;
 Thu, 27 Apr 2023 17:18:40 UTC
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8BF10E225
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3aPWmuilP5wLRilofoqbOrLGxKBwB7pAtJ4SXkaLvoc=;
 b=TLJMIi0RX8F2D4MECviwMXYvEcVb0lEsEy3+u8aUlSP8SU8rlCRGlNNmsB/nVOCzgK5pBrkqJQZ1F
 4Pk0P0hLFN1/gQl0wOoX80yo5LMFFkY8AFk8tIjenbcNtBTjLcrXTVOu35BU0ZgXdWnnSf7qi6nZ3E
 orNHCnRqwI7LiLkgzVpEQaOMbxTZLeop5dV4q915EpZK5kidlhmu8EBhfMffenaiZSY9k7inpdXkTU
 Jqtqf/GAdMoncZ0gbyd6bbDaxV/c7d0xakYFi8MhdcA4DCSizJdUq7VgNEnQ2ErW0+f+L1lpNilWl3
 /TH/k1Te5r34DMQFVMUEym1QgkeLrjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3aPWmuilP5wLRilofoqbOrLGxKBwB7pAtJ4SXkaLvoc=;
 b=G5LZPAqKFgpnZqaJfT/ouJ07IZWuTH9E70Iw4lwAnH6U6PTleuFBBWfBI+H0sNsJGesQJZYrDGZOe
 rwUJGIwDg==
X-HalOne-ID: 62b9268b-e51f-11ed-ad1f-231b2edd0ed2
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 62b9268b-e51f-11ed-ad1f-231b2edd0ed2;
 Thu, 27 Apr 2023 17:17:31 +0000 (UTC)
Date: Thu, 27 Apr 2023 19:17:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/5] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
Message-ID: <20230427171729.GA3899979@ravnborg.org>
References: <20230426130420.19942-1-tzimmermann@suse.de>
 <20230426192110.GA3791243@ravnborg.org>
 <3e33ab1d-b478-fdf5-6fbe-6580000182d1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e33ab1d-b478-fdf5-6fbe-6580000182d1@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Apr 27, 2023 at 09:22:47AM +0200, Thomas Zimmermann wrote:
> Hi Sam
> 
> Am 26.04.23 um 21:21 schrieb Sam Ravnborg:
> > Hi Thomas.
> > 
> > On Wed, Apr 26, 2023 at 03:04:15PM +0200, Thomas Zimmermann wrote:
> > > Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> > > fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> > > depends on the architecture. It's still all located in fbdev's main
> > > header file <linux/fb.h>. Move all of it into each archtecture's
> > > <asm/fb.h>, with shared code in <asm-generic/fb.h>.
> > 
> > For once I think this cleanup is moving things in the wrong direction.
> > 
> > The fb_* helpers predates the generic io.h support and try to
> > add a generic layer for read read / write operations.
> > 
> > The right fix would be to migrate fb_* to use the io helpers
> > we have today - so we use the existing way to handle the architecture
> > specific details.
> 
> I looked through the existing versions of the fb_() I/O helpers. They can
> apparently be implemented with the regular helpers of similar names.
> 
> I'm not sure, but even Sparc looks compatible. At least these sbus_
> functions seem to be equivalent to the __raw_() I/O helpers of similar
> names.

> Do you still have that Sparc emulator?
I used qemu the last time I played with sparc and saved the instructions
somewhere how to redo it - but that would use to bohcs driver only I think.
I have saprc machines, but none of these are easy to get operational.
We can always ask on sparclinux to get some testing feedback.

> 
> > 
> >  From a quick look there seems to be some challenges but the current
> > helpers that re-do part of io.h is not the way forward and hiding them
> > in arch/include/asm/fb.h seems counter productive.
> 
> Which challenges did you see?
sparc was the main thing - but maybe I did not look close enough.
And then I tried to map the macros to some of the more highlevel ones
from io.h, but as Arnd says the __raw* is the way to go here.

	Sam
