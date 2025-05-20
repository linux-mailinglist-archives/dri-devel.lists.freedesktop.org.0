Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7765ABE672
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 23:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A34810E264;
	Tue, 20 May 2025 21:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Janqk/wW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3989610E0D8;
 Tue, 20 May 2025 21:53:01 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-85df99da233so636808539f.3; 
 Tue, 20 May 2025 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747777980; x=1748382780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YuVlqzP6iXct0lFrcIZTm1GBh35JJKL+f7ymQBJygW4=;
 b=Janqk/wWu0rNoI5h49gu9V4KoCyGCEEeHb8OgXUbje/SkhZq3YUuzwttuzWXlDWVJ1
 2kr6x6f8VO/vG+9jCy2n96M2M4FkvzssFdalLx/zZFe3yUfaCKbrmlMpqawJd/7+0kEL
 BsUG696doplkTZzrgFD95NfEVm420Gu7GKypydyAsrcPoZ8gUKhTUmho+c63ejyLYvX6
 JWgz0ze9i18Vj2yJThGMlRG/RPJidirAErRHL8awddV6azi4FHmTvqCR7FYcDpEx/5Ro
 T87kznT83DscR+wooJG4Wu0FJr5lA+Qj75lVXnnVDjf6lOcErWJI8yTXlcy4UiPMnE3L
 Uk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747777980; x=1748382780;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YuVlqzP6iXct0lFrcIZTm1GBh35JJKL+f7ymQBJygW4=;
 b=mimvoKQLPqvMmd5nHV80clttuIh/mY+Y2QhMcoMoq8CAi9ZwJnU083NvmhBnIO+sXS
 Zcg4HaFpKQwngjkPumGpPhtQXVTzRMR+Cp8lcTn03Py8HP0Vrvw1cR7Ar+fNCLsg82/u
 kV26qMy3tvVZPn6zI2m+wpyuytgPnnsUqkZxPKABX9ZClzQHQ47362QobiVFo2Biednn
 Z54HsBprlsxDgUanoJRjSPUVqwjeDZHjRDm3Jeq4ox7SKepI1rLkKmp1R7s9IKfhKm8b
 NbzbVOlffaoM/XhaFrMAd3L3EUfIbqXm3rBCE/PxYDrhFdXWomMUVGM2L27cfaYLRnqW
 VciQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWwVFAOF31ObvnxBEKO8AZP2uTsT7kb3ZJ6hRzAHyj4VgdQ1IitZPZbDH1tF995QUD3izNix36+Yzg@lists.freedesktop.org,
 AJvYcCXcCF+aSwgsw7nuwOEjoUsu9/3x1zVGZoTLNH4tBgmSzTY3EyC/FL/b8u80q/3Wbx4ol0igWyb/ODE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqLVQil/soR/jQsAy43R9qlC8zP0cz+vOZ/Kz1GWCSIRCwYy90
 iXFEhziAu44D1Qgc8d3POGnij+Pqa731RopTfm5mpvlTwPTaMoGwzkf/xSlb9kcdF2qr/1m2n0v
 Hz/n82DBChahQ2B5PLtpJ7r8VwQwd71U=
X-Gm-Gg: ASbGnctAarUMsa/jcCil/h314qQVy0SqyQGcsFiHfA29HHPxzyILvL9ZESevZRvOT4N
 BDi+kqrrOdfYnELLDvQUHFdgmKAbSIzMPuSilpLnXSS2x2ohvErx8uJJ8aKhuSkn3mGKdE17HNI
 0n/2fkU4L+iLvDXt2FVgJEx8wlP7qUzHbdOln5yeb8kp8ckg3rJgnzSXGb3Wpn/uA=
X-Google-Smtp-Source: AGHT+IEuaiBFFGIGy14K80S5naidJLdvAnnIZZeIPE2EBWmxHD5C+BwZzinOlUVBMCvjFMXYVRc6JoejfzwzLAukeFM=
X-Received: by 2002:a05:6602:3f0c:b0:869:fc1b:2194 with SMTP id
 ca18e2360f4ac-86a24be4576mr2729545839f.6.1747777980380; Tue, 20 May 2025
 14:53:00 -0700 (PDT)
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
In-Reply-To: <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 14:52:48 -0700
X-Gm-Features: AX0GCFv1xHSFd5_UP6XbLk2fb4sCVfGSRx4kCq5rhPD3j4LYF5oO5OtYJJS5kN8
Message-ID: <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
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

On Tue, May 20, 2025 at 2:25=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > > Anyways, I don't agree with that. Even if you can tweak your driv=
er to not run
> > > > > into trouble with this, we can't introduce a mode that violates G=
OUVM's internal
> > > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
> > > > >
> > > > > I still don't see a real technical reason why msm can't be rework=
ed to follow
> > > > > those lifetime rules.
> > > >
> > > > The basic issue is that (a) it would be really awkward to have two
> > > > side-by-side VM/VMA management/tracking systems.  But in legacy mod=
e,
> > > > we have the opposite direction of reference holding.  (But at the s=
ame
> > > > time, don't need/use most of the features of gpuvm.)
> > >
> > > Ok, let's try to move this forward; I see three options (in order of =
descending
> > > preference):
> > >
> > >   1) Rework the legacy code to properly work with GPUVM.
> > >   2) Don't use GPUVM for the legacy mode.
> > >   .
> > >   .
> > >   .
> > >   3) Get an ACK from Dave / Sima to implement those workarounds for M=
SM in
> > >      GPUVM.
> > >
> > > If you go for 3), the code introduced by those two patches should be =
guarded
> > > with a flag that makes it very clear that this is a workaround specif=
ically
> > > for MSM legacy mode and does not give any guarantees in terms of corr=
ectness
> > > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
> >
> > I'm not even sure how #2 would work, other than just copy/pasta all of
> > drm_gpuvm into msm, which doesn't really seem great.
> >
> > As for #1, even if I could get it to work, it would still be a lot
> > more mmu map/unmap (like on every pageflip, vs the current state that
> > the vma is kept around until the object is freed).  For the
> > non-VM_BIND world, there are advantages to the BO holding the ref to
> > the VMA, rather than the other way around.  Even at just a modest
> > single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the unmap
> > costs a tlbinv).  So from that standpoint, #3 is the superior option.
> >
>
> Before we get to #3, I'll need a bit more info here on why you have to
> map/unmap the VMA on every pageflip.

Previously we'd keep the VMA hanging around until the GEM obj is
freed.  But that can't work if the VMA (via the VM_BO) is holding a
reference to the GEM obj.

I was kinda thinking about keeping the VMA around until the handle is
closed.. but that doesn't cover the dma-buf case (ie. when you
re-import the dma-buf fd each frame.. I know android does this, unsure
about other wsi's).

> But actually I think 2 is the best option, I think in nouveau this is
> where we ended up, we didn't modify the old submission paths at all
> and kept the old bo/vm lifetimes.
>
> We just added completely new bind/exec ioctls and you can only use one
> method once you've opened an fd.

hmm, but that means tracking VMAs against a single BO differently..
which.. at least seems ugly..

BR,
-R
