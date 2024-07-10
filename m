Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F9592D15A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C96710E775;
	Wed, 10 Jul 2024 12:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h36zUb7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E13C10E774;
 Wed, 10 Jul 2024 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720613781; x=1752149781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y0qjDnLJyo/X2DNmXM+T7MdDK6BJMvAV3BAux5grKmA=;
 b=h36zUb7vuJ5mfaPjlA3zpB/HAZTzTHeO/cQT/GRLwU6YZVl0KNIJ9UWV
 Gxm3O2mcwXBi7tKPG9b7vw9Rmtiru55cP6SKfNaXeOsMWejVmBPRnelH1
 voMXuY9qIvGWpyVzNTWRnkH4yoKxmJ2nTzbMD9xDxERixf+WhL4KWiC6U
 rpIc8r8b3gxzKUcPEbzm+fsTOe12vVaPKGCTGeihOqjXWNwMFJ1ZWMrYK
 +Uai7tk4szWiyHnBcrfqJBvR8I8ACm04MDA5HeOMTz1b/tjLeJ5agXeO/
 9I4AZFPxM87xYzHW7S7w8y5r8KBh93MVj7dbo+XIcL5VC1kbbe/RT7Ofr g==;
X-CSE-ConnectionGUID: 2ShKrn/DQvOu/CcyolgIcw==
X-CSE-MsgGUID: GmVyEwwISZO3nyPMkO2pLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17627654"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="17627654"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 05:16:20 -0700
X-CSE-ConnectionGUID: j0qe4MdASMWZ4BjJSkehMg==
X-CSE-MsgGUID: hKD5bWzhTgqbJxpf2THtuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48177915"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 Jul 2024 05:16:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2024 15:16:15 +0300
Date: Wed, 10 Jul 2024 15:16:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Explicitly cast divisor to fix Coccinelle
 warning
Message-ID: <Zo57j8G2AQbhpORB@intel.com>
References: <20240710074650.419902-2-thorsten.blum@toblux.com>
 <Zo5yvk69FB-jEgd8@intel.com>
 <77194DC0-AA53-4CF9-8BDB-93E212B9FA72@toblux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77194DC0-AA53-4CF9-8BDB-93E212B9FA72@toblux.com>
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

On Wed, Jul 10, 2024 at 01:55:32PM +0200, Thorsten Blum wrote:
> On 10. Jul 2024, at 13:38, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Wed, Jul 10, 2024 at 09:46:51AM +0200, Thorsten Blum wrote:
> >> As the comment explains, the if check ensures that the divisor oa_period
> >> is a u32. Explicitly cast oa_period to u32 to remove the following
> >> Coccinelle/coccicheck warning reported by do_div.cocci:
> >> 
> >>  WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> >> 
> >> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> >> ---
> >> drivers/gpu/drm/i915/i915_perf.c | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> >> index 0b1cd4c7a525..24722e758aaf 100644
> >> --- a/drivers/gpu/drm/i915/i915_perf.c
> >> +++ b/drivers/gpu/drm/i915/i915_perf.c
> >> @@ -4103,7 +4103,7 @@ static int read_properties_unlocked(struct i915_perf *perf,
> >>  */
> >> if (oa_period <= NSEC_PER_SEC) {
> >> u64 tmp = NSEC_PER_SEC;
> >> - do_div(tmp, oa_period);
> >> + do_div(tmp, (u32)oa_period);
> > 
> > Why is this code even using do_div() when it doesn't need the
> > remainder?
> 
> do_div() is an optimized 64-by-32 division and the compiler should
> automatically remove the remainder if it's not used.

The point is that do_div() is a bad API because it magically
changes the divided in place. There are more sensible 64bit
division helpers in math64.h that can be used instead.

oa_exponent_to_ns() also hand rolls a DIV_ROUND_UP_ULL()
for some reason...

-- 
Ville Syrjälä
Intel
