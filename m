Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2230FCE98D8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 12:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F0010E3DC;
	Tue, 30 Dec 2025 11:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AV/gYb1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D7610E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767094629; x=1798630629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1cd3v+rlDtb3b738kGiokap/SmqxKi+AyboVksECoTM=;
 b=AV/gYb1eYraGoCLYJVSKDfiDvbqnLFDydBxecNcIcZ34xubXrxVeb7rk
 9cn8V1ikVQ+2b5AacD6SngVwa2pm7tjSzhaoIeywM5oPFo4WdVYMQJZNv
 gytFmP9ArAn4QjSjI5JXjOPR7BnNtILNaj2rlro+eiK2PcI9yK05s+LgQ
 osnQoD2VK5uhCsFMTumQXlZkUajoBjQteYWfFBgP3R1XzBSolOg4lLOz2
 NX9wzgREl8wtbrefmiY9dttn6Qbdj7CYNxkWeouYbgJIa/b3CK4XhFJui
 d9nztYXkh159OcOPLTRPY/OkxJjulDROV0wPBwv+V74WQYiklNAt6au07 w==;
X-CSE-ConnectionGUID: 1iI1j34WSHKZghwuPvZA7w==
X-CSE-MsgGUID: Tst+7MyyRImPbmx4+c9a0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="91337990"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="91337990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 03:37:09 -0800
X-CSE-ConnectionGUID: /buD84sWQG6BnGPL+NoV2g==
X-CSE-MsgGUID: CcTFjQpzQ/qUEbbNX46BYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="201457503"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.103])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 03:37:06 -0800
Date: Tue, 30 Dec 2025 13:37:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Message-ID: <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-4-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-4-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Mon, Dec 29, 2025 at 09:28:21PM -0800, Chintan Patel wrote:
> omapfb provides several sysfs interfaces for framebuffer configuration
> and debugging, but these are not required for the core driver.
> 
> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() to obtain the backing device at runtime.
> When FB_DEVICE is disabled, sysfs operations are skipped while the code
> still builds and is type-checked.

...

> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);

Still the same issue I pointed out in v2 review.

>  		int t;
> +
> +		if (!dev)
> +			continue;

...

> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
> +
> +		if (!dev)
> +			continue;

Ditto.

-- 
With Best Regards,
Andy Shevchenko


