Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBAA5545C6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214D51125BA;
	Wed, 22 Jun 2022 11:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B471125D4;
 Wed, 22 Jun 2022 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655897842; x=1687433842;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtU2Y8dBdDnHq8H7yBgFCvaWxAPQx9yCl1KzbmITiaU=;
 b=ZcHVA72wMRQv6n2p+0qgUGhhm7gmH1q8Xs+iu5NR7/hTHXXrirP+Qb0V
 eSBb2qke1qzAaCDqmgiwwtl1gXk3IJ+8nOITw4UfgDIYd+3L4KcRG4n6W
 pGOlqLDcCDZTM8ECAijqXwsNu45YZgdJGg4hKg+X7egPQDhd/u99aA5bM
 v/0VeJgfITxThFEnHu9u/M8t6D/H9uIIKkKCdQnd97SvC43w3b7U8Q8mX
 8Jl/0meuXtNvQsRcc7lG2pnl95hVDoLxJ/aJ+fNR5iW0jwXoTaDoJGpOL
 7C6j2W+F05b7WXTChjgeFamy2ZX3PAwxv6f2uO0ChjqQoRuuGR6uLwTU1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="269112735"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="269112735"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:37:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="690457834"
Received: from wterliko-mobl.ger.corp.intel.com (HELO [10.249.254.201])
 ([10.249.254.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:37:19 -0700
Message-ID: <5a190fb8c2e31ae434940f0d942debd32807b262.camel@linux.intel.com>
Subject: Re: [PATCH v8 04/10] drm/i915/gem: selftest should not attempt mmap
 of private regions
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jun 2022 13:37:16 +0200
In-Reply-To: <20220621200058.3536182-5-bob.beckett@collabora.com>
References: <20220621200058.3536182-1-bob.beckett@collabora.com>
 <20220621200058.3536182-5-bob.beckett@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-21 at 20:00 +0000, Robert Beckett wrote:
> During testing make can_mmap consider whether the region is private.
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>

LGTM.
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 5bc93a1ce3e3..76181e28c75e 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -869,6 +869,9 @@ static bool can_mmap(struct drm_i915_gem_object
> *obj, enum i915_mmap_type type)
>         struct drm_i915_private *i915 = to_i915(obj->base.dev);
>         bool no_map;
>  
> +       if (obj->mm.region && obj->mm.region->private)
> +               return false;
> +
>         if (obj->ops->mmap_offset)
>                 return type == I915_MMAP_TYPE_FIXED;
>         else if (type == I915_MMAP_TYPE_FIXED)


