Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEY+Dc/qkmlSzwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:00:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB741422CB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C5D10E1FF;
	Mon, 16 Feb 2026 10:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQ6L/DAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C8C10E1FF;
 Mon, 16 Feb 2026 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771236043; x=1802772043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NBm5R9mJTin6OJaxYoVukxGq5JyO24G2ek1h1XtyCP4=;
 b=dQ6L/DAHr/IL6s2ekI+NJFcwzNLwgFkaZK0ic6I6wp15iPYCtMAWpa9Q
 Hh9ioGVKpkqKRyk1hYuGKo8IoZzL5KT4w+y2PAHoliwD1BinFLqBdvnre
 Mkat86CyJRFvjeynab9G6gavTZRg+DfhNKPZnV3BOCA4HEBHPALpiwS5s
 BMjDGOgz/f4CdveK3+yMJwjYf5z5H8WZXZO+Xca6lGHFYrWvyKTO2HVVi
 dSaHE7o7eziohvJsdsm4NgomBaLIJajqHRkgZ+OZ72ylociUpiuWHYL2z
 T1mDUKhYjP3qM/SI6Gct+DUTAnyKcVexA1Ybp1T37xCNH2eMFrrfNUbwA A==;
X-CSE-ConnectionGUID: 6z4mZ7XoTG+GO9dhp8CskQ==
X-CSE-MsgGUID: 9pH4YskNQNO6rJxeajaj/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83676443"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83676443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:00:42 -0800
X-CSE-ConnectionGUID: h+SZYqccQVKMcdeeNn2Wrg==
X-CSE-MsgGUID: VOF0UHwqTC+kZO17m5jZag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="236573462"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:00:39 -0800
Date: Mon, 16 Feb 2026 11:00:36 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v6 3/5] drm/xe/xe_hw_error: Integrate DRM RAS with
 hardware error handling
Message-ID: <aZLqxBlCrqiE4zML@black.igk.intel.com>
References: <20260216064726.2542819-7-riana.tauro@intel.com>
 <20260216064726.2542819-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216064726.2542819-10-riana.tauro@intel.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BCB741422CB
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:17:29PM +0530, Riana Tauro wrote:
> Initialize DRM RAS in hw error init. Map the UAPI error severities
> with the hardware error severities and refactor file.

...

>  void xe_hw_error_init(struct xe_device *xe)
>  {
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	int ret;
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
>  
>  	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>  
> +	ret = hw_error_info_init(xe);
> +	if (ret)
> +		drm_err(&xe->drm, "Failed to initialize XE DRM RAS\n");

Nit: Printing ret would be useful for debugging.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

>  	process_hw_errors(xe);
>  }
