Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86A84E7E9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 19:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3675810E770;
	Thu,  8 Feb 2024 18:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/SD1BKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E1010E770
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 18:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707417866; x=1738953866;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FwIEvbIyDlMFxgWm5210JjjZWsFfvyKu6CmmNNZp5jI=;
 b=b/SD1BKVq5TYzJ27UbnQWhK03y10mrugAqQpNDVk5nwNGq830sS2ghYU
 RPVRbZSb32xBXBbd5Iagdv30DjHEPCKVs6NPpjbKZY4WUCyqnidl5Ahdo
 JGVvkAH+t5ZMocL9Kk7Td8uaUyszxRxPr9YXGidxydfwtTHpe9cDXvDz5
 /g4KqNJWZKnRvvtCDbHdDSCPKWeGN8RzPWbv7HHI62fIFijL4ccrWPMD7
 HI5OsgMH3DCKrKAfT9NMlWuOaQeRKDP3PtzB9P67ON+kBjwIlpbNQdmwR
 PLfvpxleVaytJ3WlG/d8XKFZ+lV9DHXN2RuqU8eDVja003QxDQyjJrCSB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1178495"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1178495"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910468017"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="910468017"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:44:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rY9Nk-00000002xKP-0qzB; Thu, 08 Feb 2024 20:44:20 +0200
Date: Thu, 8 Feb 2024 20:44:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 1/3] backlight: mp3309c: Make use of device properties
Message-ID: <ZcUhA49GOI6nutHT@smile.fi.intel.com>
References: <20240208182608.2224191-1-andriy.shevchenko@linux.intel.com>
 <20240208182608.2224191-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208182608.2224191-2-andriy.shevchenko@linux.intel.com>
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

On Thu, Feb 08, 2024 at 08:24:46PM +0200, Andy Shevchenko wrote:
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
> 
> Add mod_devicetable.h include.

It seems some emails are missing, I just sent a 'resend v3' hopefully without
missing parts.

-- 
With Best Regards,
Andy Shevchenko


