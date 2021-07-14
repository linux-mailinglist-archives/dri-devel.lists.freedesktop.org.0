Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC663C84E4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F318991D;
	Wed, 14 Jul 2021 12:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147206E249
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:57:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 m11-20020a05600c3b0bb0290228f19cb433so3853781wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yFIorUGoY88xfyEidDOEA+W3GWIW9oRQFNTfTg9rDJE=;
 b=HSoWNdFvahBOfPiNltph4sMPW9ZTioX8+uUtZD3OJvTsE+zr1cXXwcstUArYXhXft/
 T0P248iYVb/YWvZp6S/aSqMEwQrtPQEbB6bsBWqMRytNTzoIleuT2TRze02WLk04fLYD
 kuIyAxqcnXKUWdxPPeLeb+3Lvvc7LP1h/1p+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yFIorUGoY88xfyEidDOEA+W3GWIW9oRQFNTfTg9rDJE=;
 b=eRBbG9Zq7LdvqBw8l0d5dzvJagVq40gVdH8hbRuOON4OkR/s5ozmrGHEFBbPjWKS3L
 haEsHT2vE6ucjaDCCyR/ztDC0RGg5MpocTVAhe0iIMs01oWAX1/EumYexJLfXzovmLAK
 lKlTOTi9mX0zU3vLyP95Ujm5uuJivtIcPovOAyLFU/RNdULHaIjpTvpg6SPF050GNXQF
 hvVxGU8ETDarlo5A6cCOJNApxImBevpBb8ldVaxJ+1M+u5GAiWUpRwLcXODoO6NX6AfP
 9OPe2Lq7iQoTD3UV73aMIb/7JfwgLo1ZDr+1H9TW9KeT21cxrGY9iyu+Epitrh/ybhdS
 RGsw==
X-Gm-Message-State: AOAM531PSLlNnhT7hPQh1OXN8Bbq+6nwqfzK5PKU/Ee8ECA0Hn8smlee
 BG0ZAqWRZCY9WtEc1YahIJrDvg==
X-Google-Smtp-Source: ABdhPJwOhuFPku5HRbhI6JaPXR7qSmyO7t6tGAHErVsrKIvC6oRAgyZfpxOXRxCAPJJCW7LdWyLkUg==
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr11023099wmb.27.1626267471696; 
 Wed, 14 Jul 2021 05:57:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l39sm3210923wms.1.2021.07.14.05.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 05:57:51 -0700 (PDT)
Date: Wed, 14 Jul 2021 14:57:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: document caching related bits
Message-ID: <YO7fTWsbbhPjaLkn@phenom.ffwll.local>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
 <YO23Y3PUS22FaXDC@intel.com>
 <CAM0jSHOx=WVbzfQzn=kL-5qaG4B3dxPLOimkvUdv6HFJymZeZw@mail.gmail.com>
 <YO3RsxZHUe5imN3q@intel.com>
 <CAM0jSHOsqPUOWCJu_Ti3gW-fnpWF2CtUoo-qt-aMWExAwDDT5A@mail.gmail.com>
 <YO3fhvKCo8eXrmst@intel.com> <YO7HqVPtY2GpbD77@phenom.ffwll.local>
 <YO7NvY3Mb2wgPFAi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YO7NvY3Mb2wgPFAi@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 02:42:53PM +0300, Ville Syrjälä wrote:
> On Wed, Jul 14, 2021 at 01:16:57PM +0200, Daniel Vetter wrote:
> > On Tue, Jul 13, 2021 at 09:46:30PM +0300, Ville Syrjälä wrote:
> > > On Tue, Jul 13, 2021 at 07:24:23PM +0100, Matthew Auld wrote:
> > > > On Tue, 13 Jul 2021 at 18:47, Ville Syrjälä
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Tue, Jul 13, 2021 at 05:13:37PM +0100, Matthew Auld wrote:
> > > > > > On Tue, 13 Jul 2021 at 16:55, Ville Syrjälä
> > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > >
> > > > > > > On Tue, Jul 13, 2021 at 11:45:50AM +0100, Matthew Auld wrote:
> > > > > > > > +     /**
> > > > > > > > +      * @cache_coherent:
> > > > > > > > +      *
> > > > > > > > +      * Track whether the pages are coherent with the GPU if reading or
> > > > > > > > +      * writing through the CPU cache.
> > > > > > > > +      *
> > > > > > > > +      * This largely depends on the @cache_level, for example if the object
> > > > > > > > +      * is marked as I915_CACHE_LLC, then GPU access is coherent for both
> > > > > > > > +      * reads and writes through the CPU cache.
> > > > > > > > +      *
> > > > > > > > +      * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> > > > > > > > +      * the CPU cache are always coherent, regardless of the @cache_level. On
> > > > > > > > +      * snooping based platforms this is not the case, unless the full
> > > > > > > > +      * I915_CACHE_LLC or similar setting is used.
> > > > > > > > +      *
> > > > > > > > +      * As a result of this we need to track coherency separately for reads
> > > > > > > > +      * and writes, in order to avoid superfluous flushing on shared-LLC
> > > > > > > > +      * platforms, for reads.
> > > > > > > > +      *
> > > > > > > > +      * I915_BO_CACHE_COHERENT_FOR_READ:
> > > > > > > > +      *
> > > > > > > > +      * When reading through the CPU cache, the GPU is still coherent. Note
> > > > > > > > +      * that no data has actually been modified here, so it might seem
> > > > > > > > +      * strange that we care about this.
> > > > > > > > +      *
> > > > > > > > +      * As an example, if some object is mapped on the CPU with write-back
> > > > > > > > +      * caching, and we read some page, then the cache likely now contains
> > > > > > > > +      * the data from that read. At this point the cache and main memory
> > > > > > > > +      * match up, so all good. But next the GPU needs to write some data to
> > > > > > > > +      * that same page. Now if the @cache_level is I915_CACHE_NONE and the
> > > > > > > > +      * the platform doesn't have the shared-LLC, then the GPU will
> > > > > > > > +      * effectively skip invalidating the cache(or however that works
> > > > > > > > +      * internally) when writing the new value.  This is really bad since the
> > > > > > > > +      * GPU has just written some new data to main memory, but the CPU cache
> > > > > > > > +      * is still valid and now contains stale data. As a result the next time
> > > > > > > > +      * we do a cached read with the CPU, we are rewarded with stale data.
> > > > > > > > +      * Likewise if the cache is later flushed, we might be rewarded with
> > > > > > > > +      * overwriting main memory with stale data.
> > > > > > > > +      *
> > > > > > > > +      * I915_BO_CACHE_COHERENT_FOR_WRITE:
> > > > > > > > +      *
> > > > > > > > +      * When writing through the CPU cache, the GPU is still coherent. Note
> > > > > > > > +      * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> > > > > > > > +      *
> > > > > > > > +      * This is never set when I915_CACHE_NONE is used for @cache_level,
> > > > > > > > +      * where instead we have to manually flush the caches after writing
> > > > > > > > +      * through the CPU cache. For other cache levels this should be set and
> > > > > > > > +      * the object is therefore considered coherent for both reads and writes
> > > > > > > > +      * through the CPU cache.
> > > > > > >
> > > > > > > I don't remember why we have this read vs. write split and this new
> > > > > > > documentation doesn't seem to really explain it either.
> > > > > >
> > > > > > Hmm, I attempted to explain that earlier:
> > > > > >
> > > > > > * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> > > > > > * the CPU cache are always coherent, regardless of the @cache_level. On
> > > > > > * snooping based platforms this is not the case, unless the full
> > > > > > * I915_CACHE_LLC or similar setting is used.
> > > > > > *
> > > > > > * As a result of this we need to track coherency separately for reads
> > > > > > * and writes, in order to avoid superfluous flushing on shared-LLC
> > > > > > * platforms, for reads.
> > > > > >
> > > > > > So AFAIK it's just because shared-LLC can be coherent for reads, while
> > > > > > also not being coherent for writes(CACHE_NONE),
> > > > >
> > > > > CPU vs. GPU is fully coherent when it comes to LLC. Or at least I've
> > > > > never heard of any mechanism that would make it only partially coherent.
> > > > 
> > > > What do you mean by "comes to LLC", are you talking about HAS_LLC() or
> > > > I915_CACHE_LLC?
> > > 
> > > I'm talking about the actual cache.
> > > 
> > > > 
> > > > If you set I915_CACHE_LLC, then yes it is fully coherent for both
> > > > HAS_LLC() and HAS_SNOOP().
> > > > 
> > > > If you set I915_CACHE_NONE, then reads are still coherent on
> > > > HAS_LLC(),
> > > 
> > > Reads and writes both. The only thing that's not coherent is the
> > > display engine.
> > 
> > There's a lot of code which seems to disagree,
> 
> Can't even imagine why anyone would make a cache coherency protocol
> that only handles reads but not writes...
> 
> > plus there's now this new
> > MOCS thing.
> 
> That's just a full LLC bypass AFAICS. Can't omit invalidates if
> you use that one or you'll just get stale data from the cache
> on reads as well.
> 
> > I really hope we don't have all those cache coherency bits
> > just because the code complexity is entertaining?
> 
> They were definitely added to fix a display issue, and before
> that it was just a single flag, which wasn't doing what the display
> needed. I think before the flag was added we used some other indicators
> to check when we need to clflush, or maybe we did a some extra pointless
> clflushes here and there and the broken single flag was supposed to
> avoid those. Not quite sure.

Hm I thought cache_dirty was added for that display case? But yeah this
entire model is maybe not super well-defined in terms of all the use-cases
and what exactly it means ...

I'm also not clear why this is on the object, and not some kind of
function which computes it from the platform + cache_level.

> I suppose these two flags should maybe have been named more like
> "needs invalidate" and "needs writeback" to make it clear what 
> one needs to do.

tbh I have no idea, this all started to get added after I disappeared for
a few years into display.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
