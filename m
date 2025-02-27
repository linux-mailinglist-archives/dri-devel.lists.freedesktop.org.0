Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61DA482DF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 16:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E7410E05E;
	Thu, 27 Feb 2025 15:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mP0OoQUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A9710E244
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740669925; x=1772205925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vpomHs3iTwgbfPEKsG61J27840RkikUOBSKgtHFsC1g=;
 b=mP0OoQUtXNq0Z1D1arcm91OwKgEVfbG/lr/YPKt4Hb+25YSjhmfz+HJo
 ht5+gGkJg/A56Fo2iKbKUNZWsirsTjyqvXPLePUjFuWWhMJjFAuyH30zE
 pSMZjr29nCN/nUfloUkR3kNNjeer/bDT/emDLgcXR1lWOpRbx8SV3oXMK
 3Yz++snJmQhN5hf+GiwFFu37iDBOFKNow9M0afKH+Y0D4v16u5X5hCgkk
 EsI265y/la5aP50TAZih5sJbYW7FLfzHbecw8Sm2hgR0uEerdMwejSAXm
 FKJHUQ7jUnlDtZB4/6OqXatdBqN565CJEKowgxo/vvTPqP2Bond1PcPO5 Q==;
X-CSE-ConnectionGUID: 9/WImXAeQZC7+AzCxPa2bg==
X-CSE-MsgGUID: g5tyaZV9SwOynaZLuRlHSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45216487"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="45216487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:25:25 -0800
X-CSE-ConnectionGUID: QLQtorUDT3OwzopKlQ25BQ==
X-CSE-MsgGUID: AcGdgfOeQD6da5wt4RwiLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="147872701"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:25:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tnflH-0000000FdFW-3AyL; Thu, 27 Feb 2025 17:25:19 +0200
Date: Thu, 27 Feb 2025 17:25:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Cleanup io.h
Message-ID: <Z8CD33_OWK2LB6IZ@smile.fi.intel.com>
References: <20250227070747.3105451-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227070747.3105451-1-raag.jadav@intel.com>
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

On Thu, Feb 27, 2025 at 12:37:45PM +0530, Raag Jadav wrote:
> This series attempts to cleanup io.h with "include what you use" approach.
> This depends on changes available on immutable tag[1].
> 
> Although this series is too trivial in the grand scheme of things, it is
> still a tiny step towards untangling core headers. I have success results
> from LKP for this series but there can still be corner cases. So perhaps
> we can queue this on a temporary branch which we can use to submit fixes
> in case of fallout.
> 
> Future plan is to use the excellent analysis[2][3] by Arnd to cleanup other
> headers.
> 
> [1] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com
> [2] https://lore.kernel.org/r/2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com
> [3] https://lore.kernel.org/r/f6eb011b-40fb-409a-b2b2-a09d0e770bbd@app.fastmail.com

I believe Arnd can take it through his tree for headers as DRM part is Acked already.

-- 
With Best Regards,
Andy Shevchenko


