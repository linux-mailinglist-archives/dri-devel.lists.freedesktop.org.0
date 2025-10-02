Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2175EBB3CAC
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 13:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E24E10E194;
	Thu,  2 Oct 2025 11:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hh+vwRsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D3E10E194
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759405211; x=1790941211;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vWzodoQgqiLu0pXyZfRnw5dcWNrHKmXYDfqUz9i4RoU=;
 b=hh+vwRsOE27fHbxFCsLYwAn/3sEeL6e3OpZKxoXblvPlufD30q3++b0H
 13wzh6sDaCNWRCZA9vvQU+IYiy1MatVxAoHWbCnI+T1sBIPSw4UMSXd3F
 L4mq2Dl+pTxVRzSvzsrBugAGqoxKuUP+bFKHF7XlamgImvWCAxH0sdS0i
 FIkLTVbqjD5v5NkYgI6VHoVhapVKHyzv1ezkrtmpVVs2cTGSNAp0PMoiR
 1F5PMhhnTmXkbapK5Aqzu2r+iMYn3Qj/Mj1tPOmbsREj18xcXrUL4el/5
 bh6b/k4FK1Sln48BgH0anc4lAWWj3v3TqzYYp9Z9IW5+2tFGIqJLohBrP w==;
X-CSE-ConnectionGUID: fOu+sFHnSXmdWdFYmz+N6Q==
X-CSE-MsgGUID: rn+Tqq/jQk2i8RUiZzn3Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79337985"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="79337985"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 04:40:11 -0700
X-CSE-ConnectionGUID: vyYSF09PRJaTpofzcJnjDg==
X-CSE-MsgGUID: O9GCZXuXTjWwkrgSjbrZVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="183321130"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 04:40:08 -0700
Date: Thu, 2 Oct 2025 14:40:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] drm/vblank: downgrade vblank wait timeout from WARN
 to debug
Message-ID: <aN5klZdl2MZdPSpU@intel.com>
References: <20251002025723.9430-1-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002025723.9430-1-chintanlike@gmail.com>
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

On Wed, Oct 01, 2025 at 07:57:23PM -0700, Chintan Patel wrote:
> When wait_event_timeout() in drm_wait_one_vblank() times out, the
> current WARN can cause unnecessary kernel panics in environments
> with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
> under scheduler pressure or from invalid userspace calls, so they are
> not always a kernel bug.

"invalid userspace calls" should never reach this far.
That would be a kernel bug.

> 
> Replace the WARN with drm_dbg_kms() messages that provide useful
> context (last and current vblank counters) without crashing the
> system. Developers can still enable drm.debug to diagnose genuine
> problems.
> 
> Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
> Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
> 
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> 
> v2:
>  - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
>  - Remove else branch, only log timeout case
> ---
>  drivers/gpu/drm/drm_vblank.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 46f59883183d..a94570668cba 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1289,7 +1289,7 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	int ret;
> -	u64 last;
> +	u64 last, curr;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
> @@ -1305,7 +1305,12 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>  				 last != drm_vblank_count(dev, pipe),
>  				 msecs_to_jiffies(100));
>  
> -	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
> +	curr = drm_vblank_count(dev, pipe);
> +
> +	if (ret == 0) {
> +		drm_dbg_kms(dev, "WAIT_VBLANK: timeout crtc=%d, last=%llu, curr=%llu\n",
> +			pipe, last, curr);

It should at the very least be a drm_err(). Though the backtrace can
be useful in figuring out where the problem is coming from, so not
too happy about this change.

> +	}
>  
>  	drm_vblank_put(dev, pipe);
>  }
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
