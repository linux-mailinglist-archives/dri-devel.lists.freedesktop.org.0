Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E3EA217DE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 08:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB72A10E73E;
	Wed, 29 Jan 2025 07:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbSbY2+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4908310E06E;
 Wed, 29 Jan 2025 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738134295; x=1769670295;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y3VRUb3PmeMld5+U168mbNCYtLVpYo9aXmk/0RVKA10=;
 b=fbSbY2+0Jp1cP0Pvd2HNw+qLR1hunaYQ3sYRgRwKAGYcCQbOacNzE4Wn
 Xf7GUmzBgAtrG1czb4sWKQHr/cbFPBCTCjndIsWkQwM36rhio0+GauR5+
 Ndl/yqu7cMYE1ec0g+aBGGgpmT4ESBRjY6259zYPIaAr4xwijDBTcc2EL
 HGKS6+aFXdltpgyiox8Bfq2UeypN+TzDXrMvOCDYOlMQG7sBJXi98raNv
 v9KvP8dQKUqGaFfUU8XZs4wOi7dIRZ5O/U+Q/RaWebJClFufxm1r8NFtD
 JXybCi/qoR3p0I6ZDs/IICrunE7o5phIuPD0jEh9+L35B+XrVdpkhw3C7 A==;
X-CSE-ConnectionGUID: vswKM3MOScKmm7NIBNcXwQ==
X-CSE-MsgGUID: N8gTz9onQJG2Tz2j/rpzNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38541759"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38541759"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 23:04:54 -0800
X-CSE-ConnectionGUID: j1JpE7l4QfyiDOMqv/HX3A==
X-CSE-MsgGUID: DSqUCl9GQCen2U0J1bPgqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108803685"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 23:04:49 -0800
Date: Wed, 29 Jan 2025 09:04:46 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Xaver Hugl <xaver.hugl@kde.org>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 christian.koenig@amd.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v10 2/4] drm/doc: Document device wedged event
Message-ID: <Z5nTDrUVQjCcK9Cb@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
 <CAFZQkGy3R0TMY5CARPQZF70fdKGLX8GQjV_YQAHzEXsiuNHj+w@mail.gmail.com>
 <Z5CAkXSOpNiiFbv4@black.fi.intel.com>
 <20250127122328.6d85bca1@eldfell>
 <Z5ilcc0hC8nvz0Li@black.fi.intel.com>
 <20250128133809.1e5ed2be@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128133809.1e5ed2be@eldfell>
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

On Tue, Jan 28, 2025 at 01:38:09PM +0200, Pekka Paalanen wrote:
> On Tue, 28 Jan 2025 11:37:53 +0200
> Raag Jadav <raag.jadav@intel.com> wrote:
> 
> > On Mon, Jan 27, 2025 at 12:23:28PM +0200, Pekka Paalanen wrote:
> > > On Wed, 22 Jan 2025 07:22:25 +0200
> > > Raag Jadav <raag.jadav@intel.com> wrote:
> > >   
> > > > On Tue, Jan 21, 2025 at 02:14:56AM +0100, Xaver Hugl wrote:  
> > > > > > +It is the responsibility of the consumer to make sure that the device or
> > > > > > +its resources are not in use by any process before attempting recovery.    
> > > > > I'm not convinced this is actually doable in practice, outside of
> > > > > killing all apps that aren't the one trying to recover the GPU.
> > > > > Is this just about not crashing those processes if they don't handle
> > > > > GPU hotunplugs well, about leaks, or something else?    
> > > > 
> > > > Correct, all of it. And since the compositor is in charge of device resources,
> > > > this way it atleast has the opportunity to recover the device and recreate
> > > > context without all the userspace violence.  
> > > 
> > > Hi Raag,
> > > 
> > > sorry, I haven't followed this series, so I wonder, why should
> > > userspace be part of recovering the device? Why doesn't the kernel
> > > automatically load a new driver instance with a new DRM device node?  
> > 
> > There are things like bus level reset (PCI SBR) and re-enumeration that are
> > not possible from driver context (or atleast I'm not aware of it), so a new
> > instance is just as useful/less as the old one.
> 
> Ok, "not possible from driver context" is a key revelation. I wonder if
> starting an overview section with that in the documentation would help
> getting the right mindset.

Not "not possible" in a literal sense, but rather allowing something that
drastic and convoluted that is probably beyond the scope of the driver.

> Did I miss that somewhere?

The first two paragraphs are meant as an introduction. Let me know if
something's not translating so well.

> I thought bus level reset meant resetting the PCI device by some bus
> API. Clearly mistaken, I suppose you mean resetting the whole bus
> including everything on it?

I'm no PCI expert but yes, it is atleast my understanding.

...

> > > (More important for userspace would be know if dmabuf fds remain
> > > pointing to valid memory retaining its contents or if the contents are
> > > lost. Userspace cannot tell which device a dmabuf originates from,
> > > AFAIK, so this would need to be added in the generic dmabuf UAPI.)  
> > 
> > Not sure if I understand, perhaps Christian can shed some light here.
> 
> A system might have multiple GPUs, and one GPU going down may leave all
> the rest working as usual. A Wayland compositor would want to tell the
> difference between still-good and possibly or definitely lost dmabufs
> it received from its clients.

Usually 'DEVNAME=' and 'DEVPATH=' values refer to the device that generates
the event.

> But this is off-topic in this thread I believe, nothing to the series
> at hand.

...

> > > > > > +be unmapped and file descriptors should be closed to prevent leaks.    
> > > > > Afaiu from a userspace POV, a rebind is just like a GPU hotunplug +
> > > > > hotplug with matching "remove" and "add" udev events. As long as the
> > > > > application cleans up resources related to the device when it receives
> > > > > the event, there should be no leaks with a normal hotunplug... Is this
> > > > > different enough that we can't have the same expectations?    
> > > > 
> > > > The thing about "remove" event is that it is generated *after* we opt for an
> > > > unbind, and at that point it might be already too late if userspace doesn't
> > > > get enough time to clean things up while the device is removed with a live
> > > > client resulting in unknown consequences.
> > > > 
> > > > The idea here is to clean things up *before* we opt for an unbind leaving
> > > > no room for side effects.  
> > > 
> > > Something here feels fragile. There should not be a deadline for
> > > userspace to finish cleaning up. What was described for KMS device nodes
> > > in this same document seems like a more reliable approach: keep the
> > > dead driver instance around until userspace has closed all references
> > > to it. The device node could be removed earlier.  
> > 
> > I'm not sure if I'm following here. The driver instance will exist as long
> > as the dead device exists, which the consumer can remove if/when it chooses
> > to trigger an unbind from userspace. There is no deadline for it.
> 
> I was going by your words: "it might be already too late if userspace
> doesn't get enough time to clean things up".

The idea here is to completely detach kernel and userspace *before* moving
forward with the recovery.

> > The consumer can choose to rely on hotplug events if it wishes, but the point
> > here is that it doesn't guarantee a clean recovery in all cases.
> 
> Clearly I don't understand the whole picture here. No worries,
> nevermind.

Less moving parts comes with more chances of success.

Raag
