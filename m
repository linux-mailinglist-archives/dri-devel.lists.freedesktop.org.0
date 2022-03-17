Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523F4DCC7C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D4110E771;
	Thu, 17 Mar 2022 17:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EC610E76D;
 Thu, 17 Mar 2022 17:31:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id r64so3520035wmr.4;
 Thu, 17 Mar 2022 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0emPPmH4Xm9l+KeNi4XBOk+szS7xi7Q8tSwWwk47ygI=;
 b=DS8p6LVvpu/HXVAy0gDC+KFJ3w+zkM9mAQ+nrTgnB/JsWOjdwdJUiMbeyc/e7y0bBq
 /6BBWTYsfYkxcpHR5I40m755o/BWUHErEIlL/IBRYrtrCEssYk68J3+BRN2XtGMrqec7
 4s/Aq4B1jCRA8WopRRk19UBEUxcx04m9Ha+j1MrIkULrRqw5i2+oYM10kZLZjqdvxM+7
 PMvrEoav1DjHZQ7Uow9eAWSd+CP+3SX1UfAb+ezcPOCNa3rhxaIwlF5AED1ZOMZXvrH6
 S4Gq0jbU04mrITtKugc63CmgZB9CadgXNkozFi2ijrdne+M4wDjmKSqHoHgjl6EqQnuM
 UGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0emPPmH4Xm9l+KeNi4XBOk+szS7xi7Q8tSwWwk47ygI=;
 b=8Mq5+X+aeOKoZ/PM4xez0VNbJHsz69Mra5bcLTw6UqTXLP9n0WnL+STqdZivzdLgt0
 ZHhtsVGI3vbC0ILOObOO1ratZM68W1PlTstrzomP1Fj6tEimmOqzRQNOmpiMfI5H0Plm
 Se3rsiJzpfAsHsUGeVESHDMEwbFgkUn8V7twcuoc5LG2GcH02hRx05DWzU7lSecCsW85
 jvUPXoHsX3oMPUEcVfHpKvX+WRMI/vgke7l8PbhTfeyFvaXbf6Punkh3Siebr5p/EHyh
 TwxexDZRIi20z3H550JNvK75QDhzGc6yb4wVt4Rr230muYj6hrYSECPcT3IoFhVW1Lf4
 wAGw==
X-Gm-Message-State: AOAM533U95ipyY3AOhE5PeORjQjVdZx/+7ra44bF/H3vD7fRhOwNVC/y
 51B6+kQDTyaUGtw1mCME6nSQianlF4oPl43jqZA=
X-Google-Smtp-Source: ABdhPJwn9lThLS+nSXAEj06GuSDmDIPnxI1CLVl/v/iE35DOPYO/4YB5Fv4c7oycPImw+0P+q9HPtrJlaxIBubtQnA8=
X-Received: by 2002:a05:600c:600a:b0:38c:6c9e:f9c7 with SMTP id
 az10-20020a05600c600a00b0038c6c9ef9c7mr8526206wmb.26.1647538269242; Thu, 17
 Mar 2022 10:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
In-Reply-To: <YjNvYmcuDKiIneDx@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 10:31:50 -0700
Message-ID: <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 10:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Mar 17, 2022 at 08:40:51AM -0700, Rob Clark wrote:
> > On Thu, Mar 17, 2022 at 2:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Thu, Mar 17, 2022 at 08:03:27AM +0100, Christian K=C3=B6nig wrote:
> > > > Am 16.03.22 um 16:36 schrieb Rob Clark:
> > > > > [SNIP]
> > > > > just one point of clarification.. in the msm and i915 case it is
> > > > > purely for debugging and telemetry (ie. sending crash logs back t=
o
> > > > > distro for analysis if user has crash reporting enabled).. it isn=
't
> > > > > used for triggering any action like killing app or compositor.
> > > >
> > > > By the way, how does msm it's memory management for the devcoredump=
s?
> > >
> > > GFP_NORECLAIM all the way. It's purely best effort.
> > >
> > > Note that the fancy new plan for i915 discrete gpu is to only support=
 gpu
> > > crash dumps on non-recoverable gpu contexts, i.e. those that do not
> > > continue to the next batch when something bad happens. This is what v=
k
> > > wants and also what iris now uses (we do context recovery in userspac=
e in
> > > all cases), and non-recoverable contexts greatly simplify the crash d=
ump
> > > gather: Only thing you need to gather is the register state from hw
> > > (before you reset it), all the batchbuffer bo and indirect state bo (=
in
> > > i915 you can mark which bo to capture in the CS ioctl) can be capture=
d in
> > > a worker later on. Which for non-recoverable context is no issue, sin=
ce
> > > subsequent batchbuffers won't trample over any of these things.
> >
> > fwiw, we snapshot everything (cmdstream and bo's marked with dump
> > flag, in addition to hw state) before resuming the GPU, so there is no
> > danger of things being trampled.  After state is captured and GPU
> > reset, we "replay" the submits that were written into the ringbuffer
> > after the faulting submit.  GPU crashes should be a thing you don't
> > need to try to optimize.
>
> Not sure why you think we optimize anything here?
>
> > (At some point, I'd like to use scheduler for the replay, and actually
> > use drm_sched_stop()/etc.. but last time I looked there were still
> > some sched bugs in that area which prevented me from deleting a bunch
> > of code ;-))
>
> Not sure about your hw, but at least on intel replaying tends to just
> result in follow-on fun. And that holds even more so the more complex a
> workload is. This is why vk just dies immediately and does not try to
> replay anything, offloading it to the app. Same with arb robusteness.
> Afaik it's really only media and classic gl which insist that the driver
> stack somehow recover.

At least for us, each submit must be self-contained (ie. not rely on
previous GPU hw state), so in practice replay works out pretty well.
The worst case is subsequent submits from same process fail as well
(if they depended on something that crashing submit failed to write
back to memory.. but in that case they just crash as well and we move
on to the next one.. the recent gens (a5xx+ at least) are pretty good
about quickly detecting problems and giving us an error irq.

BR,
-R

> And recovering from a mess in userspace is a lot simpler than trying to
> pull of the same magic in the kernel. Plus it also helps with a few of th=
e
> dma_fence rules, which is a nice bonus.
> -Daniel
>
> >
> > BR,
> > -R
> >
> > >
> > > And that way you can record the crashdump (or at least the big pieces=
 like
> > > all the indirect state stuff) with GFP_KERNEL.
> > >
> > > msm probably gets it wrong since embedded drivers have much less shri=
nker
> > > and generally no mmu notifiers going on :-)
> > >
> > > > I mean it is strictly forbidden to allocate any memory in the GPU r=
eset
> > > > path.
> > > >
> > > > > I would however *strongly* recommend devcoredump support in other=
 GPU
> > > > > drivers (i915's thing pre-dates devcoredump by a lot).. I've used=
 it
> > > > > to debug and fix a couple obscure issues that I was not able to
> > > > > reproduce by myself.
> > > >
> > > > Yes, completely agree as well.
> > >
> > > +1
> > >
> > > Cheers, Daniel
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
