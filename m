Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E7376B7D0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB35F10E405;
	Tue,  1 Aug 2023 14:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B9110E405;
 Tue,  1 Aug 2023 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690900832; x=1722436832;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WKNfzQqsc7FCZxNn5pfKjv4pKvpeP9UUq6yggZzoP+c=;
 b=Pk0W4oXNvpTk15MR2ZsgN+H6manTx4sQlHB9ie+/d6iIcrT7w3lO5cW+
 8sSimLKpytOhrQjFcqT7VSpQn6/midUihNnjp8rvcAS63wQX0lqyoMaMO
 D7pXOSGUYczKLzEISibbLcn6+F7qupJFlN6rC/paUHh8zUDZmrWBYNpFz
 9qBuGOISf9emV7KOhCPPHc5etYn4/PR+G050SCM5hbMpGeO91EL/aP7aa
 Tr7tfK7TF2OO5VQz2pO8hfEd0by3xHvJ45/WH3l6N3F7rBwzbQstxbhYe
 z/DD/Bn6gLw61j0/hhQKgFbW2C6MaKmkUAFLQ1I+Pk4KRg0y1QIkVadnY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="433155071"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="433155071"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758365025"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="758365025"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 07:40:32 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 10209580DA2;
 Tue,  1 Aug 2023 07:40:32 -0700 (PDT)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qQqY1-003MEx-2c;
 Tue, 01 Aug 2023 16:40:29 +0200
Message-ID: <e34b48cf-3bde-f60e-ac61-d5bbd7afb87d@linux.intel.com>
Date: Tue, 1 Aug 2023 16:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/4] Invalidate TLB cache for all GT's
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20230801141955.383305-1-andi.shyti@linux.intel.com>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230801141955.383305-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/1/23 16:19, Andi Shyti wrote:
> Hi,
>
> This series revisits a once-trendy topic: TLB invalidation
> support for multi-gt.  It's a theme that's been passed around and
> reshaped by several of us.
>
> I've filtered out most of the original changes from this series,
> initially sent by Mauro [1]. His ideas were inspired by some
> changes from Chris, who in turn was inspired by a change from
> me[2], all of which stemmed from offline talks by Chris (it's
> like a game of inspiration tag!).
>
> What I've done is simply rebase and refactor the patches,
> focusing solely on the changes needed for multi-gt TLB
> invalidation in MMIO memory. The result is a leaner, more
> targeted proposal.

Series look good to me. Feel free to add my R-B to the patches I didn't 
sign already.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>


>
> Other patches from the original series might follow.
>
> Thanks,
> Andi
>
> [1] https://patchwork.freedesktop.org/series/106293/
> [2] https://patchwork.freedesktop.org/series/103831/
>
> Andi Shyti (2):
>    i915/drm/gt: Move the gt defines in the gt directory
>    drm/i915: Remove unnecessary include
>
> Chris Wilson (2):
>    drm/i915/gt: Move TLB invalidation to its own file
>    drm/i915: Invalidate the TLBs on each GT
>
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |   4 +-
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  15 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c            | 140 +--------------
>   drivers/gpu/drm/i915/gt/intel_gt.h            |  12 --
>   drivers/gpu/drm/i915/gt/intel_gt_defines.h    |  11 ++
>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   4 +-
>   drivers/gpu/drm/i915/gt/intel_tlb.c           | 159 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_tlb.h           |  29 ++++
>   drivers/gpu/drm/i915/gt/selftest_tlb.c        |   3 +-
>   drivers/gpu/drm/i915/i915_drv.h               |   1 -
>   drivers/gpu/drm/i915/i915_vma.c               |  15 +-
>   12 files changed, 231 insertions(+), 163 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_defines.h
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h
>
