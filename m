Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB0A56F9B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5AB10EC1B;
	Fri,  7 Mar 2025 17:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9riaeMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C7110EC1B;
 Fri,  7 Mar 2025 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741369864; x=1772905864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dGD7M+D/Vv3zLXXm89n7VTmmkqauqr/Ru9jLjoB4/aA=;
 b=l9riaeMHyC9EwLzgh8sVpyoclTCagXBUunpaC+fueX0hg+Yljk6sMRie
 KYYRqArkgShqFbNxHxhBoR9mNwBscJurO0tEWO+GGyI6XRgLeBkLUZKZr
 T4wfM65U1j8lA4m6r5CFhQ6tcbycNc6sSCwb2oxr60haOhfGvZFzUhbF1
 5nP/m/vDUQbLUQ/y3LroSSz6mnfxR0dHv4f8swt4MYHNg6/yDTzD8vG6B
 rEafPE1B0km7Nzyu0qZeOPL3lpmGKUvf/k4KV3NKd9wmZUVRX4sxTBaP8
 kt9ZYDurJ4WoBDs0QffjELAAPwnDyWU3PZ50zq03Glalr4VhukElgu2uk g==;
X-CSE-ConnectionGUID: h/4nenGiQDmheCMqSsq8rw==
X-CSE-MsgGUID: 5OH8/uEMTAme5i+s9Lzmrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53064409"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53064409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:51:04 -0800
X-CSE-ConnectionGUID: qdL4OL/ITzy4ND73d87j2A==
X-CSE-MsgGUID: kLc/vBOjQJODVcV23RQl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124308185"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:50:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqbqZ-00000000Tbf-2wYc; Fri, 07 Mar 2025 19:50:55 +0200
Date: Fri, 7 Mar 2025 19:50:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: mailhol.vincent@wanadoo.fr, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v6 0/7] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z8sx__SHALZI1NCx@smile.fi.intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <Z8sqSpKZzfolKm8Q@thinkpad> <Z8swXUGf9rtTHw1o@smile.fi.intel.com>
 <Z8sxdOjk3LksG9ky@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8sxdOjk3LksG9ky@thinkpad>
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

On Fri, Mar 07, 2025 at 12:48:36PM -0500, Yury Norov wrote:
> On Fri, Mar 07, 2025 at 07:43:57PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 07, 2025 at 12:18:02PM -0500, Yury Norov wrote:
> > > No rush, please allow your reviewers a week or two before submitting
> > > a new iteration unless you want to disregard the previous version for
> > > some reason, of course. This will not get into the upcoming merge
> > > window, anyways.
> > > 
> > > So, what should I do? Go through the v5 and all discussions in there,
> > > or just jump on this?
> > 
> > There is also question to you. Are we going to leave with U128 variants or is
> > it subject to remove? If the latter, can you issue a formal patch?
> 
> I asked Anshuman about it as he's the only person interested in it. Will wait
> for a _usual_ few weeks for reply before making any conclusions. If you know
> anyone relevant in ARM or everywhere else, feel free to loop them.

I see, yep, we still have time for that, let's wait a bit.

-- 
With Best Regards,
Andy Shevchenko


