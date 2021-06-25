Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14C3B3E29
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 10:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A326ECE3;
	Fri, 25 Jun 2021 08:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ABE6ECE9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 08:03:18 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id u11so10507520oiv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 01:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TrbMCl6sVPLRSHP5Bq+bNTHMKSmfLfsLeFdRsNQGs1g=;
 b=iOUfuN6l5QiCfxWR5QxOMwfhq+6ws2WYbn3Aake5d8TV1H9k98BvmBJGEybMO325u0
 2aFv6n6Nmn/OjdTMXNdS3IRvRIrMnQwVOQqa2pH4ZFjvA/TyTrokUYfbe+SLrf/Bkiw1
 mrY1q1cqRaphCrTplofKRYAPIUNPs2khyww+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TrbMCl6sVPLRSHP5Bq+bNTHMKSmfLfsLeFdRsNQGs1g=;
 b=mtWhIZzqn1Esq1jagBtl1fgTzrh9MRw2zbCDeLWLrc05wxZiH3FzjH3Rf29loXRxkZ
 wfksRQS5KUzzXRCd3RtQEOugw9owpIkl9mC85zg9/UYxbXoA8KkOWmF+OxlEql5SsiMO
 Y/iJ+Lx5dHGYbz9T3wWbsZqPuqz5IXoS/tMHlFHinMJb9jhUxwq2zyDgDtGqLInokn32
 iBkcBbU6ez9Ed2tqCE4gRaTBc0exYEdklR3Mt6O8agzHprATP22pJiYjv2SPBWiM4zpl
 6Nx2qSGTwvFAiSFn2+r+GlCYMcHdB9DAQ0eu4mWht4RSLRoUkCCyDk5wmHTJr7jsCeG2
 PVgQ==
X-Gm-Message-State: AOAM532we1/m/PeOwB2ko3BNnYDZ0zJ5O9/pj/eAWES1AFZ66SNmtZ/e
 n3QgFgpL6CiSySWQundIUDP2QPrp9GAP6RH/p6SwRw==
X-Google-Smtp-Source: ABdhPJy1AJsJIRsqUJK1z58l9LOhiHTgv0CEIgHePd0ecR4zNoGitRlRZNrM41yFok8+7dsrQmCve6iMWa2ZEbg7u3w=
X-Received: by 2002:aca:1a0c:: with SMTP id a12mr10133908oia.14.1624608197755; 
 Fri, 25 Jun 2021 01:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210624112914.311984-1-thomas.hellstrom@linux.intel.com>
 <CAKMK7uEeV0nvf+4ae2rYQHMBQ2rm2NNKT+n8CvDU=gdaEXHHBw@mail.gmail.com>
 <c9c9ab2d-e55c-6426-1d4f-20248040f111@linux.intel.com>
In-Reply-To: <c9c9ab2d-e55c-6426-1d4f-20248040f111@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 25 Jun 2021 10:03:06 +0200
Message-ID: <CAKMK7uGRDwda+0b8ZPsY7QdnEoV4pztJ3QWbJSrqNGLNv0QM0Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Reinstate the mmap ioctl for
 some platforms
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 25, 2021 at 9:48 AM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Op 24-06-2021 om 14:04 schreef Daniel Vetter:
> > On Thu, Jun 24, 2021 at 1:29 PM Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> >> Reinstate the mmap ioctl for all current integrated platforms.
> >> The intention was really to have it disabled for discrete graphics
> >> where we enforce a single mmap mode.
> >>
> >> Fixes: 35cbd91eb541 ("drm/i915: Disable mmap ioctl for gen12+")
> >> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com=
>
> >> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> >> ---
> >> v2:
> >> - Added a R-B.
> >> - Fixed up the code comment a bit.
> >> ---
> >>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_mman.c
> >> index 2fd155742bd2..4f50a508c7a0 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> >> @@ -62,10 +62,11 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *=
data,
> >>         struct drm_i915_gem_object *obj;
> >>         unsigned long addr;
> >>
> >> -       /* mmap ioctl is disallowed for all platforms after TGL-LP.  T=
his also
> >> -        * covers all platforms with local memory.
> >> +       /*
> >> +        * mmap ioctl is disallowed for all discrete platforms,
> >> +        * and for all platforms with GRAPHICS_VER > 12.
> >>          */
> >> -       if (GRAPHICS_VER(i915) >=3D 12 && !IS_TIGERLAKE(i915))
> >> +       if (IS_DGFX(i915) || GRAPHICS_VER(i915) > 12)
> >>                 return -EOPNOTSUPP;
> >>
> >>         if (args->flags & ~(I915_MMAP_WC))
> >> --
> >> 2.31.1
> >>
> >
> Would keeping this change unapplied break any currently shipping platform=
s? If not, could we leave it as-is?

It breaks media on rkl/adl afaik. Which should be part of the commit messag=
e.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
