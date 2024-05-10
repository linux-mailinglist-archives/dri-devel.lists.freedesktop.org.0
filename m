Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083928C25B0
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 15:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F032310E5CB;
	Fri, 10 May 2024 13:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUTmW4pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380610E5CB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715347730; x=1746883730;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=JNVUJHF2a+qB/u4b9hHmU8iljMDVm45a4r29Vy/xOKI=;
 b=bUTmW4ppbACbScQnEJqFOGiCelSlE7XTU76oBHdYt35rdA5vD5zqO39o
 4IlBLiSxoXe+z8mIl+BPLM5X3qM4uCr6JSUtiG9eNE8TQ+WrYWdL9QWgS
 ddom8jzuWTF/mMHAzX/JhXMLPF7EdnYh867s6F9ZAKvJBv9iIXG8iYL0u
 L7l+ymu9vHsdTCP5xoC48ubJAEydI7rGfCfOAM6OPuDtGvbxgV0WJmrt0
 caPfugTLl2UlYxAi+hpgGWb+V1zBzeYwL9cb12yRtazVbYzGQwVtVAvap
 uaqIEnif06p0g3vycV+WdXcKz3m/j43tcC/67kdKWwIpw+ghbj1rLHHHm Q==;
X-CSE-ConnectionGUID: FwtvTawcSSWa0qR8IwOS5w==
X-CSE-MsgGUID: 6mI26aEnSfGRxbR6fUk81w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11489794"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11489794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:28:50 -0700
X-CSE-ConnectionGUID: TQC6vgJvQ7mrZNubXAEeog==
X-CSE-MsgGUID: a7T0rqirS/y00cxbPZSn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67089879"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:28:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/15] drm: struct drm_edid conversions
In-Reply-To: <649cda91-767c-4683-b217-ff4e14ba3f30@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1713273659.git.jani.nikula@intel.com>
 <649cda91-767c-4683-b217-ff4e14ba3f30@suse.de>
Date: Fri, 10 May 2024 16:28:45 +0300
Message-ID: <87le4hhk36.fsf@intel.com>
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

On Tue, 07 May 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 16.04.24 um 15:22 schrieb Jani Nikula:
>> I've these laying in a branch for a while, maybe let's try to make some
>> forward progress in this front.
>
> Could you take another look at the udl patches at [1]? The second 
> iteration of the patches is self-contained within the driver. So the 
> most-controversial points should be resolved now.

Done.

I've also resent the remaining patches from this series [2]. With [1]
and [2] merged, we could remove drm_do_get_edid() interface altogether.

BR,
Jani.


[2] https://lore.kernel.org/r/cover.1715347488.git.jani.nikula@intel.com

>
> Best regards
> Thomas
>
> [1] https://patchwork.freedesktop.org/series/132039/#rev2
>
>>
>> Build tested only, on x86, arm, and arm64.
>>
>> BR,
>> Jani.
>>
>>
>> Jani Nikula (15):
>>    drm/panel: simple: switch to struct drm_edid
>>    drm/panel-samsung-atna33xc20: switch to struct drm_edid
>>    drm/panel-edp: switch to struct drm_edid
>>    drm/bridge/analogix/anx6345: switch to struct drm_edid
>>    drm/bridge/analogix/anx78xx: switch to struct drm_edid
>>    drm/sun4i: hdmi: switch to struct drm_edid
>>    drm/vc4: hdmi: switch to struct drm_edid
>>    drm/bridge: anx7625: use struct drm_edid more
>>    drm/gud: switch to struct drm_edid
>>    drm/i2c: tda998x: switch to struct drm_edid
>>    drm/bochs: switch to struct drm_edid
>>    drm/virtio: switch to struct drm_edid
>>    drm/rockchip: cdn-dp: switch to struct drm_edid
>>    drm/rockchip: inno_hdmi: switch to struct drm_edid
>>    drm/rockchip: rk3066_hdmi: switch to struct drm_edid
>>
>>   .../drm/bridge/analogix/analogix-anx6345.c    | 15 +++---
>>   .../drm/bridge/analogix/analogix-anx78xx.c    | 23 +++++-----
>>   drivers/gpu/drm/bridge/analogix/anx7625.c     | 26 +++++++----
>>   drivers/gpu/drm/bridge/analogix/anx7625.h     | 10 +---
>>   drivers/gpu/drm/gud/gud_connector.c           | 12 ++---
>>   drivers/gpu/drm/i2c/tda998x_drv.c             | 19 ++++----
>>   drivers/gpu/drm/panel/panel-edp.c             | 17 ++++---
>>   .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 13 ++++--
>>   drivers/gpu/drm/panel/panel-simple.c          | 15 +++---
>>   drivers/gpu/drm/rockchip/cdn-dp-core.c        | 33 +++++++------
>>   drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
>>   drivers/gpu/drm/rockchip/inno_hdmi.c          | 12 ++---
>>   drivers/gpu/drm/rockchip/rk3066_hdmi.c        | 12 ++---
>>   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        | 18 +++++---
>>   drivers/gpu/drm/tiny/bochs.c                  | 23 ++++------
>>   drivers/gpu/drm/vc4/vc4_hdmi.c                | 46 ++++++++++---------
>>   drivers/gpu/drm/virtio/virtgpu_display.c      | 10 ++--
>>   drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
>>   drivers/gpu/drm/virtio/virtgpu_vq.c           | 12 ++---
>>   19 files changed, 167 insertions(+), 153 deletions(-)
>>

-- 
Jani Nikula, Intel
