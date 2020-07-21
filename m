Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CED522918E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26F9896DD;
	Wed, 22 Jul 2020 07:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BC16E5A2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 14:47:25 +0000 (UTC)
IronPort-SDR: sVE8MNvuGn5BMuRixe9/ryMsISonjQFUiaC1SR94GAVizxgWWkY5n3LimdeyqEGDIjULSB73WU
 X/fc6zoVglFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="137631347"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="137631347"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 07:47:24 -0700
IronPort-SDR: SG/ADZdzeO+eYGeJdkwxR3/AzidikjdTwMUhffXRLWe1zQ0R0O6VOeMmB6qE6lyrPVP/nZshlR
 UQHE1VnpYQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="283881421"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 21 Jul 2020 07:47:22 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jxtYA-0035K1-TY; Tue, 21 Jul 2020 17:47:22 +0300
Date: Tue, 21 Jul 2020 17:47:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH] io-mapping: Indicate mapping failure
Message-ID: <20200721144722.GH3703480@smile.fi.intel.com>
References: <20200721141641.81112-1-michael.j.ruhl@intel.com>
 <20200721141641.81112-2-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721141641.81112-2-michael.j.ruhl@intel.com>
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

On Tue, Jul 21, 2020 at 10:16:41AM -0400, Michael J. Ruhl wrote:
> Sometimes it is good to know when your mapping failed.

Can you elaborate...

> Fixes: cafaf14a5d8f ("io-mapping: Always create a struct to hold metadata about the io-mapping"

...especially taking into account that Fixes implies regression / bug?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
