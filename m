Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1863C7545
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4AA890FE;
	Tue, 13 Jul 2021 16:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A41892CB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:50:24 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 68-20020a4a00470000b0290258a7ff4058so5560635ooh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z0jO+jJEyay3NTrDe9eWC2LZD+pl5Ioe43IeSwaM6sQ=;
 b=d4Geo+xzUnBF9WyHS6i8UQzuQ3DSUt/d9KfQKY5rx5ETR5DXxfzW1u2yjCJuJ/kljg
 3GLDLxiTs/LFxRq3zMtd9Ro8Sz7Hhzu+FG0rcIYEw6pjEp2HRYcJiv7aPKDQWAcDmqqE
 MRxS2Junb4lOYOmluweDfOuBDXncWM4FQR8vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z0jO+jJEyay3NTrDe9eWC2LZD+pl5Ioe43IeSwaM6sQ=;
 b=pY3EnRJlGoQvGbzSKgWzXO4pFODVGdevQ4I2BO08u+d8hP+h0mzSlk6Ub5wnxIr+YX
 TYk8SztVQthUqQp8PT4bz7MCDcuFwplAItly15y9AUHzAIv4B0l72X7+zNGravz9xxKv
 F7uIap4BRaT2HDwl4lfgl6svL3viP95SKS80oIXF+80P70+KHvLQYLBlKbmgLEePxPk8
 /z5y37Ypno4d/SlWUIToTunWfXja1CJIKE9nzrsD6GOK9MIT0v2fsyhWL5fQrBWmfHjo
 0MtaEtXdtpP6Rf4fiR9c6OFCk0lpRtwKVpdFY1e6f4XHJbzEPcopJoxT0OruOAYPsPz0
 dzmA==
X-Gm-Message-State: AOAM533cKvo8cmik5XXbnBIpxuMT7O6Ujt0yp8IR/E0ko1+TCxdU89Vl
 H3UI0jnbsle7WWJ1XrlihI71lbMgL7i7mkJ89NWZpY9zgXI=
X-Google-Smtp-Source: ABdhPJwqcBJebBr5NGAREt95GX72S8ugjsBeXWZh/7OxDfcRTYf4LSkCzo45q7dLMOWhtOX/3nHOkXbD+pz4Ri0+4uk=
X-Received: by 2002:a4a:9b99:: with SMTP id x25mr4297425ooj.85.1626195024115; 
 Tue, 13 Jul 2021 09:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210713104554.2381406-1-matthew.auld@intel.com>
 <YO23Y3PUS22FaXDC@intel.com>
 <CAM0jSHOx=WVbzfQzn=kL-5qaG4B3dxPLOimkvUdv6HFJymZeZw@mail.gmail.com>
In-Reply-To: <CAM0jSHOx=WVbzfQzn=kL-5qaG4B3dxPLOimkvUdv6HFJymZeZw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 18:50:12 +0200
Message-ID: <CAKMK7uEfUtxb8FcnNQjvpMwLpLpgDv9GYvBg9caou+Rju=hYaQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: document caching related bits
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 6:14 PM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
> On Tue, 13 Jul 2021 at 16:55, Ville Syrj=C3=A4l=C3=A4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Tue, Jul 13, 2021 at 11:45:50AM +0100, Matthew Auld wrote:
> > > +     /**
> > > +      * @cache_coherent:
> > > +      *
> > > +      * Track whether the pages are coherent with the GPU if reading=
 or
> > > +      * writing through the CPU cache.
> > > +      *
> > > +      * This largely depends on the @cache_level, for example if the=
 object
> > > +      * is marked as I915_CACHE_LLC, then GPU access is coherent for=
 both
> > > +      * reads and writes through the CPU cache.
> > > +      *
> > > +      * Note that on platforms with shared-LLC support(HAS_LLC) read=
s through
> > > +      * the CPU cache are always coherent, regardless of the @cache_=
level. On
> > > +      * snooping based platforms this is not the case, unless the fu=
ll
> > > +      * I915_CACHE_LLC or similar setting is used.
> > > +      *
> > > +      * As a result of this we need to track coherency separately fo=
r reads
> > > +      * and writes, in order to avoid superfluous flushing on shared=
-LLC
> > > +      * platforms, for reads.
> > > +      *
> > > +      * I915_BO_CACHE_COHERENT_FOR_READ:
> > > +      *
> > > +      * When reading through the CPU cache, the GPU is still coheren=
t. Note
> > > +      * that no data has actually been modified here, so it might se=
em
> > > +      * strange that we care about this.
> > > +      *
> > > +      * As an example, if some object is mapped on the CPU with writ=
e-back
> > > +      * caching, and we read some page, then the cache likely now co=
ntains
> > > +      * the data from that read. At this point the cache and main me=
mory
> > > +      * match up, so all good. But next the GPU needs to write some =
data to
> > > +      * that same page. Now if the @cache_level is I915_CACHE_NONE a=
nd the
> > > +      * the platform doesn't have the shared-LLC, then the GPU will
> > > +      * effectively skip invalidating the cache(or however that work=
s
> > > +      * internally) when writing the new value.  This is really bad =
since the
> > > +      * GPU has just written some new data to main memory, but the C=
PU cache
> > > +      * is still valid and now contains stale data. As a result the =
next time
> > > +      * we do a cached read with the CPU, we are rewarded with stale=
 data.
> > > +      * Likewise if the cache is later flushed, we might be rewarded=
 with
> > > +      * overwriting main memory with stale data.
> > > +      *
> > > +      * I915_BO_CACHE_COHERENT_FOR_WRITE:
> > > +      *
> > > +      * When writing through the CPU cache, the GPU is still coheren=
t. Note
> > > +      * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> > > +      *
> > > +      * This is never set when I915_CACHE_NONE is used for @cache_le=
vel,
> > > +      * where instead we have to manually flush the caches after wri=
ting
> > > +      * through the CPU cache. For other cache levels this should be=
 set and
> > > +      * the object is therefore considered coherent for both reads a=
nd writes
> > > +      * through the CPU cache.
> >
> > I don't remember why we have this read vs. write split and this new
> > documentation doesn't seem to really explain it either.
>
> Hmm, I attempted to explain that earlier:
>
> * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> * the CPU cache are always coherent, regardless of the @cache_level. On
> * snooping based platforms this is not the case, unless the full
> * I915_CACHE_LLC or similar setting is used.
> *
> * As a result of this we need to track coherency separately for reads
> * and writes, in order to avoid superfluous flushing on shared-LLC
> * platforms, for reads.
>
> So AFAIK it's just because shared-LLC can be coherent for reads, while
> also not being coherent for writes(CACHE_NONE), so being able to track
> each separately is kind of needed to avoid unnecessary flushing for
> the read cases i.e simple boolean for coherent vs non-coherent is not
> enough.
>
> I can try to reword things to make that more clear.

Maybe highlight the security aspect a bit more: When reads are always
coherent, we don't have to force the clflush. If reads are not
coherent we must ensure that the clflush has finished before userspace
can get at the backing storage, like writing ptes and similar things.
Writes otoh can only result in userspace eating cacheling corruption
if it races against the kernel (by e.g. trying to predict where we'll
bind a buffer and issuing gpu access to that location before the
buffer is actually bound from some other engine in parallel with an
execbuf that binds the buffer).

Atm we don't do a great job with that, but that's something that I
think is getting looked into.
-Daniel

> > Is it for optimizing some display related case where we can omit the
> > invalidates but still have to do the writeback to keep the display
> > engine happy?
> >
> > --
> > Ville Syrj=C3=A4l=C3=A4
> > Intel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
