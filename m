Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B855D28A10D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 19:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F18F6F39A;
	Sat, 10 Oct 2020 17:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DDC6F39A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 17:36:30 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id p15so17577707ejm.7
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xsOZOc5wUkDsyS+q4XR7sRY+/Nw08dWS4rH9PR3SdYM=;
 b=K43vYuvFf4p0HKwpNNYM8EVjuArTRuuNWIw2q4YLC5jyws5WqABCqrRlB8L6Kw/ga/
 9pb07pav9vu70DJL9+qIG+8WZUav68UhLbRS2hY3VnFfDpqam6GcqIBnDSm/T02riaI0
 bK3Q77l+IKqRqvdVTvJ6gEi/4zr+9omw8Jdkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xsOZOc5wUkDsyS+q4XR7sRY+/Nw08dWS4rH9PR3SdYM=;
 b=eAZ+lCnYZLyqRV7pDuHj1WdHcUp3iIfZpmIDbLLYgIeE2Z6+uNhE1hLzDE9T8ZB7fw
 hhCD/fj5n/jalBqPDgZgyJnyvcqZujsylbXKPqUEMjUxexV9okopTjNhePYTXMu5nVEL
 3UogXPAfeepgVAvTKJ/tsrgxZeLErOvl0vf+35hHGDt/hgjPKxVtFsyLhjuWvYrWTu8B
 ZAGB08oXpjyDbsaP7u3dAUbmX5VXtAeBZC8oKadUWPQvM1Vy8DuJIxWZbjzpgVOSJFF1
 V8ndSJ8HdQIjyGYfDgkI9g0K8jSh1O/tdNqxRxFjmSwQWluZsW8vtUlAFeStd3GFx3nu
 PT5w==
X-Gm-Message-State: AOAM533V2DJCnu+cvvduYTbb7G0GWpQ+hAEY+yJ65XQi3NyLDFxdI/K7
 Ljsgj8lFzKLPRzXfbn6UlbevvDwO1o6TRA==
X-Google-Smtp-Source: ABdhPJyxTy7ic+fjSrai69a6vfCKyTJxsVv9MmWANpu9XZUU7BYSplA3Q0z8QmHa0gjAHwzDt1iQ5w==
X-Received: by 2002:a17:906:b218:: with SMTP id
 p24mr20114568ejz.136.1602351388253; 
 Sat, 10 Oct 2020 10:36:28 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id k9sm7507858ejv.113.2020.10.10.10.36.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 10:36:27 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id f21so12900256wml.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 10:36:27 -0700 (PDT)
X-Received: by 2002:a1c:8057:: with SMTP id b84mr3433695wmd.116.1602351069766; 
 Sat, 10 Oct 2020 10:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan>
In-Reply-To: <20201009143723.45609bfb@coco.lan>
From: Tomasz Figa <tfiga@chromium.org>
Date: Sat, 10 Oct 2020 19:30:59 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CVqa4o0W32FE_NsSheN906uE7uA5gctHr=Z-PeU=1wuw@mail.gmail.com>
Message-ID: <CAAFQd5CVqa4o0W32FE_NsSheN906uE7uA5gctHr=Z-PeU=1wuw@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Fri, Oct 9, 2020 at 2:37 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 9 Oct 2020 09:21:11 -0300
> Jason Gunthorpe <jgg@ziepe.ca> escreveu:
>
> > On Fri, Oct 09, 2020 at 12:34:21PM +0200, Mauro Carvalho Chehab wrote:
> > > Hi,
> > >
> > > Em Fri,  9 Oct 2020 09:59:26 +0200
> > > Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:
> > >
> > > > Way back it was a reasonable assumptions that iomem mappings never
> > > > change the pfn range they point at. But this has changed:
> > > >
> > > > - gpu drivers dynamically manage their memory nowadays, invalidating
> > > > ptes with unmap_mapping_range when buffers get moved
> > > >
> > > > - contiguous dma allocations have moved from dedicated carvetouts to
> > > > cma regions. This means if we miss the unmap the pfn might contain
> > > > pagecache or anon memory (well anything allocated with GFP_MOVEABLE)
> > > >
> > > > - even /dev/mem now invalidates mappings when the kernel requests that
> > > > iomem region when CONFIG_IO_STRICT_DEVMEM is set, see 3234ac664a87
> > > > ("/dev/mem: Revoke mappings when a driver claims the region")
> > > >
> > > > Accessing pfns obtained from ptes without holding all the locks is
> > > > therefore no longer a good idea.
> > > >
> > > > Unfortunately there's some users where this is not fixable (like v4l
> > > > userptr of iomem mappings) or involves a pile of work (vfio type1
> > > > iommu). For now annotate these as unsafe and splat appropriately.
> > > >
> > > > This patch adds an unsafe_follow_pfn, which later patches will then
> > > > roll out to all appropriate places.
> > >
> > > NACK, as this breaks an existing userspace API on media.
> >
> > It doesn't break it. You get a big warning the thing is broken and it
> > keeps working.
> >
> > We can't leave such a huge security hole open - it impacts other
> > subsystems, distros need to be able to run in a secure mode.
>
> Well, if distros disable it, then apps will break.
>

Do we have any information on userspace that actually needs this functionality?

Note that we're _not_ talking here about the complete USERPTR
functionality, but rather just the very corner case of carveout memory
not backed by struct pages.

Given that the current in-tree ways of reserving carveout memory, such
as shared-dma-pool, actually give memory backed by struct pages, do we
even have a source of such legacy memory in the kernel today?

I think that given that this is a very niche functionality, we could
have it disabled by default for security reasons and if someone
_really_ (i.e. there is no replacement) needs it, they probably need
to use a custom kernel build anyway for their exotic hardware setup
(with PFN-backed carveout memory), so they can enable it.

> > > While I agree that using the userptr on media is something that
> > > new drivers may not support, as DMABUF is a better way of
> > > handling it, changing this for existing ones is a big no,
> > > as it may break usersapace.
> >
> > media community needs to work to fix this, not pretend it is OK to
> > keep going as-is.
>
> > Dealing with security issues is the one case where an uABI break might
> > be acceptable.
> >
> > If you want to NAK it then you need to come up with the work to do
> > something here correctly that will support the old drivers without the
> > kernel taint.
> >
> > Unfortunately making things uncomfortable for the subsystem is the big
> > hammer the core kernel needs to use to actually get this security work
> > done by those responsible.
>
>
> I'm not pretending that this is ok. Just pointing that the approach
> taken is NOT OK.
>
> I'm not a mm/ expert, but, from what I understood from Daniel's patch
> description is that this is unsafe *only if*  __GFP_MOVABLE is used.
>
> Well, no drivers inside the media subsystem uses such flag, although
> they may rely on some infrastructure that could be using it behind
> the bars.
>
> If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> flag that it would be denying the core mm code to set __GFP_MOVABLE.
>
> Please let address the issue on this way, instead of broken an
> userspace API that it is there since 1991.

Note that USERPTR as a whole generally has been considered deprecated
in V4L2 for many years and people have been actively discouraged to
use it. And, still, we're just talking here about the very rare corner
case, not the whole USERPTR API.

Best regards,
Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
