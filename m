Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3943C5F48F2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 19:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAE110E073;
	Tue,  4 Oct 2022 17:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C197E10E072;
 Tue,  4 Oct 2022 17:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664905982; x=1696441982;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=q6EpAzeaREMD6X3gyCf0BKwJue0LMO9WqhXpb/0sZyA=;
 b=kLhEH0fgQpO7HnhgsOR9bLPhxPY2XDaaXzCQFMlVATqXoATGajQqLUUU
 jcS5v8s5JxNJT6jq4mQC7rLu3ZkO+O+YTGymLWIHjLq45CbwSJ7MMbNTc
 8AXFwgab8DpvDSVy0F0NSDXBTxWe6x4FZIGlWfNxwA4kirt3B++fo1Y5G
 pp78nr9qPgdkX3Mq7r23wlmUJx5mc/cnbiH/8/ANDXa8yA4y99xYmWyN1
 HoQgyVbsCWoIydUFKMKXLKKNcBU1x/+/JPfF1N6HlpxV0Tv9aFUuo4QH4
 Co+EVIJyJ4gZoftlw6ZADZB8r/+8wGgYGPq1s1d7vFv5tVThwTRerRuW9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="303959526"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="303959526"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 10:38:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="657211821"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="657211821"
Received: from pvarla-mobl4.gar.corp.intel.com (HELO localhost)
 ([10.252.39.104])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 10:38:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pablo Ceballos <pceballos@google.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915/display/lspcon: Increase LSPCON mode settle
 timeout
In-Reply-To: <20220915004601.320198-1-pceballos@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220915004601.320198-1-pceballos@google.com>
Date: Tue, 04 Oct 2022 20:38:24 +0300
Message-ID: <87ilkzsd4f.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Pablo Ceballos <pceballos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Sep 2022, Pablo Ceballos <pceballos@google.com> wrote:
> On some devices the Parade PS175 takes more than 400ms to settle in PCON
> mode.

Got any bug report with more info, or any other details to back this up?
This is kind of thin. What's the 800 ms based on?

BR,
Jani.


>
> Signed-off-by: Pablo Ceballos <pceballos@google.com>
> ---
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index 15d59de8810e..b4cbade13ee5 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -166,7 +166,7 @@ static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
>  	drm_dbg_kms(&i915->drm, "Waiting for LSPCON mode %s to settle\n",
>  		    lspcon_mode_name(mode));
>  
> -	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 400);
> +	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 800);
>  	if (current_mode != mode)
>  		drm_err(&i915->drm, "LSPCON mode hasn't settled\n");

-- 
Jani Nikula, Intel Open Source Graphics Center
