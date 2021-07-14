Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE83C8397
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 13:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6178D6E218;
	Wed, 14 Jul 2021 11:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F586E218
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 11:17:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g16so2745695wrw.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=o4jVt0FM0uAOA8tI8bouOUQFzl1zaNiC0NrKdXM6dVw=;
 b=MDyz5/5F+mKIzn7pjRzpVCsBk/ysg1vO8murrzxivOdY3gat8oShcdeYtgzWd6gZSp
 942fNhxcMgyVrlpO5rp2i0yRIYvMmfg6Ffq6Ac1iIelA/u3DpJKPakIihpFTNzx6MGRA
 i+Py3WPwntttAaD4Kh9kUiglTfCSS+tnbwcvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=o4jVt0FM0uAOA8tI8bouOUQFzl1zaNiC0NrKdXM6dVw=;
 b=bXZ+dOGXwquRS7D+itHWNnNEbDPS0/zyD9YI3xSw/6oSbv+hebYyA9qxWHX0d33Jo9
 buluh83t9VhRSQM6mN/S39L9Mv4FHoodePut0oTLulisEJJUZTKKIdzSzdw19lTU5yTV
 7sbAYqqF0HO6SKxBqc7VDu2+J3vnAs6cdCCHCJ5ewDP4DWVPzbSQ4uZPdFX9Oi0JFGsB
 jat9Z8JV9exG+Pbj9CrB2VZPao4wtPKMV1ApLFQUN9/3qD3OieCeeH3pjSYLDUhughuE
 0EHnRSzyG/o14pBm/4qCTQ6iEA6DFkxuMA6TTeDXtvdYGf/oYv6RkmXd/1hwExXM1Th5
 iFGA==
X-Gm-Message-State: AOAM531e/mAJBL64oolg/06pFePW4Peq+OIX2MFNf2AqwgOi76AfWg0t
 M0BklRHCXCAl+2Xs9MPMN8TpbA==
X-Google-Smtp-Source: ABdhPJwkf5F4x9FZ486vbcPY4mjJm2lVy4arVYixqB3Jatd0VqiZjlofaKudrfy37tYy9LZ2Q47olA==
X-Received: by 2002:a5d:68c2:: with SMTP id p2mr11750294wrw.27.1626261420349; 
 Wed, 14 Jul 2021 04:17:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f15sm4728066wmj.15.2021.07.14.04.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 04:16:59 -0700 (PDT)
Date: Wed, 14 Jul 2021 13:16:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: document caching related bits
Message-ID: <YO7HqVPtY2GpbD77@phenom.ffwll.local>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
 <YO23Y3PUS22FaXDC@intel.com>
 <CAM0jSHOx=WVbzfQzn=kL-5qaG4B3dxPLOimkvUdv6HFJymZeZw@mail.gmail.com>
 <YO3RsxZHUe5imN3q@intel.com>
 <CAM0jSHOsqPUOWCJu_Ti3gW-fnpWF2CtUoo-qt-aMWExAwDDT5A@mail.gmail.com>
 <YO3fhvKCo8eXrmst@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YO3fhvKCo8eXrmst@intel.com>
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 09:46:30PM +0300, Ville Syrjälä wrote:
> On Tue, Jul 13, 2021 at 07:24:23PM +0100, Matthew Auld wrote:
> > On Tue, 13 Jul 2021 at 18:47, Ville Syrjälä
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Tue, Jul 13, 2021 at 05:13:37PM +0100, Matthew Auld wrote:
> > > > On Tue, 13 Jul 2021 at 16:55, Ville Syrjälä
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Tue, Jul 13, 2021 at 11:45:50AM +0100, Matthew Auld wrote:
> > > > > > +     /**
> > > > > > +      * @cache_coherent:
> > > > > > +      *
> > > > > > +      * Track whether the pages are coherent with the GPU if reading or
> > > > > > +      * writing through the CPU cache.
> > > > > > +      *
> > > > > > +      * This largely depends on the @cache_level, for example if the object
> > > > > > +      * is marked as I915_CACHE_LLC, then GPU access is coherent for both
> > > > > > +      * reads and writes through the CPU cache.
> > > > > > +      *
> > > > > > +      * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> > > > > > +      * the CPU cache are always coherent, regardless of the @cache_level. On
> > > > > > +      * snooping based platforms this is not the case, unless the full
> > > > > > +      * I915_CACHE_LLC or similar setting is used.
> > > > > > +      *
> > > > > > +      * As a result of this we need to track coherency separately for reads
> > > > > > +      * and writes, in order to avoid superfluous flushing on shared-LLC
> > > > > > +      * platforms, for reads.
> > > > > > +      *
> > > > > > +      * I915_BO_CACHE_COHERENT_FOR_READ:
> > > > > > +      *
> > > > > > +      * When reading through the CPU cache, the GPU is still coherent. Note
> > > > > > +      * that no data has actually been modified here, so it might seem
> > > > > > +      * strange that we care about this.
> > > > > > +      *
> > > > > > +      * As an example, if some object is mapped on the CPU with write-back
> > > > > > +      * caching, and we read some page, then the cache likely now contains
> > > > > > +      * the data from that read. At this point the cache and main memory
> > > > > > +      * match up, so all good. But next the GPU needs to write some data to
> > > > > > +      * that same page. Now if the @cache_level is I915_CACHE_NONE and the
> > > > > > +      * the platform doesn't have the shared-LLC, then the GPU will
> > > > > > +      * effectively skip invalidating the cache(or however that works
> > > > > > +      * internally) when writing the new value.  This is really bad since the
> > > > > > +      * GPU has just written some new data to main memory, but the CPU cache
> > > > > > +      * is still valid and now contains stale data. As a result the next time
> > > > > > +      * we do a cached read with the CPU, we are rewarded with stale data.
> > > > > > +      * Likewise if the cache is later flushed, we might be rewarded with
> > > > > > +      * overwriting main memory with stale data.
> > > > > > +      *
> > > > > > +      * I915_BO_CACHE_COHERENT_FOR_WRITE:
> > > > > > +      *
> > > > > > +      * When writing through the CPU cache, the GPU is still coherent. Note
> > > > > > +      * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> > > > > > +      *
> > > > > > +      * This is never set when I915_CACHE_NONE is used for @cache_level,
> > > > > > +      * where instead we have to manually flush the caches after writing
> > > > > > +      * through the CPU cache. For other cache levels this should be set and
> > > > > > +      * the object is therefore considered coherent for both reads and writes
> > > > > > +      * through the CPU cache.
> > > > >
> > > > > I don't remember why we have this read vs. write split and this new
> > > > > documentation doesn't seem to really explain it either.
> > > >
> > > > Hmm, I attempted to explain that earlier:
> > > >
> > > > * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> > > > * the CPU cache are always coherent, regardless of the @cache_level. On
> > > > * snooping based platforms this is not the case, unless the full
> > > > * I915_CACHE_LLC or similar setting is used.
> > > > *
> > > > * As a result of this we need to track coherency separately for reads
> > > > * and writes, in order to avoid superfluous flushing on shared-LLC
> > > > * platforms, for reads.
> > > >
> > > > So AFAIK it's just because shared-LLC can be coherent for reads, while
> > > > also not being coherent for writes(CACHE_NONE),
> > >
> > > CPU vs. GPU is fully coherent when it comes to LLC. Or at least I've
> > > never heard of any mechanism that would make it only partially coherent.
> > 
> > What do you mean by "comes to LLC", are you talking about HAS_LLC() or
> > I915_CACHE_LLC?
> 
> I'm talking about the actual cache.
> 
> > 
> > If you set I915_CACHE_LLC, then yes it is fully coherent for both
> > HAS_LLC() and HAS_SNOOP().
> > 
> > If you set I915_CACHE_NONE, then reads are still coherent on
> > HAS_LLC(),
> 
> Reads and writes both. The only thing that's not coherent is the
> display engine.

There's a lot of code which seems to disagree, plus there's now this new
MOCS thing. I really hope we don't have all those cache coherency bits
just because the code complexity is entertaining?

Are there some igts to verify this all? Or selftests probably more
appropriate.
-Daniel


> > for HAS_SNOOP() they are not. Or at least that is the
> > existing behaviour in the driver AFAIK.
> > 
> > >
> > > --
> > > Ville Syrjälä
> > > Intel
> 
> -- 
> Ville Syrjälä
> Intel
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
