Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D514E4F94
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 10:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6916710E634;
	Wed, 23 Mar 2022 09:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32A310E634;
 Wed, 23 Mar 2022 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648028428; x=1679564428;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M5XVXlJ2tYhOA7HtZrp6yt0KlYlvTs9uGq4wIH55MIg=;
 b=KG+jbv3U1CLc8LSzvo0bq4vl3gDPbznl2chIX6SAjmIrYkc1c1jEr+FN
 PLgHtqWm4LWB4GJe/9jXDGfirUo9zdltxVPCMwtn7Z5FVIvjL3ucJTD2Q
 QWh7DbBPC0t/dFb9hNv2RzVpuaZTrQLSyt2UBbS5M9qdzS71OgXsf96AW
 OGV9AB0ksINcEtbmi05psyBrxsGHdyLlPwOO5iGE52d45gc1kWH6QXauz
 hRRt3WWjuu2UpCONiEHun9fewFLNbfn5dNbX4w8g03UOn8XOfPRGBUOZ3
 umewo+oWYH89RCwNWqdwSFhFgWGiTzwWLDl6HEmaSGACc2JA6aBMD3ELL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="282913216"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="282913216"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 02:40:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="560821663"
Received: from caliyanx-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.57.47])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 02:40:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [v2] drm/edid: check basic audio support on CEA extension block
In-Reply-To: <20220323054532.19840-1-shawn.c.lee@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220321044330.27723-1-cooper.chiou@intel.com>
 <20220323054532.19840-1-shawn.c.lee@intel.com>
Date: Wed, 23 Mar 2022 11:40:22 +0200
Message-ID: <87a6dhj9bt.fsf@intel.com>
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
Cc: Cooper Chiou <cooper.chiou@intel.com>, Shawn C Lee <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022, Lee Shawn C <shawn.c.lee@intel.com> wrote:
> From: Cooper Chiou <cooper.chiou@intel.com>
>
> Tag code stored in bit7:5 for CTA block byte[3] is not the same as
> CEA extension block definition. Only check CEA block has
> basic audio support.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Shawn C Lee <shawn.c.lee@intel.com>
> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
> Signed-off-by: Cooper Chiou <cooper.chiou@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>

Fixes: e28ad544f462 ("drm/edid: parse CEA blocks embedded in DisplayID")
Cc: <stable@vger.kernel.org> # v4.15
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

(commit e28ad544f462 was merged in v5.3, but it has Cc: stable for
v4.15.)

Also drm_edid_to_eld() and drm_parse_cea_ext() are affected by the same
issue. For the former, it doesn't really matter all that much, it just
ends up using the DisplayID data block version instead, but the latter
adds bogus color formats and should be fixed. Patch follows.

All of these are fixed in my recent series [1], but we'll want the
simple fixes for stable first.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/101659/

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
