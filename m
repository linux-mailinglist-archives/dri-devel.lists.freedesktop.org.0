Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EB13CBB4F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 19:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A646E113;
	Fri, 16 Jul 2021 17:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5786E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 17:39:00 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id a16so16049644ybt.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=edXZunvExCiapOEC1nPnCzNYKK5YjTngpp/KAVb1P98=;
 b=cJCn/GmoT8RZINm1VHEPGxKXGpnSXH0KfTmjjZRLzFMrx/1mXRNxVohoGCUUI+TRWD
 vZt+JQdz84KSnBtmZeIeN+dAz6H6marwdSRrpP/cyNMYsIDl9472LJCyZs5x7aEUiuJP
 AZhjn/W5BXxQm34GEoNSobYcBN9FBDiFbqAZ20KXnk8L8VNu/MFr0ka4xXz/rJ6aUMSm
 vcWsgZXGoF8YyeQ7Gqw2DjsrP2hGRqs7GsqMjzL6GXnQxF49T57jeuwn6V9qnLZqPuaU
 laRtAgb7gK0viwTP71cubGdgJSyU0A5RdndWOM/rsWHmCZZ34seQkWhE9ma9iXw1wSxk
 RipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=edXZunvExCiapOEC1nPnCzNYKK5YjTngpp/KAVb1P98=;
 b=XEEjQJrVVWp811LCOR6XVXIRXysVbKRm9Uc46JVnu37nFFnnsw3L00XI8GbbQWch5g
 vmlFiq8xFXjUQF40H1SpsHKTLO438ybyMUEo3+PJQQKN6+/uBBsbQsUyhbrufZIABWO7
 6zpSqU/SSuQppI4VVl0g1/XPl+JGJOMIMffrhsOd0u7gKka95KjF1uCuaMRWNLpyNBQZ
 o9kZvC7+8Bkxt7inGkNZDYbjLsUd/x+MK6qUCVcEbFgJyZGnu3YdMUrbjn1x9KBKH72o
 uf9bNswaRWMYF0X6kh5Gi08/9j0mrzqMQWziPhnKFCeemBq9WgnqFtwmMTwLjhyiRznG
 Jq5w==
X-Gm-Message-State: AOAM532EP660/UE3hB7aAhxfc5GslQ2UwNfrWEApvxMNwB6svTlaSaX3
 EGAyA2Ccr9iw9VAgigTlLEzR04y6xR9jSIC0+jmkhA==
X-Google-Smtp-Source: ABdhPJyEurJ2Yy8ZzesY6OuoIZYPyM0kIOD1ZMdxGBWTHKiBa/Bu2zVq0c4TNnX2NKE3sGwqhrQ/nJjF+L1fVTZtp5o=
X-Received: by 2002:a25:2f89:: with SMTP id
 v131mr14586784ybv.469.1626457139950; 
 Fri, 16 Jul 2021 10:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-6-jason@jlekstrand.net>
 <CAM0jSHPu1EBfnAJ06Dp51a1Qbg+9QnmP=EyUfYXS0fZnJzxR8g@mail.gmail.com>
 <CAOFGe95gEUNsjCh+30AXhrQLz8_OKbHwwxv=_OhaGKQxGpvcew@mail.gmail.com>
 <CAM0jSHO4EU_gBXo-56GtDJffezfVHYoUhCeOnb97ZgBj5vyA7Q@mail.gmail.com>
 <CAM0jSHOHCr6ppLhUBVSd_JUnBDFAcsYEYtma01benzs_nkhtGg@mail.gmail.com>
In-Reply-To: <CAM0jSHOHCr6ppLhUBVSd_JUnBDFAcsYEYtma01benzs_nkhtGg@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 16 Jul 2021 12:38:49 -0500
Message-ID: <CAOFGe95YYjS=k9SnQg0EuOR02FWGPyCAvJH7Ymm6ZhiHq5iNCw@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 11:00 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 16 Jul 2021 at 16:52, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Fri, 16 Jul 2021 at 15:10, Jason Ekstrand <jason@jlekstrand.net> wro=
te:
> > >
> > > On Fri, Jul 16, 2021 at 8:54 AM Matthew Auld
> > > <matthew.william.auld@gmail.com> wrote:
> > > >
> > > > On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net>=
 wrote:
> > > > >
> > > > > Whenever we had a user object (n_placements > 0), we were ignorin=
g
> > > > > obj->mm.region and always putting obj->placements[0] as the reque=
sted
> > > > > region.  For LMEM+SMEM objects, this was causing them to get shov=
ed into
> > > > > LMEM on every i915_ttm_get_pages() even when SMEM was requested b=
y, say,
> > > > > i915_gem_object_migrate().
> > > >
> > > > i915_ttm_migrate calls i915_ttm_place_from_region() directly with t=
he
> > > > requested region, so there shouldn't be an issue with migration rig=
ht?
> > > > Do you have some more details?
> > >
> > > With i915_ttm_migrate directly, no.  But, in the last patch in the
> > > series, we're trying to migrate LMEM+SMEM buffers into SMEM on
> > > attach() and pin it there.  This blows up in a very unexpected (IMO)
> > > way.  The flow goes something like this:
> > >
> > >  - Client attempts a dma-buf import from another device
> > >  - In attach() we call i915_gem_object_migrate() which calls
> > > i915_ttm_migrate() which migrates as requested.
> > >  - Once the migration is complete, we call i915_gem_object_pin_pages(=
)
> > > which calls i915_ttm_get_pages() which depends on
> > > i915_ttm_placement_from_obj() and so migrates it right back to LMEM.
> >
> > The mm.pages must be NULL here, otherwise it would just increment the
> > pages_pin_count?

Given that the test is using the ____four_underscores version, it
doesn't have that check.  However, this executes after we've done the
dma-buf import which pinned pages.  So we should definitely have
pages.

> > >
> > > Maybe the problem here is actually that our TTM code isn't respecting
> > > obj->mm.pages_pin_count?
> >
> > I think if the resource is moved, we always nuke the mm.pages after
> > being notified of the move. Also TTM is also not allowed to move
> > pinned buffers.
> >
> > I guess if we are evicted/swapped, so assuming we are not holding the
> > object lock, and it's not pinned, the future call to get_pages() will
> > see mm.pages =3D NULL, even though the ttm_resource is still there, and
> > because we prioritise the placements[0], instead of mm.region we end
> > up moving it for no good reason. But in your case you are holding the
> > lock, or it's pinned? Also is this just with the selftest, or
> > something real?
>
> Or at least in the selftest I see ____i915_gem_object_get_pages()
> which doesn't even consider the mm.pages AFAIK.

The bogus migration is happening as part of the
__i915_gem_object_get_pages() (2 __underscores) call in
i915_gem_dmabuf_attach (see last patch).  That code is attempting to
migrate the BO to SMEM and then pin it there using the obvious calls
to do so.  However, in the pin_pages call, it gets implicitly migrated
back to LMEM thanks to i915_ttm_get_pages().  Why is _get_pages()
migrating things at all?

--Jason

> >
> > >
> > > In case you can't tell, I really have no clue what I'm doing here.
> > > I'm really stumbling around in the dark finding things that make my
> > > bug go away.  I'm happy for the feedback.
> > >
> > > --Jason
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +--
> > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gp=
u/drm/i915/gem/i915_gem_ttm.c
> > > > > index d30f274c329c7..5985e994d56cf 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > @@ -150,8 +150,7 @@ i915_ttm_placement_from_obj(const struct drm_=
i915_gem_object *obj,
> > > > >         unsigned int i;
> > > > >
> > > > >         placement->num_placement =3D 1;
> > > > > -       i915_ttm_place_from_region(num_allowed ? obj->mm.placemen=
ts[0] :
> > > > > -                                  obj->mm.region, requested, fla=
gs);
> > > > > +       i915_ttm_place_from_region(obj->mm.region, requested, fla=
gs);
> > > > >
> > > > >         /* Cache this on object? */
> > > > >         placement->num_busy_placement =3D num_allowed;
> > > > > --
> > > > > 2.31.1
> > > > >
