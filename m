Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DC772A90
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331E310E2AD;
	Mon,  7 Aug 2023 16:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1499A10E2AD;
 Mon,  7 Aug 2023 16:24:23 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6b9cf1997c4so3908995a34.3; 
 Mon, 07 Aug 2023 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425462; x=1692030262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VA7ZGTP/1iIUz0NSZwan87qZk2dibq5PfQ7YdL9IqMM=;
 b=hA6asJm0yHV08nnQvgNI1vQwBdogPPdoOirvla3DXIv13onvTOJUXQGi9YL0QdFrz9
 QyMbdCorzP+ZVfAQDYS4rN/P8b5AGQvcjIyUdiSeTlGCqmN9ba1IrkCZi9eGKbwojvw0
 WUo6AuZW014oePyJcQc3Y0+rU3rJrk9dLNBP1zj/YmHxgWZcdrKbDudIxvpKY3aQLyJG
 CneiIBU20bvfwqpWRr/i+d3fsHydsuOlhD9Vkv/+XFds4Orij3/arJwjcSwyZNPhhW8f
 yOWqVwmGllhSuNJ523xhzKs0FuVl/0OVa9gdSevSG3LmB7CWCnlDQ+JG5VkrIIAB3cHd
 R52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425462; x=1692030262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VA7ZGTP/1iIUz0NSZwan87qZk2dibq5PfQ7YdL9IqMM=;
 b=e+JGhmw4eRYgUR3gfxkWY1yFRDWPBHuIJMNoFyeI0xa8C5n3K0VFw7svryVOh/eKr0
 E+UyonNnvfv3MEdtJX6ICgTW0et9zsrXoz0sbnlL3Q97E4ypy0Frhz5y02DN/4o7NQRh
 OoxqrU/n2efkZ7CPx68I4/3g7wPiKqDOxeFxeESa70w+nsNFQYrEqdi7nnD18b2/mBpb
 8Y3vc7WvCt2oD6eBFIhw4OQKXbiEEUQNg+y3mqOK+E6EVRis3zHPY7R26NA4Fd1gpQnI
 lbaIPSQzgi4qFWuW8Z6xFa4LjfSnfITmg4o+McU3uFBww0GHcpIvzC2CMKrRUxs/zNWg
 SCeA==
X-Gm-Message-State: AOJu0YzTPT+pRva/LOcZ670rx4MfRuWMMEhRZzqdt3zYjI7F3UwPQV7Q
 XU6eKiUCGXk/BdN1g5gePQ73WDq/C6XF8+MDgkw=
X-Google-Smtp-Source: AGHT+IEYefXHM0TruKEa032jSyMqc1e77wIIewxYQEFOzkvak8lTQqoj7Y1uEiYfF5xMHwImLEdmeS+RTmJ7wEDkQFY=
X-Received: by 2002:a05:6870:6486:b0:1bb:8867:f7ed with SMTP id
 cz6-20020a056870648600b001bb8867f7edmr12411828oab.33.1691425462283; Mon, 07
 Aug 2023 09:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230801023658.4667-1-sunran001@208suo.com>
In-Reply-To: <20230801023658.4667-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:24:11 -0400
Message-ID: <CADnq5_MZ7HOUiw05H4oQokT4ad+=4ypjVBtSyYdqBNgfL5Q3CA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in amd_powerplay.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 10:37=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: spaces required around that '||' (ctx:WxO)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/g=
pu/drm/amd/pm/powerplay/amd_powerplay.c
> index ff360c699171..9e4f8a4104a3 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -612,7 +612,7 @@ static int pp_dpm_get_pp_num_states(void *handle,
>
>         memset(data, 0, sizeof(*data));
>
> -       if (!hwmgr || !hwmgr->pm_en ||!hwmgr->ps)
> +       if (!hwmgr || !hwmgr->pm_en || !hwmgr->ps)
>                 return -EINVAL;
>
>         data->nums =3D hwmgr->num_ps;
> @@ -644,7 +644,7 @@ static int pp_dpm_get_pp_table(void *handle, char **t=
able)
>  {
>         struct pp_hwmgr *hwmgr =3D handle;
>
> -       if (!hwmgr || !hwmgr->pm_en ||!hwmgr->soft_pp_table)
> +       if (!hwmgr || !hwmgr->pm_en || !hwmgr->soft_pp_table)
>                 return -EINVAL;
>
>         *table =3D (char *)hwmgr->soft_pp_table;
> @@ -1002,7 +1002,7 @@ static int pp_get_power_limit(void *handle, uint32_=
t *limit,
>         struct pp_hwmgr *hwmgr =3D handle;
>         int ret =3D 0;
>
> -       if (!hwmgr || !hwmgr->pm_en ||!limit)
> +       if (!hwmgr || !hwmgr->pm_en || !limit)
>                 return -EINVAL;
>
>         if (power_type !=3D PP_PWR_TYPE_SUSTAINED)
> @@ -1047,7 +1047,7 @@ static int pp_get_display_power_level(void *handle,
>  {
>         struct pp_hwmgr *hwmgr =3D handle;
>
> -       if (!hwmgr || !hwmgr->pm_en ||!output)
> +       if (!hwmgr || !hwmgr->pm_en || !output)
>                 return -EINVAL;
>
>         return phm_get_dal_power_level(hwmgr, output);
> @@ -1120,7 +1120,7 @@ static int pp_get_clock_by_type_with_latency(void *=
handle,
>  {
>         struct pp_hwmgr *hwmgr =3D handle;
>
> -       if (!hwmgr || !hwmgr->pm_en ||!clocks)
> +       if (!hwmgr || !hwmgr->pm_en || !clocks)
>                 return -EINVAL;
>
>         return phm_get_clock_by_type_with_latency(hwmgr, type, clocks);
> @@ -1132,7 +1132,7 @@ static int pp_get_clock_by_type_with_voltage(void *=
handle,
>  {
>         struct pp_hwmgr *hwmgr =3D handle;
>
> -       if (!hwmgr || !hwmgr->pm_en ||!clocks)
> +       if (!hwmgr || !hwmgr->pm_en || !clocks)
>                 return -EINVAL;
>
>         return phm_get_clock_by_type_with_voltage(hwmgr, type, clocks);
> @@ -1155,7 +1155,7 @@ static int pp_display_clock_voltage_request(void *h=
andle,
>  {
>         struct pp_hwmgr *hwmgr =3D handle;
>
> -       if (!hwmgr || !hwmgr->pm_en ||!clock)
> +       if (!hwmgr || !hwmgr->pm_en || !clock)
>                 return -EINVAL;
>
>         return phm_display_clock_voltage_request(hwmgr, clock);
> @@ -1167,7 +1167,7 @@ static int pp_get_display_mode_validation_clocks(vo=
id *handle,
>         struct pp_hwmgr *hwmgr =3D handle;
>         int ret =3D 0;
>
> -       if (!hwmgr || !hwmgr->pm_en ||!clocks)
> +       if (!hwmgr || !hwmgr->pm_en || !clocks)
>                 return -EINVAL;
>
>         clocks->level =3D PP_DAL_POWERLEVEL_7;
> --
> 2.17.1
>
