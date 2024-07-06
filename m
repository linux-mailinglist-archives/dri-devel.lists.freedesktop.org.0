Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970AE92951B
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 21:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3A610E095;
	Sat,  6 Jul 2024 19:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Fa3W7s2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E350410E082
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2024 19:20:37 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-25e3d71030cso324500fac.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2024 12:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720293637; x=1720898437; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ikxGv2F7tsE+G14aVyn9PLqKDbvk1ZKaUHJjD1JcbyY=;
 b=Fa3W7s2h8c/ohgTACTgx7kejXklt9UIqq1BqzwfAClJyowDvYnBVeqKJ7Aow0dIzc7
 a/q1PksLzCdpcADweBVsvHftCOzL2JqaCgOLI0njfAiatzIPIGYWPHg02lZ466QdCdkQ
 KK72/Gx/qfl0cG/YFAUPJkyRvBx29SyWNLPx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720293637; x=1720898437;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ikxGv2F7tsE+G14aVyn9PLqKDbvk1ZKaUHJjD1JcbyY=;
 b=uz6TlPe7hJVMCS8dilw6wazm/N5QPyPu+UZUbnRheb5cpqsg8WcUorAWmW7Y+NWeFn
 mSnBO7xGMb8c0WO//XDeJ6FJjdTYC/UQ2Lhymh/QV6l3holhjhtNbhtvS3sHwBkVVo6W
 sqD2+9s7hqmrcl7av7mHUIxx0vPssWxMva9wNGPWtUlBVLXQMIDBnSAXXbtdlaRGUShV
 NlVqszGuWk/i/8jzj4MrCpOUiG+RgbmEjVf+HHvWZjnX87kQP8e3yJiVh0sBJBBfA7jh
 HnfJzDNDAd+XNLsWfwa43OwWupznzUAZ2dUGA4hJ562UNOdqPYSPVs9NmKE26u+BCIO7
 nfZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfUMjxEqBlzFa4nyRn+EpvTAEYdGE5SVQQDaiKCUE/zUe0EcIpeej5di/HPnzTYa/p2Ea03Q9OAfuSm8h5RgUxv6teazjNLAEtoYDUIrvf
X-Gm-Message-State: AOJu0YyN5pNyDaHEvu/PkDcOgbqqOALJbhnhMHMePg0FqT6ORSP97+by
 Oje8r63gYEonQS8PtMae+NnqcDUBpapZ2P5LHlavDIErUu2+WDdIveW+yMrYfs5wZDf5TTai1Qv
 rGZt0Q6CENZi9ylJU7CVX7INoiHMJFpC56WR75A==
X-Google-Smtp-Source: AGHT+IGxjK4Ec31F49wmZ290KqV0vTiKCVLdT2hfQJBLGY3KJLmVdn2U6bfmFttt0ai9vh3nLXNcP+DuR1rGt+MSeD8=
X-Received: by 2002:a05:6871:24d9:b0:254:affe:5a08 with SMTP id
 586e51a60fabf-25e2ba1b287mr7348356fac.2.1720293636810; Sat, 06 Jul 2024
 12:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240703184723.1981997-1-alexander.deucher@amd.com>
 <ZofR4znVEPn5fjPL@phenom.ffwll.local>
 <CADnq5_Nbt1j0jdu1dkc64y-4BaNs+pA2bf6=skG5Ucqpjz+muw@mail.gmail.com>
In-Reply-To: <CADnq5_Nbt1j0jdu1dkc64y-4BaNs+pA2bf6=skG5Ucqpjz+muw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 6 Jul 2024 21:20:25 +0200
Message-ID: <CAKMK7uFY58-kMt6HZ4Wo8JZv4Hm9A86y9p7ptzAmTFTWxNiX0w@mail.gmail.com>
Subject: Re: [pull] amdgpu, radeon drm-fixes-6.10
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, airlied@gmail.com
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

On Sat, 6 Jul 2024 at 18:36, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Fri, Jul 5, 2024 at 7:15=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll=
.ch> wrote:
> >
> > On Wed, Jul 03, 2024 at 02:47:23PM -0400, Alex Deucher wrote:
> > > Hi Dave, Sima,
> > >
> > > Fixes for 6.10.
> > >
> > > The following changes since commit 22a40d14b572deb80c0648557f4bd502d7=
e83826:
> > >
> > >   Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6=
.10-2024-07-03
> > >
> > > for you to fetch changes up to d0417264437a8fa05f894cabba5a26715b32d7=
8e:
> > >
> > >   drm/amdgpu/atomfirmware: silence UBSAN warning (2024-07-02 18:34:05=
 -0400)
> >
> > Pulled, thanks.
> >
> > Also I noticed you have some cherry-picks from -next in here, would be
> > good to add a cherry-pick from annotation like drm-intel/xe does (or di=
m
> > cherry-pick does).
> >
> > It doesn't help to prevent Greg KH from getting confused, but it does h=
elp
> > everyone else since cherry-picks tend to cause confusing conflicts.
> >
>
> Ok.  Will do.  I used to do that in the past, but got dinged for
> referencing commits not in Linus' tree for -fixes, but I guess with
> the -next tree that's less of an issue these days.


You'll still get dinged by Greg, but frankly when he doesn't get it
since like 10 years (that's how long intel cherry-picks everything for
-fixes) it's not an us problem anymore, and it's really useful imo.
-Sima

>
> Alex
>
>
> > Cheers, Sima
> > >
> > > ----------------------------------------------------------------
> > > amd-drm-fixes-6.10-2024-07-03:
> > >
> > > amdgpu:
> > > - Freesync fixes
> > > - DML1 bandwidth fix
> > > - DCN 3.5 fixes
> > > - DML2 fix
> > > - Silence an UBSAN warning
> > >
> > > radeon:
> > > - GPUVM fix
> > >
> > > ----------------------------------------------------------------
> > > Alex Deucher (1):
> > >       drm/amdgpu/atomfirmware: silence UBSAN warning
> > >
> > > Alvin Lee (1):
> > >       drm/amd/display: Account for cursor prefetch BW in DML1 mode su=
pport
> > >
> > > Fangzhi Zuo (1):
> > >       drm/amd/display: Update efficiency bandwidth for dcn351
> > >
> > > Pierre-Eric Pelloux-Prayer (1):
> > >       drm/radeon: check bo_va->bo is non-NULL before using it
> > >
> > > Roman Li (1):
> > >       drm/amd/display: Fix array-index-out-of-bounds in dml2/FCLKChan=
geSupport
> > >
> > > Tom Chung (3):
> > >       drm/amd/display: Reset freesync config before update new state
> > >       drm/amd/display: Add refresh rate range check
> > >       drm/amd/display: Fix refresh rate range for some panel
> > >
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 53 ++++++++++++=
+++++++++-
> > >  .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  3 ++
> > >  .../amd/display/dc/dml2/dml2_translation_helper.c  |  1 +
> > >  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  2 +-
> > >  drivers/gpu/drm/amd/include/atomfirmware.h         |  2 +-
> > >  drivers/gpu/drm/radeon/radeon_gem.c                |  2 +-
> > >  6 files changed, 59 insertions(+), 4 deletions(-)
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
