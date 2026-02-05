Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB8BHvDahGna5wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:01:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67C7F6468
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A132C10E399;
	Thu,  5 Feb 2026 18:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxlzCc08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1210710E399
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770314476; x=1801850476;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PHtO3ZSairoBcBu4tykVyhuzQWn9+MunY+WoeTHcOhc=;
 b=fxlzCc08ro63y2KmW+IR6jA0kbg3AN04NCEMThSwpbpVRWIYXaW5cShY
 rP7FjUXQ2M+1IWTNA9xtskAnUD7i6HJd8F/ivpTReh7RDuCcxSPwVO0nq
 YoXF6eelKs3VOZ7hBZgBGO6hLVDwj3UxCZoW1FSoo9kfO+k4d8/Tv63I2
 Are3ekH2mLcT0v8LpJ+ZvCW/3nGmiLOahUFp25iTnaOWPGe8qFFohT1lp
 A+vwkPpbJ+Y3q5R77q5PevqFBs0RrZS+N01HdZqiFrcwbLPGy/9BnEAJW
 PO05iq93igWCsy8TjiA+X6w1FanYFNwnsyZEh40SpLk+KZtAkp1tIh6PH w==;
X-CSE-ConnectionGUID: PJHta6X+TWu8ZrdIbrvmkw==
X-CSE-MsgGUID: GtgR4rEYS2q0mY4I8Z532A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75373312"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="75373312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 10:01:13 -0800
X-CSE-ConnectionGUID: 7DnMXsoNSHG3Zz9+QBVnEQ==
X-CSE-MsgGUID: iXc9xCcIRjClHOCf4iBKLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="214778472"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 10:01:12 -0800
Message-ID: <3e46eb16-82e4-4d45-b67c-41a386eb1eaa@linux.intel.com>
Date: Thu, 5 Feb 2026 19:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-emulation: Remove support for legacy emulation
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20260205144056.416759-1-tzimmermann@suse.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260205144056.416759-1-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: E67C7F6468
X-Rspamd-Action: no action



Den 2026-02-05 kl. 15:40, skrev Thomas Zimmermann:
> Remove the internal DRM client from fbdev emulation. This has been
> required when some DRM drivers provided their own fbdev emulation.
> 
> This is no longer the case with commit b55f3bbab891 ("drm/{i915, xe}:
> Implement fbdev emulation as in-kernel client") from 2024. Now there's
> only a single DRM client for fbdev-emulation that fills out the client
> callback functions as required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 05803169bed5..845c63ca15b5 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -343,18 +343,6 @@ EXPORT_SYMBOL(drm_fb_helper_unprepare);
>  int drm_fb_helper_init(struct drm_device *dev,
>  		       struct drm_fb_helper *fb_helper)
>  {
> -	int ret;
> -
> -	/*
> -	 * If this is not the generic fbdev client, initialize a drm_client
> -	 * without callbacks so we can use the modesets.
> -	 */
> -	if (!fb_helper->client.funcs) {
> -		ret = drm_client_init(dev, &fb_helper->client, "drm_fb_helper", NULL);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	dev->fb_helper = fb_helper;
>  
>  	return 0;
> @@ -437,9 +425,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>  	cancel_work_sync(&fb_helper->damage_work);
>  
>  	drm_fb_helper_release_info(fb_helper);
> -
> -	if (!fb_helper->client.funcs)
> -		drm_client_release(&fb_helper->client);
>  }
>  EXPORT_SYMBOL(drm_fb_helper_fini);
>  

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

