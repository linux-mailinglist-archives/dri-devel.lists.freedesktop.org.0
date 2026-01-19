Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE7D3A023
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CB810E37F;
	Mon, 19 Jan 2026 07:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAb8EDlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E58E10E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768808407; x=1800344407;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FEF46I4aDVNF7PSwzPPe2285i3zXrTuHK+VlQ38y0yQ=;
 b=OAb8EDlPMcugNhaEJhpwbde9sM42MM9rJ+McH7imVZp/gaFtny8XEiSU
 n8CTb68/UGiq3hIXTXr4RDHy3EfK+3gXU/5QK/aVOZ8wKFjPLy8cVozwF
 QI9uSed9GjWy41CVRRnMYBsh/g5EeeWies00DS8baQe+UNXDa3bj1eiyK
 G7MffVLqeOK9sqXOGgzNJ8kHdbB8GTj8pfdmzV9HjWgWoD5/P5rXdcdgs
 z01SaDIYjJgg6eXMb66eV53uh3J+8fIZKq+iRYeDPRkptY4N27oaMdLCK
 aSO8S/uJsCLME+bgrIe59TQlJ+2j2y+OqQ8WV+kI+zwX3FXuLzdKVQqvn A==;
X-CSE-ConnectionGUID: z1tABJ2ZS56E1Cg6AF+Kqw==
X-CSE-MsgGUID: Cg62cevNS2CEwAAvP+XiGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87592122"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87592122"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 23:40:07 -0800
X-CSE-ConnectionGUID: ckz6wRWATlmv6uEVbo9SXQ==
X-CSE-MsgGUID: CbpLF8SjS8WWBpOdV93D2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="243365109"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 23:40:04 -0800
Date: Mon, 19 Jan 2026 09:40:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/2] staging: fbtft: Fix build failure when
 CONFIG_FB_DEVICE=n
Message-ID: <aW3f0L_B_UIbaNj_@smile.fi.intel.com>
References: <20260117042931.6088-1-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117042931.6088-1-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Fri, Jan 16, 2026 at 08:29:30PM -0800, Chintan Patel wrote:
> When CONFIG_FB_DEVICE is disabled, struct fb_info does
> not provide a valid dev pointer. Direct dereferences of
> fb_info->dev therefore result in build failures.
> 
> Fix this by avoiding direct accesses to fb_info->dev and
> switching the affected debug logging to framebuffer helpers
> that do not rely on a device pointer.
> 
> This fixes the following build failure reported by the
> kernel test robot.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


