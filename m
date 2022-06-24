Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA29455A364
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6F910EDD4;
	Fri, 24 Jun 2022 21:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516EB10EDD4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:18:02 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g26so7136529ejb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kOvhoEpSE/InAZniXEti7vxsLeyf1a5ZFLlDrYfEPAA=;
 b=M1hPxnJUFy/KS9mddV1ZPCrOTUCJOFrbdOpyi7j0ftrXkyhBEEnYliwfUMRIJpc302
 UerGSaJuJ0U+ZQOOBbu9YnTTWBPqzn6BGm20kcHK021zUKyUQcLbeROv76yKvkCA4wL5
 TKPV/NeXPSFred9jnh+TebuOPhqPca6DgiiGGp4t7notg/0HrutadjdFHCaRzrR60/SS
 kEf+UPdtfuMWWyAGy3sWvPgk2BDAIWToAkVEoiSpYe94Nv1jd3nvOoAgAb/ln/G4XSiC
 GAFPYKei8IcLsfKWZvc/9gQfNai9RmMKWnJqWlZq+QZRlzREX3RhLKN999kWcpZY7b77
 80Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kOvhoEpSE/InAZniXEti7vxsLeyf1a5ZFLlDrYfEPAA=;
 b=froD0YCNEeiIu9NhgM6muojMD8C1p/Ogx+gJAtMh/sGC4/jSXzLYqePMTIj/54sxvX
 hFU8y3xz+Z7jkKymJKjX6RrZWrxNEw5IklsziSMpsKHgrVosFrsRzp12plVMNJQuSNQl
 YnUmltft3X3MpL+vZiqao6GJw2URBJuj/B35o3pKOdrictOofKYrCJgOx10k0IXp46jn
 fjeE6lmRiqK46w+JOsk77YbHuCf0zQIUY2VE7/Ig3m39nLGLr0+BLzWgFbtd1fSarZHJ
 sAh0kms7TYlcDoOHf/Tk0YBJiE7NZlWUsJWnkFmXAGNLcWfyZdMd9tDZWmPapH8GOU/Z
 aIyQ==
X-Gm-Message-State: AJIora9Y5daiiCz63noQAMHwFf8Ta2gqfk6eyginCjRfKlKO7X48MUsH
 I32hg9mdyumh9QSeusbw/Tvn6ywWZA8fiRGDVc6+qQ==
X-Google-Smtp-Source: AGRyM1sSg7LIinwzTB+qnSxgsQphAXAb9tAoVzunteBdzvrsgIwf9MXdDqBKLlkpEVBLtUpHvFPPJdLDYUqh2lPKgqo=
X-Received: by 2002:a17:907:d25:b0:711:ea61:63aa with SMTP id
 gn37-20020a1709070d2500b00711ea6163aamr992776ejc.584.1656105480525; Fri, 24
 Jun 2022 14:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <CABdmKX3ZV6-u-oLvW_wWavAMBfrsZ=C_rCgK_Uz4VjxcRvRFew@mail.gmail.com>
 <81026ef07c1ce20f8673b75b17bab79a2b39c548.camel@ndufresne.ca>
 <CABdmKX2LxZ6zZR=fhXfnuWCB2BR+gzDd1-t1DD2A2XP24wvuGQ@mail.gmail.com>
 <Yn6DpUsoSz1/15Kc@slm.duckdns.org>
 <CABdmKX1xvm87WMEDkMc9Aye46E4zv1-scenwgaRxHesrOCsaYg@mail.gmail.com>
 <YodHjYlMx1XGtM2+@slm.duckdns.org>
 <CABdmKX2Ok023rN1drQgXVZLKUO_DVYrzmEamCgMMu6BPO67yhQ@mail.gmail.com>
 <CABdmKX0WV8VWgeafVGJ++nJ4xsJD7Wpz=3KX=BW1du=huttfvw@mail.gmail.com>
 <YrYbwu0iIAJJGXVg@phenom.ffwll.local>
 <CANDhNCqGjaq-SFvWwkqnEFj4tJcRqCYupZ03wLyCexqTH5MqMg@mail.gmail.com>
 <YrYgWCTtZqfvCt5D@phenom.ffwll.local>
In-Reply-To: <YrYgWCTtZqfvCt5D@phenom.ffwll.local>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 24 Jun 2022 14:17:49 -0700
Message-ID: <CABdmKX0bJDLwK7JEDGVb=KHtoVbZgnXYr8UE5eUpLYuAyiWwyw@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Proposal for a GPU cgroup controller
To: John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Tejun Heo <tj@kernel.org>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <john.stultz@linaro.org>, Shuah Khan <shuah@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Kenny.Ho@amd.com, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, kernel-team@android.com, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kselftest@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 1:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jun 24, 2022 at 01:32:45PM -0700, John Stultz wrote:
> > On Fri, Jun 24, 2022 at 1:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Jun 15, 2022 at 10:31:21AM -0700, T.J. Mercier wrote:
> > > > On Fri, May 20, 2022 at 9:25 AM T.J. Mercier <tjmercier@google.com> wrote:
> > > > >
> > > > > On Fri, May 20, 2022 at 12:47 AM Tejun Heo <tj@kernel.org> wrote:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > On Tue, May 17, 2022 at 04:30:29PM -0700, T.J. Mercier wrote:
> > > > > > > Thanks for your suggestion. This almost works. "dmabuf" as a key could
> > > > > > > work, but I'd actually like to account for each heap. Since heaps can
> > > > > > > be dynamically added, I can't accommodate every potential heap name by
> > > > > > > hardcoding registrations in the misc controller.
> > > > > >
> > > > > > On its own, that's a pretty weak reason to be adding a separate gpu
> > > > > > controller especially given that it doesn't really seem to be one with
> > > > > > proper abstractions for gpu resources. We don't want to keep adding random
> > > > > > keys to misc controller but can definitely add limited flexibility. What
> > > > > > kind of keys do you need?
> > > > > >
> > > > > Well the dmabuf-from-heaps component of this is the initial use case.
> > > > > I was envisioning we'd have additional keys as discussed here:
> > > > > https://lore.kernel.org/lkml/20220328035951.1817417-1-tjmercier@google.com/T/#m82e5fe9d8674bb60160701e52dae4356fea2ddfa
> > > > > So we'd end up with a well-defined core set of keys like "system", and
> > > > > then drivers would be free to use their own keys for their own unique
> > > > > purposes which could be complementary or orthogonal to the core set.
> > > > > Yesterday I was talking with someone who is interested in limiting gpu
> > > > > cores and bus IDs in addition to gpu memory. How to define core keys
> > > > > is the part where it looks like there's trouble.
> > > > >
> > > > > For my use case it would be sufficient to have current and maximum
> > > > > values for an arbitrary number of keys - one per heap. So the only
> > > > > part missing from the misc controller (for my use case) is the ability
> > > > > to register a new key at runtime as heaps are added. Instead of
> > > > > keeping track of resources with enum misc_res_type, requesting a
> > > > > resource handle/ID from the misc controller at runtime is what I think
> > > > > would be required instead.
> > > > >
> > > > Quick update: I'm going to make an attempt to modify the misc
> > > > controller to support a limited amount of dynamic resource
> > > > registration/tracking in place of the new controller in this series.
> > > >
> > > > Thanks everyone for the feedback.
> > >
> > > Somehow I missed this entire chain here.
> > >
> > > I'm not a fan, because I'm kinda hoping we could finally unify gpu memory
> > > account. Atm everyone just adds their one-off solution in a random corner:
> > > - total tracking in misc cgroup controller
> > > - dma-buf sysfs files (except apparently too slow so it'll get deleted
> > >   again)
> > > - random other stuff on open device files os OOM killer can see it
> > >
> > > This doesn't look good.
> >
> > But I also think one could see it as "gpu memory" is the drm subsystem
> > doing the same thing (in that it's artificially narrow to gpus). It
> > seems we need something to account for buffers allocated by drivers,
> > no matter which subsystem it was in (drm, v4l2, or networking or
> > whatever).
>
> This is what the gpucg was. It wasn't called the dmabuf cg because we want
> to account also memory of other types (e.g. drm gem buffer objects which
> aren't exported), and I guess people didn't dare call it an xpu.
>
> But this was absolutely for a lot more than just "gpu drivers in drm".
> Better names welcome.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

From an API perspective the two approaches (misc vs GPU) seem similar
to me. Someone comes up with a name of a resource they want to track,
and it's added as a key in a cgroup interface file as drivers register
and perform accounting on that resource. Considering just the naming,
what do you see as the appeal of a controller named GPU/XPU vs one
named Misc? Folks seem to have assumptions about the type of resources
a "GPU" controller should be tracking, and potentially also how
different resources are grouped under a single resource name. So is
your thought that non-graphics related accounting of the same sort
should be using a differently named controller, even if that
controller could have the same implementation?

My thought is that the resource names should be as specific as
possible to allow fine-grained accounting, and leave any grouping of
resources to userspace. We can do that under any controller. If you'd
like to see a separate controller for graphics related stuff... well
that's what I was aiming for with the GPU cgroup controller. It's just
that dmabufs from heaps are the first use-case wired up.

I haven't put much time into the misc controller effort yet, and I'd
still be happy to see the GPU controller accepted if we can agree
about how it'd be used going forward. Daniel, I think you're in a
great position to comment about this. :) If there's a place where the
implementation is missing the mark, then let's change it. Are the
controller and resource naming the only issues?
