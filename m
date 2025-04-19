Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E04A9446D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 18:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D312510E092;
	Sat, 19 Apr 2025 16:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpswxk4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461D910E092;
 Sat, 19 Apr 2025 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745079302; x=1776615302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1lL19XfUqEwKIcHE307+MGee0gbFnU3PXLODld9yEr4=;
 b=cpswxk4uvpxeFH8nVzdWNb/IRFHHfjT6citcEIHf0wDqKdQZ6zfYbdwQ
 j74UXCpkFbH+f79YCRqKxg2CqYKXis0Vh9q3aUBgJhJgxZwLXpMpOmOON
 mnude6Nr2u8RfTaP4wM2fuWHhNjgct9WzfsuOFwoMOpu3h+lXYjGpqgmU
 vVpT1PPoQuboe4vHbb4FfIbKgaJ87VNJfy0Fxyis6PS2gfr4162jyemM3
 ybr8v49MfPLUGYhdX+MfMQZ1NglVvnvaZZrC0Blf4dy6RDMLuJfOmGx/p
 vX57S0uOqcUfIg3CVXp5TtJU5tAZ9JTRhCUYZo/OOofrAVqjZdeBz72Ta Q==;
X-CSE-ConnectionGUID: w2N97vsOTLmheKgKTsdg7g==
X-CSE-MsgGUID: z82dHODPSY+JST+Gd9UKmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="58059148"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; d="scan'208";a="58059148"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2025 09:15:01 -0700
X-CSE-ConnectionGUID: 8p+RqmlBQMuXCyHFW50Q4g==
X-CSE-MsgGUID: fVr3TMPGT+u/BT4PcUDyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; d="scan'208";a="131920411"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP; 19 Apr 2025 09:14:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 2B1A9170; Sat, 19 Apr 2025 19:14:54 +0300 (EEST)
Date: Sat, 19 Apr 2025 19:14:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Don't create Python bytecode when building the
 kernel
Message-ID: <aAPL_hKx8cxypHe6@black.fi.intel.com>
References: <cover.1745019660.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1745019660.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Sat, Apr 19, 2025 at 07:50:01AM +0800, Mauro Carvalho Chehab wrote:
> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__.  As one may be using
> O= and even having the sources on a read-only mount point, disable its
> creation during build time.
> 
> This is done by adding PYTHONDONTWRITEBYTECODE=1 on every place
> where the script is called within Kbuild and when called via another script.
>  
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
> 
> This series contain 4 patches:
> 
> - patch 1 adjusts a variable that pass extra data to scripts/kerneldoc.py;
> - patch 2moves scripts/kernel-doc location to the main makefile
>   and exports it, as scripts/Makefile.build will need it;
> - patch 3 disables __pycache__ generation and ensure that the entire Kbuild
>   will use KERNELDOC var for the location of kernel-doc;
> - patch 4 adds *.pyc at the list of object files to be ignored.

This one works for me, thanks!
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


