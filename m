Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5CD96EE8A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C7010E9C9;
	Fri,  6 Sep 2024 08:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="X7ridRbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1637610E9C6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:50:24 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-374c1120a32so952232f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 01:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725612622; x=1726217422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SR/9jqMaY4ZkJhVpjV584ea+FY7mIMJMTafocuSMEVI=;
 b=X7ridRbFO21NIcwatqjdkfzuKoZLSI7Kh6aJyaxPOyzjMtsJ26PviNx7zM54RyiKrh
 qS+Ul93hocCiVRdRrvR/epJYJYGGD7sIurh0Sp4e7rYEPujPDcPBAPH4u7zRqxqpa+Lp
 Z9MmP8TP8RD7LFMs3tW1zZyGsGUdy9CWpNdfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725612622; x=1726217422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SR/9jqMaY4ZkJhVpjV584ea+FY7mIMJMTafocuSMEVI=;
 b=dugj+PEBPmDspyLDnfXWehYEgjc/hNGcOPzYvurwn0gb/jDebu7jAqMLxRweeNwVoE
 AZgJ65v6zsVtf3idpoItbiv2wFyANDtedqXYKc9ykWPq9J4hTbuyJD9bHrNUp64L7I92
 +coPGhsELNtbfmjw6ULlWI/xaQlGiQJBZSNq9x5+NnpywI/vWbdG9PSUQPBsk7PXeAUx
 xZEbnIkVq4FuSWVGiD9Y8tL3KlYxe638gCsEJrRD+Xq7P7G7C67UVEZcYNhhqg9Wh+Jd
 2KWJMNQTTsOHfjAGYoDz4fyI4Z1vEwR/T93uUCIOe+aSBiilFhUaHa3Heu6I9qA5sHt6
 uiJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbbTJcXOja8tYMeIEqAAj/j1rzOn3QHOat1bXiRaA6Sg3RwHDsbGn+DhL8CPAnGSQ92ozVT4RdXXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye8YITxPfxy7/kGqrIzDBLhE0sq4/2grhLql+ITmkInE1CAh08
 CCyAlaVRapLuBQHQX0XRq7JkkC1xk2GkocIVKYUv1SbSMlb5i5wkF1KT301OUKlXNEqSkk6eG6b
 Tg+T3zo8bPrxVgBFBTW5ycHMfa3vghX+BpgJJ
X-Google-Smtp-Source: AGHT+IEf3kS+J5eIcH9aoEI8sQEx7ql08PzycsM89+gtgjd5bmyXErbV7K7VP95PFXMisPnX+f8aCwG5eZm6hdTL5O8=
X-Received: by 2002:a5d:4983:0:b0:371:86b2:a7e4 with SMTP id
 ffacd0b85a97d-37889682e03mr1118424f8f.37.1725612621485; Fri, 06 Sep 2024
 01:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240903045809.5025-1-mukul.sikka@broadcom.com>
 <CADnq5_OVSD1DXgi_9f_H-uT7KSjMwz-FfhP=vRQvposSxv=BMw@mail.gmail.com>
In-Reply-To: <CADnq5_OVSD1DXgi_9f_H-uT7KSjMwz-FfhP=vRQvposSxv=BMw@mail.gmail.com>
From: Mukul Sikka <mukul.sikka@broadcom.com>
Date: Fri, 6 Sep 2024 14:20:09 +0530
Message-ID: <CAG99D9Jss=h5aVLDq0tkDjfZgGUbrNV1gqwcw631RbwCiPVqNg@mail.gmail.com>
Subject: Re: [PATCH v5.15-v5.10] drm/amd/pm: Fix the null pointer dereference
 for vega10_hwmgr
To: Alex Deucher <alexdeucher@gmail.com>
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

On Fri, Sep 6, 2024 at 12:05=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Tue, Sep 3, 2024 at 5:53=E2=80=AFAM sikkamukul <mukul.sikka@broadcom.c=
om> wrote:
> >
> > From: Bob Zhou <bob.zhou@amd.com>
> >
> > [ Upstream commit 50151b7f1c79a09117837eb95b76c2de76841dab ]
> >
> > Check return value and conduct null pointer handling to avoid null poin=
ter dereference.
> >
> > Signed-off-by: Bob Zhou <bob.zhou@amd.com>
> > Reviewed-by: Tim Huang <Tim.Huang@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > Signed-off-by: Mukul Sikka <mukul.sikka@broadcom.com>
>
> Just out of curiosity, are you actually seeing an issue?  This and a
> lot of the other recent NULL check patches are just static checker
> fixes.  They don't actually fix a known issue.
>
No, according to the description of this patch and CVE-2024-43905.
It seems to be applicable to LTS.

- Mukul

> > ---
> >  .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 30 ++++++++++++++++---
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> > index 10678b519..304874cba 100644
> > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> > @@ -3391,13 +3391,17 @@ static int vega10_find_dpm_states_clocks_in_dpm=
_table(struct pp_hwmgr *hwmgr, co
> >         const struct vega10_power_state *vega10_ps =3D
> >                         cast_const_phw_vega10_power_state(states->pnew_=
state);
> >         struct vega10_single_dpm_table *sclk_table =3D &(data->dpm_tabl=
e.gfx_table);
> > -       uint32_t sclk =3D vega10_ps->performance_levels
> > -                       [vega10_ps->performance_level_count - 1].gfx_cl=
ock;
> >         struct vega10_single_dpm_table *mclk_table =3D &(data->dpm_tabl=
e.mem_table);
> > -       uint32_t mclk =3D vega10_ps->performance_levels
> > -                       [vega10_ps->performance_level_count - 1].mem_cl=
ock;
> > +       uint32_t sclk, mclk;
> >         uint32_t i;
> >
> > +       if (vega10_ps =3D=3D NULL)
> > +               return -EINVAL;
> > +       sclk =3D vega10_ps->performance_levels
> > +                       [vega10_ps->performance_level_count - 1].gfx_cl=
ock;
> > +       mclk =3D vega10_ps->performance_levels
> > +                       [vega10_ps->performance_level_count - 1].mem_cl=
ock;
> > +
> >         for (i =3D 0; i < sclk_table->count; i++) {
> >                 if (sclk =3D=3D sclk_table->dpm_levels[i].value)
> >                         break;
> > @@ -3704,6 +3708,9 @@ static int vega10_generate_dpm_level_enable_mask(
> >                         cast_const_phw_vega10_power_state(states->pnew_=
state);
> >         int i;
> >
> > +       if (vega10_ps =3D=3D NULL)
> > +               return -EINVAL;
> > +
> >         PP_ASSERT_WITH_CODE(!vega10_trim_dpm_states(hwmgr, vega10_ps),
> >                         "Attempt to Trim DPM States Failed!",
> >                         return -1);
> > @@ -4828,6 +4835,9 @@ static int vega10_check_states_equal(struct pp_hw=
mgr *hwmgr,
> >
> >         psa =3D cast_const_phw_vega10_power_state(pstate1);
> >         psb =3D cast_const_phw_vega10_power_state(pstate2);
> > +       if (psa =3D=3D NULL || psb =3D=3D NULL)
> > +               return -EINVAL;
> > +
> >         /* If the two states don't even have the same number of perform=
ance levels they cannot be the same state. */
> >         if (psa->performance_level_count !=3D psb->performance_level_co=
unt) {
> >                 *equal =3D false;
> > @@ -4953,6 +4963,8 @@ static int vega10_set_sclk_od(struct pp_hwmgr *hw=
mgr, uint32_t value)
> >                 return -EINVAL;
> >
> >         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> > +       if (vega10_ps =3D=3D NULL)
> > +               return -EINVAL;
> >
> >         vega10_ps->performance_levels
> >         [vega10_ps->performance_level_count - 1].gfx_clock =3D
> > @@ -5004,6 +5016,8 @@ static int vega10_set_mclk_od(struct pp_hwmgr *hw=
mgr, uint32_t value)
> >                 return -EINVAL;
> >
> >         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> > +       if (vega10_ps =3D=3D NULL)
> > +               return -EINVAL;
> >
> >         vega10_ps->performance_levels
> >         [vega10_ps->performance_level_count - 1].mem_clock =3D
> > @@ -5239,6 +5253,9 @@ static void vega10_odn_update_power_state(struct =
pp_hwmgr *hwmgr)
> >                 return;
> >
> >         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> > +       if (vega10_ps =3D=3D NULL)
> > +               return;
> > +
> >         max_level =3D vega10_ps->performance_level_count - 1;
> >
> >         if (vega10_ps->performance_levels[max_level].gfx_clock !=3D
> > @@ -5261,6 +5278,9 @@ static void vega10_odn_update_power_state(struct =
pp_hwmgr *hwmgr)
> >
> >         ps =3D (struct pp_power_state *)((unsigned long)(hwmgr->ps) + h=
wmgr->ps_size * (hwmgr->num_ps - 1));
> >         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> > +       if (vega10_ps =3D=3D NULL)
> > +               return;
> > +
> >         max_level =3D vega10_ps->performance_level_count - 1;
> >
> >         if (vega10_ps->performance_levels[max_level].gfx_clock !=3D
> > @@ -5451,6 +5471,8 @@ static int vega10_get_performance_level(struct pp=
_hwmgr *hwmgr, const struct pp_
> >                 return -EINVAL;
> >
> >         ps =3D cast_const_phw_vega10_power_state(state);
> > +       if (ps =3D=3D NULL)
> > +               return -EINVAL;
> >
> >         i =3D index > ps->performance_level_count - 1 ?
> >                         ps->performance_level_count - 1 : index;
> > --
> > 2.39.4
> >
