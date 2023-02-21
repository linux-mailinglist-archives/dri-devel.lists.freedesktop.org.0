Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333469E41D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC7010E174;
	Tue, 21 Feb 2023 16:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C173010E174
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676995312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9izMAfpyPSC2j4KF6KccqxxHP0NMJSdJ01aiq+ruxRA=;
 b=FJ48voxx2KTn752GoHc+1bkTZXHOtTuLZ/W13Ercdj+7yPkRX6yBPD13FlOY6EniLHfRrt
 B7jdRIOf9x8Duiun5EMMx59uoliVbC2N1Td+3u+HtbAskTwP+JKjW0Ka+zEusrZD4Wcaxz
 8EAao9tYnmXYHx+MeIznZVJq0dhxKH0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-Kg6l4magO8OCY6hKgfy6Gg-1; Tue, 21 Feb 2023 11:01:51 -0500
X-MC-Unique: Kg6l4magO8OCY6hKgfy6Gg-1
Received: by mail-pf1-f199.google.com with SMTP id
 be12-20020a056a001f0c00b00593e2189278so1966942pfb.19
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 08:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9izMAfpyPSC2j4KF6KccqxxHP0NMJSdJ01aiq+ruxRA=;
 b=Yw57958VriuPmRJNU95SvSOeTP1jNFDVOEdubrj++LEHr2NKRcRgT/CIDkDvmn2iL0
 PGV7OZabC9F62SdZnpoTLEGa2sYaYiqF2NLOy55uQfRLN8uwoe1cYQ5tsi4kize2Wz2u
 +7wsuaLB4w/M3cy3fRcTmrDHmnadHF6ovV/JD/Uplq9SjKHMqrHC5j/PmUad0tkbALoY
 /jfUkRl1ZrNoH/l9ajdMH+vEU8+vRDOXJYqroeoeXTCKYksIhZ08LXLkV+zwVrBQT1hW
 FXTjnuKetwldJK5Gm+/LoGxARjU7Hagg7K+HDCqhzp+PlWLuzqp7/fIIrdPrODCV+GQI
 PEkA==
X-Gm-Message-State: AO0yUKV0d1Ljsqk8U+8yYMLYW7dpNXPQ1szPpM+3hl4cDABfvAgW56hb
 yVN9ZKC4ZGsTHKEATBVipEVlsosatZUTk7TbSoR6Vm0gbwJhFlbTUcqk5tWYEGMNhRou1tMf/mW
 C8dlSBzCR6ZvDwFAf4/U9hiv8rwYfTLZN/jsxi4fs+We/
X-Received: by 2002:a17:90b:2645:b0:237:39b1:7c5f with SMTP id
 pa5-20020a17090b264500b0023739b17c5fmr9684pjb.96.1676995310468; 
 Tue, 21 Feb 2023 08:01:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+7t/vLNHtsxzvT2bollF+HO+l6TckmTWA3PewfgaKv+tlYXZrcfQ/NIzB6QL95XtxeqfTMakmosPDQgkjw3lw=
X-Received: by 2002:a17:90b:2645:b0:237:39b1:7c5f with SMTP id
 pa5-20020a17090b264500b0023739b17c5fmr9677pjb.96.1676995310112; Tue, 21 Feb
 2023 08:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <20230221103753.205082d3@eldfell>
In-Reply-To: <20230221103753.205082d3@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 21 Feb 2023 17:01:36 +0100
Message-ID: <CA+hFU4xexaHAYsbGm6PdNfVFHBgOS4WiMo=AU0Gi5cYt566aTg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 9:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 20 Feb 2023 08:14:47 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Sat, 18 Feb 2023 13:15:49 -0800
> > > Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> > > > wait (as opposed to a "housekeeping" wait to know when to cleanup after
> > > > some work has completed).  Usermode components of GPU driver stacks
> > > > often poll() on fence fd's to know when it is safe to do things like
> > > > free or reuse a buffer, but they can also poll() on a fence fd when
> > > > waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> > > > lets the kernel differentiate these two cases.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >
> > > Hi,
> > >
> > > where would the UAPI documentation of this go?
> > > It seems to be missing.
> >
> > Good question, I am not sure.  The poll() man page has a description,
> > but my usage doesn't fit that _exactly_ (but OTOH the description is a
> > bit vague).
> >
> > > If a Wayland compositor is polling application fences to know which
> > > client buffer to use in its rendering, should the compositor poll with
> > > PRI or not? If a compositor polls with PRI, then all fences from all
> > > applications would always be PRI. Would that be harmful somehow or
> > > would it be beneficial?
> >
> > I think a compositor would rather use the deadline ioctl and then poll
> > without PRI.  Otherwise you are giving an urgency signal to the fence
> > signaller which might not necessarily be needed.
> >
> > The places where I expect PRI to be useful is more in mesa (things
> > like glFinish(), readpix, and other similar sorts of blocking APIs)
>
> Sounds good. Docs... ;-)
>
> Hmm, so a compositor should set the deadline when it processes the
> wl_surface.commit, and not when it actually starts repainting, to give
> time for the driver to react and the GPU to do some more work. The
> deadline would be the time when the compositor starts its repaint, so
> it knows if the buffer is ready or not.

Technically we don't know when the commit is supposed to be shown.
Just passing a deadline of the next possible deadline however is
probably a good enough guess for this feature to be useful.

One thing that neither API allows us to do is tell the kernel in
advance when we're going to submit work and what the deadline for it
is and unfortunately that work is the most timing sensitive.

>
>
> Thanks,
> pq
>
>
> >
> > BR,
> > -R
> >
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > > > ---
> > > >  drivers/dma-buf/sync_file.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > > index fb6ca1032885..c30b2085ee0a 100644
> > > > --- a/drivers/dma-buf/sync_file.c
> > > > +++ b/drivers/dma-buf/sync_file.c
> > > > @@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
> > > >  {
> > > >       struct sync_file *sync_file = file->private_data;
> > > >
> > > > +     /*
> > > > +      * The POLLPRI/EPOLLPRI flag can be used to signal that
> > > > +      * userspace wants the fence to signal ASAP, express this
> > > > +      * as an immediate deadline.
> > > > +      */
> > > > +     if (poll_requested_events(wait) & EPOLLPRI)
> > > > +             dma_fence_set_deadline(sync_file->fence, ktime_get());
> > > > +
> > > >       poll_wait(file, &sync_file->wq, wait);
> > > >
> > > >       if (list_empty(&sync_file->cb.node) &&
> > >
>

