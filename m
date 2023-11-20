Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55A7F100C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 11:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7828610E393;
	Mon, 20 Nov 2023 10:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A85F10E398;
 Mon, 20 Nov 2023 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700475366; x=1732011366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3M0fnx9ji/wMGwg9py9GkvNxm/0f77Eot9Xpk7OhK3k=;
 b=VjG+JrYnpiyLQv0IA+uNOsNlXzlOZ+L5coPMjaoCfJGYYDA22Fw3fU1N
 sKxEr9KGfwMsCHDEznqx71qW27+9hg9llSeJHLFYpdZ7uvCe5sgkjKWgZ
 voWeS+qhF4GqfknuPUf+XJNg3VuW+rI3Ex5eZlOFRozJWVCa1xSQ5bFmD
 WkQlk78CWCKrXoYT0aQF9IdIEYHHfPowS6l60wLy7xwURX2WGpnJ6ZaZV
 7742Jmga7nfaWQ1v1nA5Uc+H5hhIbXl3IwyxIr67yKM1KyaLLpLq2970F
 ZUrfcBUvy5jHsZInutN0cA+/V5ijI74T31B19L1I9rKZfVaTmdYtpZrvX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="455917793"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="455917793"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:16:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="889877496"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="889877496"
Received: from kdaxer-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.237])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:16:00 -0800
Date: Mon, 20 Nov 2023 11:15:56 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: Remove return type from
 i915_drm_client_remove_object
Message-ID: <ZVsx3GHC9qhbMear@ashyti-mobl2.lan>
References: <20231113085457.199053-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113085457.199053-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, Nov 13, 2023 at 08:54:56AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> There is no need to return anything in the version which was merged and
> also the implementation of the !CONFIG_PROC_FS wasn't returning anything,
> causing a build failure there.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: e4ae85e364fc ("drm/i915: Add ability for tracking buffer objects per client")
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311110104.8TlHVxUI-lkp@intel.com/

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
