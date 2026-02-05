Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCBKDr3ahGna5wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:00:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F06F6450
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A588210E3B0;
	Thu,  5 Feb 2026 18:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hv63OSIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097A810E946
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770314425; x=1801850425;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ph06AnyjAHxh4cLydxqvw1sf7lv3sd/ichYYiRQw4Xc=;
 b=Hv63OSILAGqksm85wl31IzKKSOz+U3xs+excD4SLQwbOFFrYp+1UAGL7
 kE5zfi9egVxUVwkd6i1cH3/6IuBeqJ7UDFauPCUd/MPfQwDyoi7vUHqhD
 oxczjp4EHDxZ3WXiVOd874g5OnlC9Nktxm+6r1bKyjHu0GTR7kPfPjiDd
 oTFiYGzVkR6sdziKn5Kwvd1hYtg+AmgX0k5K3WV+qQ1akA2EQDSbUA3Ox
 C+xueyl96FLmr3MvLG0ToACMOItncB/ApWq1Os+9EBFzZvjY5Cj3Mmv9L
 8BzDybgOt9KHnVqk79XtQXstIHIRV+ErTkTga3t7k08fJrH+XCli4UxwP A==;
X-CSE-ConnectionGUID: Z3eTyH0vRQCm4ZyLP4jidA==
X-CSE-MsgGUID: dx9I4L5qRKuWX63G1T1vsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75373158"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="75373158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 10:00:24 -0800
X-CSE-ConnectionGUID: 8FS7OQ8AQ1iyfSEnwv4M8Q==
X-CSE-MsgGUID: M5fkjqONRPesjBUueaP9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="214777784"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 10:00:22 -0800
Message-ID: <b94e5ede-cbb8-441d-bc1f-8a6deb47505f@linux.intel.com>
Date: Thu, 5 Feb 2026 19:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-emulation: Remove empty placeholders
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20260205141142.412048-1-tzimmermann@suse.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260205141142.412048-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:javierm@redhat.com,m:jfalempe@redhat.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,redhat.com,kernel.org,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F2F06F6450
X-Rspamd-Action: no action

Hey,

Den 2026-02-05 kl. 15:10, skrev Thomas Zimmermann:
> Only DRM clients for fbdev emulation invoke fbdev helpers. Hence remove
> the empty placeholders for non-fbdev builds, as they are unused.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  include/drm/drm_fb_helper.h | 105 ------------------------------------
>  1 file changed, 105 deletions(-)
> 
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 05cca77b7249..15274b8a1d97 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -271,111 +271,6 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>  
>  int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
>  int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
> -#else
> -static inline void drm_fb_helper_prepare(struct drm_device *dev,
> -					 struct drm_fb_helper *helper,
> -					 unsigned int preferred_bpp,
> -					 const struct drm_fb_helper_funcs *funcs)
> -{
> -}
> -
> -static inline void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
> -{
> -}
> -
> -static inline int drm_fb_helper_init(struct drm_device *dev,
> -		       struct drm_fb_helper *helper)
> -{
> -	/* So drivers can use it to free the struct */
> -	helper->dev = dev;
> -	dev->fb_helper = helper;
> -
> -	return 0;
> -}
> -
> -static inline void drm_fb_helper_fini(struct drm_fb_helper *helper)
> -{
> -	if (helper && helper->dev)
> -		helper->dev->fb_helper = NULL;
> -}
> -
> -static inline int drm_fb_helper_blank(int blank, struct fb_info *info)
> -{
> -	return 0;
> -}
> -
> -static inline int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
> -					    struct fb_info *info)
> -{
> -	return 0;
> -}
> -
> -static inline int drm_fb_helper_set_par(struct fb_info *info)
> -{
> -	return 0;
> -}
> -
> -static inline int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> -					  struct fb_info *info)
> -{
> -	return 0;
> -}
> -
> -static inline int
> -drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
> -{
> -	return 0;
> -}
> -
> -static inline void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
> -{
> -}
> -
> -static inline void
> -drm_fb_helper_fill_info(struct fb_info *info,
> -			struct drm_fb_helper *fb_helper,
> -			struct drm_fb_helper_surface_size *sizes)
> -{
> -}
> -
> -static inline int drm_fb_helper_setcmap(struct fb_cmap *cmap,
> -					struct fb_info *info)
> -{
> -	return 0;
> -}
> -
> -static inline int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
> -				      unsigned long arg)
> -{
> -	return 0;
> -}
> -
> -#ifdef CONFIG_FB_DEFERRED_IO
> -static inline void drm_fb_helper_deferred_io(struct fb_info *info,
> -					     struct list_head *pagelist)
> -{
> -}
> -#endif
> -
> -static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
> -					     bool suspend)
> -{
> -}
> -
> -static inline void
> -drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper, bool suspend)
> -{
> -}
> -
> -static inline int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
> -{
> -	return 0;
> -}
> -
> -static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper)
> -{
> -	return 0;
> -}
>  #endif
>  
>  #endif

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

