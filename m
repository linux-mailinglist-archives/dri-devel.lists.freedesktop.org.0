Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE36360EB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 15:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52FF10E1FC;
	Wed, 23 Nov 2022 14:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7717310E1FC;
 Wed, 23 Nov 2022 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669212126; x=1700748126;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BI5tXCwb+zaf+N0R67dLTCZm7bXYYoHvlOPgJrvp48A=;
 b=ab+VgHxsUd1ZgYqkDstunCYcGDZ8V1dxYjFsgHMaatX7SUniIgrAKQHo
 bWlSuiXOdCKBSK+yyfL6/hZefLp91Le4nYUXTPH+/2cMr0OrcrWWWB7+X
 WzDaVbGX2Nc2JYKh95TPPM4DBW4C2kbaE3jO5eOMu3iOylRBbGO6Pbblr
 zPd5mxd0J6Z65uv2chU9JcpEyneXt148aJACHH2H2tDGUMXN7ywNCe8P4
 lw3ryvWVA/LTWuEj+RC183NUUK2UecxHctu77Kcu/NsrLPEEQrJyvvVnh
 GFcb4jcmxXGJXGVJNB0jngONb/R+8aGamhTmg6NgDRcuOAXG5jfHUb4zM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="312770315"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="312770315"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 06:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="970870402"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="970870402"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga005.fm.intel.com with SMTP; 23 Nov 2022 06:01:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Nov 2022 16:01:48 +0200
Date: Wed, 23 Nov 2022 16:01:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/audio: make drm_audio_component.h
 self-contained
Message-ID: <Y34nzGO+2EDiTDgg@intel.com>
References: <20221123130932.3863985-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123130932.3863985-1-jani.nikula@intel.com>
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

On Wed, Nov 23, 2022 at 03:09:32PM +0200, Jani Nikula wrote:
> The file uses bool and struct completion, include the relevant headers.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  include/drm/drm_audio_component.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/drm_audio_component.h b/include/drm/drm_audio_component.h
> index 0d36bfd1a4cd..5a4cd1fa8e2a 100644
> --- a/include/drm/drm_audio_component.h
> +++ b/include/drm/drm_audio_component.h
> @@ -4,6 +4,9 @@
>  #ifndef _DRM_AUDIO_COMPONENT_H_
>  #define _DRM_AUDIO_COMPONENT_H_
>  
> +#include <linux/completion.h>
> +#include <linux/types.h>
> +
>  struct drm_audio_component;
>  struct device;
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
