Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5C6D82F9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094CD10EA06;
	Wed,  5 Apr 2023 16:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D95710EA13;
 Wed,  5 Apr 2023 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680710797; x=1712246797;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sqg0P88YoT8lsSN0phoEeZOOz98+mdr1CWyuLIJ3O8o=;
 b=DgH9z4O4QNOcukmb8TMoRdMa+KW4FlyEf/LebEUp6YeMins629MoRESA
 ErhvLfQpLi1c+4Xbn9WN5fcscYCaD063T4kZ4MmiRNJAnKouCQAXAdW7l
 XEOrFhqN7webL/qJcZEFQboBEyJw2fWAdn41FhvYTg5LpvHqeFYGDm7XR
 jKm+GcoSFqlD7zToIDNBi6xsHgrjIn6hhB9fLhGETtHxBXA1qJ8F9rGuj
 npEB1hiEWEGyjzeUTE5co8a8QtZJywKhtNdZT/7OxyDUgA7Ek72pDxl2j
 XryalJTSNrBwov1TH504CuDrifnvK9OyQsWK3g9MORa+wBWEr13ym8ADt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428781600"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="428781600"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 09:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="719374688"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="719374688"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 09:06:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 01/19] drm/i915/i915_scatterlist: Fix kerneldoc
 formatting issue - missing '@'
In-Reply-To: <20230405134526.GE8371@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230331092607.700644-1-lee@kernel.org>
 <20230331092607.700644-2-lee@kernel.org> <87jzyt0yil.fsf@intel.com>
 <20230403162059.GC8371@google.com> <878rf80ynz.fsf@intel.com>
 <20230405134526.GE8371@google.com>
Date: Wed, 05 Apr 2023 19:06:29 +0300
Message-ID: <87jzyqz52y.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 05 Apr 2023, Lee Jones <lee@kernel.org> wrote:
> On Tue, 04 Apr 2023, Jani Nikula wrote:
>
>> On Mon, 03 Apr 2023, Lee Jones <lee@kernel.org> wrote:
>> > On Mon, 03 Apr 2023, Jani Nikula wrote:
>> >
>> >> On Fri, 31 Mar 2023, Lee Jones <lee@kernel.org> wrote:
>> >> > Fixes the following W=1 kernel build warning(s):
>> >> >
>> >> >  drivers/gpu/drm/i915/i915_scatterlist.c:62: warning: Function parameter or member 'size' not described in 'i915_refct_sgt_init'
>> >> >
>> >> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> >> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> >> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> >> > Cc: David Airlie <airlied@gmail.com>
>> >> > Cc: Daniel Vetter <daniel@ffwll.ch>
>> >> > Cc: intel-gfx@lists.freedesktop.org
>> >> > Cc: dri-devel@lists.freedesktop.org
>> >> > Signed-off-by: Lee Jones <lee@kernel.org>
>> >>
>> >> Thanks for the patches!
>> >>
>> >> Applied all but one of the drm/i915 patches to drm-intel-next or
>> >> drm-intel-gt-next depending on the area. There were a couple of issues
>> >> that I fixed while applying. There was a conflict with patch 5/19
>> >> against drm-intel-gt-next so I left that one out.
>> >
>> > Thanks Jani.  I'll rebase and see what's left.
>>
>> We also took notice and aim to track this more aggressively [1].
>
> Thanks.
>
> I did clean-up all of the GPU warnings already a couple of years ago,
> but they seem to have crept back over time.  It would be great if we
> could put some extra checks in place to prevent them in the future.

We are pretty zealous about warnings in general in i915. We have a bunch
of extra warnings in our local Makefile and use -Werror in
development. Inspired by this series, we added kernel-doc check to the
build, and hope to add kernel-doc -Werror too once we're done.

> My aim, albeit ambitious, is to clean-up all of the W=1 warnings in the
> kernel, then have them promoted to W=0, so they warn more loudly during
> development, thus keeping them from reappearing.

I wish it was easier to do the equivalent of W=1 on a driver or Makefile
basis. I like to keep i915 clean, but I don't like to use W=1 because
there are just so many warnings currently.

The other alternative is fixing and moving extra warnings from W=1 to
W=0 one by one.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
