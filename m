Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j+ioIXIqe2kyCAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 10:37:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41FAE31A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 10:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807A810E842;
	Thu, 29 Jan 2026 09:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sqr8Gfqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B3210E842
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769679471; x=1801215471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fcH4mUDNyS5wydLrVZXUX/K4ZKaotkjSpo0HtMsk+1o=;
 b=Sqr8GfqdDxpU6PVhdvF2rH3etLLl1MdARKBZ7KjRDykxFBa4hPAgmQFE
 3rawpZCEBwX8tSjvMOnG17PHkXThHcPvcNHKkMbX6jO5mtL+irOnW4WxC
 jrb+yszPT+59gkx+12MrPbY9HpLNt023bGubSLxgLihcsY2+Xvq9pMaUr
 AR7DNg0OaCbH96Hza76IJ2MDp7lMPiF82ptL60Do0Yyhu/N6ZXYUXorl9
 UmP1cU2Hvy8GBBEboGI0aplFupeOW3Ts4KxV3OTFdwPs2JOcQ64B45ckG
 apHvWazmLRvDmelwMm+e6fDxsTyVOANlTvrH6dphwsheen6p0rhIs+C5g A==;
X-CSE-ConnectionGUID: tTnlgpIDQPu2Dbv1fhUmHQ==
X-CSE-MsgGUID: N+bDNrMIRT2BBxQ2HVZ+mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="71074880"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="71074880"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:37:50 -0800
X-CSE-ConnectionGUID: Q6oB1hS4RWCJLoDv2BxPDA==
X-CSE-MsgGUID: vyc3EwQqRieVpm72pc7e7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="246133392"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:37:29 -0800
Date: Thu, 29 Jan 2026 11:37:22 +0200
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
Message-ID: <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
 <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: AE41FAE31A
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:58:52AM +0200, Cristian Ciocaltea wrote:
> Some display controllers can be hardware programmed to show non-black
> colors for pixels that are either not covered by any plane or are
> exposed through transparent regions of higher planes.  This feature can
> help reduce memory bandwidth usage, e.g. in compositors managing a UI
> with a solid background color while using smaller planes to render the
> remaining content.
> 
> To support this capability, introduce the BACKGROUND_COLOR standard DRM
> mode property, which can be attached to a CRTC through the
> drm_crtc_attach_background_color_property() helper function.
> 
> Additionally, define a 64-bit ARGB format value to be built with the
> help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
> color components can be extracted with desired precision using the
> corresponding DRM_ARGB64_GET*() macros.

...

> +/*
> + * Put 16-bit ARGB values into a standard 64-bit representation that can be
> + * used for ioctl parameters, inter-driver communication, etc.
> + *
> + * If the component values being provided contain less than 16 bits of
> + * precision, use a conversion ratio to get a better color approximation.
> + * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
> + * the input and output precision, respectively.

Not sure if you should explicitly mention that "bpc must not be 0"
(it can be derived from the "division by 0" in the given formula,
but still...).

> + */
> +#define __DRM_ARGB64_PREP(c, shift)					\
> +	(((__u64)(c) & __GENMASK(15, 0)) << (shift))
> +
> +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)({				\

Not sure if this is an accepted style in DRM, by I find it difficult
to follow. I would expect the "({" be on a separate line.

> +	__u16 mask = __GENMASK((bpc) - 1, 0);				\
> +	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
> +						__GENMASK(15, 0), mask);\

The whole point of the first patch is to use it in the divisions by 2^n - 1.
Can we transform this to make it "divisions" by power-of-two?

     ...: def dbm2(c, bpc):
     ...:     m = (1 << bpc) - 1
     ...:     c1 = m & c
     ...:     r = c1 << (16 - bpc)
     ...:     for i in range(1, 16 // bpc):
     ...:         r = r + (c1 << (16 - (i + 1) * bpc))
     ...:     return r

The above is a Python version of PoC of this approximation. Basically
we transform the fraction X / (2^n - 1) to a chained version of
X / 2^n + X / 2^2n + ... X / 2^kn as derived from recurrent formula
of i+1:th iteration as Xi+1 = Xi / 2^n + Xi / (2^n * (2^n - 1)).

So, maybe that one should be used instead? (It may be thought through
on how to collapse the for-loop to maybe some bitops, but even with
a for-loop it might be faster than real division.)

Note, we have some (for sure more than one, I remember the same Q appeared to
me a few years ago) of the examples which may avoid division at all. I would
like to have this macro to be kernel wide (and UAPI seems also okay).

> +	__DRM_ARGB64_PREP(conv, shift);					\
> +})

-- 
With Best Regards,
Andy Shevchenko


