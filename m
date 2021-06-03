Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0D39A491
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B586F4B1;
	Thu,  3 Jun 2021 15:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395C16F4AF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:29:08 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 207so9397776ybd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qmChvkUqLl5eiHvAygjqmUTJgz8BfnTf0lgkePYOmM=;
 b=tyUTOaHNBnOwMuEDBregOohrJanvW1ShWtRY8DANSyfHZj5thC9vU/65uK/mJlnA8J
 kv+JGyWwqYA+5DzXZawqxBkAMlgI0kcVHvOQo4EWXZRoPialUBO/cyh6O8Sq9krX7f/9
 ogA7dbQ5BgKgIh/vWY0cfAJkybk3x8Bw9K+WYUYwVnlEGiCHuEtJt2lcqhdy9C8Fbml1
 wJyac1g3rAVHc+JCyYsdu23z7aEGCGb91h2LIKh/6bI8nCGmQJdTHS2CmDiBeq3+sEEL
 xlOgvsRj3+OAhTKPIp27gw4oawft4nw9UJ1iR6KIT9PjsbjZbXXPLHLF/WMdMHnD7aJ/
 /4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qmChvkUqLl5eiHvAygjqmUTJgz8BfnTf0lgkePYOmM=;
 b=QUfFLDFB7DXsH614O5wPqCk9a7eHbVuwUsY5aSP76hFzWD0z+m/6gqORvcYZqFA0SD
 WpqtUj/7NgSbsM3OnLwtNQyOCpdjbtP3weqAx4k2APbYDBLZ3KBI79YXhaxZ3UeFTsx2
 dibcpBcyVgET294J+WvkffsbqScTlGfK6wvBLqlj5C84t2cMt7OCmrrXZUMyAHzWwQYJ
 Xyu/oy860yHhax89KsxClX2ndclw+YTsKJdeM7FA01w4QJ9ed6aTDOPVvZZVWpqIY1hl
 qwCEbV78CN6G0I0n5NdRyKtJ0IX3QuPttvrTdg8VmrQKnSKVuLhrBSR0OK+prmH8wC/f
 jqFg==
X-Gm-Message-State: AOAM532VFUrhPVuJx5J07dZJ+GdgZ5jdNzG8muqt4VCupZvM2cx3H4bs
 YDLaKPa+u8LL2hGhp1SQZ2hM6bycAUMHt8ZDXrt1RQ==
X-Google-Smtp-Source: ABdhPJwNpJChX+SmEXLtlJPn/FHzt84CXrubZ5MRG4B8F6iW5QGbMPG8x4eF90iqgwIJMolo+f5j8CNTtV+vEFZSaOs=
X-Received: by 2002:a25:81c5:: with SMTP id n5mr719557ybm.323.1622734147322;
 Thu, 03 Jun 2021 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210602164149.391653-1-jason@jlekstrand.net>
 <20210602164149.391653-5-jason@jlekstrand.net>
 <YLiRtZUuloF0qy0b@phenom.ffwll.local> <YLiR3CKMYjE9u4+T@phenom.ffwll.local>
 <YLiSk5bTpt1ZJvYr@phenom.ffwll.local>
In-Reply-To: <YLiSk5bTpt1ZJvYr@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 3 Jun 2021 10:28:56 -0500
Message-ID: <CAOFGe94Syp5JPv4+i7aOaPLOSYgdvaL7J0v0kAQ5Z7P+jHFJtw@mail.gmail.com>
Subject: Re: [PATCH 4/5] Revert "drm/i915: Propagate errors on awaiting
 already signaled fences"
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
 Intel GFX <intel-gfx@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Marcin Slusarz <marcin.slusarz@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 3:28 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jun 03, 2021 at 10:25:00AM +0200, Daniel Vetter wrote:
> > On Thu, Jun 03, 2021 at 10:24:21AM +0200, Daniel Vetter wrote:
> > > On Wed, Jun 02, 2021 at 11:41:48AM -0500, Jason Ekstrand wrote:
> > > > This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca63f7.  Ever
> > > > since that commit, we've been having issues where a hang in one client
> > > > can propagate to another.  In particular, a hang in an app can propagate
> > > > to the X server which causes the whole desktop to lock up.
> > >
> > > I think we need a note to backporters here:
> > >
> > > "For backporters: Please note that you _must_ have a backport of
> > > https://lore.kernel.org/dri-devel/20210602164149.391653-2-jason@jlekstrand.net/
> > > for otherwise backporting just this patch opens up a security bug."

Done.

> > > Or something like that.
> >
> > Oh also reordering the patch set so the 2 reverts which are cc: stable are
> > first, then the other stuff on top that cleans up the fallout.

Done.

> Oh also the longer commit message I've done would be nice to add. Or at
> least link it or something like that.
>
> https://lore.kernel.org/dri-devel/20210519101523.688398-1-daniel.vetter@ffwll.ch/
>
> I think I mentioned this on irc, but got lost I guess.

Drp.  I thought I'd gotten that but I guess I failed.  Fixed now.

> -Daniel
>
> > -Daniel
> >
> > > -Daniel
> > >
> > > > Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> > > > Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
> > > > Cc: <stable@vger.kernel.org> # v5.6+
> > > > Cc: Jason Ekstrand <jason.ekstrand@intel.com>
> > > > Cc: Marcin Slusarz <marcin.slusarz@intel.com>
> > > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
> > > > Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Reviewed-by: Jon Bloomfield <jon.bloomfield@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/i915_request.c | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > > > index 970d8f4986bbe..b796197c07722 100644
> > > > --- a/drivers/gpu/drm/i915/i915_request.c
> > > > +++ b/drivers/gpu/drm/i915/i915_request.c
> > > > @@ -1426,10 +1426,8 @@ i915_request_await_execution(struct i915_request *rq,
> > > >
> > > >   do {
> > > >           fence = *child++;
> > > > -         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > > > -                 i915_sw_fence_set_error_once(&rq->submit, fence->error);
> > > > +         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > > >                   continue;
> > > > -         }
> > > >
> > > >           if (fence->context == rq->fence.context)
> > > >                   continue;
> > > > @@ -1527,10 +1525,8 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
> > > >
> > > >   do {
> > > >           fence = *child++;
> > > > -         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > > > -                 i915_sw_fence_set_error_once(&rq->submit, fence->error);
> > > > +         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > > >                   continue;
> > > > -         }
> > > >
> > > >           /*
> > > >            * Requests on the same timeline are explicitly ordered, along
> > > > --
> > > > 2.31.1
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
