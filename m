Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08001B3E03F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4060B10E00C;
	Mon,  1 Sep 2025 10:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQtqbSGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ED610E00C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756722951; x=1788258951;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WCyYowOqevwO8SZyivpbXwqnsjmahTQWLcHklpsphI8=;
 b=mQtqbSGBrKrc44E9pE7n1ZGClpxzC2HyVpJ6q2UEgHSxHX4voR/X0LnA
 QnUunBS6NHNphBUV5gaOUT8NowLFdzHIelcACS1jHwUpbJQgoSActDu91
 wowJ/YY1ShbzI4mzJHBnF64T7FFkbPTPPQpg+m40yuWvS39XD4PWxQ5x/
 Nmft48YL2PoHeVWWI+yYxaRela1gnz8/NbIlGqi8fe/Buagf61thA/BWy
 xd+CulkttDzXjALIonsnrgMHZGCipdltaIhi2bjh5xg6x9ySOd5lnFfB2
 HsheyJaOohaN23HD1/Cw3W249vchbF4KusEYai9VRZ2dqBG1QCOK5MfJ+ g==;
X-CSE-ConnectionGUID: KSa5WXHaQreGnkp/qzhOqw==
X-CSE-MsgGUID: 3pa4V9RrSqW0301iP0m63A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59043422"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59043422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:35:51 -0700
X-CSE-ConnectionGUID: orThVEFsR1eiFqspoc5WvA==
X-CSE-MsgGUID: +6a5PcyXTtmQyfERVMVfvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170536516"
Received: from dmilosz-mobl.ger.corp.intel.com (HELO [10.245.252.194])
 ([10.245.252.194])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:35:49 -0700
Message-ID: <be0c1856-2722-40ef-9531-64f640149238@linux.intel.com>
Date: Mon, 1 Sep 2025 12:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Remove unused PLL_CONFIG_DEFAULT
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com
References: <20250808111044.328800-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250808111044.328800-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next

On 8/8/2025 1:10 PM, Jacek Lawrynowicz wrote:
> This change removes the unnecessary condition, makes the code clearer,
> and silences clang-tidy warning.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw_btrs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
> index b236c7234daab..afdb3b2aa72a7 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
> @@ -33,7 +33,6 @@
>  
>  #define PLL_CDYN_DEFAULT               0x80
>  #define PLL_EPP_DEFAULT                0x80
> -#define PLL_CONFIG_DEFAULT             0x0
>  #define PLL_REF_CLK_FREQ               50000000ull
>  #define PLL_RATIO_TO_FREQ(x)           ((x) * PLL_REF_CLK_FREQ)
>  
> @@ -303,7 +302,7 @@ static void prepare_wp_request(struct ivpu_device *vdev, struct wp_request *wp,
>  		wp->epp = 0;
>  	} else {
>  		wp->target = hw->pll.pn_ratio;
> -		wp->cfg = enable ? PLL_CONFIG_DEFAULT : 0;
> +		wp->cfg = 0;
>  		wp->cdyn = enable ? PLL_CDYN_DEFAULT : 0;
>  		wp->epp = enable ? PLL_EPP_DEFAULT : 0;
>  	}

