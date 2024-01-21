Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F516835603
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 14:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7581610E24F;
	Sun, 21 Jan 2024 13:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B184510E24F
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705845305; x=1737381305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R48NpmG84koS2tGZXQk7+5epMId7bmv44QQnOetSWZ8=;
 b=HYYgPYo6q4vC38shYL09M0TM6CjIeWtQHBoLPPTtnZOn2r7MMeHI5KtT
 Avvx0UrMCZPu95AK144VZCILR5r7GLRaAuyUhPTTlZsfvqd6hRj/qcJJD
 nkKTXax7fUiKyIRuMFe2NK16B2qIis6+1DA3kWdKWKxBf5Tvs17kfiZ11
 zSLeh/MNqh0ovI7w8MIS6dIDh/4h2G/GGlkDW7NdlxqSaSv7QBFICzh50
 FUiWySdjOwM45AtrNatrzGLPTHPsNcEVXkA+M0YsyOnOPvqx6KbdLOHCY
 vuhOMKBohrKFbRfK5iRPVOUlMhh40j/A8MlsH2O6iy39WzCNykDEFpuN7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="398192240"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; d="scan'208";a="398192240"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 05:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778363190"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; d="scan'208";a="778363190"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 05:55:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rRYCR-0000000FunQ-24vF; Sun, 21 Jan 2024 15:49:23 +0200
Date: Sun, 21 Jan 2024 15:49:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v1 2/4] backlight: hx8357: Move OF table closer to its
 consumer
Message-ID: <Za0g47CgOH4MhdRe@smile.fi.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-3-andriy.shevchenko@linux.intel.com>
 <878r4rovk4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878r4rovk4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 09:22:19AM +0100, Javier Martinez Canillas wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

...

> > +	{}
> 
> While at it, maybe add the { /* sentinel */ } convention to the last entry ?

Maybe. Is it a common for this subsystem?

...

> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko


