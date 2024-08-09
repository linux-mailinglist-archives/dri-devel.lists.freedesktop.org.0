Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489A94CFA9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 13:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F9C10E8D9;
	Fri,  9 Aug 2024 11:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RN/oWtJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE2910E8D9;
 Fri,  9 Aug 2024 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723204685; x=1754740685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p4NghQtm+bbcZA7K1a2/Zh3lpKaq8lRBcQcDk3r3BJo=;
 b=RN/oWtJbG+KMrP1FtZHAM6cRjbPK3pIoRYFtcOlHcZRQ/ZjWF/k77ppF
 eB+dCkxZlnNlPMlsAq+iX4iBwxVRwkaTy5N//M/wemraWdV288c+KKk4R
 xbehkckWHXoLhn/uVBbX7T/yPIoltZkpWwRdhR7yy5uJetGllzYY5JxU0
 gfwJYlXs2GTzhbKivUzKpaUrPqTWbvlVLDrmsFyOASPuMpUCqsebYk8Rk
 y8jraxkcOK74y1+lFCLpN+jb0Zk5y74XiAoVDu9KnqwpI9DpEiFPfzh95
 7NUSNQqyHA2vo9pJMMRZrb3kXtX6KalTkNMT7qkZKhmahIjH4TB/E64A8 Q==;
X-CSE-ConnectionGUID: I8Zp0Qc+QTOF5lwvg26t+Q==
X-CSE-MsgGUID: fWse+cAQS3CUFg3DqDXMRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32784228"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="32784228"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:58:05 -0700
X-CSE-ConnectionGUID: 4APDhaSoR0+u7qOu+pw0pA==
X-CSE-MsgGUID: cKBDlGJgSDKvvpBS/opWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61959473"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.169])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:57:58 -0700
Date: Fri, 9 Aug 2024 12:57:54 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZrYEQqs0IwDHWkGx@ashyti-mobl2.lan>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
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

On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:
> > Add hwmon support for fan1_input attribute, which will expose fan speed
> > in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> > 
> > $ sensors
> > i915-pci-0300
> > Adapter: PCI adapter
> > in0:         653.00 mV
> > fan1:        3833 RPM
> > power1:           N/A  (max =  43.00 W)
> > energy1:      32.02 kJ
> 
> > v2:
> > - Add mutex protection
> > - Handle overflow
> > - Add ABI documentation
> > - Aesthetic adjustments (Riana)
> > 
> > v3:
> > - Declare rotations as "long" and drop redundant casting
> > - Change date and version in ABI documentation
> > - Add commenter name in changelog (Riana)
> > 
> > v4:
> > - Fix wakeref leak
> > - Drop switch case and simplify hwm_fan_xx() (Andi)
> 
> I do not understand why we pollute Git history with changelogs, but it's
> probably the ugly atavism in DRM workflow.

I never liked it! Besides it should even be against the
submitting patches recommendation.

I don't understand what interest might have someone in a couple
of years, reading this commit, knowing an unintellegible list of
differences between v2 and v3.

I consider it a random pollution of the commit log.

Andi
