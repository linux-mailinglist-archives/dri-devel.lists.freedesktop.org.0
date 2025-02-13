Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC6A34BD6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6324110EB57;
	Thu, 13 Feb 2025 17:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BEmKoyhw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7207E10EB57;
 Thu, 13 Feb 2025 17:25:47 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2f9f90103bbso254203a91.3; 
 Thu, 13 Feb 2025 09:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739467547; x=1740072347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQt2nM6cOaVW5Z1WMLvj5xiaDRt1BJCGxPQlYjDOz6o=;
 b=BEmKoyhwTAKritQfkIJJHnsMWw/RjQRQf/OVdEY+ART/xnG0o9ECqSFFk9q+gRJ3D9
 swMJzBojqjpTrZAarjgXp+t4DyCSorKruhi6k3iCkBozu5Vr9o3DrfLbd83I3EUvquFx
 4g061PjfgjgGEgo2mud04YCAqYLC9LXcNCHIdAPs+70/sepHuZb879sDeX5LBwasrdsR
 lYnCgvSDztUBhzrFAN/eQANJvGSSUkkROpxZiGdRjENacG/IP6fr3g3snVxQOIHAKpV+
 QBgS6mNxTWgREA/gbzGlipGgSHLwZoJJsRleRDbsAhs16Rq0dYt1f1zmIjgzO3og2oNb
 C79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739467547; x=1740072347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQt2nM6cOaVW5Z1WMLvj5xiaDRt1BJCGxPQlYjDOz6o=;
 b=jR8G1Ru4IHYivVAYMqIAP9CMc+K2rWCS6qtcyArAJUuRv/H3qurzl1lcPYsRkAfJ1j
 UkG+/shD9WroVySsTclNLVAjNZnssVXUKeIuhpREkJmaNUDSMk68xHF6J1l+q4E6sh+H
 EJwK3m3l63We/ty1cLGVO3afKaTW6On6yFMYvjt/L4Gw1Z2Tirvjzv2+5A4uZlJRRnCU
 Bo4fBUWLu0ryjjS3H4cpiIQmjIJRbWlntNy94654h8/yDmL+1KVqg+Cts2TyNuPogI1P
 tbzXZ9ZxFRlgtjr6MGSMCDYhneBRgR82SNtT1bxdaZF2PanL5NGWazq7F2Fcxi9cfprR
 r0xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR1Vw4GpY62C4tX0eWnc7t8oZynpPWQw/EzvVxLvptJFuCIU+jCcdWwxGi2mS2/q25UOo7cd2UvPTW@lists.freedesktop.org,
 AJvYcCXnXtx3YCEIBDfuWhMYz/UYQqJ4qbb54DKF+iWKU5cptwZdr8O/56xW0h/LLKm2TNiFkcHe6Uo1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNCAFRBtqn0IsmbBbpNklklOddo7cHUDFSC1EbgC+gQQz66+0K
 f2rfmiJbcGloa0kzipWMbcpayGUYNag2aT1G2UoAgQyPeD9eNzBHu2wUtqDW2+MwoZbA5vU7T9E
 kimLOSgPZO7eCZW2+MZ6n6DjCNuA=
X-Gm-Gg: ASbGnctvbC9+KirrVtFJOhWkLnUxKzXP7ZIGAdjN2Alv6eOc05NmP1H+1QGpvzckVKw
 2kiT1Bhqg50eJH5DTVmflw3HBj6TbNttVoqWBcR5CDxWu4LWG5vzGndEsMMLhLXuDtQ81KJiV
X-Google-Smtp-Source: AGHT+IFXvWUZJ8ux/coB6+6DORYP4GiTvYPhLeJSRObBqnhsCZxy4H5ck45V/JMFjHvHlduZEgQYUM/9+4w6ZhsfRxc=
X-Received: by 2002:a17:90b:3b52:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-2fbf5c8b19amr4557826a91.3.1739467546858; Thu, 13 Feb 2025
 09:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20250114135856.16192-1-n.zhandarovich@fintech.ru>
 <6a817784-f3d4-43c2-bd94-ac40c73e8583@fintech.ru>
In-Reply-To: <6a817784-f3d4-43c2-bd94-ac40c73e8583@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Feb 2025 12:25:35 -0500
X-Gm-Features: AWEUYZmJttkq0mujfO9Y3969oXZ6mahn5TvBiRDP8qiOPEi38mhs4JlPLzJtklE
Message-ID: <CADnq5_Pnj5t=1vyOfmJ6bMoeAqFQM1YyDpQn9GPEfxokjz-Vhw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/ci_dpm: Remove needless NULL checks of dpm
 tables
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
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

On Thu, Feb 13, 2025 at 12:03=E2=80=AFPM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> Gentle ping :)

Was already applied:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/189abca05a89fc7b422811e=
497a7116b3e4f4dca

Thanks,

Alex

>
> On 1/14/25 16:58, Nikita Zhandarovich wrote:
> > This patch removes useless NULL pointer checks in functions like
> > ci_set_private_data_variables_based_on_pptable() and
> > ci_setup_default_dpm_tables().
> >
> > The pointers in question are initialized as addresses to existing
> > structures such as rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk by
> > utilizing & operator and therefore are not in danger of being NULL.
> >
> > Fix this by removing extra checks thus cleaning the code a tiny bit.
> >
> > Found by Linux Verification Center (linuxtesting.org) with static
> > analysis tool SVACE.
> >
> > Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
> > Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> > ---
> >  drivers/gpu/drm/radeon/ci_dpm.c | 34 ++++++++++-----------------------=
-
> >  1 file changed, 10 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/c=
i_dpm.c
> > index abe9d65cc460..7c3a960f486a 100644
> > --- a/drivers/gpu/drm/radeon/ci_dpm.c
> > +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> > @@ -3405,12 +3405,8 @@ static int ci_setup_default_dpm_tables(struct ra=
deon_device *rdev)
> >               &rdev->pm.dpm.dyn_state.cac_leakage_table;
> >       u32 i;
> >
> > -     if (allowed_sclk_vddc_table =3D=3D NULL)
> > -             return -EINVAL;
> >       if (allowed_sclk_vddc_table->count < 1)
> >               return -EINVAL;
> > -     if (allowed_mclk_table =3D=3D NULL)
> > -             return -EINVAL;
> >       if (allowed_mclk_table->count < 1)
> >               return -EINVAL;
> >
> > @@ -3468,24 +3464,20 @@ static int ci_setup_default_dpm_tables(struct r=
adeon_device *rdev)
> >       pi->dpm_table.vddc_table.count =3D allowed_sclk_vddc_table->count=
;
> >
> >       allowed_mclk_table =3D &rdev->pm.dpm.dyn_state.vddci_dependency_o=
n_mclk;
> > -     if (allowed_mclk_table) {
> > -             for (i =3D 0; i < allowed_mclk_table->count; i++) {
> > -                     pi->dpm_table.vddci_table.dpm_levels[i].value =3D
> > -                             allowed_mclk_table->entries[i].v;
> > -                     pi->dpm_table.vddci_table.dpm_levels[i].enabled =
=3D true;
> > -             }
> > -             pi->dpm_table.vddci_table.count =3D allowed_mclk_table->c=
ount;
> > +     for (i =3D 0; i < allowed_mclk_table->count; i++) {
> > +             pi->dpm_table.vddci_table.dpm_levels[i].value =3D
> > +                     allowed_mclk_table->entries[i].v;
> > +             pi->dpm_table.vddci_table.dpm_levels[i].enabled =3D true;
> >       }
> > +     pi->dpm_table.vddci_table.count =3D allowed_mclk_table->count;
> >
> >       allowed_mclk_table =3D &rdev->pm.dpm.dyn_state.mvdd_dependency_on=
_mclk;
> > -     if (allowed_mclk_table) {
> > -             for (i =3D 0; i < allowed_mclk_table->count; i++) {
> > -                     pi->dpm_table.mvdd_table.dpm_levels[i].value =3D
> > -                             allowed_mclk_table->entries[i].v;
> > -                     pi->dpm_table.mvdd_table.dpm_levels[i].enabled =
=3D true;
> > -             }
> > -             pi->dpm_table.mvdd_table.count =3D allowed_mclk_table->co=
unt;
> > +     for (i =3D 0; i < allowed_mclk_table->count; i++) {
> > +             pi->dpm_table.mvdd_table.dpm_levels[i].value =3D
> > +                     allowed_mclk_table->entries[i].v;
> > +             pi->dpm_table.mvdd_table.dpm_levels[i].enabled =3D true;
> >       }
> > +     pi->dpm_table.mvdd_table.count =3D allowed_mclk_table->count;
> >
> >       ci_setup_default_pcie_tables(rdev);
> >
> > @@ -4880,16 +4872,10 @@ static int ci_set_private_data_variables_based_=
on_pptable(struct radeon_device *
> >       struct radeon_clock_voltage_dependency_table *allowed_mclk_vddci_=
table =3D
> >               &rdev->pm.dpm.dyn_state.vddci_dependency_on_mclk;
> >
> > -     if (allowed_sclk_vddc_table =3D=3D NULL)
> > -             return -EINVAL;
> >       if (allowed_sclk_vddc_table->count < 1)
> >               return -EINVAL;
> > -     if (allowed_mclk_vddc_table =3D=3D NULL)
> > -             return -EINVAL;
> >       if (allowed_mclk_vddc_table->count < 1)
> >               return -EINVAL;
> > -     if (allowed_mclk_vddci_table =3D=3D NULL)
> > -             return -EINVAL;
> >       if (allowed_mclk_vddci_table->count < 1)
> >               return -EINVAL;
> >
>
