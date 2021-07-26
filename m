Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D73D5EC8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E1A6EB8C;
	Mon, 26 Jul 2021 15:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45E16EB21;
 Mon, 26 Jul 2021 15:56:33 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 190so9239943qkk.12;
 Mon, 26 Jul 2021 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e9XVhRaH1TczqCa76eLVn8zNrWt+6l3OLxw4Ubk1m8A=;
 b=TXTQAfGj3PduEUVkjW5W0QTA73IakKw9lnBCYW/1B/USOYeKZRM5pc2CxFFhweVM4a
 1yS2YR7mvY//3yv3fXfgIs1fKvgMUTx1+XzGKv/R1WYshNlD0t5DHtxJxDYmarA8758u
 PQoAiU3IcWPURPWisnEy+EPd8VYtNqPJnhSmNdYzAA4pSHK0DgJcRgtS8qRIN6ujCSSl
 GBocc5SOexvEYeOF0UirQiE83OTrGzLNuUe4JO9X0jnWxx460l8ZKpa58v6r4iVUTgc0
 QtYM0V6SM787A2WdRoPEIfVh4NyKF3D10wQLCa+ao41PspP3gOe72Sz7VKIa5GlwdfjY
 qeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e9XVhRaH1TczqCa76eLVn8zNrWt+6l3OLxw4Ubk1m8A=;
 b=oNHaYr5e2PF0mEIW05ANpLbM21a9/hiPbE0FNRv+mRWUdUHEeAdvszevkSRM4cVI8i
 xZF3idp4mcfOSdkPtu/w/Q5O0GtkH5sNCUVKZBIjU+ZyoCm6a7OwFkZkqGERseRBDECw
 TOzX6otBKTUaEa6agV0mwsOVLKaaCdWV4wP65LT2xy3uhho86hPZNaODje51eJdOk/bb
 S2hDrmlElSlwESQYD59PhV6Hc9+Dx5oe65P+2dYQFI89jNz+guwloZVhMnoIem1YI8FS
 2oqR5nvvfyyW4BGwwXfarTj6vPf9JOUbuwh3htu1ug/0tATxUYYy60lxr4XJ7Ez8Umsc
 iAuQ==
X-Gm-Message-State: AOAM531wtMkDamJs4ECmEqTVNvSe3PQt3TR4iRgFBFCtCucLuyQRq0/z
 mFlESfpFtNMiyAppB2M7GpjAn/lxqsjMfY3nBEE=
X-Google-Smtp-Source: ABdhPJzU5nTePJPHJcZijY9ess2g1bgz4H2dGpSSB/GSrspqEXuowcE7ApmXIS8PAsf1sfcC5wZlP3kcPAU7urXq50k=
X-Received: by 2002:a05:620a:b1b:: with SMTP id
 t27mr17540412qkg.460.1627314992919; 
 Mon, 26 Jul 2021 08:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210723172142.3273510-1-jason@jlekstrand.net>
 <CAM0jSHOgJQni53DJWP0NWJTAR82PNmb6zgt2Gm-faBd1sDaSHA@mail.gmail.com>
 <CAOFGe95CVvM=7UvH3yBBx9Qr4OPrkRUG7QAXgnSLkWgPGef10g@mail.gmail.com>
 <CAM0jSHNmO8ZGdvLkJhonReHmNXjBkgvjmki-yLmUUkbLTnqeLQ@mail.gmail.com>
 <CAOFGe94ZZxm-cahbrzyDkgXGnXT7yVUiHjYO89-hbG8w2=k+Aw@mail.gmail.com>
In-Reply-To: <CAOFGe94ZZxm-cahbrzyDkgXGnXT7yVUiHjYO89-hbG8w2=k+Aw@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 26 Jul 2021 16:56:07 +0100
Message-ID: <CAM0jSHPANmRWjZGoMTDOgcmNWVVzs+1Wg_9F3hc7GsM_r2u8Wg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915: Migrate memory to SMEM when
 imported cross-device (v8)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Jul 2021 at 16:32, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, Jul 26, 2021 at 10:29 AM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Mon, 26 Jul 2021 at 16:11, Jason Ekstrand <jason@jlekstrand.net> wro=
te:
> > >
> > > On Mon, Jul 26, 2021 at 3:12 AM Matthew Auld
> > > <matthew.william.auld@gmail.com> wrote:
> > > >
> > > > On Fri, 23 Jul 2021 at 18:21, Jason Ekstrand <jason@jlekstrand.net>=
 wrote:
> > > > >
> > > > > This patch series fixes an issue with discrete graphics on Intel =
where we
> > > > > allowed dma-buf import while leaving the object in local memory. =
 This
> > > > > breaks down pretty badly if the import happened on a different ph=
ysical
> > > > > device.
> > > > >
> > > > > v7:
> > > > >  - Drop "drm/i915/gem/ttm: Place new BOs in the requested region"
> > > > >  - Add a new "drm/i915/gem: Call i915_gem_flush_free_objects() in=
 i915_gem_dumb_create()"
> > > > >  - Misc. review feedback from Matthew Auld
> > > > > v8:
> > > > >  - Misc. review feedback from Matthew Auld
> > > > > v9:
> > > > >  - Replace the i915/ttm patch with two that are hopefully more co=
rrect
> > > > >
> > > > > Jason Ekstrand (6):
> > > > >   drm/i915/gem: Check object_can_migrate from object_migrate
> > > > >   drm/i915/gem: Refactor placement setup for i915_gem_object_crea=
te*
> > > > >     (v2)
> > > > >   drm/i915/gem: Call i915_gem_flush_free_objects() in
> > > > >     i915_gem_dumb_create()
> > > > >   drm/i915/gem: Unify user object creation (v3)
> > > > >   drm/i915/gem/ttm: Only call __i915_gem_object_set_pages if need=
ed
> > > > >   drm/i915/gem: Always call obj->ops->migrate unless can_migrate =
fails
> > > > >
> > > > > Thomas Hellstr=C3=B6m (2):
> > > > >   drm/i915/gem: Correct the locking and pin pattern for dma-buf (=
v8)
> > > > >   drm/i915/gem: Migrate to system at dma-buf attach time (v7)
> > > >
> > > > Should I push the series?
> > >
> > > Yes, please.  Do we have a solid testing plan for things like this
> > > that touch discrete?  I tested with mesa+glxgears on my DG1 but
> > > haven't run anything more stressful.
> >
> > I think all we really have are the migration related selftests, and CI
> > is not even running them on DG1 due to other breakage. Assuming you
> > ran these locally, I think we just merge the series?
>
> Works for me.  Yes, I ran them on my TGL+DG1 box.  I've also tested
> both GL and Vulkan PRIME support with the client running on DG1 and
> the compositor running on TGL with this series and everything works
> smooth.

And pushed to drm-intel-gt-next.

>
> --Jason
>
>
> > >
> > > --Jason
> > >
> > >
> > > > >
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 177 ++++++++----=
----
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  58 ++++--
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  20 +-
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  13 +-
> > > > >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 190 ++++++++++++=
+++++-
> > > > >  .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
> > > > >  7 files changed, 341 insertions(+), 136 deletions(-)
> > > > >
> > > > > --
> > > > > 2.31.1
> > > > >
> > > > > _______________________________________________
> > > > > Intel-gfx mailing list
> > > > > Intel-gfx@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
