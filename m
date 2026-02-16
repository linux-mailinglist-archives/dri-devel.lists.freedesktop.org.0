Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH57NmLqkmlSzwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:58:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE314229B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DB310E232;
	Mon, 16 Feb 2026 09:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HM/R20Us";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA3A10E294;
 Mon, 16 Feb 2026 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771235935; x=1802771935;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HUt4rqZ2fje0URexSeQQX/obsRdC0qT49DnUVeI8mdA=;
 b=HM/R20UsSmwpCCFGoWq4TA8ovc0qLBfmBzxy152RbNYqCavbsNwL7ZS2
 LmpNi/ghTo7OJuoKLLe5txwqjqVEgDwfUt/Vfs+SHuMhFK0sG6T5JJwrH
 leJp3zQ5VEykdL1i7L5FwOxNVixAk5VRjYtg3UzjRBcoa4G4eYy4A7SGb
 MM8XRRuQeYWMnJ6zy/Jo2ji07zFduPJop6DYlSIJJDqaUM+71d5DXT5QQ
 RJMIQpwgRGK5mHi9Oy9VP5LKTmPc7lCBl28/w1hKzqP/e98FaKxU1CONo
 W8UxKIMZqE3V238a0/ExB2ulfCZYwQCIxD5qw8/niyhvTLsRRl0K6pCfi Q==;
X-CSE-ConnectionGUID: sdO00HAJRdaozsYGsVy/xQ==
X-CSE-MsgGUID: JwtIdciJSOOYRXxwQdK7tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72357151"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72357151"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 01:58:55 -0800
X-CSE-ConnectionGUID: fpmz0ppiTE2DH7oYriXNfw==
X-CSE-MsgGUID: eOehBjC2SYCzbuZe4BlF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="242697891"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 01:58:51 -0800
Date: Mon, 16 Feb 2026 10:58:48 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v6 2/5] drm/xe/xe_drm_ras: Add support for XE DRM RAS
Message-ID: <aZLqWI9cOdBXNxeB@black.igk.intel.com>
References: <20260216064726.2542819-7-riana.tauro@intel.com>
 <20260216064726.2542819-9-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216064726.2542819-9-riana.tauro@intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 6DCE314229B
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:17:28PM +0530, Riana Tauro wrote:
> Allocate correctable, uncorrectable nodes for every xe device. Each node
> contains error component, counters and respective query counter functions.
> 
> Add basic functionality to create and register drm nodes.

...

> +static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)
> +{
> +	struct drm_ras_node *node = &ras->node[severity];
> +
> +	kfree(node->device_name);
> +	kfree(ras->info[severity]);
> +
> +	node->device_name = NULL;
> +	ras->info[severity] = NULL;
> +}

Nit: Unwind is usually in LIFO order, but this doesn't particularly look
harmful either. So upto you.

Raag
