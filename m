Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667A55254E0
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 20:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C2D10E7C1;
	Thu, 12 May 2022 18:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DE210E7ED
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=O8SS8tR6KzBteRzzV4PMFZxsbdP8o7OvOren4W79nuw=;
 b=h7ZNvfc9avhDt9okNYnG1IgGZnDItoaBEkXyNthysrfKmHtpKX7wDWuLH5KG3Iywu8NOqH+7WLZuQ
 MnpkF89PW8JzZGoE9JLyR4KdVe9+bAIYLiQD136jCrzGp1k40JxdtVhEBk+nwb0x05k3DYqZbisrtN
 j7e8ukhv08m6oq7+6e997j5AUB/8ZG9VCcIwetPEOJ79RTTWLJN5BJVTJ8vu0jjAIAoUQDxxRoisSM
 N9jq5+4/VB+uvogOuIBEU7O4qJ6SWpuYQfYfWmyBsnBRbTuI/CKD25yCMVv/UqT9ugfVLoLuE/snxf
 nLO3Tp7gs3zv/RGajEZVV0pxKdWv1hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=O8SS8tR6KzBteRzzV4PMFZxsbdP8o7OvOren4W79nuw=;
 b=F+p45EAMDelLJaqsvbV923D4aMqVja+yHAlwwJJfG5Uvo2AxRvdFs4aw7v7EuZqlp1V4TsAC7Wad2
 dnMPZyUAg==
X-HalOne-Cookie: 9bbbb5e34672ef539628ef080ed8275be782a0a2
X-HalOne-ID: d92e617e-d221-11ec-822c-d0431ea8bb10
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id d92e617e-d221-11ec-822c-d0431ea8bb10;
 Thu, 12 May 2022 18:32:16 +0000 (UTC)
Date: Thu, 12 May 2022 20:32:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 7/7] fbdev: Make registered_fb[] private to fbmem.c
Message-ID: <Yn1SrtRHIjapcIjp@ravnborg.org>
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113230.1252910-1-javierm@redhat.com>
 <YnvrxICnisXU6I1y@ravnborg.org>
 <8c84428c-2740-4046-74c9-298b854944d0@roeck-us.net>
 <48f164af-99d2-9e74-e307-003be0677384@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f164af-99d2-9e74-e307-003be0677384@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 kernel test robot <lkp@intel.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jens Frederich <jfrederich@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 07:34:38PM +0200, Javier Martinez Canillas wrote:
> Hello Guenter,
> 
> On 5/11/22 19:17, Guenter Roeck wrote:
> > On 5/11/22 10:00, Sam Ravnborg wrote:
> 
> [snip]
> 
> >>>   struct fb_info *registered_fb[FB_MAX] __read_mostly;
> >>> -EXPORT_SYMBOL(registered_fb);
> >>> -
> >>>   int num_registered_fb __read_mostly;
> >>> +#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
> >>> +EXPORT_SYMBOL(registered_fb);
> >>>   EXPORT_SYMBOL(num_registered_fb);
> >>> +#endif
> >>
> >> It is stuff like this I refer to as "ugly" in the comment above.
> >>
> > 
> > My "solution" for that kind of thing is to use a namespace,
> > such as
> > 
> > EXPORT_SYMBOL_NS(registered_fb, FB_OLPC_DCON);
> > EXPORT_SYMBOL_NS(num_registered_fb, FB_OLPC_DCON);
> >
> 
> Using a namespace in this case is indeed a great idea I think.
> 
> I've used in the past to limit the export of a symbol for within a driver
> that could be scattered across different compilations units, but it never
> occurred to me using it to limit symbols exported by core code.
>  
> > and import it from the offending code. That avoids ifdefs
> > while at the same time limiting the use of the symbols
> > to the expected scope. Of course that could be abused but
> > that abuse would be obvious.
> >
> 
> Agreed. For the next revision, besides using an namespaced export symbol
> as you suggested, I'll include a comment to make clear that it shouldn't
> by any other driver and FB_OLPC_DCON fixed instead.
A very nice compromise, thanks Guenter and Javier.

	Sam
