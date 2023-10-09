Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D87BDBC6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 14:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471EB10E259;
	Mon,  9 Oct 2023 12:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952B810E112;
 Mon,  9 Oct 2023 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696854519; x=1728390519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RfddNvi5x0wejZG5QzaCfI3Qcz87rv0fDzUvwx9WuLY=;
 b=fUDPshpfWyU0gstdvmwc7yu5vRQjt5H8WEwzNEyynd1VWg/F4XMp6Qhy
 Y7JOYJpT5EZv8imQGi8sv5IPX3QxVx6e6aZGjP5o9zimyj7r2jYMGp4UY
 tfeF0n3CxHlz9nCS1MG9uLfYC8Mb2/R+sy5zcrevYcRVWCnnmHG5ohvnB
 Kylf0jTO1+G3MruC70DrSnfFsOEkF39xiMdLUu3u/AU9la93Qa6FSLIYC
 5NofFMSgsLm78Daos+ZIopxmRZHdDbIHGPPeLMgpruFJQdnHTtL5bMeZI
 6aTM4zBVNqGJGFfwZPrzxQd3VxQrOXdL/pqDHihIsw8oOQ8j2laPNDUsW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384004946"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="384004946"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 05:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="746656325"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="746656325"
Received: from ibrahim2-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.42.185])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 05:28:26 -0700
Date: Mon, 9 Oct 2023 14:28:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm/i915/guc: Annotate struct ct_incoming_msg with
 __counted_by
Message-ID: <ZSPx5OrMBm0O6wpL@ashyti-mobl2.lan>
References: <20231006201744.work.135-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006201744.work.135-kees@kernel.org>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Fei Yang <fei.yang@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Tom Rix <trix@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, llvm@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 John Harrison <John.C.Harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kees,

On Fri, Oct 06, 2023 at 01:17:45PM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ct_incoming_msg.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

merged in drm-intel-gt-next.

Thanks,
Andi
