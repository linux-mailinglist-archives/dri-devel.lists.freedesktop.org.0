Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315636C69EC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 14:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA3010EA9D;
	Thu, 23 Mar 2023 13:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369A410EA9D;
 Thu, 23 Mar 2023 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679579417; x=1711115417;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fap1VLn5xB0Q3i+x+kNLGTtOIlAi5akrtPvhytf/VpQ=;
 b=D5VJCmRYjc/NuvWTgUTIbVZkyA7WR8Uqv56UcozUBCh8IhNDDxE0R4jU
 dZVCoZZ+NYkmwDn3lyFUFSKFhUgbpkL/noaYnMiCi0jjQFLSlIhIbVUo2
 VomB3tzIkMKtX7jm5jWY2qYpYzPLt3wKX02RHmwuYlj5JIa6h5FccHLFo
 GVK51N227QB95zU09cHA/2kebsxL7Zb5Rrv9nwl0/SGC0hnYe5ZRdd5cJ
 F+upVghyiteP8OU7nMIiq8jkVc4pTZGfCCNZ+Zr+6e2mzmxXAoeNT6IBx
 2G5SxYD5msInORu7Dqwj6Cuak1Bp/7KKryLgAIMs4rBp49Ww7EXS9HMEH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="402069249"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="402069249"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 06:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825823567"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="825823567"
Received: from sdepeste-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.47.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 06:35:42 -0700
Date: Thu, 23 Mar 2023 14:35:17 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Drop igt_cs_tlb
Message-ID: <ZBxVlflHfpvMcBmz@ashyti-mobl2.lan>
References: <20230320192117.287374-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320192117.287374-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 20, 2023 at 08:21:17PM +0100, Andi Shyti wrote:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> The gt_tlb live selftest has the same code coverage as the
> igt_cs_tlb subtest of gtt, except it is better at detecting
> TLB bugs.  Furthermore, while igt_cs_tlb is hitting some
> unforeseen issues, these issues are either false positives
> due to the test being poorly formatted, or are true
> positives that can be more easily diagnosed with smaller
> tests.  As such, igt_cs_tlb is superceded by and obsoleted
> by gt_tlb, meaning it can be removed.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

This patch, anyway needs some follow up for adding the range
TLB invalidation part.

Andi
