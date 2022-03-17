Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE74DCA0A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 16:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13D810E6B4;
	Thu, 17 Mar 2022 15:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B38710E6B4;
 Thu, 17 Mar 2022 15:33:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b19so7850872wrh.11;
 Thu, 17 Mar 2022 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OQkc0YMh+nMgxi8NDmTj17IuIDLM1KrE7Bd2SJj2rZQ=;
 b=DNMyzRshNmkh1/56AFTra1verKI6xzo7BHyOqPdbB0pbo3dj5vN39nl5bShv7PFbWE
 YJomdLGkX587EukNwGZBGgqCM7EflzUm2ksG0n0BeOFmwLjkwedsumv8/I1AFe27t5xQ
 9YfXgCOyaJ+QG0L0VHrjfoQR7TzpJVpAk9VhZkOmBRPEkWj3IOv8R7SQ8gauAjsRRELd
 /q6/IqeWF8urUUPB8epsg5VFfvEKo9VMFvt3+QpLwbmVoCrrmqh+vbbddcO3QViwdgJz
 PQbNFNrXBiN658wLSJ6g/H8skBIMCSEJGm0nTXv/zzA0xGTXz1uPbdyenLv6+jNP5qgS
 18dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OQkc0YMh+nMgxi8NDmTj17IuIDLM1KrE7Bd2SJj2rZQ=;
 b=DopvfbGOZBmt7LPBFmD10mbrjYH770ZMi/QEwYOX31kD7YcPdJN5NR/Hwer7nRPK41
 f3m0waVgZxpgi4y+Njp1olDms8STTPndRei5irBfTDhm7czV8eOgVnEt5dlhc5JYecnA
 D3zLaJQ0uFSyYMdiH2FcL8vfIaJvfB0x+eM4m+e4Gpp095G7MhC30yY5gtSIfKIJS05k
 ktw6N1WT7Y1v+Xn5jOzxfc2IIFhlZYkxFRDeMHcfZieUTOYki79Z2zr3jX6ic3gCg0yl
 6ZFPMyrESnVjcT+I3VgTW8HCXGrMAMFEyrNxaR36OOttfrlSsEuU55pSVlrngeGYrXKZ
 WJIw==
X-Gm-Message-State: AOAM532bZObJDu16pLsL2Azctr0gneXqtQaHEatsEAYPzd01mqBo9xVK
 U+OdZCz4TDjZZ9bnQwFc0v5dkafXMtF4GIB2Bq8=
X-Google-Smtp-Source: ABdhPJxrIp/LBKIsbdcMKp9s/Ou2rQTsD1PwWnOaf3brQeKx2sNVfLMigj4ZLP4QGGDebOqdconlr1eXIvFUCXUGHuw=
X-Received: by 2002:a5d:64c1:0:b0:203:7aa5:9390 with SMTP id
 f1-20020a5d64c1000000b002037aa59390mr4576045wri.328.1647531220030; Thu, 17
 Mar 2022 08:33:40 -0700 (PDT)
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
Date: Thu, 17 Mar 2022 08:34:21 -0700
Message-ID: <CAF6AEGtUasyC1e0Fz2cFhSMEtUJCJTsFQs7+4mg_FP45LwX=4A@mail.gmail.com>
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

We do one GEM obj allocation in the snapshot path (the hw has a
mechanism to snapshot it's own state into a gpu buffer.. not sure if
nice debugging functionality like that is a commentary on the blob
driver quality, but I'm not complaining)

I suppose we could pre-allocate this buffer up-front.. but it doesn't
seem like a problem, ie. if allocation fails we just skip snapshotting
stuff that needs the hw crashdumper.  I guess since vram is not
involved, perhaps that makes the situation a bit more straightforward.

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
>
> And that way you can record the crashdump (or at least the big pieces lik=
e
> all the indirect state stuff) with GFP_KERNEL.
>
> msm probably gets it wrong since embedded drivers have much less shrinker
> and generally no mmu notifiers going on :-)

Note that the bo's associated with the batch are still pinned at this
point, from the bo lifecycle the batch is still active.  So from the
point of view of shrinker, there should be no interaction.  We aren't
doing anything with mmu notifiers (yet), so not entirely sure offhand
the concern there.

Currently we just use GFP_KERNEL and bail if allocation fails.

BR,
-R

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
