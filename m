Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOgCFb21g2nItAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:10:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB00CECAAC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE24210E77B;
	Wed,  4 Feb 2026 21:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByZyaTLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CBB10E779
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770239417; x=1801775417;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8BGUP+Fh8sJoIk+wDhGM6z4Q5hkH9tUOVqzPdwjSySk=;
 b=ByZyaTLGeLve+sVkxvNfGvuSBRx4NhWLSHuXdoznVcAvRrB7M0hbIWM+
 yMq+bB+y5gt8GaYcCzHRtapEhWY+PbaSB9CFcDCyFjKqbMvcYiQi7+aUA
 8+/wBRTLwUh9eIAs4zEaSJO7+buK0sBCpjWOoYA5Ylzi8b7KXMugGIId6
 Q6bnto97FeuNsXqJ0iK0TA0gfGppqQbss5vXgTKYrBwxQvyqk83hphjhl
 po5oQRzcnkz0c8bgG9Bg+ghmlNjvL5JzwUWtXb8Fxi8MZf11Rk0WZYYvY
 0IJH2LHcQVGF9rDmbRw1M7G2NvHDJPEKWAVzH53vzePxYKa1vpvIWFfyP g==;
X-CSE-ConnectionGUID: kgGw5zg7QCCDlm5zSKKSvQ==
X-CSE-MsgGUID: 2UjFS288SuCR/euiVQ2xCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81748675"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="81748675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 13:10:17 -0800
X-CSE-ConnectionGUID: 7aeGqPOERc25kyYZt88EPg==
X-CSE-MsgGUID: iAE4JCIoS9+oWNVbTP0NyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214806959"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.188])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 13:10:12 -0800
Date: Wed, 4 Feb 2026 23:10:09 +0200
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
Message-ID: <aYO1sY0DAkI00uDx@smile.fi.intel.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
 <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
 <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
 <97a4fd2d-62e2-41ad-8ee9-d2551c3ab312@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97a4fd2d-62e2-41ad-8ee9-d2551c3ab312@collabora.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AB00CECAAC
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 10:32:23PM +0200, Cristian Ciocaltea wrote:
> On 1/29/26 11:37 AM, Andy Shevchenko wrote:
> > On Thu, Jan 29, 2026 at 02:58:52AM +0200, Cristian Ciocaltea wrote:

...

> >> +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)({				\
> > 
> > Not sure if this is an accepted style in DRM, by I find it difficult
> > to follow. I would expect the "({" be on a separate line.
> 
> I initially got confused by the plethora of different styles, e.g. in
> "include/linux/math.h" we can find:
> 
>   #define rounddown(x, y) (				\
>   [...]
> 
>   #define DIV_ROUND_CLOSEST_ULL(x, divisor)(		\
>   [...]
> 
>   #define mult_frac(x, n, d)	\
>   ({				\
>   [...]
> 
>   #define abs_diff(a, b) ({			\
>   [...]


math.h is a collection of APIs from the past from different years and code,
that's why the style is inconsistent (a lot!). So better not to take that
as an example.

> I agree your option is the most readable one, hence I used it consistently in
> v7.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


