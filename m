Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C68289FB72
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 17:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8B10ECF7;
	Wed, 10 Apr 2024 15:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAeWeTYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4C11133E9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712762721; x=1744298721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=38KHJ1AxDv/hBddUUD94nB5vN1XfdrPj7b4E71tlpKs=;
 b=VAeWeTYU4N9x+GP+6ruzrdsEyTLNOCTV++NpU2dYWARX3B3A4zDmCSAa
 81ndnigFxvWFY88JKX/vOuurki9aEPEztXh5fw6mEcpbMGCGFXh8GqYwz
 VOY9EbPuC96TzhBTaHo1wSpKRg4MoDUEp3L2/GWKhxSxTjzfmwELHp9Ag
 lo4PeRrQl4wZFGDpv3sAFpL4gPfschTfo8KLWwLSHg5j8TYOC3n7aD3jg
 3j9zbR2kzIy+TZQpiul3mrwSgCeiQhMxgJD5L21jPT2dYXe295mXksab6
 V1cwGU3dGhm7e7vIXXTIkEYE74xh7ZKoJhFUVOgdLA/kmbrA1YR8rvfLc w==;
X-CSE-ConnectionGUID: ftDu4h1hT8utsd07tVtpJg==
X-CSE-MsgGUID: j7gSpRCYT4u9mwC7Pet1dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33536130"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="33536130"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="827793168"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="827793168"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 10 Apr 2024 08:25:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Apr 2024 18:25:17 +0300
Date: Wed, 10 Apr 2024 18:25:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH 12/21] drm/tilcdc: Allow build without __iowmb()
Message-ID: <ZhavXcFrgzw5UApH@intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-13-ville.syrjala@linux.intel.com>
 <b944eacf-e284-42ad-aeb6-e7aeb1aa01c1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b944eacf-e284-42ad-aeb6-e7aeb1aa01c1@ideasonboard.com>
X-Patchwork-Hint: comment
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

On Wed, Apr 10, 2024 at 12:06:29PM +0300, Tomi Valkeinen wrote:
> On 08/04/2024 20:04, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > __iowmb() isn't available on most architectures. Make
> > its use optional so that the driver can be built on
> > other architectures with COMPILE_TEST=y.
> > 
> > Cc: Jyri Sarha <jyri.sarha@iki.fi>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/gpu/drm/tilcdc/tilcdc_regs.h | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_regs.h b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
> > index f90e2dc3457c..44e4ada30fba 100644
> > --- a/drivers/gpu/drm/tilcdc/tilcdc_regs.h
> > +++ b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
> > @@ -125,7 +125,9 @@ static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
> >   #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
> >   	iowrite64(data, addr);
> >   #else
> > +#ifdef __iowmb
> >   	__iowmb();
> > +#endif
> >   	/* This compiles to strd (=64-bit write) on ARM7 */
> >   	*(volatile u64 __force *)addr = __cpu_to_le64(data);
> >   #endif
> 
> As the memory barrier is an important part there, would it be better to 
> ifdef based on COMPILE_TEST, to make it clear why it's being done?

I can do that if you prefer.

I suppose the real question is why iowrite64() doesn't work
if a hand rolled version does work?

-- 
Ville Syrjälä
Intel
