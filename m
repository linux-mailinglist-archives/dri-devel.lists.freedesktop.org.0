Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AB84F671
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 15:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3FA10E72A;
	Fri,  9 Feb 2024 14:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfeRV0ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D6310E72A;
 Fri,  9 Feb 2024 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707487482; x=1739023482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vwibz1UBzunx12UaIjzyxed9fPynUv8i4klDAWlf9Ow=;
 b=BfeRV0eceV4GA6FvsU7lczUfU1mJmrFC4z48eFv0Fb8Jms5asfsGc026
 kYmns0g22p7W2jUa9fOHorWwPtpeDCkHpJD8hCzoQasaowsnRKYAl8hsN
 MIcylxrHEic9OlQc9pqkLIfYB9II2bZimp5lneeNDJQRoK1udP4ZY7buP
 Fl+3H/hh+T/Fj/fRCOkUwrBzJmRuh2XKvwCZLM5PTnFfk515aKUVDF0MH
 o7c6iWUAKEok9naWUngAmTHQN8vDU7YVdTthU9caUSAQlxTaffTcKD1wZ
 kSA1b0iK2xO9AEgx2p+52i02BA5qljou7EHPns9Sq8dFQK2ZDUZfdAXqI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="23911770"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="23911770"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 06:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910717014"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="910717014"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 06:04:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rYRUa-00000003AOw-0R6p; Fri, 09 Feb 2024 16:04:36 +0200
Date: Fri, 9 Feb 2024 16:04:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZcYw8xH7xZJPQYpz@smile.fi.intel.com>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <ZcUwK9DAVMVzq1Mk@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcUwK9DAVMVzq1Mk@ashyti-mobl2.lan>
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

On Thu, Feb 08, 2024 at 08:48:59PM +0100, Andi Shyti wrote:
> On Wed, Feb 07, 2024 at 11:45:19PM -0800, Lucas De Marchi wrote:

...

> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> Lucas' SoB should be at the bottom here. In any case, nice patch:

And it's at the bottom (among SoB lines), there is no violation with Submitting
Patches.

-- 
With Best Regards,
Andy Shevchenko


