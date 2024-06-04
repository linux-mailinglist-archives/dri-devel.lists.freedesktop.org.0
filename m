Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D578FB903
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF9B10E54E;
	Tue,  4 Jun 2024 16:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GRABUMlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9744F10E54E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 16:31:52 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-62a0849f8e5so13133787b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717518711; x=1718123511; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9DPwzzySNOh5jKdiFXhLh5D+q0fux/GGS8qouK+GFc=;
 b=GRABUMlg69IyNBPEnd/qsNlpykbczX1GA5puRARwaQS+4RzHN6Cr3IGHHXP0lViLrI
 1a47xyIZlbr5inHBsAUkUeAyzH7KUdrTNlM0fvqIGcAPP9tjA7Pb6m5RRULgWIgpJQbL
 rh3K/ebXlhk5cTiCNCM9QgZP7Wb2ZntBwryMFhpuUQWputGYAajtKYM5rMzVn8z2+pNm
 fpemveogC/P0iayqvDOgQT6wQUJ+O46AUWVMCdW6Eq2KWw8J+jgSLyGWaa0hZkDhoLdR
 gScQSKUdK+KofqpCp7on5XBU/hhsuayQ8ZzNZwfrFJ6smx+Fhy8gzD17rMTzwvvLq3OR
 ZABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717518711; x=1718123511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z9DPwzzySNOh5jKdiFXhLh5D+q0fux/GGS8qouK+GFc=;
 b=hqh70H4NtFgDUkVP/XEy/Bl1jnYJJmdFmiCeEx7zIfSlLhaxxHPaGQ54BAWhJ5+Kwb
 HSeuMCke5Kg6ol8O5hZ7ae+kqz9kFJ89X7wExlfKk08hfSUnAIaBfhDM01WDEhHUzFT5
 lD201S+0/ujndoyemMsajRf6tCCJRgt2En4mGopiu7yeNhLYxSB2YyLqm39ByUN0mgla
 2czlqZo6Vw1By9906eRnHTw7gfeAOCXeATbjztpO4ET0ix9YNyCUOHSLwmw4QmouXjEH
 ym0heQecutf/QsdYUqqqle8+Weqhf/QJ5iCY0DQKfD54THCcEu8hfR4DGQCJYXvv3GDA
 OBMw==
X-Gm-Message-State: AOJu0YyMBqUHfMukTlgw3CYnEQiyl7lKO4BlPw2G1PNfggwvS/nu0+nf
 /Ov9VlYMDIoE5M7CJOTzHyOoSKKhT4QyRo45TWXUNNGlEzZZoROzX79uGN6xMye3MSp93P8gHyI
 V1j43gfik/qJMgDqqIU459poOcW6/gszG2wSe4tdOvtQtbPB8
X-Google-Smtp-Source: AGHT+IG9nfkGErWgX+Z7kHFPw4NIX7CtJVxIwkdUh4P9tSgvXArctZcIqdy++fD/2bNlzKiw1xHKgyYr+lpeKljr+WU=
X-Received: by 2002:a25:d6d4:0:b0:df7:a75c:28e0 with SMTP id
 3f1490d57ef6-dfa73c40be0mr11980521276.36.1717518711395; Tue, 04 Jun 2024
 09:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240604154846.500357-1-robdclark@gmail.com>
In-Reply-To: <20240604154846.500357-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jun 2024 19:31:40 +0300
Message-ID: <CAA8EJpooN4gJMfBPam+iVS6rbYWgdk835UB4ruDBxLryHoOy5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Print SQE fw version
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 4 Jun 2024 at 18:48, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add the SQE fw version to dmesg and devcoredump.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 32 +++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 ++
>  3 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 56bfb228808d..5a2a005003c8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -665,6 +665,32 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
>         return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
>  }
>
> +static uint32_t get_ucode_version(const uint32_t *data)
> +{
> +       uint32_t version;
> +
> +       /* NOTE: compared to kgsl, we've already stripped off the first dword: */
> +       version = data[0];
> +
> +       if ((version & 0xf) != 0xa)
> +               return version;
> +
> +       version &= ~0xfff;
> +       return  version | ((data[2] & 0xfff000) >> 12);
> +}
> +
> +uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu)
> +{
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       uint32_t *buf = msm_gem_get_vaddr(a6xx_gpu->sqe_bo);
> +       uint32_t version = get_ucode_version(buf);
> +
> +       msm_gem_put_vaddr(a6xx_gpu->sqe_bo);

Wouldn't it be easier to save the SQE version when the firmware is
loaded and then just return it?
Or the point is about reading the SQE version at runtime?

> +
> +       return version;
> +}
> +
>  /*
>   * Check that the microcode version is new enough to include several key
>   * security fixes. Return true if the ucode is safe.
> @@ -681,6 +707,8 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>         if (IS_ERR(buf))
>                 return false;
>
> +       DRM_DEV_INFO(&gpu->pdev->dev, "Have SQE version %03x\n", get_ucode_version(buf));

I'd suggest drm_dbg_driver() instead. I think the motto is to keep the
kernel more or less quiet.

> +
>         /* A7xx is safe! */
>         if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
>                 return true;
> @@ -714,7 +742,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>                 }
>
>                 DRM_DEV_ERROR(&gpu->pdev->dev,
> -                       "a630 SQE ucode is too old. Have version %x need at least %x\n",
> +                       "a630 SQE ucode is too old. Have version %03x need at least %03x\n",
>                         buf[0] & 0xfff, 0x190);
>         } else if (!strcmp(sqe_name, "a650_sqe.fw")) {
>                 if ((buf[0] & 0xfff) >= 0x095) {
> @@ -723,7 +751,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>                 }
>
>                 DRM_DEV_ERROR(&gpu->pdev->dev,
> -                       "a650 SQE ucode is too old. Have version %x need at least %x\n",
> +                       "a650 SQE ucode is too old. Have version %03x need at least %03x\n",
>                         buf[0] & 0xfff, 0x095);
>         } else if (!strcmp(sqe_name, "a660_sqe.fw")) {
>                 ret = true;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 1c3cc6df70fe..c206dab8bc08 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -109,6 +109,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>                        bool suspended);
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
>
> +uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu);
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>                 struct drm_printer *p);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 0a7717a4fc2f..1acfe39eb8e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1957,6 +1957,8 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>
>         adreno_show(gpu, state, p);
>
> +       drm_printf(p, "sqe-version: 0x%08x\n", a6xx_get_sqe_version(gpu));
> +
>         drm_puts(p, "gmu-log:\n");
>         if (a6xx_state->gmu_log) {
>                 struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
> --
> 2.45.1
>


-- 
With best wishes
Dmitry
