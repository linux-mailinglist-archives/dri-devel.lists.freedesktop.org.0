Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201E69F82D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB2F10EA11;
	Wed, 22 Feb 2023 15:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC2410EA08;
 Wed, 22 Feb 2023 15:37:38 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id bm20so7598074oib.7;
 Wed, 22 Feb 2023 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WywXApvBffh1ctyHLIw8PG0A91F5vwxm/kGgQV9IacY=;
 b=YyGaMffCjHmeb7oKxQ/AjwDRPC3vooJ1hX7KULsqIMrny4Y/ywlqW1K1z0JtQh3GwC
 97s0FyywTYTm4lkIxOzjKPqpDpYyNJVdABy708UFF+Tq8xpFeevUCxrlwK9gKxtxTYnj
 ml/GZk+0PSjXV+nZcQ+EqeFZf3t2YwrK8ukjJM3QWmnbl0HLn4J6p9bNSGDJBk2i+Kni
 gsM4bVRXRo8uxZ+6jnt9VZrPN60sdmAoiWAMsXCdSi+jGbyOlDwwPoz0hoWG9RWWDq2o
 rPyhTFvUxgJSOd8LYXiIZnxR4ESA7m34m4+L6jWECPNtD4n+2myWFHygI9HBbNCxbkYM
 32gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WywXApvBffh1ctyHLIw8PG0A91F5vwxm/kGgQV9IacY=;
 b=uKQWYsW8u3W4K8SWxnl7JjUG1DAG/s4qqbuwbu6dlwaqerwBKhPjYDNR41boV0Gg1z
 mEXcH75D7pofi2ELJDzjnrHoIJTV4FvxUmN7jeva8Hg+3bLxL10Bfi0tWtktZwVKLwyW
 DslrjYWrYaCoa3hRMV376oDekSJwcFecq/WzQbvAIN9tLJsDaY+Xt3FdUDQ3ZW5to2zQ
 tmWS+AOnTsU6U1EpvYVblFNgy3zcHKIWnS74gQqwzENmKKaDMsxMf+GtshxEkvORjwZa
 gz3YUExNOnUBSxZxA0OMbir3Jk8VYtuwroiqdgmPpf0nrKKBAjnKMvWlGNxxhnqh2yc7
 E+9A==
X-Gm-Message-State: AO0yUKVuor+S8uWYVl5wx2tiEIfNifz5Qwz6Jpk6ffopAqX/q/CsXOC3
 qFP3YRqZwvMs9jRG79bFOi3VkU/sYLX46B110Nk=
X-Google-Smtp-Source: AK7set+ghT43kUTQU5CnG5qlnodVTbwtuuqgXrxj3sUQu1yp05OKsNhdEtnaHeVnQZ1YffZWQpnePgdKuPg3/NzktWY=
X-Received: by 2002:a05:6808:16ab:b0:37d:81a9:5103 with SMTP id
 bb43-20020a05680816ab00b0037d81a95103mr1413444oib.38.1677080257694; Wed, 22
 Feb 2023 07:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
 <20230222114900.1b6baf95@eldfell>
In-Reply-To: <20230222114900.1b6baf95@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 07:37:26 -0800
Message-ID: <CAF6AEGs1_75gg+LCBj6=PH8Jn60PXiE+Kx_2636nP-+pajN8Hg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Pekka Paalanen <ppaalanen@gmail.com>
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
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 21 Feb 2023 09:53:56 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > On Tue, Feb 21, 2023 at 8:48 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
> > >
> > > On 2023-02-20 11:14, Rob Clark wrote:
> > > > On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > >>
> > > >> On Sat, 18 Feb 2023 13:15:49 -0800
> > > >> Rob Clark <robdclark@gmail.com> wrote:
> > > >>
> > > >>> From: Rob Clark <robdclark@chromium.org>
> > > >>>
> > > >>> Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> > > >>> wait (as opposed to a "housekeeping" wait to know when to cleanup after
> > > >>> some work has completed).  Usermode components of GPU driver stacks
> > > >>> often poll() on fence fd's to know when it is safe to do things like
> > > >>> free or reuse a buffer, but they can also poll() on a fence fd when
> > > >>> waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> > > >>> lets the kernel differentiate these two cases.
> > > >>>
> > > >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > >>
> > > >> Hi,
> > > >>
> > > >> where would the UAPI documentation of this go?
> > > >> It seems to be missing.
> > > >
> > > > Good question, I am not sure.  The poll() man page has a description,
> > > > but my usage doesn't fit that _exactly_ (but OTOH the description is a
> > > > bit vague).
> > > >
> > > >> If a Wayland compositor is polling application fences to know which
> > > >> client buffer to use in its rendering, should the compositor poll with
> > > >> PRI or not? If a compositor polls with PRI, then all fences from all
> > > >> applications would always be PRI. Would that be harmful somehow or
> > > >> would it be beneficial?
> > > >
> > > > I think a compositor would rather use the deadline ioctl and then poll
> > > > without PRI.  Otherwise you are giving an urgency signal to the fence
> > > > signaller which might not necessarily be needed.
> > > >
> > > > The places where I expect PRI to be useful is more in mesa (things
> > > > like glFinish(), readpix, and other similar sorts of blocking APIs)
> > > Hi,
> > >
> > > Hmm, but then user-space could do the opposite, namely, submit work as usual--never
> > > using the SET_DEADLINE ioctl, and then at the end, poll using (E)POLLPRI. That seems
> > > like a possible usage pattern, unintended--maybe, but possible. Do we want to discourage
> > > this? Wouldn't SET_DEADLINE be enough? I mean, one can call SET_DEADLINE with the current
> > > time, and then wouldn't that be equivalent to (E)POLLPRI?
> >
> > Yeah, (E)POLLPRI isn't strictly needed if we have SET_DEADLINE.  It is
> > slightly more convenient if you want an immediate deadline (single
> > syscall instead of two), but not strictly needed.  OTOH it piggy-backs
> > on existing UABI.
>
> In that case, I would be conservative, and not add the POLLPRI
> semantics. An UAPI addition that is not strictly needed and somewhat
> unclear if it violates any design principles is best not done, until it
> is proven to be beneficial.
>
> Besides, a Wayland compositor does not necessary need to add the fd
> to its main event loop for poll. It could just SET_DEADLINE, and then
> when it renders simply check if the fence passed or not already. Not
> polling means the compositor does not need to wake up at the moment the
> fence signals to just record a flag.

poll(POLLPRI) isn't intended for wayland.. but is a thing I want in
mesa for fence waits.  I _could_ use SET_DEADLINE but it is two
syscalls and correspondingly more code ;-)

> On another matter, if the application uses SET_DEADLINE with one
> timestamp, and the compositor uses SET_DEADLINE on the same thing with
> another timestamp, what should happen?

The expectation is that many deadline hints can be set on a fence.
The fence signaller should track the soonest deadline.

BR,
-R

> Maybe it's a soft-realtime app whose primary goal is not display, and
> it needs the result faster than the window server?
>
> Maybe SET_DEADLINE should set the deadline only to an earlier timestamp
> and never later?
>
>
> Thanks,
> pq
