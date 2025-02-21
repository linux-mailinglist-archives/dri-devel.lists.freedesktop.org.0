Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E51BA3FA63
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A8510EAA4;
	Fri, 21 Feb 2025 16:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nn7xhSWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C226410EAA4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740154345; x=1771690345;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mxjeAdq+aNd+avhSnTHUTRgXcTwL1FgHUD13IQX+Cjk=;
 b=Nn7xhSWZztZeDzYBGokblTW8CAlC58DX+cPW5vapDNSPDvnt8hZtZ4+U
 uLR8VkmMcHIQxxtZ83MosVZvHnZ06LlG80cV7NLjMETfQmRFQZOXTH+In
 0mYxQ8pQV24EQtv/JHITMCbP5ghzXuw25UyLbibt+2gGqIEIemd6QGIVo
 u/XZhKsNZJUx6eB8dwsAOIRw+Na+LpkbZf79BccqeOQFLx+dMrKnO7DCW
 MrKQbvB1wLM/hUCuNks2A642Mztow0ATJiPmaU+zl60WFIkUa5L1wQgV5
 aUiHuoY3+zLNwkEKdqqUtAVcySzzhXpGk3J7MWXxojdEYdQc4bBJuMbb7 Q==;
X-CSE-ConnectionGUID: AE3vzQEbSnWPoCtFxuGKlw==
X-CSE-MsgGUID: gzAFi9WUTYGvfoHMAFDI8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51192658"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51192658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:12:25 -0800
X-CSE-ConnectionGUID: dOzPSP9JQTqAExshd1Xbng==
X-CSE-MsgGUID: LWwAZrIOR6Se5JtclW+b5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152601240"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:12:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tlVdT-0000000DgfD-21CW; Fri, 21 Feb 2025 18:12:19 +0200
Date: Fri, 21 Feb 2025 18:12:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Cleanup io.h
Message-ID: <Z7il497RBiiga4Js@smile.fi.intel.com>
References: <20250221050804.2764553-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221050804.2764553-1-raag.jadav@intel.com>
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

On Fri, Feb 21, 2025 at 10:38:02AM +0530, Raag Jadav wrote:
> In a wider effort to improve build speeds, we're attempting to split/cleanup
> core headers.
> 
> This series attempts to cleanup io.h with "include what you need" approach.
> 
> This depends on earlier modifications available in immutable tag[1]. Feel
> free to carry your subsystem patches with it, or let Andy know if you'd
> rather let him carry them.
> 
> [1] https://lore.kernel.org/r/Z7cqCaME4LxTTBn6@black.fi.intel.com/

Oh, you are fast! Please, read my comments in v1 as well an take them into
account.

-- 
With Best Regards,
Andy Shevchenko


