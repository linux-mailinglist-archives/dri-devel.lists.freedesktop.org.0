Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A972FAA4B8D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F1B10E76B;
	Wed, 30 Apr 2025 12:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMc23zFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108DA10E76B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746017285; x=1777553285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FNSfl7sJXyyMr58cTcycGqVKOnJzdf3JLX0L3/BzZRA=;
 b=lMc23zFyAoi0g0yFynzt9/3VZuZi5fmJXx9MdZUx1hpupE0FNfMs3DDV
 3JKhY3pBlCVFYLuGibEs13Mc8K7g56twzap4hoa1GjWqI0uAXkkJQ8RqT
 kmh4frgGAkBYDMQfr3n6MbP/IoouFw2PolcR3QBZPqidUHIl56XwuCDrH
 RU9doH68NOnaJ26E8THmf3xmsNxPU/FMBOhl3eZOKMquOOotVdiAwpxiV
 o5yZyzbfjZV6ihVJR5CQMjzMNRU2dAQbsuK0Y+qIFsonuML29URbZfa2P
 X9ucWI02J8cKvmuz51rRhXhLaHkLdOyJ5kDjLyJ7O3fKNUJytVS/GvJ2Z A==;
X-CSE-ConnectionGUID: 5uPeXKgnRZ+lewMTh7kobA==
X-CSE-MsgGUID: 8k+VhpdSSAS8yXl57HQAEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58307629"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="58307629"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 05:48:04 -0700
X-CSE-ConnectionGUID: sgyrkr1tSMy/f8/B9aXFnw==
X-CSE-MsgGUID: 0xbFseEsT/SY1Zk732Sa5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134060316"
Received: from smile.fi.intel.com ([10.237.72.55])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 05:47:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uA6qx-00000001d0J-0oph; Wed, 30 Apr 2025 15:47:55 +0300
Date: Wed, 30 Apr 2025 15:47:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: pmladek@suse.com, admin@kodeit.net, airlied@redhat.com,
 akpm@linux-foundation.org, alyssa@rosenzweig.io, apw@canonical.com,
 asahi@lists.linux.dev, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, dwaipayanray1@gmail.com,
 geert@linux-m68k.org, joe@perches.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st,
 mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v2] checkpatch: remove %p4cn and add check for %p4chR
Message-ID: <aBIb-nOSUqaLgIsV@smile.fi.intel.com>
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95970CA0E1E1972B39405B43B8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95970CA0E1E1972B39405B43B8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Tue, Apr 29, 2025 at 05:50:30PM +0000, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.

...

> Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering")

> 

There shouldn't be blank lines in the tag block.

> Signed-off-by: Aditya Garg <gargaditya08@live.com>

-- 
With Best Regards,
Andy Shevchenko


