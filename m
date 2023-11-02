Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8247DF24D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 13:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BC610E097;
	Thu,  2 Nov 2023 12:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB6A10E097;
 Thu,  2 Nov 2023 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698928050; x=1730464050;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BsFcEvID3o2aSRzfUsZHlx4fPPpNDg9aadUfPiE9Bk4=;
 b=WMK9USgjEYT1H2N8/KCjn6CW86lLAdBPtQpcbKTEtp6yULmf9x8pNOL5
 GWGBeUpn9dN2GGgSfkYF4HDXauE2KtrzLQvNMFBbZ2YI/k/hk1saU6KoY
 DzU3SQN9XqVSLI6xByRLS1QvrjXwY9MmMPIIHO6jTe3flWSnRM8iWNYqe
 lGSvz8JL7fL3NiNelD93sA9TjBKtbeKZ7SW4FKM7HY2+YgByI7HKc+/LV
 yUE3JH1pt1W9Ktw5O6yXPMtsnJppW88SQLGCANIvQcYLq/O1/vRCWEogu
 gkY/Ds5mDs8KUTLijHvdHs1r3sTMnOB5GAqrjgYdP3lL+Ifet540Xt1vs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="379093668"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="379093668"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884877367"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="884877367"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:27:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qyWnD-0000000AgTQ-4Aci; Thu, 02 Nov 2023 14:27:23 +0200
Date: Thu, 2 Nov 2023 14:27:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
Message-ID: <ZUOVq2LREbHgFL6R@smile.fi.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
 <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
 <16e533e2-81bb-47ba-9e23-460a626bcad7@redhat.com>
 <ZUIbPtEEbl6pjdqg@smile.fi.intel.com>
 <f68dca47-d9ed-a146-b152-c19bcc9d8828@redhat.com>
 <437a20fe-121e-0d8c-04a0-da30db71d2ea@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <437a20fe-121e-0d8c-04a0-da30db71d2ea@redhat.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 01, 2023 at 12:01:31PM +0100, Hans de Goede wrote:
> On 11/1/23 11:20, Hans de Goede wrote:

...

> Attached is this patch, this should probably be one of
> the first patches in the v3 submission.

Thanks, noted!

> Note that if you go with Ville's suggestion to preparse
> the MIPI sequences, things will change significantly
> and then the attached patch will likely be unnecessary.

I don't think so I'm for that. My task is to get rid of the poking registers
of the GPIO IPs in the kernel when driver has no clue about them.

That's why I want to do minimum in that sense with less possible invasion
into existing flow.

-- 
With Best Regards,
Andy Shevchenko


