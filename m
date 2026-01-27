Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKGaL9PNeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:38:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F0695D4B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59678899B7;
	Tue, 27 Jan 2026 14:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQGEQl2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41140899B7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769524687; x=1801060687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=soGYrhFD8HGAA5+ovmTEgz6N7E7vcHr4DVLewwvW0nc=;
 b=kQGEQl2PbCbjwF+09B4hJD9ZNksZHiS0AP9joko6R+W749xKrnjouLE1
 F+Q9o3p+IJQqQMAm+Zu/Aw+8FjbXYgJ+HJcGgiR3kO/MfBMCCBiKtXP/e
 uXfs/ytcABDU/oy5+NZZJfY4tHGDGN8kMbPnRSkEApyHz3MDlCU4gfQYM
 sSI1Jx2m4ptFcyl3h2zBCQQ7s9JxlSZQetMeDoKTh236ocjEXHHOYhwrd
 E0rZiLCPP7RGDzW8gk7o+l9prb/kSh9ZrYvlFuLq3kyDQfb21ZhJ/CTMT
 gKv/aOtmft80JffQoVHX+IJ8dpBnoByMzoHUzdaAC9BOW5rA3Mmuwn6hf Q==;
X-CSE-ConnectionGUID: PHbBcpcTQseL8vW2c3c85g==
X-CSE-MsgGUID: 3AOhf09hQVyHRL9/POuU6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="58292630"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="58292630"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:38:06 -0800
X-CSE-ConnectionGUID: 6BEQmkULSjeFSgAkWi9eMw==
X-CSE-MsgGUID: teVvWAdzRa+SiD5ECSvqPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207888513"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.248])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:38:02 -0800
Date: Tue, 27 Jan 2026 16:38:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH v5 1/4] uapi: Provide DIV_ROUND_CLOSEST()
Message-ID: <aXjNyHaJDHoCPRJO@smile.fi.intel.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
 <baf075b2370a13cddd597a3d421b5f39290d87a4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baf075b2370a13cddd597a3d421b5f39290d87a4@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,cknow-tech.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: C4F0695D4B
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 03:58:13PM +0200, Jani Nikula wrote:
> On Tue, 27 Jan 2026, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
> > Currently DIV_ROUND_CLOSEST() is only available for the kernel via
> > include/linux/math.h.
> >
> > Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
> > a common definition in uapi.
> >
> > Additionally, ensure it allows building ISO C applications by switching
> > from the 'typeof' GNU extension to the ISO-friendly __typeof__.
> 
> I am not convinced that it's a good idea to make the implementation of
> kernel DIV_ROUND_CLOSEST() part of the kernel UAPI, which is what this
> change effectively does.
> 
> I'd at least like to get an ack from Andy Shevchenko first (Cc'd).

Thanks for Cc'ing me!

So, the history of the DIV_ROUND_UP() to appear in UAPI is a response to
the ethtool change that missed the fact that this was a kernel internal macro.
Giving a precedent there is no technical issues to add DIV_ROUND_CLOSEST()
to UAPI as proposed. Main question here is: Does DRM headers in question
(that are going to use it) really need this?

Interestingly that DRM also started using __KERNEL_DIV_ROUND_UP() in UAPI
at some point, which kinda makes an argument for allowing the other one.

Also fun fact: this series plead for a new macro for division while ignoring
existing (UAPI) macros for masks and bits.

0xffffU is effectively __GENMASK(15, 0). (And if you change the code, avoid
using variables inside GENMASK() macros, it may generate an awful code, the
GENMASK($HI, $LO) << foo is preferred over GENMASK(foo + $DELTA, foo) case.
GENMASK(foo - 1, 0) OTOH is fine, however be always careful against overflows
with left shifts, as BIT(foo) - 1 may not work for foo == 32, while GENMASK()
may not work for foo == 0).

So, I have no objections for either choice
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

But if you go that direction, please, fix up the style.

> > +/*
> > + * Divide positive or negative dividend by positive or negative divisor
> > + * and round to closest integer. Result is undefined for negative
> > + * divisors if the dividend variable type is unsigned and for negative
> > + * dividends if the divisor variable type is unsigned.
> > + */
> > +#define __KERNEL_DIV_ROUND_CLOSEST(x, divisor)(		\
> > +{							\

Use ({ on this line together...

> > +	__typeof__(x) __x = x;				\
> > +	__typeof__(divisor) __d = divisor;		\

+ blank line here.

> > +	(((__typeof__(x))-1) > 0 ||			\
> > +	 ((__typeof__(divisor))-1) > 0 ||		\
> > +	 (((__x) > 0) == ((__d) > 0))) ?		\
> > +		(((__x) + ((__d) / 2)) / (__d)) :	\
> > +		(((__x) - ((__d) / 2)) / (__d));	\
> > +}							\
> > +)

...as here join }) to be a single line.

+ blank line.

> >  #endif /* _UAPI_LINUX_CONST_H */

-- 
With Best Regards,
Andy Shevchenko


