Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB90B4D9510
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 08:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3550210E481;
	Tue, 15 Mar 2022 07:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08A410E46C;
 Tue, 15 Mar 2022 07:13:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e22so260476edc.13;
 Tue, 15 Mar 2022 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r/yfiEGzkudqIlvWvZC4CSWjo3FqjVQV528We4dp5UI=;
 b=Hgriat48tuZZTIWqRmbMtEIclffPzCPN4juBnBQtQIfm1ZPW7X0WSi83H5OHvOfUqV
 3+mU38I9ATp2t8Ycy9E5whwXEynfHij7He7x/SjbXIVep5YB8xEpZQNenBzKitrPKr4C
 I3I9TY5ss8wJZOM+RYhV2naosrWANOqt125NKabUw97X7vp11/SvpZV8AQoRVTTTHfMv
 XM6BFM9WbDW+OiBZJEAm80mtdymcm0d2fBsHnKLK3IFmRg+SC5sJnbEG1h6ZlNmJ2GSt
 CTTam1UDAjXQfv6Y/Z288wq3Zj79A2cBycnVs0lHUwJSUAnCBazoNB0OkBIPQ0FwXrX3
 Db8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/yfiEGzkudqIlvWvZC4CSWjo3FqjVQV528We4dp5UI=;
 b=75TKPzD7zC9J4VtfygI1DRuZkXlb76ovwy75AJnFhMzBsRFgEIs+JW+gLWjZ0w6gml
 tHGMNzuBgDKHoOPeEgdoYJA7MUeEF4ZLrHhL3sdfI/oJYOarqtuEdpBjZEb9UE79sG7t
 R/93ZZJamEBbq6wW2NedTO5y6GDsxUnMdMBSE+mpz6YYS8bueUh94NePNq71glLpm0vI
 ugoQoJBPXsWAYSCZbovd29rFRbLv1+kBoG0RKr1EBgKXJ1lC5vTNP8y+4+Xq0jyNevw2
 RD2sLIM6Inudym2RQtsAUprQ1NIugGOthPH9q/uk37nB3mHbwRQuospuIRSJ/YLmareW
 GJ9g==
X-Gm-Message-State: AOAM533fsGwFIRx0rWCIWiD+OrBiOFDzHNhP3HDCpj6gQijAzkkQrUq2
 qROrucUnwzjyXBr58Z4IDYf4kCARzy+T1hGhmK8=
X-Google-Smtp-Source: ABdhPJwClBPp4BGltciN/pTILhvAOlS0IaRaEOYsM6YiO7iga/qQZrgUSd8T0SjDEdWLXY88zhAWfKTg8/3o9KngVS8=
X-Received: by 2002:a50:da89:0:b0:413:adb1:cf83 with SMTP id
 q9-20020a50da89000000b00413adb1cf83mr23516968edj.158.1647328426368; Tue, 15
 Mar 2022 00:13:46 -0700 (PDT)
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
In-Reply-To: <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 15 Mar 2022 17:13:34 +1000
Message-ID: <CAPM=9tybizHtKQBHmur8Lh7+pu5CiswZtgcY6SW04y=g0a=YJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Alex Deucher <alexdeucher@gmail.com>
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

On Tue, 15 Mar 2022 at 00:23, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Fri, Mar 11, 2022 at 3:30 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Thu, 10 Mar 2022 11:56:41 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> >
> > > For something like just notifying a compositor that a gpu crash
> > > happened, perhaps drm_event is more suitable.  See
> > > virtio_gpu_fence_event_create() for an example of adding new event
> > > types.  Although maybe you want it to be an event which is not device
> > > specific.  This isn't so much of a debugging use-case as simply
> > > notification.
> >
> > Hi,
> >
> > for this particular use case, are we now talking about the display
> > device (KMS) crashing or the rendering device (OpenGL/Vulkan) crashing?
> >
> > If the former, I wasn't aware that display device crashes are a thing.
> > How should a userspace display server react to those?
> >
> > If the latter, don't we have EGL extensions or Vulkan API already to
> > deliver that?
> >
> > The above would be about device crashes that directly affect the
> > display server. Is that the use case in mind here, or is it instead
> > about notifying the display server that some application has caused a
> > driver/hardware crash? If the latter, how should a display server react
> > to that? Disconnect the application?
> >
> > Shashank, what is the actual use case you are developing this for?
> >
> > I've read all the emails here so far, and I don't recall seeing it
> > explained.
> >
>
> The idea is that a support daemon or compositor would listen for GPU
> reset notifications and do something useful with them (kill the guilty
> app, restart the desktop environment, etc.).  Today when the GPU
> resets, most applications just continue assuming nothing is wrong,
> meanwhile the GPU has stopped accepting work until the apps re-init
> their context so all of their command submissions just get rejected.

Just one thing comes to mind reading this, racy PID reuse.

process 1234 does something bad to GPU.
process 1234 dies in parallel to sysfs notification being sent.
other process 1234 reuses the pid
new process 1234 gets destroyed by receiver of sysfs notification.

Dave.
