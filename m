Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A258A4D88
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97F112496;
	Mon, 15 Apr 2024 11:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4TCCscZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6952111248B;
 Mon, 15 Apr 2024 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713180107; x=1744716107;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sWIR7btRXBx7+IBOBxrzrqS7BWtoqCpvVr4Yb0Em0y0=;
 b=B4TCCscZLyPWqn9iCklvFYaGx7I5EkXSCEFVNwTtYBOEdAWAt4EfXCe7
 9BkhS2c8rquDlot8lIqCgkd6qYQ6rh61W81Hz3sZ+MgCHa229cpIc3egG
 MGeqZibLuJWbQDSaorsC1gvtWxr+T0Ky9kGrRs4yBsG1xhP5FrFLgJh2w
 plLWqdBpPwa7Sybm8sUQUnhi3IxBlRGfzds60lu5pgLt/ExIQgORWuOIQ
 RK9EEivyk4H4F6eOS3QtuVopIuP2u5lD4ba9zNcDlht/qVUMDwLcx4EBs
 wbhibg8U/zze3CuKtlk1UmDzNw2shyL1CiUF9IfcUdTxygLuZC1YmLXe2 w==;
X-CSE-ConnectionGUID: WQbBTVCqQpK4mO3cQZnsKQ==
X-CSE-MsgGUID: fUN3sp5LTXCbr3qzlm28mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8784090"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8784090"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 04:21:46 -0700
X-CSE-ConnectionGUID: DK23tnP7QXaFNZtjvzC77Q==
X-CSE-MsgGUID: Wl4Cc+QpROe5LKoBdFIsSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="21956767"
Received: from unknown (HELO intel.com) ([10.247.119.21])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 04:21:38 -0700
Date: Mon, 15 Apr 2024 13:21:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915: remove redundant assignement to variable
 err
Message-ID: <Zh0NvAwxl1xmyNFd@ashyti-mobl2.lan>
References: <20240415095659.482989-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415095659.482989-1-colin.i.king@gmail.com>
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

Hi Colin,

On Mon, Apr 15, 2024 at 10:56:59AM +0100, Colin Ian King wrote:
> The variable err is being assigned a value 0 that is never read, the
> break statement escapes a do-while loop and then the code returns
> without referencing err. The assignment is redundant and can be
> removed.
> 
> Cleans up clang scan build warning:
> drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:1075:5: warning: Value
> stored to 'err' is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
