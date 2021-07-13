Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAE53C7669
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 20:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7B16E10C;
	Tue, 13 Jul 2021 18:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DD66E10B;
 Tue, 13 Jul 2021 18:24:50 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id h9so6925625qvs.0;
 Tue, 13 Jul 2021 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M25GRmxhN3coWP5g7ldzeVuV2E2ymK1xr3/zB8no7cQ=;
 b=NxlZ0uFVCeISGsW8p/YfM1DepPTfg1M0tJrYlcLlVIlwrDiUI+xIwVGXkJgtn4sfNA
 iD2qE6nSkpY6mUl4zQzK7liUSxR/o9qCZ5hEbCiRXXlpE3yRgVtfSeO7rPolO0qdetEL
 aIgXicVSqk3URzKuka8kvd6wLEIuVNYzUiaf2ujJHqXzl46OMtMH363/5YDnAs4K9/nT
 fSkM2fipLkbzO74TG0NM6OG0W1IsPoj2OXV+pSPxPJd80lkhJjr30tpGzSlb8RtSI3Ck
 DzPF7OHgdgRrWyYV0bJfrU9EasxeGBkieJthokjG+F2aWVr81F7B4UfJLGeT3USi+WrV
 tp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M25GRmxhN3coWP5g7ldzeVuV2E2ymK1xr3/zB8no7cQ=;
 b=lNw30xRQxZOeon9VbsKIyMpq/MUYKCeH8b/Jtz/aq7XViu0Aa/falnl6EAjMh8LoZu
 gcXrZA+d6fKIul5roO2jzgIzFjIBhqa91o3bn2uCjSIk1J4OIC1x5OKNvgdxIqhkAuP6
 bzziiMRXPnIJVe4XvPJL2jL5U1kR6hGhhEEzkTtbDGoj2eZQj9W2JZnEAn9MLL5Xy6Df
 /bI54f+wmSAjL6lMBTOoZgAl9rbQoVHOz0Anx4XICJ7aVYyzKEFk/CqB3OXXRhY4RalG
 tWRno2ve4YEPFpnw93auchZ27pVVChyXdeRWKGfk8EbJO0lR10o9im1fkggumdmYtoQW
 um4w==
X-Gm-Message-State: AOAM531hNvCOgWXdKad/j9+KlVG5aBsmKdvOnWO5idx4mOz4ynxraook
 i2wFA06auwcOPUMu03aOznzD698msq615rUmvAE=
X-Google-Smtp-Source: ABdhPJzrR+aTFnNLZA8JP3rleR3OLCQV7axs9e/jr+WW+2qLMFHPs8e1btEowiZySJQ72hLfn8EAJmpn1M7BVcc4MOQ=
X-Received: by 2002:a05:6214:19c3:: with SMTP id
 j3mr6284666qvc.60.1626200689969; 
 Tue, 13 Jul 2021 11:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210713104554.2381406-1-matthew.auld@intel.com>
 <YO23Y3PUS22FaXDC@intel.com>
 <CAM0jSHOx=WVbzfQzn=kL-5qaG4B3dxPLOimkvUdv6HFJymZeZw@mail.gmail.com>
 <YO3RsxZHUe5imN3q@intel.com>
In-Reply-To: <YO3RsxZHUe5imN3q@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 13 Jul 2021 19:24:23 +0100
Message-ID: <CAM0jSHOsqPUOWCJu_Ti3gW-fnpWF2CtUoo-qt-aMWExAwDDT5A@mail.gmail.com>
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

On Tue, 13 Jul 2021 at 18:47, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Jul 13, 2021 at 05:13:37PM +0100, Matthew Auld wrote:
> > On Tue, 13 Jul 2021 at 16:55, Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Tue, Jul 13, 2021 at 11:45:50AM +0100, Matthew Auld wrote:
> > > > +     /**
> > > > +      * @cache_coherent:
> > > > +      *
> > > > +      * Track whether the pages are coherent with the GPU if readi=
ng or
> > > > +      * writing through the CPU cache.
> > > > +      *
> > > > +      * This largely depends on the @cache_level, for example if t=
he object
> > > > +      * is marked as I915_CACHE_LLC, then GPU access is coherent f=
or both
> > > > +      * reads and writes through the CPU cache.
> > > > +      *
> > > > +      * Note that on platforms with shared-LLC support(HAS_LLC) re=
ads through
> > > > +      * the CPU cache are always coherent, regardless of the @cach=
e_level. On
> > > > +      * snooping based platforms this is not the case, unless the =
full
> > > > +      * I915_CACHE_LLC or similar setting is used.
> > > > +      *
> > > > +      * As a result of this we need to track coherency separately =
for reads
> > > > +      * and writes, in order to avoid superfluous flushing on shar=
ed-LLC
> > > > +      * platforms, for reads.
> > > > +      *
> > > > +      * I915_BO_CACHE_COHERENT_FOR_READ:
> > > > +      *
> > > > +      * When reading through the CPU cache, the GPU is still coher=
ent. Note
> > > > +      * that no data has actually been modified here, so it might =
seem
> > > > +      * strange that we care about this.
> > > > +      *
> > > > +      * As an example, if some object is mapped on the CPU with wr=
ite-back
> > > > +      * caching, and we read some page, then the cache likely now =
contains
> > > > +      * the data from that read. At this point the cache and main =
memory
> > > > +      * match up, so all good. But next the GPU needs to write som=
e data to
> > > > +      * that same page. Now if the @cache_level is I915_CACHE_NONE=
 and the
> > > > +      * the platform doesn't have the shared-LLC, then the GPU wil=
l
> > > > +      * effectively skip invalidating the cache(or however that wo=
rks
> > > > +      * internally) when writing the new value.  This is really ba=
d since the
> > > > +      * GPU has just written some new data to main memory, but the=
 CPU cache
> > > > +      * is still valid and now contains stale data. As a result th=
e next time
> > > > +      * we do a cached read with the CPU, we are rewarded with sta=
le data.
> > > > +      * Likewise if the cache is later flushed, we might be reward=
ed with
> > > > +      * overwriting main memory with stale data.
> > > > +      *
> > > > +      * I915_BO_CACHE_COHERENT_FOR_WRITE:
> > > > +      *
> > > > +      * When writing through the CPU cache, the GPU is still coher=
ent. Note
> > > > +      * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> > > > +      *
> > > > +      * This is never set when I915_CACHE_NONE is used for @cache_=
level,
> > > > +      * where instead we have to manually flush the caches after w=
riting
> > > > +      * through the CPU cache. For other cache levels this should =
be set and
> > > > +      * the object is therefore considered coherent for both reads=
 and writes
> > > > +      * through the CPU cache.
> > >
> > > I don't remember why we have this read vs. write split and this new
> > > documentation doesn't seem to really explain it either.
> >
> > Hmm, I attempted to explain that earlier:
> >
> > * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> > * the CPU cache are always coherent, regardless of the @cache_level. On
> > * snooping based platforms this is not the case, unless the full
> > * I915_CACHE_LLC or similar setting is used.
> > *
> > * As a result of this we need to track coherency separately for reads
> > * and writes, in order to avoid superfluous flushing on shared-LLC
> > * platforms, for reads.
> >
> > So AFAIK it's just because shared-LLC can be coherent for reads, while
> > also not being coherent for writes(CACHE_NONE),
>
> CPU vs. GPU is fully coherent when it comes to LLC. Or at least I've
> never heard of any mechanism that would make it only partially coherent.

What do you mean by "comes to LLC", are you talking about HAS_LLC() or
I915_CACHE_LLC?

If you set I915_CACHE_LLC, then yes it is fully coherent for both
HAS_LLC() and HAS_SNOOP().

If you set I915_CACHE_NONE, then reads are still coherent on
HAS_LLC(), for HAS_SNOOP() they are not. Or at least that is the
existing behaviour in the driver AFAIK.

>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
