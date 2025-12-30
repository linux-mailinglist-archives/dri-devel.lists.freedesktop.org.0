Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCDACE98C2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 12:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBFC10E1DE;
	Tue, 30 Dec 2025 11:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0feg1sb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB2410E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767094535; x=1798630535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ro1fQtcdyXioOXg7UpKgX7RPE/4YeZZwie7VLIsDjB0=;
 b=i0feg1sb81qikSTxMxVg370p0bk2hvH3MM2vlGTfxIJwTPNZI3KneoW4
 f7wWMMArr9CtmNWNztRc5pYkpmMmd/Cr4KCoe6GUOhFttGaA4OmmBH7g3
 2H12CyE3iqLrMFsoBjt4eMgHqGpRkxoDL42yk87prZmOWVMJMIeAYHJsY
 TEdAMlpHo1FrVAqaZ9Cm9PJguhWTZSbFeZcA97ISeaVTD77MZpG0T0Imp
 wfF32dt7n9OzfTMi9NJ6WGJXpz3s0eA9k6mhn7uh7CTbcHezmQWc6eENN
 26B3u7T0fWYvTq4aRP4vBcvqOPvGBrxNrlr7V6eVGStkX0tZLu25/QR+w A==;
X-CSE-ConnectionGUID: HNxTa+m0QX29AR21mMigXg==
X-CSE-MsgGUID: gP7R2HzmTJuyEeVMw3LtFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="91337870"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="91337870"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 03:35:35 -0800
X-CSE-ConnectionGUID: 99wXwo5rQ0mtNgfeKD6cPQ==
X-CSE-MsgGUID: jrRmfS8wT+G8GUxTs6KmoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="205677033"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.103])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 03:35:32 -0800
Date: Tue, 30 Dec 2025 13:35:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Message-ID: <aVO5ArzxFhS_nEWy@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-5-chintanlike@gmail.com>
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

On Mon, Dec 29, 2025 at 09:28:22PM -0800, Chintan Patel wrote:
> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
> core driver does not require CONFIG_FB_DEVICE.
> 
> Make sysfs support optional by defining overlay_sysfs_groups conditionally
> using PTR_IF(). The driver always sets .dev_groups, and the kernel
> naturally skips NULL attribute groups while the code remains buildable
> and type-checked.

...

> +static const struct attribute_group *overlay_sysfs_groups[] = {
> +	PTR_IF(IS_ENABLED(CONFIG_FB_DEVICE), &overlay_sysfs_group),
> +	NULL,

Please, drop comma at the end of the terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko


