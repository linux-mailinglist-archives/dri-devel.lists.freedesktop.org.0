Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D16D77DE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 11:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AE610E8A1;
	Wed,  5 Apr 2023 09:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657DE10E300
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 09:14:07 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bx42so10624557oib.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680686046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+LWss62gkxlG1CdU7TJFzkLixmZVYl2pi1NkWLm3wU=;
 b=KvXvzOAxyVEk80k/JThTQisvfPAFcGlbfMFLw12k7p/s0SLEVZ7nVCX6IGwaqp2IrJ
 5lToLoRmpqO/kRgx4eDgKC4CGmM0uvIrcypSd6CS6LkMv4KGW7nk3g3Mt1zcT7QW/7NZ
 qPXlvynt25X0dltakzHWL5RZYIDWrxl0I+3Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680686046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+LWss62gkxlG1CdU7TJFzkLixmZVYl2pi1NkWLm3wU=;
 b=1zwV1y3r7HJAXKF3EU7fAPxE6IR/ObTFr69QBEMC4qlqz20a5vqQx2XjbSBgwFtbRa
 wZzXm8xeCNkNODGGfyTDxHxiJh07mEYAA3OOm5SUP+TlvDFMPpej34T+XbOckcA5Eou8
 3X4eRGWQ7P3H0Qd/39o+liN9aoxnWPAkoFGqk25XN+tuF0VAoHAHp25Bdxy2Z8NiFuj0
 NpTmzeegUSZc+p6x6xct5TSGrMEMLZi0CYkmB2NGEJvzxrQ6YYTcUMs/VH42x8wCfGDp
 N8ymTcw/4AMq/UAcGJANvi4Xfe0byyJXKIzq409rm3fcWd3Tpil6IYs2CxkIvlwxdT2P
 C5/w==
X-Gm-Message-State: AAQBX9fgPG/qus3lZIzxYyxvvI4fw6aTtsnj20tnHoPozOkh5nOZqLoc
 N5UHj0ezJ2uPVgQn6GojmZCu1Wobl/4ijYiz5z/fuA==
X-Google-Smtp-Source: AKy350Y4aDdPhOZCi6zMUqRH/MBEhjkWy+l+QxJQolyW6W0LTT7Nd8KaOoBS81GWbFBqIVtEpzy1Kn+qK9KExIA4NrE=
X-Received: by 2002:a05:6808:2d8:b0:37a:ec66:a1f with SMTP id
 a24-20020a05680802d800b0037aec660a1fmr1960090oid.8.1680686046297; Wed, 05 Apr
 2023 02:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230403194058.25958-1-joshua@froggi.es>
 <fa0360e4-b845-92ee-3c6d-a593cc4135b5@linux.intel.com>
 <CAKMK7uE7iFJL4_3GD2Vx4g99rJ2tQoLLsFA9GmYw_CBf1VB1Rw@mail.gmail.com>
 <1cdd1c32-f56c-93f3-4e72-51a8782f7b34@linux.intel.com>
In-Reply-To: <1cdd1c32-f56c-93f3-4e72-51a8782f7b34@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 5 Apr 2023 11:13:55 +0200
Message-ID: <CAKMK7uHrR+FmAQjQVEackn3o_eNP4ZHCOTA_jY8-i9bQbX9zTg@mail.gmail.com>
Subject: Re: fdinfo blew up? (Was: [RFC PATCH 0/4] uapi, drm: Add and
 implement RLIMIT_GPUPRIO)
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Asahi Lina <lina@asahilina.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 at 11:11, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 05/04/2023 09:28, Daniel Vetter wrote:
> > On Tue, 4 Apr 2023 at 12:45, Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> Hi,
> >>
> >> On 03/04/2023 20:40, Joshua Ashton wrote:
> >>> Hello all!
> >>>
> >>> I would like to propose a new API for allowing processes to control
> >>> the priority of GPU queues similar to RLIMIT_NICE/RLIMIT_RTPRIO.
> >>>
> >>> The main reason for this is for compositors such as Gamescope and
> >>> SteamVR vrcompositor to be able to create realtime async compute
> >>> queues on AMD without the need of CAP_SYS_NICE.
> >>>
> >>> The current situation is bad for a few reasons, one being that in ord=
er
> >>> to setcap the executable, typically one must run as root which involv=
es
> >>> a pretty high privelage escalation in order to achieve one
> >>> small feat, a realtime async compute queue queue for VR or a composit=
or.
> >>> The executable cannot be setcap'ed inside a
> >>> container nor can the setcap'ed executable be run in a container with
> >>> NO_NEW_PRIVS.
> >>>
> >>> I go into more detail in the description in
> >>> `uapi: Add RLIMIT_GPUPRIO`.
> >>>
> >>> My initial proposal here is to add a new RLIMIT, `RLIMIT_GPUPRIO`,
> >>> which seems to make most initial sense to me to solve the problem.
> >>>
> >>> I am definitely not set that this is the best formulation however
> >>> or if this should be linked to DRM (in terms of it's scheduler
> >>> priority enum/definitions) in any way and and would really like other
> >>> people's opinions across the stack on this.
> >>>
> >>> Once initial concern is that potentially this RLIMIT could out-live
> >>> the lifespan of DRM. It sounds crazy saying it right now, something
> >>> that definitely popped into my mind when touching `resource.h`. :-)
> >>>
> >>> Anyway, please let me know what you think!
> >>> Definitely open to any feedback and advice you may have. :D
> >>
> >> Interesting! I tried to solved the similar problem two times in the pa=
st already.
> >>
> >> First time I was proposing to tie nice to DRM scheduling priority [1] =
- if the latter has been left at default - drawing the analogy with the nic=
e+ionice handling. That was rejected and I was nudged towards the cgroups r=
oute.
> >>
> >> So with that second attempt I implemented a hierarchical opaque drm.pr=
iority cgroup controller [2]. I think it would allow you to solve your use =
case too by placing your compositor in a cgroup with an elevated priority l=
evel.
> >>
> >> Implementation wise in my proposal it was left to individual drivers t=
o "meld" the opaque cgroup drm.priority with the driver specific priority c=
oncept.
> >>
> >> That too wasn't too popular with the feedback (AFAIR) that the priorit=
y is a too subsystem specific concept.
> >>
> >> Finally I was left with a weight based drm cgroup controller, exactly =
following the controls of the CPU and IO ones, but with much looser runtime=
 guarantees. [3]
> >>
> >> I don't think this last one works for your use case, at least not at t=
he current state for drm scheduling capability, where the implementation is=
 a "bit" too reactive for realtime.
> >>
> >> Depending on how the discussion around your rlimit proposal goes, perh=
aps one alternative could be to go the cgroup route and add an attribute li=
ke drm.realtime. That perhaps sounds abstract and generic enough to be pass=
able. Built as a simplification of [2] it wouldn't be too complicated.
> >>
> >> On the actual proposal of RLIMIT_GPUPRIO...
> >>
> >> The name would be problematic since we have generic hw accelerators (n=
ot just GPUs) under the DRM subsystem. Perhaps RLIMIT_DRMPRIO would be bett=
er but I think you will need to copy some more mailing lists and people on =
that one. Because I can imagine one or two more fundamental questions this =
opens up, as you have eluded in your cover letter as well.
> >
> > So I don't want to get into the bikeshed, I think Tvrtko summarized
> > pretty well that this is a hard problem with lots of attempts (I think
> > some more from amd too). I think what we need are two pieces here
> > really:
> > - A solid summary of all the previous attempts from everyone in this
> > space of trying to manage gpu compute resources (all the various
> > cgroup attempts, sched priority), listening the pros/cons. There's
> > also the fdinfo stuff just for reporting gpu usage which blew up kinda
> > badly and didn't have much discussion among all the stakeholders.
> > - Everyone on cc who's doing new drivers using drm/sched (which I
> > think is everyone really, or using that currently. So that's like
> > etnaviv, lima, amd, intel with the new xe, probably new nouveau driver
> > too, amd ofc, panfrost, asahi. Please cc everyone.
> >
> > Unless we do have some actual rough consens in this space across all
> > stakeholders I think all we'll achieve is just yet another rfc that
> > goes nowhere. Or maybe something like the minimal fdinfo stuff
> > (minimal I guess to avoid wider discussion) which then blew up because
> > it wasn't thought out well enough.
>
> On the particular point how fdinfo allegedly blew up - are you referring
> to client usage stats? If so this would be the first time I hear about
> any problems in that space. Which would be "a bit" surprising given it's
> the thing I drove standardisation of. All I heard were positive
> comments. Both "works for us" from driver implementors and positives
> from the users.

The drm/sched implementation blew up. Not the overall spec or the i915
implementation. See the reverts in -rc5 and drm-misc-next.

I think a tad more coordination and maybe more shared code for
drm/sched using drivers probably what we want for this. Or at least a
bit more cross-driver collaboration than here where one side reverts
while the other pushes more patches.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
