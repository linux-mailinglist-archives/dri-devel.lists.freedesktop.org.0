Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D65ABE5FC
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 23:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4802410E313;
	Tue, 20 May 2025 21:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iA8nQe7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D60C10E264;
 Tue, 20 May 2025 21:25:26 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ad564b7aea9so559301466b.1; 
 Tue, 20 May 2025 14:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747776325; x=1748381125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jjei6tpJPSQ0e9U9wsr0Ul9qD6v36GQZR4JG0Hi36U4=;
 b=iA8nQe7n8VPV5Vjgk/Ovo4bZjvv5UpLbWJzMUhKgVI3mld5i8X74qwb7LblSNPHk5C
 Ia7wspbBuTINjfdD9lwADdG+nkR6pZKKbToHmz3flGyumTXoxwZgaunCaDHuabxFZ/zG
 cWXxhExuTfiOLkg0H3l1me15kCbLZdPodyMPOTfEUZ4B46vSxV2NgvFGm89skmNIvGIN
 LmYF3NL8Sdj62ZK1x2Qusqwq+GnrMTBRX091PFyxYnKaJTHesqNxvvFrrVjKEEnxoZ0S
 TlnMNdPvAt2hzguH0huiOl9SD5xQg+uHO3J4BbHZmBKbiq6i7D4XLV3apyZZ1yjUsUwh
 bGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747776325; x=1748381125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjei6tpJPSQ0e9U9wsr0Ul9qD6v36GQZR4JG0Hi36U4=;
 b=Dq/DiPpp130dxJQ204GDQdjztxaOjXJu/UxciJ6OxRQmnDrVsXfhfVf7DMb7+Jij6o
 ybtNtVEmGRxKP8QCzMTd1N6dCFVNCs2FK/kMtRUpKwMkvNPJcaRF6HMVa8ANo7+9z0dz
 AcoSRziR38VE70+pJFQBtCz+fAiGcc0Bbw4q4Quw4+2W70EJxtnrWXuwPTSGKDeXjRPy
 oLxy8NkDdetJmUrAXfKZpToKDvhiF2zky91JKXhnspMtCZdcNNBdzVsGf8QKHLlBD+Di
 K4nGiNAfVZXPtelKseiSbhOwblepZhoFtTYsh/97xrqVKntDpW47BShViEL7oNQ906Fc
 2Wng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFKamQBTDW0/hNJloFFUcbPkkHBrIzvwrLNbG/NrtYtVHvv9r7VsqTw/vhDTmHk+vywRsIxyLAAkI=@lists.freedesktop.org,
 AJvYcCXBCMafM+kpia1lJnU02NKFeaZaUB03/HfD2F/UMouX6Frnrqqrr9IXvqSrK7JgxSwHZxU0fwUzQHEW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdencF8ZNAJ45IuySwAB2V3kBAOOPRMI1UHCqrxB1BhjWk2TuY
 XOm/OGT3jvbh3Vb4k+b4U0bur0eFSuFWwjF/+fK+SyTKD1iWV53Jj5zCtqU7ot9Bu/Xzng+Co5K
 3SLdraFo8ugtI/7G0euY4oKRDGaNiiyw=
X-Gm-Gg: ASbGncvtC+mW5Cce3uSMHPjCsxo2F6YChUel5BPv5s+c5j2SQN6GADz8NvoRuEiqSS7
 LlUiKxqEGN9eITlw7a7z49xJwHs3bIlV4Ccgi/x6f68SpwMg2WWp66sRI3OQYdpNxh2BVArAsKS
 MQGuzN/isUHgTesKY3V6Rh1VyeShvzNIg=
X-Google-Smtp-Source: AGHT+IHeiaUdgEFO2So4GMMibHxdFP3yxkv+J8hkFxYuUz58iYp5XzJt7h08dQw7tqbTQ4mjFmNIXYkCfPjkMRBsMMs=
X-Received: by 2002:a17:907:9603:b0:ad2:2e9d:7517 with SMTP id
 a640c23a62f3a-ad52f32194emr1593154366b.8.1747776324656; Tue, 20 May 2025
 14:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
 <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
 <aCb-72KH-NrzvGXy@pollux>
 <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
In-Reply-To: <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 May 2025 07:25:13 +1000
X-Gm-Features: AX0GCFs9mt-wQ318QgIa3qoAgEMylqDYXoQTma-NV3k90LdxrvoZJdBGinnYee0
Message-ID: <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
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

On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@kerne=
l.org> wrote:
> > > > Anyways, I don't agree with that. Even if you can tweak your driver=
 to not run
> > > > into trouble with this, we can't introduce a mode that violates GOU=
VM's internal
> > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
> > > >
> > > > I still don't see a real technical reason why msm can't be reworked=
 to follow
> > > > those lifetime rules.
> > >
> > > The basic issue is that (a) it would be really awkward to have two
> > > side-by-side VM/VMA management/tracking systems.  But in legacy mode,
> > > we have the opposite direction of reference holding.  (But at the sam=
e
> > > time, don't need/use most of the features of gpuvm.)
> >
> > Ok, let's try to move this forward; I see three options (in order of de=
scending
> > preference):
> >
> >   1) Rework the legacy code to properly work with GPUVM.
> >   2) Don't use GPUVM for the legacy mode.
> >   .
> >   .
> >   .
> >   3) Get an ACK from Dave / Sima to implement those workarounds for MSM=
 in
> >      GPUVM.
> >
> > If you go for 3), the code introduced by those two patches should be gu=
arded
> > with a flag that makes it very clear that this is a workaround specific=
ally
> > for MSM legacy mode and does not give any guarantees in terms of correc=
tness
> > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
>
> I'm not even sure how #2 would work, other than just copy/pasta all of
> drm_gpuvm into msm, which doesn't really seem great.
>
> As for #1, even if I could get it to work, it would still be a lot
> more mmu map/unmap (like on every pageflip, vs the current state that
> the vma is kept around until the object is freed).  For the
> non-VM_BIND world, there are advantages to the BO holding the ref to
> the VMA, rather than the other way around.  Even at just a modest
> single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the unmap
> costs a tlbinv).  So from that standpoint, #3 is the superior option.
>

Before we get to #3, I'll need a bit more info here on why you have to
map/unmap the VMA on every pageflip.

But actually I think 2 is the best option, I think in nouveau this is
where we ended up, we didn't modify the old submission paths at all
and kept the old bo/vm lifetimes.

We just added completely new bind/exec ioctls and you can only use one
method once you've opened an fd.

Dave.
