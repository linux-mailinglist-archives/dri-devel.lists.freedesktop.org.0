Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 192ED500F9F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F106910FBC8;
	Thu, 14 Apr 2022 13:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9657610E349;
 Thu, 14 Apr 2022 13:34:14 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so5227499fac.11; 
 Thu, 14 Apr 2022 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XCfsT0LfAlICAD9oZRhAUrFRwEA1PH1SFubMtLshPaE=;
 b=VMo/42PEboafArOZ5d0CVuOpvvGgylH/Q9DYRAhJcDngzoqbYx4UGGbF9GunfDpcfm
 Nft2g73lEJxKHe7GghognHhM4JIK6qXQdbxN3bim3K7LVt3SFVtnJkFQxqFfW2yetUJ3
 LFdjxA9qdRNEJidANl+1HZnDtWla425zvuLocqMb5dSMjFgd/LWTSzOWeBN+0AsgdIdz
 mWYorUrZxAzX8ymVkpMQdeScjwYDqIUmulI3ZnvNaOUrLAOhTB9+AG38hcOmCPUy8Yqo
 MegA8R4iVVMo48fefPFICpYkpipV/FHyKMlEwxqHKz1MZ06sxvqQOPMHf8L1BqPCPNTq
 5UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XCfsT0LfAlICAD9oZRhAUrFRwEA1PH1SFubMtLshPaE=;
 b=MiBKjFzuLft7IlwPeJCJflACRgmabG1dUVScyBaZfHSSHRw4J940Y7339h1ObMgEy/
 Fz4IuH9oML0GFrjxWU3s74QAc8h94I6SyREiH86uWNxKP//2cGDMpmfgHXkBwrJTitJK
 E3KUbJmRSWMV34sj7ddUkvFIQuL6H56GxjpZOGfgmZi7acDNQ359Sb+SzvvykrbvXW6L
 LR8aLSgiaibfuEgk1roVxPR2JUsxh3Zgvyzh9HpoCGGhE5vkuimSGBSWdu3lrVH/HpTS
 t8Jc+H6SNOBsZ1v/00r2QmYURDl1QdxVrBITEx/IUsj9r2hsIDlsUfqujPHSbnaslhU9
 hIOg==
X-Gm-Message-State: AOAM5331E1wKonSFuo3oi2UIR4Da1uwybghYujW02dLKm8atwBi/sH90
 OmLXOrb3wGkH5ir07c8DwasF1Auu9cafBHlvh/bjj85kCTM=
X-Google-Smtp-Source: ABdhPJzsJyQnYKPY4UjDXh6SzDMzDxeLLWqDxaW8O/c5mq1c87UloVcaRCX/jrsbx274SgMZvcWz2hd76YscbXBQOJ8=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr1474336oaa.200.1649943253781; Thu, 14
 Apr 2022 06:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
 <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
 <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
In-Reply-To: <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Apr 2022 09:34:02 -0400
Message-ID: <CADnq5_Npy02mWVMOs-TMQ9t6OLV8XFaSQFZ5iB=Y2q3OQgiQvw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 4:44 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 14.04.22 um 09:37 schrieb Michel D=C3=A4nzer:
> > On 2022-04-14 08:24, Christian K=C3=B6nig wrote:
> >> Am 13.04.22 um 18:14 schrieb Michel D=C3=A4nzer:
> >>> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >>>
> >>> Fixes compile errors with out-of-tree builds, e.g.
> >>>
> >>> ../drivers/gpu/drm/radeon/r420.c:38:10: fatal error: r420_reg_safe.h:=
 No such file or directory
> >>>      38 | #include "r420_reg_safe.h"
> >>>         |          ^~~~~~~~~~~~~~~~~
> >>
> >> Well stuff like that usually points to a broken build environment.
> > Just a separate build directory. Specifically, I'm hitting the errors w=
ith
> >
> >   make -C build-amd64 M=3Ddrivers/gpu/drm
> >
> > Generated headers such as r420_reg_safe.h reside in the build directory=
, so source files in the source directory can't find them without an explic=
it search path.
>
> I'm trying to swap back into my brain how all of this used to work, but
> that's a really long time ago that I tried this as well.
>
> > Are you saying that should get added automagically somehow?
>
> Yes, exactly that. I'm like 95% sure that used to work, but I don't know
> why exactly either.
>
> > FWIW, this is pretty common in the kernel according to git grep.
>
> Maybe Alex or somebody else with some more background in the kernel
> Makefiles could jump in and help here.

I don't remember either.  I vaguely recall the build support for the
mkregtable stuff being reworked a while ago.  A quick zip through the
git logs shows a series from Masahiro Yamada from 2020.

Alex
