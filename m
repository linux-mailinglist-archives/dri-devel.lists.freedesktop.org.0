Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A195FC7C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 00:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948E810E232;
	Mon, 26 Aug 2024 22:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKmZuiGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DDF10E219;
 Mon, 26 Aug 2024 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724710326; x=1756246326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vHTWezTDg3VjLJ9BJa7omSY9dIg3RiuEC6mMMyKLquY=;
 b=RKmZuiGgp9TzuQ3XIkO6NFuyIzHCJuSyw+9/d4O1x7sMEOhDd87b3+WZ
 k8+bB8Cmh1WtB4gIz1lnBMVU4evUvqzH9k/q4GN51/15YgVA2qMB693gC
 3hz2VFh5yXlKtvxixhJtulTdaCHG9TJmwxL9QQw3lNFN8Yzv9RJ+mnLpB
 iEOlDM00WVxyZdJMPnIUADnBZ005AsKI4Lv24g3CpYt9VJ+btuWjm/e8j
 1S6pjCOSRW+hbyFhrzQVsghbV5aayC1SvqzThxSu89nYEQObWtUfvFfJM
 57MDofndpKmEIb417EIKgkuIRKcyyb9bc6R8LFtVk5kaRAwLxgirSzIQg g==;
X-CSE-ConnectionGUID: gAYTfegKS7uTb1GBHBxE9Q==
X-CSE-MsgGUID: i79fO9v9T0mE40eurlJirQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26059727"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="26059727"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 15:12:03 -0700
X-CSE-ConnectionGUID: pV5z/GHRQKWpL2Z3L6N29g==
X-CSE-MsgGUID: h8vg/mEyT82OaKbHTAPF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62700903"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.180])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 15:11:55 -0700
Date: Tue, 27 Aug 2024 00:11:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: renjun wang <renjunw0@foxmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, lyude@redhat.com,
 imre.deak@intel.com, Wayne.Lin@amd.com,
 ville.syrjala@linux.intel.com, vidya.srinivas@intel.com,
 jouni.hogander@intel.com, andi.shyti@linux.intel.com,
 janusz.krzysztofik@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm: Fix kerneldoc for "Returns" section
Message-ID: <Zsz9pwQ3m9zHrjo-@ashyti-mobl2.lan>
References: <tencent_37A873672B5CD20DECAF99DEDAC5E45C3106@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_37A873672B5CD20DECAF99DEDAC5E45C3106@qq.com>
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

Hi Renjun,

On Sat, Aug 24, 2024 at 04:36:34PM +0800, renjun wang wrote:
> The blank line between title "Returns:" and detail description is not
> allowed, otherwise the title will goes under the description block in
> generated .html file after running `make htmldocs`.
> 
> There are a few examples for current kerneldoc:
> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#c.drm_crtc_commit_wait
> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#c.drm_atomic_get_crtc_state
> https://www.kernel.org/doc/html/latest/gpu/i915.html#c.i915_vma_pin_fence
> 
> Signed-off-by: renjun wang <renjunw0@foxmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 ----
>  drivers/gpu/drm/drm_atomic.c                  | 6 ------
>  drivers/gpu/drm/drm_atomic_helper.c           | 2 --
>  drivers/gpu/drm/drm_file.c                    | 7 -------
>  drivers/gpu/drm/drm_gem.c                     | 7 ++-----
>  drivers/gpu/drm/drm_modes.c                   | 1 -
>  drivers/gpu/drm/drm_rect.c                    | 1 -
>  drivers/gpu/drm/drm_vblank.c                  | 2 --
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    | 1 -
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  | 1 -
>  drivers/gpu/drm/i915/i915_vma.h               | 1 -
>  11 files changed, 2 insertions(+), 31 deletions(-)

next time, please, split the series so that each component goes
to the right branch.

Andi
