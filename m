Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1E7C8716
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B4A10E60C;
	Fri, 13 Oct 2023 13:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9310E0ED;
 Fri, 13 Oct 2023 13:43:16 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6c67060fdfbso1406455a34.2; 
 Fri, 13 Oct 2023 06:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697204596; x=1697809396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VnWEZv1MNtgqh9gti2tLWs0h9m12y4MRumc01RdiEtk=;
 b=jU6ZkVUuZAMYP2/G2O4b9D/tKVz76LsAnC0v5Stue0FH+617lu4NXIBZEoBfJ9k0i4
 1dtJZ8pFxJx/ouvrXT12HzDau0vhcLVQUAxARcuOm1DGOSTcbAM7nIOSPV6MeMHgCKyi
 HLj66OsztYIuxA2JJobVw0HnQ9QjgWm8Jk3YZSRNSvZkUxBCSw0vh/kZYAc50vVglkRS
 xNwG94KBg6PYKul+Y//4v0ItFkTAq0VCCdbEr3yyHM6kuunurTeXuYf680LyqZOoi3iJ
 bxArgB9/KgYevC2vlR2efvNIjzOEevnb/Tdsxq12JuUiiAAbgDPD/CmMNDnPFNh0l6SF
 I51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697204596; x=1697809396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VnWEZv1MNtgqh9gti2tLWs0h9m12y4MRumc01RdiEtk=;
 b=Cvh7uSUheOg2il2uFKDx/di5YQgZx/Iptf0KsMDsAp7Cvh8ysOea3hnVMYEPgeLjGR
 59fidx9sewyMQ52NVvlZUsPIX8UH0GamR3fR2/iEg2Jr7lGaGSSZL00I66qINMjDINwE
 Z4kF4XjGcBxRwJIFkyad7rC2DQbrGcXVbD/d2tzlRTugknGaitJcKe5xhzvMulwNZzrT
 DzXzBLNfabDj7unnQzJ+Xaufhc6QKJMph6AwxhL6Y0fC5cgmR0KKx8Cx01FinbFqirr0
 IL5VbplfC99sRVw0LelZlvRozeH8ryeT5kdPwLIZ2q4QP4pAXXQJiEv0HpwI54AIpP2U
 mKfw==
X-Gm-Message-State: AOJu0Ywxr3zJMOCuWjXFT+SMtcil7gTbB5Hg2NicGjj68UIZkGQWVNnH
 t0bGyf9jlh/Bzh7/xSyxcGJ/wntr3dNfniTS6kw=
X-Google-Smtp-Source: AGHT+IFoW3UGKp6WFchSFelNoxU/WAsrS3zOm0oHTP2cYQpadsAsYs+Nk8COpFjgfB4j6U0yPXA5ci7qMvaaTZquInY=
X-Received: by 2002:a05:6871:4414:b0:1e9:9537:c1a9 with SMTP id
 nd20-20020a056871441400b001e99537c1a9mr9024226oab.12.1697204596057; Fri, 13
 Oct 2023 06:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231013015343.290456-1-make_ruc2021@163.com>
In-Reply-To: <20231013015343.290456-1-make_ruc2021@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Oct 2023 09:43:05 -0400
Message-ID: <CADnq5_P4i2J2AaO2R6rMO0nvRGZNT1EUN1jDUB2mC4BkHKOecg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/vkms: fix a possible null pointer dereference
To: Ma Ke <make_ruc2021@163.com>
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
Cc: yifan1.zhang@amd.com, guchun.chen@amd.com, Tim.Huang@amd.com,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 10:32=E2=80=AFPM Ma Ke <make_ruc2021@163.com> wrote=
:
>
> In amdgpu_vkms_conn_get_modes(), the return value of drm_cvt_mode()
> is assigned to mode, which will lead to a NULL pointer dereference
> on failure of drm_cvt_mode(). Add a check to avoid null pointer
> dereference.
>
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vkms.c
> index 7148a216ae2f..db6fc0cb18eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -239,6 +239,8 @@ static int amdgpu_vkms_conn_get_modes(struct drm_conn=
ector *connector)
>
>         for (i =3D 0; i < ARRAY_SIZE(common_modes); i++) {
>                 mode =3D drm_cvt_mode(dev, common_modes[i].w, common_mode=
s[i].h, 60, false, false, false);
> +               if (!mode)
> +                       continue;
>                 drm_mode_probed_add(connector, mode);
>         }
>
> --
> 2.37.2
>
