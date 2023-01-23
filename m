Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC9677955
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6588410E225;
	Mon, 23 Jan 2023 10:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FA610E1E4;
 Mon, 23 Jan 2023 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674470364; x=1706006364;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EGqbAfIrXtCj5PfIpsjX+FESl8AmgsjG+mIlk/j22lM=;
 b=OXrX0eSL4aS1/U2q/PVzhrmd1Vw5vE3aZI7zZV4YAYw2vLjrQApN/Pjg
 PmcLQn4Sqj2fLTzGE6REJL71dVa4267+LRGfVdLdkvu2+3f0ncSJ9BXcC
 DBtFF6ylSJeI56sKG45pIzR0h6O/S5NUOPHr0ygjAIpWW4qnTpS7A1NlR
 szAA9G6BzkhH2FQF8sLcIjbIwJUVL/Dvtp3H3V2m3xBbFcAx99H+1da9i
 6wFTbHnaiCpC8AqZWsIJdxv4RBQQ3aL5rTqcETlCgs0tuQpKWFlv11xqS
 Ev5qJyzEW9B3bPgFKTwO3Fd74tQ7QbB07jTslcUpcSkdh+x2NB9h3j7lI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="328099819"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="328099819"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 02:39:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="654854612"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="654854612"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.125])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 02:39:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/8] Add _PICK_EVEN_2RANGES
In-Reply-To: <20230120193457.3295977-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
Date: Mon, 23 Jan 2023 12:39:13 +0200
Message-ID: <87ilgx8rhq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Add a new macro, _PICK_EVEN_2RANGES, that supports using 2 address
> ranges. This can be considered a v2 of
> https://patchwork.freedesktop.org/series/109606/
>
> I think I converted all the _PICK() uses that could be easily done
> without making it much harder to read. We do have some cases of 3
> ranges: I left those alone.
>
> As commented in the original series and like Jani I think we may need
> something else to cover all the use cases in future. Right now I don't
> think we have a good alternative though. This new macro both improves
> the current code and can be used for cases the ranges change in new
> platforms, so I think it's good enough.  In future I think just saving
> the reg during initialization and using different functions if the
> bitfields change may be an alternative.

Did not review, but on the approach,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> This was lightly tested on ADL-S and DG2.
>
> Lucas De Marchi (8):
>   drm/i915: Add _PICK_EVEN_2RANGES()
>   drm/i915: Fix coding style on DPLL*_ENABLE defines
>   drm/i915: Convert pll macros to _PICK_EVEN_2RANGES
>   drm/i915: Replace _MMIO_PHY3() with _PICK_EVEN_2RANGES()
>   drm/i915: Convert PIPE3/PORT3 to _PICK_EVEN_2RANGES()
>   drm/i915: Convert _FIA() to _PICK_EVEN_2RANGES()
>   drm/i915: Convert MBUS_ABOX_CTL() to _PICK_EVEN_2RANGES()
>   drm/i915: Convert PALETTE() to _PICK_EVEN_2RANGES()
>
>  .../drm/i915/display/intel_display_reg_defs.h |  10 +-
>  .../gpu/drm/i915/display/intel_mg_phy_regs.h  |   4 +-
>  drivers/gpu/drm/i915/i915_reg.h               | 106 +++++++++---------
>  drivers/gpu/drm/i915/i915_reg_defs.h          |  28 +++++
>  4 files changed, 89 insertions(+), 59 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
