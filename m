Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28673D5CF8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34216E86E;
	Mon, 26 Jul 2021 15:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F83D6E86E;
 Mon, 26 Jul 2021 15:29:18 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 190so9141726qkk.12;
 Mon, 26 Jul 2021 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yHi9iP8VhJKDy5NqamcgKOvxPvjXye75S+SXX23nOBA=;
 b=fmOEe5cV+8QRTEHiOYo4ktj6O2bksYrTNPtjm+ez5wJZx0b/q+Mf7zhOun54o2LWTb
 N5+MZa4b8FHnbz4Y/82STZo5Gfr5JDowkTuCfZETBkv87JdKF1e9B+SEyk5J37c/JlQt
 PkLPGDaJ2e+CuqC6au4beV9Adr2mBpQXELkRg3YxJyxPLGn/aHvEd2nVbKCmEtwKeEcy
 qZl3BXSPWcUkIwkzYOBmZha+Z+yEs1LljHCTDs1vOanA8f98S95B6yTzl+0kTOffEfKh
 8GGfTj5RFfLqvbu1s7KA6AphLQy8h5yXMyZgk2yV2QPq+0oZ4OnVy42HjTOItBwh6r9p
 llMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yHi9iP8VhJKDy5NqamcgKOvxPvjXye75S+SXX23nOBA=;
 b=f6B6TRFTmArhhCgZ9XiLtMAZ42ghnOrd25G4/++OoWX08dYoXhT0zGixE4JKSXpojG
 ozWn409QKZfuBVwVrC5z8S3MjKEgLc/Td4rByItsu8kBznZCK6OFUx5a3TTB7+nB75r0
 F47HgIDBAN2S/X+5bBSkxzZMaLqeWoeXSfLxG7YTQTF6yUSN/f2VlzqopXeDFgFbQaoI
 8hQry94vWinEXUSsCXHtJgF9Yaa7X0i0X6PC2wIarwDzJBdX45QY9ebtx7mKPQRM66Ii
 dH5mzo/Vj47BIniW4vGWAXXyke3j3TR4dMWmizoiAbn04B0xBae8RFj9gXD9OlKHW2Uw
 TSGw==
X-Gm-Message-State: AOAM530fpOxUCu6SMKW3FgjyZK00n7EmkGhfYryOD7c+CQwMZU50pKrZ
 ZLrXKqCxLvcmYJne8lplB6V72NxC7Kvo0qTn+pkF5kL4UUw=
X-Google-Smtp-Source: ABdhPJyVw4N4+vOc0K74rvcksdNbknBw/hubJu5StKgFL92qWFqxH6LOx+Qg+7J/wO7XuOV0T/6fc7p73g/XHYWhqNw=
X-Received: by 2002:a05:620a:a19:: with SMTP id
 i25mr17610579qka.426.1627313357295; 
 Mon, 26 Jul 2021 08:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210723172142.3273510-1-jason@jlekstrand.net>
 <CAM0jSHOgJQni53DJWP0NWJTAR82PNmb6zgt2Gm-faBd1sDaSHA@mail.gmail.com>
 <CAOFGe95CVvM=7UvH3yBBx9Qr4OPrkRUG7QAXgnSLkWgPGef10g@mail.gmail.com>
In-Reply-To: <CAOFGe95CVvM=7UvH3yBBx9Qr4OPrkRUG7QAXgnSLkWgPGef10g@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 26 Jul 2021 16:28:51 +0100
Message-ID: <CAM0jSHNmO8ZGdvLkJhonReHmNXjBkgvjmki-yLmUUkbLTnqeLQ@mail.gmail.com>
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

On Mon, 26 Jul 2021 at 16:11, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, Jul 26, 2021 at 3:12 AM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Fri, 23 Jul 2021 at 18:21, Jason Ekstrand <jason@jlekstrand.net> wro=
te:
> > >
> > > This patch series fixes an issue with discrete graphics on Intel wher=
e we
> > > allowed dma-buf import while leaving the object in local memory.  Thi=
s
> > > breaks down pretty badly if the import happened on a different physic=
al
> > > device.
> > >
> > > v7:
> > >  - Drop "drm/i915/gem/ttm: Place new BOs in the requested region"
> > >  - Add a new "drm/i915/gem: Call i915_gem_flush_free_objects() in i91=
5_gem_dumb_create()"
> > >  - Misc. review feedback from Matthew Auld
> > > v8:
> > >  - Misc. review feedback from Matthew Auld
> > > v9:
> > >  - Replace the i915/ttm patch with two that are hopefully more correc=
t
> > >
> > > Jason Ekstrand (6):
> > >   drm/i915/gem: Check object_can_migrate from object_migrate
> > >   drm/i915/gem: Refactor placement setup for i915_gem_object_create*
> > >     (v2)
> > >   drm/i915/gem: Call i915_gem_flush_free_objects() in
> > >     i915_gem_dumb_create()
> > >   drm/i915/gem: Unify user object creation (v3)
> > >   drm/i915/gem/ttm: Only call __i915_gem_object_set_pages if needed
> > >   drm/i915/gem: Always call obj->ops->migrate unless can_migrate fail=
s
> > >
> > > Thomas Hellstr=C3=B6m (2):
> > >   drm/i915/gem: Correct the locking and pin pattern for dma-buf (v8)
> > >   drm/i915/gem: Migrate to system at dma-buf attach time (v7)
> >
> > Should I push the series?
>
> Yes, please.  Do we have a solid testing plan for things like this
> that touch discrete?  I tested with mesa+glxgears on my DG1 but
> haven't run anything more stressful.

I think all we really have are the migration related selftests, and CI
is not even running them on DG1 due to other breakage. Assuming you
ran these locally, I think we just merge the series?

>
> --Jason
>
>
> > >
> > >  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 177 ++++++++--------
> > >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  58 ++++--
> > >  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  20 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
> > >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  13 +-
> > >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 190 ++++++++++++++++=
+-
> > >  .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
> > >  7 files changed, 341 insertions(+), 136 deletions(-)
> > >
> > > --
> > > 2.31.1
> > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
