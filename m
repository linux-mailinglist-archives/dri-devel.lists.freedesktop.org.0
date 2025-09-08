Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F1B48A80
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 12:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA3A10E205;
	Mon,  8 Sep 2025 10:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK780S4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061B910E1FC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757328430; x=1788864430;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rwRIMaQjDUrsFv5+b76riH0+0sz3qVkQrVlJXYlUaTo=;
 b=cK780S4hm5iH/NQnne1pHyf8Pnw3f0VfP2ovkwEd9hJHTkPLFYLDHPf+
 P7uzCopsKjm3cfKS/Mhp9JPoMLQnBSVlufhRxTb+X9kgGqzxWSEEP6imf
 3E0uz0AdvnADn0s2gwh6+pHzCYUrl+ujubygGivsLtaV/0CtlYbCnke7J
 AWGHp0UDV2C4jjcxwKm5gM3amHOXdJqt9/7YSa4sEaGuKQGwQ34U8zoy8
 xaKwCgPBqRaIOZj+RND6TwDt/3gSsANqVBOW2U6FhcO6zHC6uzOIhZGKH
 EKwaznnozbLHaQLuELV7Xi39GTqAMJsHD4OmQOj5NpDAUKV9AJNJ2Fryj A==;
X-CSE-ConnectionGUID: 2V+SR53WR/iLxq4XlIrjyQ==
X-CSE-MsgGUID: 1/KfkiqIR/eMC0PRcHfdcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="63408483"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="63408483"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:47:09 -0700
X-CSE-ConnectionGUID: Ip4uDhsqSuuBXarMsAOqeQ==
X-CSE-MsgGUID: 2x2OfDQdR86nFipbd6g4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173550305"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:47:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Zhenyu Wang
 <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nitin Gote
 <nitin.r.gote@intel.com>, Luca Coelho <luciano.coelho@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH] drm/i915/gvt: Remove redundant ternary operators
In-Reply-To: <20250904112644.350512-1-liaoyuanhong@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250904112644.350512-1-liaoyuanhong@vivo.com>
Date: Mon, 08 Sep 2025 13:47:02 +0300
Message-ID: <35ac1aad8feb977017d1d1a6eea86ed3754d8646@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 04 Sep 2025, Liao Yuanhong <liaoyuanhong@vivo.com> wrote:
> For ternary operators in the form of "a ? false : true", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index a91e23c22ea1..d432fdd69833 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -1921,7 +1921,7 @@ static int perform_bb_shadow(struct parser_exec_state *s)
>  	if (!bb)
>  		return -ENOMEM;
>  
> -	bb->ppgtt = (s->buf_addr_type == GTT_BUFFER) ? false : true;
> +	bb->ppgtt = s->buf_addr_type != GTT_BUFFER;
>  
>  	/*
>  	 * The start_offset stores the batch buffer's start gma's

-- 
Jani Nikula, Intel
