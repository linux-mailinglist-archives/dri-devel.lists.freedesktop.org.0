Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258166D83EC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE75110EA17;
	Wed,  5 Apr 2023 16:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B291F10EA15;
 Wed,  5 Apr 2023 16:41:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C6C863D5C;
 Wed,  5 Apr 2023 16:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383CDC433EF;
 Wed,  5 Apr 2023 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680712870;
 bh=DV0/yjdD/+FEcW0k9WYhDje1AP1oYkbQXJY73iIbEvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=giYLlI6EETXpR4/c/J+NZDFti5eGPMXnL6nscnQvcZ8jeUSYsW1ZEGGF0czEZS22d
 /r4CLg1kygBtLNHI+7wzGWnyahOQGSZx3F1jDEZdUKNCgPdS16gP3gYlqKIx3PfY69
 s6L/US5Ybq3zUF6uEaT3SQSLZVnqFGyNFDpe5LCYHT6MbWrQS3e23pVfOGMKIgxTgX
 ircGp63ITTW4MY6W9Whg7k+PWvnLYEjRL86gNGUffCcDrU0zpi929kilLSyzpSvwEK
 HTFl5T0Oo4KC2SV5vhA96xXfpAKScaHHyhDI+J6Mef5Tq8WxkC3UBc2gLzVYY/hGYC
 v792PEs4N65UA==
Date: Wed, 5 Apr 2023 17:41:05 +0100
From: Lee Jones <lee@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 01/19] drm/i915/i915_scatterlist: Fix kerneldoc
 formatting issue - missing '@'
Message-ID: <20230405164105.GU8371@google.com>
References: <20230331092607.700644-1-lee@kernel.org>
 <20230331092607.700644-2-lee@kernel.org> <87jzyt0yil.fsf@intel.com>
 <20230403162059.GC8371@google.com> <878rf80ynz.fsf@intel.com>
 <20230405134526.GE8371@google.com> <87jzyqz52y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzyqz52y.fsf@intel.com>
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

On Wed, 05 Apr 2023, Jani Nikula wrote:

> On Wed, 05 Apr 2023, Lee Jones <lee@kernel.org> wrote:
> > On Tue, 04 Apr 2023, Jani Nikula wrote:
> >
> >> On Mon, 03 Apr 2023, Lee Jones <lee@kernel.org> wrote:
> >> > On Mon, 03 Apr 2023, Jani Nikula wrote:
> >> >
> >> >> On Fri, 31 Mar 2023, Lee Jones <lee@kernel.org> wrote:
> >> >> > Fixes the following W=1 kernel build warning(s):
> >> >> >
> >> >> >  drivers/gpu/drm/i915/i915_scatterlist.c:62: warning: Function parameter or member 'size' not described in 'i915_refct_sgt_init'
> >> >> >
> >> >> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> >> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >> >> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> >> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >> >> > Cc: David Airlie <airlied@gmail.com>
> >> >> > Cc: Daniel Vetter <daniel@ffwll.ch>
> >> >> > Cc: intel-gfx@lists.freedesktop.org
> >> >> > Cc: dri-devel@lists.freedesktop.org
> >> >> > Signed-off-by: Lee Jones <lee@kernel.org>
> >> >>
> >> >> Thanks for the patches!
> >> >>
> >> >> Applied all but one of the drm/i915 patches to drm-intel-next or
> >> >> drm-intel-gt-next depending on the area. There were a couple of issues
> >> >> that I fixed while applying. There was a conflict with patch 5/19
> >> >> against drm-intel-gt-next so I left that one out.
> >> >
> >> > Thanks Jani.  I'll rebase and see what's left.
> >>
> >> We also took notice and aim to track this more aggressively [1].
> >
> > Thanks.
> >
> > I did clean-up all of the GPU warnings already a couple of years ago,
> > but they seem to have crept back over time.  It would be great if we
> > could put some extra checks in place to prevent them in the future.
>
> We are pretty zealous about warnings in general in i915. We have a bunch
> of extra warnings in our local Makefile and use -Werror in
> development. Inspired by this series, we added kernel-doc check to the
> build, and hope to add kernel-doc -Werror too once we're done.

Sounds good that you're on it.  At least in your part of GPU.

kernel-doc warnings are surfaced by enabling W=1.

> > My aim, albeit ambitious, is to clean-up all of the W=1 warnings in the
> > kernel, then have them promoted to W=0, so they warn more loudly during
> > development, thus keeping them from reappearing.
>
> I wish it was easier to do the equivalent of W=1 on a driver or Makefile
> basis. I like to keep i915 clean, but I don't like to use W=1 because
> there are just so many warnings currently.

Well that's what I hope to improve (again). :)

> The other alternative is fixing and moving extra warnings from W=1 to
> W=0 one by one.

Right, that's where I'd like to end up eventually.

--
Lee Jones [李琼斯]
