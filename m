Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84B744BC2
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 01:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B0210E138;
	Sat,  1 Jul 2023 23:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF4710E12B;
 Sat,  1 Jul 2023 23:20:02 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a0457d6b77so2597350b6e.0; 
 Sat, 01 Jul 2023 16:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688253600; x=1690845600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/U4nCYPZGwhHedBfQbYSZ1VOIvKM6vipFPVBHMLBTIY=;
 b=poGo4n5K7Ll707tJbnzNyzvv6nBaMVpMHwV2FJJFju50QINAFGnN14Z99tZDJe/VCG
 T4MrZRgvCuAf2Cz3HAVTSLJSc2DPyP8yd3MSiSqmMQiOpoEiN3B6OWAe85MoP94UaxJC
 4THp4KEzVheCugMUDUzBPMosy+X9DYopknzf3ZBgEH9vA3w7mJeDXNUCN6bemD0A7/4q
 EDXOwgwxq/2qivQXHkvsLlbzPTS4c0VdFSCp/cQEp3Kf1xnwqzqnIPcd07/cNLIoXaAz
 mF07cb1VMCcya/uudG6u0AwnlgiiMhY9uuFGRoOjbAXIhYYSz8tzWyaAfzVvUB20Ipll
 eCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688253600; x=1690845600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/U4nCYPZGwhHedBfQbYSZ1VOIvKM6vipFPVBHMLBTIY=;
 b=OOUv6NzzUOzOxsG4DVyA4wvmn/WFfxyxoY+YpkFnKggqjExLhSHVFdUHretICcSTZR
 tG/pJgYKowBUM+XlUF9HtR77WWgRQhmCaxoIfzvhKp3oyGXAzn4tRyECjeevEm/30TnV
 YWpatveSj4IWf+WLnjEui4O2ej+MxvOQF3PEj4Mi5W7OAV/ZL5KKf7yFJthKqFXamOJ1
 XeV1m6M1nbeZi1g2d5DWjOJIctPMSU4jWSltgcWMWO6hiS3sabBu9LyiF59pxoToc/ya
 SrCxw918jKZ8LWyJDve2qoLTSNCygGg9TP3F08HRyjVGlT8HPGAB2oPpQvqdMsnQ5DuS
 A9KA==
X-Gm-Message-State: AC+VfDzjSqBGq32Yi6z2gWZfOyitnT0a1cyAQ5pBUCPPCacSag03MvOl
 dvnO660WZK+9SZVdRf2xdZFWkBrjUhGRNgpLSZ0BlBVP
X-Google-Smtp-Source: ACHHUZ6IB+dypPXjHA/PRYXvNUNp1HS78Y1yit4MrVLElrZVn3Iykbt4QXWx1TrXr59EwRkCqxVKcA7PjGPySdNI8YM=
X-Received: by 2002:a05:6808:1a25:b0:3a3:6360:ffbe with SMTP id
 bk37-20020a0568081a2500b003a36360ffbemr7296054oib.24.1688253600151; Sat, 01
 Jul 2023 16:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230701171501.3701-1-robdclark@gmail.com>
In-Reply-To: <20230701171501.3701-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 1 Jul 2023 16:19:48 -0700
Message-ID: <CAF6AEGtT+b9u2ag_+8_a72mJ7ALtEmd6_EifGEH3hWE3SgGrmg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: warn if GPU revision is not known yet
To: dri-devel@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 1, 2023 at 10:15=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
> to prevent such bugs from happening again. A separate helper is
> necessary so that the warning is displayed really just once instead of
> being displayed for each of comparisons.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 70 +++++++++++++++----------
>  1 file changed, 42 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 506001080374..eb31c83582e6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -145,143 +145,155 @@ struct adreno_platform_config {
>
>  bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>
> +static inline const struct adreno_info
> +gpu_info(struct adreno_gpu *gpu)
> +{
> +       if (WARN_ON_ONCE(!gpu->info))
> +               return (struct adreno_info) {};
> +       return *gpu->info;
> +}
> +
>  static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
>  {
> -       return (gpu->revn < 300);
> +       return (gpu_info(gpu).revn < 300);
>  }
>
>  static inline bool adreno_is_a20x(struct adreno_gpu *gpu)
>  {
> -       return (gpu->revn < 210);
> +       return (gpu_info(gpu).revn < 210);
>  }
>
>  static inline bool adreno_is_a225(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 225;
> +       return gpu_info(gpu).revn =3D=3D 225;
>  }
>
>  static inline bool adreno_is_a305(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 305;
> +       return gpu_info(gpu).revn =3D=3D 305;
>  }
>
>  static inline bool adreno_is_a306(struct adreno_gpu *gpu)
>  {
>         /* yes, 307, because a305c is 306 */
> -       return gpu->revn =3D=3D 307;
> +       return gpu_info(gpu).revn =3D=3D 307;
>  }
>
>  static inline bool adreno_is_a320(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 320;
> +       return gpu_info(gpu).revn =3D=3D 320;
>  }
>
>  static inline bool adreno_is_a330(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 330;
> +       return gpu_info(gpu).revn =3D=3D 330;
>  }
>
>  static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
>  {
> -       return adreno_is_a330(gpu) && (gpu->rev.patchid > 0);
> +       return adreno_is_a330(gpu) && (gpu_info(gpu).rev.patchid > 0);

This still isn't quite right, because adreno_info::rev has wildcards..
but I think the basic idea of checking that gpu->info is already set
is what we want..

I'll might punt on this until a bigger re-work of device
identification, since at least for now the root issue is solved

BR,
-R

>  }
>
>  static inline int adreno_is_a405(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 405;
> +       return gpu_info(gpu).revn =3D=3D 405;
>  }
>
>  static inline int adreno_is_a420(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 420;
> +       return gpu_info(gpu).revn =3D=3D 420;
>  }
>
>  static inline int adreno_is_a430(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 430;
> +       return gpu_info(gpu).revn =3D=3D 430;
>  }
>
>  static inline int adreno_is_a506(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 506;
> +       return gpu_info(gpu).revn =3D=3D 506;
>  }
>
>  static inline int adreno_is_a508(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 508;
> +       return gpu_info(gpu).revn =3D=3D 508;
>  }
>
>  static inline int adreno_is_a509(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 509;
> +       return gpu_info(gpu).revn =3D=3D 509;
>  }
>
>  static inline int adreno_is_a510(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 510;
> +       return gpu_info(gpu).revn =3D=3D 510;
>  }
>
>  static inline int adreno_is_a512(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 512;
> +       return gpu_info(gpu).revn =3D=3D 512;
>  }
>
>  static inline int adreno_is_a530(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 530;
> +       return gpu_info(gpu).revn =3D=3D 530;
>  }
>
>  static inline int adreno_is_a540(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 540;
> +       return gpu_info(gpu).revn =3D=3D 540;
>  }
>
>  static inline int adreno_is_a618(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 618;
> +       return gpu_info(gpu).revn =3D=3D 618;
>  }
>
>  static inline int adreno_is_a619(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 619;
> +       return gpu_info(gpu).revn =3D=3D 619;
>  }
>
>  static inline int adreno_is_a630(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 630;
> +       return gpu_info(gpu).revn =3D=3D 630;
>  }
>
>  static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
>  {
> -       return (gpu->revn =3D=3D 640) || (gpu->revn =3D=3D 680);
> +       return (gpu_info(gpu).revn =3D=3D 640) ||
> +               (gpu_info(gpu).revn =3D=3D 680);
>  }
>
>  static inline int adreno_is_a650(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 650;
> +       return gpu_info(gpu).revn =3D=3D 650;
>  }
>
>  static inline int adreno_is_7c3(struct adreno_gpu *gpu)
>  {
>         /* The order of args is important here to handle ANY_ID correctly=
 */
> -       return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
> +       return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu_info(gpu).=
rev);
>  }
>
>  static inline int adreno_is_a660(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 660;
> +       return gpu_info(gpu).revn =3D=3D 660;
>  }
>
>  static inline int adreno_is_a690(struct adreno_gpu *gpu)
>  {
>         /* The order of args is important here to handle ANY_ID correctly=
 */
> -       return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
> +       return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu_info(gpu).=
rev);
>  };
>
>  /* check for a615, a616, a618, a619 or any derivatives */
>  static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 615 || gpu->revn =3D=3D 616 || gpu->revn =
=3D=3D 618 || gpu->revn =3D=3D 619;
> +       return gpu_info(gpu).revn =3D=3D 615 ||
> +               gpu_info(gpu).revn =3D=3D 616 ||
> +               gpu_info(gpu).revn =3D=3D 618 ||
> +               gpu_info(gpu).revn =3D=3D 619;
>  }
>
>  static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
> @@ -292,7 +304,9 @@ static inline int adreno_is_a660_family(struct adreno=
_gpu *gpu)
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 650 || gpu->revn =3D=3D 620  || adreno_is=
_a660_family(gpu);
> +       return gpu_info(gpu).revn =3D=3D 650 ||
> +               gpu_info(gpu).revn =3D=3D 620 ||
> +               adreno_is_a660_family(gpu);
>  }
>
>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);
> --
> 2.41.0
>
