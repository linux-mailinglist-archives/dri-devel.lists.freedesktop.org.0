Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF430144A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826D96EADD;
	Sat, 23 Jan 2021 09:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131E26E9F7;
 Fri, 22 Jan 2021 14:51:53 +0000 (UTC)
IronPort-SDR: eF2RC2GT86rFgm39LQHbWmcSC6S4rlZkZL8xTrb/McxWKa3I01IAiDQvI8UzA1bkGPfjQ8amod
 C3a1TzfJw8Nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="264273477"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="264273477"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 06:51:52 -0800
IronPort-SDR: rW4pe8qyPzL2SVDQzy71Hz/ziNDSL8rjW61ooRp+O+bxzejOkLgoA+id6/g0DeIiIzMZqtbSE+
 jaUkwdRI9LXA==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="367456287"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 06:51:50 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1l2xnx-0091RL-5C; Fri, 22 Jan 2021 16:52:53 +0200
Date: Fri, 22 Jan 2021 16:52:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH v1 1/2] drm/gma500: Convert to use new SCU IPC API
Message-ID: <YArmxaIZl/NjKkpT@smile.fi.intel.com>
References: <20210122113855.25770-1-andriy.shevchenko@linux.intel.com>
 <CAMeQTsa4byizTHkno_ndGpNskAgrEUU3f43p3qAfnGsXt2OoVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMeQTsa4byizTHkno_ndGpNskAgrEUU3f43p3qAfnGsXt2OoVQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 03:16:55PM +0100, Patrik Jakobsson wrote:
> On Fri, Jan 22, 2021 at 12:39 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Convert the GMA500 driver to use the new SCU IPC API. This allows us
> > to get rid of the duplicate PMC IPC implementation which is now covered
> > in SCU IPC driver.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Both patches look good. Do you want me to take them through drm-misc? Otherwise:
> Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

I guess it's fine to go via drm-misc, but we might need an immutable branch/tag
in the future (in case the rest cleanups that are dependent but have not sent
yet will pending v5.12).

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
