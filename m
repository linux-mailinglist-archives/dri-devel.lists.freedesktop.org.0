Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A24951C41
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 15:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C79410E499;
	Wed, 14 Aug 2024 13:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pu+KV+uK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6742C10E494;
 Wed, 14 Aug 2024 13:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723643544; x=1755179544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8sELu0ZN8+Jm1Zbq5sAGW9Anpsxmnzfr1mCzydBwHKs=;
 b=Pu+KV+uKHTZ2BNU5PTgZltu4bwfQth4tarQiSKjFr3rq6OQUNH9R0iB8
 kgDQ4vOfZaIMJ4K4RbSOMoZHPJEjO9BYi9GvIweGTv2DCUSLI8QtaeXFS
 eOJKcQzfiGhkqXEv2F+bBRgOmuIteye6HlOCyJZwkOzGN07vOdaIlQQc1
 AeE5/W5qr05Dgp4sWoEQcbvMOfO4rgiywzCy8q4jKQSa6U1WPjIa5V9wO
 lqjQmWp/9fIpoSbYQR12yxIpqBHLkmvEPRKvQ0Y7dZNWqq6gYTsf2E7Rv
 Vza4RdNxDKlDDNMCp/8YD++OZQp35SrA95Xg7ufc3J2bC35o0NY9uOZ8V g==;
X-CSE-ConnectionGUID: We97PijESnqdzs95Ts68bQ==
X-CSE-MsgGUID: if+8YSUCSwSSX2ncLh+f8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21828367"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="21828367"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:52:02 -0700
X-CSE-ConnectionGUID: mpcN4dZRTpWrmBv66yKqgQ==
X-CSE-MsgGUID: uCCiYO59S02amEAuvAOByw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="58654011"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.62])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:51:55 -0700
Date: Wed, 14 Aug 2024 15:51:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sima <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 0/2] Allow partial memory mapping for cpu memory
Message-ID: <Zry2d2LtQLiPY58x@ashyti-mobl2.lan>
References: <20240814134837.116498-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814134837.116498-1-andi.shyti@linux.intel.com>
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

Argh... sorry, I messed up with format-patch and send-mail and
sent it twice.

Maybe I need to resend it if CI complains.

Andi

On Wed, Aug 14, 2024 at 03:48:32PM +0200, Andi Shyti wrote:
> Hi,
> 
> I am resending this patch series, not to disregard the previous
> discussions, but to ensure it gets tested with the IGTs that
> Krzysztof has provided.
> 
> This patch series finalizes the memory mapping fixes and
> improvements by enabling partial memory mapping for CPU memory as
> well.
> 
> The concept of partial memory mapping, achieved by adding an
> object offset, was implicitly introduced in commit 8bdd9ef7e9b1
> ("drm/i915/gem: Fix Virtual Memory mapping boundaries
> calculation") for GTT memory.
> 
> To address a previous discussion with Sima and Matt, this feature
> is used by Mesa and is required across all platforms utilizing
> Mesa. Although Nirmoy suggested using the Fixes tag to backport
> this to previous kernels, I view this as a new feature rather
> than a fix.
> 
> Lionel, please let me know if you have a different perspective
> and believe this should be treated as a bug fix, requiring it
> to be backported to stable kernels.
> 
> The IGTs have been developed in collaboration with the Mesa team
> to replicate the exact Mesa use case[*].
> 
> Thanks Chris for the support, thanks Krzysztof for taking care of
> the IGT tests, thanks Nirmoy for your reviews and thanks Sima and
> Matt for the discussion on this series.
> 
> Andi
> 
> [*] https://patchwork.freedesktop.org/patch/608232/?series=137303&rev=1
> 
> Test-with: 20240814132404.18392-1-krzysztof.niemiec@intel.com
> 
> Changelog:
> ==========
> v1 -> v2
>  - Added Nirmoy's tags.
> 
> Andi Shyti (2):
>   drm/i915/gem: Do not look for the exact address in node
>   drm/i915/gem: Calculate object page offset for partial memory mapping
> 
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 10 ++++++----
>  drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
>  drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 
> -- 
> 2.45.2
