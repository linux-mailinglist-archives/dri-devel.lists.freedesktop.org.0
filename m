Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26D74E9C49
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 18:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD35B10E702;
	Mon, 28 Mar 2022 16:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4761D10E6F0;
 Mon, 28 Mar 2022 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648485105; x=1680021105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Oc/kSMLWVXBeD9zz9P5gkDgMDlXCNjwf/5XWCmabFrk=;
 b=N8w1j964j3HU1qR53BAv+2yqWt/zM103iQ5MhCHkW0HaeZFMNyQ4ZxQL
 W6xkjblkNj5ItCX00+aTTGu0tc9j1WNIDgtco7+JNFgdYqBugO+zGIGoC
 xMTk+zDg583gZv/7L7JbsQYYHYAYiwQyiQkNPlZdr0pYoCsGVQOKahOvC
 AmD0CyscLDrUSAfcfaH6QDrA/Xc0bv/Q8fdt7+0gyYt8k3Dyn2JguCg8h
 6y2/m+bpdEoSFIZdVKgOX7zYA+eaRa7XuU02uDF6ZtDRzcocquqy7MIJx
 bHWqgvh0AJmmSL7sxSB8zhD2MzevF+7q1BRZ2GEqCCrAPW/HgUkoaOgsQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="283935500"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="283935500"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 09:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="553970066"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga007.fm.intel.com with SMTP; 28 Mar 2022 09:31:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 19:31:41 +0300
Date: Mon, 28 Mar 2022 19:31:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 02/11] drm/edid: fix reduced blanking support check
Message-ID: <YkHi7QmemzCXP6QR@intel.com>
References: <cover.1648458971.git.jani.nikula@intel.com>
 <8bb6a4997680685e1a6b8978ac34befd955578f4.1648458971.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bb6a4997680685e1a6b8978ac34befd955578f4.1648458971.git.jani.nikula@intel.com>
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

On Mon, Mar 28, 2022 at 12:17:16PM +0300, Jani Nikula wrote:
> The reduced blanking bit is valid only for CVT, indicated by display
> range limits flags 0x04.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

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
