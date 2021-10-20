Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7371B434EBB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 17:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DFF6E9C4;
	Wed, 20 Oct 2021 15:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244546E9C4;
 Wed, 20 Oct 2021 15:12:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="226263429"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="226263429"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 08:12:07 -0700
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="575371349"
Received: from mmazarel-mobl1.ger.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 08:12:03 -0700
Message-ID: <aeed3c3a34fc08f0a6885a8c185b3517661a49f5.camel@linux.intel.com>
Subject: Re: [PATCH 9/9] drm/i915/selftests: mark up hugepages object with
 start_cpu_write
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 20 Oct 2021 17:12:00 +0200
In-Reply-To: <20211018174508.2137279-9-matthew.auld@intel.com>
References: <20211018174508.2137279-1-matthew.auld@intel.com>
 <20211018174508.2137279-9-matthew.auld@intel.com>
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
> Just like we do for internal objects. Also just use
> i915_gem_object_set_cache_coherency() here. No need for over-flushing
> on
> LLC platforms.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
Reivewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



