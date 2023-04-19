Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA86E797D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 14:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5816610E199;
	Wed, 19 Apr 2023 12:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F1A10E199;
 Wed, 19 Apr 2023 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681906616; x=1713442616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pl0Fj8njTvTodei45z7BipIYoSlOoHUirquGX/RaoQc=;
 b=B+xVfSX7nxQUe3Yuox5jqFMP1ic0oVtIHFs6KY4G7JerDKjG2HuxihOD
 J+wXnPaGSTwQy8NBWGyCob4PgbsOWpRBSJFSVradHTbiTfNcA6WkxsQQr
 se8B+VjIxK3TSSYgKYVrpxn74qkA2erNZ0CefyT3d0iendW/Eeq6BN+Ti
 txuDAOrGA7UddIzEJc7rFeXOM3ASbm4YFlTXLzTa10En5mRYTgVqISBez
 w3X07lqp5OBtYs8Ut048rf5xYx6ieqdrw2kfxrEVK/QsXZAkcaAO8kBVt
 AC5IriKXQvNN2A37uCV9Ji3v+y264QR2eceGDnchrFsXyOE/a5zKGRmyX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="329607434"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="329607434"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="1021188995"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="1021188995"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:16:53 -0700
Date: Wed, 19 Apr 2023 14:16:49 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Message-ID: <ZD/bscB+OUWF+Ln/@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-8-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417062503.1884465-8-fei.yang@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Sun, Apr 16, 2023 at 11:25:02PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Currently the KMD is using enum i915_cache_level to set caching policy for
> buffer objects. This is flaky because the PAT index which really controls
> the caching behavior in PTE has far more levels than what's defined in the
> enum. In addition, the PAT index is platform dependent, having to translate
> between i915_cache_level and PAT index is not reliable, and makes the code
> more complicated.
> 
> >From UMD's perspective there is also a necessity to set caching policy for

you have an extra '>' here.

> performance fine tuning. It's much easier for the UMD to directly use PAT
> index because the behavior of each PAT index is clearly defined in Bspec.
> Haivng the abstracted i915_cache_level sitting in between would only cause

/Haivng/Having/

> more ambiguity.
> 
> For these reasons this patch replaces i915_cache_level with PAT index. Also
> note, the cache_level is not completely removed yet, because the KMD still
> has the need of creating buffer objects with simple cache settings such as
> cached, uncached, or writethrough. For these simple cases, using cache_level
> would help simplify the code.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

fiuuuuu... quite a run this patch! But I did review it once,
anyway I checked it again, it looks all correct.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
