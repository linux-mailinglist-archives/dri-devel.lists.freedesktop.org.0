Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D67CF82B0EC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 15:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F65310E8F2;
	Thu, 11 Jan 2024 14:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2296110E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704984614; x=1736520614;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9XuexC1XqjTh3u+4RiixelWH3d7w3t5hO26lXRAs1QM=;
 b=kFw4PfmZJeP6ckO3BSBG3G3X4Iz1W7JMbSDHlZ6ao8xDRV0cgbQ0ukb9
 DM7V2a16O2BWTSzR5gBFhNsJR/U7+52vWxSmxJ0Nrc1lh+voVy0SThE7q
 TCHec9rwdoKGulrV6TuxWtIhuXOpZkghyOwHcHph7eYfnQhBYCwGbpUQz
 kR3SfNe89MxkQuncbOuPkQB0vsQ6yth3xyDe1nAu+XZ6txy8TK6QsnIb6
 CuKIvQ+RwjFceNEJenTfgkPeKjL+Z7Bx0SFmic/3xTGjS7ewEDg0HoPVJ
 o1lVMcWPo66oJdt2lIdvdxuvlSzqcazUvS5LZG+eabo7QnRKkc9kPVKer g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="397740995"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="397740995"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 06:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="775633954"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="775633954"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 06:50:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: chenxuebing <chenxb_99091@126.com>, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: Re: [PATCH] drm/edid: Clean up errors in drm_edid.h
In-Reply-To: <8734v4ur1g.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111063921.8701-1-chenxb_99091@126.com>
 <8734v4ur1g.fsf@intel.com>
Date: Thu, 11 Jan 2024 16:50:05 +0200
Message-ID: <87r0inudpe.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 11 Jan 2024, chenxuebing <chenxb_99091@126.com> wrote:
>> Fix the following errors reported by checkpatch:
>>
>> ERROR: do not use assignment in if condition
>>
>> Signed-off-by: chenxuebing <chenxb_99091@126.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-misc-next, thanks for the patch.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 69c68804023f..9bcaf76f10fc 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -3611,7 +3611,8 @@ static bool mode_in_range(const struct drm_display_mode *mode,
>>  	if (!mode_in_vsync_range(mode, edid, t))
>>  		return false;
>>  
>> -	if ((max_clock = range_pixel_clock(edid, t)))
>> +	max_clock = range_pixel_clock(edid, t);
>> +	if (max_clock)
>>  		if (mode->clock > max_clock)
>>  			return false;

-- 
Jani Nikula, Intel
