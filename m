Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BNwNzC8lmntlAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:30:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE715CAAD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D394410E246;
	Thu, 19 Feb 2026 07:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFlrS2nH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9306910E246
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771486253; x=1803022253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6B+i4AmAQ6LDr8MyhM67PG9FcoE1UJyBcPeHZZ0PNUQ=;
 b=ZFlrS2nHpC6HA1B4Ce/aJTD0flo5MC/k+ur5gmrBpAObvjiAkwWkRHhA
 TuePZc6cy3VSqIiFerUC+iAX1Zyyclq+bhB7NwfurTUiw4dcrjmsojebV
 +Uc9NGDu3zSfOjJ3kCYNaleZe0Ha8tvLj41chhmGkgATPE1x3+W94p2sa
 HXg47sN7kS3gogZyObY0LKdKhYw2+5aqn3cYdThbYSL12lAoaTHuAjehe
 NvspHde0DN0bo1Ht1lwMnRRJdgVYGc52c3iVQ8+3ox4GNsySe62mlwM2d
 EWnnGe3EBFLfKG+cZLGqz8GrAKCgOYsflY0i3xiaizYkUwO7D9z81Rr6p g==;
X-CSE-ConnectionGUID: Ckh6l3TgSUigKgrEZjK93A==
X-CSE-MsgGUID: kL4v/4HMSkuTgta0chDBMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72468894"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72468894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 23:30:53 -0800
X-CSE-ConnectionGUID: //TMpRJLQIWfCnzBl/ZAYg==
X-CSE-MsgGUID: vlsbxh1/Q6G7USl6VzfM4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214298280"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.114])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 23:30:51 -0800
Date: Thu, 19 Feb 2026 09:30:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: tomasz.unger@yahoo.pl
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with
 usleep_range
Message-ID: <aZa8KW-VHDTT4LQA@smile.fi.intel.com>
References: <20260218180347.88034-1-tomasz.unger.ref@yahoo.pl>
 <20260218180347.88034-1-tomasz.unger@yahoo.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218180347.88034-1-tomasz.unger@yahoo.pl>
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
	FORGED_RECIPIENTS(0.00)[m:tomasz.unger@yahoo.pl,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,yahoo.pl:email,intel.com:dkim]
X-Rspamd-Queue-Id: 79FE715CAAD
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 07:03:47PM +0100, tomasz.unger@yahoo.pl wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>

NAK.

-- 
With Best Regards,
Andy Shevchenko


