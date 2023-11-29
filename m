Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91E7FDE64
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 18:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871E810E63F;
	Wed, 29 Nov 2023 17:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 17:30:34 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F4410E63F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 17:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701279034; x=1732815034;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4lSFQ3iRjJe1QgXwktO3m/mevj43q2OpIyrp+a/5XCQ=;
 b=P7vgwXdGrdJFocEe2+TVKgXBJeskjsAZJ66HhKmiIcd9rWI/jfrXgM6w
 hHy8wSE12WmGkRopwFahCyJEoAxZQCRtdGK7PKUl67txpe87P+GT9h/89
 i+14vsjXTyvFMsAYcKh5O5t0jFoi3hqMyUBNmwJNDPPkiHXly3MQ6Lal7
 sgjHtmI3QsrkzyTdKCmD6iCPtoWz49AVknqFnejq0EeV8RH9mzZwQpUmC
 HAWeifKm1YQwr+UE2+PrnETGDYCzVOUhm3gAcRnSOQhRe/Rw2Zuhigib4
 4C/xee+A5Vv3IWZs/Hh1Kg2ey3Ro6e+X5CrtwMw5uIgNGiNgPCrts1vBA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="69592"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="69592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 09:23:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="10411943"
Received: from dstavrak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.61])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 09:23:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] drm/i915/display: Don't use "proxy" headers
In-Reply-To: <20231129140129.699767-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231129140129.699767-1-andriy.shevchenko@linux.intel.com>
Date: Wed, 29 Nov 2023 19:23:21 +0200
Message-ID: <87msuw5v92.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wr=
ote:
> The driver uses math.h and not util_macros.h.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_snps_phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/=
drm/i915/display/intel_snps_phy.c
> index ce5a73a4cc89..bc61e736f9b3 100644
> --- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
> @@ -3,7 +3,7 @@
>   * Copyright =C2=A9 2019 Intel Corporation
>   */
>=20=20
> -#include <linux/util_macros.h>
> +#include <linux/math.h>
>=20=20
>  #include "i915_reg.h"
>  #include "intel_ddi.h"

--=20
Jani Nikula, Intel
