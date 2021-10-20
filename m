Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116FF434E0D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 16:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363246E2DC;
	Wed, 20 Oct 2021 14:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4726D6E2DC;
 Wed, 20 Oct 2021 14:39:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="228667683"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="228667683"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 07:38:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="567583551"
Received: from mmazarel-mobl1.ger.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 07:38:56 -0700
Message-ID: <f66d4ebec62b2c0e660fc827f17e1dee08032fbe.camel@linux.intel.com>
Subject: Re: [PATCH 3/9] drm/i915: extract bypass-llc check into helper
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 20 Oct 2021 16:38:53 +0200
In-Reply-To: <20211018174508.2137279-3-matthew.auld@intel.com>
References: <20211018174508.2137279-1-matthew.auld@intel.com>
 <20211018174508.2137279-3-matthew.auld@intel.com>
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
> It looks like we will need this in some more places, so extract as a
> helper.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c | 26
> ++++++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  1 +
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 17 +-------------
>  3 files changed, 28 insertions(+), 16 deletions(-)
> 
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


