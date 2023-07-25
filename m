Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8C760E76
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 11:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF1F10E3C3;
	Tue, 25 Jul 2023 09:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5560A10E3BE;
 Tue, 25 Jul 2023 09:21:31 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-c2cf4e61bc6so5922362276.3; 
 Tue, 25 Jul 2023 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690276890; x=1690881690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6NJjEhrny6Ye0qX+K18rU3b8HaKTQTe4erOXYLog98=;
 b=dx4+0xk0pmKCqyysSvo2m5mJJfzlFNUso9lTwiKk3xHIzULgZAr6OuKKtrvuVpecoZ
 9iEAlPOaKhzZ/1+iAc2ekd7KLLcv/Zg5J+LZR2etBNYgP2/Yxgr8rg7EGXbjqDimhEG1
 k4dOXqvmOH960haQAXJ/tA4FnT/CtIPzA4AhFC2SAz4eWkozJQy7OscMF0/tbXJ5lE78
 DoSKGfgRGkaEZRk4dpqjHnRB1bpKhyRAJzvDZw6o9SHkdl/l9R4ev1VbuYHOZeSO5V4Y
 0uzeAGZCKGUghVwZT+Asd4PItCE3XluUgGG3F8u6QDTIyvo6eytucH2oRgoB7vyc756V
 Tj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690276890; x=1690881690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6NJjEhrny6Ye0qX+K18rU3b8HaKTQTe4erOXYLog98=;
 b=WWRLE0CesscMDYLCHNU3pUczstC0p6S2bNTsxlCaJxgg1vCszlyckV+z/K/SD2zoW6
 f7PUgFzCeIARTMjKTBDjUAOncZLJUImIQ5gLehDn1EkByHlX3h2YsBV52VXX36Zx5tfj
 k/4jvJNNbzPDqwqNoLaEpqEQ8ZCxUlmzd0ep3yCaTGBGjWY1SenSBQcqKpKKW8lvzM6d
 fXhW2qPqXi5wFHbCDEH5Tg2gYmIbh5fNkGnsCU9lRGsGQwVTEmerwzCB7fSHdMUn7hen
 R8LVIs/7VtRzwm7km//qosUhFBb4JiiLer4g6yiYWOUk+hicYU0/bdrRdLwrufF2QhFz
 hjaw==
X-Gm-Message-State: ABy/qLa5vKFk1j7qeLivjGgGv0gJZTH6t/vxasKYZVSsSImEuYYnXjFE
 j9f9MBnTKh0VzyJu5P3Lbo/Nb4LQbDiZew/h2T4=
X-Google-Smtp-Source: APBJJlGx4zODxi8cLrRpYnYhoyx+CEwxud2wIdrt3wx4z0rvDqf2BPJ0bAAPtzhsHdiTnao/AHzYcCRKHkAL7tY3znY=
X-Received: by 2002:a5b:787:0:b0:c9c:e58:f218 with SMTP id
 b7-20020a5b0787000000b00c9c0e58f218mr10510592ybq.11.1690276890357; 
 Tue, 25 Jul 2023 02:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230630115651.354849-1-James.Zhu@amd.com>
 <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
 <CACvgo50YDLkavfidjQAmrsxHWJEtCD6QrC8duuz4F-C144RtDw@mail.gmail.com>
 <PguMcqMlRDvAT5fdpZfgyOWT8DQ1ZLXhgLD0puLL8l0ZYj0UiBvDclFp54l3ov1vH9A7whpUQhY4H65Fh3u6a4aXZzK5a_6fgSKpi4_PXx8=@emersion.fr>
 <CACvgo51i9nBodn6wcxEXQ3Aty+LtHF-5=5owGKtVvbhHqGdHqw@mail.gmail.com>
 <d5rv64CZ72yzMTvfnFQ78-9tKaF5IaDHx5gcEGxHvijBrmdJQX1MS7BEbOU3-fiZzoaH6ZahN5lF2zxP-pgz6qOlOgkEn2k5bVKmlSpt5L4=@emersion.fr>
In-Reply-To: <d5rv64CZ72yzMTvfnFQ78-9tKaF5IaDHx5gcEGxHvijBrmdJQX1MS7BEbOU3-fiZzoaH6ZahN5lF2zxP-pgz6qOlOgkEn2k5bVKmlSpt5L4=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 25 Jul 2023 10:21:18 +0100
Message-ID: <CACvgo51RZsS4mbqUBahOxWFs4kQ=qh7Y-+y-wpzZOx7ZNXYSaQ@mail.gmail.com>
Subject: Re: [PATCH] drm: support up to 128 drm devices
To: Simon Ser <contact@emersion.fr>
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
Cc: jamesz@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Zhu <James.Zhu@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jul 2023 at 14:54, Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, July 17th, 2023 at 15:24, Emil Velikov <emil.l.velikov@gmail.c=
om> wrote:
>
> > > > For going forward, here is one way we can shave this yak:
> > > >  - update libdrm to max 64 nodes
> > > >  - roll libdrm release, nag distributions to update to it // could =
be
> > > > folded with the next release below
> > > >  - update libdrm to use name driven type detection
> > > >  - roll libdrm release, nag distributions to update to it
> > > >  - once ^^ release hits most distributions, merge the above propose=
d
> > > > kernel patch
> > > >    - the commit message should explain the caveats and fixed libdrm=
 version
> > > >    - we should be prepared to revert the commit, if it causes user
> > > > space regression - fix (see below) and re-introduce the kernel patc=
h
> > > > 1-2 releases later
> > >
> > > That sounds really scary to me. I'd really prefer to try not to break=
 the
> > > kernel uAPI here.
> > >
> >
> > With part in particular? Mind you I'm not particularly happy either,
> > since in essence it's like a controlled explosion.
>
> I believe there are ways to extend the uAPI to support more devices witho=
ut
> breaking the uAPI. Micha=C5=82 Winiarski's patch for instance tried somet=
hing to
> this effect.
>
> > > The kernel rule is "do not break user-space".
> >
> > Yes, in a perfect world. In practice, there have been multiple kernel
> > changes breaking user-space. Some got reverted, some remained.
> > AFAICT the above will get us out of the sticky situation we're in with
> > the least amount of explosion.
> >
> > If there is a concrete proposal, please go ahead and sorry if I've
> > missed it. I'm supposed to be off, having fun with family when I saw
> > this whole thing explode.
> >
> > Small note: literally all the users I've seen will stop on a missing
> > node (card or render) aka if the kernel creates card0...63 and then
> > card200... then (hard wavy estimate) 80% of the apps will be broken.
>
> That's fine, because that's not a kernel regression. Supporting more than=
 64
> devices is a new kernel feature, and if some user-space ignores the new n=
odes,
> that's not a kernel regression. A regression only happens when a use-case=
 which
> works with an older kernel is broken by a newer kernel.

Won't this approach effectively hard-code/leak even more kernel uABI
into dozens of not hundreds of userspace projects? This does not sound
like a scalable solution IMHO.

I am 100% behind the "don't break userspace rule", alas very few
things in life are as black/white as your comments seem to suggest.
Thus I would suggest doing a bit of both or a compromise if you will.
Namely:
 - try the initial route outlined above
 - if there are (m)any fires, revert the kernel patch and opt for the
work by Micha=C5=82

This has the benefit of fixing a bunch of the uABI abuses out there,
and leaking more uABI only on as-needed basis.

Side note: KDE folks have their own flatpak runtime and have been
quite open to backport libdrm/other fixes.

HTH
Emil
