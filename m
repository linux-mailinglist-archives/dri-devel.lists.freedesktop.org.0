Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D206F5EDB
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 21:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D061A10E34A;
	Wed,  3 May 2023 19:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FBB10E34A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 19:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=WdyijgrhY4RTD1q08ndFDbdTcMhAA946cORCCTZmsdo=;
 b=gNsbDnuimH08qa10cbdLhym1IRrgRdP9AeDQNlOy+MDGfpEbFka6iHLaMl53BJLZ9ds0o+tb2McSK
 umFvpOk/DQBiNLyNcdfFi+G7QPGueDnWCyi92LsYRkrKz08tjED2SvZo0z4jeOxUD2PPUuOifj2N0K
 8uHgXDhcBex5pGBKPYq+6EFmdgSXjV5/AF7AzSAHaexKpK0gYptqQ5AiuJKB/RSVWTUx0MmGBla+c1
 3XCQ1bchQnlI1pRtu0F7C4NDiY7uFhuYU2stFxHDcvsRqF/E8zNYFWRE3hdphxBm2IxdMxYpGmgYdM
 IX5HrfOaCuHWc45u/ociK//KjVptQZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=WdyijgrhY4RTD1q08ndFDbdTcMhAA946cORCCTZmsdo=;
 b=BFeyD0DeTOJBCOL0z6ux7O7hUQiygYBxE0HwrzdugYwmBlQt32kD7CLH2TN/FY+HRiNUVv4M/2hmJ
 GRBucEJCA==
X-HalOne-ID: 942bba87-e9e5-11ed-bfec-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 942bba87-e9e5-11ed-bfec-b90637070a9d;
 Wed, 03 May 2023 19:06:19 +0000 (UTC)
Date: Wed, 3 May 2023 21:06:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 6/6] fbdev: Rename fb_mem*() helpers
Message-ID: <20230503190617.GB422961@ravnborg.org>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-7-tzimmermann@suse.de>
 <20230502200813.GC319489@ravnborg.org>
 <828664d0-3562-56cc-019d-1bb8a55826b5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <828664d0-3562-56cc-019d-1bb8a55826b5@suse.de>
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

On Wed, May 03, 2023 at 10:15:46AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.05.23 um 22:08 schrieb Sam Ravnborg:
> > Hi Thomas.
> > 
> > On Tue, May 02, 2023 at 03:02:23PM +0200, Thomas Zimmermann wrote:
> > > Update the names of the fb_mem*() helpers to be consistent with their
> > > regular counterparts. Hence, fb_memset() now becomes fb_memset_io(),
> > > fb_memcpy_fromfb() now becomes fb_memcpy_fromio() and fb_memcpy_tofb()
> > > becomes fb_memcpy_toio(). No functional changes.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > ...
> > > -#ifndef fb_memcpy_fromfb
> > > -static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
> > > +#ifndef fb_memcpy_fromio
> > > +static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
> > >   {
> > >   	memcpy_fromio(to, from, n);
> > >   }
> > > -#define fb_memcpy_fromfb fb_memcpy_fromfb
> > > +#define fb_memcpy_fromio fb_memcpy_fromio
> > >   #endif
> > > -#ifndef fb_memcpy_tofb
> > > -static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
> > > +#ifndef fb_memcpy_toio
> > > +static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
> > >   {
> > >   	memcpy_toio(to, from, n);
> > >   }
> > > -#define fb_memcpy_tofb fb_memcpy_tofb
> > > +#define fb_memcpy_toio fb_memcpy_toio
> > >   #endif
> > >   #ifndef fb_memset
> > > -static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
> > > +static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
> > >   {
> > >   	memset_io(addr, c, n);
> > >   }
> > > -#define fb_memset fb_memset
> > > +#define fb_memset fb_memset_io
> > 
> > The static inlines wrappers does not provide any value, and could be replaced by
> > direct calls to memcpy_fromio(), memcpy_toio(), memset_io().
> > 
> > If you decide to keep the wrappers I will not hold you back, so the
> > patch has my:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > But I prefer the direct calls without the wrappers....
> 
> At first I was also skeptical if those fb_mem*() wrappers are needed. But
> Arnd mentioned that there are subtle differences between the current code
> and Linux' mem*_io() functions. Keeping the wrappers might be needed.
Saw the dialog, and agree that keeping current behaviour is the way to
go for now even if this is more code and wrappers.

	Sam
