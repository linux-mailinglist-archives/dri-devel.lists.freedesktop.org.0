Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7410434EBF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 17:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAB16E9CA;
	Wed, 20 Oct 2021 15:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101B6E9C7;
 Wed, 20 Oct 2021 15:12:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="227571907"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="227571907"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 08:11:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="662277996"
Received: from mmazarel-mobl1.ger.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 08:11:18 -0700
Message-ID: <9ba70b49a41351ba711ead0212e2752f0db6c7fa.camel@linux.intel.com>
Subject: Re: [PATCH 8/9] drm/i915: mark up internal objects with
 start_cpu_write
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 20 Oct 2021 17:11:16 +0200
In-Reply-To: <20211018174508.2137279-8-matthew.auld@intel.com>
References: <20211018174508.2137279-1-matthew.auld@intel.com>
 <20211018174508.2137279-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-10-18 at 18:45 +0100, Matthew Auld wrote:
> While the pages can't be swapped out, they can be discarded by the
> shrinker.
> Normally such objects are marked with __I915_MADV_PURGED, which can't
> be
> unset, and therefore requires a new object. For kernel internal
> objects
> this is not true, since the madv hint is reset for our special
> volatile
> objects, such that we can re-acquire new pages, if so desired,
> without
> needing a new object. As a result we should probably be paranoid here
> and put the object back into the CPU domain when discarding the
> pages,
> and also correctly set cache_dirty, if required.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


