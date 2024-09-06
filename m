Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B396F7A0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 17:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8504C10EA87;
	Fri,  6 Sep 2024 15:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fkpZZKHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD97710EA86;
 Fri,  6 Sep 2024 15:02:44 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20530659f78so815465ad.1; 
 Fri, 06 Sep 2024 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725634964; x=1726239764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CF/y2A4EOD7AN3/RYLZIn961CP/eFEWOruxjVecjTmw=;
 b=fkpZZKHPfp2663Kd5t15YAjvUOT5Dstk6RQtjaCbmkI1pxGfoTI8Fs1Jxp2/8XDHTU
 ihA9H48/BB3qEufVQFPsoW9z+Xe2if8Rr+PB8PLTw0xjp3hXs8j2yQhqtxRIN48CUZNO
 ZhrT68TZZ+JE62RiJXUD70XPU0hldlmQ653ZvsDgdf+A4/ddHmJZIpNRakHj2y1QSEHX
 BLEfwLeEc2+7K/7pNG2exGhSvkYM1jiX1PaCNlAeiR7VWnSALpnxBpktbIBn/dkPA+fz
 S71Y3nk5JBFTZ2EAYRgIXxS2RE/6nDhdx2EinQlu2xM1suP0dKNtSMGGcoMLAb9wJ6WM
 7y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725634964; x=1726239764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CF/y2A4EOD7AN3/RYLZIn961CP/eFEWOruxjVecjTmw=;
 b=GyfxZsl1fxr0bvd0DGyu4htTrozsPoYU8DV89OLyloyT28f9jCr6rsKBaZM0Gjd1vg
 4hHzkCeWP6J/s7EP8ydbyigHNg1uwqOChGXByTF41EXZwim/J6Or4Bv2SUBuJxpFgzWi
 hHxro44rY4BdBK/3EOjtgaGE9HYVbtLl/N0V5MEVnW6KlJN7KqZ8f5YUCh3pUZ/WACrU
 PZuFr9vMouig3yfzfmF5qfg195yzb2ojfaiMxmlsM/eWKcTOhzJF/YltMecdtkl4uysX
 GIF2WEsaDLnBoPjoLuCRsRpvqPM9z9wfkXc8Nanb8pXU3RC/H2lmZHrw0DC3E0GpwSb4
 2F+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg+OYGJp8dGohA8KyXTHWojIc/tAvNWHxuAqN48oTxL8XjiXbHHf+tCvZJaHRQe2zUILLcIUScIIPK@lists.freedesktop.org,
 AJvYcCUhB5dhlo1w7GC+HOM1Wjh+Irz6+8z963WKFDFnst/TP2MGjfxC3HgDdq4nELG8k/DJmhufKJi1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWU6orXyjfCvEFvBIfrKgVye0R4x6QLA/DOOEQtRI3XhlLFirf
 J7FetdfzYAVLD6IxN7Xz7Jj70lHHJAZTH3GMLgAjxFnauDOJwE7r+LbVDPzidjLLHD8Q/pBvLWr
 iisNRpZ27wVbjhMl0fYigeqaMi0E=
X-Google-Smtp-Source: AGHT+IFUyTc2msw9pBuDinPebsrgH2WgTVb3aopL/b6zxirXk5TlrlJwgcDG34rx6p5wEwYoay4kl+oDdVtZtxl+tQk=
X-Received: by 2002:a17:902:f0cb:b0:205:60f5:4c0 with SMTP id
 d9443c01a7336-206f0669d0emr15345825ad.9.1725634964083; Fri, 06 Sep 2024
 08:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240903045809.5025-1-mukul.sikka@broadcom.com>
 <CADnq5_OVSD1DXgi_9f_H-uT7KSjMwz-FfhP=vRQvposSxv=BMw@mail.gmail.com>
 <CAG99D9Jss=h5aVLDq0tkDjfZgGUbrNV1gqwcw631RbwCiPVqNg@mail.gmail.com>
In-Reply-To: <CAG99D9Jss=h5aVLDq0tkDjfZgGUbrNV1gqwcw631RbwCiPVqNg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Sep 2024 11:02:32 -0400
Message-ID: <CADnq5_NWX7u=S+jrC8YA6fJxN7GXpSN+kqsQieqphdOz2HT6EA@mail.gmail.com>
Subject: Re: [PATCH v5.15-v5.10] drm/amd/pm: Fix the null pointer dereference
 for vega10_hwmgr
To: Mukul Sikka <mukul.sikka@broadcom.com>
Cc: stable@vger.kernel.org, gregkh@linuxfoundation.org, evan.quan@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie, 
 daniel@ffwll.ch, Jun.Ma2@amd.com, kevinyang.wang@amd.com, sashal@kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com, 
 alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com, 
 Bob Zhou <bob.zhou@amd.com>, Tim Huang <Tim.Huang@amd.com>
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

On Fri, Sep 6, 2024 at 4:50=E2=80=AFAM Mukul Sikka <mukul.sikka@broadcom.co=
m> wrote:
>
> On Fri, Sep 6, 2024 at 12:05=E2=80=AFAM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Tue, Sep 3, 2024 at 5:53=E2=80=AFAM sikkamukul <mukul.sikka@broadcom=
.com> wrote:
> > >
> > > From: Bob Zhou <bob.zhou@amd.com>
> > >
> > > [ Upstream commit 50151b7f1c79a09117837eb95b76c2de76841dab ]
> > >
> > > Check return value and conduct null pointer handling to avoid null po=
inter dereference.
> > >
> > > Signed-off-by: Bob Zhou <bob.zhou@amd.com>
> > > Reviewed-by: Tim Huang <Tim.Huang@amd.com>
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > Signed-off-by: Mukul Sikka <mukul.sikka@broadcom.com>
> >
> > Just out of curiosity, are you actually seeing an issue?  This and a
> > lot of the other recent NULL check patches are just static checker
> > fixes.  They don't actually fix a known issue.
> >
> No, according to the description of this patch and CVE-2024-43905.
> It seems to be applicable to LTS.

I don't know that this is really CVE material, but oh well.  I'm not
sure if it's actually possible to hit this in practice.

Alex

>
> - Mukul
>
> > > ---
> > >  .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 30 ++++++++++++++++-=
--
> > >  1 file changed, 26 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/=
drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> > > index 10678b519..304874cba 100644
> > > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> > > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> > > @@ -3391,13 +3391,17 @@ static int vega10_find_dpm_states_clocks_in_d=
pm_table(struct pp_hwmgr *hwmgr, co
> > >         const struct vega10_power_state *vega10_ps =3D
> > >                         cast_const_phw_vega10_power_state(states->pne=
w_state);
> > >         struct vega10_single_dpm_table *sclk_table =3D &(data->dpm_ta=
ble.gfx_table);
> > > -       uint32_t sclk =3D vega10_ps->performance_levels
> > > -                       [vega10_ps->performance_level_count - 1].gfx_=
clock;
> > >         struct vega10_single_dpm_table *mclk_table =3D &(data->dpm_ta=
ble.mem_table);
> > > -       uint32_t mclk =3D vega10_ps->performance_levels
> > > -                       [vega10_ps->performance_level_count - 1].mem_=
clock;
> > > +       uint32_t sclk, mclk;
> > >         uint32_t i;
> > >
> > > +       if (vega10_ps =3D=3D NULL)
> > > +               return -EINVAL;
> > > +       sclk =3D vega10_ps->performance_levels
> > > +                       [vega10_ps->performance_level_count - 1].gfx_=
clock;
> > > +       mclk =3D vega10_ps->performance_levels
> > > +                       [vega10_ps->performance_level_count - 1].mem_=
clock;
> > > +
> > >         for (i =3D 0; i < sclk_table->count; i++) {
> > >                 if (sclk =3D=3D sclk_table->dpm_levels[i].value)
> > >                         break;
> > > @@ -3704,6 +3708,9 @@ static int vega10_generate_dpm_level_enable_mas=
k(
> > >                         cast_const_phw_vega10_power_state(states->pne=
w_state);
> > >         int i;
> > >
> > > +       if (vega10_ps =3D=3D NULL)
> > > +               return -EINVAL;
> > > +
> > >         PP_ASSERT_WITH_CODE(!vega10_trim_dpm_states(hwmgr, vega10_ps)=
,
> > >                         "Attempt to Trim DPM States Failed!",
> > >                         return -1);
> > > @@ -4828,6 +4835,9 @@ static int vega10_check_states_equal(struct pp_=
hwmgr *hwmgr,
> > >
> > >         psa =3D cast_const_phw_vega10_power_state(pstate1);
> > >         psb =3D cast_const_phw_vega10_power_state(pstate2);
> > > +       if (psa =3D=3D NULL || psb =3D=3D NULL)
> > > +               return -EINVAL;
> > > +
> > >         /* If the two states don't even have the same number of perfo=
rmance levels they cannot be the same state. */
> > >         if (psa->performance_level_count !=3D psb->performance_level_=
count) {
> > >                 *equal =3D false;
> > > @@ -4953,6 +4963,8 @@ static int vega10_set_sclk_od(struct pp_hwmgr *=
hwmgr, uint32_t value)
> > >                 return -EINVAL;
> > >
> > >         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> > > +       if (vega10_ps =3D=3D NULL)
> > > +               return -EINVAL;
> > >
> > >         vega10_ps->performance_levels
> > >         [vega10_ps->performance_level_count - 1].gfx_clock =3D
> > > @@ -5004,6 +5016,8 @@ static int vega10_set_mclk_od(struct pp_hwmgr *=
hwmgr, uint32_t value)
> > >                 return -EINVAL;
> > >
> > >         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> > > +       if (vega10_ps =3D=3D NULL)
> > > +               return -EINVAL;
> > >
> > >         vega10_ps->performance_levels
> > >         [vega10_ps->performance_level_count - 1].mem_clock =3D
> > > @@ -5239,6 +5253,9 @@ static void vega10_odn_update_power_state(struc=
t pp_hwmgr *hwmgr)
> > >                 return;
> > >
> > >         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> > > +       if (vega10_ps =3D=3D NULL)
> > > +               return;
> > > +
> > >         max_level =3D vega10_ps->performance_level_count - 1;
> > >
> > >         if (vega10_ps->performance_levels[max_level].gfx_clock !=3D
> > > @@ -5261,6 +5278,9 @@ static void vega10_odn_update_power_state(struc=
t pp_hwmgr *hwmgr)
> > >
> > >         ps =3D (struct pp_power_state *)((unsigned long)(hwmgr->ps) +=
 hwmgr->ps_size * (hwmgr->num_ps - 1));
> > >         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> > > +       if (vega10_ps =3D=3D NULL)
> > > +               return;
> > > +
> > >         max_level =3D vega10_ps->performance_level_count - 1;
> > >
> > >         if (vega10_ps->performance_levels[max_level].gfx_clock !=3D
> > > @@ -5451,6 +5471,8 @@ static int vega10_get_performance_level(struct =
pp_hwmgr *hwmgr, const struct pp_
> > >                 return -EINVAL;
> > >
> > >         ps =3D cast_const_phw_vega10_power_state(state);
> > > +       if (ps =3D=3D NULL)
> > > +               return -EINVAL;
> > >
> > >         i =3D index > ps->performance_level_count - 1 ?
> > >                         ps->performance_level_count - 1 : index;
> > > --
> > > 2.39.4
> > >
