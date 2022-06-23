Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C5B558171
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 19:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79D810E25F;
	Thu, 23 Jun 2022 17:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD1A10E134;
 Thu, 23 Jun 2022 17:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656003650; x=1687539650;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=J9s/LpFILeLPTlseYxUrJteIVRlhiZdWHoHvHoBnIYU=;
 b=lro7qkdeGo3BFuiX4LytnMZ8C9e3/vrt1S+Re5Te5IvtIGNmIUZQg+Ce
 s3U5TVZjgK9lc+2aSC7oT/ztIQHKkTYL9UXjbiM+XYKZsDrZQJ0uXRhPd
 RftWyIFbLxFzhyWzDoRwrPeH2Kcdy3mAlX6erVl/gR4Mu8+YZvUAcrADI
 MfCC6d9oQ1Sf/QvSRxDbpcxx5sCq+KDxkHbo3z2WBgQJJSUuxXJdmeIBs
 3TW2QgWT84yxMNuxEypeesTKEELEh6hU8JPgo+l+ysHeZd6OE8qi4cfv3
 KPnUd9951nmCQcUIszwdk9v0mcLwjCTujLQ2DpdlqRhT83kpR3xA8WqmA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="261209487"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="261209487"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 10:00:20 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="834723685"
Received: from anefedov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.38.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 10:00:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] GPU: drm: i915: drop unexpected word 'for' in comments
In-Reply-To: <20220623101113.28470-1-jiangjian@cdjrlc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220623101113.28470-1-jiangjian@cdjrlc.com>
Date: Thu, 23 Jun 2022 20:00:11 +0300
Message-ID: <871qvfnwmc.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiang Jian <jiangjian@cdjrlc.com>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jun 2022, Jiang Jian <jiangjian@cdjrlc.com> wrote:
> there is an unexpected word 'for' in the comments that need to be dropped

While it's also unexpected, it's really *duplicated* word.

> file - drivers/gpu/drm/i915/i915_reg.h
> line - 2537
>
>  * Please check the detailed lore in the commit message for for experimental
>
> changed to:
>
>  * Please check the detailed lore in the commit message for experimental
>

The above is just duplication of the patch itself, and completely
unnecessary.

The patch subject prefix should be something like "drm/i915:" or
"drm/i915/reg:".

Pro-tip for figuring out good guesses of what the subject prefix should
be:

$ git log --since={5-year} --no-merges --pretty=format:%s -- drivers/gpu/drm/i915/i915_reg.h | sed 's/:.*//' | sort | uniq -c | sort -rn | head
    312 drm/i915
    113 drm/i915/icl
     57 drm/i915/tgl
     26 drm/i915/cnl
     25 drm/i915/display
     22 drm/i915/dg2
     16 drm/i915/psr
     14 drm/i915/gt
     14 drm/i915/adl_p
     12 drm/i915/dg1

The patch itself is fine, but I'm nitpicking on the commit message
because I've seen lots of patches like this, with the same kind of stuff
in the commit messages.

BR,
Jani.


> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 616164fa2e32..738c020396af 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2534,7 +2534,7 @@
>   * HDMI/DP bits are g4x+
>   *
>   * WARNING: Bspec for hpd status bits on gen4 seems to be completely confused.
> - * Please check the detailed lore in the commit message for for experimental
> + * Please check the detailed lore in the commit message for experimental
>   * evidence.
>   */
>  /* Bspec says GM45 should match G4X/VLV/CHV, but reality disagrees */

-- 
Jani Nikula, Intel Open Source Graphics Center
