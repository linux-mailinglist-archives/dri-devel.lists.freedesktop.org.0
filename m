Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PiEOugve2n2CAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:01:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A80AE510
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2BF10E312;
	Thu, 29 Jan 2026 10:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyLDpiFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6845810E127
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769680868; x=1801216868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SqH9AdxR/lHB8viiJnIr2poCQMky6Igt6nCYuv99EBc=;
 b=nyLDpiFTL25OvFoNSpgwaualxiJG8yXw3Z7Vapz03MaSiC+iBDZRjJ/9
 I8AlW2eg3CY5uX6F8WRq9BJMYrZerlXlMTjmoz7seY0Ggq4ZHpFSJ47ex
 wD+ozHhu5yOvxdUlIAQKiOw6tirQxYGVOM6Zvf1IvjiGpOd1FyiIuSC3c
 M13qshi+rOILnbz9HRW6APLNXG4CsXHkdEcwcA3ATLiuvVs8ZwnCIiUfr
 5vXJ8EzHdfXOhUiZMUhdLxznf4y7Zdz9+ox5jn7l07i3xAlCFe9VzwBMU
 WZGKIi7gXhaso9a+ZeFuu4/ATAGBRByCS0g7lAH8GajY6ww/Vw3DTyyab A==;
X-CSE-ConnectionGUID: mdnrH2ZESfCMpG48//fNkQ==
X-CSE-MsgGUID: XP3Lej45TbeW7dBXj3k7EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70630034"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70630034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:01:07 -0800
X-CSE-ConnectionGUID: q96kEhegQ5GodER4IxHUhQ==
X-CSE-MsgGUID: n0Y7OLBCQQaoEMLmTpwHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213400871"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:01:01 -0800
Date: Thu, 29 Jan 2026 12:00:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH v6 2/4] drm: Add CRTC background color property
Message-ID: <aXsv200DLo6ssao2@smile.fi.intel.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
 <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
 <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:jani.nikula@linux.intel.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:matthew.d.roper@intel.com,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,intel.com,cknow-tech.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 47A80AE510
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 11:37:33AM +0200, Andy Shevchenko wrote:
> On Thu, Jan 29, 2026 at 02:58:52AM +0200, Cristian Ciocaltea wrote:

...

> > +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)({				\
> > +	__u16 mask = __GENMASK((bpc) - 1, 0);				\
> > +	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
> > +						__GENMASK(15, 0), mask);\
> 
> The whole point of the first patch is to use it in the divisions by 2^n - 1.
> Can we transform this to make it "divisions" by power-of-two?
> 
>      ...: def dbm2(c, bpc):
>      ...:     m = (1 << bpc) - 1
>      ...:     c1 = m & c
>      ...:     r = c1 << (16 - bpc)
>      ...:     for i in range(1, 16 // bpc):
>      ...:         r = r + (c1 << (16 - (i + 1) * bpc))
>      ...:     return r

I noticed that on some inputs it gives off-by-small-number error.
But you got the idea.

Taking this into account, perhaps we can share __KERNEL_DIV_ROUND_CLOSEST()
anyway and leave it there and improve the situation later on. Up to DRM
maintainers.

> The above is a Python version of PoC of this approximation. Basically
> we transform the fraction X / (2^n - 1) to a chained version of
> X / 2^n + X / 2^2n + ... X / 2^kn as derived from recurrent formula
> of i+1:th iteration as Xi+1 = Xi / 2^n + Xi / (2^n * (2^n - 1)).
> 
> So, maybe that one should be used instead? (It may be thought through
> on how to collapse the for-loop to maybe some bitops, but even with
> a for-loop it might be faster than real division.)
> 
> Note, we have some (for sure more than one, I remember the same Q appeared to
> me a few years ago) of the examples which may avoid division at all. I would
> like to have this macro to be kernel wide (and UAPI seems also okay).

> > +	__DRM_ARGB64_PREP(conv, shift);					\
> > +})

-- 
With Best Regards,
Andy Shevchenko


