Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B5D6DB2B0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 20:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAB510ED43;
	Fri,  7 Apr 2023 18:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2ED10ED43
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 18:17:15 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-62815785926so1034499b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680891435; x=1683483435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NuwimqlPO9HpY2//fLh7FzFmSEeSG4CgWKNzgwGf5e0=;
 b=Pxebkcm9CczGaHvPx5PvvvRnR6vaeDp6HKms/KgNAqJQXvWemgVDWj5OCZHUEsr5j3
 G9LMgv/KajspUvAGyGLQ7Iszic6kbG9P2k5NSjI2veF2IMW/awCFrSItQeZmJWK2XLZ8
 i6eaSk3xj2bQYr9/oCtHhhg4bWIW25XK+DRij7sRFBY0PrKPBfd43oe3kVErQiVRHnnP
 rBC1NfOjx2peA67xPLFCrmXLrsiOeHJW2kZXiKf92yzvKxgztNNJ4tJanifs/JMLrTin
 Iun3CcwO27658Fb0advMSuPzDrAVtKjlY5wElw8gSey5BR3sb1CzIGcoUtpUEIO4NNiT
 hDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680891435; x=1683483435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NuwimqlPO9HpY2//fLh7FzFmSEeSG4CgWKNzgwGf5e0=;
 b=JseCZ246iOwHKcepGBRlK3yTAXDmLszy7yOzzBZLZeHdEV2RtZ+oQdEfWigXmC63y7
 RNo+cq38yj0ojeOWlyZ0afVCVxnW63OT2qPoT6YsolQW2xtAzbi8V1q1qpYjICBxL7db
 XqMqAqRdcMDA7KQZYQI7ijVF/h+dOrSMhZZkrcIH4KkG0EYD4fZfoThMC0bN+zaduoiL
 WlBx84D6GXJmn+I5Cy9UO7yyP4/emNQmnDjkJvVHM4maoCBIFTn+ehfvvvhCZnTviJPk
 DhpnF5RKZr95ocUyndbhLbzKcIckoh8Z/XhtZ0lYHQ6fMRxV3iCvYYlWmUa+M9szHivW
 3HwA==
X-Gm-Message-State: AAQBX9evEE69F9Yxn3U8H8O19t2KNp7hgfEfo3AW363hWATJDoNeBrTW
 k/Ry6ZSjzw9uDmagFDae7bphrxbOWv4Tbsqr3eYHPA==
X-Google-Smtp-Source: AKy350Y6wWEggvCrlIf1bje2atujKhf9qMM/qxlunzgcridw/Fvst4ed6hVP1rP9DeneT/1K3zn48LLIF486O17fgc0=
X-Received: by 2002:a05:6a00:2ea8:b0:61c:67d2:a332 with SMTP id
 fd40-20020a056a002ea800b0061c67d2a332mr1427088pfb.3.1680891434554; Fri, 07
 Apr 2023 11:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230331164041.1859088-1-trix@redhat.com>
In-Reply-To: <20230331164041.1859088-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:17:03 -0700
Message-ID: <CAKwvOd=5Uw=6_8erAq0gt_-URUqXgK2ZvtCv5Ch_VZdk01sayQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove unused num_of_active_display variable
To: Tom Rix <trix@redhat.com>
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
Cc: tim.huang@amd.com, lijo.lazar@amd.com, andrealmeid@igalia.com,
 KevinYang.Wang@amd.com, kenneth.feng@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nathan@kernel.org, mario.limonciello@amd.com,
 alexander.deucher@amd.com, Kun.Liu2@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 9:40=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1700:6: error: variab=
le
>   'num_of_active_display' set but not used [-Werror,-Wunused-but-set-vari=
able]
>         int num_of_active_display =3D 0;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Fixes: commit 75145aab7a0d ("drm/amdgpu/swsmu: clean up a bunch of
stale interfaces")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/=
amd/pm/swsmu/amdgpu_smu.c
> index b5d64749990e..f93f7a9ed631 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -1696,8 +1696,6 @@ static int smu_display_configuration_change(void *h=
andle,
>                                             const struct amd_pp_display_c=
onfiguration *display_config)
>  {
>         struct smu_context *smu =3D handle;
> -       int index =3D 0;
> -       int num_of_active_display =3D 0;
>
>         if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
>                 return -EOPNOTSUPP;
> @@ -1708,11 +1706,6 @@ static int smu_display_configuration_change(void *=
handle,
>         smu_set_min_dcef_deep_sleep(smu,
>                                     display_config->min_dcef_deep_sleep_s=
et_clk / 100);
>
> -       for (index =3D 0; index < display_config->num_path_including_non_=
display; index++) {
> -               if (display_config->displays[index].controller_id !=3D 0)
> -                       num_of_active_display++;
> -       }
> -
>         return 0;
>  }
>
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
