Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D864D9E27
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 15:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B76A10E41F;
	Tue, 15 Mar 2022 14:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73010E3F9;
 Tue, 15 Mar 2022 14:54:51 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso24526129ooe.6; 
 Tue, 15 Mar 2022 07:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O5c2HdIhkprCpyjlLljNc6aujxkAw7+Q1TnvWqO195g=;
 b=BiL04o2EorLoo/g5nv94g26keyabrRXNGoeK5R0uGI7d8rm0IQiWlVKuxB+g8qo7h8
 hTOx8iMeUxMyQNmBfyrC5z4WVQPpOrLQceKtv5as+BRd0ReWb/TowWbJtEnHu6FXXAxn
 i/BvrvaicB1stUmnycuHHFQYgweckuixbpjWhWQ+gOYGOB820FsHCG4kBzvFMyKW6gAt
 QVyAv4qA7bXxrOHF9fynTu/S3jMsPNCL45HgJlJtDgRKfJ2KbojjRxemovBW0lt8EG3a
 v5iR7usahmYLx5fZWcqpBFNSpTZ7Q59IY6b2/tHYGWZ27Msc898dnpdRe/aObZVCSExj
 /4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O5c2HdIhkprCpyjlLljNc6aujxkAw7+Q1TnvWqO195g=;
 b=TIyOAjHYoQTysqeImYdaN4vf8XJ/fQI5y7Z0n2l5tdP7mJDzqndAhTFnVQ/Q05OM+c
 A1HcFt8foGLGPqmoNI6KMBWLTMTwqmX9NqKg0S2xFsFEd520aHmRmfPRd9iRmUMD7Tw4
 UKEn9gMcC02nFBnLx4QGAy8W3Zq15fwcYXU4QuWElRLGVhJzrqtXJEkpVTRmn7KkKwaP
 AKsSX4VmYcBVrStXmFEYl2xKun0RxDabLWG76/eEOXrEx4aEiUb9Bg1WGYiEQ9sQOVBa
 7kqSY1Lrh04OVswCQBCF9VwOQuu6mvIooenZ3KAhJfbxgWmDPxqPPpWKdpzIy52q7r9Q
 74kg==
X-Gm-Message-State: AOAM531YLuKLDp1H0cnxc23BXo0pEzxt52JvhHnPdzlpZo4yh46rirDU
 +oII4zJSo4ZQHCfTPdHgIcIdqt4Tpy+GchTmp+M=
X-Google-Smtp-Source: ABdhPJwgV/hmfo786Rla9A7tTxduXdXpT0oBLM7nlGEstBlnJQ6xhl5Htsxqcpcv1bvEqRC7jLH4+o66nnVlvGlbT4o=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:2b29 with SMTP id
 h16-20020a056870d25000b000da0b3f2b29mr1535146oac.200.1647356090406; Tue, 15
 Mar 2022 07:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
In-Reply-To: <20220314172647.223658d2@eldfell>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Mar 2022 10:54:38 -0400
Message-ID: <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 11:26 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 14 Mar 2022 10:23:27 -0400
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Fri, Mar 11, 2022 at 3:30 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Thu, 10 Mar 2022 11:56:41 -0800
> > > Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > > For something like just notifying a compositor that a gpu crash
> > > > happened, perhaps drm_event is more suitable.  See
> > > > virtio_gpu_fence_event_create() for an example of adding new event
> > > > types.  Although maybe you want it to be an event which is not device
> > > > specific.  This isn't so much of a debugging use-case as simply
> > > > notification.
> > >
> > > Hi,
> > >
> > > for this particular use case, are we now talking about the display
> > > device (KMS) crashing or the rendering device (OpenGL/Vulkan) crashing?
> > >
> > > If the former, I wasn't aware that display device crashes are a thing.
> > > How should a userspace display server react to those?
> > >
> > > If the latter, don't we have EGL extensions or Vulkan API already to
> > > deliver that?
> > >
> > > The above would be about device crashes that directly affect the
> > > display server. Is that the use case in mind here, or is it instead
> > > about notifying the display server that some application has caused a
> > > driver/hardware crash? If the latter, how should a display server react
> > > to that? Disconnect the application?
> > >
> > > Shashank, what is the actual use case you are developing this for?
> > >
> > > I've read all the emails here so far, and I don't recall seeing it
> > > explained.
> > >
> >
> > The idea is that a support daemon or compositor would listen for GPU
> > reset notifications and do something useful with them (kill the guilty
> > app, restart the desktop environment, etc.).  Today when the GPU
> > resets, most applications just continue assuming nothing is wrong,
> > meanwhile the GPU has stopped accepting work until the apps re-init
> > their context so all of their command submissions just get rejected.
> >
> > > Btw. somewhat relatedly, there has been work aiming to allow
> > > graceful hot-unplug of DRM devices. There is a kernel doc outlining how
> > > the various APIs should react towards userspace when a DRM device
> > > suddenly disappears. That seems to have some overlap here IMO.
> > >
> > > See https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#device-hot-unplug
> > > which also has a couple pointers to EGL and Vulkan APIs.
> >
> > The problem is most applications don't use the GL or VK robustness
> > APIs.
>
> Hi,
>
> how would this new event help with that?

This event would provide notification that a GPU reset occurred.

>
> I mean, yeah, there could be a daemon that kills those GPU users, but
> then what? You still lose any unsaved work, and may need to manually
> restart them.
>
> Is the idea that it is better to have the app crash and disappear than
> to look like it froze while it otherwise still runs?

Yes.  The daemon could also send the user some sort of notification
that a GPU reset occurred.

>
> If some daemon or compositor goes killing apps that trigger GPU resets,
> then how do we stop that for an app that actually does use the
> appropriate EGL or Vulkan APIs to detect and remedy that situation
> itself?

I guess the daemon could keep some sort of whitelist.  OTOH, very few
if any applications, especially games actually support these
extensions.

>
> >  You could use something like that in the compositor, but those
> > APIs tend to be focused more on the application itself rather than the
> > GPU in general.  E.g., Is my context lost.  Which is fine for
> > restarting your context, but doesn't really help if you want to try
> > and do something with another application (i.e., the likely guilty
> > app).  Also, on dGPU at least, when you reset the GPU, vram is usually
> > lost (either due to the memory controller being reset, or vram being
> > zero'd on init due to ECC support), so even if you are not the guilty
> > process, in that case you'd need to re-init your context anyway.
>
> Why should something like a compositor listen for this and kill apps
> that triggered GPU resets, instead of e.g. Mesa noticing that in the app
> and killing itself? Mesa in the app would know if robustness API is
> being used.

That's another possibility, but it doesn't handle the case where the
compositor doesn't support any sort of robustness extension so if the
GPU was reset, you'd lose your desktop anyway even if the app kept
running.

>
> Would be really nice to have the answers to all these questions to be
> collected and reiterated in the next version of this proposal.

The idea is to provide the notification of a GPU reset.  What the
various desktop environments or daemons do with it is up to them.  I
still think there is value in a notification even if you don't kill
apps or anything like that.  E.g., you can have a daemon running that
gets notified and logs the error, collects debug info, sends an email,
etc.

Alex

>
>
> Thanks,
> pq
