Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A43925DA
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C59B6EE14;
	Thu, 27 May 2021 04:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5FC6EE12;
 Thu, 27 May 2021 04:06:38 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so3161027otc.12; 
 Wed, 26 May 2021 21:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RtGwrkIZZiG/x3fVmHw4MZLqdOdAM4Gg7Y6DlMdvCdw=;
 b=pMPHrGUXErML46PYLsZlta62mAowxd0zO2JEe4M38/eyLaBxeCe4Xefjt7GTG0bxGo
 c3zV+MkFTIeXyqH3dUzGykGN86vNRYfDPsukBpabdLpFuB31Uh7TnSUtb1MaO9VgcTfE
 uTXK/gEpEari421GQlRRMqYqgjZWimNlHZtc+UINdA5SKPENYyNyDgfU+le/knyenmfb
 kgLDj0HbNkwHa+8rJiXRX1TA/GUzv2iGmTysZ/FzWWVauBZj7c13DwMvdAkn90kRDKBV
 ztf9H3Fb0e1yTZWEFcNoY9UjAsOPqH2YngGDPUI/X29iIn+ZpeW67ugUYuE9pHcIp+P/
 bc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RtGwrkIZZiG/x3fVmHw4MZLqdOdAM4Gg7Y6DlMdvCdw=;
 b=jQ07bv6A8xkzXI2kCM6HYWqBE/B6dwdksZElAlJpm37ik0skoQBtoTNkK0I5HqoCP6
 7odzhCCc+wDEb+qFHm0K6Qv7egy87Hn6rRQj8i98QFZPYpddXPEVFBRKcnZLUxgtOKPU
 IAa0kKOljE7vgG7t3f7YnpmGLtKKggj1T6vOq+BTBy7nFDF/eyfdcxzFY1rVIwYiU/wj
 7NCjEkJaShYAn1B9VJBxG/kLtek4DfK4AjtvwkV2OKZZVPlC+klxsOxAKC9pMHajdkWB
 kjqfv1GZeNbiS41pNzwKWlr5wG0pKF+sNuKSnU35DUGNiYORto043mnCtWsyG1Hz96HW
 Znyw==
X-Gm-Message-State: AOAM531CRYuhKXzI1NR43hnoxtXUXcgrDn7GPtzocjvwQoYrQ4rvLvpt
 ggedqdajpyJaSPNUSP1ZFd93UUz6sMYdINnnkww=
X-Google-Smtp-Source: ABdhPJx/wFysi+q75alNDvyWj5aqiElb2rD9pHI15NmXnWIaZUVQIc8U5fEeIBdUzugrq/hHK7fiisx/Y2U5yXXCjiM=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr1235375otl.311.1622088398310; 
 Wed, 26 May 2021 21:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-15-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-15-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:06:27 -0400
Message-ID: <CADnq5_MMSGX1Ys+n_bm0KkR_xzANYAK37r2JXi532Wzf8t7w0Q@mail.gmail.com>
Subject: Re: [PATCH 14/34] drm/amd/display/dc/gpio/gpio_service: Pass around
 correct dce_{version, environment} types
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c: In functio=
n =E2=80=98dal_gpio_service_create=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:71:4: warni=
ng: implicit conversion from =E2=80=98enum dce_version=E2=80=99 to =E2=80=
=98enum dce_environment=E2=80=99 [-Wenum-conversion]
>  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:77:4: warni=
ng: implicit conversion from =E2=80=98enum dce_version=E2=80=99 to =E2=80=
=98enum dce_environment=E2=80=99 [-Wenum-conversion]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c   | 12 ++++++------
>  .../drm/amd/display/include/gpio_service_interface.h |  4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c b/drivers=
/gpu/drm/amd/display/dc/gpio/gpio_service.c
> index 92280cc05e2db..dae8e489c8cf4 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
> @@ -53,8 +53,8 @@
>   */
>
>  struct gpio_service *dal_gpio_service_create(
> -       enum dce_version dce_version_major,
> -       enum dce_version dce_version_minor,
> +       enum dce_version dce_version,
> +       enum dce_environment dce_environment,
>         struct dc_context *ctx)
>  {
>         struct gpio_service *service;
> @@ -67,14 +67,14 @@ struct gpio_service *dal_gpio_service_create(
>                 return NULL;
>         }
>
> -       if (!dal_hw_translate_init(&service->translate, dce_version_major=
,
> -                       dce_version_minor)) {
> +       if (!dal_hw_translate_init(&service->translate, dce_version,
> +                       dce_environment)) {
>                 BREAK_TO_DEBUGGER();
>                 goto failure_1;
>         }
>
> -       if (!dal_hw_factory_init(&service->factory, dce_version_major,
> -                       dce_version_minor)) {
> +       if (!dal_hw_factory_init(&service->factory, dce_version,
> +                       dce_environment)) {
>                 BREAK_TO_DEBUGGER();
>                 goto failure_1;
>         }
> diff --git a/drivers/gpu/drm/amd/display/include/gpio_service_interface.h=
 b/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
> index 9c55d247227ea..7e3240e73c1fc 100644
> --- a/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
> +++ b/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
> @@ -42,8 +42,8 @@ void dal_gpio_destroy(
>         struct gpio **ptr);
>
>  struct gpio_service *dal_gpio_service_create(
> -       enum dce_version dce_version_major,
> -       enum dce_version dce_version_minor,
> +       enum dce_version dce_version,
> +       enum dce_environment dce_environment,
>         struct dc_context *ctx);
>
>  struct gpio *dal_gpio_service_create_irq(
> --
> 2.31.1
>
