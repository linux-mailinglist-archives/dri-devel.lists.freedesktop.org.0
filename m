Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2BC959371
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 05:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DBE10E883;
	Wed, 21 Aug 2024 03:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahQ3B0di";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9BB10E882;
 Wed, 21 Aug 2024 03:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724212338; x=1755748338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xWGpi3FNTVpDRYtQlGQLl9i3kf/YdCCoa/UwitYL1FE=;
 b=ahQ3B0diDIkYFym1Gg+JYt4hzMsDpbgiUyec5Xz1XnU4JODp615CCYus
 fGJhIP1nq/iiM/S3CTWUYqPpq6ANSxrlYNlQO36dRAzcU2VTBbJ5u+HGO
 IIiiL9UTrqc5upgWkqTeN1BS5MJFjhiSz1kW121KxSp5tn3J5qX4cyQJg
 q5LSMpfTwG3qigtG8wMWwF0BKY9njyP7t+odkSR9i9rlFzHfSbQ6v+nxL
 +A/ByuNqH91g3i0QvEjV2iL2eiB4ckgz5OU+FuVY+/JlsxFWqZTgLc4Pa
 XjX99hMQhj9RiJpttTI2ellPoFUB2L1XAwIMqY/L083Sy+ZvHHbEI2QP7 Q==;
X-CSE-ConnectionGUID: Eg3CVZknSgWt6gAB/4wvcQ==
X-CSE-MsgGUID: YSOheMJlS3e+1C0mn3ey2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33936396"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="33936396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 20:52:17 -0700
X-CSE-ConnectionGUID: Vofor6GeT9arpAjPlJXtmw==
X-CSE-MsgGUID: H3o51Ve/T16jJIAkXacFSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="65647472"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 20:52:13 -0700
Date: Wed, 21 Aug 2024 06:52:10 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 linux@roeck-us.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZsVkapETDCTtx2_F@black.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
 <ZrYEQqs0IwDHWkGx@ashyti-mobl2.lan>
 <ZsRbK8TEk5GZDl0C@black.fi.intel.com> <ZsUPY4zJwEGAf_t_@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsUPY4zJwEGAf_t_@intel.com>
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

On Tue, Aug 20, 2024 at 05:49:23PM -0400, Rodrigo Vivi wrote:
> On Tue, Aug 20, 2024 at 12:00:27PM +0300, Raag Jadav wrote:
> > On Fri, Aug 09, 2024 at 12:57:54PM +0100, Andi Shyti wrote:
> > > On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:
> > > > > Add hwmon support for fan1_input attribute, which will expose fan speed
> > > > > in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> > > > > 
> > > > > $ sensors
> > > > > i915-pci-0300
> > > > > Adapter: PCI adapter
> > > > > in0:         653.00 mV
> > > > > fan1:        3833 RPM
> > > > > power1:           N/A  (max =  43.00 W)
> > > > > energy1:      32.02 kJ
> > > > 
> > > > > v2:
> > > > > - Add mutex protection
> > > > > - Handle overflow
> > > > > - Add ABI documentation
> > > > > - Aesthetic adjustments (Riana)
> > > > > 
> > > > > v3:
> > > > > - Declare rotations as "long" and drop redundant casting
> > > > > - Change date and version in ABI documentation
> > > > > - Add commenter name in changelog (Riana)
> > > > > 
> > > > > v4:
> > > > > - Fix wakeref leak
> > > > > - Drop switch case and simplify hwm_fan_xx() (Andi)
> > > > 
> > > > I do not understand why we pollute Git history with changelogs, but it's
> > > > probably the ugly atavism in DRM workflow.
> > > 
> > > I never liked it! Besides it should even be against the
> > > submitting patches recommendation.
> > > 
> > > I don't understand what interest might have someone in a couple
> > > of years, reading this commit, knowing an unintellegible list of
> > > differences between v2 and v3.
> > > 
> > > I consider it a random pollution of the commit log.
> 
> I agree it is ugly. But I don't agree it is just a 'random polution'.
> 
> I consider a valid and very useful information of the patch history.
> Very useful for a later cross check to know what exactly version
> of that patch got merged.
> Useful for distros on backports as well.

Isn't this why we have 'Link' as part of commit which points to
actual ML submission?

> > 
> > Isn't it already documented?
> > Documentation/process/submitting-patches.rst
> 
> I think it is:
> 
> "Be sure to tell the reviewers what changes you are making and to thank them
>  for their time.  Code review is a tiring and time-consuming process, and
>  reviewers sometimes get grumpy.  Even in that case, though, respond
>  politely and address the problems they have pointed out.  When sending a next
>  version, add a ``patch changelog`` to the cover letter or to individual patches
>  explaining difference against previous submission
> "
> 
> Then:
> 
> '''
> Example of a patch submitted by the From: author::
> '''
> 
> defines 'changelog' as the block above the signatures.
> 
> And
> 
> 'The canonical patch format'
> 
> also tells that anything after '---' marker line is for
> "Any additional comments not suitable for the changelog."
> 
> But well, the important part is to have the version information
> available for reviewers.

Can still be available below '---' marker.

Raag
