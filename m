Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561C68358A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 19:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5AD10E2AB;
	Tue, 31 Jan 2023 18:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB6310E04C;
 Tue, 31 Jan 2023 18:44:55 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-163ba2b7c38so8737087fac.4; 
 Tue, 31 Jan 2023 10:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iv1Igjerq6NXEZLA2i08sz9J8DRiao6paFj75uy5Ivg=;
 b=nXNS0qByg621bOH1SiyZOEyXqYqIdi5MuV7jNd0OizbaQvE8QbkteAW/U8F2h/bbHG
 4eMa/kY5Coam/8Ba9jBPB5RVcDE8YijngSMgRSjtPvl6hUPIKElNCyqRBSxJQULJH9cC
 vSsC0QchGvAB7/bytdN0y+BduSPFiuDNpdYvpKj5wHyVcQOdROvKH/Lu6Q/fCja+rEh4
 jBXptht5e7xWxA/6CiLIC1dO/YU3koodi3nMM13CrBj6s9rKN5u31jdxxJmWk9nTNzwf
 sa2XFkfSyD/5H0GAQuYVKpE7FKQoTJz980HcaO6cwhn4eaTRbLFQCEkB0IqnIwPw4hlT
 hRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iv1Igjerq6NXEZLA2i08sz9J8DRiao6paFj75uy5Ivg=;
 b=aFNVZvBh5bK7PLTl/LXXKVNf+qYRgIHt0rbU9ZK0c7wjVAyMVwnXLJpA0+6Kl9mWQj
 RlsjWl7zqPCb/LXfPSUBuKQl1jZ0EhWbPICP47Z5dGfp7CtO0M/BLACYF+MJozh0dSxf
 z3LqJjoQ9jRGUgJY8jHMzb/sNLp55RLjxtohHVpnKjGdR16ZfxfV1iBtt39t5ZsWD4zy
 byU8Sauc67MPGT/naG8aj3GEyHJ1BQ4l6qj6n7mlPD/JMibX786SdazZuJpwomth9Bfg
 Ef3j9JxrGrCkoXeaeXip9TL/GttJI1OF+g0r8AyFGY1PG133D3Mn15rMsXsLzZmgqiqt
 I8GA==
X-Gm-Message-State: AO0yUKV/LHDALDof0qmergUe9r4f0ijWi1NnfCF1EYuruBKPathcJ0WM
 c9NNKdh/lbhvaVmhhlsa87pG2EwI6NwIZdGVOTU=
X-Google-Smtp-Source: AK7set+b0GS9OkNpYOemUv+yehiU9m0eLVzhJDa0AXvtAgYIfg5j1nUCRHpxSWEbX0PE/0b/t8jZPILSQG4MmDlPbys=
X-Received: by 2002:a05:6870:b522:b0:163:8cc6:86a with SMTP id
 v34-20020a056870b52200b001638cc6086amr1654513oap.46.1675190694268; Tue, 31
 Jan 2023 10:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
 <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <6a5bea62-b711-6f2e-b366-a1083bc7327f@igalia.com>
 <CADnq5_OdBJiDa9Y2s6orJu7Ez0Lkx37xceHhfDCDnKNKdvpT7g@mail.gmail.com>
 <94f48675-54be-6d88-8940-86c90ebf1e1c@igalia.com>
In-Reply-To: <94f48675-54be-6d88-8940-86c90ebf1e1c@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 13:44:42 -0500
Message-ID: <CADnq5_NsUzN5eBaxhobgJS3FBZfuJ7o-prS2ZeDvfbahUWiy4g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 1:23 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 31/01/2023 14:52, Alex Deucher wrote:
> > [...]
> >> (b) We can't use sched.ready, which would make sense...but amdgpu
> >> overrides its meaning, the driver manipulates this value for its own
> >> purposes of tracking ring init, or something like that.
> >>
> >> This is the tangential topic: what should we do here? My understanding
> >> of Alex's message is that we could have a "ready" field in the ring
> >> structure and stop messing with sched.ready - does it make sense Alex?
> >
> > Yes, I think so.  The tricky part will be figuring out which current
> > sched.ready checks are checking for the scheduler being ready vs.
> > whether the ring itself is ready.
> >
>
> Thanks, makes sense!
>
> $ grep -nr "sched.ready" drivers/gpu/drm/amd/ | wc -l
> 83
>
> Maybe not super tough, I hope heh
>
> >>
> >> Guchun / Christian, does it also make sense for you?
> >>
> >>
> >> Regarding (a), I could re-submit having s/sched.name/sched.ops, no
> >> biggies, I tested both to be fair, before sending...I just chose name
> >> but any field that is proper initialized on drm_sched_init() would work.
> >
> > Yeah, I think ops is fine.  You could even use sched.ready after we
> > clean up the use of that in the driver.  There are already a bunch of
> > places where we check sched.ready to check if the scheduler really is
> > ready.
>
> Hmm..unfortunately, doesn't work. This was a case in which sched.ready
> was set to true in the ring init routine, but scheduler wasn't properly
> initialized. So, a different key for comparison is required..I'll
> re-submit with sched.ops.
>
> After a potential rework of the driver to get rid of sched.ready
> manipulation, then it could be fixed to properly use this flag...makes
> sense to you?

Yeah, sounds good.

Thanks!

Alex

>
> Tnx again for the prompt review!
> Cheers,
>
>
> Guilherme
