Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A043696E21A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 20:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED33310E0DF;
	Thu,  5 Sep 2024 18:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WQ/UvhNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0340810E0DF;
 Thu,  5 Sep 2024 18:35:56 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-20543c6f3b5so536415ad.0; 
 Thu, 05 Sep 2024 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725561356; x=1726166156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAtDj4jgFho2b/8hV7Bo6K1tm3khS3fSEDAFzXGf8h0=;
 b=WQ/UvhNT4Gx8HAVvx6rjm6Jz4aRC13gpnA85d94np/6JkiZ+Da3RfqUE66wJhH68/O
 Be6oQlnqLOEzekPGezNNHeOqg44XFxdDzsRLn1KyBgHL30s3SUFaN4JU1LS2yPi56Pbl
 zofjbGZmNVkZlkVewj0QO35Nu2vUU/HW1JcWEGQ90/FIrojM0EV8EalY6GoFQrws59A2
 2WSEoO4sglwqiKpySbG1zX4XpouqC5i+CyhN+8lCP2BgCgmS+61w6ZUA0c3ewFXLaMa7
 EalHNBiv9BtvfWmeoARFKN0IU8OvjMnb2BzOqMTJZ8lFAK7UHdLNERNwoukrPwQspoUS
 2LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725561356; x=1726166156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAtDj4jgFho2b/8hV7Bo6K1tm3khS3fSEDAFzXGf8h0=;
 b=YJSiwryuGQl39YZLdb33e2AcUPsqGOGZftGrUawQOdznzTm+1alJWURPpV05bZ/BDE
 l/IbTtitPe6d5fDU6cP+tFE2o5SaXox+5oNwYF19tqtBGHb0wWHwY+XFXTJkhu3bRKZ0
 FAn+NYf2jCVuwLtcDx+03+s/Or3WoRk75NWWwol4qzG48G2MOxZZUEh7HOcg4rUmnFCA
 HVHQON8fUTkmj/BAowQaNuk6dRPXPidJy8KUH9n1mIqXfmB4+qiC7+qQKGDs2U4dPAXT
 Bbc8d48TOrCaO7ulU2t0zaBQEORh4V5abdsua8kae8wAOM9cf4H+GROSCXfwOuADmczt
 Rq7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUg+ZqDusiK4eO+bWazAtt/4YXQy7KN0FK2H+eMAFKM+arkx7k23vkhAh8jAueDYcCRUT5yJHsG88i@lists.freedesktop.org,
 AJvYcCWkyieq9ppQoXBFM0a4uizzKGEQlJkX2V4XciU5qLVoTXZ5ijyWzwpE1hxNV8b5eIxTDR6avTMg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK1kNnC+1kJaDMZzjoP3EOyE2aIzJZzDs41TANLAEOXfecdcK8
 1uifKEz464rTwwKTbzAZ//lsl21qOj1c1jArqAN2hs3+qH93+TdITH8P/fFSZbvNbi5+pFJbe6i
 +ttdQQzanRyP2kmot0QZIE9Jp/fw=
X-Google-Smtp-Source: AGHT+IHM5V1REwdJI3eVT3T6Wdm5s+xxUU+LN3v/BUr9HdnK+Dg6FB4m7fzcSNKHejJ3hHksejbzQbzD8bSPE3UC2eY=
X-Received: by 2002:a17:903:1cc:b0:206:aa07:b54 with SMTP id
 d9443c01a7336-206f0357b83mr705ad.0.1725561356205; Thu, 05 Sep 2024 11:35:56
 -0700 (PDT)
MIME-Version: 1.0
References: <20240903045809.5025-1-mukul.sikka@broadcom.com>
In-Reply-To: <20240903045809.5025-1-mukul.sikka@broadcom.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Sep 2024 14:35:44 -0400
Message-ID: <CADnq5_OVSD1DXgi_9f_H-uT7KSjMwz-FfhP=vRQvposSxv=BMw@mail.gmail.com>
Subject: Re: [PATCH v5.15-v5.10] drm/amd/pm: Fix the null pointer dereference
 for vega10_hwmgr
To: sikkamukul <mukul.sikka@broadcom.com>
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

On Tue, Sep 3, 2024 at 5:53=E2=80=AFAM sikkamukul <mukul.sikka@broadcom.com=
> wrote:
>
> From: Bob Zhou <bob.zhou@amd.com>
>
> [ Upstream commit 50151b7f1c79a09117837eb95b76c2de76841dab ]
>
> Check return value and conduct null pointer handling to avoid null pointe=
r dereference.
>
> Signed-off-by: Bob Zhou <bob.zhou@amd.com>
> Reviewed-by: Tim Huang <Tim.Huang@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Mukul Sikka <mukul.sikka@broadcom.com>

Just out of curiosity, are you actually seeing an issue?  This and a
lot of the other recent NULL check patches are just static checker
fixes.  They don't actually fix a known issue.

Alex

> ---
>  .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> index 10678b519..304874cba 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> @@ -3391,13 +3391,17 @@ static int vega10_find_dpm_states_clocks_in_dpm_t=
able(struct pp_hwmgr *hwmgr, co
>         const struct vega10_power_state *vega10_ps =3D
>                         cast_const_phw_vega10_power_state(states->pnew_st=
ate);
>         struct vega10_single_dpm_table *sclk_table =3D &(data->dpm_table.=
gfx_table);
> -       uint32_t sclk =3D vega10_ps->performance_levels
> -                       [vega10_ps->performance_level_count - 1].gfx_cloc=
k;
>         struct vega10_single_dpm_table *mclk_table =3D &(data->dpm_table.=
mem_table);
> -       uint32_t mclk =3D vega10_ps->performance_levels
> -                       [vega10_ps->performance_level_count - 1].mem_cloc=
k;
> +       uint32_t sclk, mclk;
>         uint32_t i;
>
> +       if (vega10_ps =3D=3D NULL)
> +               return -EINVAL;
> +       sclk =3D vega10_ps->performance_levels
> +                       [vega10_ps->performance_level_count - 1].gfx_cloc=
k;
> +       mclk =3D vega10_ps->performance_levels
> +                       [vega10_ps->performance_level_count - 1].mem_cloc=
k;
> +
>         for (i =3D 0; i < sclk_table->count; i++) {
>                 if (sclk =3D=3D sclk_table->dpm_levels[i].value)
>                         break;
> @@ -3704,6 +3708,9 @@ static int vega10_generate_dpm_level_enable_mask(
>                         cast_const_phw_vega10_power_state(states->pnew_st=
ate);
>         int i;
>
> +       if (vega10_ps =3D=3D NULL)
> +               return -EINVAL;
> +
>         PP_ASSERT_WITH_CODE(!vega10_trim_dpm_states(hwmgr, vega10_ps),
>                         "Attempt to Trim DPM States Failed!",
>                         return -1);
> @@ -4828,6 +4835,9 @@ static int vega10_check_states_equal(struct pp_hwmg=
r *hwmgr,
>
>         psa =3D cast_const_phw_vega10_power_state(pstate1);
>         psb =3D cast_const_phw_vega10_power_state(pstate2);
> +       if (psa =3D=3D NULL || psb =3D=3D NULL)
> +               return -EINVAL;
> +
>         /* If the two states don't even have the same number of performan=
ce levels they cannot be the same state. */
>         if (psa->performance_level_count !=3D psb->performance_level_coun=
t) {
>                 *equal =3D false;
> @@ -4953,6 +4963,8 @@ static int vega10_set_sclk_od(struct pp_hwmgr *hwmg=
r, uint32_t value)
>                 return -EINVAL;
>
>         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> +       if (vega10_ps =3D=3D NULL)
> +               return -EINVAL;
>
>         vega10_ps->performance_levels
>         [vega10_ps->performance_level_count - 1].gfx_clock =3D
> @@ -5004,6 +5016,8 @@ static int vega10_set_mclk_od(struct pp_hwmgr *hwmg=
r, uint32_t value)
>                 return -EINVAL;
>
>         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> +       if (vega10_ps =3D=3D NULL)
> +               return -EINVAL;
>
>         vega10_ps->performance_levels
>         [vega10_ps->performance_level_count - 1].mem_clock =3D
> @@ -5239,6 +5253,9 @@ static void vega10_odn_update_power_state(struct pp=
_hwmgr *hwmgr)
>                 return;
>
>         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> +       if (vega10_ps =3D=3D NULL)
> +               return;
> +
>         max_level =3D vega10_ps->performance_level_count - 1;
>
>         if (vega10_ps->performance_levels[max_level].gfx_clock !=3D
> @@ -5261,6 +5278,9 @@ static void vega10_odn_update_power_state(struct pp=
_hwmgr *hwmgr)
>
>         ps =3D (struct pp_power_state *)((unsigned long)(hwmgr->ps) + hwm=
gr->ps_size * (hwmgr->num_ps - 1));
>         vega10_ps =3D cast_phw_vega10_power_state(&ps->hardware);
> +       if (vega10_ps =3D=3D NULL)
> +               return;
> +
>         max_level =3D vega10_ps->performance_level_count - 1;
>
>         if (vega10_ps->performance_levels[max_level].gfx_clock !=3D
> @@ -5451,6 +5471,8 @@ static int vega10_get_performance_level(struct pp_h=
wmgr *hwmgr, const struct pp_
>                 return -EINVAL;
>
>         ps =3D cast_const_phw_vega10_power_state(state);
> +       if (ps =3D=3D NULL)
> +               return -EINVAL;
>
>         i =3D index > ps->performance_level_count - 1 ?
>                         ps->performance_level_count - 1 : index;
> --
> 2.39.4
>
