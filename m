Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E522918D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47906E5C6;
	Wed, 22 Jul 2020 07:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DB26E420
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:57:03 +0000 (UTC)
IronPort-SDR: QHeZKC7K3nDkdhPrMUmHYeM0mc9H+JW1Q6aYE4n2G7mTFq3yPZu3pwaXNK5adGhdYJCjb7o9FP
 hGS8D3feL7+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="168304770"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="168304770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 08:56:44 -0700
IronPort-SDR: DM820xt1Gq3OZz664oUikIE/NHcfCrPPnVekc0Nhd8eBTXqXCJhs6hfdHSZ0TlWwNKAeHyYJ8k
 6zOW7D5GQ0qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="487663827"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jul 2020 08:56:43 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jxudH-0035x4-Fa; Tue, 21 Jul 2020 18:56:43 +0300
Date: Tue, 21 Jul 2020 18:56:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v1] io-mapping: Indicate mapping failure
Message-ID: <20200721155643.GM3703480@smile.fi.intel.com>
References: <20200721153426.81239-1-michael.j.ruhl@intel.com>
 <20200721153426.81239-2-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721153426.81239-2-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 11:34:26AM -0400, Michael J. Ruhl wrote:

Thanks for an update, my comments below.

> The !ATOMIC_IOMAP version of io_maping_init_wc will always return
> success, even when the ioremap fails.
> 
> Since the ATOMIC_IOMAP version returns NULL when the init fails, and
> callers check for a NULL return on error this is unexpected.
> 
> Return NULL on ioremap failure.
> 
> Fixes: cafaf14a5d8f ("io-mapping: Always create a struct to hold metadata about the io-mapping"

Missed parenthesis.

Still not visible why Fixes tag.
Provide also couple of lines of crash and add a paragraph about it.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
