Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6064DB62D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 17:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C4E10E631;
	Wed, 16 Mar 2022 16:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC10410E603;
 Wed, 16 Mar 2022 16:29:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id p9so3692380wra.12;
 Wed, 16 Mar 2022 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bb8+Z0azzVfVSIeFpzbKJmDiX0+ZgsH4eBFgKhBJruU=;
 b=Oz1nYLF3hvjLCblFWvNr6HzVwe6Nruxnz+sM+hPnmw5cD+EcFKos2LlBF0/4VqYegY
 gaiXhFJPumHdnOE3Xv3xhkXgUBgL70NDzKYp/5Dkxprah9XV8NHq0fWLlGsBWvaamAb7
 scay8LaZRu3UXjJXUQ7alLse4zAf32SKsiBTm6FaFCKL9tdSbZxnb+x9ytzH0yNla8wz
 hqHag1npSV8durpPLQd0S4qblnqv2H2DDgaoZN6wI6BjtgPLUILKzSQeCGPE8RTHwJRM
 iVN/xJ+G4BsOksUBQ6iZ3uQaqUopSrvv/5+DHtE7OIOtiFI0wU74hYgNQEIK1Ny+8agS
 4vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bb8+Z0azzVfVSIeFpzbKJmDiX0+ZgsH4eBFgKhBJruU=;
 b=JJ9R19oMR6VYUKu8eBa/CegydbPE2OCsAxbsBLnfj97n3/8Hjd94RRYUM2lfI0ppEs
 FB14xMVhPRM3fYaWVB3sG32qpay49Uxv9x/1/XeNFBflpWpbk2BjTA2YW8dMWwTlqgo6
 SJ8cx1+5rjsu9n1VnyM3t/YRbpvLaEMauZNZZl42quyvOBXSjwYupdQHVjM4sgLX/5R8
 TZng5ShRyXdNUmEy3KOzJymKLBLdsGjtUKBYK51EW7zazqHpTQVFOdTrqIDpQxxnVHtQ
 ag1qqMSjp0LLhHXZ8IOERHEKt5WDsRc4ZeBxccIbtwEcgJ0ojSzdAWWuiTd75FxbvZqy
 F2UA==
X-Gm-Message-State: AOAM5317wBG5UNQNIQqaHSxxqydu8BhYPZerlpqa5+qvcV4M9tARu334
 DvCG8or4TnzXADnCSLeh7aYVGF1n9QfwyG7lWCc=
X-Google-Smtp-Source: ABdhPJxmecBN4dPLJkwQ9VswgQo3TmOk8wD1SYcuMDQtjlKsaWAoYcReEUem/doB4EeOXm7shSMjhQ8oKYH3o7QwexY=
X-Received: by 2002:a5d:64c1:0:b0:203:7aa5:9390 with SMTP id
 f1-20020a5d64c1000000b002037aa59390mr611566wri.328.1647448194228; Wed, 16 Mar
 2022 09:29:54 -0700 (PDT)
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
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <CADnq5_O2CVSLxShPFCzMxiXmnHXYbW1vFLJ5K=oigtXshULvqw@mail.gmail.com>
In-Reply-To: <CADnq5_O2CVSLxShPFCzMxiXmnHXYbW1vFLJ5K=oigtXshULvqw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 16 Mar 2022 09:30:35 -0700
Message-ID: <CAF6AEGvbuPd6YtX3kRofOoEpLj9KG1mrqyQwaGpPmQ=X-VM8CA@mail.gmail.com>
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

On Wed, Mar 16, 2022 at 8:48 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Mar 16, 2022 at 11:35 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Mar 16, 2022 at 7:12 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Wed, Mar 16, 2022 at 4:48 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > >
> > [snip]
> > > > With new UAPI comes the demand of userspace proof, not hand-waving. You
> > > > would not be proposing this new interface if you didn't have use cases
> > > > in mind, even just one. You have to document what you imagine the new
> > > > thing to be used for, so that the appropriateness can be evaluated. If
> > > > the use case is deemed inappropriate for the proposed UAPI, you need to
> > > > find another use case to justify adding the new UAPI. If there is no
> > > > use for the UAPI, it shouldn't be added, right? Adding UAPI and hoping
> > > > someone finds use for it seems backwards to me.
> > >
> > > We do have a use case.  It's what I described originally.  There is a
> > > user space daemon (could be a compositor, could be something else)
> > > that runs and listens for GPU reset notifications.  When it receives a
> > > notification, it takes action and kills the guilty app and restarts
> > > the compositer and gathers any relevant data related to the GPU hang
> > > (if possible).  We can revisit this discussion once we have the whole
> > > implementation complete.  Other drivers seem to do similar things
> > > already today via different means (msm using devcoredump, i915 seems
> > > to have its own GPU reset notification mechanism, etc.).  It just
> > > seemed like there was value in having a generic drm GPU reset
> > > notification, but maybe not yet.
> >
> > just one point of clarification.. in the msm and i915 case it is
> > purely for debugging and telemetry (ie. sending crash logs back to
> > distro for analysis if user has crash reporting enabled).. it isn't
> > used for triggering any action like killing app or compositor.
>
> Sure.  you could use this proposed event for telemetry gathering as
> well.  The important part is the event.  What you do with it is up to
> the user.

True, but for that purpose (telemetry) let's leverage something that
userspace already has support for

> > I would however *strongly* recommend devcoredump support in other GPU
> > drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
> > to debug and fix a couple obscure issues that I was not able to
> > reproduce by myself.
>
> Agreed.  I think devcoredump makes sense and we'll ultimately enable
> support for that in amdgpu.  I think there is value in a GPU specific
> reset event as well for the use case I outlined, but maybe the
> devcoredump one is enough.  We'd just need to rely on the userspace
> side to filter as appropriate for events it cares about.  I'm not sure
> how many other devcore dump events are commonly seen.

They are, like CPU coredumps, not expected to be a frequent thing.
There are a number of other non-GPU drivers which also use devcoredump
(mostly wifi and remoteproc, ie. things like DSPs).  We did also
recently add msm devcoredump support for the display side of things,
in addition to gpu, to dump display state if we hit underruns, link
training fail, etc.  Each "crash" creates a new transient devcore
device so crashes from different devices can be reported in parallel.
But we do rate-limit the GPU crash reports by not reporting another
one until the previous one is read out and cleared by userspace.  (You
don't strictly need to do that, but it is probably a good idea..
usually the first crash is the interesting one.)

The ChromeOS crash-reporter does have an allow-list for which devcore
dumps are sent back, mainly because in the case of wifi drivers it is
hard to ensure that the dump does not include PII (like network names,
etc).  It would be pretty trivial to add amdgpu to the allow-list and
setup a "magic signature" so that queries could be run on amdgpu
devcore dumps.  I can help out with that, since I went through the
same process already for msm.

I'm not entirely sure what other distros do in this area.

BR,
-R
