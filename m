Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJY6GSn3jmnbGAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 11:04:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8741134D6A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 11:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F9D10E7AD;
	Fri, 13 Feb 2026 10:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLVRRFNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50A910E7AD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770977061; x=1802513061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2YGib/pI9hafSc7CEu3zaO20oOQvYB0eNiC4EWgrIAo=;
 b=jLVRRFNwh5UEoo9XSqXzNTrvDudeB1E616aNrE7ET4Atjw9i0wW16sWV
 Ivxvsv9KdqcZAOwatcgofd16lXN/NF2RaEh5AZ0Hjpg27YLGLD8oxn0B9
 bGA8ReAqpjL662MD9WAsREBj7xfG6dfTIc5rgD76gu8MKnFIDsViND7Ho
 SUTEy873wafJaBnFiLkCjz6Mhka2uCfU8aGDBt35Dm8ifW2A+oGCsUda6
 O3DMkbe27vkSL+bEpL1VwgvZGHFFnNvvvfK/KLrt9AYNveO7ah6wT/g3l
 JzzMNOjqU7lrjl8nnOIgzri+qRje9GJ9HCj6cNYNJtpLFE1Ce+p4TgRRu g==;
X-CSE-ConnectionGUID: fkJLc8ytTC6Zq2f0z9kJuQ==
X-CSE-MsgGUID: eX4rXSw7SbO8FzI8tDI/Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75783222"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="75783222"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:04:20 -0800
X-CSE-ConnectionGUID: XWv9UOoASkCNjCFmsJITMQ==
X-CSE-MsgGUID: nFUH1aslQC6GiB+7KMGRtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211600408"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.242])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:04:18 -0800
Date: Fri, 13 Feb 2026 12:04:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Remove duplications of
 fbtft_set_addr_win()
Message-ID: <aY73IMz_2iydUs7M@smile.fi.intel.com>
References: <20260213085927.3673653-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213085927.3673653-1-namcao@linutronix.de>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:namcao@linutronix.de,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org]
X-Rspamd-Queue-Id: E8741134D6A
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 09:59:27AM +0100, Nam Cao wrote:
> Lots of drivers duplicate the default fbtft_set_addr_win(). Just use the
> default instead.

Very good catch, indeed you are right and we can simply drop these dups.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


