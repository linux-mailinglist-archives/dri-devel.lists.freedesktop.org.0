Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73360958190
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A20510E2E7;
	Tue, 20 Aug 2024 09:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i41hJDdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10DC10E050;
 Tue, 20 Aug 2024 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724144435; x=1755680435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N/2n6+TMCGjpJV1UloCrG/l1ip+b8yTgzRdVJBE9X4U=;
 b=i41hJDdCtKZVo5OnbgpY8SuDwkyxRA2cgfgtsiZAQttX99AwVgpq6IBj
 SK41mEYkAQcS8r32fMs29aQXw+ii6RQmXfO4dd4jPtu6Cg59JEhVDIFKy
 m6AxQLKIqJfeUMWrn1SqS6fvt/+qdBP+yWfdm4fTq9Nl+5BHN5FxX/CCh
 YcAtFiZfNPPJ09dwLEYv/qJ6uUnJCFVdO2Kz7k9y2yM7aAn8RtpySzscm
 BAecrkexoEWDw16Jp/VTdfKYgmmnr1RfEIvAQBmIvbt+ePxG3ITgs2lyz
 TmZ8hKDNZ2CrLtyGBQFXsT4rUStyh7YY4L87GryclcMkBiSoR/k6DZ7fA Q==;
X-CSE-ConnectionGUID: 73esWyIDToKAcom8G1ypuw==
X-CSE-MsgGUID: a3nYecMNSJK16IWT7scVfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22595737"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22595737"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 02:00:34 -0700
X-CSE-ConnectionGUID: C7avtJ4oRQG7WfUgBXBFQQ==
X-CSE-MsgGUID: IOrPGsCnQNC6ISeon830uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="98123500"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 02:00:30 -0700
Date: Tue, 20 Aug 2024 12:00:27 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZsRbK8TEk5GZDl0C@black.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
 <ZrYEQqs0IwDHWkGx@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrYEQqs0IwDHWkGx@ashyti-mobl2.lan>
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

On Fri, Aug 09, 2024 at 12:57:54PM +0100, Andi Shyti wrote:
> On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:
> > > Add hwmon support for fan1_input attribute, which will expose fan speed
> > > in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> > > 
> > > $ sensors
> > > i915-pci-0300
> > > Adapter: PCI adapter
> > > in0:         653.00 mV
> > > fan1:        3833 RPM
> > > power1:           N/A  (max =  43.00 W)
> > > energy1:      32.02 kJ
> > 
> > > v2:
> > > - Add mutex protection
> > > - Handle overflow
> > > - Add ABI documentation
> > > - Aesthetic adjustments (Riana)
> > > 
> > > v3:
> > > - Declare rotations as "long" and drop redundant casting
> > > - Change date and version in ABI documentation
> > > - Add commenter name in changelog (Riana)
> > > 
> > > v4:
> > > - Fix wakeref leak
> > > - Drop switch case and simplify hwm_fan_xx() (Andi)
> > 
> > I do not understand why we pollute Git history with changelogs, but it's
> > probably the ugly atavism in DRM workflow.
> 
> I never liked it! Besides it should even be against the
> submitting patches recommendation.
> 
> I don't understand what interest might have someone in a couple
> of years, reading this commit, knowing an unintellegible list of
> differences between v2 and v3.
> 
> I consider it a random pollution of the commit log.

Isn't it already documented?
Documentation/process/submitting-patches.rst

Please put this information **after** the ``---`` line which separates
the changelog from the rest of the patch. The version information is
not part of the changelog which gets committed to the git tree. It is
additional information for the reviewers. If it's placed above the
commit tags, it needs manual interaction to remove it. If it is below
the separator line, it gets automatically stripped off when applying the
patch::

  <commit message>
  ...
  Signed-off-by: Author <author@mail>
  ---
  V2 -> V3: Removed redundant helper function
  V1 -> V2: Cleaned up coding style and addressed review comments

  path/to/file | 5+++--
  ...

Raag
> 
> Andi
