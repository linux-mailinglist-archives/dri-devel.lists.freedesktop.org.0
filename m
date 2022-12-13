Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C7B64B716
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 15:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD6010E20F;
	Tue, 13 Dec 2022 14:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79AF10E20F;
 Tue, 13 Dec 2022 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670940902; x=1702476902;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z+iNZqkCLVFNdvvtQObEfhSMESSGKM/kMoaqIi38z6Y=;
 b=FsEX0EV0UCly13EFyJd4CbcG6KpVDQg2ZA3atgZiJcIpA2nMZ5s+NN7N
 1n05nBMZEEx+rcZQ8nkMUxeIMwdrZxHdHM0fzEHzy8Y4/avaS/3O0MwUT
 +2md2hs99sxQtC6vz5NVHDWXpP8GxntrwtKnxPHoasxxi31n+5e9yvqVN
 SOUroYZJASBWYY/e6fo7j/dijrmJI41kw6Wwp6sUNAosj4NxaJ/H78wQd
 DKTzsEgales82Y6OKr6TtjdRRL2b1dxXkjzMf7MNfCLROT70JuGl3vsdK
 i/o4rvU3IrSxNK7AsmQ5q+aB6ew8gXqbvMlgYTUuQGWIkZUiiZhRIxJ+Q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="305779892"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="305779892"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 06:14:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="650722732"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="650722732"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.9.166])
 ([10.213.9.166])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 06:14:45 -0800
Message-ID: <2b8b1fdd-8dfb-797e-640c-425f72ccfbc8@intel.com>
Date: Tue, 13 Dec 2022 15:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/i915/selftests: Remove hardcoded value with a macro
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221213120010.5857-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221213120010.5857-1-nirmoy.das@intel.com>
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
Cc: matthew.auld@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13.12.2022 13:00, Nirmoy Das wrote:
> Use MI_USE_GGTT instead of hardcoded value.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> index c228fe4aba50..3bef1beec7cb 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> @@ -222,7 +222,7 @@ static int gpu_set(struct context *ctx, unsigned long offset, u32 v)
>   	}
>   
>   	if (GRAPHICS_VER(ctx->engine->i915) >= 8) {
> -		*cs++ = MI_STORE_DWORD_IMM_GEN4 | 1 << 22;
> +		*cs++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT;

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   		*cs++ = lower_32_bits(i915_ggtt_offset(vma) + offset);
>   		*cs++ = upper_32_bits(i915_ggtt_offset(vma) + offset);
>   		*cs++ = v;

