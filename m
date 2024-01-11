Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79F82AB6D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A255110E865;
	Thu, 11 Jan 2024 09:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2939E10E818
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704967134; x=1736503134;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eAPK3YkWDsGD+tLUM4iln5sX6YLes8N2a44CKmlPzg4=;
 b=ZA+PisjRu/7t9DX/HSFVjD+wgo/u8/njBd52GCzo3QCou4kwEv7I2PK6
 Zz9n7Cbtgvnhyed5K1ly9c+rUL1YNWTkuqLOVsjHvPPiUNE6dUh2WdO6n
 pI8GGytVXpc1uRxoCnUkAhkXH7wIG5yqZHLQe0ohhDgyQ0ydcL2RhL5a8
 YWddUSHtsr809Dw9AVECbLwXdpPcFbe8MasZNjvFo/7VCc+zmJ735tsAN
 SeR35EMEgGCLD6Dvotag1rOMIybdiFvfJ5NXwPjFQ0CTHsdiuKDFzpVnf
 k5UsTFra6SzvzWfNl4wkdQd35ANUXRz7u0kCxqzC0RCfzROpesa0dunYB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="463087935"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="463087935"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="925949261"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="925949261"
Received: from gaertgee-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.206])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:58:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: chenxuebing <chenxb_99091@126.com>, airlied@gmail.com,
 tzimmermann@suse.de, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: Re: [PATCH] drm: Clean up errors in drm_dp_helper.h
In-Reply-To: <20240111064400.8878-1-chenxb_99091@126.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111064400.8878-1-chenxb_99091@126.com>
Date: Thu, 11 Jan 2024 11:58:47 +0200
Message-ID: <878r4wur6w.fsf@intel.com>
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
> ERROR: space prohibited before open square bracket '['

Nah, checkpatch just isn't clever enough to realize it's within a macro.

BR,
Jani.

>
> Signed-off-by: chenxuebing <chenxb_99091@126.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index b1ca3a1100da..2704bf703040 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2133,7 +2133,7 @@ void drm_dp_aux_unregister(struct drm_dp_aux *aux)
>  }
>  EXPORT_SYMBOL(drm_dp_aux_unregister);
>  
> -#define PSR_SETUP_TIME(x) [DP_PSR_SETUP_TIME_ ## x >> DP_PSR_SETUP_TIME_SHIFT] = (x)
> +#define PSR_SETUP_TIME(x)[DP_PSR_SETUP_TIME_ ## x >> DP_PSR_SETUP_TIME_SHIFT] = (x)
>  
>  /**
>   * drm_dp_psr_setup_time() - PSR setup in time usec

-- 
Jani Nikula, Intel
