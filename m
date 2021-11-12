Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252644E825
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0763A6EC5E;
	Fri, 12 Nov 2021 14:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AD36EC4D;
 Fri, 12 Nov 2021 14:06:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="231859109"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="231859109"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 06:06:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="504901034"
Received: from sbacanu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.217.145])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 06:06:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin King <colin.king@canonical.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/i915: make array states static const
In-Reply-To: <20210915112702.12783-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210915112702.12783-1-colin.king@canonical.com>
Date: Fri, 12 Nov 2021 16:06:41 +0200
Message-ID: <87wnld31u6.fsf@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Sep 2021, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the read-only array states on the stack but instead it
> static. Also makes the object code smaller.

Finally pushed, sorry for the delay.

BR,
Jani.

>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index cce1a926fcc1..a60710348613 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -893,7 +893,7 @@ static u32
>  sanitize_target_dc_state(struct drm_i915_private *dev_priv,
>  			 u32 target_dc_state)
>  {
> -	u32 states[] = {
> +	static const u32 states[] = {
>  		DC_STATE_EN_UPTO_DC6,
>  		DC_STATE_EN_UPTO_DC5,
>  		DC_STATE_EN_DC3CO,

-- 
Jani Nikula, Intel Open Source Graphics Center
