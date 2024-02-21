Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87185E978
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0893710E808;
	Wed, 21 Feb 2024 21:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOvFXS1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2385310E808;
 Wed, 21 Feb 2024 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708549576; x=1740085576;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KyMlo79JRas7N/ePSvTBhDPap36fYD1RTOI3K+oksGc=;
 b=GOvFXS1vWCGLlSfj8dqzR1j3GiQRnxhsmamHxNCWMPI4kFpS3OSdIbcS
 VOHXbjbWElPWDP+tGs7HY8TLVrc+KBnKO3vgKERYUrvUjdNQvaxiVVQX7
 d4ol840NRyzt+2xlbPClcx7qQXn3i7WkD0elQdRmDKnCeLG4TIDeCQ6LP
 OMM1Y04QH8b89X082rmnqmSQ7doyTNtk2EjvyzCEcAQV16Zs7sKuQD6IJ
 +IpI97S3vQnjUXZ2hsMLe22ZgXrmy26BqDHJkGYyepB0gPDlc0Vifnn0o
 U+MYCsUkjN2BNbDD1+IIrcETQ/JFvi9HvPkbd8mogd2EtMRQKrM4PDLVy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13297099"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13297099"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 13:06:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913373035"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="913373035"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 13:06:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rctn8-00000006TBi-1Pa3; Wed, 21 Feb 2024 23:06:10 +0200
Date: Wed, 21 Feb 2024 23:06:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZdZlwWbYlReLEqRU@smile.fi.intel.com>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <CAA8EJpo3X5Ljdf5w8pj+WPQZaqab4mD53VXdAxfLFqsU4mNoPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpo3X5Ljdf5w8pj+WPQZaqab4mD53VXdAxfLFqsU4mNoPQ@mail.gmail.com>
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

On Wed, Feb 21, 2024 at 10:37:30PM +0200, Dmitry Baryshkov wrote:
> On Wed, 21 Feb 2024 at 22:30, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:

...

> Excuse me, it seems a c&p from gitlab didn't work as expected.

No problem, it's clear that the patch has not been properly tested and
obviously wrong. Has to be dropped. If somebody wants that, it will
be material for v6.10 cycle.

-- 
With Best Regards,
Andy Shevchenko


