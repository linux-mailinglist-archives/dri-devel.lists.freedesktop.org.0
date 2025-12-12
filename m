Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E6CB8BFB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 12:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC0210E087;
	Fri, 12 Dec 2025 11:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmzRqXnF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2F910E087
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 11:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765540503; x=1797076503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fOUtkPZvxALB9p/w3Vfzy0YAydZr+SZQXrwowXkZxw0=;
 b=UmzRqXnFd221I35ej81vyy110CnZUbJSmjSfQxXcOdkP1I8MK/f+slvw
 kO437PUMmW22LDH6kilNBz+CxRAa5nUximbYHZqIiCNufP+v+m/K4qSDW
 caVkIvFVNR11vFl06mtr2Xgm1eb2kVb8d3xka5wUH0FC3E3ltUpc0RI37
 4u2PYeDZ/GuKfzKrTSA1ECKQvnWfc1FuZabpWB/hppz1LVOdbazFDe2Bb
 xLHfRnvvhs4C1ZHUdejKwt2SgQuowIkB4i9l/f4X5nc15nM+7+kd2ztUu
 7ABeB1UPL6JqJqwxxgP3ppLcyKUzJRSERSheGnxgxGSU6WnYrwkrHqEbp Q==;
X-CSE-ConnectionGUID: tRLLWWmBT/2k++LTgY8VUw==
X-CSE-MsgGUID: 3++H0KIVSO66J123gLq93A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66713545"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="66713545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:55:02 -0800
X-CSE-ConnectionGUID: 9Xb7s/mKQyS/uk0jLQp56A==
X-CSE-MsgGUID: GU4eiGeuSvS+UaEv6NsNMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="201987030"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:55:00 -0800
Date: Fri, 12 Dec 2025 13:54:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: chintanlike@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org,
 syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com
Subject: Re: [PATCH] drm/atomic: Increase timeout in
 drm_atomic_helper_wait_for_vblanks()
Message-ID: <aTwCkiM687TjSEqh@intel.com>
References: <20251209143325.102056-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209143325.102056-1-tzimmermann@suse.de>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 09, 2025 at 03:33:18PM +0100, Thomas Zimmermann wrote:
> Increase the timeout for vblank events from 100 ms to 1000 ms. This
> is the same fix as in commit f050da08a4ed ("drm/vblank: Increase
> timeout in drm_wait_one_vblank()") for another vblank timeout.
> 
> After merging generic DRM vblank timers [1] and converting several
> DRM drivers for virtual hardware, these drivers synchronize their
> vblank events to the display refresh rate. This can trigger timeouts
> within the DRM framework.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/20250904145806.430568-1-tzimmermann@suse.de/ # [1]
> Reported-by: syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/dri-devel/69381d6c.050a0220.4004e.0017.GAE@google.com/

Seems fine. This will slow things down a bit when things are
screwed up, but that slowdown is already dominated by the
massive 10 second timeouts in the atomic commit machinery,
so no big deal here.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index e641fcf8c568..e108f91bc3dd 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1839,7 +1839,7 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>  		ret = wait_event_timeout(*queue,
>  					 state->crtcs[i].last_vblank_count !=
>  						drm_crtc_vblank_count(crtc),
> -					 msecs_to_jiffies(100));
> +					 msecs_to_jiffies(1000));
>  
>  		WARN(!ret, "[CRTC:%d:%s] vblank wait timed out\n",
>  		     crtc->base.id, crtc->name);
> -- 
> 2.52.0

-- 
Ville Syrjälä
Intel
