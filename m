Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DDD9668DC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 20:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE77210E029;
	Fri, 30 Aug 2024 18:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ga6V1Z/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B7110E029;
 Fri, 30 Aug 2024 18:24:14 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-45680233930so12296881cf.3; 
 Fri, 30 Aug 2024 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725042253; x=1725647053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KPZxBSRso5pE3AEFn4SdS9B50SQjBiwX3ZtiCsZD6C0=;
 b=Ga6V1Z/P35UQQlngNqTT75iKf1Fe9XEYc1qpLq6LHIj7XtfEnGYbWwk0PRwsjJAZNN
 K3cYQdFO943L89RhvFSvf+JFx7cfrjAFTHr2i7x4Hx+1GBaE+G01Z11K/s5tPrvuAM5C
 KOPYqM7if8KVwRPraqyHpibjWKLSAipEzhMR912d+eYU8aI0x3TQYNxDkaW2wTEeFpVI
 zgYDdviqHnvlLPafKO8ah9G2q14pNrmbOZ/yCfLQ8OeqhiCCUZy087WqlU2xIKnvQizi
 iFGotju7kuXZVnryO5dTr8TdLu091uoVwGSPwDIKoOSIiPljoVJmla5Fc1yRFj+A2abG
 htQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725042253; x=1725647053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KPZxBSRso5pE3AEFn4SdS9B50SQjBiwX3ZtiCsZD6C0=;
 b=WroBLkHxZ67G25lgRBv0X98kem6eItiNEprKMJpxbqk+kT7+ENJU7aoE+sWikSdvIa
 94n3Q7+t9DoisQP2THf7tGsL2Hbw9b2huTZeKLfn4qDxN9+D/j5oZzhssuUYhm7Fp+ky
 DIiP0cs6WM+rTD1OKx7/J/obs4q5bRUjMahYK//Q18uDswzlC4eZNDCBYkjKU9c5NR30
 o7D5BMM2CGvZ35QJQsXyuFuPg5/abyBfceDou7b7J6cfJ+ZVKGryGikt4IlzKJm/78YI
 RU979FVdJajCZGp6+xMtSnh2V1xPnbB0DR+UTqjJ6uyATE8pTSxfnSl8SyA77kub4KSR
 v+tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTUqnKT7Wi0bCCVZansj5erqw5N8WhFy8D23L9kSJV+ElJVvv+VDP3Z8W0yY93xyP/6njVl/9pRXGT@lists.freedesktop.org,
 AJvYcCXR2Ei4NRp/v/KLKxnm8dgFGpASC6RTjtTXq+gsfvWBtuBd67ZwgnzIM2fmG68176QHaAiB9oB6PY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/Y2gdoX5J5QxxPIfrDpHjwB6lIII/A5e3fxZpCE0HAkgNYZzL
 ogwsJe71Iq9jlOhP8CR7jkcpep6oAVWwAx0z3zSgZHOXHjiRcinhccj1PR8W07z64u6aTl3uR/t
 AkXIgIYcoFGkAuwgEvKRL7lFJkC4=
X-Google-Smtp-Source: AGHT+IFfAZ5Dc/UAH0FAehnAcx0CC4YDuotMeeFeOIHs8OXYW9H+4ZEFhxkx/keeE+cv8gefPgcsT/Uchh3WnYFsJzo=
X-Received: by 2002:a05:622a:2590:b0:456:941c:f995 with SMTP id
 d75a77b69052e-456941cfb3dmr17682961cf.56.1725042252988; Fri, 30 Aug 2024
 11:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-9-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-9-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 11:23:58 -0700
Message-ID: <CAF6AEGui3bFqTqwhSCcx38=WzbaHKmnttjXiff-=GT0HHQyapw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] drm/msm/A6xx: Enable preemption for A750
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Initialize with 4 rings to enable preemption.
>
> For now only on A750 as other targets require testing.
>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index a2853309288b..ea518209c03d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2609,7 +2609,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *de=
v)
>                 return ERR_PTR(ret);
>         }
>
> -       if (is_a7xx)
> +       if (adreno_is_a750(adreno_gpu))
> +               ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 4);

perhaps it would be useful (to enable others to more easily test), to
allow this to be overridden with a modparam.. something like

       if ((enable_preemption =3D=3D 1) || (enable_preemption =3D=3D -1 &&
(config->info->quirks & ADRENO_QUIRK_PREEMPTION))

That would allow overriding enable_preemption to 1 or 0 on cmdline to
force enable/disable preemption.

That plus some instructions about how to test preemption (ie. what
deqp tests to run, or similar) would make it easier to "crowd source"
the testing (assuming you don't have every a7xx device there is)

BR,
-R

> +       else if (is_a7xx)
>                 ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 1);
>         else if (adreno_has_gmu_wrapper(adreno_gpu))
>                 ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmu=
wrapper, 1);
>
> --
> 2.46.0
>
