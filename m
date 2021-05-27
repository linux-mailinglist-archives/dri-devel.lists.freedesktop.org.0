Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C22392593
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA6E6EDFB;
	Thu, 27 May 2021 03:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FB36EDFB;
 Thu, 27 May 2021 03:49:36 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v22so3812189oic.2;
 Wed, 26 May 2021 20:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DX5LZ59j/U95L+mNk2w46JLq9y9MxosdgzOg6i0ZZ6E=;
 b=u8DB9ze/Jw3EU/Y4+kWrZQ6Cw2+PcWjxFCoDTqyt4TeM+BZFS+KrGfLZhaEBSCoXpl
 dbTbZeMaDXuKOHyGSU0lPjSHx2ndTerJYw44ctn2yUTQaIfyXZB5TJwBjJth9OqkAEV6
 x83RO7YGxNxPM/MaGdoq2HGnCY7nfNSzu9g1OahvUbuq5DRf4t1PJ6pebrxZ8TzsIms5
 qKG9MaTmsOH59Nsk07lS+oksXQZ+1tdCjsbJoz63DHEUGIvQ2XXrTu2wor6Z3rjKLhL2
 Twidj3FMOFJDlN43g/in2ikXjQo8WuW0AqC3nRnZ9OfrD9xn8oUMtfr19h62A7pbta5S
 hHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DX5LZ59j/U95L+mNk2w46JLq9y9MxosdgzOg6i0ZZ6E=;
 b=i/ycqoIn+PsNG+0i8KOyGrsbf8G/THYm9f/6Pw2Jr14Qc/zqTC3V95XLYW5pI55I23
 uOJ7R8/Y3j9UdpfNutAo8Nie+heZ6/HUwOh/6wKJ3pmyX8Uy7FyL757nQahCgU9QGj18
 Saide1Fs26+gW6BSNpOAhhMbUC/UnknJPYOAeF3ZMo4IKbrBluu/ocYligYl0Noxsm19
 1ddeap91YpytWMy5d3LlcJIirFoBN2JG1klrntTu/vfpHw/WpHyT0nMBYBmQUtGaG53I
 jxK/y8hqtfIYgDiKcQuECn8MdOx4qN16iZW6DEIimX/qln9vLzDLh2ndl9xYYJBUBQ1u
 XOPA==
X-Gm-Message-State: AOAM532dghwu8ZaPsSZ5ydgeZzPV/Eanh9Qy0Pl3dSD+4ej290cGa8wS
 cmXSljm8DPoyw7+nllSRv/u61b0o2eb8tY2xmjk=
X-Google-Smtp-Source: ABdhPJw0QDyylvjNLg3lab3rvIBcqi4+H2nhMuvkGY8U8GQq5XqOtT75RF0uJDw4uQ0NCdsuXqZO/VBBrP1e7C1e4Yk=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr1011124oie.120.1622087375887; 
 Wed, 26 May 2021 20:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-3-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-3-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:49:25 -0400
Message-ID: <CADnq5_OFMz2tCCCwXbQ-sj+zOyp2GGNLDCkVADXaRo=GJ1wOTg@mail.gmail.com>
Subject: Re: [PATCH 02/34] drm/amd/pm/swsmu/smu13/aldebaran_ppt: Remove unused
 variable 'ret'
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should be checked.  Will send out a patch momentarily.

Thanks,

Alex

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.c: In functio=
n =E2=80=98aldebaran_is_dpm_running=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.c:1260:6: war=
ning: variable =E2=80=98ret=E2=80=99 set but not used [-Wunused-but-set-var=
iable]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index d6ce665baaf3b..d077e211017a9 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -1368,10 +1368,9 @@ static int aldebaran_usr_edit_dpm_table(struct smu=
_context *smu, enum PP_OD_DPM_
>
>  static bool aldebaran_is_dpm_running(struct smu_context *smu)
>  {
> -       int ret =3D 0;
>         uint32_t feature_mask[2];
>         unsigned long feature_enabled;
> -       ret =3D smu_cmn_get_enabled_mask(smu, feature_mask, 2);
> +       smu_cmn_get_enabled_mask(smu, feature_mask, 2);
>         feature_enabled =3D (unsigned long)((uint64_t)feature_mask[0] |
>                                           ((uint64_t)feature_mask[1] << 3=
2));
>         return !!(feature_enabled & SMC_DPM_FEATURE);
> --
> 2.31.1
>
