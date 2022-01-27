Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5849E45B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA48610F02A;
	Thu, 27 Jan 2022 14:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F2F10F027;
 Thu, 27 Jan 2022 14:15:11 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id p203so6034888oih.10;
 Thu, 27 Jan 2022 06:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K2IQ6NQsUfe5CNns9AuCfdtqPvRk7lNSsS0rQJLHnfo=;
 b=MZUnqcDw2Gu5Sjn3lzgqQANinKVWZsKEpaptmcYh61RdGKo5YcTSTygh+Aw+jEkF9c
 3NBp6ewcXqqy9UEL1uQ2ncb7gUcZfIp00jPqmHtXxq07/x/gdVA9IMoW5rJ8yXZ2CG0j
 4QAWdHpINqJUM11UKYSIGKNAkZsITixdg1Sdr0FINi2+nmrdJR8SnZd3fR/wLf8aJcWl
 lru50KKMY5SjBx+yHJCv4811O9APQmAud2rBtAg3cwf8I46QaKAEPI2hZut4KISsglPa
 qiGzEE8VkkqqCzrm77Y3fxF7pNw0XGqQ6/g4Kfd/T/BpvBt85lZBF5gT5Y2QbCCE7JxE
 UqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2IQ6NQsUfe5CNns9AuCfdtqPvRk7lNSsS0rQJLHnfo=;
 b=4BNPDzUWB5icUvqbtwkjuD6gAF6B9KHWrPL0FHgKHhZzPm3ARsy2w3rJCLjKSFL69o
 DBGyxhERx2oN+uzRpJu3jlMArcOd9OoSqiObau0ppXNKw3JaMkQHNYATpYqNz6ANHRRD
 mrw0bgwwmG1o0fwUC4z+NfYyAiCdv6Do5fBIw/mlWcIVbBlGX8ZWmdzgon4yl8ilazPn
 sYtk8gyBoZEPxBOKnLYrwb1MiQ7fAIzeM7N78sxInW9W4rnOFjGveNqrtrx4i/a5/It8
 FZ/b3a17D4/6BcVJO1By3Pp3migFfa++NEQkUKzFBaTPZnWI5gYCbZpYKnpDaPhqE0B/
 O8zQ==
X-Gm-Message-State: AOAM533thEKxzahxOG1Aoex1lreBZPjh+6PEtqHqlNqrICeCSHQBueIk
 qwXRgbowUEXsJvVFzstXWlvY6LZtjlQ4sRgJ5Kc=
X-Google-Smtp-Source: ABdhPJzZs64txo95vMncm1sqGMDOThy11IJwBJJ3+jNFTbv9/cYJuLHtC9a47jnKrT3N3esM1WQA0FfskJhgGzWI3zA=
X-Received: by 2002:a05:6808:2011:: with SMTP id
 q17mr7097575oiw.199.1643292910841; 
 Thu, 27 Jan 2022 06:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
In-Reply-To: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Jan 2022 09:14:59 -0500
Message-ID: <CADnq5_N9p45tJm-sqb+NWbzNU7_rpE0b4YSJ8dcjp+4JJu1wug@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix that issue that the number of the crtc of
 the 3250c is not correct
To: RyanLin <Tsung-Hua.Lin@amd.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Chunming Zhou <David1.Zhou@amd.com>,
 ddavenport@chromium.org, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Dave Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, ching-shih.li@amd.corp-partner.google.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Victor Lu <victorchengchi.lu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please use C style comments /* */.  WIth that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


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
