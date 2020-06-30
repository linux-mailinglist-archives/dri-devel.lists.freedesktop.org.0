Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906220F1D6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 11:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ABF89FED;
	Tue, 30 Jun 2020 09:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482D089B49;
 Tue, 30 Jun 2020 09:41:17 +0000 (UTC)
IronPort-SDR: sXEHl705UWvrNfx2yk8Cpfk0qVUYxgn07oDMoBL23v6Rr18wv/ToS7OaWTLbLVZZgTp6KzPgMe
 v1JuTtayGZfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="207705784"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="207705784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 02:41:16 -0700
IronPort-SDR: CAxgFpBBhNPa96ZUWaZgtD2EIjf2Fi+xqonxVo6fWUD8pjD30JRXcsiL/kMwvH6VYofFxvB+Vn
 yrLLABSqLB0A==
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="454543857"
Received: from rgrotewx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.12])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 02:41:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin King <colin.king@canonical.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/i915: fix a couple of spelling mistakes in
 kernel parameter help text
In-Reply-To: <20200616082129.65517-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200616082129.65517-1-colin.king@canonical.com>
Date: Tue, 30 Jun 2020 12:41:11 +0300
Message-ID: <87ftacnb60.fsf@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Jun 2020, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There are a couple of spelling mistakes in kernel parameter help text,
> namely "helpfull" and "paramters".  Fix them.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed, thanks for the patch.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/i915_params.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index a7b61e6ec508..8d8db9ff0a48 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -99,8 +99,8 @@ i915_param_named_unsafe(enable_psr, int, 0400,
>  
>  i915_param_named(psr_safest_params, bool, 0400,
>  	"Replace PSR VBT parameters by the safest and not optimal ones. This "
> -	"is helpfull to detect if PSR issues are related to bad values set in "
> -	" VBT. (0=use VBT paramters, 1=use safest parameters)");
> +	"is helpful to detect if PSR issues are related to bad values set in "
> +	" VBT. (0=use VBT parameters, 1=use safest parameters)");
>  
>  i915_param_named_unsafe(force_probe, charp, 0400,
>  	"Force probe the driver for specified devices. "

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
