Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEl5Agy7gGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:56:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779FBCDB47
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8810E4EE;
	Mon,  2 Feb 2026 14:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqwyedSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8362D10E4EE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770044168; x=1801580168;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EeYICoR9zSbm3DUZ1t3WKmo4m9B/zpT4a0U+Wxyi9zQ=;
 b=FqwyedSRhP1Z9BvA7QvlkSyxH/bm58VCiUz2ekkqGavj21gvMN8+lFhM
 FMXOzyYUIm3JmWJZdsn/Y/ikhsAL5y2K+uFmwgoAeIIBiMqtiMeRD9gc2
 Drd2CXClswPLXcPC6KOnwUaeincqk2mGeMp6AmHNaZ6m6pkJbLh9K//9q
 Yw+fM0ztJGTP/f2T8Edz4+ZbxOq9MAsbSlJtnF4FBwQnS+kTPGQxdI6Lc
 xqxnHqWVkxTa060AyDHadjE6b0xE+dxSvmtrwHayTKppXg+AVeu1GH/fy
 Gc4bPpE6HmjG2QB0qwmhFfjQGRpBtQSrOFE5bl/nLKLYMQfKEq/lcHtd1 w==;
X-CSE-ConnectionGUID: BR6rNaBJR3KtMPFRbbTBJQ==
X-CSE-MsgGUID: f8dOwifMQh2eujOCr9UO7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="93853888"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="93853888"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 06:56:08 -0800
X-CSE-ConnectionGUID: pHYGKMumQPK3+cMlqGrdjQ==
X-CSE-MsgGUID: 7ZZqOAGkRhCCFQk2QouPBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="240218597"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.153])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 06:56:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] Revert "drm/gma500: use drm_crtc_vblank_crtc()"
In-Reply-To: <CAMeQTsbi2fbc4jpS69Xve=sGUE=m7SVzAKRDkZr+3oRpjDAaPQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130151319.31264-1-jani.nikula@intel.com>
 <CAMeQTsbi2fbc4jpS69Xve=sGUE=m7SVzAKRDkZr+3oRpjDAaPQ@mail.gmail.com>
Date: Mon, 02 Feb 2026 16:56:03 +0200
Message-ID: <82d5a760469ee45e92bb2463681d071a62916ec2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:patrik.r.jakobsson@gmail.com,m:tzimmermann@suse.de,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 779FBCDB47
X-Rspamd-Action: no action

On Mon, 02 Feb 2026, Patrik Jakobsson <patrik.r.jakobsson@gmail.com> wrote:
> Fix applied to drm-misc-fixes

Thanks!

> I should probably put a gma500 machine back into my nightly test runs.
> It would have caught this much earlier.

Sorry for the trouble. :(

BR,
Jani.


-- 
Jani Nikula, Intel
