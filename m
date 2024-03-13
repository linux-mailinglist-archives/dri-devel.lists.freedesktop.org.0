Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8687B301
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 21:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524AC10F4C5;
	Wed, 13 Mar 2024 20:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cG7BM2cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4517B10F4C5;
 Wed, 13 Mar 2024 20:46:17 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29bb3d62949so269714a91.1; 
 Wed, 13 Mar 2024 13:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710362777; x=1710967577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ts6uCQCSR583D5MrwHjGerF6k57417HU7JnE/j9wabs=;
 b=cG7BM2cT/64AyEQ2AvE3WYo/VeCo2EfVn7UgINgZo3xt+PpXtj5xtJCO+b3RSlIG2N
 NED9U3QIcynJF4woLaUtA//E42Pt52yEp0l91FGu1GYZLJJBZmc9Joxi5QwQOmhJ+MQa
 4K4+xr3F5yEjjuPQzvUXzjeANN6kbC64Jm/fRDB22afJkIw0jRK7nTKjHu5RqIzFs2qd
 p1+t4W7MbT9Jtd6vQlZen2VlQYvNWl/5EP4hD1kFAvPZ0D+4IUycCx1DUCwoPCo5cYOj
 w0bdBxhyojCXtaacJA52K4Zy/sOd8G++iIgPFjaxdIla1JdzPMpuWwjxdqwD6W0Hi+Wg
 uGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710362777; x=1710967577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ts6uCQCSR583D5MrwHjGerF6k57417HU7JnE/j9wabs=;
 b=R2/2oozLY1FcWqqUNeqnp2GhPKq0jR0F3h6sZN2yUOvv8EH9vEdtYnAmH5/t1iwE8R
 CSK9QPx2kPr9Ggax2R/PxtcIxpaZq99bFXnerRLfI3PjwRqDeWeQi3U+1EmY1Rv41dbS
 Q6ifXwW43zjwOw04ze8V+dAZJdVsTwtxAfT/DWijPnjuNj0xJDzaZi69hEtZreGFB77u
 lziAyLPI5Z/ZxkAK7Z0Qyeh1FAYpO4+NYZc53d6AiSAPJrAXuzr6pet1Ve6WQ86yALD0
 IuE25HTQLcIqJwJl3PunA/3++97RrpkNbixz1/4V9m/zFO1ar+ha7bqtwcJ5tn0qQ3JH
 IRdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWg6A65nZyBDZ7sHQBC5IXe9jkaAKPu++Kz2T7c2sAg4BYENzrOf2+Vl3Ba5u7ahbz8BS9u31FTjPyVgHdiQZIg043XMsyU4jiHgM+bFGndoTvD46Ew97v8crZfd27N8/YfDoW7sV4oaQqs6ij3A==
X-Gm-Message-State: AOJu0Yx8ZUwt4vFbpwrkoagHqpAea8dFBGSyISkOrfYdy2ZGkmz+M6Kk
 RdwYVeDEPyo6XQG71zPXWh74EszWmys3m5ufT5SlXXs0mm/Qa+5EwUrVWXoD3BnPMXvhzbR8ojZ
 jgm4PTysON3nOxCQ6pjVcxcgCV1U=
X-Google-Smtp-Source: AGHT+IGYqfS5DvWMkzgnBKtCUoh0ekfjB6vYZlQVJbjyvNRGm42ddMgr01CInYZAvgWcnusQw48HiAHusT46XBd+NFM=
X-Received: by 2002:a17:90a:be08:b0:29c:3c56:a4f5 with SMTP id
 a8-20020a17090abe0800b0029c3c56a4f5mr5840535pjs.26.1710362776624; Wed, 13 Mar
 2024 13:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240311151424.318621-1-sashal@kernel.org>
 <20240311151424.318621-3-sashal@kernel.org>
 <65d9f97b-95a8-474f-a716-32f810cbb1bc@amd.com>
In-Reply-To: <65d9f97b-95a8-474f-a716-32f810cbb1bc@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Mar 2024 16:46:04 -0400
Message-ID: <CADnq5_OHW9Sw5quFqk52ymGVKXe3PGidB9uLW9wcQcA=pCOTCA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.15 3/5] drm/amdgpu: Enable gpu reset for S3
 abort cases on Raven series
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, 
 Prike Liang <Prike.Liang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, Hawking.Zhang@amd.com, lijo.lazar@amd.com, le.ma@amd.com, 
 James.Zhu@amd.com, shane.xiao@amd.com, sonny.jiang@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, Mar 13, 2024 at 4:12=E2=80=AFPM Felix Kuehling <felix.kuehling@amd.=
com> wrote:
>
> On 2024-03-11 11:14, Sasha Levin wrote:
> > From: Prike Liang <Prike.Liang@amd.com>
> >
> > [ Upstream commit c671ec01311b4744b377f98b0b4c6d033fe569b3 ]
> >
> > Currently, GPU resets can now be performed successfully on the Raven
> > series. While GPU reset is required for the S3 suspend abort case.
> > So now can enable gpu reset for S3 abort cases on the Raven series.
>
> This looks suspicious to me. I'm not sure what conditions made the GPU
> reset successful. But unless all the changes involved were also
> backported, this should probably not be applied to older kernel
> branches. I'm speculating it may be related to the removal of AMD IOMMUv2=
.
>

We should get confirmation from Prike, but I think he tested this on
older kernels as well.

Alex

> Regards,
>    Felix
>
>
> >
> > Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/soc15.c | 45 +++++++++++++++++------------=
-
> >   1 file changed, 25 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/a=
mdgpu/soc15.c
> > index 6a3486f52d698..ef5b3eedc8615 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> > @@ -605,11 +605,34 @@ soc15_asic_reset_method(struct amdgpu_device *ade=
v)
> >               return AMD_RESET_METHOD_MODE1;
> >   }
> >
> > +static bool soc15_need_reset_on_resume(struct amdgpu_device *adev)
> > +{
> > +     u32 sol_reg;
> > +
> > +     sol_reg =3D RREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_81);
> > +
> > +     /* Will reset for the following suspend abort cases.
> > +      * 1) Only reset limit on APU side, dGPU hasn't checked yet.
> > +      * 2) S3 suspend abort and TOS already launched.
> > +      */
> > +     if (adev->flags & AMD_IS_APU && adev->in_s3 &&
> > +                     !adev->suspend_complete &&
> > +                     sol_reg)
> > +             return true;
> > +
> > +     return false;
> > +}
> > +
> >   static int soc15_asic_reset(struct amdgpu_device *adev)
> >   {
> >       /* original raven doesn't have full asic reset */
> > -     if ((adev->apu_flags & AMD_APU_IS_RAVEN) ||
> > -         (adev->apu_flags & AMD_APU_IS_RAVEN2))
> > +     /* On the latest Raven, the GPU reset can be performed
> > +      * successfully. So now, temporarily enable it for the
> > +      * S3 suspend abort case.
> > +      */
> > +     if (((adev->apu_flags & AMD_APU_IS_RAVEN) ||
> > +         (adev->apu_flags & AMD_APU_IS_RAVEN2)) &&
> > +             !soc15_need_reset_on_resume(adev))
> >               return 0;
> >
> >       switch (soc15_asic_reset_method(adev)) {
> > @@ -1490,24 +1513,6 @@ static int soc15_common_suspend(void *handle)
> >       return soc15_common_hw_fini(adev);
> >   }
> >
> > -static bool soc15_need_reset_on_resume(struct amdgpu_device *adev)
> > -{
> > -     u32 sol_reg;
> > -
> > -     sol_reg =3D RREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_81);
> > -
> > -     /* Will reset for the following suspend abort cases.
> > -      * 1) Only reset limit on APU side, dGPU hasn't checked yet.
> > -      * 2) S3 suspend abort and TOS already launched.
> > -      */
> > -     if (adev->flags & AMD_IS_APU && adev->in_s3 &&
> > -                     !adev->suspend_complete &&
> > -                     sol_reg)
> > -             return true;
> > -
> > -     return false;
> > -}
> > -
> >   static int soc15_common_resume(void *handle)
> >   {
> >       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
