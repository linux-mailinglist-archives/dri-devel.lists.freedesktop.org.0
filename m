Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57044E6164
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 10:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866F510E776;
	Thu, 24 Mar 2022 09:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AAB10E2FB;
 Thu, 24 Mar 2022 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648115866; x=1679651866;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5pWMXm6/ad8t/vDpGlpaj1ZWbgKQkZ1B50zfHdF/XQw=;
 b=D6ZevL3UCnEjN14TC2Hchmb+M0x1di3BUubY1JSY7LBQMDogmtdWZSDq
 susKe7B4n2UdArt8uVKQDThfC95CMucT1g7owfk4ZkVUzDMa3V+f2FkO0
 XdXlynsLwWug9KOaJgryNdHfMiqD5nIGT2zOUud8ZyH3VcRyfbvsebWy0
 SCZTNI93gTzNtk8HDPmjI+SdRM4IGgkG49sQfNQDw95Ongywen2cjBSbU
 1nhyXgRwWwrjnUVn6J7pclG9B24GVOOUF90nYI/Pp9uQunTMUE66W8l8h
 iP6gt9u7yAGWS7tEXCDx5F7TVZM1T/+hFLjuocVOSSBf+hqAvz7inF50B g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="283192392"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="283192392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 02:57:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="544577026"
Received: from cnalawad-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.131])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 02:57:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [v3] drm/edid: check basic audio support on CEA extension block
In-Reply-To: <20220324061635.328-1-shawn.c.lee@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220321044330.27723-1-cooper.chiou@intel.com>
 <20220324061635.328-1-shawn.c.lee@intel.com>
Date: Thu, 24 Mar 2022 11:57:35 +0200
Message-ID: <87y20zhdv4.fsf@intel.com>
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
Cc: Cooper Chiou <cooper.chiou@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Shawn C Lee <shawn.c.lee@intel.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Mar 2022, Lee Shawn C <shawn.c.lee@intel.com> wrote:
> From: Cooper Chiou <cooper.chiou@intel.com>
>
> Tag code stored in bit7:5 for CTA block byte[3] is not the same as
> CEA extension block definition. Only check CEA block has
> basic audio support.
>
> v3: update commit message.
>
> Cc: stable@vger.kernel.org
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Shawn C Lee <shawn.c.lee@intel.com>
> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
> Signed-off-by: Cooper Chiou <cooper.chiou@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> Fixes: e28ad544f462 ("drm/edid: parse CEA blocks embedded in DisplayID")
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the patch, pushed to drm-misc-next-fixes.

BR,
Jani.

> ---
>  drivers/gpu/drm/drm_edid.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 561f53831e29..f07af6786cec 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4859,7 +4859,8 @@ bool drm_detect_monitor_audio(struct edid *edid)
>  	if (!edid_ext)
>  		goto end;
>  
> -	has_audio = ((edid_ext[3] & EDID_BASIC_AUDIO) != 0);
> +	has_audio = (edid_ext[0] == CEA_EXT &&
> +		    (edid_ext[3] & EDID_BASIC_AUDIO) != 0);
>  
>  	if (has_audio) {
>  		DRM_DEBUG_KMS("Monitor has basic audio support\n");

-- 
Jani Nikula, Intel Open Source Graphics Center
