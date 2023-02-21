Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6FA69E679
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 18:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C19F10E8CD;
	Tue, 21 Feb 2023 17:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0410E8CB;
 Tue, 21 Feb 2023 17:55:23 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id be35so5143783oib.4;
 Tue, 21 Feb 2023 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xv2uXYHt3XeROXyJVL9lk52fVmsfLTFU5mqvJC9GYu4=;
 b=MhVB0NJNs21YP6mxc5cr02QCii/6IswZclKK87JSAP6SkTvs9pBd4T1VG0NGWeKOqn
 khNHQFzG9sv5NWCllEUe045lNPhbXKoS5hJpFJEOw0pb/hb9rxIOY5mdDfr95+wZJoKJ
 wdkFsLjnOsG5IzJO6BFsGAfqli+GQYGm5jfBJCtSIeTNWhtsTelZ1FZzANQX5TuFfI5b
 uRtl4Q9C7kbV5tR7hBfdO9f4th/zmVjuvbBgCh9zAwAPHmb68tnTuBFWDHtJlkQtMN2e
 u/NqNnndQi2evJpRyuAgtqBxtD7jsrq1LpjnfjcXkEHq9eWAdvGyaWRWWiLlUMKq0HWD
 8mVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xv2uXYHt3XeROXyJVL9lk52fVmsfLTFU5mqvJC9GYu4=;
 b=pBagwg1QLif3qMMpjS34XmKJ0hb9j3b1ex4Ux9AFytik9i4SAL9M211M4sX7rxQdEe
 l0xJ3KxCYRzGJ+cc3gisrHefbXsUZ2gV7JGe4Y6xSTUoY7TYTQZcgrg2zM7NhAtb2r71
 5sgQwXrgsN7OPpvxbG/hyiZPn9s/56etjSALgU8YjmWVIxnXvGZS8ODJxEPT0ycHyIn6
 vcLSuprn+GUxZc7qw/JqWQY1ub1ylgVnEq15SKMkSckherUnpMAgRmV6qNk4jQB0Uth0
 fi9bXL+6E/wr4sndWotanOInJ0H9xwPHX2/V7Qbnb+yTI+kOHXhKS4yuZwODw9zSeY+u
 bi5g==
X-Gm-Message-State: AO0yUKUd6HRmU5iRqTIRBFYzbos7IYLrpyo04QQOn3bACWsRr8E6ewJu
 Em/d5J7KHiQqCIS1YrH9pOHW+wLMbRzWuODjgQk=
X-Google-Smtp-Source: AK7set+3plPstNNrlEwndFRmB7Ghv+pP145J/q5VwaYQKMVG1IyDbrvqIsIdzdj2oJvtdlMI0LV5ATP51GZWdQwW8zg=
X-Received: by 2002:a05:6808:ec7:b0:364:c0a5:1fcf with SMTP id
 q7-20020a0568080ec700b00364c0a51fcfmr1405745oiv.58.1677002122311; Tue, 21 Feb
 2023 09:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <20230221103753.205082d3@eldfell>
 <CA+hFU4xexaHAYsbGm6PdNfVFHBgOS4WiMo=AU0Gi5cYt566aTg@mail.gmail.com>
In-Reply-To: <CA+hFU4xexaHAYsbGm6PdNfVFHBgOS4WiMo=AU0Gi5cYt566aTg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Feb 2023 09:55:12 -0800
Message-ID: <CAF6AEGvXJkmwn8M6ThCx0bLwDFqqHmjp5fkDuDa7g2e8i3eM_w@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Sebastian Wick <sebastian.wick@redhat.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 8:01 AM Sebastian Wick
<sebastian.wick@redhat.com> wrote:
>
> On Tue, Feb 21, 2023 at 9:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Mon, 20 Feb 2023 08:14:47 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> >
> > > On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > >
> > > > On Sat, 18 Feb 2023 13:15:49 -0800
> > > > Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> > > > > wait (as opposed to a "housekeeping" wait to know when to cleanup after
> > > > > some work has completed).  Usermode components of GPU driver stacks
> > > > > often poll() on fence fd's to know when it is safe to do things like
> > > > > free or reuse a buffer, but they can also poll() on a fence fd when
> > > > > waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> > > > > lets the kernel differentiate these two cases.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Hi,
> > > >
> > > > where would the UAPI documentation of this go?
> > > > It seems to be missing.
> > >
> > > Good question, I am not sure.  The poll() man page has a description,
> > > but my usage doesn't fit that _exactly_ (but OTOH the description is a
> > > bit vague).
> > >
> > > > If a Wayland compositor is polling application fences to know which
> > > > client buffer to use in its rendering, should the compositor poll with
> > > > PRI or not? If a compositor polls with PRI, then all fences from all
> > > > applications would always be PRI. Would that be harmful somehow or
> > > > would it be beneficial?
> > >
> > > I think a compositor would rather use the deadline ioctl and then poll
> > > without PRI.  Otherwise you are giving an urgency signal to the fence
> > > signaller which might not necessarily be needed.
> > >
> > > The places where I expect PRI to be useful is more in mesa (things
> > > like glFinish(), readpix, and other similar sorts of blocking APIs)
> >
> > Sounds good. Docs... ;-)
> >
> > Hmm, so a compositor should set the deadline when it processes the
> > wl_surface.commit, and not when it actually starts repainting, to give
> > time for the driver to react and the GPU to do some more work. The
> > deadline would be the time when the compositor starts its repaint, so
> > it knows if the buffer is ready or not.
>
> Technically we don't know when the commit is supposed to be shown.
> Just passing a deadline of the next possible deadline however is
> probably a good enough guess for this feature to be useful.
>
> One thing that neither API allows us to do is tell the kernel in
> advance when we're going to submit work and what the deadline for it
> is and unfortunately that work is the most timing sensitive.

Presumably you are talking about the final compositing step?
Elsewhere in this series that atomic wait-for-fences step sets the
deadline hint.

BR,
-R

> >
> >
> > Thanks,
> > pq
> >
> >
> > >
> > > BR,
> > > -R
> > >
> > > >
> > > >
> > > > Thanks,
> > > > pq
> > > >
> > > > > ---
> > > > >  drivers/dma-buf/sync_file.c | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >
> > > > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > > > index fb6ca1032885..c30b2085ee0a 100644
> > > > > --- a/drivers/dma-buf/sync_file.c
> > > > > +++ b/drivers/dma-buf/sync_file.c
> > > > > @@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
> > > > >  {
> > > > >       struct sync_file *sync_file = file->private_data;
> > > > >
> > > > > +     /*
> > > > > +      * The POLLPRI/EPOLLPRI flag can be used to signal that
> > > > > +      * userspace wants the fence to signal ASAP, express this
> > > > > +      * as an immediate deadline.
> > > > > +      */
> > > > > +     if (poll_requested_events(wait) & EPOLLPRI)
> > > > > +             dma_fence_set_deadline(sync_file->fence, ktime_get());
> > > > > +
> > > > >       poll_wait(file, &sync_file->wq, wait);
> > > > >
> > > > >       if (list_empty(&sync_file->cb.node) &&
> > > >
> >
>
