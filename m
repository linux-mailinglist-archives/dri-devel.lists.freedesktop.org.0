Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNNDJUn6n2n3fAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 08:46:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB21A2027
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 08:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CB010E142;
	Thu, 26 Feb 2026 07:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0PAUn48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9BB10E142
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772091975; x=1803627975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZpwIQUPmBHkMKxQ8tlC0wxQSF+8zr4oViEcqWJbz5RU=;
 b=D0PAUn48YejDKdfiHgyoZfPT7m0ZPNgbPe6PYZ5aL3/sEw4NN5Bc1HvI
 k/BabwW4BB0N4Hn4TbDM0wXQqQ9MbKQ505kng6StaZGnST/ZZt/8FkjgY
 rqTpQrbmrso65zTRvevjpGSP9ROAbgAiJ0oRsQnYnWcaWgwHDX+I9Rmqf
 GIyKvC4TwxV9N1Qw/A3j02ULXuN+ergTHzYMHbhyNRXK/O6Z6ty9fCL5h
 ERBsk8phyG/s2hwaY3e0WT5o/+ac6Z9gBuw+N2JW48AJTotPrPbsBx1lE
 dsByYZpj7uRfitlWhb3eHKKBvIsYJElFYuj5oUzKuFYxJ3awPW6vNgb1/ Q==;
X-CSE-ConnectionGUID: +7KLlkyPQ5eyy/x5I89/FQ==
X-CSE-MsgGUID: Zxl5YVHoSKOd6LiDR/kWnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="77015020"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="77015020"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 23:46:14 -0800
X-CSE-ConnectionGUID: OZ1hXrjWRe6NQmpJPqFvmg==
X-CSE-MsgGUID: TuyKCFxtRSePaDSd9efJKg==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 23:46:12 -0800
Date: Thu, 26 Feb 2026 09:46:10 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: fbtft: fb_ra8875: replace udelays with fsleep
Message-ID: <aZ_6QvJPZplh6xtd@smile.fi.intel.com>
References: <20260225204602.134218-1-azpijr@gmail.com>
 <20260225234100.152320-1-azpijr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225234100.152320-1-azpijr@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:azpijr@gmail.com,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 26AB21A2027
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:40:36AM +0100, Jose A. Perez de Azpillaga wrote:
> The write_reg8_bus8 function uses udelay(100) twice to wait for the

write_reg8_bus8()

> display controller. In non-atomic contexts, fsleep() is the preferred
> API as it automatically selects the most efficient sleeping mechanism
> and avoids busy-waiting.

But how do you know this is the non-atomic context?

> Update both instances to use fsleep(100).

-- 
With Best Regards,
Andy Shevchenko


