Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE335ABA0BA
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FCB10EB1E;
	Fri, 16 May 2025 16:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EjaTaaHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB30510EB1B;
 Fri, 16 May 2025 16:20:43 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-85e751cffbeso155324339f.0; 
 Fri, 16 May 2025 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747412440; x=1748017240; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mT/Vsqhlq5iMS/QXBvcl16DqfLTsg9iUCxC/+p3/IyE=;
 b=EjaTaaHTGe1p8hng3tQSzmoJGFNAT209uPVY5NBqgnwj5SLoVPghjNNcc6XFX1BxfJ
 y73TF7wexcd0fEVKqh1VRy/imG4FXPwgwiJti15dAXsz94Bx/q2/v7GOHE66hVbtKK4L
 lC7lGW6nfVtB5bdNcDIHlzdgN8Y59UxR8zVEdBBIxN0wbBZhDWumQNCRwO+3Tp24ijDZ
 QE0dAxWIsVupqTiHSjco21kFwwkeJZmbbTt0hHFUf7utQ/F6IQKEJdWx/VHNMOFm6vz/
 Rtt1ywPtiltWoRfNB+MD4PgbOIz8Uq3mCkpqHbO/3G+RH+uJdfjoy66s77+QpzNnXZ5N
 GdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747412440; x=1748017240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mT/Vsqhlq5iMS/QXBvcl16DqfLTsg9iUCxC/+p3/IyE=;
 b=PzqCg6gQMMMUrIw/gGC9/txcOYhOmfyyORoxSMAAijnLDMn8KCVcQjG5Pj/8l2WJdf
 1gVUwSmRj6pnLn2RTaKH3C1wVn9matP1O7YR0ItmFkhy7m4WVWkeAGmLv7l7tHmAwi0N
 IRrkHFPO1Iu9ky8URsRFmQKGPJVivAl9+Nh3INb3DR2iwxBb91oOJXo2YAT16QmvTlpD
 jzETdIeI/PXLH2Dz5kaRR2JON1LDdhi18FwRZky/sCXqoUh98fLAGdwv5ZHBsLS5se89
 8f2ebvtteB8AbmxXvcwOilQ2xUvTa6ufO5umZoT6R50ub7IIanchQcB0BkpchaSy+ynz
 gXBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsaZCvUoXH0xh2s82ltBGs+cKKitbNnI52IS+6BwqG6M9B4uKH8JL5UDJQOSS7K3oPppDH0be9qHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQIuhKfNoi+Zmfe5G6dzRO5ZlAEdWKBM14PkUPaYaSVLlehCda
 L3/Rb8gbiS7ZK7AYzJ9+ethbakaQVd3QvvEdDayNdNVBJTq1lhjzADqPxLrInbauttacfkeAdgp
 x21uYgSEFgP3IW00ydogGszdLxd/DQZI=
X-Gm-Gg: ASbGncu888PGU3iEuRzfQ8Dbhz5aXcTwSf8bwnZHs3wcRW+rd3DGB6MeXpSOEFuhniI
 3deWLZGwqaqxqSeVHO3Om9W6iMvpcHlFzlVy/kfY+Wa6vcFpJSqwu2MSxjRL24zBsyVDYghV3Sj
 oTFgeBDlwF/2jSoEBIa8yL7NrbIqsaCRUdWeDelFIJ06b6G0sifMC4ZWhdEQLYPw==
X-Google-Smtp-Source: AGHT+IHC22IsC+3PhSpVeBM4f8XtPUyPUQIGsJ0NXAFw0bJzSA+bcpEP1Wgy59i2TILp96QoX7r/vuNK+QzWWSMkZuM=
X-Received: by 2002:a05:6e02:339f:b0:3d4:2409:ce6 with SMTP id
 e9e14a558f8ab-3db857282d6mr32363085ab.5.1747412440172; Fri, 16 May 2025
 09:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
 <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
 <aCb-72KH-NrzvGXy@pollux>
In-Reply-To: <aCb-72KH-NrzvGXy@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 16 May 2025 09:20:27 -0700
X-Gm-Features: AX0GCFuCbsPiWqD4XrqPgC4swP3tk-lMdO3-9EFfEFghtloLESQfLQoMv-hd73E
Message-ID: <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > > Anyways, I don't agree with that. Even if you can tweak your driver t=
o not run
> > > into trouble with this, we can't introduce a mode that violates GOUVM=
's internal
> > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
> > >
> > > I still don't see a real technical reason why msm can't be reworked t=
o follow
> > > those lifetime rules.
> >
> > The basic issue is that (a) it would be really awkward to have two
> > side-by-side VM/VMA management/tracking systems.  But in legacy mode,
> > we have the opposite direction of reference holding.  (But at the same
> > time, don't need/use most of the features of gpuvm.)
>
> Ok, let's try to move this forward; I see three options (in order of desc=
ending
> preference):
>
>   1) Rework the legacy code to properly work with GPUVM.
>   2) Don't use GPUVM for the legacy mode.
>   .
>   .
>   .
>   3) Get an ACK from Dave / Sima to implement those workarounds for MSM i=
n
>      GPUVM.
>
> If you go for 3), the code introduced by those two patches should be guar=
ded
> with a flag that makes it very clear that this is a workaround specifical=
ly
> for MSM legacy mode and does not give any guarantees in terms of correctn=
ess
> regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.

I'm not even sure how #2 would work, other than just copy/pasta all of
drm_gpuvm into msm, which doesn't really seem great.

As for #1, even if I could get it to work, it would still be a lot
more mmu map/unmap (like on every pageflip, vs the current state that
the vma is kept around until the object is freed).  For the
non-VM_BIND world, there are advantages to the BO holding the ref to
the VMA, rather than the other way around.  Even at just a modest
single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the unmap
costs a tlbinv).  So from that standpoint, #3 is the superior option.

BR,
-R
