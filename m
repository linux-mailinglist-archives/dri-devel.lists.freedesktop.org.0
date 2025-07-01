Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F5AEFC15
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E441B10E2B2;
	Tue,  1 Jul 2025 14:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIFMAsjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E5210E2A6;
 Tue,  1 Jul 2025 14:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751379829; x=1782915829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N1XjWCKO8NlrmyZt5PKpLromN7WEIb6ICvSFSMmlh6w=;
 b=MIFMAsjZN7A9cySLXLvUuJiexJgOubkFjhpZLo+8E25+1gizceT9YFhO
 UkplB0AJa2XTYYXFunwsu9tlT8Mwr52kXi/vQJRSDMK/rD0AqzSSfFgUq
 MK+HFsBQ/FaG4+9ffTyX3DGR0DVTcIg6ZnHpU9sBh+czSns4fl/n7OpAI
 laRSL/hCgu+RdNeRwh1Jdl/g8ivoEjF6Cerp4wfZd73EinuJus800Yn1m
 8w7OJZ1a9EL2ft4AVOfRRFXmEw+jaKBPfRkfV8MKYUUiyi79eueI8JjxB
 uQNMB67+HcUSX86PVBUvJjrxxcPsuh5+l+dkdcSUshyArVTQOPgSZypXu w==;
X-CSE-ConnectionGUID: Q9sUz796R7q9jdTsaY25vg==
X-CSE-MsgGUID: rDeiKAX8TA+ZO2XRvviYYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57457037"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57457037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:23:48 -0700
X-CSE-ConnectionGUID: 5YH7lVyiSsauUXhVHhpXBA==
X-CSE-MsgGUID: a+0jdR1bQESySQbEJCDf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="184832597"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:23:45 -0700
Date: Tue, 1 Jul 2025 17:23:41 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
Message-ID: <aGPvbagza6HwF4kE@black.fi.intel.com>
References: <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com>
 <aFsaXXKZSBPrcYJb@intel.com> <aF8PZMuMgmWKYJgo@intel.com>
 <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
 <aGLKgholpl8Z3zWm@intel.com>
 <cebd70d9-57b5-4e89-b715-4ada250e2eb1@intel.com>
 <eb143cc5-306c-4900-b391-9ee023c1c5b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb143cc5-306c-4900-b391-9ee023c1c5b7@intel.com>
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

On Tue, Jul 01, 2025 at 05:11:24PM +0530, Riana Tauro wrote:
> On 7/1/2025 5:07 PM, Riana Tauro wrote:
> > On 6/30/2025 11:03 PM, Rodrigo Vivi wrote:
> > > On Mon, Jun 30, 2025 at 10:29:10AM +0200, Christian König wrote:
> > > > On 27.06.25 23:38, Rodrigo Vivi wrote:
> > > > > > > Or at least print a big warning into the system log?
> > > > > > > 
> > > > > > > I mean a firmware update is usually something which
> > > > > > > the system administrator triggers very explicitly
> > > > > > > because when it fails for some reason (e.g.
> > > > > > > unexpected reset, power outage or whatever) it can
> > > > > > > sometimes brick the HW.
> > > > > > > 
> > > > > > > I think it's rather brave to do this automatically.
> > > > > > > Are you sure we don't talk past each other on the
> > > > > > > meaning of the wedge event?
> > > > > > 
> > > > > > The goal is not to do that automatically, but raise the
> > > > > > uevent to the admin
> > > > > > with enough information that they can decide for the right correctable
> > > > > > action.
> > > > > 
> > > > > Christian, Andre, any concerns with this still?
> > > > 
> > > > Well, that sounds not quite the correct use case for wedge events.
> > > > 
> > > > See the wedge event is made for automation.
> > > 
> > > I respectfully disagree with this statement.
> > > 
> > > The wedged state in i915 and xe, then ported to drm, was never just about
> > > automation. Of course, the unbind + flr + rebind is one that driver
> > > cannot
> > > do by itself, hence needs automation. But wedge cases were also very
> > > useful
> > > in other situations like keeping the device in the failure stage for
> > > debuging
> > > (without automation) or keeping other critical things up like
> > > display with SW
> > > rendering (again, nothing about automation).
> > > 
> > > > For example to allow a process supervising containers get the
> > > > device working again and re-start the container which used it or
> > > > gather crash log etc .....
> > > > 
> > > > When you want to notify the system administrator which manual
> > > > intervention is necessary then I would just write that into the
> > > > system log and raise a device event with WEDGED=unknown.
> > > > 
> > > > What we could potentially do is to separate between
> > > > WEDGED=unknown and WEDGED=manual, e.g. between driver has no
> > > > idea what to do and driver printed useful info into the system
> > > > log.
> > > 
> > > Well, you are right here. Even our official documentation in drm-uapi.rst
> > > already tells that firmware flashing should be a case for 'unknown'.
> > 
> > I had added specific method since we know firmware flash will recover
> > the error.  Sure will change it.
> > 
> > In the current code, there is no recovery method named "unknown" even
> > though the document mentions it
> > 
> > https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/gpu/drm/
> > drm_drv.c#L534
> > 
> > Since we are adding something new, can it be "manual" instead of unknown?
> 
> Okay missed it. It's in the drm_dev_wedged_event function. Will use unknown
> > 
> > > Let's go with that then. And use other hints like logs and sysfs so,
> > > Admin
> > > has a better information of what to do.
> > > 
> > > > But creating an event with WEDGED=firmware-flash just sounds to
> > > > specific, when we go down that route we might soon have
> > > > WEDGE=change- bios-setting, WEDGE=....
> > > 
> > > Well, I agree that we shouldn't explode the options exponentially here.
> > > 
> > > Although I believe that firmware flashing should be a common case in many
> > > case and could be a candidate for another indication.
> > > 
> > > But let's move on with WEDGE='unknown' for this case.

I understand that WEDGED=firmware-flash can't be handled in a generic way
for all drivers but it is simply not as same as WEDGED=unknown since the
driver knows something specific needs to be done here.

I'm wondering if we could add a WEDGED=vendor-specific method for such
cases?

Chris? André?

Raag
