Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5655685E98B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B91C10E80F;
	Wed, 21 Feb 2024 21:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dk8Mxis/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD3210E80D;
 Wed, 21 Feb 2024 21:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708549663; x=1740085663;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nA1youg90/ZP2DIb11j9lh81YY3aAWIu00fTWWD2H/U=;
 b=dk8Mxis/i3cG6raRd/dzrrVPbTBo+BUHKv6U8F6eKMnvPOYwJ8Qs6Swl
 1HFwdTNbysGmvMU/8CiGDc7J+vK0xbBNRG8iUNBVCErTCkeggfwTenlq7
 xaibkoRHfO4VpYudt2UE6IBSygFuVfrZrnnHLS0b21h3mi8X9NTjya0gt
 ETZ3zOFGrjNbm2MAED1xS3yeyIZ8uoB/UXyTA0odlYV/sDailBOU7W1nU
 CBEYOKfSmf2bKgQgsRLMkCFMSpz0GKRpbymwoWotRyD64W4el9dSs8+Su
 JtrFJFPzhOLZoP0MiWsSEsCMVPDlAE0BZE0iyrcemnbEOJafyVb7dFQcb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13297221"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13297221"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 13:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913373115"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="913373115"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 13:07:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rctoX-00000006TCs-16Ap; Wed, 21 Feb 2024 23:07:37 +0200
Date: Wed, 21 Feb 2024 23:07:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZdZmGJHQVF-CBm__@smile.fi.intel.com>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <CAA8EJpo3X5Ljdf5w8pj+WPQZaqab4mD53VXdAxfLFqsU4mNoPQ@mail.gmail.com>
 <ZdZlwWbYlReLEqRU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdZlwWbYlReLEqRU@smile.fi.intel.com>
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

On Wed, Feb 21, 2024 at 11:06:10PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 21, 2024 at 10:37:30PM +0200, Dmitry Baryshkov wrote:
> > On Wed, 21 Feb 2024 at 22:30, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:

...

> > Excuse me, it seems a c&p from gitlab didn't work as expected.
> 
> No problem, it's clear that the patch has not been properly tested and
> obviously wrong. Has to be dropped. If somebody wants that, it will
> be material for v6.10 cycle.

...which makes me think that bitmap(bitops) lack of assembly test case(s).

-- 
With Best Regards,
Andy Shevchenko


