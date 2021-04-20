Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9C9365E06
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 19:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4BB6E87E;
	Tue, 20 Apr 2021 17:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CEC6E880
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 17:01:06 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l4so59310715ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EzOshu5rTvy+u9I3kdEBjrmA7176n5qzpLFoWKyuiGs=;
 b=BLLEBqlOik4IfyCS8RHXFExvhc1PwsmS7FaU5TFNOo7yohBQhpw9RBbq1M9n1KMfBt
 BJYUikQm/m3i5ThF644QDpl3weg5w+C7Qn9Ygs4PigZ/8WDWHX73UJHSNG1gIGoW2POc
 T1Z+MRf/qq9V/a064hcJJR24GRHlkoEm7o/+xPRdvLXIQ9ZYQr11y2a9egcHg9m745ab
 Gy/tRzp79COTZ+3iOsl4G9BNahG45+CGCqUZxBTUvXpmxeEgt1UHLKfPhQzxC0RtyAg0
 VroXsc1t0H/JSoKRXue99FL9jE0sCzsFv33gRl1UX0BErx2IIAXM5zO9M7XX+Vry5CZa
 zexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EzOshu5rTvy+u9I3kdEBjrmA7176n5qzpLFoWKyuiGs=;
 b=G0eCB3vpubUxvL+AurVxCe7WAg/apwASosu0a64z7mLa3a/S1W8AJ1KLKP+EHj/baf
 YriANcZ8OInZYQ68CPYnD9roKUUPClneuAK1W7tQOzZ2Xsg5Pp7YWCRu2kXGI0Xo4t86
 5Xd7VFtuk2GuajHFnNDMaBe+SMRIFhlKOQxDPDYvDZQr8pq6bdpUOzGI10PHFeLPaFah
 ++ApbTHr8Czw1MEATS0Ak9HGEPEigG+8zHEuw8txHmv/flGy7E1wwWJgSnunrvuH5ec6
 3w6CrJFYIX0CPjBgsr+xLo6ISvfpov3mm4ptfl9kZtpw/MRtHTQP7cYcQlYj/7FB0Wtn
 fWKw==
X-Gm-Message-State: AOAM532c+jdTyaE03GpmRI5R04HSRQI8mUOqGb899PAcwNEX8yBRuDtw
 EHeG6hc38wUbfkeMPEpzqpwiq6YACi0B/OieiZZApA==
X-Google-Smtp-Source: ABdhPJyFhqBaZuMipyiUgM9HXSroFs3RtzekbMNFM+/yap400JenlFRk81/z/hST2OXQZEAx5ZGqyZBn/rMbag/45Bo=
X-Received: by 2002:a17:906:2596:: with SMTP id
 m22mr29142230ejb.175.1618938064541; 
 Tue, 20 Apr 2021 10:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-4-matthew.auld@intel.com>
 <CAOFGe96QALJa4FbWkVxczTdOA6b41zk1GxdYwRsrP7GwSZ4zvw@mail.gmail.com>
 <6cf790c7-84bf-4d35-c1c3-4cf826655faf@intel.com>
 <CAOFGe95gMUuqXX=Yn_xMRVxQmcwiqNEN0m3PgyNACcm0iNTyKg@mail.gmail.com>
 <5a412489-75ed-e971-0e0b-388f0f964fac@linux.intel.com>
In-Reply-To: <5a412489-75ed-e971-0e0b-388f0f964fac@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 20 Apr 2021 12:00:51 -0500
Message-ID: <CAOFGe97HuFOe08ttq7yyuiTVphjvwRB2542at6uEEb5YX671Rw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/doc/rfc: i915 DG1 uAPI
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 11:34 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 19/04/2021 16:19, Jason Ekstrand wrote:
> > On Mon, Apr 19, 2021 at 7:02 AM Matthew Auld <matthew.auld@intel.com> wrote:
> >>
> >> On 16/04/2021 17:38, Jason Ekstrand wrote:
> >>> On Thu, Apr 15, 2021 at 11:04 AM Matthew Auld <matthew.auld@intel.com> wrote:
> >>>>
> >>>> Add an entry for the new uAPI needed for DG1.
> >>>>
> >>>> v2(Daniel):
> >>>>     - include the overall upstreaming plan
> >>>>     - add a note for mmap, there are differences here for TTM vs i915
> >>>>     - bunch of other suggestions from Daniel
> >>>> v3:
> >>>>    (Daniel)
> >>>>     - add a note for set/get caching stuff
> >>>>     - add some more docs for existing query and extensions stuff
> >>>>     - add an actual code example for regions query
> >>>>     - bunch of other stuff
> >>>>    (Jason)
> >>>>     - uAPI change(!):
> >>>>           - try a simpler design with the placements extension
> >>>>           - rather than have a generic setparam which can cover multiple
> >>>>             use cases, have each extension be responsible for one thing
> >>>>             only
> >>>>
> >>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
> >>>> Cc: Daniel Vetter <daniel.vetter@intel.com>
> >>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
> >>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
> >>>> Cc: Dave Airlie <airlied@gmail.com>
> >>>> Cc: dri-devel@lists.freedesktop.org
> >>>> Cc: mesa-dev@lists.freedesktop.org
> >>>> ---
> >>>>    Documentation/gpu/rfc/i915_gem_lmem.h   | 255 ++++++++++++++++++++++++
> >>>>    Documentation/gpu/rfc/i915_gem_lmem.rst | 139 +++++++++++++
> >>>>    Documentation/gpu/rfc/index.rst         |   4 +
> >>>>    3 files changed, 398 insertions(+)
> >>>>    create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.h
> >>>>    create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst
> >>>>
> >>>> diff --git a/Documentation/gpu/rfc/i915_gem_lmem.h b/Documentation/gpu/rfc/i915_gem_lmem.h
> >>>> new file mode 100644
> >>>> index 000000000000..2a82a452e9f2
> >>>> --- /dev/null
> >>>> +++ b/Documentation/gpu/rfc/i915_gem_lmem.h
> >>>> @@ -0,0 +1,255 @@
> >>>> +/*
> >>>> + * Note that drm_i915_query_item and drm_i915_query are existing bits of uAPI.
> >>>> + * For the regions query we are just adding a new query id, so no actual new
> >>>> + * ioctl or anything, but including it here for reference.
> >>>> + */
> >>>> +struct drm_i915_query_item {
> >>>> +#define DRM_I915_QUERY_MEMORY_REGIONS   0xdeadbeaf
> >>>> +       ....
> >>>> +        __u64 query_id;
> >>>> +
> >>>> +        /*
> >>>> +         * When set to zero by userspace, this is filled with the size of the
> >>>> +         * data to be written at the data_ptr pointer. The kernel sets this
> >>>> +         * value to a negative value to signal an error on a particular query
> >>>> +         * item.
> >>>> +         */
> >>>> +        __s32 length;
> >>>> +
> >>>> +        __u32 flags;
> >>>> +        /*
> >>>> +         * Data will be written at the location pointed by data_ptr when the
> >>>> +         * value of length matches the length of the data to be written by the
> >>>> +         * kernel.
> >>>> +         */
> >>>> +        __u64 data_ptr;
> >>>> +};
> >>>> +
> >>>> +struct drm_i915_query {
> >>>> +        __u32 num_items;
> >>>> +        /*
> >>>> +         * Unused for now. Must be cleared to zero.
> >>>> +         */
> >>>> +        __u32 flags;
> >>>> +        /*
> >>>> +         * This points to an array of num_items drm_i915_query_item structures.
> >>>> +         */
> >>>> +        __u64 items_ptr;
> >>>> +};
> >>>> +
> >>>> +#define DRM_IOCTL_I915_QUERY   DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUERY, struct drm_i915_query)
> >>>> +
> >>>> +/**
> >>>> + * enum drm_i915_gem_memory_class
> >>>> + */
> >>>> +enum drm_i915_gem_memory_class {
> >>>> +       /** @I915_MEMORY_CLASS_SYSTEM: system memory */
> >>>> +       I915_MEMORY_CLASS_SYSTEM = 0,
> >>>> +       /** @I915_MEMORY_CLASS_DEVICE: device local-memory */
> >>>> +       I915_MEMORY_CLASS_DEVICE,
> >>>> +};
> >>>> +
> >>>> +/**
> >>>> + * struct drm_i915_gem_memory_class_instance
> >>>> + */
> >>>> +struct drm_i915_gem_memory_class_instance {
> >>>> +       /** @memory_class: see enum drm_i915_gem_memory_class */
> >>>> +       __u16 memory_class;
> >>>> +
> >>>> +       /** @memory_instance: which instance */
> >>>> +       __u16 memory_instance;
> >>>> +};
> >>>> +
> >>>> +/**
> >>>> + * struct drm_i915_memory_region_info
> >>>> + *
> >>>> + * Describes one region as known to the driver.
> >>>> + *
> >>>> + * Note that we reserve quite a lot of stuff here for potential future work. As
> >>>> + * an example we might want expose the capabilities(see caps) for a given
> >>>> + * region, which could include things like if the region is CPU
> >>>> + * mappable/accessible etc.
> >>>
> >>> I get caps but I'm seriously at a loss as to what the rest of this
> >>> would be used for.  Why are caps and flags both there and separate?
> >>> Flags are typically something you set, not query.  Also, what's with
> >>> rsvd1 at the end?  This smells of substantial over-building to me.
> >>>
> >>> I thought to myself, "maybe I'm missing a future use-case" so I looked
> >>> at the internal tree and none of this is being used there either.
> >>> This indicates to me that either I'm missing something and there's
> >>> code somewhere I don't know about or, with three years of building on
> >>> internal branches, we still haven't proven that any of this is needed.
> >>> If it's the latter, which I strongly suspect, maybe we should drop the
> >>> unnecessary bits and only add them back in if and when we have proof
> >>> that they're useful.
> >>
> >> Do you mean just drop caps/flags here, but keep/inflate rsvd0/rsvd1,
> >> which is less opinionated about future unknowns? If so, makes sense to me.
> >
> > I meant drop flags and rsvd1.  We need rsvd0 for padding and  I can
> > see some value to caps.  We may want to advertise, for instance, what
> > mapping coherency types are available per-heap.  But I don't see any
> > use for any of the other fields.
>
> I'd suggest making sure at least enough rsvd fields remain so that flags
> could be added later if needed. Experience from engine info shows that
> both were required in order to extend the query via re-purposing the
> rsvds and adding flag bits to indicate when a certain rsvd contains a
> new piece of information.

Looking at DII, all I see is we started using caps.  I already said
I'm fine with caps.  I can already imagine some useful ones like
specifying what kinds of mappings we can do.

If we're concerned about more complicated stuff, I argue that we have
no ability to predict what that will look like and so just throwing in
a bunch of __u32 rsvd[N] is blind guessing.  I'm seeing a lot of that
in the recently added APIs such as the flags and rsvd[4] in
i915_user_extension.  What's that there for?  Why can't you put that
information in the extension struct which derives from it?  Maybe it's
so that we can extend it.  But we added that struct as part of an
extension mechanism!?!

If we want to make things extensible, Vulkan actually provides some
prior art for this in the form of allowing queries to be extended just
like input structs.  We could add a __u64 extensions field to
memory_region_info and, if we ever need to query more info, the client
can provide a chain of additional per-region queries.  Yeah, there are
problems with it and it gets a bit clunky but it does work pretty
well.

> I probably cannot go into too much detail
> here, but anyway the point is just to make sure too much is not stripped
> out so that instead of simply adding fields/flags we have to add a new
> query in the future. IMO some rsvd fields are not really harmful and if
> they can make things easier in the future why not.

Maybe it's my tired and generally grumpy state of mind but I'm not
particularly favorable towards "why not?" as a justification for
immutable kernel APIs.  We've already found a few places where
Zoidberg API design has caused us problems.  We need an answer to
"why?"  Future extensibility is a potentially valid answer but we need
to do a better job of thinking through it than we have in the past.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
