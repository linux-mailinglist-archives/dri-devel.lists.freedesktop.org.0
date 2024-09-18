Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3DA97BF49
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 18:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8D810E290;
	Wed, 18 Sep 2024 16:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GR6xi+CF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9163B10E0EE;
 Wed, 18 Sep 2024 16:51:15 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2058ba82fbfso3603395ad.0; 
 Wed, 18 Sep 2024 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726678275; x=1727283075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U++sEYJHjnPIVmGmCRlgjOlOobYwKPADlHrAK0bE/t4=;
 b=GR6xi+CFHtzPLRV2FolewINYjJ0LEXFRNs+s24CcIjJMIyuCnWaoAHxlpS521l4fga
 Np8cYqbkwXsPfLZ0Kp5r8DVcxQK1RCajDmZwPXfwAm+mnGn/ZhDCpnsDtW/CSw9GmAVt
 yUsJ7BIwNcEox1pbEC2BwBgAJWmlUhc1IXBPZTtMzfnLZWXE8O/TkrF6MTwwuUs0cDOW
 8Zx6LetbwIQIDMZO+61Q4J9zFCl2dq/2fK+pvZZ5/FfEQsQbXmDKdAYCvslBwRiZ2Isf
 fCS2viTDIKl6PXky+09nB+7lFlGuXzgwtn00i/PPN4IDiqFDitTHt1tiZblIz7abWM1D
 Ar8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726678275; x=1727283075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U++sEYJHjnPIVmGmCRlgjOlOobYwKPADlHrAK0bE/t4=;
 b=ExkbwNfPLUj8h1N4EREuzF4zwS1CDIQejWN0iOeeiQuQkGYh0AVjc8AJi8M+ktsSEm
 ytfv7bI2YHbvt98gGEeZLheGmnOqeDbnfq9z9aqNDuW4eMPXg/j4l//5caj5N4Ge5Y8F
 tbTKRODHQCLfHGba32Ywugl28X7AlWpHzinmrBQa5at3qkA2xFvqxwRVU37w9WP/idiE
 f8Lx1ccQUpeInlSCfjXQHoDyzMiX3RfsldP8MEaL3c5yy9F3LQHNQgmIg/eJARuuZE65
 U2b/PezQECfpgw+EsU3XVV7yhN5YWhuLn3v5XJI9oIrtY2kWpqDCVPNPYGRo7jVdpoKl
 qNxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSwTaX7WgBoz61LdmOtcA32YPMYINgwYv1zDVITLWAz72RXBEUFCVqT83ermZsaOAYIRYr5F6453Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx4yecT1LqQIgkEnGuJujSyy3IvYZ8ONMscL99VyfpUICmH8sw
 B6zZD0G9FC7FGe8PPZaOzpgKsVCc6JrCTvfyj8Um26Qxv3FXAzeBDcFwAYRV9nAn4qi+QEygx7M
 lhZxLHuTnawEmer+/aInwdKhycK4=
X-Google-Smtp-Source: AGHT+IFMOFfvcHxm8ZPKILxS27rcCm6QAstBImzELxxoc8hw0RZl9FJfxgCmoLdAvRasWzjIn9Etkup0MPREc3wSB20=
X-Received: by 2002:a17:902:c406:b0:207:457f:b8f6 with SMTP id
 d9443c01a7336-2076e318bf1mr145492845ad.2.1726678274938; Wed, 18 Sep 2024
 09:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240913195132.8282-1-robdclark@gmail.com>
In-Reply-To: <20240913195132.8282-1-robdclark@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 18 Sep 2024 17:51:03 +0100
Message-ID: <CACu1E7ECxJLH8+GqUuWH=+oM=N=fgkpBBqJ8ShrSwbdZmw+nZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Fri, Sep 13, 2024 at 8:51=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> devices (x1-85, possibly others), it seems to pass that barrier while
> there are still things in the event completion FIFO waiting to be
> written back to memory.
>
> Work around that by adding a fence wait before context switch.  The
> CP_EVENT_WRITE that writes the fence is the last write from a submit,
> so seeing this value hit memory is a reliable indication that it is
> safe to proceed with the context switch.
>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index bcaec86ac67a..ba5b35502e6d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -101,9 +101,10 @@ static void get_stats_counter(struct msm_ringbuffer =
*ring, u32 counter,
>  }
>
>  static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> -               struct msm_ringbuffer *ring, struct msm_file_private *ctx=
)
> +               struct msm_ringbuffer *ring, struct msm_gem_submit *submi=
t)
>  {
>         bool sysprof =3D refcount_read(&a6xx_gpu->base.base.sysprof_activ=
e) > 1;
> +       struct msm_file_private *ctx =3D submit->queue->ctx;
>         struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
>         phys_addr_t ttbr;
>         u32 asid;
> @@ -115,6 +116,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx=
_gpu,
>         if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
>                 return;
>
> +       /* Wait for previous submit to complete before continuing: */
> +       OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);

CP_WAIT_TIMESTAMP doesn't exist on a6xx, so this won't work there. I
don't know if the bug exists on a6xx, but I'd be inclined to say it
has always existed and we just never hit it because it requires some
very specific timing conditions. We can make it work on a6xx by using
CP_WAIT_REG_MEM and waiting for it to equal the exact value.

Connor

> +       OUT_RING(ring, 0);
> +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
> +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
> +       OUT_RING(ring, submit->seqno - 1);
> +
>         if (!sysprof) {
>                 if (!adreno_is_a7xx(adreno_gpu)) {
>                         /* Turn off protected mode to write to special re=
gisters */
> @@ -193,7 +201,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         struct msm_ringbuffer *ring =3D submit->ring;
>         unsigned int i, ibs =3D 0;
>
> -       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> +       a6xx_set_pagetable(a6xx_gpu, ring, submit);
>
>         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
>                 rbmemptr_stats(ring, index, cpcycles_start));
> @@ -283,7 +291,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>         OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_B=
R);
>
> -       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> +       a6xx_set_pagetable(a6xx_gpu, ring, submit);
>
>         get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
>                 rbmemptr_stats(ring, index, cpcycles_start));
> --
> 2.46.0
>
