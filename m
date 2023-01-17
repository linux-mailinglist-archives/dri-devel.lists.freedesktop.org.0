Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5092666DFA2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 14:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5432610E521;
	Tue, 17 Jan 2023 13:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1623810E521;
 Tue, 17 Jan 2023 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673963724; x=1705499724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tXtdjqRUaI7KuHWDRsoM3dAD+IplLvdjPfeRx1/vb0c=;
 b=CzHMLaK3+5Mq91vQKav+GEgi9k8eRMxF3fDdaAlwP/Bd2bHwH5yWrwqa
 HMx2htjeyGRXvg1VftjSg9wDxK/6HQIxoPVBX+9kc3n1oE1l+tkbGyEMU
 GLc+8kO/IcMc9Pc4WpJoo1JAGbTXOyLw1wQF+6clFTSM+EDPBionZyEMQ
 cHPuUzPer1UhJam5n4NhYpm6c6uz+Rm6sucQpjKjdbn+i16SRLasyENP7
 WSwKMiS8TPpDedtOAsq9M/9NiKpYiq6WRn56WRZWnKoTxX1Ga/Hm5rQQr
 G8rKB7Q83S4SMV3sxkz6tGW72jTCze3i8frdPOMfW/A2RhpmproXrMrZV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="305073791"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="305073791"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 05:55:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="689806235"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="689806235"
Received: from dmitriim-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.45.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 05:55:19 -0800
Date: Tue, 17 Jan 2023 14:55:16 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/print: Add drm_dbg_ratelimited
Message-ID: <Y8aoxGzUHMryRJ3C@ashyti-mobl2.lan>
References: <20230117115350.1071-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117115350.1071-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

can any of the DRM maintainers please check and eventually ack
this patch?

On Tue, Jan 17, 2023 at 12:53:49PM +0100, Nirmoy Das wrote:
> Add a function for ratelimitted debug print.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> ---
>  include/drm/drm_print.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a44fb7ef257f..1d839f507319 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -602,6 +602,9 @@ void __drm_err(const char *format, ...);
>  		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
>  })
>  
> +#define drm_dbg_ratelimited(drm, fmt, ...) \
> +	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
> +
>  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>  	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>  
> -- 
> 2.39.0
