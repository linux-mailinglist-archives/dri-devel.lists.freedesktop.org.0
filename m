Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DB5752D7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 18:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8219311A142;
	Thu, 14 Jul 2022 16:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D7211A138;
 Thu, 14 Jul 2022 16:32:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id oy13so4414965ejb.1;
 Thu, 14 Jul 2022 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MQQLZDnraOk05TyTJ/NoEzLsjvMb4sYNTl3FKSVedI4=;
 b=U61SpsT0ra/rbLywhQDkYlbjqbRoXP1i4GeZrk7HnehHSPteHyg0kVgayq7z7h0uDE
 5HyRR8iWr2x17yrbhq1QVw4iafAZSAvwAxHc92+eFL0LcHD6aa3cGrv8gk9g4v81nv0s
 tD9UOZP1hGyyF+HhL4SZID9zQM+ov8Rh2dtoaRMO7pcetZW7qQ4UZKXZflTGURUpokhW
 fm8fBVJ2chR0XPfx2lNK/C/zt9OKEbKCSfUp3RUt2bAmchb84H0YwmiE+Leum2HOsK5o
 /hqXTxNonqdUJgTAlIQ5KslZtQ7lkFvOhD1cUwK1BOFEjJvtXJcVR4BnfcilWJca0AJL
 TNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MQQLZDnraOk05TyTJ/NoEzLsjvMb4sYNTl3FKSVedI4=;
 b=cDHsfU6o8PdDHFWmlcZmLtMk2q19BlPe89jJR6ZOqlzqUq7fZnfV0gjiv8JfZ2s4l0
 k/R5Ma1BATQf1pBCbvCppSNvrd/08BTa1KUD+gL1A8cq1ejHtHsPBfuDlnNoobO/aRYt
 kUIMDkIdu/tsGrEB1AuLi4GcGcOcYrSn+tzfCYxVrG1OE4q9OUr3hRmFoz98xzeS8Zgk
 rqSABYYkv1F8WvXR/gQmoRbJcH0MTwfPyMXHlJFJkAf8DFouHCzi00CXASeacdTApUkz
 vLp54O1vh/25ySjnpTJXOjjFVfi78bs2eBvPwjlxDBQsIdu/KYArGklC+D4kyAd19vaL
 mZfg==
X-Gm-Message-State: AJIora82qP9ojo6GGOHlzpwPhZlKf2kTPwF8kdtOG6+DEQtD7ZRZLGSg
 bW7xGPhZVeoiG30ShmwDRGlp0YrbHX4X4d8HJIQ=
X-Google-Smtp-Source: AGRyM1vlytD0v6dn3HOd2gXV76HLjUKojSLRL55b5g8HIpRWvreWcklT0NDIWnKYlVq3tnGI7bQPKr+Z6CDJMyg1aWU=
X-Received: by 2002:a17:907:2702:b0:72b:307b:98e6 with SMTP id
 w2-20020a170907270200b0072b307b98e6mr9621924ejk.658.1657816353203; Thu, 14
 Jul 2022 09:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220714134950.9564-1-andrealmeid@igalia.com>
In-Reply-To: <20220714134950.9564-1-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jul 2022 12:32:21 -0400
Message-ID: <CADnq5_MzH14zJnt0vj1q+dL7D=eVNz-s5WW7xYDQyHD6QANXSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clarify asics naming in Kconfig options
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Jul 14, 2022 at 9:50 AM Andr=C3=A9 Almeida <andrealmeid@igalia.com>=
 wrote:
>
> Clarify which architecture those asics acronyms refers to.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amd=
gpu/Kconfig
> index 74a8105fd2c0..7777d55275de 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -4,7 +4,7 @@ config DRM_AMDGPU_SI
>         depends on DRM_AMDGPU
>         help
>           Choose this option if you want to enable experimental support
> -         for SI asics.
> +         for SI (Southern Islands) asics.
>
>           SI is already supported in radeon. Experimental support for SI
>           in amdgpu will be disabled by default and is still provided by
> @@ -16,7 +16,8 @@ config DRM_AMDGPU_CIK
>         bool "Enable amdgpu support for CIK parts"
>         depends on DRM_AMDGPU
>         help
> -         Choose this option if you want to enable support for CIK asics.
> +         Choose this option if you want to enable support for CIK (Sea
> +         Islands) asics.
>
>           CIK is already supported in radeon. Support for CIK in amdgpu
>           will be disabled by default and is still provided by radeon.
> --
> 2.37.0
>
