Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E9A1A6CA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B794810E83D;
	Thu, 23 Jan 2025 15:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oj8HRSQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7F10E83D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737645195; x=1769181195;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PJ7aYCbtXYZu+NJO1JN2by/s67/mM6chwppH2LXXzu4=;
 b=Oj8HRSQ3JKt9aq/VC+jaeYsJ9uAGfuuEuSvcpZHsx3WaWwGBTB3uFD7w
 ds4Qqbe0FXyE9FKPDS0tUH0KwXpFct3GoeLsdPVPxmd9QYY6ExZf8CpXK
 IQIw2zXILMfx679oDt9yQ/AT/xn3sYHmy1AjebVIfyqgM0wwSg63M5O2y
 7qcyMUJIEhStGOV5scTOnHTyHQ89KEnO/f1zBNPcJFfCVuQfTb1jm57zB
 W2QodRwTlg7VDlPBgw94bJhSFMMKGeLHR7EkqDKZd7zL5wt9IjPe8nyxS
 5R7VW784BKHidfRdVRJ9OYZY6fRtjSDqPd68p0Ul1hgJ+kDOSfejcscSO g==;
X-CSE-ConnectionGUID: +dFkaHzZTqeHKE/+YTS+2w==
X-CSE-MsgGUID: k9vhAc2sTOiVVm/PEI0xTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48645062"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="48645062"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:12:41 -0800
X-CSE-ConnectionGUID: iA8pr0lGR2G7SnmEsAU9RQ==
X-CSE-MsgGUID: pnYUQ/TcQBKbHiLGBBM+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107299297"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:12:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Damon Ding
 <damon.ding@rock-chips.com>
Subject: Re: [PATCH v6 01/14] drm/rockchip: analogix_dp: Replace DRM_...()
 functions with drm_...()
In-Reply-To: <87ikq5n2di.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-2-damon.ding@rock-chips.com>
 <87ikq5n2di.fsf@intel.com>
Date: Thu, 23 Jan 2025 17:12:31 +0200
Message-ID: <875xm5mun4.fsf@intel.com>
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

On Thu, 23 Jan 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 23 Jan 2025, Damon Ding <damon.ding@rock-chips.com> wrote:
>> According to the comments in include/drm/drm_print.h, the DRM_...()
>> functions are deprecated in favor of drm_...() or dev_...() functions.
>>
>> Use drm_err()/drm_dbg_core()/drm_dbg_kms() instead of
>> DRM_DEV_ERROR()/DRM_ERROR()/DRM_DEV_DEBUG()/DRM_DEBUG_KMS().
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v6:
>> - Use drm_...() uniformly rather than mixing drm_...() and dev_..()
>> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
>> ---
>>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 29 ++++++++++---------
>>  1 file changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index 0844175c37c5..dd33d7540e4b 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -100,13 +100,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>>  
>>  	ret = clk_prepare_enable(dp->pclk);
>>  	if (ret < 0) {
>> -		DRM_DEV_ERROR(dp->dev, "failed to enable pclk %d\n", ret);
>> +		drm_err(dp, "failed to enable pclk %d\n", ret);
>
> Please don't do this.
>
> You're supposed to pass struct drm_device to drm_err() and friends. Not
> some random struct pointer that just happens to have a ->dev member.
>
> The drm_* macros may change at any time to actually expect the correct
> type.

And with [1] I'm hoping "at any time" becomes "real soon now".

BR,
Jani.


[1] https://lore.kernel.org/all/cover.1737644530.git.jani.nikula@intel.com


-- 
Jani Nikula, Intel
