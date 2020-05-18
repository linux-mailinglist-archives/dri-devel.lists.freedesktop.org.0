Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E11D743B
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 11:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD03C89EAC;
	Mon, 18 May 2020 09:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3BA89EAC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:41:36 +0000 (UTC)
IronPort-SDR: LYsPcUWoOEYj+M1Pixx0PGDwwzNosLiDofFqRrNlSrziAAGcCap/YH2SaEW0PWOPDdNju/h8T6
 Vg92pG1RKNMA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 02:41:36 -0700
IronPort-SDR: ntvEf7c+Iws8wgGlNW2RB57pH9mYTLPyATY9NqAn7blya6Hm6Dp/l1JP2QOxTvRqTrIuwfg0C7
 SxeLPeZ6L7xw==
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; d="scan'208";a="439151728"
Received: from ahermans-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.209])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 02:41:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/file: wrap excessively long line
In-Reply-To: <20200518083456.132248-1-emil.l.velikov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200518083456.132248-1-emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 12:41:31 +0300
Message-ID: <87tv0d37hw.fsf@intel.com>
MIME-Version: 1.0
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 May 2020, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 9b79bfc60ad7..97f7793b693f 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -342,7 +342,8 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
>  		return -EBUSY;	/* No exclusive opens */
>  	if (!drm_cpu_valid())
>  		return -EINVAL;
> -	if (dev->switch_power_state != DRM_SWITCH_POWER_ON && dev->switch_power_state != DRM_SWITCH_POWER_DYNAMIC_OFF)
> +	if (dev->switch_power_state != DRM_SWITCH_POWER_ON &&
> +	    dev->switch_power_state != DRM_SWITCH_POWER_DYNAMIC_OFF)
>  		return -EINVAL;
>  
>  	DRM_DEBUG("comm=\"%s\", pid=%d, minor=%d\n", current->comm,

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
