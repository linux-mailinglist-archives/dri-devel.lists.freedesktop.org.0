Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D908E772C19
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950BA10E31C;
	Mon,  7 Aug 2023 17:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C5810E31B;
 Mon,  7 Aug 2023 17:09:02 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-56d6879dcaaso1353483eaf.3; 
 Mon, 07 Aug 2023 10:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428142; x=1692032942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYtI8iCPC1kn3LKTZ1hvcBGhCgY8szmyxcIcuYezdzg=;
 b=LH43e8ewo6Q0OlUAnGbyvmHFDDCRyTjgIxIXzeCMJnjk8oOaCAlGN6m1ATWzL4gqqZ
 vEkF1AJJ2g9NLduquQm/WoTa/40/jk15YNlpBwKxcxK+MJPhIGhdZ74fFZf3+0EsxpIS
 OulJ6CQWeNuDr70UzQGezZcZAfF+eu/9hlVf8Db6UXlMDHUw62CKbGjbUJSxc/5kkob9
 yqBwm/ogK7UthRQ+0ArEuhFPQRfgb6xRyPsGknCS9G5DMu7h3DwcSbkl+k8D6a3u1tPQ
 AuLgdyzM70G6lsOskSv9sZbdO7umHZ1zG+RNa8/88uGGYqYyIoJ8XwfD6C5Ynp15wxZv
 hlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428142; x=1692032942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYtI8iCPC1kn3LKTZ1hvcBGhCgY8szmyxcIcuYezdzg=;
 b=d7wzydSMqPJnfjN2ADqHLR5naDmffXZV0yxrQzM5qLK1Es1NwjDxvm2/EALynbkz19
 gYjWXlLVmOgXNGNaxPum3HUuEghtoVoR4wsedya3zOYzTtEDd+MeHgKZ6doAlATy6Ipv
 tgPIpq+lDwgwrxJHVD5kmjKh4jigqM1vfXkzUtNTXkdaoaAprqEQtRu7XUSu1LHq+Z2q
 w05eQ6E6A2YFEuRZqwRB3RWKqLY4Nec+khgiW59eBcEgT7nd1cDi4moOT6KLugUBt3QX
 rzojwTnbJBaICkV/8ieODEx1rXod++owne6zwAbaKg63/ajJAPFJRw7UG3BgsmgEEmxX
 8Fug==
X-Gm-Message-State: AOJu0Yyi1+6/3tJCT+Ha4Xuzq0CRjuQSLJk7CLWlpwvKkACof/1Yo3gE
 Wv2TB4c5htk9fFYX4LKwwISDo41mdpwCKAGeyFItecUC
X-Google-Smtp-Source: AGHT+IHIbguMOYbr/p6kStc4b8MneXaZ13fmPnWPKhux18thHDfWxJRPQ+Cz301UTH2V5ZPJoendg9F3yA6BpJeWJTQ=
X-Received: by 2002:a05:6870:d248:b0:1be:f973:efcd with SMTP id
 h8-20020a056870d24800b001bef973efcdmr11273905oac.43.1691428141796; Mon, 07
 Aug 2023 10:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230802025202.10282-1-sunran001@208suo.com>
In-Reply-To: <20230802025202.10282-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:08:50 -0400
Message-ID: <CADnq5_P-E63fZnjm-cgyz4HScOvvvtpm_MTdXfLBrVZe3MCe+w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in
 dce110_timing_generator.c
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 10:52=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that '=3D' (ctx:WxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generato=
r.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
> index 27cbb5b42c7e..6424e7f279dc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
> @@ -288,7 +288,7 @@ bool dce110_timing_generator_program_timing_generator=
(
>
>         uint32_t vsync_offset =3D dc_crtc_timing->v_border_bottom +
>                         dc_crtc_timing->v_front_porch;
> -       uint32_t v_sync_start =3Ddc_crtc_timing->v_addressable + vsync_of=
fset;
> +       uint32_t v_sync_start =3D dc_crtc_timing->v_addressable + vsync_o=
ffset;
>
>         uint32_t hsync_offset =3D dc_crtc_timing->h_border_right +
>                         dc_crtc_timing->h_front_porch;
> @@ -603,7 +603,7 @@ void dce110_timing_generator_program_blanking(
>  {
>         uint32_t vsync_offset =3D timing->v_border_bottom +
>                         timing->v_front_porch;
> -       uint32_t v_sync_start =3Dtiming->v_addressable + vsync_offset;
> +       uint32_t v_sync_start =3D timing->v_addressable + vsync_offset;
>
>         uint32_t hsync_offset =3D timing->h_border_right +
>                         timing->h_front_porch;
> --
> 2.17.1
>
