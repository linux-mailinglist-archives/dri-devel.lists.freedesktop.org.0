Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6596F4AFC
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 22:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042010E07C;
	Tue,  2 May 2023 20:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3A010E07C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7Cvc9t2uj+JoEAOf6QiHMtCJcRgtJ26CtzLE3dOVCX4=;
 b=DAJTs66FtfCQ420jLek75/3/XNBefU855ewUyaKmXxygVB6ZwaaX4BG60IJjSKwTrXzoHzbhc711S
 zlp4kZr4AVZMkk0zrDEzy7AwKvjS2/gg0wnNG0W/6Cto4FTV5PtE5S4fDV657GDHfaQzB5Ya9TG/kV
 016qrq5lr1THB0fUDBipjErF2RTfNeOJgg7A+ZHrJaIi4OqW5scOKWYMFFV4N2UMUU69v6W/Pr8BQs
 NJZFnLxFZi/NWItgGcOv4voyhae1n2JoPlDwDZo2F51Gk2sc4H8BM9ikcvgRwc/nFF3aPAbXAJpFDE
 mfmUAPNEjXGlbQD2yXDOnYBNY2Abkjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7Cvc9t2uj+JoEAOf6QiHMtCJcRgtJ26CtzLE3dOVCX4=;
 b=BufBpesF4qmcj+3WAckz7l+cGAVlOpWomuRms3hnfY+4zICRqPq9RxbIV9afOQ/RW6dKCGaonFM0Q
 kOp2kKxBA==
X-HalOne-ID: 10b6caa3-e925-11ed-9f58-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id 10b6caa3-e925-11ed-9f58-592bb1efe9dc;
 Tue, 02 May 2023 20:08:14 +0000 (UTC)
Date: Tue, 2 May 2023 22:08:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 6/6] fbdev: Rename fb_mem*() helpers
Message-ID: <20230502200813.GC319489@ravnborg.org>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502130223.14719-7-tzimmermann@suse.de>
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

Hi Thomas.

On Tue, May 02, 2023 at 03:02:23PM +0200, Thomas Zimmermann wrote:
> Update the names of the fb_mem*() helpers to be consistent with their
> regular counterparts. Hence, fb_memset() now becomes fb_memset_io(),
> fb_memcpy_fromfb() now becomes fb_memcpy_fromio() and fb_memcpy_tofb()
> becomes fb_memcpy_toio(). No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
...
>  
> -#ifndef fb_memcpy_fromfb
> -static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
> +#ifndef fb_memcpy_fromio
> +static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
>  {
>  	memcpy_fromio(to, from, n);
>  }
> -#define fb_memcpy_fromfb fb_memcpy_fromfb
> +#define fb_memcpy_fromio fb_memcpy_fromio
>  #endif
>  
> -#ifndef fb_memcpy_tofb
> -static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
> +#ifndef fb_memcpy_toio
> +static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
>  {
>  	memcpy_toio(to, from, n);
>  }
> -#define fb_memcpy_tofb fb_memcpy_tofb
> +#define fb_memcpy_toio fb_memcpy_toio
>  #endif
>  
>  #ifndef fb_memset
> -static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
> +static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
>  {
>  	memset_io(addr, c, n);
>  }
> -#define fb_memset fb_memset
> +#define fb_memset fb_memset_io

The static inlines wrappers does not provide any value, and could be replaced by
direct calls to memcpy_fromio(), memcpy_toio(), memset_io().

If you decide to keep the wrappers I will not hold you back, so the
patch has my:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

But I prefer the direct calls without the wrappers....

	Sam
