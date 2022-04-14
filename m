Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACC500FDB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 16:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2B210FDFA;
	Thu, 14 Apr 2022 14:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D18C10FDEC;
 Thu, 14 Apr 2022 14:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649945381; x=1681481381;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZixLvq69wV1HP4tGVkxZizyHBG+4ewVmZ7tL4YextgI=;
 b=m4e0DQHHxBYRHmsxOOnkPc255YLqsFnIivU49Sib4pYCmRJsQTc0Jgmm
 AsICeRPzAIoAfobiwMDO3rY9BW68+Cu0UVq9eHhojz/4n7Y7YtD0tIMBt
 MUxQX8swLlR3xTvzwokF3hnROTKqXEZKLUwzVhonxD/SqpBauLy8UMtPp
 UAX7q7N8vXTNFOw6Xq4YZpKs+BpoIoux8/XfKFqgifnKv0TUT/KU0pdca
 F4ILP9mTDPgp9g4Jsqhd7+QhZ0U1z7SwR3/9TvdU4f3JyWVVW7cObrYiI
 zpAYivn/toOyNzopr2a8W16qVsXCYmXBNh6IPig+sxgLM1xBow9wcJEAA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="243523581"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="243523581"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 07:09:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="552696215"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 07:09:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [CI v3 00/12] drm/edid: low level EDID block read refactoring etc.
In-Reply-To: <cover.1649685475.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1649685475.git.jani.nikula@intel.com>
Date: Thu, 14 Apr 2022 17:09:26 +0300
Message-ID: <87czhjeoyx.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> v3 of [1] fixing the (!x == 0) mistake. Resending the entire thing with
> hopes the test robot picks up the baseline better; I haven't had much
> luck with --in-reply-to for that.

There were some issues with our CI, but I'm pretty sure they were not
caused by the series. Fingers crossed. Thanks for the reviews, pushed.

BR,
Jani.


>
> BR,
> Jani.
>
> [1] https://patchwork.freedesktop.org/series/102329/
>
> Jani Nikula (12):
>   drm/edid: convert edid_is_zero() to edid_block_is_zero() for blocks
>   drm/edid: have edid_block_check() detect blocks that are all zero
>   drm/edid: refactor EDID block status printing
>   drm/edid: add a helper to log dump an EDID block
>   drm/edid: pass struct edid to connector_bad_edid()
>   drm/edid: add typedef for block read function
>   drm/edid: abstract an EDID block read helper
>   drm/edid: use EDID block read helper in drm_do_get_edid()
>   drm/edid: convert extension block read to EDID block read helper
>   drm/edid: drop extra local var
>   drm/edid: add single point of return to drm_do_get_edid()
>   drm/edid: add EDID block count and size helpers
>
>  drivers/gpu/drm/drm_edid.c | 350 ++++++++++++++++++++++++-------------
>  1 file changed, 225 insertions(+), 125 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
