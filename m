Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8CA7E018
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BA710E46B;
	Mon,  7 Apr 2025 13:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcPQLc2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E9D10E46B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744034151; x=1775570151;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w+Szp4qRe6od/VKiQ0QTbtbzWdiqzc20uA+XzIXV+Ek=;
 b=QcPQLc2jfZhhJUNKPuGN2seu0DqDk9xO+8ahUUOwos2XBn3tGhkRatd7
 E+ahYjlGNqxHXJyPgeoWwsi8zCG475YgLs+MOxy+hBVK8wxXlHUFIQ+Z5
 /NtKEVqTcnjr4KRw1tQyrzu5aUMehiaWPn6zTj2FE3AesVuI8ignnBMVg
 6TcGa9iVogGN+QwnUUBU4d3GGgwBBfZhIQ0pOp4Jqh0QOOdwDE6D6/JmO
 aRSGM3A/upWWzAg0xSIFMrOHNIKWC/wqLefcG4cuWNYY/eK6D870Efzke
 gAzUnxK3Dz6Z4/0Q6CJr+HP0lVyoQrRX3qTL4DHND/Ig6StziKfFoUN4l Q==;
X-CSE-ConnectionGUID: aYoyTEjMRsWo4P3IBhyHGA==
X-CSE-MsgGUID: BDoJF0kiSK+lEUyXTxKORQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56058810"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56058810"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 06:55:50 -0700
X-CSE-ConnectionGUID: yN/pI+e+RzqBjngpWOGVkg==
X-CSE-MsgGUID: aSeNLAvTQue274cUj/gT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="132100493"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 06:55:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u1mwv-0000000A5Q5-0pqS; Mon, 07 Apr 2025 16:55:41 +0300
Date: Mon, 7 Apr 2025 16:55:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 0/3] Use proper printk format in appletbdrm
Message-ID: <Z_PZXPAklfkMlx6O@smile.fi.intel.com>
References: <PN3PR01MB9597596DA5DA9FC02825CF0FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597596DA5DA9FC02825CF0FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon, Apr 07, 2025 at 07:05:13PM +0530, Aditya Garg wrote:
> The vsprint patch was originally being sent as a seperate patch [1], and
> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> them via DRM.


Your message is detached from the thread, make sure you use proper tools, e.g.

`git format-patch --thread --cover-letter -v3 ...` gives the correct result.

...

> [1]: https://lore.kernel.org/lkml/1A03A5B4-93AC-4307-AE6A-4A4C4B7E9472@live.com/

Even here you can use Link: tag

Link: https://lore.kernel.org/lkml/1A03A5B4-93AC-4307-AE6A-4A4C4B7E9472@live.com/ [1]

-- 
With Best Regards,
Andy Shevchenko


