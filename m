Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A398C2910
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 19:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A394110E4C9;
	Fri, 10 May 2024 17:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N4mVNRJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538B210E4C9;
 Fri, 10 May 2024 17:06:07 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e4c4fb6af3so14104485ad.0; 
 Fri, 10 May 2024 10:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715360766; x=1715965566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4E70zH6D9J6uqf65FkKdMGHZDeZ8TODhT6vKym2/Plo=;
 b=N4mVNRJ6zBgs2LeOkSk57YXwbCjC7ViQyeY1fzaQzkKPo8GVbDqrDI1SEY1WTEu97h
 wsZs1Pw1qEpLNYK8f+VJ85XSpYKFnA0Ak3IK/2aljyAQiVH/oHSL6F1WGmjVm9n4Gu74
 N0gKeSeVdRwcwuwJp+Ei4Wq+ub9Nj/99NRSLZ9Q6zmDgOULMwEqj8kBXuBDLcxSt+iXM
 3KThznlF0ZquOpe7Rr3LrZglPdft99JLQCaDLqBjL07XdcbHLKaLPkn7XDj8zDVtTJ+E
 VXKMIvmn24EZu4sWm+JEgF8sjWzN/yJ8JAlvMo4HgYywtirbPVBEsqeBySboqf7xDNZg
 yLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715360766; x=1715965566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4E70zH6D9J6uqf65FkKdMGHZDeZ8TODhT6vKym2/Plo=;
 b=YZozkSe4LOshf9Dyo4PJ9AtPTjW1ezsClGxULybL3Hek9Vr9nnmWAbNr6TC957XbFR
 2IfQPCs4XUx6lSsunhPXdXbkFH3Mdvbm0IjIURj8DU5WjajJpcQ/YycOZ2cXYtnY1NJ9
 KRrIgWkaKuWokLlFBNsrjzGkcBi1VE9PM9d+dn4M3wrw3v2dVuC2WNQ3lcXaKCtufTjE
 B18IDto7NrcR9G0lnOJv+tUP3t4eMb92G23gRGUCVJxW84AAFoJOqLNTgKaZHC+fGoYV
 1YSu0y41fIpWauPTe87FlL6B/paoKxAefi1q7y5+t8yk+mVki7PH+xbXYoSAWW80L448
 BaUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZyKVlYo0bpsEYaHYfuBv2GXVZaxo6GDLBoXR53R/LSsm1cR9EeGH6G48bFvyjGDxXLoafIAFM4LDSSTQiv/dNY4gSS3kVv8vnJPthDDMg14rmFrbpGqUBCQ3mlkOCjf3OPbpr/FebJLMH/Lx8PQ==
X-Gm-Message-State: AOJu0Ywl1WmWp+42pWkJeGZfK5hoIYwNH8j+pR8Ef3MAOelE4XqWHLh5
 JqrSzmjNgeZo87ZRyI5OC2LidKFF6f40jtyCmXVTgW+8Onk6i6iwD+BzIqvlaXYE9PdTy+HPMUM
 eqr6zTkklisu5fv0oxDvOVHRGyJk=
X-Google-Smtp-Source: AGHT+IFvo59CeIQxzqPOEh0llojW8r+d1B6Re4qxAxKmuCTUkEg5XPWWujBgnKkROi9ERc5qREtg59Lq5QMUuZjDh9g=
X-Received: by 2002:a17:903:190:b0:1eb:d72e:82ae with SMTP id
 d9443c01a7336-1eefa03a3b3mr92736455ad.13.1715360766497; Fri, 10 May 2024
 10:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240508230035.222124-1-alexander.deucher@amd.com>
 <CAPM=9tw1S3yFL7FF-DQqcwjnQuj=nF+ER+_nJWvOQWmUF=oLyw@mail.gmail.com>
 <CADnq5_O5F9ootuKi4B--xZE3CQfAgfTWks38PbmRPHfwJ1bngA@mail.gmail.com>
In-Reply-To: <CADnq5_O5F9ootuKi4B--xZE3CQfAgfTWks38PbmRPHfwJ1bngA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 May 2024 13:05:53 -0400
Message-ID: <CADnq5_OUAB5W0Ko92bDE6QQjNzVDnWGAAM8YjziFgOq9TM6TfQ@mail.gmail.com>
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

Never mind.  I'll send a new PR now.

Alex

On Fri, May 10, 2024 at 10:01=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Thu, May 9, 2024 at 11:22=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Thu, 9 May 2024 at 09:00, Alex Deucher <alexander.deucher@amd.com> w=
rote:
> > >
> > > Hi Dave, Sima,
> > >
> > > Fixes for 6.9.
> > >
> > > The following changes since commit dd5a440a31fae6e459c0d6271dddd62825=
505361:
> > >
> > >   Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6=
.9-2024-05-08
> > >
> > > for you to fetch changes up to 3d09248a06d285397e7b873415505d299202e1=
c6:
> > >
> > >   drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible (2024-05-08 18=
:47:52 -0400)
> > >
> > > ----------------------------------------------------------------
> > > amd-drm-fixes-6.9-2024-05-08:
> > >
> > > amdgpu:
> > > - DCN 3.5 fix
> > > - MST DSC fixes
> > > - S0i3 fix
> > > - S4 fix
> > > - Warning fix
> > > - HDP MMIO mapping fix
> > > - Fix a regression in visible vram handling
> > >
> > > amdkfd:
> > > - Spatial partition fix
> > >
> > > ----------------------------------------------------------------
> > > Agustin Gutierrez (2):
> > >       drm/amd/display: Fix DSC-re-computing
> > >       drm/amd/display: MST DSC check for older devices
> > >
> > > Alex Deucher (1):
> > >       drm/amdkfd: don't allow mapping the MMIO HDP page with large pa=
ges
> > >
> > > Lijo Lazar (2):
> > >       Revert "drm/amdkfd: Add partition id field to location_id"
> > >       drm/amd/amdxcp: Fix warnings
> >
> > Hey, this has a "fixes:" for a patch that doesn't exist.
> >
> > Can we fix that up? I can pull this but I'd prefer it to get fixed if
> > you have a chance.
>
> Sorry, that was the commit from -next.  I cherry-picked the original
> patch to -fixes as well, but forgot to fix up the fixes tag when I
> cherry-picked the fix to -fixes.  I can create a new PR if you'd like.
>
> Thanks,
>
> Alex
