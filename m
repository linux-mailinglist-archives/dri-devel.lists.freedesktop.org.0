Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D7F4EB89D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 05:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBB710EEE4;
	Wed, 30 Mar 2022 03:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0AB10EE55;
 Wed, 30 Mar 2022 03:02:04 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j83so20881365oih.6;
 Tue, 29 Mar 2022 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ur1fEP3S2LvaWAlvGKw+OsWwCUfBsA0hA7I29tDVbH0=;
 b=XEJLTGvbNYlW1w/0qqsdA8xWWbqsGgetz7yWkk8Xfqn+0r56mCFq3cY/t1djsGQEjd
 u11tsX1TImjiuFekbn50D+H5/67OefnF02KpgnfsVZEQJvQGqX57NKMkG9iuEjLfy9pk
 QSsXGbYN+IpicA0ENNQFRH3uc1rVNVen5KSkt0Ig6P1y7fVo547VwIHeHHU3HoVOxxLy
 O6Q/kPuzvjeK2pynlMHaLz+uBxhfjqvQeEMpnTKnldPPaLisMTu3+zp3+ER6T8/dnbVk
 owcW+Egr0yV+wxcbkf7B3WdJSrUVY842OyU4WS98pFjbZYR4IuSrjsk1RO2wfk/i2hri
 pL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ur1fEP3S2LvaWAlvGKw+OsWwCUfBsA0hA7I29tDVbH0=;
 b=xrkrLwAX1SU62nf7zdInEaXE3zbF+UmFA4xbWTIooRirqXyVgNdKnO2WVZNkABXQT9
 wLjo0GyGhHqoUgLe0puTKamF+wKA53EMjOvxUrKHn9Svqn3GKhipx5kdkp+qfdllaZgn
 w3AcQNvm8Ydvqh2xEGfzVii4E4vqeB7SqE9QgLlLoA9+sQivDRJBuRXWVpLp3jp0K64p
 hvzyN1flL/WZH2uQKJGbauo6MSK7ToG/NJ4chKZsnK6X/RksjE2svBienHrR4wE/LM0h
 +ixcaiXpaAQkfC90waPxNX3uEikhRWFIMIP9SFCwTiN+cL/uhru/s+0WNVmluAbYE0tK
 P6Ng==
X-Gm-Message-State: AOAM532kPXsylRh82ETuOJaMVffbWPpZMF/D/iVaPWiVgFQexh/Dd3gg
 GMoO059bZWozdQsGZjakonrSntbOlT9kRfx/4Ss=
X-Google-Smtp-Source: ABdhPJzkB9w/7Dh3ntidVedaTQyZjbL6+tpV1HB5APfyAdQjTC4sUhKGfrB7FhdaIO3zE63Y7Hl0XGb4Kt8995j2G3k=
X-Received: by 2002:aca:d04:0:b0:2ef:8b45:d235 with SMTP id
 4-20020aca0d04000000b002ef8b45d235mr956733oin.253.1648609323691; Tue, 29 Mar
 2022 20:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
 <20220330024643.162230-1-tsung-hua.lin@amd.com>
In-Reply-To: <20220330024643.162230-1-tsung-hua.lin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Mar 2022 23:01:52 -0400
Message-ID: <CADnq5_O6S+7Kk34fGCjqmmJAf5JtZP35+MBpCDQnH5Sh6ZosFA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix that issue that the number of the crtc
 of the 3250c is not correct
To: Ryan Lin <tsung-hua.lin@amd.com>
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Leo Li <sunpeng.li@amd.com>, leon.li@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Louis Li <ching-shih.li@amd.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 10:57 PM Ryan Lin <tsung-hua.lin@amd.com> wrote:
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
> v2:
>    - remove unnecessary comments and Id
>
> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 40c91b448f7da..455a2c45e8cda 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
>                 break;
>  #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
>         case CHIP_RAVEN:
> -               adev->mode_info.num_crtc = 4;
> -               adev->mode_info.num_hpd = 4;
> -               adev->mode_info.num_dig = 4;
> +               if (adev->rev_id >= 8) {
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
