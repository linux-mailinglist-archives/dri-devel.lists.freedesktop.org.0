Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3B551597
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318410E268;
	Mon, 20 Jun 2022 10:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C1110E744;
 Mon, 20 Jun 2022 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655720340; x=1687256340;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JsWiswkBl1LCE3i/DlPLr6VjhNxX61sq9DYEGWHKL+s=;
 b=VSd/X8Uj+yUIBMaHNaQhpsHh2mNMIQhFLPL54XtYXxIrdYJWOo39+3V2
 yhX7ydp0kNslp5wxBJy0uuA2R6hHTOd4/m16q0qHCfSwAfWfSlxX2j+9P
 X9Ivxj2Q9YFHAu5lxQ86AvekgRyhvF6ETj/Sq3afzB0X+3irQOpzk/5mr
 bgpPRlJ2SfvL+gTLdsGr7upQhc3UiOBK2nrH5vCqUHBan+295+w+vq4B9
 UeahjeiArQstG8hIoI1i7r3F/Sofo0c7hpibInNJ6ph8Fdl8HPySfVhFo
 x7W38VpBjyarMmI3G4Usd21rOC4iFco4HQAGLuYitewpyCNt1RyNM2gwB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262893664"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="262893664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:18:57 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643050863"
Received: from malikhan-mobl1.amr.corp.intel.com (HELO [10.212.127.6])
 ([10.212.127.6])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:18:54 -0700
Message-ID: <7a2028c6-8ed6-1fc4-3abf-b13f7254cdee@linux.intel.com>
Date: Mon, 20 Jun 2022 11:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/gem: remove unused assignments
Content-Language: en-US
To: zys.zljxml@gmail.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220620100216.1791284-1-zys.zljxml@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220620100216.1791284-1-zys.zljxml@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: bob.beckett@collabora.com, thomas.hellstrom@linux.intel.com,
 katrinzhou <katrinzhou@tencent.com>, linux-kernel@vger.kernel.org,
 matthew.auld@intel.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/06/2022 11:02, zys.zljxml@gmail.com wrote:
> From: katrinzhou <katrinzhou@tencent.com>
> 
> The variable ret is reassigned and the value EINVAL is never used.
> Thus, remove the unused assignments.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
> Signed-off-by: katrinzhou <katrinzhou@tencent.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index ab4c5ab28e4d..d5ef5243673a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -931,8 +931,6 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>   		break;
>   
>   	case I915_CONTEXT_PARAM_PERSISTENCE:
> -		if (args->size)
> -			ret = -EINVAL;
>   		ret = proto_context_set_persistence(fpriv->dev_priv, pc,
>   						    args->value);

AFAICT fix should end up with code like this:

if (args->size)
	ret = -EINVAL;
else
	ret = proto_context_set_persistence(...)
break;


Alternatively move args->size checking into 
proto_context_set_persistence to align with set_persistence().

Regards,

Tvrtko

>   		break;
