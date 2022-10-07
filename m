Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF635F749C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 09:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6803D10E341;
	Fri,  7 Oct 2022 07:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F57D10E341
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665126962; x=1696662962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5nTDREGx6XROYfTyn5xMQb201aaqjkfEqm7Nb8JpeLo=;
 b=RapmpQft2cn6IBFHfhwXcQJCn7ZxYi5brxxUrXvXmyRPpaTRia8BBtX+
 ooI+CeHDb0XjcDUMshkxC45fsIKxCgUfVDjaST8MIghxnLlVdJ+ape8B/
 rp5rScUrCW6cDng51kaUGELAa03OjnxNVnjkKU6NruzEDtSvoDSWp+pvE
 4aF+wGNSiTRst4COMl2kCwkuZykTj6ozZzx/CkGed1c/XF2LIIM7dagR4
 TOaSxhOCJtdJbHUEu2s/yMOguYXAtx3egvVXxZwIN1PaQZLjwwrZrts+g
 fhwKmf2exNK19OtrY2k1Yse66DOMa9BFiBO/8bltf5gSXeLPws0gCgR1e Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="305251666"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="305251666"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 00:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="767468351"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="767468351"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 07 Oct 2022 00:15:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Oct 2022 10:15:58 +0300
Date: Fri, 7 Oct 2022 10:15:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm fb helpers hotplug/resize
Message-ID: <Yz/SLn6jnUsTAw6y@intel.com>
References: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
 <8fc0e4de-2448-1d04-d1b0-16f87498fe98@suse.de>
 <a3f7176eb7ae321f939d906adb1873cef7fe01ce.camel@vmware.com>
 <156b7bad-810b-80ce-3f79-bca10641d1a1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <156b7bad-810b-80ce-3f79-bca10641d1a1@suse.de>
X-Patchwork-Hint: comment
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 09:10:27AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 07.10.22 um 04:16 schrieb Zack Rusin:
> > On Thu, 2022-10-06 at 10:01 +0200, Thomas Zimmermann wrote:
> >> Hi Zack
> >>
> >> Am 05.10.22 um 21:49 schrieb Zack Rusin:
> >>> Hi, Thomas.
> >>>
> >>> Because you've been the one who's been working on drm_fb_helper.c the most the last
> >>> few years I wanted to pick your brain a bit.
> >>>
> >>> I was porting vmwgfx to drm_fb_helper code which is largely trivial, just removing
> >>> all of vmwgfx_fb.c and replacing it with a call to drm_fbdev_generic_setup. But
> >>
> >> Thanks a lot for this work. I have been looking into doing this
> >> conversion myself at some point, but never found the time to actually do
> >> it.
> >>
> >>> drm_fb_helper.c code never deals with resizes which is a bit of a problem.
> >>>
> >>> e.g. replacing the drm_sysfs_hotplug_event() call from
> >>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c#L2255
> >>> with drm_kms_helper_hotplug_event will call drm_fbdev_client_hotplug and end up in
> >>> drm_fb_helper_hotplug_event:
> >>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_helper.c#L2003
> >>>
> >>> Now drm_fb_helper_hotplug_event does drm_client_modeset_probe but it never resizes
> >>> drm_fb_helper::buffer and drm_fb_helper::fb so they're both incorrectly sized.
> >>>
> >>> In general I don't see drm_fb_helper code ever being able to deal with resizes. In
> >>> particular because the fbdev's xres_virtual/yres_virtual are sized exactly to the
> >>> initial xres/yres.
> >>>
> >>> It's definitely a lot bigger issue on virtualized environments where at boot we'll
> >>> have some very conservative size (800x600) on vmwgfx which is then usually resized
> >>> to the size of the window. drm_fb_helper breaks pretty bad in that case because it
> >>> can't deal with those resizes at all.
> 
> The initial resolution of 800x600 is imposed by the driver, right? 
> (VMW_MIN_INITIAL_{WIDTH,HEIGHT}) You can use video= on the kernel 
> command line to select a resolution. That gives at least a workaround 
> with fbdev emulation.
> 
> >>>
> >>> Is this scenario something that drm_fb_helper should be able to handle or is it not
> >>> worth pursuing it? I don't think there's a trivial way of handling it so my guess is
> >>> that it would make drm_fb_helper quite a bit more complicated.
> >>
> >> I'm aware that resizing is missing. It's one of the few things I'd like
> >> to see being added to generic fbdev emulation. But as you say, it's not
> >> easy. The generic fbdev emulation has all kinds of code paths for the
> >> various drivers' memory managers. That makes it complicated.
> >>
> >> The problem is that fbdev's mmap'ed memory cannot be reallocated. It is
> >> expected to behave like 'real video memory.' So either reserve a chunk
> >> of the video ram for fbdev's GEM objects or use deferred I/O, which
> >> provides mmaped pages from a shadow buffer in system memory. vmwgfx uses
> >> the latter IIRC.
> >>
> >> But ideally, we'd get rid of most of the shadow buffering and try to
> >> mmap pages directly from GEM objects. For modesetting, this means that
> >> the new mode's framebuffer has to inherit the old framebuffer's buffer
> >> objects. Probably the easiest solution is to allocate a framebuffer once
> >> and reconfigure its parameters (width, height, pitch) on each modeset
> >> operation.
> >>
> >> Switching to a higher resolution would require more video memory.
> >> Although we cannot reallocate, this problem can be solved with the
> >> drm_fbdev_overalloc parameter. It gives the percentage of allocated
> >> video memory. If you start with 800x600 with overalloc at 400, you'd get
> >> enough video memory for 2400 scanlines. This allows for fbdev panning
> >> (i.e., pageflipping). With that extra memory fbdev could switch to
> >> another display mode with a higher resolution. For example, changing to
> >> 1024x786 would result in 1875 scanlines at the given overalloc of 400.
> >>
> >> To implement this, I guess that some of fbdev's memory allocation needs
> >> to be changed. The check_var and set_par code needs an update to handle
> >> the modeset. And I suspect that there are other dark corners that need
> >> to be reworked as well.
> > 
> > That sounds good. In a similar fashion to drm_fbdev_overalloc another, rather hacky
> > but vastly simpler approach, would be to basically allow the drivers to specify the
> > maximum size of fb to support in drm_fbdev_generic_setup. This would just directly
> > set the drm_fb_helper_surface_size::surface_width and surface_height with the end
> > result being that drm_client_framebuffer_create would be called with those values
> > and xres_virtual/yres_virtual would be set to them. Resizing would basically just
> > work then, right? Of course at the cost of possibly large allocation, e.g. 4k fb
> > even when only 800x600 is actually used.
> 
> For the absolute size of fbdev memory, I think we should introduce a 
> module parameter in drm_fb_helper, which an option to set a default 
> value in the kernel config. It would benefit all drivers that use fbdev 
> emulation and work how overalloc works.
> 
> If no size is given, the current approach would be used.
> 
> I don't think resizing would work immediately. There isn't anything in 
> the check_var and set_par functions that implements the necessary atomic 
> check and commit.

set_par() is the thing tht does the commit.

-- 
Ville Syrjälä
Intel
