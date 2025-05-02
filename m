Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5902EAA74B9
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 16:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFDD10E1A7;
	Fri,  2 May 2025 14:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ih2g7NfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E60F10E1A7
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746195391; x=1777731391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6T1876wvbcbG8AOYxOGoCfN3fLqM0OcZr5nT1lQMJr8=;
 b=ih2g7NfRLic3PjmmlajUPDUul56p6burptX5UTbZFSPxW2yfix1ZmnmT
 uwWFN/y56NT1Oo5NFl3i/RYOKGQgf95gi1sRpBYqpbnv4l54mP8g5NvLy
 sQ2jql/MwMIoKr9Gk8v3gjl2D6pis5jW0eyiiLoz9AvSF1N2VWSMsqa+s
 JXQQZ+VeHHXNB2lMQc5SMiMFlaBNY2RK1PFGZLimFyDdNRJcWmpnnxdWs
 Jkind7HFgUKNJEFgPrruHtDMeeOu5ifq7iBVZjQCD0O1MDP0pLLvpg14r
 9zgy9Mdco0rdpwoF0hKtgvEnqPMM+EUnmGjIr5rGw1Uhq+xt7P1iNpTJz Q==;
X-CSE-ConnectionGUID: Atdm3TdmRxSX4+WghDqJOw==
X-CSE-MsgGUID: C07Z1y/nSvm3vni7RAeBPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58085254"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="58085254"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:16:29 -0700
X-CSE-ConnectionGUID: tmyr955KQceMFFzPjexz3w==
X-CSE-MsgGUID: CyaFM5uYRxy20T3bcEXejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="135161988"
Received: from smile.fi.intel.com ([10.237.72.55])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:16:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uArBf-00000002Dng-3Vxx; Fri, 02 May 2025 17:16:23 +0300
Date: Fri, 2 May 2025 17:16:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Avizrat, Yaron" <yaron.avizrat@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
Message-ID: <aBTTt0It5dopMDNO@smile.fi.intel.com>
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
 <Z-PM8oBtTPzqv-S2@smile.fi.intel.com> <87zfh86rqi.fsf@intel.com>
 <81431521-bedf-4361-a222-0e8ec70bea69@intel.com>
 <Z_zeUAW7u8UgmEOo@smile.fi.intel.com>
 <deee9bc9-6af0-46fa-af50-866c58ddf7ad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deee9bc9-6af0-46fa-af50-866c58ddf7ad@intel.com>
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

On Mon, Apr 14, 2025 at 07:47:26PM +0300, Avizrat, Yaron wrote:
> On 14/04/2025 13:07, Andy Shevchenko wrote:
> > On Sun, Mar 30, 2025 at 02:15:50PM +0300, Avizrat, Yaron wrote:
> >> On 26/03/2025 11:55, Jani Nikula wrote:
> >>> On Wed, 26 Mar 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>>> +Cc: Jani (sorry, forgot to add you in the first place).
> >>>>
> >>>> Do you think it's applicable now?
> >>> Cc: Yaron, Koby, and Konstantin who are supposed to be the new
> >>> maintainers for accel/habanalabs.
> >>>
> >> Thanks for the help, We’ll verify this change in our CI/CD pipeline and update you ASAP.
> > What's news, please?
> 
> Recently acked and merged into our repo. Will also push upstream later on.
> Appreciate the relevant contribution!

I still don't see in in Linux Next.

-- 
With Best Regards,
Andy Shevchenko


