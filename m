Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4CA7E012
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29C710E451;
	Mon,  7 Apr 2025 13:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njm3MsMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C49810E451
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744034069; x=1775570069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ebTEjSHDPVKHjqLElg5dQchc9kRzX7fngXPEzS/5OSM=;
 b=njm3MsMYe6kHl/CYawpupEj+4QjzldJGxB35jbFlLuhcDre8lRlzT18x
 79NMkxUqetu9yF3quKpsrZKVIZ9VIQKkWWo4EuU6QPJBKVozfW5Ff2T6E
 kSTPFsqexBO3T3zzGuB1IELuqNUpTCEfEGoCO+wNJEGb5wQauRw1PAgRo
 ZqOF/w54DS3Ihn8TE/K495z32OIb15KYWut+e5hqynxPG3JY5qXoDYQ/L
 vgF7Va4Bhr2ccyAZVLLDC5T0Hd7zwU9mTcMaRSLOTwquSIpfhYjNXijxa
 do3MhgW6YBTZjQUhActD/6C54inz424mZ46t1Aus7daSDyMpCFZMQL8Me Q==;
X-CSE-ConnectionGUID: sU9Y696jQ/6iqpq6SCdGPQ==
X-CSE-MsgGUID: lgZV76qxRbKjIPQ9IBL0wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45587699"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45587699"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 06:54:25 -0700
X-CSE-ConnectionGUID: Dy4TRIkCT5CJkptOv4ahSw==
X-CSE-MsgGUID: ehvvZzDbTdKqfCX5RZ/uWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="133171633"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 06:54:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u1mvW-0000000A5On-3Pgc; Mon, 07 Apr 2025 16:54:14 +0300
Date: Mon, 7 Apr 2025 16:54:14 +0300
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
Subject: Re: [PATCH v3 3/3] drm/appletbdrm: use %p4cl instead of %p4cc
Message-ID: <Z_PZBr0BPnkuoLs2@smile.fi.intel.com>
References: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
 <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon, Apr 07, 2025 at 07:07:54PM +0530, Aditya Garg wrote:
> From: Aditya Garg <gargaditya08@live.com>
> 
> Due to lack of a proper printk format, %p4cc was being used instead of

s/printk format/format specifier/

That's basically the term (`man printf`) everybody knows.

> %p4cl for the purpose of printing FourCCs. But the disadvange was that
> they were being printed in a reverse order. %p4cl should correct this
> issue.

-- 
With Best Regards,
Andy Shevchenko


