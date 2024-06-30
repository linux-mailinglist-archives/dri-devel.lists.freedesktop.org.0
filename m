Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB04B91D302
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 19:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75C710E2A5;
	Sun, 30 Jun 2024 17:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yc0RWKyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A818010E2A5;
 Sun, 30 Jun 2024 17:05:16 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ec6635aa43so22402131fa.1; 
 Sun, 30 Jun 2024 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719767114; x=1720371914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TSBwaS4j56NlcOuTEVGitgpl2zqsxNnDtYPNdmykvCQ=;
 b=Yc0RWKyzC3sZsfNM1kH2RQ4P9QoL+YX0BYahe5QtghXLAWeyR0DTcnkXBBlD0yQYfi
 7aE/sI1QGWXMORQb/AIpa+zehXtYfyigdmMIWy+cNMyX5wviD+BFvrAaumPtLp36OeU6
 85SeShlxOcOztiLCHwmgCLoKocQ0RNF/4AcD7hG9wI6xEtjTgVVbnlxXHRdILK/AJzMJ
 LxoJwTnEjS5xG6A9SRI3Sdl+5sJQTgF7a7pqbkvRCZeBvYxuHLGKGfAcZsRRcEw066dH
 w7i02Spm306QUD8hK9pEVQcW6H3mwoXLaZ31jKjJe++q0uC04EuONV/KxNgCA/hInh2W
 XnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719767114; x=1720371914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TSBwaS4j56NlcOuTEVGitgpl2zqsxNnDtYPNdmykvCQ=;
 b=Y8TNwXXg6g4M2vKbIfTwtHbOXQ/dw3nSUjDE92a7dXn4d5LiZt6lAJwMbz7PR0MDWX
 /3KMh3CQvErmq23zYEV/lY+5C9JtUqGigLonDuYkgGIqUVn+ftF4Z7t2FCXgV28yJ+0d
 o5KwbrbVCQXdB0Xv0Qxu1ErE+NELl1oCzXHOcFeuCz9ivsKJVfwUB87nWM+Tyf+t5ziL
 sTnK4Sw+zuja8C1HMkTuPCv8/0P2By9wMkcQowJLpQvGm/DQ/FtCRjoQf6xDLGv0vd9O
 P9VZaGXKJmYeyRuGqroGNKvBsHP0c3P0M2stnQpBxc8nzjSayWQ3o3t3G+8ONi6bF9zJ
 rDww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb2isPbt9PzUoDcklvqP1nBufXYmwToaz7T41loqlV7b2qH1PqFNcQggSPUHkXz6qgmd7tolI2xXwZG4Knbezc8BS9Kyvke7siQGRYQ68JJS+LKBiHjXgg+Jg+vqV+LkKWpuIQiRh/nUeAMhtSYw==
X-Gm-Message-State: AOJu0YylFiLjHpxnkql1cmoHsBGZgRjKr0NEcpHXZdifw6ZheB+WM5My
 bHrvej9t9VSjBtjdTsRrYzfdU24XRfOCwoMkbYY21OObysMLv4Ga6mWXcqfgrR2vBLUiMrSitje
 29s4ZGybcYkfZkwlPkOGGQ+nOM+Y=
X-Google-Smtp-Source: AGHT+IG7YHJPWnQ2Einzgx/hq1VY62FwoAmFbqi2vP0rjaW6mj6HE6Hk848vv1ff23xCzGk+ngx5RSdfIDimeiOwyGI=
X-Received: by 2002:a2e:bcc1:0:b0:2ee:6a72:f006 with SMTP id
 38308e7fff4ca-2ee6a72f0e6mr5705301fa.21.1719767114078; Sun, 30 Jun 2024
 10:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240624151122.23724-1-wuhoipok@gmail.com>
 <3c627f1d-ab9e-480f-8f42-91a108477c24@suse.de>
In-Reply-To: <3c627f1d-ab9e-480f-8f42-91a108477c24@suse.de>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Sun, 30 Jun 2024 13:05:03 -0400
Message-ID: <CANyH0kAPuxnTR0UA3EBfzd8aAFH4kw9qVN1GLi-g60VE5NUYwg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm/radeon: remove load callback
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Dear Thmoas,

Thanks a lot for the feedback.
I admit that my patch was a mess, sorry about that.

I have submitted a v3 to change a lot of stuff, these patches should
be able to be built now.
I also improve readability, where each patch does their own stuff.

Best regards,
Wu

On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 24.06.24 um 17:10 schrieb Wu Hoi Pok:
> > Changes between v1 and v3:
> >
> > 1. add "ddev->dev_private =3D rdev;"
> > 2. include a cover letter
>
> A cover letter should briefly say what the patchset is about.
>
> BTW it's not clear to me why you need to modify radeon_dev.dev for
> removing the load callback. It seems it's a separate issue.
>
> Best regards
> Thomas
>
>
> >
> > Wu Hoi Pok (7):
> >    drm/radeon: remove load callback
> >    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 1
> >    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 2
> >    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 3
> >    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 4
> >    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 5
> >    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 6
> >
> >   drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
> >   drivers/gpu/drm/radeon/cik.c               | 14 ++--
> >   drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
> >   drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
> >   drivers/gpu/drm/radeon/ni.c                |  2 +-
> >   drivers/gpu/drm/radeon/r100.c              | 24 +++----
> >   drivers/gpu/drm/radeon/r300.c              |  6 +-
> >   drivers/gpu/drm/radeon/r420.c              |  6 +-
> >   drivers/gpu/drm/radeon/r520.c              |  2 +-
> >   drivers/gpu/drm/radeon/r600.c              | 12 ++--
> >   drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
> >   drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
> >   drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
> >   drivers/gpu/drm/radeon/radeon.h            | 11 +++-
> >   drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
> >   drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
> >   drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
> >   drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
> >   drivers/gpu/drm/radeon/radeon_device.c     | 19 ++----
> >   drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++----------=
-
> >   drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
> >   drivers/gpu/drm/radeon/radeon_drv.h        |  1 -
> >   drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
> >   drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
> >   drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
> >   drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
> >   drivers/gpu/drm/radeon/radeon_kms.c        | 18 ++----
> >   drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
> >   drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
> >   drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
> >   drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
> >   drivers/gpu/drm/radeon/rs400.c             |  6 +-
> >   drivers/gpu/drm/radeon/rs600.c             | 14 ++--
> >   drivers/gpu/drm/radeon/rs690.c             |  2 +-
> >   drivers/gpu/drm/radeon/rv515.c             |  4 +-
> >   drivers/gpu/drm/radeon/rv770.c             |  2 +-
> >   drivers/gpu/drm/radeon/si.c                |  4 +-
> >   40 files changed, 193 insertions(+), 191 deletions(-)
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
