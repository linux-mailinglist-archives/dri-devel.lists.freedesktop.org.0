Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCCDCE98AD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 12:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900F210E154;
	Tue, 30 Dec 2025 11:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzW4zhEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F76110E154
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767094443; x=1798630443;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Cbe+8bPo4xtiKIpnJiQxtHfRAryAeLaAaMe/2CqZYlc=;
 b=gzW4zhEjpNwZjid790An151luhxGZnZqAuUYOsLqjCbzcIqNbamxfOBS
 733NoH9PQ+HSAfLnJ/u/zoyF1LDjhxcLPZUxn8+C6LTPVlazbi+BN7ZiY
 HiWI4ENQZVZHkAaNiFUD5IlOXeHtEzh4MEQma03nKvAEHQq2niSvp8v+f
 1SS12/CBlXEqDqr0IEDXcT1AfgnHiuj87wLEVjZ0P6Jt8gjgyLcL5p8fM
 snLM/NT1VNBTkg2SkWWWE8vyYa/lN5MeH+xa+s61j1PpHa8qj628qC6lJ
 9MygK+FWvSFa4YN9xMQecTeAk1ov+D84AACmjWiublot1+ZoD0Sn/jS7i w==;
X-CSE-ConnectionGUID: lPqnxNx8QHmcPu686XRFHg==
X-CSE-MsgGUID: 0DbkdHAoQJ2S71urZeg3Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80134435"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="80134435"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 03:34:03 -0800
X-CSE-ConnectionGUID: ygyrfsbRQA+ybPTCbdlPSg==
X-CSE-MsgGUID: GL0VmTBwQJexoBqoyHeidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="205676780"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.103])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 03:34:00 -0800
Date: Tue, 30 Dec 2025 13:33:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Message-ID: <aVO4pslXIvnc00J3@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
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

On Mon, Dec 29, 2025 at 09:28:18PM -0800, Chintan Patel wrote:
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
> remove hard FB_DEVICE dependencies.
> 
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.

> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
> Changes in v3:
> - Use PTR_IF() to conditionally include overlay_sysfs_group in 
>   overlay_sysfs_groups
> - Decouple variable definition and assignment in fbtft_sysfs_init/exit

Any particular reasons you ignored my tag from v2?

-- 
With Best Regards,
Andy Shevchenko


