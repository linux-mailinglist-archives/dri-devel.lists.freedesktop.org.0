Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37A82AB7C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C6C10E0D1;
	Thu, 11 Jan 2024 10:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6DB10E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704967329; x=1736503329;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HnlymRMYb6iBEZkAa/8e5vTHfW9TBEzgwzS94R+//1Y=;
 b=Z7H+5z8qpdxlgEE/lzF8ufggRZscn7Jh/l45/ko2RxT8jG1UcMTgBDE5
 OcCNzrXo9EknS9yFHg7YNnDwJXHFoiCTcHXPqsAGI2RhSw01ob+2ue2eL
 +QzUVZN5dloWK9cU/TZa3QcsblLi+Ge1Q8MHckNU64w+jOGo6vIJ4YNvd
 XzspW0+Y+t+OdXvqOuq7KN2KzqdVWd0FAWrlDwebJpe+W70kYvf2I8bvq
 J0SmQrpxMvLBQiLfoevrHYh3dXspJUDrn3/zP/bjLtZD5q1/f+yUV2ELN
 L0XjRQP2zjFd1eTWfDGtHQ/ArQwdtZNzFrW1LbidlCU8liG3dPRWGIbxV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12157040"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="12157040"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1029485678"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="1029485678"
Received: from gaertgee-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.206])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:02:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: chenxuebing <chenxb_99091@126.com>, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: Re: [PATCH] drm/edid: Clean up errors in drm_edid.h
In-Reply-To: <20240111063921.8701-1-chenxb_99091@126.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111063921.8701-1-chenxb_99091@126.com>
Date: Thu, 11 Jan 2024 12:02:03 +0200
Message-ID: <8734v4ur1g.fsf@intel.com>
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

On Thu, 11 Jan 2024, chenxuebing <chenxb_99091@126.com> wrote:
> Fix the following errors reported by checkpatch:
>
> ERROR: do not use assignment in if condition
>
> Signed-off-by: chenxuebing <chenxb_99091@126.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 69c68804023f..9bcaf76f10fc 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3611,7 +3611,8 @@ static bool mode_in_range(const struct drm_display_mode *mode,
>  	if (!mode_in_vsync_range(mode, edid, t))
>  		return false;
>  
> -	if ((max_clock = range_pixel_clock(edid, t)))
> +	max_clock = range_pixel_clock(edid, t);
> +	if (max_clock)
>  		if (mode->clock > max_clock)
>  			return false;

-- 
Jani Nikula, Intel
