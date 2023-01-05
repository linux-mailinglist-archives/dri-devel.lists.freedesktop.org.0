Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E165EAA4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D96310E6F5;
	Thu,  5 Jan 2023 12:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39BC10E6F7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:25:36 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso1913360pjt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4nUYopmwIBpRJdqpZICMeO6gDR6VHAekaC60709RTeI=;
 b=PJd0G6zpD3CcORaS45kHYyEe3i06EzPTYgas9/O4WeqjY34mWC4GcGe0tTHaeqBweX
 WtdBK3kqwzySED8Ityjp4VA9APvcFiNIdxyMf8D2nKf/mYeCTMDvmeJsNsl2MfRFIsIm
 CtEXwJBw7ESVvK6JburmuACJEs2vg3f9ofbg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4nUYopmwIBpRJdqpZICMeO6gDR6VHAekaC60709RTeI=;
 b=emoiuRHd8Z4fb0hcjCYNxN35XbOQgvbiUe8/jBPpPxxUwZ7f1QkynQXsS6R0nYEKci
 /FEOqt01DLSfXmJZCLOVQj2Eb51YIlreUxmsVvu8pzJUqsj3oHJhF8JWlNOQSRtl9WKb
 4G8mIsnefWtXGjzGMPmpLvkrgrQm3hw1jy9A2uQ41ao6UNITHsoyZzzNbn1DIKQNEIm4
 YYyyJFOpIa4HA9fPd/uebT6qYWtHkchf2M0Yd5gqdVkml4eObx34xkP/qFUZXcWfHdGq
 EjIo/X+0zAUurykzT44EvoMUv8omydp6WCY1CR+h55BU3zpyNq9xTPJ2mxO4ACLEyHx7
 VQZw==
X-Gm-Message-State: AFqh2kqWNaMPt8h+co63VrTbIP2YGuVlOfoI9r4p9JKTcCWxJBA6KOtX
 xDL3/GOjca1+x1d6NjFBmtRFG8aI17g5lNq/x+x6oQ==
X-Google-Smtp-Source: AMrXdXsMrsvGfZ9zcCmUuAsttsnhus+TRZSKPI6K2LfCyE6NxYYO5HNHwtroHXoARdU9AVxSr1p0L/gZhNKs1mP+aOs=
X-Received: by 2002:a17:90a:c702:b0:223:f7a8:bd83 with SMTP id
 o2-20020a17090ac70200b00223f7a8bd83mr3141559pjt.10.1672921536196; Thu, 05 Jan
 2023 04:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20221125175203.52481-1-andrealmeid@igalia.com>
 <Y4c6arwh4NAxbeTv@phenom.ffwll.local>
 <CADnq5_NWzWj3vUA2FS7=MKXJ0Wmv4Lu1rBk0ynqWBQZqAz4JLA@mail.gmail.com>
In-Reply-To: <CADnq5_NWzWj3vUA2FS7=MKXJ0Wmv4Lu1rBk0ynqWBQZqAz4JLA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Jan 2023 13:25:24 +0100
Message-ID: <CAKMK7uEac+m2=mp0Uscqa4MvhzQVApcz_g4fCHwLpQrtym8wYw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] drm: Add GPU reset sysfs
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, amaranath.somalapuram@amd.com,
 Pekka Paalanen <ppaalanen@gmail.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com, christian.koenig@amd.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Dec 2022 at 05:54, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Nov 30, 2022 at 6:11 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Nov 25, 2022 at 02:52:01PM -0300, Andr=C3=A9 Almeida wrote:
> > > This patchset adds a udev event for DRM device's resets.
> > >
> > > Userspace apps can trigger GPU resets by misuse of graphical APIs or =
driver
> > > bugs. Either way, the GPU reset might lead the system to a broken sta=
te[1], that
> > > might be recovered if user has access to a tty or a remote shell. Arg=
uably, this
> > > recovery could happen automatically by the system itself, thus this i=
s the goal
> > > of this patchset.
> > >
> > > For debugging and report purposes, device coredump support was alread=
y added
> > > for amdgpu[2], but it's not suitable for programmatic usage like this=
 one given
> > > the uAPI not being stable and the need for parsing.
> > >
> > > GL/VK is out of scope for this use, giving that we are dealing with d=
evice
> > > resets regardless of API.
> > >
> > > A basic userspace daemon is provided at [3] showing how the interface=
 is used
> > > to recovery from resets.
> > >
> > > [1] A search for "reset" in DRM/AMD issue tracker shows reports of re=
sets
> > > making the system unusable:
> > > https://gitlab.freedesktop.org/drm/amd/-/issues/?search=3Dreset
> > >
> > > [2] https://lore.kernel.org/amd-gfx/20220602081538.1652842-2-Amaranat=
h.Somalapuram@amd.com/
> > >
> > > [3] https://gitlab.freedesktop.org/andrealmeid/gpu-resetd
> > >
> > > v2: https://lore.kernel.org/dri-devel/20220308180403.75566-1-contacts=
hashanksharma@gmail.com/
> > >
> > > Andr=C3=A9 Almeida (1):
> > >   drm/amdgpu: Add work function for GPU reset event
> > >
> > > Shashank Sharma (1):
> > >   drm: Add GPU reset sysfs event
> >
> > This seems a bit much amd specific, and a bit much like an ad-hoc stopg=
ap.
> >
> > On the amd specific piece:
> >
> > - amd's gpus suck the most for gpu hangs, because aside from the shader
> >   unblock, there's only device reset, which thrashes vram and display a=
nd
> >   absolutely everything. Which is terrible. Everyone else has engine on=
ly
> >   reset since years (i.e. doesn't thrash display or vram), and very oft=
en
> >   even just context reset (i.e. unless the driver is busted somehow or =
hw
> >   bug, malicious userspace will _only_ ever impact itself).
> >
> > - robustness extensions for gl/vk already have very clear specification=
s
> >   of all cases of reset, and this work here just ignores that. Yes on a=
md
> >   you only have device reset, but this is drm infra, so you need to be
> >   able to cope with ctx reset or reset which only affected a limited se=
t
> >   of context. If this is for compute and compute apis lack robustness
> >   extensions, then those apis need to be fixed to fill that gap.
> >
> > - the entire deamon thing feels a bit like overkill and I'm not sure wh=
y
> >   it exists. I think for a start it would be much simpler if we just ha=
ve
> >   a (per-device maybe) sysfs knob to enable automatic killing of proces=
s
> >   that die and which don't have arb robustness enabled (for gl case, fo=
r
> >   vk case the assumption is that _every_ app supports VK_DEVICE_LOST an=
d
> >   can recover).
>
> Thinking about this a bit more, I think there are useful cases for the
> GPU reset event and a daemon.  When I refer to a daemon here, it could
> be a standalone thing or integrated into the desktop manager like
> logind or whatever.
> 1. For APIs that don't have robustness support (e.g., video
> encode/decode APIs).  This one I could kind of go either way on since,
> it probably makes sense to just kill the app if it there is no
> robustness mechanism in the API.

I think transcode might also be a case where the userspace driver can
recover, at least on the decode side. But that would most likely
require some extension to make it clear to the app what's going on.

Or people just use vk video and be done, reset support comes built-in there=
 :-)

> 2. Telemetry collection.  It would be useful to have a central place
> to collect telemetry information about what apps seem to be
> problematic, etc.

Yeah I think standardizing reset messages and maybe device state dumps
makes sense. But that's telemetry, not making decisions about what to
kill.

> 3. A policy manager in userspace.  If you want to make some decision
> about what to do about repeat offenders or apps that claim to support
> robustness, but really don't.

Imo we should have something for this in the kernel first. Kinda like
oom killer vs userspace oom killer. Sure eventually a userspace one
makes sense for very specific. But for a baseline I think we need an
in-kernel gpu offender killer first that's a bit standardized across
the drivers. Otherwise we're just guarnateed to build the wrong uapi,
with in-kernel first solution we can experiment around a bit first.

> 4. Apps that don't use a UMD.  E.g., unit tests and IGT.  If they
> don't use a UMD, who kills them?

CI framework. They have to deal with outright machine hangs and fun
stuff like that too unfortunately.

> 5. Server use cases where you have multiple GPU apps running in
> containers and you want some sort of policy control or a hand in what
> to do when the app causes a hang.

Yeah also a good idea, but first I think we need some kind of cgroups
that works across drivers. Then maybe the kill/permanent block support
can be integrated there somehow. I don't think just reset kill alone
makes any sense, because you're only stopping one abuse vector and the
entire dam is still totally broken.

tldr; I'm not against reset daemon on principle, I just think we're
not even close to a point where it makes sense to add something like
that and bake in the entire uapi with it.
-Daniel


>
> Alex
>
> >
> > Now onto the ad-hoc part:
> >
> > - Everyone hand-rolls ad-hoc gpu context structures and how to associat=
e
> >   them with a pid. I think we need to stop doing that, because it's jus=
t
> >   endless pain and prevents us from building useful management stuff li=
ke
> >   cgroups for drivers that work across drivers (and driver/vendor speci=
fic
> >   cgroup wont be accepted by upstream cgroup maintainers). Or gpu reset
> >   events and dumps like here. This is going to be some work unforutnate=
ly.
> >
> > - I think the best starting point is the context structure drm/schedule=
r
> >   already has, but it needs some work:
> >   * untangling it from the scheduler part, so it can be used also for
> >     compute context that are directly scheduled by hw
> >   * (amd specific) moving amdkfd over to that context structure, at lea=
st
> >     internally
> >   * tracking the pid in there
> >
> > - I think the error dump facility should also be integrated into this.
> >   Userspace needs to know which dump is associated with which reset eve=
nt,
> >   so that remote crash reporting works correctly.
> >
> > - ideally this framework can keep track of impacted context so that
> >   drivers don't have to reinvent the "which context are impacted"
> >   robustness ioctl book-keeping all on their own. For amd gpus it's kin=
da
> >   easy, since the impact is "everything", but for other gpus the impact
> >   can be all the way from "only one context" to "only contexts actively
> >   running on $set_of_engines" to "all the context actively running" to =
"we
> >   thrashed vram, everything is gone"
> >
> > - i915 has a bunch of this already, but I have honestly no idea whether
> >   it's any use because i915-gem is terminally not switching over to
> >   drm/scheduler (it needs a full rewrite, which is happening somewhere)=
.
> >   So might only be useful to look at to make sure we're not building
> >   something which only works for full device reset gpus and nothing els=
e.
> >   Over the various generations i915 has pretty much every possible gpu
> >   reset options you can think of, with resulting different reporting
> >   requirements to make sure robustness extensions work correctly.
> >
> > - pid isn't enough once you have engine/context reset, you need pid (we=
ll
> >   drm_file really, but I guess we can bind those to pid somehow) and gp=
u
> >   ctx id. Both gl and vk allow you to allocate limitless gpu context on
> >   the same device, and so this matters.
> >
> > - igt for this stuff. Probably needs some work to generalize the i915
> >   infra for endless batchbuffers so that you can make very controlled g=
pu
> >   hangs.
> >
> > Cheers, Daniel
> >
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  4 +++
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 30 ++++++++++++++++++++=
++
> > >  drivers/gpu/drm/drm_sysfs.c                | 26 +++++++++++++++++++
> > >  include/drm/drm_sysfs.h                    | 13 ++++++++++
> > >  4 files changed, 73 insertions(+)
> > >
> > > --
> > > 2.38.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
