Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498484DCA2B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 16:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A1F10E1AC;
	Thu, 17 Mar 2022 15:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFEE10E8C3;
 Thu, 17 Mar 2022 15:40:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t11so7923122wrm.5;
 Thu, 17 Mar 2022 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LyjSbbb305zhYUVT4Pzcpge6Tmxz2u/zA+17cYKA22k=;
 b=YDWgGa+uqEZXRkXdzZtABUw7vBhdNLKz+tPf9ZpzEdBYEi2ROAPDZ/aM5ez2q4TR3e
 DI729mB5EAhUK3mLX7ivXOt8lfmpjdw4MHbYk0p0c9mnQofFtxFtKmm1j3Q416dqgN/P
 bswngS009fg0wY0+SccdHlQgCN2zMiGR962oDdup+ERkWo83y3gVDxcotYsjyfJI/0DY
 RIcgCsS4c39G9PR/DaHnwr+itc0OLU+Rp0pxvurAmnTx5Nj3wdcePq05goKjBOKwUHBt
 pp+oMTuLM8TzVywvFAy/0DUKDS7mgyNd3J26gRl5d6P/k9o8K0CGpXx1nlT0vi5wZ52s
 F5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LyjSbbb305zhYUVT4Pzcpge6Tmxz2u/zA+17cYKA22k=;
 b=Q5UNugfuincT79hGjcp51y5UUlvRWnB4dYZi+HRm4axW7QWDZTKJyRfW/yU6/fZyw9
 dz1Gygq42t/IFbvTBLkIVesRIkkFzK1aLjHGp3LMbkANEKZd2VHtWVN7iMr6OTp4+DVa
 q6Wm0X5ZcAw70NTxSwJrcLHb4G7NDrp1G3cLzDGfFsZYV8h3R8Y+NyM0bE27kBk5GpjJ
 c0tevD1aEy155qRzk/I3D83LxTPs4/ea5KmSU35DCv5vsqFptgzyfjAqsjvxHV3ofVHw
 pAaizBCSGrwdUd9Sdgjf0N1IjGh7omGSTU7LFzjzYaXUQIeg/xdJYPICZmfkmEnntM0W
 3Wpw==
X-Gm-Message-State: AOAM531F8vH52PUyCsfXIC4BeUMnVpL8XHIyTVYZCWrFpvQMg9mT+LwF
 QolewD4Vl6CnN6GF+iDTEsknHX/mjPsFSf8TOS8=
X-Google-Smtp-Source: ABdhPJyRBSs1pyE4Ix+v8Mcy8F1Qe++n8EBde9tXJiuALezxulVSfYvnZukaRwpGrlonSfmtu3Wn3YkTrzgYUkqHe7s=
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr4534132wrj.297.1647531610559; Thu, 17
 Mar 2022 08:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
In-Reply-To: <YjL/k6kh+5RihGIV@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 08:40:51 -0700
Message-ID: <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
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

On Thu, Mar 17, 2022 at 2:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Mar 17, 2022 at 08:03:27AM +0100, Christian K=C3=B6nig wrote:
> > Am 16.03.22 um 16:36 schrieb Rob Clark:
> > > [SNIP]
> > > just one point of clarification.. in the msm and i915 case it is
> > > purely for debugging and telemetry (ie. sending crash logs back to
> > > distro for analysis if user has crash reporting enabled).. it isn't
> > > used for triggering any action like killing app or compositor.
> >
> > By the way, how does msm it's memory management for the devcoredumps?
>
> GFP_NORECLAIM all the way. It's purely best effort.
>
> Note that the fancy new plan for i915 discrete gpu is to only support gpu
> crash dumps on non-recoverable gpu contexts, i.e. those that do not
> continue to the next batch when something bad happens. This is what vk
> wants and also what iris now uses (we do context recovery in userspace in
> all cases), and non-recoverable contexts greatly simplify the crash dump
> gather: Only thing you need to gather is the register state from hw
> (before you reset it), all the batchbuffer bo and indirect state bo (in
> i915 you can mark which bo to capture in the CS ioctl) can be captured in
> a worker later on. Which for non-recoverable context is no issue, since
> subsequent batchbuffers won't trample over any of these things.

fwiw, we snapshot everything (cmdstream and bo's marked with dump
flag, in addition to hw state) before resuming the GPU, so there is no
danger of things being trampled.  After state is captured and GPU
reset, we "replay" the submits that were written into the ringbuffer
after the faulting submit.  GPU crashes should be a thing you don't
need to try to optimize.

(At some point, I'd like to use scheduler for the replay, and actually
use drm_sched_stop()/etc.. but last time I looked there were still
some sched bugs in that area which prevented me from deleting a bunch
of code ;-))

BR,
-R

>
> And that way you can record the crashdump (or at least the big pieces lik=
e
> all the indirect state stuff) with GFP_KERNEL.
>
> msm probably gets it wrong since embedded drivers have much less shrinker
> and generally no mmu notifiers going on :-)
>
> > I mean it is strictly forbidden to allocate any memory in the GPU reset
> > path.
> >
> > > I would however *strongly* recommend devcoredump support in other GPU
> > > drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
> > > to debug and fix a couple obscure issues that I was not able to
> > > reproduce by myself.
> >
> > Yes, completely agree as well.
>
> +1
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
