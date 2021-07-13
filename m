Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659933C7401
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D826E0EF;
	Tue, 13 Jul 2021 16:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F8D6E0EF;
 Tue, 13 Jul 2021 16:14:06 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id q190so22167609qkd.2;
 Tue, 13 Jul 2021 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kSdl91nubrCa9A/aIk2XVb73CpGtetW6fW/0nYa9iQo=;
 b=mhkucmoqWj0OLAmtFx9KmK6YW9jTfR0APIcHtk22naczNAfP3fUm0LkLoY+51DVW3Y
 KGk2ErHxf+QPP/QqZTbN3ahIpRimzR6PoQl69z9ZWvWUb1qsNDsyIFeREEBYBYS44naL
 sAXYj1ZbZzVvI3sr+sEUMLvEWkHarBUzB0OaKEUHQXuKjWadBDHR0Z0DikcD4FtuFrYg
 AlZqZmoPrRmSoZth/S2TS175nFW5A4CaYZ5PVnROKCcgdA8a5DFscr8PTNoHatDw1ZDH
 NHD10w05TjmNeqxrz6+JiIVcPh3fggHucAAOWrjTgkuFXqv3OPdqrQ7z+ZxE6rftIRAq
 rzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kSdl91nubrCa9A/aIk2XVb73CpGtetW6fW/0nYa9iQo=;
 b=Arsh5K9f3l6uTHareG43jR7yqj0HFZbfbJ3v/cC9EfH7HIYKh/fayfwaYFTIEUCqRC
 xDPMCe0nha+nZFuQOKcXaOMu67T05Ropkza3+E5ajuRkerMrdTbN0IjWvSlZVf54CoBg
 iipyuhu2Z/Q/XNOrMUqbMFm+l9sh0iD/r0TLqs50TVIiJT4odTHvzW3EjS42MnnX5I9r
 rHqZ03LLnN557EgYJCjQobklTcHIx0b4nx+rpTub/h8zPBaOY6AL+KniX2n9QeAJKPwG
 demqSsw6bFuAzVZwi4T7L2rqN5slY7XtcgkND/RZnTgAA+ek0uSwwdkqYSIvFlm8HQ7f
 8jfQ==
X-Gm-Message-State: AOAM530/PeCMfSdG785sNjUxtZ7VNtpMTnsyF4HJUrCPayt9mmGtaCfy
 I9WzeEi0apadqI+P0TOvZwI5cP0kmo3w5FsStz0=
X-Google-Smtp-Source: ABdhPJyIpC+FMhA5wB2KTc5dyUJn7rraGoU3vcanohts4VYBMOKmtOH3bxqkWGzMzYW5G799jofsOIVGSXRURN+VsPQ=
X-Received: by 2002:a37:4388:: with SMTP id q130mr4936952qka.460.1626192846084; 
 Tue, 13 Jul 2021 09:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210713104554.2381406-1-matthew.auld@intel.com>
 <YO23Y3PUS22FaXDC@intel.com>
In-Reply-To: <YO23Y3PUS22FaXDC@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 13 Jul 2021 17:13:37 +0100
Message-ID: <CAM0jSHOx=WVbzfQzn=kL-5qaG4B3dxPLOimkvUdv6HFJymZeZw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: document caching related bits
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jul 2021 at 16:55, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Jul 13, 2021 at 11:45:50AM +0100, Matthew Auld wrote:
> > +     /**
> > +      * @cache_coherent:
> > +      *
> > +      * Track whether the pages are coherent with the GPU if reading o=
r
> > +      * writing through the CPU cache.
> > +      *
> > +      * This largely depends on the @cache_level, for example if the o=
bject
> > +      * is marked as I915_CACHE_LLC, then GPU access is coherent for b=
oth
> > +      * reads and writes through the CPU cache.
> > +      *
> > +      * Note that on platforms with shared-LLC support(HAS_LLC) reads =
through
> > +      * the CPU cache are always coherent, regardless of the @cache_le=
vel. On
> > +      * snooping based platforms this is not the case, unless the full
> > +      * I915_CACHE_LLC or similar setting is used.
> > +      *
> > +      * As a result of this we need to track coherency separately for =
reads
> > +      * and writes, in order to avoid superfluous flushing on shared-L=
LC
> > +      * platforms, for reads.
> > +      *
> > +      * I915_BO_CACHE_COHERENT_FOR_READ:
> > +      *
> > +      * When reading through the CPU cache, the GPU is still coherent.=
 Note
> > +      * that no data has actually been modified here, so it might seem
> > +      * strange that we care about this.
> > +      *
> > +      * As an example, if some object is mapped on the CPU with write-=
back
> > +      * caching, and we read some page, then the cache likely now cont=
ains
> > +      * the data from that read. At this point the cache and main memo=
ry
> > +      * match up, so all good. But next the GPU needs to write some da=
ta to
> > +      * that same page. Now if the @cache_level is I915_CACHE_NONE and=
 the
> > +      * the platform doesn't have the shared-LLC, then the GPU will
> > +      * effectively skip invalidating the cache(or however that works
> > +      * internally) when writing the new value.  This is really bad si=
nce the
> > +      * GPU has just written some new data to main memory, but the CPU=
 cache
> > +      * is still valid and now contains stale data. As a result the ne=
xt time
> > +      * we do a cached read with the CPU, we are rewarded with stale d=
ata.
> > +      * Likewise if the cache is later flushed, we might be rewarded w=
ith
> > +      * overwriting main memory with stale data.
> > +      *
> > +      * I915_BO_CACHE_COHERENT_FOR_WRITE:
> > +      *
> > +      * When writing through the CPU cache, the GPU is still coherent.=
 Note
> > +      * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> > +      *
> > +      * This is never set when I915_CACHE_NONE is used for @cache_leve=
l,
> > +      * where instead we have to manually flush the caches after writi=
ng
> > +      * through the CPU cache. For other cache levels this should be s=
et and
> > +      * the object is therefore considered coherent for both reads and=
 writes
> > +      * through the CPU cache.
>
> I don't remember why we have this read vs. write split and this new
> documentation doesn't seem to really explain it either.

Hmm, I attempted to explain that earlier:

* Note that on platforms with shared-LLC support(HAS_LLC) reads through
* the CPU cache are always coherent, regardless of the @cache_level. On
* snooping based platforms this is not the case, unless the full
* I915_CACHE_LLC or similar setting is used.
*
* As a result of this we need to track coherency separately for reads
* and writes, in order to avoid superfluous flushing on shared-LLC
* platforms, for reads.

So AFAIK it's just because shared-LLC can be coherent for reads, while
also not being coherent for writes(CACHE_NONE), so being able to track
each separately is kind of needed to avoid unnecessary flushing for
the read cases i.e simple boolean for coherent vs non-coherent is not
enough.

I can try to reword things to make that more clear.

>
> Is it for optimizing some display related case where we can omit the
> invalidates but still have to do the writeback to keep the display
> engine happy?
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
