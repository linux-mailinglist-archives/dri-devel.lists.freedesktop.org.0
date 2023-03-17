Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0276BF2CC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D77210E421;
	Fri, 17 Mar 2023 20:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22A510E421;
 Fri, 17 Mar 2023 20:39:20 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id r36so4711551oiw.7;
 Fri, 17 Mar 2023 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2ceKigtwCgXknXQIGjyiY2sXOg78OguiBhLG+H+iU0=;
 b=F7NTXlDuv7+z1BobleOBc0RzjNkRncybXR/Z40pNG/5NJ00vWglvmdZcLWvQSAu8o9
 0vM/eWWYUP/2F/sNosphE2DlJnnWrAKAyy0vUfp+q9pWka7l+v0dBJ0JTDFdwr14dwV4
 qpbQN5es849DbZbRstsHGVEQEKDoy0P2oeumDIR7sPrWsviRTQCMoPUown0o9FXfMMzj
 IGyIMPZzJL7fZuA69a/x0CuYlKgDoM34lBsqu6tTFCYYd/ODOZbSIg9aupD44K674Mdw
 QDqrb2MMUjaD/n+dSrVXs90YvQpONuYZQY/7ixBluCMoZ72av/q1J1MYHSZEYDUjHlp9
 CNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2ceKigtwCgXknXQIGjyiY2sXOg78OguiBhLG+H+iU0=;
 b=mhSCmgTMs0kBOZPWkkApR3+SOAdY295iaKTyJ/lLedDgpigRrE1xqN7JfFvncD4mlu
 t52G21GpXZgCTqdQHlvnpZIDnPoKqZMtG2DPuca90BWnmTtXFMs5DdrgFHfaYraTQWrP
 HstEZE8WYgcrO2HQxwcGXQ1DABiKJVuJ4XcELqDSUZaUINVGB4XPqxA9AN7xfCq7TkPE
 ASUNtQzbhC1x+CBLci8SYC6BBSXQLnVwP08c2F3UP2Li71yHJ8E5/P7HDq6/wvoveuCI
 6nuvtaXsT6KLX057XHJ5tdZMlvRbgjVDVTyMRPtroSg8Vh5RTDAcP329ggwyRaCdLTgF
 n5Mw==
X-Gm-Message-State: AO0yUKXcpTRLcj1pthBeORQ8P0KWGCsvyYBvHFF80xhwanwUSBACbyml
 MiDt98OWxQCwxrSHADta1Es/B9erwJgJevhLS/E=
X-Google-Smtp-Source: AK7set+b+3oyu0svFygRamnRBQc9qzNVoS/CNFRldG8LQY67XtnAE+vykp7jKoBeOi7sUvON7HXb4M7gFbjdNQ7cXLQ=
X-Received: by 2002:a54:449a:0:b0:384:692c:56c9 with SMTP id
 v26-20020a54449a000000b00384692c56c9mr3625036oiv.3.1679085558766; Fri, 17 Mar
 2023 13:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-31-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-31-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:39:07 -0400
Message-ID: <CADnq5_M4Zq4AQJVVw8f1k_M4xTygzPzbYoNdHQV27T76uk=2tw@mail.gmail.com>
Subject: Re: [PATCH 30/37] drm/amd/display/dc/link/protocols/link_dp_training:
 Remove set but unused variable 'result'
To: Lee Jones <lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training=
.c: In function =E2=80=98perform_link_training_with_retries=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training=
.c:1586:38: warning: variable =E2=80=98result=E2=80=99 set but not used [-W=
unused-but-set-variable]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Wenjing Liu <wenjing.liu@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.c   | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_traini=
ng.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> index a9025671ee4a8..10261764a0cea 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> @@ -1580,8 +1580,7 @@ bool perform_link_training_with_retries(
>                                  * Report and continue with eDP panel mod=
e to
>                                  * perform eDP link training with right s=
ettings
>                                  */
> -                               bool result;
> -                               result =3D cp_psp->funcs.enable_assr(cp_p=
sp->handle, link);
> +                               cp_psp->funcs.enable_assr(cp_psp->handle,=
 link);
>                         }
>                 }
>
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
