Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6152E4A8368
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AE410EA5B;
	Thu,  3 Feb 2022 11:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3306510E99D;
 Thu,  3 Feb 2022 11:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643889487; x=1675425487;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/7HCd5iekWEFE4OAPgzocebARftMy2i/042QDy18eRs=;
 b=PWameJCiOMkKgA5g5CqqPD8y+ngh4qo5E0RjRQPuOr9smgC97aiZcqjH
 0NbJ2hf7R/fyCMeM9B9LLv/AclL/GQKZJjKRNGkFlKsISf21HUyQjSA74
 v+/ytEuWMGhzh665HO2GRVICxM/LQkB/IAjLk5uOFEiddhPFM2N43muz8
 vVV9bygSH/jGAZQBgqQaYcKxvv6tzf+Uv++NWRVCZKjZwPjGc2FVnutHe
 0FPYLf1rT1sE3VREQZa6PloLe850wPPvhnzmn9Dvh1PH2lV6vfhfvWWdp
 2qempiYJfujsi8ZaQ2AJ5yh/2FQSy9R/f0b5wYeUufJIhBDtVO9JykUFb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="228780144"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="228780144"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 03:58:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="483217378"
Received: from cbrady-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.6.65])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 03:58:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 harry.wentland@amd.com
Subject: binary constants (was: Re: [PATCH v3] drm/dp: Add Additional DP2
 Headers)
In-Reply-To: <20210927192324.5428-1-Jerry.Zuo@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210927192324.5428-1-Jerry.Zuo@amd.com>
Date: Thu, 03 Feb 2022 13:58:00 +0200
Message-ID: <87ee4krwl3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Nicholas.Kazlauskas@amd.com, wayne.lin@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Sep 2021, Fangzhi Zuo <Jerry.Zuo@amd.com> wrote:
> +/* DSC Extended Capability Branch Total DSC Resources */
> +#define DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT		0x2260	/* 2.0 */
> +# define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
> +# define DP_DSC_DECODER_COUNT_SHIFT			5
> +#define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0	0x2270	/* 2.0 */
> +# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK	(1 << 0)
> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK	(0b111 << 1)
> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT	1

The patch was merged a while back, but only now I noticed the use of
binary constants, which in C is a GCC and Clang extension [1][2]. There
are some instances in the kernel, but not a whole lot.

Do we want to avoid or embrace them going forward? Or meh?


BR,
Jani.


[1] https://gcc.gnu.org/onlinedocs/gcc/Binary-constants.html
[2] https://clang.llvm.org/docs/LanguageExtensions.html#c-14-binary-literals

-- 
Jani Nikula, Intel Open Source Graphics Center
