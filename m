Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FEAA400AE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F42910E2EC;
	Fri, 21 Feb 2025 20:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8eI8Dba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969C510E2EC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740169334; x=1771705334;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AUzvSnv84EpX4e4E79CiVNx0gt1v4fC+4XcCV1madfA=;
 b=D8eI8DbaaoqdX4FxvOfTqKOJMVJ++A6wRQDicgr/BEnuAtznRbux1qKT
 D9NZSJ/nNSAPslCmyo79RVIQpV0dHweRKJHIzNUVV/ev5r0lEbcXQBBKq
 tsZ7fAbi/YcMmv7AGh13EifM21IiBd8fAOvhD5Q52OhuoMxQFKY0ojqeF
 GN/A9Eui/+2LoNAOCyXcD+y61JO+6Uum0HLq4IqZB3ACipQRuH851WD+L
 0GSbjyohnpFPZR6bbTWXVPr/lHVk3MEC3QBSz1icD1J4PFWc1OVwlXYZj
 byYsssaRfPDtLrDxCaRDLGfRI9lLDx4Ghrd5FPuWZQFxrjLWC9kwVK00u w==;
X-CSE-ConnectionGUID: E18dnb0KTv2qFIKjz6vwZw==
X-CSE-MsgGUID: MMgH6wPESVSM/0S/6nFKmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44650193"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="44650193"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:22:13 -0800
X-CSE-ConnectionGUID: X3EO2ExMQRaPtqTxAjtKxw==
X-CSE-MsgGUID: ztBA2dFsRaKo1BmM0ylV9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120442343"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:22:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tlZX6-0000000Djvj-2poe; Fri, 21 Feb 2025 22:22:00 +0200
Date: Fri, 21 Feb 2025 22:22:00 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7jgaL0u8VzN-12X@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
 <Z7ib8uH91rKdoyjP@smile.fi.intel.com>
 <ED4B4FD3-CD26-4200-97E0-BC01B3408A4C@live.com>
 <Z7jfiKNt-bThVr_-@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7jfiKNt-bThVr_-@smile.fi.intel.com>
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

On Fri, Feb 21, 2025 at 10:18:16PM +0200, andriy.shevchenko@linux.intel.com wrote:
> On Fri, Feb 21, 2025 at 07:37:17PM +0000, Aditya Garg wrote:
> > > On 21 Feb 2025, at 8:59 PM, andriy.shevchenko@linux.intel.com wrote:
> > > On Fri, Feb 21, 2025 at 11:37:13AM +0000, Aditya Garg wrote:
> 
> > > First of all, I do not see the cover letter. Is it only an issue on my side?
> > 
> > These are literally 3 patches that are self explanatory.
> 
> So what? Anybody will be puzzled with the simple question (and probably not the
> only one): Why are these in the series? Do they dependent or independent? What's
> the goal and how they should be routed? (You see, there are already 4).
> 
> > Is this a hard and fast rule that a cover letter MUST be there?
> 
> Cover letter SHOULD be there if there are more than one patch.
> Yes, there are exceptions, but this is the idea for the series.

FWIW, two more points:
1) yes, it's a MUST for some subsystems (BPF has this even documented);
2) there are tools (`b4`) that rely on the cover letter (shazam feature
or multiplying trailers if it/they was/were given against the cover letter).

> Use your common sense, if there is no documented thingy.

-- 
With Best Regards,
Andy Shevchenko


