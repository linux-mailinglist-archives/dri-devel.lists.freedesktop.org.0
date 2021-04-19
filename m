Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2D364A14
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 20:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296976E428;
	Mon, 19 Apr 2021 18:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B4A6E428
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 18:48:48 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v6so8638354oiv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpx1KvA9nXC26B9CQb4+xACaQ8wLuRHcCxO/n6ExF0U=;
 b=hQ1rvMtbsthxX0bcVY3jpCUWiCSMfnwrt3hi+FiJRkFu6yOxgLyo5XgPkGt5oVM6Yv
 ltCgNwYWejvNRblwJm49thiCU5NuTkpZOHHFyHYo5mMGbY6s3RtFlFwC1kfMQX6jr7tB
 YKBSMieantC67pRYX5HlCaQYcsItCDiKwS7gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpx1KvA9nXC26B9CQb4+xACaQ8wLuRHcCxO/n6ExF0U=;
 b=j8clU4kI01CRDq15D8nvTIvYOh0G5Ofkq8pITJMUuG64cg34JH4pt2Jg7xqUQn/FC4
 sYcniTGxA9o6SOKmS2LHw/FTkyl346AitiXNQGXsTBceRe9mXY3mwEzQCj6GX4mBVh8+
 WxG4Nnh3EsndmsxEDhFjFHNdHjNdiDzNPBWhp2YuCXC7jk9BixlgY2BVfRYY2+G0Kt4h
 fujLyu1OxuepkpVYpqA/K2cezWJyBZA+d5GN4RQp4f8/iIiNg5pmySqgyBQ2SxAiFHG3
 giHjQ7nheoGPNlixPlSkqUoUD43P0IdaD3a1odPw4x/fTTpkf7aPiltdXITVCfw4vxXp
 3Ozg==
X-Gm-Message-State: AOAM531OQ+by3l+dnrZACZRhjfCA4Zs6A96G3wopaEZAH6SGhZeGNt2R
 C4INDX+BcdWLLnwWLw5t0se4izTBK2pR+zJOgo3Yww==
X-Google-Smtp-Source: ABdhPJwavLqMTWA2oCxkDxHG5TA7CHQFRyfsIt88Ll0l0C1mbeb47hPwRMYOZZ/KtZcGD5P/PEhfVRtjP4zDXbWxeQc=
X-Received: by 2002:aca:2219:: with SMTP id b25mr206855oic.14.1618858128169;
 Mon, 19 Apr 2021 11:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <f7add0a2-162e-3bd2-b1be-344a94f2acbf@vmware.com>
 <CAPM=9twZd-Y6dnx7eQW6paw8BoREnMiPAe5FnBM1sZ-3uPk9YQ@mail.gmail.com>
In-Reply-To: <CAPM=9twZd-Y6dnx7eQW6paw8BoREnMiPAe5FnBM1sZ-3uPk9YQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 19 Apr 2021 20:48:37 +0200
Message-ID: <CAKMK7uG3bHcqK=8ef7rQLfcgRWwsHTZexpi3i7pe9q1NZG9ejQ@mail.gmail.com>
Subject: Re: [git pull] drm/vmwgfx fixes for 5.12-rc8
To: Dave Airlie <airlied@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 18, 2021 at 1:03 AM Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Zack,
>
> Please make sure to always cc dri-devel and/or Daniel on these so if
> I'm away they don't get lost, but also so that they make it into
> patchwork for processing.
>
> If you have a chance can you resend it, I'll see if we can process
> this out of band and get it to Linus before release.

Or use drm-misc-fixes train, usually it leaves on schedul :-)
-Daniel

>
> Dave.
>
> On Thu, 15 Apr 2021 at 07:14, Zack Rusin <zackr@vmware.com> wrote:
> >
> > The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:
> >
> >    Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)
> >
> > are available in the Git repository at:
> >
> >    git@gitlab.freedesktop.org:zack/vmwgfx.git tags/vmwgfx-fixes-2021-04-14
> >
> > for you to fetch changes up to 2ef4fb92363c44e8a6f93fd0877b6a7dee6f874d:
> >
> >    drm/vmwgfx: Make sure bo's are unpinned before putting them back (2021-04-14 16:41:31 -0400)
> >
> > ----------------------------------------------------------------
> > vmwgfx fixes for regressions in 5.12
> >
> > Here's a set of 3 patches fixing ugly regressions
> > in the vmwgfx driver. We broke lock initialization
> > code and ended up using spinlocks before initialization
> > breaking lockdep.
> > Also there was a bit of a fallout from drm changes
> > which made the core validate that unreferenced buffers
> > have been unpinned. vmwgfx pinning code predates a lot
> > of the core drm and wasn't written to account for those
> > semantics. Fortunately changes required to fix it
> > are not too intrusive.
> > The changes have been validated by our internal ci.
> >
> > Signed-off-by: Zack Rusin <zackr@vmware.com>
> >
> > ----------------------------------------------------------------
> > Zack Rusin (3):
> >        drm/vmwgfx: Make sure we unpin no longer needed buffers
> >        drm/vmwgfx: Fix the lockdep breakage
> >        drm/vmwgfx: Make sure bo's are unpinned before putting them back
> >
> >   drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c |  4 ++++
> >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 17 ++++++++---------
> >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  5 +----
> >   drivers/gpu/drm/vmwgfx/vmwgfx_mob.c     | 14 ++++++++++++++
> >   4 files changed, 27 insertions(+), 13 deletions(-)



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
