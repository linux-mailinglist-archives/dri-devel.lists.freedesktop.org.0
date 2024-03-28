Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D94688FA11
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 09:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B3C10F0F6;
	Thu, 28 Mar 2024 08:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCfGI2Pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732310F0F6;
 Thu, 28 Mar 2024 08:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711615048; x=1743151048;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SxnGgfMHWB6/HE8+c6vXXWQ3E3UGk2dAFUzMB4wSJG0=;
 b=DCfGI2Pg8Lpla/1CoFOzIpToFgXP1XvclVOM+dIAVNgHw3s25Oe9l+85
 SVuS2vsZMK+7ixPM1OF+PHknVE8APNxjkRLvcYygBsTPXWZCTpoLc3lB/
 zFuQ07rLNyBZDG9lGhvI+c08Tr9EHaazW+GGkIAv9UI9Yq9zDF+3I81Ez
 QWXcRiFFpaBoEnsdLvm8a5sdO3fy7rolRsKNAg4GqeLx8X5rrM3/ECziD
 5J35735tMdMtxxlwGOIOvGsddPNoowyaFj+X9UsI3V133Hqvrh+/XbSHt
 ijLJ1sHX0gra1AHBPYxW7763L86U2seVEztmc2J8Pr3wT6pFymwu1ic1c w==;
X-CSE-ConnectionGUID: yIdgPghtTV2831rJoMKNxg==
X-CSE-MsgGUID: tuZXRkxCSbSkJmxGD7+esA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6867686"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6867686"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 01:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21262539"
Received: from unknown (HELO intel.com) ([10.247.118.221])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 01:37:22 -0700
Date: Thu, 28 Mar 2024 09:37:15 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] drm/i915/gem: Replace dev_priv with i915
Message-ID: <ZgUsO9OTrHO7HaPC@ashyti-mobl2.lan>
References: <20240328071833.664001-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328071833.664001-1-andi.shyti@linux.intel.com>
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

Hi,

On Thu, Mar 28, 2024 at 08:18:33AM +0100, Andi Shyti wrote:
> Anyone using 'dev_priv' instead of 'i915' in a cleaned-up area
> should be fined and required to do community service for a few
> days.

Not to scare people off, I would add another sentence in between:

"Using 'i915' instead of 'dev_priv' has been the preferred
practice over the past years and some effort has been spent to
replace 'dev_priv' with 'i915'. Therefore, 'dev_priv' should
almost never be used (unless it breaks some defines which are
dependent on the naming)."

> I thought I had cleaned up the 'gem/' directory in the past, but
> still, old aficionados of the 'dev_priv' name keep sneaking it
> in.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>

Thanks,
Andi
