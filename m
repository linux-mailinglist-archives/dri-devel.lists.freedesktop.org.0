Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE6B3BA01
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C3B10E20F;
	Fri, 29 Aug 2025 11:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkPBDHri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EC010E210;
 Fri, 29 Aug 2025 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756467330; x=1788003330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HFvNeQpRuFggkVxUiCKm9Tk5+mf228T1GMnqBuwvQFc=;
 b=gkPBDHrilLHW/WeNAiPSdFHskLkE9iM4R7XJgnNP8GJc7pXL8AIOyOPf
 sVV5ydv9HflH4YPOzmvqhlghercctu8bciGBgP3mMTyKuODIh4DTu5V88
 aKaFVAZSGJH7pzkQGl429UtO89Saxk+jZMx/fJfPaT4Iwago+aonK3kfX
 hBCXB5wJmzvwwt2z3PIbsyCCaqmJkfH1c7cLlGUr1ruAOM0e8wTG1ugp7
 cCfvL/PHlU76PVOzo2Vb+4Fdx/WiFrzaoKAzl5xmLUQhA3RUYAagc1FuW
 kO8Bu7V9QftDlbJ2L5We49+sr15THl9FPv6VNBhbM67uX8RICccMPXt4P w==;
X-CSE-ConnectionGUID: Uwn8qYAMQaSOZTPGE/+V9A==
X-CSE-MsgGUID: XkhUwCJLQI6o7qU80Ef1yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81342674"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81342674"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:35:30 -0700
X-CSE-ConnectionGUID: aegE+q/+TEaTHzM7i7fV8w==
X-CSE-MsgGUID: DjzC7ZG6Qve0EncCnFbCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169663667"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 04:35:27 -0700
Date: Fri, 29 Aug 2025 13:35:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Steven Price <steven.price@arm.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, adrinael@adrinael.net,
 arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/4] lib: add support for opening Panthor devices
Message-ID: <20250829113523.t7salqbxioyy7u2p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
 <20250828130402.2549948-2-daniel.almeida@collabora.com>
 <2f9336f7-898e-4fe9-a17e-b41042de4d13@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f9336f7-898e-4fe9-a17e-b41042de4d13@arm.com>
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

Hi Steven,
On 2025-08-28 at 16:39:23 +0100, Steven Price wrote:
> On 28/08/2025 14:03, Daniel Almeida wrote:

In subject please add a fuller name what you improve,
as this is only one lib here, so a sligtly better:

[PATCH i-g-t 1/4] lib/drmtest: add support for Panthor devices

> > We will be adding tests for Panthor in a subsequent patch, so first add
> > the ability to open the device.
> > 
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> 
> There's also chipset_to_str() which should be updated to return the
> correct name. Although I think that only makes some error messages prettier.

Looks like something to improve, now I think driver name should
not be repeated in two places. I will sent a patch for this
function soon.

Regards,
Kamil

> 
> I'm not familiar enough with IGT to really provide a proper review, but
> I gave the tests a spin. See my comments on patch 4 for the bugs I hit ;)
> 
> Steve
> 
> > ---
> >  lib/drmtest.c | 1 +
> >  lib/drmtest.h | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 436b6de78..f4b429048 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -220,6 +220,7 @@ static const struct module {
> >  	{ DRIVER_INTEL, "i915", modprobe_i915 },
> >  	{ DRIVER_MSM, "msm" },
> >  	{ DRIVER_PANFROST, "panfrost" },
> > +	{ DRIVER_PANTHOR, "panthor" },
> >  	{ DRIVER_V3D, "v3d" },
> >  	{ DRIVER_VC4, "vc4" },
> >  	{ DRIVER_VGEM, "vgem" },
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index 27e5a18e2..1a933eae1 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -55,6 +55,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
> >  #define DRIVER_MSM	(1 << 6)
> >  #define DRIVER_XE	(1 << 7)
> >  #define DRIVER_VMWGFX   (1 << 8)
> > +#define DRIVER_PANTHOR   (1 << 9)
> >  
> >  /*
> >   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> 
