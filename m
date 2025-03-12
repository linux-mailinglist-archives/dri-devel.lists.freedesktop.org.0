Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFF8A5DF79
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6D410E79E;
	Wed, 12 Mar 2025 14:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGs9z2Ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010910E797
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741791132; x=1773327132;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j1+DQrW2hu38Z+BntXeNALD5D4vpTA/plK8+3CxmS2I=;
 b=oGs9z2UdAvI2K7nDq3Uad9pYzyCPPOJRT87z7Bp5yYrd336fQ5UXBjM4
 0JHl+WyHRSWf2wUBh5XBy/vAI6O9nZlYi9EYEmth3e5v74c8nMdwxQTsv
 aICq9j2OPzxu6cThTM+zD61nEGjMd43LKLSYNL/atbwa62HzZ+NJsBr+C
 V3E8pSfsDqgWui21S6+1Nxd2J3ytGIl/Gbp0oyilDWJBWMS1BcY/ETDCo
 wGZj5nDeICXl4bAvyqqt1bkcSylG3g3zH/+Q39UikJkvIoYjaYFtEHUkO
 VtWMTQciZbUE2v+nrqbBT3LwxuHvfO11t3ph8n+Gj2HF0+0hwmlklS1/y Q==;
X-CSE-ConnectionGUID: 206mgLpUTfalMijO9//T1Q==
X-CSE-MsgGUID: D/ABeuRgRSiC64kSSKWhOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42600335"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="42600335"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:52:12 -0700
X-CSE-ConnectionGUID: L65x+ikNSseKTt09nxHYjQ==
X-CSE-MsgGUID: Fg9byZGeRBm4zhT4C3KFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="125842851"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:52:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tsNR9-00000001tVs-3Stg; Wed, 12 Mar 2025 16:51:59 +0200
Date: Wed, 12 Mar 2025 16:51:59 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH 2/2] drm/appletbdm: use %p4cl instead of %p4cc
Message-ID: <Z9Gfj_f0Ug7vLIfd@smile.fi.intel.com>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
 <33F3F7E2-24AE-4F29-9053-3B502D075BA8@live.com>
 <be2f49b5-dcdc-4954-b650-90670dfa70b9@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be2f49b5-dcdc-4954-b650-90670dfa70b9@suse.de>
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

On Wed, Mar 12, 2025 at 12:51:33PM +0100, Thomas Zimmermann wrote:
> Am 12.03.25 um 10:06 schrieb Aditya Garg:

...

> If you want to print out protocol-header tokens, why not use formatting
> macros as we do with DRM mode? There's one for the format string [1] and one
> for the argument. [2] It's not as fancy as the conversion code, but you'll
> get something for your driver that is easily understandable.

The benefit of the specific code formatters as in this patch at least in the
stack usage and hence a lot of code generated again and again. I believe you
can get rid of dozens of (kilo?) bytes in DRM on top of compensating this in
the printf() implementation. This backs us to the discussion on how the best
would be to implement custom printf() specifiers...

-- 
With Best Regards,
Andy Shevchenko


