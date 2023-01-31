Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B650D682CD6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 13:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE15810E32D;
	Tue, 31 Jan 2023 12:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EDB10E32D;
 Tue, 31 Jan 2023 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675169099; x=1706705099;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/RwQqzhoI4pLDu/LgYP8NfjxFwOXtYObH6J5azZ9fcE=;
 b=WCWqomjSPzzN647NwnwJN8aMyAwE37oEnyLnortjwErUFIQ3hEUIj3c2
 EoRK4Y48qpKRVdtnfhriTC9s74Uhf0aJ+HVJU8mMXeBlVsfI1nev0IixR
 45ULTPUvjNus7wdxQzagdReQ/4qBmTTZcc+7ysqS4hv2CXiqvKplDAWJm
 N/lU+Ai36dOc+XvBO/aYE04Aw9XgiQXI3qwAmbCIBMDYd4FgMA3BHYlAt
 12G7jQyTh3PziusBCSly9y/kCVIz2Ts6GT1+MHcXxw060k52JuJdlE+k0
 aBq/wqbDLCEGJm9CWSpYCDzQIaPHDi536PpJf+7wDxapE33h66LzUkA/U w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325525923"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="325525923"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 04:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="733097607"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="733097607"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2023 04:44:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pMq0L-000Fg8-1n; Tue, 31 Jan 2023 14:44:53 +0200
Date: Tue, 31 Jan 2023 14:44:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree with the
 drm-intel-fixes tree
Message-ID: <Y9kNRVppj5Uxa9ub@smile.fi.intel.com>
References: <20230131130305.019029ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131130305.019029ff@canb.auug.org.au>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Greg KH <greg@kroah.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 01:03:05PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c
> 
> between commit:
> 
>   5bc4b43d5c6c ("drm/i915: Fix up locking around dumping requests lists")
> 
> from the drm-intel-fixes tree and commit:
> 
>   4d70c74659d9 ("i915: Move list_count() to list.h as list_count_nodes() for broader use")
> 
> from the usb tree.
> 
> I fixed it up (the former removed the code changed by the latter)

Hmm... Currently I see that 20230127002842.3169194-4-John.C.Harrison@Intel.com
moves the code to the drivers/gpu/drm/i915/gt/intel_execlists_submission.c.

Is there any new series beside the above mentioned that touches that file and
actually _removes_ that code?

>	and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

-- 
With Best Regards,
Andy Shevchenko


