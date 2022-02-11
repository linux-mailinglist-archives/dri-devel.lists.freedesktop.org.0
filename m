Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC74B2978
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 16:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D5D10EA8A;
	Fri, 11 Feb 2022 15:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A0210EA8A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644594998; x=1676130998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G2nMVmGnVC61HKINS0KX3x16eUy0vrSIWj0awqxztAE=;
 b=Qv1BRtUkq3J4LRk9v+XeB74viuuSWQQn+7vd0LDCr1VsYrzk2737Z9AO
 W3R7CJ5X3axROmTZh21bUsO6Z0jg/+6vvNxsFsoesMsG36kUp5rARWhsB
 yN1J1VuGofM/T2B6wdwHpDrpLBW0iYFmp+FGdoayoe9F/CjvDq3D2Ivyd
 6TSaNleEJTWIJH/PqgHZx2+fJtNX6Ocz8MJsdSJ4airLQIPNF0oz+5Cg1
 zQiZYiiT3925c1/6kBnu+XGOI61s+CSlh7KZUj2YEMH2hqtTBx/Osvn3Q
 PCX6r8re5Mc9kjQq1Q5PjtlRN6K/7NZMgLd2mB4RRkILOY0Qf2Yv5KTUk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="247346338"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="247346338"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:56:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="634130120"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:56:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIYGm-003UpL-57; Fri, 11 Feb 2022 17:55:36 +0200
Date: Fri, 11 Feb 2022 17:55:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
Message-ID: <YgaG98O12Fg7WmQJ@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-3-javierm@redhat.com>
 <YgZEPo0ERFRloDyA@smile.fi.intel.com>
 <00616642-1c95-9258-ab6e-b08116b36d21@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00616642-1c95-9258-ab6e-b08116b36d21@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 12:50:04PM +0100, Javier Martinez Canillas wrote:
> On 2/11/22 12:10, Andy Shevchenko wrote:

...

> >> +	for (xb = 0; xb < pixels; xb++) {
> >> +		unsigned int start = 0, end = 8;
> >> +		u8 byte = 0x00;
> > 
> >> +		if (xb == 0 && start_offset)
> >> +			start = start_offset;
> > 
> > This is invariant to the loop, can be moved out.
> > 
> >> +		if (xb == pixels - 1 && end_len)
> >> +			end = end_len;
> > 
> > Ditto. However it may require to factor out the following loop to a helper.
> 
> Not sure I'm following, it's not invariant since it depends on the
> loop iterator value. It only applies to the first and last pixels.

It's. You simply does it at the last iteration which may be perfectly done
outside of the main (aligned) loop.

...

> >> +		dst_pitch = DIV_ROUND_UP(linepixels, 8);
> > 
> > round_up() ?
> 
> But it's not a round up operation but a div and round up.

Indeed.

...

> >> +	WARN_ONCE(dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
> > 
> > 
> > I would move this to the if conditional, i.e.
> > 
> > 	if (dst_pitch)
> > 		WARN_ONCE(dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
> > 	else
> > 		dst_pitch = round_up(linepixels, 8);
> 
> No, because we always need to div and round up. The warning is just printed to
> let know that the dst pitch is not a multiple of 8 as it should be. So callers
> could be fixed.

Okay, you expect that linepixels to be multiple of 64? Otherwise I didn't get
what's going on with this warning.

...

> >> +	start_offset = clip->x1 % 8;
> >> +	end_len = clip->x2 % 8;
> > 
> > ALIGN() ?
> 
> But we don't want to align here but to know what's the start and end if is
> not aligned since that would mean converting to mono in the middle of a byte.

Indeed. Somehow I missed that it's a complimentary to ALIGN().

-- 
With Best Regards,
Andy Shevchenko


