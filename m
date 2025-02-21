Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1DBA400B6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DA510E2EF;
	Fri, 21 Feb 2025 20:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3KGzY/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417C710E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 20:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740169411; x=1771705411;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CKyMGvQhaCbbM4dHKRxSbETXs/jXlj2mdEkycK6ltnc=;
 b=V3KGzY/59b6oyMtnpqcfhwBuZ/ZhjZtxoG+Q1rBFdr+NmVl2pmLQ4IGD
 x5nV0IXiEt7sAyKNVzQjZjJvQ9G/T2qRJkY2rVYbZU00qSiOZHbg7dVk6
 Bx4nlQcGzmKFChlbgNrdh0lFJxXYvkqKxRv5iohaJAR7biWHYln4PPlKK
 aQt4lenQjawHMRmxz6C3uQsKJ8aFJw8RtRbN6b32s+DUqF1ETq+behvBb
 KqIQQn/Q2yrr1/1x5YEfOt9wY4tBJvLBnL+pzK4afvnUOB4hBag2XcVk4
 nFuJxcSew7VurJM9RyIGZ8c/EDbiqodEm8pSEXsFxoBxQ5N5XS1JbyW9n w==;
X-CSE-ConnectionGUID: vCp1tr0PSvWS5FuDKvGzIA==
X-CSE-MsgGUID: ePKXefWiSbqYNiKIcKLriQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51626695"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51626695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:23:30 -0800
X-CSE-ConnectionGUID: PzHLL2JBRAenORdpJeglfQ==
X-CSE-MsgGUID: Z8nvZSezQB2xxyUO5TUppA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115993652"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:23:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tlZYN-0000000DjxE-45Ss; Fri, 21 Feb 2025 22:23:19 +0200
Date: Fri, 21 Feb 2025 22:23:19 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "kekrby@gmail.com" <kekrby@gmail.com>,
 "admin@kodeit.net" <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 "evepolonium@gmail.com" <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7jgt7c1n6-J4iSO@smile.fi.intel.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <Z7ibRHb2FS1cTx0O@smile.fi.intel.com>
 <9C31901A-2C5C-478B-BB1C-D4705939EE4D@live.com>
 <PNZPR01MB4478C12B911E293C645E6EA6B8C72@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PNZPR01MB4478C12B911E293C645E6EA6B8C72@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
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

On Fri, Feb 21, 2025 at 08:06:51PM +0000, Aditya Garg wrote:
> 
> > Does this look good now? Made orig a union.
> 
> Wait, it's messier. Maybe declare data type of val separately in each case?

Yes, this sounds better.

-- 
With Best Regards,
Andy Shevchenko


