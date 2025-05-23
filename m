Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7171EAC1A3F
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 04:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BE310E19E;
	Fri, 23 May 2025 02:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H+NPtY+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC0510E07E;
 Fri, 23 May 2025 02:52:02 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-8647a81e683so213071339f.1; 
 Thu, 22 May 2025 19:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747968722; x=1748573522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTSB0zI8EV3WEUJwB1OwJBkD3PikZdbJJrajz68TKpU=;
 b=H+NPtY+kSthDeMxIOjwz3WK2hgQJcZDM60UjqnNOJ9gpRPBlW2pmcjmj/WtKPTT18F
 gsAIxxFx9/+YJFWJWkrCvONYcAhFxsd8rCiBpj5/Y5LjzMhsbCgIhBI+UMWNMuu7UKgs
 PvZa42Vr194biQRTKxiDt6yB4ykxk2BDxuy/Dx3OTlOmFZDgPUuF0XkKxza9aGPjhtMg
 ZBbN6JfrrhzUDbTn380J6pVizud1fIYT0fOZgOrO0RmZ2bYJUC6gKJTWFkxg6VhGQXT0
 Trlaog0/7kVJdsh/dpWzW4rFxDQrI3LYJ2iG67Or+2oB1YS30oTP4eHEtlfEOYmMZGgb
 Xx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747968722; x=1748573522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTSB0zI8EV3WEUJwB1OwJBkD3PikZdbJJrajz68TKpU=;
 b=M+sVM8zO1OyCaQapLrDnTXs3TMK1uOZiR9axCLDCpEUsU7uvjJQKlsyH/qpk8Jj66d
 g9JO9Sv19q2VNQOD3dU2/drM+PWjtSpF1N9y4NtJ7E7MiAOKYAMDa0O3sKBD9Qb15se/
 RoH+tqNIeYxpiSVG98Baa/kI+W7A9ZwVl51/hmG81fnt9vhX7I2j57un0DeTA7h8s0rH
 tatlrORexuxJKFBEn2ytCDHgEFoHppKpmvbQD5FeTRnyHpmA/YZYs3wiV0SPFUjCsNSL
 qFu4707qve3E73M/qZAXJMa8YGNV7T8CTfErfKNltCLL0BSerFxvlN/bKRMgyvUUKUul
 Md5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5bv4gLKnB/a3P8ecUW+G4d3eNIzG6/E3STcfVwWWlHcxIXyRHau73gNpKpEpiE5yrbmMmO/DxYvDx@lists.freedesktop.org,
 AJvYcCUR2nY0+Hi9Hr2jGJpL4Vv6C3P2cRaSuScr9uVrcVXS+S4RBm90klQQ8vIHPqCfY+brDBJki6xYpi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuT2uXg9r4N4z8y3aecwnvczqyEe/I/NPcXKjb+4D8xWmhKuwy
 xLUlIPTeseZS8vRBOvxLmmlAvQ5gpYv/oYKksJfpKRSLUbrSlB9Epz6LQPJrJr425MnYbqK1fkD
 dqrJ4xfGrN1bzXGkB5Is968YAS0gyMsY=
X-Gm-Gg: ASbGncs3LW0a4N0lmPILpbgTtpJFqVOn+tq4JJ58hVE1vL1j+fHHOdefmcpB8C3G+EV
 fhKZ+XTrWqpHSVn9YNjc5W+tDO42l92tSTwQgFeMe8c16+zUVhoVzY1QGpFsZZlwmTBdHeXJRil
 U2/xitjt4CUOhhpLAat7H05oPA+dRXDEFWJ5PkifpKLKH5hZtRmT4zah2hrAETHCJ2
X-Google-Smtp-Source: AGHT+IGekz0rAdSPy6Esyn61QabmWg59bnZX7oGPMZFq1CRW47PXVM8Ji2t7L5VbUHV5PXKnuAfwbKUUuHc/BlAt9Z0=
X-Received: by 2002:a05:6602:6cc6:b0:861:7237:9021 with SMTP id
 ca18e2360f4ac-86caf0c1576mr176258739f.3.1747968721680; Thu, 22 May 2025
 19:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
 <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
 <aCb-72KH-NrzvGXy@pollux>
 <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
 <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
 <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
 <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
In-Reply-To: <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 May 2025 19:51:50 -0700
X-Gm-Features: AX0GCFv84KCQV61BbxGSWUJ9Yyr5yOTqzENnybuQuOJ009enSSfsiTbWai8yKfg
Message-ID: <CAF6AEGuK+X4Q=Z-anjQuUBi952eYSs3u9HxVz0GSQM8fokdiiw@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
To: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, May 20, 2025 at 3:31=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Wed, 21 May 2025 at 07:53, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, May 20, 2025 at 2:25=E2=80=AFPM Dave Airlie <airlied@gmail.com>=
 wrote:
> > >
> > > On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > >
> > > > > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > > > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > > Anyways, I don't agree with that. Even if you can tweak your =
driver to not run
> > > > > > > into trouble with this, we can't introduce a mode that violat=
es GOUVM's internal
> > > > > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON=
().
> > > > > > >
> > > > > > > I still don't see a real technical reason why msm can't be re=
worked to follow
> > > > > > > those lifetime rules.
> > > > > >
> > > > > > The basic issue is that (a) it would be really awkward to have =
two
> > > > > > side-by-side VM/VMA management/tracking systems.  But in legacy=
 mode,
> > > > > > we have the opposite direction of reference holding.  (But at t=
he same
> > > > > > time, don't need/use most of the features of gpuvm.)
> > > > >
> > > > > Ok, let's try to move this forward; I see three options (in order=
 of descending
> > > > > preference):
> > > > >
> > > > >   1) Rework the legacy code to properly work with GPUVM.
> > > > >   2) Don't use GPUVM for the legacy mode.
> > > > >   .
> > > > >   .
> > > > >   .
> > > > >   3) Get an ACK from Dave / Sima to implement those workarounds f=
or MSM in
> > > > >      GPUVM.
> > > > >
> > > > > If you go for 3), the code introduced by those two patches should=
 be guarded
> > > > > with a flag that makes it very clear that this is a workaround sp=
ecifically
> > > > > for MSM legacy mode and does not give any guarantees in terms of =
correctness
> > > > > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
> > > >
> > > > I'm not even sure how #2 would work, other than just copy/pasta all=
 of
> > > > drm_gpuvm into msm, which doesn't really seem great.
> > > >
> > > > As for #1, even if I could get it to work, it would still be a lot
> > > > more mmu map/unmap (like on every pageflip, vs the current state th=
at
> > > > the vma is kept around until the object is freed).  For the
> > > > non-VM_BIND world, there are advantages to the BO holding the ref t=
o
> > > > the VMA, rather than the other way around.  Even at just a modest
> > > > single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the un=
map
> > > > costs a tlbinv).  So from that standpoint, #3 is the superior optio=
n.
> > > >
> > >
> > > Before we get to #3, I'll need a bit more info here on why you have t=
o
> > > map/unmap the VMA on every pageflip.
> >
> > Previously we'd keep the VMA hanging around until the GEM obj is
> > freed.  But that can't work if the VMA (via the VM_BO) is holding a
> > reference to the GEM obj.
> >
> > I was kinda thinking about keeping the VMA around until the handle is
> > closed.. but that doesn't cover the dma-buf case (ie. when you
> > re-import the dma-buf fd each frame.. I know android does this, unsure
> > about other wsi's).
> >
> > > But actually I think 2 is the best option, I think in nouveau this is
> > > where we ended up, we didn't modify the old submission paths at all
> > > and kept the old bo/vm lifetimes.
> > >
> > > We just added completely new bind/exec ioctls and you can only use on=
e
> > > method once you've opened an fd.
> >
> > hmm, but that means tracking VMAs against a single BO differently..
> > which.. at least seems ugly..
>
> I don't think it is if you already have the code to do that, and just
> add gpuvm support in parallel.
>
> You also have to figure out that the world is moving towards Vulkan
> for everything so any optimisations you've made for particular legacy
> paths will need to be dealt with in the future picture anyways.
>
> But I'd rather not hack gpuvm into being something it isn't, if there
> is a meaningful commonality in legacy bo/vm bindings across drivers,
> we could create something new, but the ref counting and handling is
> pretty fundamental to gpuvm architecture.
>
> There should only be two paths, legacy and gpuvm, and you shouldn't
> ever be mixing them on a particular exec path, since you should only
> have a vm per userspace fd, and can pick which way to use it the first
> time someone calls it.

It's not as much about the exec path, as it is about making all the
non-exec paths (like shrinker/residency) have to deal with two
completely different things..

But I think I have figured out something workable.  I add an extra
refcnt per BO for the vma, incremented by userspace holding a gem
handle, userspace holding a dma-buf fd, or (ofc) actual pin for
scanout.  When the refcount is above zero I defer teardown in the
kms->vm until it drops to zero.  It isn't _exactly_ the same as lazy
VMA teardown when the BO is freed, but it is effectively the same
thing.  And whenever the vma_ref is greater than zero, the BO has
something else holding a ref so the ref loop doesn't matter.  If there
is no userspace process holding a reference to the BO via handle or
dma-buf fd, then it isn't going to be used again in a swapchain, so
the difference btwn tearing down the VMA when the vma_ref drops to
zero vs when the BO is freed doesn't amount to anything.

It's a bit weird adding some extra mechanism specifically for the
scanout vm, and maybe a bit uglier (depending on eye-of-beholder) than
making gpuvm work in either way (since the latter was a pretty
straightforward patch), but less ugly than having to parallel
mechanisms.  So if you _really_ don't like the WEAK_REF flag, I have a
workable alternative that addresses the performance problems.

BR,
-R
