Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHNzKbOIoGlvkgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 18:53:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA41ACF92
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 18:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D88710E9F1;
	Thu, 26 Feb 2026 17:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+EY9V2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A1010E9E7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772128431; x=1803664431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c4SC6HnKEEEgFEkog4c01jDAAwa4s1azeinGA5mlb7M=;
 b=H+EY9V2K/ciEGLbWcEurWpcsLpPy8u0mqrLnALNA8ar1qpnGO5xEdJjJ
 CHFA0HhFflHfLmrbpP71wvfmgkkuUi7j7jM9g/oMG3wwDzPohtmFxSxSf
 UcBHwfHsfrD/bQSNRcKuQ+yAgjYnDhW3wEfNhvf3zuyu/6UpmSnZ/f+N7
 ZmHmaD34eINmPJa2XMDCc8ZQMevraPI9m/fRZav+gzwMWAXS4ZR4wGkMA
 uI9rTjGd8/d0gVx42jVBYlTMFWiP9u5G4e4diStfHm7nmA5x5I5GVIKEg
 u9eukBDbYl73xvMQQbVGImDrdMOZSn1ymotxLG740L0AcMy/S/CZJA6t4 w==;
X-CSE-ConnectionGUID: 7yM6fZYOQ6KSmAIaLBjgOw==
X-CSE-MsgGUID: rHIayiiyRWGXNWTrVJ5a4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="60774195"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="60774195"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:53:50 -0800
X-CSE-ConnectionGUID: 9GRmV44XRB2nuVqxst7fMQ==
X-CSE-MsgGUID: QI8NyXopRkiabBVTo5zrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="247160573"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:53:48 -0800
Date: Thu, 26 Feb 2026 19:53:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: dhyan19022009@gmail.com
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Donenfeld <Jason@zx2c4.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix macro whitespace errors
Message-ID: <aaCIqUXPB75vR6rK@smile.fi.intel.com>
References: <20260226172531.13714-1-dhyan19022009@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226172531.13714-1-dhyan19022009@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dhyan19022009@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:Jason@zx2c4.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,checkpatch.pl:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 10EA41ACF92
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:55:31PM +0530, dhyan19022009@gmail.com wrote:
> 
> Remove prohibited spaces before closing parentheses in macro calls in
> fbtft-bus.c, reported by checkpatch.pl

You haven't compiled this, have you?


-- 
With Best Regards,
Andy Shevchenko


