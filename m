Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885FB8C262C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 16:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC85710E348;
	Fri, 10 May 2024 14:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5564wuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D6810E12B;
 Fri, 10 May 2024 14:01:33 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2a78c2e253aso1608994a91.3; 
 Fri, 10 May 2024 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715349693; x=1715954493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M47gM14jlXsXTEdg4cITT9rwUDXcMq1XNev12iWev2k=;
 b=m5564wuVRvju8CNx8NDA2p2NJQKisJPhy/SbBtPQ5I2tsLIv057JeuWhJvx6zGRnOH
 CVT5ABpiORw1nKC8FPN6eSnG7GJ7MFiAJUT1rAEiWvM0+vgoq973UrD2A93XIgCv6wgn
 EtZjQBLywYIs5mAqM4XpJGxkzcEHFkNCo3KTqiXZAWHR+e4yFfSPGL0e9REF9yj0UC3y
 dlBiT8v/t5QMPXpjD7ZyJX5fMmFJNMO0z9XOgamotP3k166okSoYCuHe9HBw7o3g7ZWZ
 QK/3hYL73J1QE6x++mAiGvDMv+s15ILCyRPkqeg5XregE2DJJ6mIoF+8mzJ9mSS+rmNc
 cn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715349693; x=1715954493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M47gM14jlXsXTEdg4cITT9rwUDXcMq1XNev12iWev2k=;
 b=UmjPtdF6NmMCokX2gmoADP8acpWWr2yIS6b2g7vsmK6qCAf9tQRtduakSrM2aU3vc3
 uATBvG7JEzZt7XWD6osD5n9I052cZCp6hkUmnAmACjZYi+AQalOlDdNd/1iAjXkGCAIW
 oAf6cTM+BFYwpThWFw+vWCYLPZpjdp2bh9ju3KRsS30A7+PbPi2pse5fUHzRHvS1AGHq
 dldduy9dnf8mhhn+3jYqpl1ozZ2NNSLArUOW/ZTqyNCgUR3S9q+Q8CTTQh1xNFll/65n
 ipwi0ZFCgq7Vma7PZnzi/PerMPToTJjDJ1rsVSSvoO4iTwIAETlpvtwxfsrc7PS2rAPf
 nTdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmdP2HkcWUxQqlqnWpQ5gnSz0qNhLBF2HvWez7V8eQFAustx2978faW+qRTWVuxNaxvptYrUdgeEI2hIU1TJqK6MvklwDa0+e2NjonAjyZujSuvb/+fLR8oFR+UaHAmdo0UHBws7WBYELgEeQayQ==
X-Gm-Message-State: AOJu0Ywf95+6ZMaSk6+q7zURCwv2cQEIBkpAiV3VLNTruivJzZZx6tro
 KlbvOMIwzf4mqKzADIqhm+TwmacI9qTSvMsBHImxXSyQweBbrINUFNVpbEeK833PUjihLiIC0DO
 jG7tQl7L10bhbe8rGDRIUscrH+PzvDg==
X-Google-Smtp-Source: AGHT+IHFpIOttq3QD27l4SMpiZgd2KF1x/ntTTLb/h9dO4MxE6btCmUgXwgWrs9r2S+zEQCAj2rK+fJTqoNFGY6o3iM=
X-Received: by 2002:a17:90a:a50b:b0:2b2:7c42:bf6e with SMTP id
 98e67ed59e1d1-2b6cc758b9fmr2406510a91.12.1715349691109; Fri, 10 May 2024
 07:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240508230035.222124-1-alexander.deucher@amd.com>
 <CAPM=9tw1S3yFL7FF-DQqcwjnQuj=nF+ER+_nJWvOQWmUF=oLyw@mail.gmail.com>
In-Reply-To: <CAPM=9tw1S3yFL7FF-DQqcwjnQuj=nF+ER+_nJWvOQWmUF=oLyw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 May 2024 10:01:18 -0400
Message-ID: <CADnq5_O5F9ootuKi4B--xZE3CQfAgfTWks38PbmRPHfwJ1bngA@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.9
To: Dave Airlie <airlied@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
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

On Thu, May 9, 2024 at 11:22=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Thu, 9 May 2024 at 09:00, Alex Deucher <alexander.deucher@amd.com> wro=
te:
> >
> > Hi Dave, Sima,
> >
> > Fixes for 6.9.
> >
> > The following changes since commit dd5a440a31fae6e459c0d6271dddd6282550=
5361:
> >
> >   Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9=
-2024-05-08
> >
> > for you to fetch changes up to 3d09248a06d285397e7b873415505d299202e1c6=
:
> >
> >   drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible (2024-05-08 18:4=
7:52 -0400)
> >
> > ----------------------------------------------------------------
> > amd-drm-fixes-6.9-2024-05-08:
> >
> > amdgpu:
> > - DCN 3.5 fix
> > - MST DSC fixes
> > - S0i3 fix
> > - S4 fix
> > - Warning fix
> > - HDP MMIO mapping fix
> > - Fix a regression in visible vram handling
> >
> > amdkfd:
> > - Spatial partition fix
> >
> > ----------------------------------------------------------------
> > Agustin Gutierrez (2):
> >       drm/amd/display: Fix DSC-re-computing
> >       drm/amd/display: MST DSC check for older devices
> >
> > Alex Deucher (1):
> >       drm/amdkfd: don't allow mapping the MMIO HDP page with large page=
s
> >
> > Lijo Lazar (2):
> >       Revert "drm/amdkfd: Add partition id field to location_id"
> >       drm/amd/amdxcp: Fix warnings
>
> Hey, this has a "fixes:" for a patch that doesn't exist.
>
> Can we fix that up? I can pull this but I'd prefer it to get fixed if
> you have a chance.

Sorry, that was the commit from -next.  I cherry-picked the original
patch to -fixes as well, but forgot to fix up the fixes tag when I
cherry-picked the fix to -fixes.  I can create a new PR if you'd like.

Thanks,

Alex
