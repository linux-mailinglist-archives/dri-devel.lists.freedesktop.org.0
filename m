Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B677BCDC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 17:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D5710E21F;
	Mon, 14 Aug 2023 15:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8E310E099;
 Mon, 14 Aug 2023 15:21:08 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1c504386374so635811fac.3; 
 Mon, 14 Aug 2023 08:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692026468; x=1692631268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmXw42vYBpIHlr9RAwRjVQ1bt932a1P48E68S21Ma7s=;
 b=UV1adqCG/sLdfUVA1sejZE+LJ8ROv8tjDbb7CtaYEDa1KWR0ok5pkdsXEBeN2f/skf
 GKy5BV3F0UiuMNp286wZtHW5DDRUBK4iKHv+tG/NUnHEWIg3d9eTEI8kEEFJvWZITqCY
 0UtxDxmWB5MGdk9/g5Xk88iIvL2iRec00MMAWSNvqFG7PV3kBvaXdCK6YLXCgddWBRC6
 hoNzjjyhPoOQTjL+7ILgldo0sLQs7rsLkPkU2eUmFZnFkB6KN41H3Sk9khWBCNmA+r81
 5OBIzyAmm2hFBow5HQqcWq5+7PvBPFFTpmQwiopmnVp60GCDp/0YWQ0ZUzslvPsToZ44
 P+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692026468; x=1692631268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmXw42vYBpIHlr9RAwRjVQ1bt932a1P48E68S21Ma7s=;
 b=ZbiHLw7YYaxnXLf5IJbMOYGQupGPodVxmQRZf11GI6QxbZOkLJk6HImh157E5oYwwC
 QBCPa+EOTSCF+K6trL3M1Ds5P8GkSveYCxGDkfh+73GDAcexEuIzzKwKwy0Y3BqkCa7H
 KLtSVV2i2Do83Ig5CFy44uVYjj9JK7YFp2CM7TvKNWoPBkuF+b3iyUrum9UwUvfDv8Pu
 WYV/SoQthghUIs0VtcYygTCHe4+SAjltryLhjoehYVl73KbZNymUud+bTl2AF9wOvwbJ
 oIDjfzczr/wiRrN5L9eLli4kz7Y/sm7yQTqTfB4ooai5ZeTrH7KQIdQaLfzOV/xNJZj+
 ZkFg==
X-Gm-Message-State: AOJu0Yx56bE2KzBGZRP7DYzFYOi2+pzzOc2n0uQK99+Ef61udGr1euGF
 XXL6ewsbzROFuUh8iqEzsFmdaG+r2wuHOzPh/+k=
X-Google-Smtp-Source: AGHT+IExI1BCHAJZsWHfZXqnovYZQwJBpzrdyL8X1s0k+w/NekJG5/m8afptD7TkZqUpPpfaWYxJV6tDDX7GisZHzYY=
X-Received: by 2002:a05:6870:31c5:b0:1bb:4ec1:50ae with SMTP id
 x5-20020a05687031c500b001bb4ec150aemr10285499oac.24.1692026467748; Mon, 14
 Aug 2023 08:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-4-Arvind.Yadav@amd.com>
In-Reply-To: <20230814073438.10682-4-Arvind.Yadav@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Aug 2023 11:20:56 -0400
Message-ID: <CADnq5_M3_N-rXTcvsQ76QGo1bjBc92SPPHfwFayNbroq-Ph_iw@mail.gmail.com>
Subject: Re: [PATCH 3/3] Revert "drm/amd/amdgpu: switch on/off vcn power
 profile mode"
To: Arvind Yadav <Arvind.Yadav@amd.com>
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
Cc: shashank.sharma@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KFD also changes the profile when queues are active.  Please make sure
that is properly taken into account as well.

Alex

On Mon, Aug 14, 2023 at 3:36=E2=80=AFAM Arvind Yadav <Arvind.Yadav@amd.com>=
 wrote:
>
> This reverts commit 5ce71f59bb9bd3d8a09b96afdbc92975cb6dc303.
>
> Reason for revert: New amdgpu_smu* api is added to switch
> on/off profile mode. These new api will allow to change the
> GPU power profile based on a submitted job.
>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vcn.c
> index 2d94f1b63bd6..70777fcfa626 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -363,7 +363,6 @@ static void amdgpu_vcn_idle_work_handler(struct work_=
struct *work)
>                 container_of(work, struct amdgpu_device, vcn.idle_work.wo=
rk);
>         unsigned int fences =3D 0, fence[AMDGPU_MAX_VCN_INSTANCES] =3D {0=
};
>         unsigned int i, j;
> -       int r =3D 0;
>
>         for (j =3D 0; j < adev->vcn.num_vcn_inst; ++j) {
>                 if (adev->vcn.harvest_config & (1 << j))
> @@ -392,10 +391,6 @@ static void amdgpu_vcn_idle_work_handler(struct work=
_struct *work)
>         if (!fences && !atomic_read(&adev->vcn.total_submission_cnt)) {
>                 amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK=
_TYPE_VCN,
>                        AMD_PG_STATE_GATE);
> -               r =3D amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_=
PROFILE_VIDEO,
> -                               false);
> -               if (r)
> -                       dev_warn(adev->dev, "(%d) failed to disable video=
 power profile mode\n", r);
>         } else {
>                 schedule_delayed_work(&adev->vcn.idle_work, VCN_IDLE_TIME=
OUT);
>         }
> @@ -404,16 +399,11 @@ static void amdgpu_vcn_idle_work_handler(struct wor=
k_struct *work)
>  void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
>  {
>         struct amdgpu_device *adev =3D ring->adev;
> -       int r =3D 0;
>
>         atomic_inc(&adev->vcn.total_submission_cnt);
>
> -       if (!cancel_delayed_work_sync(&adev->vcn.idle_work)) {
> -               r =3D amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_=
PROFILE_VIDEO,
> -                               true);
> -               if (r)
> -                       dev_warn(adev->dev, "(%d) failed to switch to vid=
eo power profile mode\n", r);
> -       }
> +       if (!cancel_delayed_work_sync(&adev->vcn.idle_work))
> +               amdgpu_gfx_off_ctrl(adev, false);
>
>         mutex_lock(&adev->vcn.vcn_pg_lock);
>         amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VC=
N,
> --
> 2.34.1
>
