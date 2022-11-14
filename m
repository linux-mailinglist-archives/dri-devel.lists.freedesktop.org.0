Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323D62888F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 19:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175D610E02C;
	Mon, 14 Nov 2022 18:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4130B10E02C;
 Mon, 14 Nov 2022 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668451697; x=1699987697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AHgkLYtPHhgu7JKiPxVsv3AUt6xSMXEpy9zlW59ER+8=;
 b=Hd/WpQA5Z/A2jtLwU1dRfNnaK1l7rekliILwLMGrDlFt1KkSBpFZzMHz
 1/iWOYyRrdi6OZiyyH0A81fdvkcMceTl91hjID/OIAVvRQoX1rWbpErDY
 zhuWfhL/12gZXtS/K2uhKy5IjTDVQ2vaYgrbaqDOCi5WA1ggDoAlhESRz
 AxBsCfod3SoAiPjqbfz7EqNcR2/e1C85ohMXjZ7xnwZM8uXrhduBYhNlL
 Z1de2EQZXF/442LTau/yv8OFEiTBMI13GkyCpaLsYElYYedLXfO1TOx5K
 dTzMtPkda2O1WoG3SEde5dk3rISjCClhjBfvgc6GrrXaCTGCQ1dDIzSBo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="313857853"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="313857853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 10:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="813369368"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="813369368"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005.jf.intel.com with ESMTP; 14 Nov 2022 10:48:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oueV7-00CJ1A-27; Mon, 14 Nov 2022 20:48:09 +0200
Date: Mon, 14 Nov 2022 20:48:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v2 1/4] i915: Move list_count() to list.h for broader use
Message-ID: <Y3KNaZjhqJZYjxrn@smile.fi.intel.com>
References: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
 <DM5PR11MB1324523623D88188493D7518C1059@DM5PR11MB1324.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5PR11MB1324523623D88188493D7518C1059@DM5PR11MB1324.namprd11.prod.outlook.com>
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
 Kevin Cernekee <cernekee@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, "Nyman,
 Mathias" <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jakob Koschel <jakobkoschel@gmail.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 06:11:51PM +0000, Ruhl, Michael J wrote:

...

> So all of the non-list_for_each code appears to be an inline.

This is not true.

> This which, resembles the non-list_for_each pattern is a macro?
> 
> Just curious as to why the macro rather than inline?

See above. However, I'm fine with the inline.

-- 
With Best Regards,
Andy Shevchenko


