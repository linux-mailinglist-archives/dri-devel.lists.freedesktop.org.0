Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79AA2076B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 10:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A94A10E613;
	Tue, 28 Jan 2025 09:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0uFOV60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1967F10E612;
 Tue, 28 Jan 2025 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738057082; x=1769593082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0OmVlqjNNBWDciJjn8c2KrLdS+04Lyx4uar8CJn7mK4=;
 b=I0uFOV60veSJjEG2DmC5bt2IcRFKbUfOEpm2ze9XhJnpMqBOPzAi7Dp0
 yVmknQvvkqjSwct9jGrU7jaat2iJeXZWPCsxQmFJKyKJ+M6Jlxo9TAe1d
 +T2YhT9EEkKTiTkhs7arbXF8hIlz+weITRKdxEzW3xJH0s0sUq5WPmwfO
 dBEQSJ4cY/z+2+IrbwD2gR4LTY+02A4jHuoHF7FkPkFmgr4f9oEgWNMNJ
 CdOqM2QPBRX8VzHoaFnhrzDAzMT9S17Hfhq8I6rzKC1rxJggN+MEh1657
 KEkP+kp1wq4J4ta9EmFzumLDbfWGCsCGsDvyVkI+cY1IiE2pzoiricwCl Q==;
X-CSE-ConnectionGUID: t4nCgrN0QvKUnkqHocLbbQ==
X-CSE-MsgGUID: 3nQINScGS4auGPtNixlgNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38568590"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="38568590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 01:38:02 -0800
X-CSE-ConnectionGUID: zeU0ymB6Qjiw5yMC4bCJMw==
X-CSE-MsgGUID: myfb1sMlR7ymjVtXsqMshw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113818126"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 01:37:56 -0800
Date: Tue, 28 Jan 2025 11:37:53 +0200
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
Message-ID: <Z5ilcc0hC8nvz0Li@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
 <CAFZQkGy3R0TMY5CARPQZF70fdKGLX8GQjV_YQAHzEXsiuNHj+w@mail.gmail.com>
 <Z5CAkXSOpNiiFbv4@black.fi.intel.com>
 <20250127122328.6d85bca1@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127122328.6d85bca1@eldfell>
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

On Mon, Jan 27, 2025 at 12:23:28PM +0200, Pekka Paalanen wrote:
> On Wed, 22 Jan 2025 07:22:25 +0200
> Raag Jadav <raag.jadav@intel.com> wrote:
> 
> > On Tue, Jan 21, 2025 at 02:14:56AM +0100, Xaver Hugl wrote:
> > > > +It is the responsibility of the consumer to make sure that the device or
> > > > +its resources are not in use by any process before attempting recovery.  
> > > I'm not convinced this is actually doable in practice, outside of
> > > killing all apps that aren't the one trying to recover the GPU.
> > > Is this just about not crashing those processes if they don't handle
> > > GPU hotunplugs well, about leaks, or something else?  
> > 
> > Correct, all of it. And since the compositor is in charge of device resources,
> > this way it atleast has the opportunity to recover the device and recreate
> > context without all the userspace violence.
> 
> Hi Raag,
> 
> sorry, I haven't followed this series, so I wonder, why should
> userspace be part of recovering the device? Why doesn't the kernel
> automatically load a new driver instance with a new DRM device node?

There are things like bus level reset (PCI SBR) and re-enumeration that are
not possible from driver context (or atleast I'm not aware of it), so a new
instance is just as useful/less as the old one.

> Of course userspace needs to deal with stuff suddenly erroring out, and
> destroy existing related resources, then wait for a working device
> to appear and rebuild all state. The kernel driver already needs to
> make the existing open stuff inert and harmless, why does it need an
> acknowledgement from userspace to unbind and re-bind?

Rebind is kind of a stepping stone to the above.

> > I'm not entirely aware of its feasibility though, perhaps something for the
> > consumers to experiment.
> 
> If consumers mean userspace, then no, not reliably. But the kernel can
> do it.

Can you please elaborate or refer to an example?

> I see in the commit message written:
> 
> 	"For example, if the driver supports multiple recovery methods,
> 	consumers can opt for the suitable one based on policy
> 	definition."
> 
> How could consumers know what to do? How can they guess what would be
> enough to recover the device? Isn't that the kernel driver's job to
> know?

Yes, 'WEDGED=' value are the known methods that are expected to work. The
policy is how the consumer can decide which one to opt for depending on the
scenario. For example, the less drastic method could work in most cases, but
you'd probably want to opt for a more drastic method for repeat offences or
perhaps if something more serious is discovered from "optional telemetry
collection".

> (More important for userspace would be know if dmabuf fds remain
> pointing to valid memory retaining its contents or if the contents are
> lost. Userspace cannot tell which device a dmabuf originates from,
> AFAIK, so this would need to be added in the generic dmabuf UAPI.)

Not sure if I understand, perhaps Christian can shed some light here.

> 	"Consumers can also choose to have the device available for
> 	debugging or additional data collection before performing the
> 	recovery."
> 
> Couldn't the wedged driver instance remain detached from the hardware
> while a new driver instance initializes? Then debug data remains until
> the wedged device is fully closed from userspace, or maybe devcore dump
> retains it.
> 
> I presume that WEDGED=none case should retain the debug data somehow as
> well.

Indeed, but it's optional so depends on the driver.

> > > > +With IOCTLs blocked and device already 'wedged', all device memory should
> 
> btw. when I see "blocked" I think of the function call not returning
> yet. But in this patch "blocked" seems to be synonymous for "returns
> an error immediately". Would it be possible to avoid the word "blocked"
> for this?

It is meant as "blocking the access", but fair enough. We can have a quick
fix later on if it's not too big of a concern.

> > > > +be unmapped and file descriptors should be closed to prevent leaks.  
> > > Afaiu from a userspace POV, a rebind is just like a GPU hotunplug +
> > > hotplug with matching "remove" and "add" udev events. As long as the
> > > application cleans up resources related to the device when it receives
> > > the event, there should be no leaks with a normal hotunplug... Is this
> > > different enough that we can't have the same expectations?  
> > 
> > The thing about "remove" event is that it is generated *after* we opt for an
> > unbind, and at that point it might be already too late if userspace doesn't
> > get enough time to clean things up while the device is removed with a live
> > client resulting in unknown consequences.
> > 
> > The idea here is to clean things up *before* we opt for an unbind leaving
> > no room for side effects.
> 
> Something here feels fragile. There should not be a deadline for
> userspace to finish cleaning up. What was described for KMS device nodes
> in this same document seems like a more reliable approach: keep the
> dead driver instance around until userspace has closed all references
> to it. The device node could be removed earlier.

I'm not sure if I'm following here. The driver instance will exist as long
as the dead device exists, which the consumer can remove if/when it chooses
to trigger an unbind from userspace. There is no deadline for it.

The consumer can choose to rely on hotplug events if it wishes, but the point
here is that it doesn't guarantee a clean recovery in all cases.

Raag
