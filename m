Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D7803157
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 12:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3F10E349;
	Mon,  4 Dec 2023 11:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B460210E348;
 Mon,  4 Dec 2023 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701688478; x=1733224478;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oC4Fb+ly6kc/8HmjgdZ9sE3GdThxJH/O2tx5CoIldOg=;
 b=WfNmp+QDADJ8mOn+C4hWHGe/rXBvbIqzRUB+oQTyAZbKAJYF15g/om3n
 JabPwF+3BfSLvS4zXCqawbkDB/NS9FD0BKIIAwL4sRBbeyfdyEB3g3POG
 IkOhc5YBPxGIwrw/8igcDn8vW0nj07lf56ucgjAnRk72z1wK/0TxB+0vw
 N5ra+J6Fv42WoCrhqcjBjTdN2XehhVJ/mm4SrxnTJcgL5ONU0XufMBUDT
 YU0Le1d1YanlWK1WNuzRY46uucfogxXr103clDtz79z9qCREss7wLs+gm
 fpKkEhBoZTGBv6Lm4YVxFWhCF8q7u+kvRWRddtQFriFqXBW7EKMmj+Jyp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="460211882"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="460211882"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 03:14:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="1102058284"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="1102058284"
Received: from shahmoha-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.180])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 03:14:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/display/dp: Add the remaining Square PHY
 patterns DPCD register definitions
In-Reply-To: <20231130231510.221143-1-khaled.almahallawy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231130231510.221143-1-khaled.almahallawy@intel.com>
Date: Mon, 04 Dec 2023 13:14:33 +0200
Message-ID: <87leaa2p9i.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Lee Shawn C <shawn.c.lee@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023, Khaled Almahallawy <khaled.almahallawy@intel.com> wrote:
> DP2.1 Specs added new DPCDs definitions for square pattern configs[1]
> These new definitions are used for UHBR Source Transmitter
> Equalizations tests[2]. Add the 3 new values for square pattern.
>
> v2: rebase
>
> [1]: DP2.1 Specs - 2.12.3.6.5 Square Pattern
> [2]: DP2.1 PHY CTS specs - 4.3 UHBR Source Transmitter Equalization
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

Thanks for the patch, pushed to drm-misc-next.

BR,
Jani.


> ---
>  include/drm/display/drm_dp.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 83d2039c018b..3731828825bd 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -651,6 +651,9 @@
>  # define DP_LINK_QUAL_PATTERN_PRSBS31       0x38
>  # define DP_LINK_QUAL_PATTERN_CUSTOM        0x40
>  # define DP_LINK_QUAL_PATTERN_SQUARE        0x48
> +# define DP_LINK_QUAL_PATTERN_SQUARE_PRESHOOT_DISABLED                   0x49
> +# define DP_LINK_QUAL_PATTERN_SQUARE_DEEMPHASIS_DISABLED                 0x4a
> +# define DP_LINK_QUAL_PATTERN_SQUARE_PRESHOOT_DEEMPHASIS_DISABLED        0x4b
>  
>  #define DP_TRAINING_LANE0_1_SET2	    0x10f
>  #define DP_TRAINING_LANE2_3_SET2	    0x110

-- 
Jani Nikula, Intel
