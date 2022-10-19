Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24E605086
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930FE10EB34;
	Wed, 19 Oct 2022 19:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF46010EB34;
 Wed, 19 Oct 2022 19:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666208197; x=1697744197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XthHaY6g6mLip71VpFSUF5Zrp5kcZmLuwha5WZUvsQI=;
 b=mX/Pf6OGvz+o06Su7KiF7v2l9z3yLMSGUa3dtZ50stEGkZV+ZZuyqGZ+
 DQvrEax4gsHDQge2BpBVBdkKiTrB4QvRxF0yVFnWWyZNzjVj5efa0RsV8
 jvkJMC+hgJVqBKOZXrpCHc6rLuCRFGo7GotOUd2rjaOsjzmTr9LIZf8Si
 y1z5ttufzyVaYsGcmaL0egEby9VnhxlmFL+kI8pbYyx2Tj3DIDt+RBMCV
 MQmZL+HU1ULNgokok9O+FWGWyD8/h8ByguE8tQHPtM+M9VLZcbMUlRsp6
 UtoWGZARswLCxvHV+4+oLJsOlm4eevlmcUpRFhbZRPT9PEMERwGN0tKKX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="368562294"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="368562294"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 12:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="631828177"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="631828177"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 19 Oct 2022 12:36:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 22:36:33 +0300
Date: Wed, 19 Oct 2022 22:36:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 04/15] drm/edid: debug log EDID override set/reset
Message-ID: <Y1BRwURddh66LyTE@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <3673fe73231b4eced1b3fe7da131950c602bb16e.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3673fe73231b4eced1b3fe7da131950c602bb16e.1665496046.git.jani.nikula@intel.com>
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

On Tue, Oct 11, 2022 at 04:49:38PM +0300, Jani Nikula wrote:
> It's useful debugging information to know if and when an override EDID
> was set or reset.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 47465b9765f1..a863cffa2dc5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2194,6 +2194,9 @@ int drm_edid_override_set(struct drm_connector *connector, const void *edid,
>  
>  	connector->override_edid = false;
>  
> +	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override set\n",
> +		    connector->base.id, connector->name);
> +
>  	ret = drm_connector_update_edid_property(connector, edid);
>  	if (!ret)
>  		connector->override_edid = true;
> @@ -2206,6 +2209,9 @@ int drm_edid_override_reset(struct drm_connector *connector)
>  {
>  	connector->override_edid = false;
>  
> +	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override reset\n",
> +		    connector->base.id, connector->name);
> +
>  	return drm_connector_update_edid_property(connector, NULL);
>  }
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
