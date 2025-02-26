Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F16A46AE4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 20:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E057010E9CD;
	Wed, 26 Feb 2025 19:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="avTup97L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE3410E9BC;
 Wed, 26 Feb 2025 19:22:26 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2fe9fd5e7f8so45981a91.3; 
 Wed, 26 Feb 2025 11:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740597746; x=1741202546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1y7AKbsdNld8g2hpFglN8JrmjtPrHU1b2vsuKh5wAQM=;
 b=avTup97LcJAa6U16nFc872JOeYbMFB7w39RKVkhp4VdqpUeRy5V21Hr/bfLmeiG918
 +uxhgCBKDdCTulKN4BpUF/Z1aWmP1k5fEiQlKal0sG9V1gr428uLgEtD4rkeEsFU6SIG
 x4RrWQ8gNDI9msmrPL13x38EStmiWUJGUFE747XJx28ck9VzmjRqsZKd6HVklYjvFcSQ
 I4/MnupUQ+H0tGCIZ8bpyRax9KbReJzCgBjRNXO0+k1quVCz5YEe1adxp8jays6jM/xq
 oBISEVLay24gFUMeg02suOOWakfzzMW74S0ByE5/xoZbtgn6GWjZ6h9zfpjSHooR8L6u
 laeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740597746; x=1741202546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1y7AKbsdNld8g2hpFglN8JrmjtPrHU1b2vsuKh5wAQM=;
 b=RFGgx4Prtmm/rbY7EnHP5UI5wKUilqA3mxd1eb0FpC808fstShI3UV90QunJgXOmxG
 Nt48/x65hhjo1I6WLO7vhnICBCKo4SsNpRJG8ZbDqhFmpIHNn41v+fVe7WUk1vAiEhcd
 G958oug+F+lvcYWOcCaankFBHgA7ncBqf0igbJg2lVTVwIhPsaABdBK6C0FDeidOnUze
 artJrW/q0zy/gl4DNpQ7+mIRsGexZ0Ee/SWxOAhaZ2/+xpdJkxZg9isIn1yLe7PkokaU
 xueZhy3QQhEXjuJHvCffgFr1UJiX+rVpVyD9QbsiwQ4nyu0sGfmRsLC7mGYvxhuoCHFg
 A5Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqdsuagOLuoycW6DRjvh3ppOPpTAQSb23GkHY/lH9FwWWZFg77Rh6K6PHNjrJSDsbLQbfywT/JTHqO@lists.freedesktop.org,
 AJvYcCXVhuJuQRC2kYjr4eBCOdzNYAf+c6WLouUdhO0O/2NuLPwsnI8ZKnZxBGCqZupCscMHjLi4UAXz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8AZ+lPydfQz2UZPsOjghS108EYTEHfOluiC6Rfr/dPBO20DWo
 B77D/RL9U5CuwCHVvvpSD4QiONA3wXZ53cw+n9nZJb21zyAJIwDJc9kdcUp3EfDGowZK/W4erBG
 99sLcQhN1rCvf8RRtWa35NBXoQCo=
X-Gm-Gg: ASbGnctrpqN0ynogIoOq0FXz7O14pvlzIyr3iu5M10pIJpM1DDk45kBHe10rpVQ6gbV
 Ifr7U7MaXXexwe0YjS7CNdeODXgy+pf2oml8BNIZbmiX4pXVL9lyaKIUavdiIjU+oKyniV56tLB
 0IcE8+G18=
X-Google-Smtp-Source: AGHT+IFXlPewfDjTcQd23uWt5JHmAkzRm8cSyjPkDV01jbpADxXVm68Lc0wOKp9OIqOnGomJpkNfOnYa2s2/BMzgZ+k=
X-Received: by 2002:a17:90b:4acb:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-2fe91d0f86bmr1193058a91.2.1740597746090; Wed, 26 Feb 2025
 11:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20250226131118.1012223-1-andrealmeid@igalia.com>
In-Reply-To: <20250226131118.1012223-1-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Feb 2025 14:22:13 -0500
X-Gm-Features: AQ5f1Jrj8uBp_Nld3i5VpcTJQMhPSbajAtBz4HQQ7cHskmCGLtzNlphUVbvrm-o
Message-ID: <CADnq5_MjDxqG9GzPShL0oucpCPx9J5HodMWRuaOAgs0s0CD0=A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Create a debug option to disable ring reset
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, siqueira@igalia.com
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

Applied.  Thanks!

On Wed, Feb 26, 2025 at 8:11=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Prior to the addition of ring reset, the debug option
> `debug_disable_soft_recovery` could be used to force a full device
> reset. Now that we have ring reset, create a debug option to disable
> them in amdgpu, forcing the driver to go with the full device
> reset path again when both options are combined.
>
> This option is useful for testing and debugging purposes when one wants
> to test the full reset from userspace.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 +++--
>  3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 69895fccb474..75dc4b962d64 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1186,6 +1186,7 @@ struct amdgpu_device {
>         bool                            debug_use_vram_fw_buf;
>         bool                            debug_enable_ras_aca;
>         bool                            debug_exp_resets;
> +       bool                            debug_disable_gpu_ring_reset;
>
>         bool                            enforce_isolation[MAX_XCP];
>         /* Added this mutex for cleaner shader isolation between GFX and =
compute processes */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 95a05b03f799..edeb12c816e8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -136,6 +136,7 @@ enum AMDGPU_DEBUG_MASK {
>         AMDGPU_DEBUG_USE_VRAM_FW_BUF =3D BIT(3),
>         AMDGPU_DEBUG_ENABLE_RAS_ACA =3D BIT(4),
>         AMDGPU_DEBUG_ENABLE_EXP_RESETS =3D BIT(5),
> +       AMDGPU_DEBUG_DISABLE_GPU_RING_RESET =3D BIT(6),
>  };
>
>  unsigned int amdgpu_vram_limit =3D UINT_MAX;
> @@ -2221,6 +2222,11 @@ static void amdgpu_init_debug_options(struct amdgp=
u_device *adev)
>                 pr_info("debug: enable experimental reset features\n");
>                 adev->debug_exp_resets =3D true;
>         }
> +
> +       if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_GPU_RING_RESET) {
> +               pr_info("debug: ring reset disabled\n");
> +               adev->debug_disable_gpu_ring_reset =3D true;
> +       }
>  }
>
>  static unsigned long amdgpu_fix_asic_type(struct pci_dev *pdev, unsigned=
 long flags)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index 7b79b0f39ba1..8ab23182127e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -137,8 +137,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(st=
ruct drm_sched_job *s_job)
>         dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>
>         /* attempt a per ring reset */
> -       if (amdgpu_gpu_recovery &&
> -           ring->funcs->reset) {
> +       if (unlikely(adev->debug_disable_gpu_ring_reset)) {
> +               dev_err(adev->dev, "Ring reset disabled by debug mask\n")=
;
> +       } else if (amdgpu_gpu_recovery && ring->funcs->reset) {
>                 dev_err(adev->dev, "Starting %s ring reset\n", s_job->sch=
ed->name);
>                 /* stop the scheduler, but don't mess with the
>                  * bad job yet because if ring reset fails
> --
> 2.48.1
>
