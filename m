Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74F8C40AE
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606E610E0E3;
	Mon, 13 May 2024 12:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glaItM3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0309910E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715603166; x=1747139166;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6Ufg9vC7DlIJTDux+Yrnokl43VALnRkBoch8swS93gE=;
 b=glaItM3H+ZWgmptJ0P57kWohK/an32PMKLYrcnN8mTEeiZIPXwTbLpkX
 ntBiwBYiV8fWB3gYczC/h9fYwatwZp1i5Cgi+/7CfwKUyo6+biKUEtNB+
 I2u5xeoxUNEVpQJ0eINknmGBun5wbr4rGcPKpU2YbTHNLak4TBY7uyRH2
 IIJm2TdObPSlZx6quJ7hHD3QFv07+uST2FWAA1WeFkHjb+mhagejwax8I
 EHDmKQfpFmlimakmLpBq8Jf/b0oXiriu1y+NmiqTd7qtyFuKwoeSC+aDv
 2OWnAeCTZNSEwfYa9l0cBk8kdyOcgoQEPnGkAlRB78wMyZ08kf76c4VsC w==;
X-CSE-ConnectionGUID: c2FruwkhRWm/WsCcxprSTQ==
X-CSE-MsgGUID: RkikyT6yQuWsPrMgYVttTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15325845"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="15325845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:26:05 -0700
X-CSE-ConnectionGUID: Fu3+mmGNTR6yS9mu5CxnuQ==
X-CSE-MsgGUID: Rlm4/1I8TYOGnqKFYVgmzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30277124"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:25:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s6Ukd-000000078C2-2xf1; Mon, 13 May 2024 15:25:55 +0300
Date: Mon, 13 May 2024 15:25:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Jani Nikula <jani.nikula@intel.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <ZkIG0-01pz632l4R@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com> <87fruphf55.fsf@intel.com>
 <5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com>
 <ZkHWbS4raU_BPlpm@smile.fi.intel.com>
 <6557050e-6b18-2628-cbab-1a811b2190ba@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6557050e-6b18-2628-cbab-1a811b2190ba@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 13, 2024 at 04:55:58PM +0530, Devarsh Thakkar wrote:
> On 13/05/24 14:29, Andy Shevchenko wrote:
> > On Sat, May 11, 2024 at 11:11:14PM +0530, Devarsh Thakkar wrote:
> >> On 10/05/24 20:45, Jani Nikula wrote:

[...]

> >>> Moreover, I think the naming of round_up() and round_down() should have
> >>> reflected the fact that they operate on powers of 2. It's unfortunate
> >>> that the difference to roundup() and rounddown() is just the underscore!
> >>> That's just a trap.
> >>>
> >>> So let's perhaps not repeat the same with round_closest_up() and
> >>> round_closest_down()?
> >>
> >> Yes the naming is inspired by existing macros i.e. round_up, round_down
> >> (which round up/down to next pow of 2) and DIV_ROUND_CLOSEST (which
> >> round the divided value to closest value) and there are already a lot of
> >> users for these API's :
> >>
> >>   linux-next git:(heads/next-20240509) ✗ grep -nr round_up drivers | wc
> >>     730    4261   74775
> >>
> >>   linux-next git:(heads/next-20240509) ✗ grep -nr round_down drivers | wc
> >>     226    1293   22194
> >>
> >>  linux-next git:(heads/next-20240509) ✗ grep -nr DIV_ROUND_CLOSEST
> >> drivers | wc
> >>    1207    7461  111822
> > 
> > Side note, discover `git grep ...`: it's much much faster on Git index,
> > than classic one on a working copy.
> > 
> >> so I thought to align with existing naming convention assuming
> >> developers are already familiar with this.
> >>
> >> But if a wider consensus is to go with a newer naming convention then I
> >> am open to it, although a challenge there would be to keep it short. For
> >> e.g. this one is already 3 words, if we go with more explicit
> >> "round_closest_up_pow_2" it looks quite long in my opinion :) .
> > 
> > You need properly name the macros. Again, round_up() / roundup() and
> > roundup_pow_of_two() are three _different_ macros, and it's not clear
> > why you can't use one of them in your case.
> 
> I can't use any of these because these macros either round up or round down,
> whereas I want to round to closest value for the argument specified by the
> user, be it achieved either by rounding up or rounding down depending upon
> whichever makes the answer closer to the user-specified argument.
> 
> To make it clear, I have already included the examples in the macro
> description [2], copying it here, maybe I can put the same examples in the
> commit message too to avoid confusions :
> 
> round_closest_up(17, 4) = 16
> round_closest_up(15, 4) = 16
> round_closest_up(14, 4) = 16
> 
> round_closest_down(17, 4) = 16
> round_closest_down(15, 4) = 16
> round_closest_down(14, 4) = 12
> 
> Coming back to naming, this is as per existing convention used for naming
> round_up, round_down (notice the `_` being used for macros working with pow of
> 2) and DIV_ROUND_CLOSEST (notice the work `closest` used to specify the answer
> to be nearest to specified value). Naming is a bit subjective, but I
> personally don't think it is a good idea to go away with the existing naming
> convention or go with longer names.
> 
> > The patch that changes those to a new one are doubtful to begin with.
> > I.e. need a careful review on the arithmetics side of the change
> > including HW capabilities of handling "closest" results.
> 
> This is already tested from my side, in-fact I have posted some of the results
> in cover-letter with these macros [1] :
> 
> Regarding hardware capabilities, it uses existing round_up, round_down macros
> underneath which are optimized to handle pow of 2 after modifying the user
> provided argument using addition/subtraction and division, so I don't think it
> should generally a problem with the hardware.
> And I see other macros DIV_ROUND_CLOSEST [3] already using similar operations
> i.e. addition/subtraction and division so don't think it should be a problem
> to keep similar other macros in the same file.

Okay, thank you for elaborating. So, what I would expect in the new version of
the series is that:
- align naming (with the existing round*() macros)
- add examples into commit message of the math.h patch
- add test cases (you need to create lib/math_kunit.c for that)
- elaborate in the commit message of the IPU3 change what you posted above
  (some kind of a summary)

> [1]:
> https://gist.github.com/devarsht/de6f5142f678bb1a5338abfd9f814abd#file-v7_jpeg_encoder_crop_validation-L204
> [2]: https://lore.kernel.org/all/20240509183952.4064331-1-devarsht@ti.com/
> [3]: https://elixir.bootlin.com/linux/latest/source/include/linux/math.h#L86

-- 
With Best Regards,
Andy Shevchenko


