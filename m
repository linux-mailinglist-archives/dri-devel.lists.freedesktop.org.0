Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C736FDE0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 17:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823816F556;
	Fri, 30 Apr 2021 15:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713B6F556
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 15:36:01 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id t4so22599846ejo.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S2w1XoXSOUOeQL0+GXSsmFOnGYD+P6E5YfPlqMKZ16k=;
 b=wjYsTGK4xWNtLmDkQ1YrzclsHotnfK4TRJE4DRweMxZTGpoSGpCHuMhM4pP9wUR6bF
 k8tzwM1uu1dacHXUokX6VPMJF1NBJhKY9D4uIgaywCnE+Wzvol6EqH9WmV+Jzt1BWPvy
 4PHw+v4FlBiDlR4oxK8GCSjHRx61s61gmZGKZwu2LFNmZyis8RH2GltqX9JPTI+3VAvZ
 hKH3TsSQ3nSxcCSnApd4njhpK72ER9iwrdYYl+bsDUwjUG7YIIeWEp1bYO/xl6wPYxR0
 OegiKVhy/5yBrTd5RJgwbL0brGke5pd1pjzA7nZ2pAGzidkFQAWOntvB5C4dSVbNwYym
 V4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2w1XoXSOUOeQL0+GXSsmFOnGYD+P6E5YfPlqMKZ16k=;
 b=dxprS0vckdzc+GIqsp4g/StzwDdS0zcR7hN4Is/zNH2oHCak/5TkMXcp6f9bv3FYRf
 C1p7zdYoFMekBNI8JJ6JXl1IXOsabI0mP1i4bZBgpTv6+tJCLsKBLJ/7/kzMXDPeAnFc
 EmUQQDFn57th3I8UsleV6yAUNiE4QcDHGb4y/yig/2C22BPgIdHY+BU5Pv59WAk/z5zR
 rAh6hxup0foTJnE/Y7lzHM44RNOyoFpzbYg4Pda7jpMp7vR+BX12oXXTTJ3ewJw01OLr
 8gCxv8fSnRYkiTV8UmkB9v2Uc58DiDBbd79UNfRgVV2v06wsojpBGp3D3d6l1tzPQyRK
 UYsA==
X-Gm-Message-State: AOAM5336y2fKNqqucubpwwwH2Uh6O5YBXJYeMEeEi94OJKojXvplqFCV
 erD6dyAu0M5MXsoXLhHyhqfwDVZWNxmIGu6N5tNQ2A==
X-Google-Smtp-Source: ABdhPJyl3mNC/ZdqJQbSrLqFPsFaqUpP8trPj8pY+sYihdpezc02/27lNecNQtvuAXd38DUBmeb2wvrdTm+n/yWOftU=
X-Received: by 2002:a17:906:5a96:: with SMTP id
 l22mr5055104ejq.450.1619796959626; 
 Fri, 30 Apr 2021 08:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-4-jason@jlekstrand.net>
 <417fe44a-61f9-c90a-c255-309db5bb48ab@linux.intel.com>
 <CAOFGe96jXtyx2-hiYBmZPFqSx1G32Ph7SGguJQ=ZD4im=ZPJ5A@mail.gmail.com>
 <19ee110c-f251-20b1-5ca8-d280b724ccbf@linux.intel.com>
 <CAOFGe95D81vvT1AQPF_sbqWQMZAJeZmr92xgd2m=GZY4TxGYUw@mail.gmail.com>
 <40869b1c-411a-31aa-0065-8b5f4fa8bd47@linux.intel.com>
In-Reply-To: <40869b1c-411a-31aa-0065-8b5f4fa8bd47@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 30 Apr 2021 10:35:48 -0500
Message-ID: <CAOFGe97YA99K5rJXM4Kmx6T4a-yKXVoH_i+5WjfmC0MRobOBXg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/21] drm/i915/gem: Set the watchdog timeout
 directly in intel_context_set_gem
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 6:18 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 29/04/2021 15:54, Jason Ekstrand wrote:
> > On Thu, Apr 29, 2021 at 3:04 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 28/04/2021 18:24, Jason Ekstrand wrote:
> >>> On Wed, Apr 28, 2021 at 10:55 AM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>> On 23/04/2021 23:31, Jason Ekstrand wrote:
> >>>>> Instead of handling it like a context param, unconditionally set it when
> >>>>> intel_contexts are created.  This doesn't fix anything but does simplify
> >>>>> the code a bit.
> >>>>>
> >>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >>>>> ---
> >>>>>     drivers/gpu/drm/i915/gem/i915_gem_context.c   | 43 +++----------------
> >>>>>     .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 --
> >>>>>     drivers/gpu/drm/i915/gt/intel_context_param.h |  3 +-
> >>>>>     3 files changed, 6 insertions(+), 44 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>> index 35bcdeddfbf3f..1091cc04a242a 100644
> >>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>> @@ -233,7 +233,11 @@ static void intel_context_set_gem(struct intel_context *ce,
> >>>>>             intel_engine_has_timeslices(ce->engine))
> >>>>>                 __set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> >>>>>
> >>>>> -     intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
> >>>>> +     if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
> >>>>> +         ctx->i915->params.request_timeout_ms) {
> >>>>> +             unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
> >>>>> +             intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
> >>>>
> >>>> Blank line between declarations and code please, or just lose the local.
> >>>>
> >>>> Otherwise looks okay. Slight change that same GEM context can now have a
> >>>> mix of different request expirations isn't interesting I think. At least
> >>>> the change goes away by the end of the series.
> >>>
> >>> In order for that to happen, I think you'd have to have a race between
> >>> CREATE_CONTEXT and someone smashing the request_timeout_ms param via
> >>> sysfs.  Or am I missing something?  Given that timeouts are really
> >>> per-engine anyway, I don't think we need to care too much about that.
> >>
> >> We don't care, no.
> >>
> >> For completeness only - by the end of the series it is what you say. But
> >> at _this_ point in the series though it is if modparam changes at any
> >> point between context create and replacing engines. Which is a change
> >> compared to before this patch, since modparam was cached in the GEM
> >> context so far. So one GEM context was a single request_timeout_ms.
> >
> > I've added the following to the commit message:
> >
> > It also means that sync files exported from different engines on a
> > SINGLE_TIMELINE context will have different fence contexts.  This is
> > visible to userspace if it looks at the obj_name field of
> > sync_fence_info.
> >
> > How's that sound?
>
> Wrong thread but sounds good.
>
> I haven't looked into the fence merge logic apart from noticing context
> is used there. So I'd suggest a quick look there on top, just to make
> sure merging logic does not hold any surprises if contexts start to
> differ. Probably just results with more inefficiency somewhere, in theory.

Looked at it yesterday.  It really does just create a fence array with
all the fences. :-)

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
