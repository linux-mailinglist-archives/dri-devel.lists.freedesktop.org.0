Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978609294C0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 18:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFD010E06B;
	Sat,  6 Jul 2024 16:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EaSJ8QUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC2310E037;
 Sat,  6 Jul 2024 16:36:37 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2c95ca60719so1665456a91.3; 
 Sat, 06 Jul 2024 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720283796; x=1720888596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OS/e5X8AeoMEo6aWPpRtgD4CgR/73R+ByeVN6ZU4krU=;
 b=EaSJ8QUWRZZRIU1oeT0XMupOf6Y4V68+b3dedgE2AwgDUdTN80fIonFtlzDjM5+InI
 jkQuvx/XOcZd0Te9U6QCBTpMXv3JhV2BQM5ebA6GVni+R+rjHFscuEFWckzWv1i9V7Sc
 bu3vZBpZJ3997zwK+7IAIY7zRkFZQuW1pWaA+xpSiZg7fV0oQ03KPn9JmOYzO0DfNeBS
 n2STswPJPoV38T1Z3pi+S8JtWAkMYb+UHXSWX+EODlJbAQkDWFpi683ksnWWUf/cIGvt
 QRH25eF428ZSMuqMwPLdTbg7m7CI0vvr5MlNakeLcb4Vxukepvl8MvlMpzwm68I/91pf
 pt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720283796; x=1720888596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OS/e5X8AeoMEo6aWPpRtgD4CgR/73R+ByeVN6ZU4krU=;
 b=JoWeZTy/aHJZJGrNu5Qf/CAX6Amh6je1YATkkjdO+3wj2BaVMd8qqef7dz1sX0UfBx
 M10stf6Q/FQlrxtI+yeon80TrdmUCXt5vnolhlVZJImgcdxLVIgBkYGJg4FF4EE16ahs
 W+L2ESOpHokwSbAzElBmc6QSSDp0KpXoJ6qcUGQ3rZTEhUCoSxA1SgQx6V7dk0wYkOVa
 5txn5F8TabS3XhK3aAtywTYRl7Lt3p50r0/iVBar5alow/CqTIsL2SAamIp3zhqRbCql
 55cjebZ+5vrRYAEudcqe9UXdSSy6oWsL2EuTlVeTL7FrUd0AvyG4nHoZdEgcCcyYTElA
 Pakg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR0AuLMqqUGMXYmEwnP8V/+dnvx7u0YY7733yZJlVAe4upvbWz+Wo3I5sXSou53ngDJKfalBk0hVHAuOGt0lxIHXKqsr4eERRMkEFyd5UaZxK5Xm8vQwRUnAGJoZQOuhYenaC/GsNylmQfGdi7zA==
X-Gm-Message-State: AOJu0YyStCAZmZ1ywF+psWw1wRqiN4GZvmd9Y1aXOaXvXhXVymS/LbzD
 RtasR0LCmA/L1VBoDyaopNg3nvIKAR/iJp+8ADDG27qYjp1V0jZgszA0ClFxo9GX48X93STn88T
 374tuOysdLzTJRuaBWdgizl4aD76MzQ==
X-Google-Smtp-Source: AGHT+IE6+ycFi3cn9EaplC8GQUc1u5KyD80X0dCkx8jYOMZdjYCrQUlKyoGBZWGsCJBXyqgtAaF7hV/eShS/nfJoWjQ=
X-Received: by 2002:a17:90a:f195:b0:2c9:6aae:ac08 with SMTP id
 98e67ed59e1d1-2c99c6af5famr4494292a91.17.1720283796482; Sat, 06 Jul 2024
 09:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240703184723.1981997-1-alexander.deucher@amd.com>
 <ZofR4znVEPn5fjPL@phenom.ffwll.local>
In-Reply-To: <ZofR4znVEPn5fjPL@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 6 Jul 2024 12:36:25 -0400
Message-ID: <CADnq5_Nbt1j0jdu1dkc64y-4BaNs+pA2bf6=skG5Ucqpjz+muw@mail.gmail.com>
Subject: Re: [pull] amdgpu, radeon drm-fixes-6.10
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Fri, Jul 5, 2024 at 7:15=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
>
> On Wed, Jul 03, 2024 at 02:47:23PM -0400, Alex Deucher wrote:
> > Hi Dave, Sima,
> >
> > Fixes for 6.10.
> >
> > The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e8=
3826:
> >
> >   Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1=
0-2024-07-03
> >
> > for you to fetch changes up to d0417264437a8fa05f894cabba5a26715b32d78e=
:
> >
> >   drm/amdgpu/atomfirmware: silence UBSAN warning (2024-07-02 18:34:05 -=
0400)
>
> Pulled, thanks.
>
> Also I noticed you have some cherry-picks from -next in here, would be
> good to add a cherry-pick from annotation like drm-intel/xe does (or dim
> cherry-pick does).
>
> It doesn't help to prevent Greg KH from getting confused, but it does hel=
p
> everyone else since cherry-picks tend to cause confusing conflicts.
>

Ok.  Will do.  I used to do that in the past, but got dinged for
referencing commits not in Linus' tree for -fixes, but I guess with
the -next tree that's less of an issue these days.

Alex


> Cheers, Sima
> >
> > ----------------------------------------------------------------
> > amd-drm-fixes-6.10-2024-07-03:
> >
> > amdgpu:
> > - Freesync fixes
> > - DML1 bandwidth fix
> > - DCN 3.5 fixes
> > - DML2 fix
> > - Silence an UBSAN warning
> >
> > radeon:
> > - GPUVM fix
> >
> > ----------------------------------------------------------------
> > Alex Deucher (1):
> >       drm/amdgpu/atomfirmware: silence UBSAN warning
> >
> > Alvin Lee (1):
> >       drm/amd/display: Account for cursor prefetch BW in DML1 mode supp=
ort
> >
> > Fangzhi Zuo (1):
> >       drm/amd/display: Update efficiency bandwidth for dcn351
> >
> > Pierre-Eric Pelloux-Prayer (1):
> >       drm/radeon: check bo_va->bo is non-NULL before using it
> >
> > Roman Li (1):
> >       drm/amd/display: Fix array-index-out-of-bounds in dml2/FCLKChange=
Support
> >
> > Tom Chung (3):
> >       drm/amd/display: Reset freesync config before update new state
> >       drm/amd/display: Add refresh rate range check
> >       drm/amd/display: Fix refresh rate range for some panel
> >
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 53 ++++++++++++++=
+++++++-
> >  .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  3 ++
> >  .../amd/display/dc/dml2/dml2_translation_helper.c  |  1 +
> >  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  2 +-
> >  drivers/gpu/drm/amd/include/atomfirmware.h         |  2 +-
> >  drivers/gpu/drm/radeon/radeon_gem.c                |  2 +-
> >  6 files changed, 59 insertions(+), 4 deletions(-)
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
