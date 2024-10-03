Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B6798F8D7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 23:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED0F10E28E;
	Thu,  3 Oct 2024 21:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IrmHW7jS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F8710E260;
 Thu,  3 Oct 2024 21:22:48 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2e0c2e42b75so234701a91.1; 
 Thu, 03 Oct 2024 14:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727990568; x=1728595368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8bMyDSFrLBNevUJ9LtMU8i6rbFbMQVqj25AXNIEIAk=;
 b=IrmHW7jSwT0bXHWMWOpAiXp4SJV/kEL2H9dPwZn6Si0oahtp2y14jvbMYQ2kr9wvfk
 Nw3Lkz/ycHNuNUeOzv3oQnvh12or04/bNVN+wjz6zokMO3Bhrq+tmA1mv89XmnUlqLTK
 dWDGd7Hrtl8sHFqM0dyMghZnVylgFT2MWhTC5zXpi9qa41+Ke7np/co4tGXc7k6KvNba
 x1N6T6ZjZzUNIqm5yZfDCzWlFwunnddENSPiHFgQS/vyVwJdFTNXxkp+McryFGyH69z+
 2OPJTDDx/BdN04RxXY+v0VE3tl0wq1K5nVbz8y3LGFnMG1/4gAwuhSxOd8/u+JTuAofS
 tnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727990568; x=1728595368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C8bMyDSFrLBNevUJ9LtMU8i6rbFbMQVqj25AXNIEIAk=;
 b=Pna83Pgl129GmU+ZN6CLG2viywjQE0UNl8Bo4U+nyIG74CpBs3QZLqm+aMTXFjjwcL
 j5UrAZOhpnOBZaE4XSHblS7Xl/nLgVKTAEZ22rfA+u8zPDahdq/rHq6gBghZxUCQSA1x
 uAOxtDqSD12kcAO4VW0CjJ8zMZwsCos2/A7iw6iUna6JlK759DyI2boJdeVNTVaQO0m0
 dqRLpcZ1Epm3JlDHzYVnt1K59cx6JI2T9a4+niNN6Kn3dpT81sCVAfauejOJFjmgMdOp
 Ck/jM2jAZNe2qTfvWFUkCGuey8zmW8DWwTh/3jnZbXnco6k+NPCDjJZ72OcoFm1kkdD1
 OHGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVacczC+7P+AKOLRioH28Yb4QYeAdodnpblO+I6E1sRgn0Onn+FCgAbm6+sOAvI3QA3fC0OI6jdPbbo@lists.freedesktop.org,
 AJvYcCXt6i1UAUeswTuul8JYfpH7EfiuLDE85TMZxSwHlXFoywfDGr2aZAI5ouRLKmInOA953Q4UxsHy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWQcoUSaAWPqkD/Zq0Rwv20Si4zMTNXernjT40nVHI0RkrM8Z6
 QLQZhZRkx5n5AuYthLwMS2ewED+5Vo6W5+o/yvIn4Ta+KGIb4dGAp9BrWagPUYncNc5o3XiIMU1
 5mYyuQuJRFwEMDkdAXHtplRoASr4=
X-Google-Smtp-Source: AGHT+IGTRPzNfQ/7+u7BSzM6FZnIvSZ1AWAcxUHxX7WRYTwAD2cHcF+DqMengiGIAam5tHXtqq5TtLp6rPq/ga4a6So=
X-Received: by 2002:a17:90b:310b:b0:2e0:9147:7dc1 with SMTP id
 98e67ed59e1d1-2e1e63636b6mr209190a91.6.1727990567826; Thu, 03 Oct 2024
 14:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241003102623.11262-1-advaitdhamorikar@gmail.com>
 <c344f4ac-1ff2-4250-bf31-c17430675751@amd.com>
In-Reply-To: <c344f4ac-1ff2-4250-bf31-c17430675751@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Oct 2024 17:22:35 -0400
Message-ID: <CADnq5_OgZvTgUDvDqDikoUh28jTRm2mOAVV6zAEtWE9RHTFkyA@mail.gmail.com>
Subject: Re: [PATCH-next v2] Fix unintentional integer overflow
To: "Sundararaju, Sathishkumar" <sasundar@amd.com>
Cc: Advait Dhamorikar <advaitdhamorikar@gmail.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, leo.liu@amd.com, sathishkumar.sundararaju@amd.com, 
 saleemkhan.jamadar@amd.com, Veerabadhran.Gopalakrishnan@amd.com, 
 sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, anupnewsmail@gmail.com
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

Applied.  Thanks!

On Thu, Oct 3, 2024 at 6:53=E2=80=AFAM Sundararaju, Sathishkumar
<sasundar@amd.com> wrote:
>
>
> The patch is Reviewed-by: Sathishkumar S <sathishkumar.sundararaju@amd.co=
m>
>
> Regards,
> Sathish
>
>
> On 10/3/2024 3:56 PM, Advait Dhamorikar wrote:
> > Fix shift-count-overflow in JPEG instance
> > multiplication. The expression's value may not be
> > what the programmer intended, because the expression
> > is evaluated using a narrower integer type.
> >
> > Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
> > Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> > ---
> >   V1 -> V2: addressed review comments
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_jpeg.c
> > index 95e2796919fc..b6f0435f56ba 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> > @@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void =
*data, u64 val)
> >       if (!adev)
> >               return -ENODEV;
> >
> > -     mask =3D (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_ri=
ngs)) - 1;
> > +     mask =3D ((uint64_t)1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.n=
um_jpeg_rings)) - 1;
> >       if ((val & mask) =3D=3D 0)
> >               return -EINVAL;
> >
