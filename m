Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF7ABE74E
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 00:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F51810E617;
	Tue, 20 May 2025 22:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gVdqaJmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734E810E617;
 Tue, 20 May 2025 22:31:45 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ad51ba0af48so963207966b.0; 
 Tue, 20 May 2025 15:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747780304; x=1748385104; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfViJTkocBFZaKtNJGCb8qOEo9ZbscCCsSMtkpHUjAw=;
 b=gVdqaJmjxDfmmGZL1x0XwxhQ7tkMlwjDPB3iaugqZtGgs+wIQYyeRfk+4irEODoocK
 R7f9f9G5PXYXcghOTZWfOgLIIqWAaCsMprsOG1GXH/pVAdt04nRO+UtEGilUS3Xz+gvZ
 vX56tlCJFalKhKLZyK1pJ4S+fUztnxMqw+kBMvc5ETAf58xnWY2LdIWZev7YcGfjcw9l
 ysWVcZh9Pk0/pKpkY9JwwXZjjzkqi1SCkozce4HCcGtmDdKOyu9HIokGL2eqJnyYvED3
 rng0MeGSDzI3+0FqAwWxIY2c67vpBCt1NAG9F+gr84JOY6io+uh8v8XLfqvBgcqBmVf9
 KYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747780304; x=1748385104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfViJTkocBFZaKtNJGCb8qOEo9ZbscCCsSMtkpHUjAw=;
 b=ZAy/Yhn7lQHkAkm83qTM3gIvUW59t045rlOARR+EO+9B26QJas1Rn/VPpSWvhDRyvY
 k3JY15JgWKwf7ubqODXhXWDdaK4X4t5J32qDHW3yw35QS/6uB5Ot9XOOXcA+GPjxdiZy
 pCIpapQ3R7sFiSEePVTRTnqE3VxY9IEn1qspOdAOd+A6hTn4lJb7fOm1QzDw5k/ifTaY
 ng/tesA1vo1W923AMX9bUD/B7iaN+YkaQ3EiYhMVK9s9mpv5p6Be+W0eWRGAStmnoYUv
 IRPaXcQPdGGFxbKQXbLIK5FnDChhxj1JdbNKZXnca/v2tj4NaU5SsygMuIjnWnhWbKwv
 2I7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoAYexBr1Mjrke6c5CFXqI41TJ0iu10BPYHPqLd6ULOtRgouDNDbmPjIrcVf6Ew07V0ovD7wE7tGNk@lists.freedesktop.org,
 AJvYcCWzAB5V+Fmko6DJnNkFqB1w5qO5N0RR9kCFtw3uUNtMpXAgNWkjwL7OaFDfIIN9aECjdvhSKRhR/8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfeYbP3G5nOz5NKTtcYAp4WxsEE/RWSb4b53XYw1OPkbFrl/tE
 sOpJvrCPZWXoUeDk0iC16w1MYc1JWMbjMFZ3oZ2woMaBv/BsB3KADD/5YrGZBzTRKVwOZcC2d2b
 qWTErF8FuL0/p1I6WktWuGOrrpuVPuUU3ErfcqLs=
X-Gm-Gg: ASbGncuaWpPNK49+4PH/jmtvv0vRC634xjfFAc5RsrhWyV+LITE5eUxvJ7ZOWdGqkW1
 5ktCnHfYnpcqhTjRkcoAepAjk35m/lPG1sHny8iam9Ky98kT3fAQqoHBb8IBFHjz8GL9TfJhQtc
 fPaPasBepaAkEz8BGUOEFzfS5IOLRvFwhVeCMPH99zIg==
X-Google-Smtp-Source: AGHT+IHy1qy9Y9Iw/2PjuoPWfqMC/gE8vuaoRZoeD3b3kOntxxhSfTFnxCi25EtDFYsyoHHlawo3lUz4LJtHhfQlWCs=
X-Received: by 2002:a17:907:7d86:b0:ad5:6258:996f with SMTP id
 a640c23a62f3a-ad56258a94fmr1093719966b.19.1747780303506; Tue, 20 May 2025
 15:31:43 -0700 (PDT)
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
In-Reply-To: <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 May 2025 08:31:31 +1000
X-Gm-Features: AX0GCFsKkEmiEjqukzoqKCLeCFvPEzUImMvmitaMXLQCSIsFSJxiY59ID8GzQYM
Message-ID: <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
To: Rob Clark <robdclark@gmail.com>
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

On Wed, 21 May 2025 at 07:53, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, May 20, 2025 at 2:25=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel=
.org> wrote:
> > > >
> > > > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@k=
ernel.org> wrote:
> > > > > > Anyways, I don't agree with that. Even if you can tweak your dr=
iver to not run
> > > > > > into trouble with this, we can't introduce a mode that violates=
 GOUVM's internal
> > > > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON()=
.
> > > > > >
> > > > > > I still don't see a real technical reason why msm can't be rewo=
rked to follow
> > > > > > those lifetime rules.
> > > > >
> > > > > The basic issue is that (a) it would be really awkward to have tw=
o
> > > > > side-by-side VM/VMA management/tracking systems.  But in legacy m=
ode,
> > > > > we have the opposite direction of reference holding.  (But at the=
 same
> > > > > time, don't need/use most of the features of gpuvm.)
> > > >
> > > > Ok, let's try to move this forward; I see three options (in order o=
f descending
> > > > preference):
> > > >
> > > >   1) Rework the legacy code to properly work with GPUVM.
> > > >   2) Don't use GPUVM for the legacy mode.
> > > >   .
> > > >   .
> > > >   .
> > > >   3) Get an ACK from Dave / Sima to implement those workarounds for=
 MSM in
> > > >      GPUVM.
> > > >
> > > > If you go for 3), the code introduced by those two patches should b=
e guarded
> > > > with a flag that makes it very clear that this is a workaround spec=
ifically
> > > > for MSM legacy mode and does not give any guarantees in terms of co=
rrectness
> > > > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
> > >
> > > I'm not even sure how #2 would work, other than just copy/pasta all o=
f
> > > drm_gpuvm into msm, which doesn't really seem great.
> > >
> > > As for #1, even if I could get it to work, it would still be a lot
> > > more mmu map/unmap (like on every pageflip, vs the current state that
> > > the vma is kept around until the object is freed).  For the
> > > non-VM_BIND world, there are advantages to the BO holding the ref to
> > > the VMA, rather than the other way around.  Even at just a modest
> > > single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the unma=
p
> > > costs a tlbinv).  So from that standpoint, #3 is the superior option.
> > >
> >
> > Before we get to #3, I'll need a bit more info here on why you have to
> > map/unmap the VMA on every pageflip.
>
> Previously we'd keep the VMA hanging around until the GEM obj is
> freed.  But that can't work if the VMA (via the VM_BO) is holding a
> reference to the GEM obj.
>
> I was kinda thinking about keeping the VMA around until the handle is
> closed.. but that doesn't cover the dma-buf case (ie. when you
> re-import the dma-buf fd each frame.. I know android does this, unsure
> about other wsi's).
>
> > But actually I think 2 is the best option, I think in nouveau this is
> > where we ended up, we didn't modify the old submission paths at all
> > and kept the old bo/vm lifetimes.
> >
> > We just added completely new bind/exec ioctls and you can only use one
> > method once you've opened an fd.
>
> hmm, but that means tracking VMAs against a single BO differently..
> which.. at least seems ugly..

I don't think it is if you already have the code to do that, and just
add gpuvm support in parallel.

You also have to figure out that the world is moving towards Vulkan
for everything so any optimisations you've made for particular legacy
paths will need to be dealt with in the future picture anyways.

But I'd rather not hack gpuvm into being something it isn't, if there
is a meaningful commonality in legacy bo/vm bindings across drivers,
we could create something new, but the ref counting and handling is
pretty fundamental to gpuvm architecture.

There should only be two paths, legacy and gpuvm, and you shouldn't
ever be mixing them on a particular exec path, since you should only
have a vm per userspace fd, and can pick which way to use it the first
time someone calls it.

Dave.
Dave.
