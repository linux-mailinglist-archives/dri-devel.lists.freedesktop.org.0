Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750F646858
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 05:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228610E45D;
	Thu,  8 Dec 2022 04:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EE510E45B;
 Thu,  8 Dec 2022 04:53:58 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 s30-20020a056830439e00b0067052c70922so255322otv.11; 
 Wed, 07 Dec 2022 20:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6r5U+c8a2HRGVF4kDYEWa6as4axWeEDvF7hATtPweKE=;
 b=GQQK7FJIOYKstw5rEsJw6bJITih9tsKG3OmvmGGrTwPveaK/i9o+k7UPZGDOhPK/Tg
 qHzOCtMeFTHBEWSZcDu0cCoevvmXXCnm8gV/074SrT3XIkkqV5YMvJf+7bkxhGwFm1A9
 UfLc73+Lpp1MTOL4W85ns4vDa4sBeUBEUFfEt4rV4L3/93Nv9pdgmAbKNWu6wJkb3mz1
 Fcr9v21FlIsbKxUqYMDKL1Vvcy41t4ldPHvtWfnkmmYGcEkSmWyLb5mgG6mXLacg8xg4
 TkK/WbU9pguo7SdaiGAdcjh4jP87BhlTcFk6O4W8uamcjp5Y8iPaIySO1ExyJfsOEUXy
 8zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6r5U+c8a2HRGVF4kDYEWa6as4axWeEDvF7hATtPweKE=;
 b=Q7kyM5yxESLCMbUrQv+2JrtjPhesfzmWnEPz8G1LD8jVnSH9487tZoTE8uLG6zlVNq
 WbMNGFOCcnu9i3rgMC+Z/+16nbrASecEGsWeqe5Bue3r+NIFad/hpigNxReQv7ZMALZa
 d5jg1SuaNwwUgrdZIWVKZDRuqcyslv4e9fUqJOB8hrc0OrQNXSuQvUmKQ+Ge5YQSLeNt
 PZMjht3X+6c+SBpIWzSzbfU5PpVavSP3CBF1MdDTg2W37XjnukhCYQmr2f1mrJiyJgv9
 /tk1i+1jwZnjEZMTZ9hEANscoJzGHgNiYQ3ODhgrPR1NF6yuQkzYhdbteeCWkIpAfChp
 K2Jg==
X-Gm-Message-State: ANoB5plEOYtmMS4DFDtdy2NBysc3iaeKWVcYyWEaud1eTvsMbcQGlhSt
 zeC40ipBcEb7/fRz8zXFNZhHGxYQotdKvnhhRYaPt1/YM6w=
X-Google-Smtp-Source: AA0mqf7eIrFrMW71QBI8nysQ1uGOR7bY3uCSg9v+rprkDzHuPkiNCk/RpiUAh4Gjqsr34LKD/0sRDohIBDEAjTNzjHo=
X-Received: by 2002:a05:6830:1b62:b0:66c:7982:2d45 with SMTP id
 d2-20020a0568301b6200b0066c79822d45mr36615910ote.123.1670475237250; Wed, 07
 Dec 2022 20:53:57 -0800 (PST)
MIME-Version: 1.0
References: <20221125175203.52481-1-andrealmeid@igalia.com>
 <Y4c6arwh4NAxbeTv@phenom.ffwll.local>
In-Reply-To: <Y4c6arwh4NAxbeTv@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Dec 2022 23:53:45 -0500
Message-ID: <CADnq5_NWzWj3vUA2FS7=MKXJ0Wmv4Lu1rBk0ynqWBQZqAz4JLA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] drm: Add GPU reset sysfs
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 alexander.deucher@amd.com, contactshashanksharma@gmail.com, 
 amaranath.somalapuram@amd.com, christian.koenig@amd.com, 
 pierre-eric.pelloux-prayer@amd.com, Simon Ser <contact@emersion.fr>, 
 Rob Clark <robdclark@gmail.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Daniel Stone <daniel@fooishbar.org>, 
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>, 
 Dave Airlie <airlied@gmail.com>, 
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 6:11 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Nov 25, 2022 at 02:52:01PM -0300, Andr=C3=A9 Almeida wrote:
> > This patchset adds a udev event for DRM device's resets.
> >
> > Userspace apps can trigger GPU resets by misuse of graphical APIs or dr=
iver
> > bugs. Either way, the GPU reset might lead the system to a broken state=
[1], that
> > might be recovered if user has access to a tty or a remote shell. Argua=
bly, this
> > recovery could happen automatically by the system itself, thus this is =
the goal
> > of this patchset.
> >
> > For debugging and report purposes, device coredump support was already =
added
> > for amdgpu[2], but it's not suitable for programmatic usage like this o=
ne given
> > the uAPI not being stable and the need for parsing.
> >
> > GL/VK is out of scope for this use, giving that we are dealing with dev=
ice
> > resets regardless of API.
> >
> > A basic userspace daemon is provided at [3] showing how the interface i=
s used
> > to recovery from resets.
> >
> > [1] A search for "reset" in DRM/AMD issue tracker shows reports of rese=
ts
> > making the system unusable:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/?search=3Dreset
> >
> > [2] https://lore.kernel.org/amd-gfx/20220602081538.1652842-2-Amaranath.=
Somalapuram@amd.com/
> >
> > [3] https://gitlab.freedesktop.org/andrealmeid/gpu-resetd
> >
> > v2: https://lore.kernel.org/dri-devel/20220308180403.75566-1-contactsha=
shanksharma@gmail.com/
> >
> > Andr=C3=A9 Almeida (1):
> >   drm/amdgpu: Add work function for GPU reset event
> >
> > Shashank Sharma (1):
> >   drm: Add GPU reset sysfs event
>
> This seems a bit much amd specific, and a bit much like an ad-hoc stopgap=
.
>
> On the amd specific piece:
>
> - amd's gpus suck the most for gpu hangs, because aside from the shader
>   unblock, there's only device reset, which thrashes vram and display and
>   absolutely everything. Which is terrible. Everyone else has engine only
>   reset since years (i.e. doesn't thrash display or vram), and very often
>   even just context reset (i.e. unless the driver is busted somehow or hw
>   bug, malicious userspace will _only_ ever impact itself).
>
> - robustness extensions for gl/vk already have very clear specifications
>   of all cases of reset, and this work here just ignores that. Yes on amd
>   you only have device reset, but this is drm infra, so you need to be
>   able to cope with ctx reset or reset which only affected a limited set
>   of context. If this is for compute and compute apis lack robustness
>   extensions, then those apis need to be fixed to fill that gap.
>
> - the entire deamon thing feels a bit like overkill and I'm not sure why
>   it exists. I think for a start it would be much simpler if we just have
>   a (per-device maybe) sysfs knob to enable automatic killing of process
>   that die and which don't have arb robustness enabled (for gl case, for
>   vk case the assumption is that _every_ app supports VK_DEVICE_LOST and
>   can recover).

Thinking about this a bit more, I think there are useful cases for the
GPU reset event and a daemon.  When I refer to a daemon here, it could
be a standalone thing or integrated into the desktop manager like
logind or whatever.
1. For APIs that don't have robustness support (e.g., video
encode/decode APIs).  This one I could kind of go either way on since,
it probably makes sense to just kill the app if it there is no
robustness mechanism in the API.
2. Telemetry collection.  It would be useful to have a central place
to collect telemetry information about what apps seem to be
problematic, etc.
3. A policy manager in userspace.  If you want to make some decision
about what to do about repeat offenders or apps that claim to support
robustness, but really don't.
4. Apps that don't use a UMD.  E.g., unit tests and IGT.  If they
don't use a UMD, who kills them?
5. Server use cases where you have multiple GPU apps running in
containers and you want some sort of policy control or a hand in what
to do when the app causes a hang.

Alex

>
> Now onto the ad-hoc part:
>
> - Everyone hand-rolls ad-hoc gpu context structures and how to associate
>   them with a pid. I think we need to stop doing that, because it's just
>   endless pain and prevents us from building useful management stuff like
>   cgroups for drivers that work across drivers (and driver/vendor specifi=
c
>   cgroup wont be accepted by upstream cgroup maintainers). Or gpu reset
>   events and dumps like here. This is going to be some work unforutnately=
.
>
> - I think the best starting point is the context structure drm/scheduler
>   already has, but it needs some work:
>   * untangling it from the scheduler part, so it can be used also for
>     compute context that are directly scheduled by hw
>   * (amd specific) moving amdkfd over to that context structure, at least
>     internally
>   * tracking the pid in there
>
> - I think the error dump facility should also be integrated into this.
>   Userspace needs to know which dump is associated with which reset event=
,
>   so that remote crash reporting works correctly.
>
> - ideally this framework can keep track of impacted context so that
>   drivers don't have to reinvent the "which context are impacted"
>   robustness ioctl book-keeping all on their own. For amd gpus it's kinda
>   easy, since the impact is "everything", but for other gpus the impact
>   can be all the way from "only one context" to "only contexts actively
>   running on $set_of_engines" to "all the context actively running" to "w=
e
>   thrashed vram, everything is gone"
>
> - i915 has a bunch of this already, but I have honestly no idea whether
>   it's any use because i915-gem is terminally not switching over to
>   drm/scheduler (it needs a full rewrite, which is happening somewhere).
>   So might only be useful to look at to make sure we're not building
>   something which only works for full device reset gpus and nothing else.
>   Over the various generations i915 has pretty much every possible gpu
>   reset options you can think of, with resulting different reporting
>   requirements to make sure robustness extensions work correctly.
>
> - pid isn't enough once you have engine/context reset, you need pid (well
>   drm_file really, but I guess we can bind those to pid somehow) and gpu
>   ctx id. Both gl and vk allow you to allocate limitless gpu context on
>   the same device, and so this matters.
>
> - igt for this stuff. Probably needs some work to generalize the i915
>   infra for endless batchbuffers so that you can make very controlled gpu
>   hangs.
>
> Cheers, Daniel
>
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  4 +++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 30 ++++++++++++++++++++++
> >  drivers/gpu/drm/drm_sysfs.c                | 26 +++++++++++++++++++
> >  include/drm/drm_sysfs.h                    | 13 ++++++++++
> >  4 files changed, 73 insertions(+)
> >
> > --
> > 2.38.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
