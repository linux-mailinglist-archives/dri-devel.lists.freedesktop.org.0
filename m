Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF4A4E13F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF4510E5FD;
	Tue,  4 Mar 2025 14:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLtW4P7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0B810E5FD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741099219; x=1772635219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uH0iy8XmD3PMq871alInZIwyF7MizcrSuLKTwFg3pXk=;
 b=cLtW4P7vytgYhazBJjeShW8icNgBj56pQV03kDjJNQtrwFwnS1Hd76oE
 pLC7Z07kodv6KVjzanNbNZwt2z/KcMP4/Lw0YiGgQEKxdLOaz46JhsfeI
 MWa+NYPdI3eJfRqckbUq9R6Vr4QVPmtYOyvPi91+7yIdffYXIi66Vn/bV
 Nkqn75tdJHKLds+j7TPxCG+lBzwW4jAvWi4r97AKXi3QbC2qj2w2Jp+9m
 /E6jnH9yyCV2aObgBGKGtmA1i+ruWH45N74lkCwIvPm12L1qn5waoSkmC
 AvefqcMg6dVvZGyGPfxujtRBPKuPZnWFc1tYSOnzqiEVHEP1gagq/+GPz Q==;
X-CSE-ConnectionGUID: bxQso6tlQjy+USQsuXgKhg==
X-CSE-MsgGUID: RRWXe0v0Qsmub9MEqFYbrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59431159"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="59431159"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 06:40:18 -0800
X-CSE-ConnectionGUID: 4xEIotUoRuOp4IQRBVHO5A==
X-CSE-MsgGUID: yeYGr0nzTJqr9ounl9pyUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118266170"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 06:40:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tpTRM-0000000H9UD-27vR; Tue, 04 Mar 2025 16:40:12 +0200
Date: Tue, 4 Mar 2025 16:40:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v2 1/1] accel/habanalabs: Switch to use %ptTs
Message-ID: <Z8cQzCWEzQ9T9j9_@smile.fi.intel.com>
References: <20250206192109.1133364-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206192109.1133364-2-andriy.shevchenko@linux.intel.com>
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

On Thu, Feb 06, 2025 at 09:20:43PM +0200, Andy Shevchenko wrote:
> Use %ptTs instead of open-coded variant to print contents of time64_t type
> in human readable form.

Any comments on this, please? If no, can it be applied?

-- 
With Best Regards,
Andy Shevchenko


