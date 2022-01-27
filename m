Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB95849E61E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 16:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B171A10EB93;
	Thu, 27 Jan 2022 15:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B4810EB93
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 15:33:49 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id u76so5443705uau.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 07:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dYlyRT8MryrVm8WUK1FdOweuPDLL3YnH5oihq3jLfy8=;
 b=faQ/HBXgsVjlFmHlztd/KP6medHPDl1H40RAw4sNhxx4j+v4T9cABadDRt4fqVbS/7
 HoU1auK3P7ZZe+KD5GOYPWBJqxCHKPFu4VIfTE6ubOg/KdtOdnA5XsD0H3GrFIwSzskQ
 1HHR2PZyk1ZjzKMj/4sqEnXRPeMq8yi4crW/a2ygrh4Z8wUHgvO1Nssnj1ivyXyhJu7Z
 fztbePPUKNZ6KwLJ6xZgjpLsAG9jEtYQp3Jh93mkNl7MbBg429tfNflHYckk2PCGYaYC
 auoz8BlYUWv1v4T/HedGWsASZmhlFtJo6hecLX7KATt16Okxd7KhXXn9/WM2ogNjAGbm
 XH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dYlyRT8MryrVm8WUK1FdOweuPDLL3YnH5oihq3jLfy8=;
 b=VzKk/O2o4p5L7AoF3/KlRyJfTBN6xq7gJHDXfG9PkEVaEBP9LkxgS2rQfdgVM5G855
 rSv6TJN1YSy4ylNAW6VSiby+CGePRZGa8bXZ3Bn1HDuVTXt0OVfY3gSx+vxC9AbXkZmn
 EyPFnE16AtJpYd9odxzlf3/pc2PvyCTDYXPc/Uk2EC069gdRR78zTI1rJPgc5N7a7+Hq
 MQiFR1fFIrLzgKGf1F3YR0XXoeXMVvMtqOtLiVSAAJgS4o5YIaPfzA/Ubeiby1ELLoGk
 GfMzr/dCwRpdcs7WfogSpbM0puyrhOxIA1lmZCxI3POlxbeK30lpMC1GOglGusj44rVe
 Lsdg==
X-Gm-Message-State: AOAM532SjrtJZreVeLtFovUliwB7eWYP016V43qPu4f0zVdz3LFzMyeE
 D7wYGR0zFsErjzsQBrlr9EzI8OYrBIWoRWewVxQZuw==
X-Google-Smtp-Source: ABdhPJzxLZy3Br1wvhjHjXo3hgQ5U9hjIEoMs8/OZbFqoQCuAXkCrI0wSN6MvtdPsxy1nmjij7CWiPcJFmTRspA9chs=
X-Received: by 2002:a05:6102:364:: with SMTP id
 f4mr1972935vsa.15.1643297628112; 
 Thu, 27 Jan 2022 07:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
In-Reply-To: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 27 Jan 2022 10:33:37 -0500
Message-ID: <CAC0gqY7T=_F=fGRDBEZOhu7thLP_hkWE50w94hC5oahNxNg6ng@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix that issue that the number of the crtc of
 the 3250c is not correct
To: RyanLin <tsung-hua.lin@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: sashal@kernel.org, David1.Zhou@amd.com, ddavenport@chromium.org,
 sunpeng.li@amd.com, dri-devel@lists.freedesktop.org, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, airlied@linux.ie, seanpaul@chromium.org,
 ching-shih.li@amd.corp-partner.google.com, alexander.deucher@amd.com,
 VictorChengChi.Lu@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 3:12 AM RyanLin <Tsung-Hua.Lin@amd.com> wrote:
>
> [Why]
> External displays take priority over internal display when there are fewer
> display controllers than displays.
>
> [How]
> The root cause is because of that number of the crtc is not correct.
> The number of the crtc on the 3250c is 3, but on the 3500c is 4.
> On the source code, we can see that number of the crtc has been fixed at 4.
> Needs to set the num_crtc to 3 for 3250c platform.
>
> Signed-off-by: RyanLin <Tsung-Hua.Lin@amd.com>
> Change-Id: I837df7101cc4849d2c3021fd529b4061edab4bb1
Please drop the gerrit ID.
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 40c91b448f7d..dbeef7b57a9b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
>                 break;
>  #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
>         case CHIP_RAVEN:
> -               adev->mode_info.num_crtc = 4;
> -               adev->mode_info.num_hpd = 4;
> -               adev->mode_info.num_dig = 4;
> +               if (adev->rev_id >= 8) { //chip_name = "raven2";
> +                       adev->mode_info.num_crtc = 3;
> +                       adev->mode_info.num_hpd = 3;
> +                       adev->mode_info.num_dig = 3;
> +               } else {
> +                       adev->mode_info.num_crtc = 4;
> +                       adev->mode_info.num_hpd = 4;
> +                       adev->mode_info.num_dig = 4;
> +               }
>                 break;
>  #endif
>  #if defined(CONFIG_DRM_AMD_DC_DCN2_0)
> --
> 2.25.1
>
