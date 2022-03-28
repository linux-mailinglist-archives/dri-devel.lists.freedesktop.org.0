Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAAD4E9D7B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17DB10E730;
	Mon, 28 Mar 2022 17:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E0D10E07B;
 Mon, 28 Mar 2022 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648488441; x=1680024441;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Bmb2JN+wxFbvCFtVXElXbnLErTUBbNe+5dtHQPq3zGk=;
 b=JF9XH1JNud60DXwc6GcpE4ABShKtly6F17lRFLynmxaU+zUdicnCMXPj
 fhojy1IK0ta34Y9qNU6EkxnjkTEnmPDuD4ZOpP3l7WhtPYN5JDaQR8Vv0
 BP4Jz5FGNz5e1Q/ggz8JOgEplAKyRIkZtZy53eQGFIjtLI69eIDdbvG5D
 BD7aXRC6RRwdjFXDBbfHY9Iy3SZ/XZiWr/WSk48eBAUgNE12wQJg1iInz
 P42iodYkNHeRNcw50VnThOOvOYCPh+fe/oAWNiTVC3/oMrCQUzkcUiq+Z
 wncnHEkbveZ59GwsxuCm5tqrvYHzkqOjtk4o3F5VTsRG0dLQ3KXmazJvF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259249209"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="259249209"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563848618"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga008.jf.intel.com with SMTP; 28 Mar 2022 10:27:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:27:17 +0300
Date: Mon, 28 Mar 2022 20:27:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 02/12] drm/edid: fix reduced blanking support check
Message-ID: <YkHv9dC7NOKo37yu@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <5dea5ee24065450716bbc177dd6850d3193dbeec.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dea5ee24065450716bbc177dd6850d3193dbeec.1648477901.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 05:34:23PM +0300, Jani Nikula wrote:
> The reduced blanking bit is valid only for CVT, indicated by display
> range limits flags 0x04.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Let's repeat here in so it doesn't get lost.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 1b552fe54f38..13d05062d68c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2408,7 +2408,7 @@ is_rb(struct detailed_timing *t, void *data)
>  	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
> -	if (r[15] & 0x10)
> +	if (r[10] == DRM_EDID_CVT_SUPPORT_FLAG && r[15] & 0x10)
>  		*(bool *)data = true;
>  }
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
