Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2B95503A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 19:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D795110E811;
	Fri, 16 Aug 2024 17:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RZPvsO7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B44010E811;
 Fri, 16 Aug 2024 17:48:04 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f189a2a841so22020281fa.3; 
 Fri, 16 Aug 2024 10:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723830482; x=1724435282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=riGddCBVcMqSZhpZl90A7CFiqL1QqGXrr5oPhf+7eSE=;
 b=RZPvsO7E5eRx14GBLvCrTN8SGEB6yNopKtYQzWzeKcTJNKKoh1hWD2ZhoA+1jp1NDn
 XYsbQzIeb3y3Ld+8DRZNSj2Riuxb3lc+A41O5vBOP9jBfJxK1sNPf0f58fo9kdYbjxZ2
 evUV5h/RCM/SyFjQONsR7JZoQe0kWFjXQSNpCgrWjTG2myTlTpfcgU7F8x+opnyEIclq
 F105cjZYD1WZhnLP5MnTEsps2yUsAkY2SS2xYfHVCd2epCwIpe9s2i5XHR4lt/jiWrWd
 Doz/K3uns3dfcjyVhAw/PJRBOPmUEU8A/IL9uFZd0gGN25ULWTNVNhkPkIOTC8JMRWeQ
 QF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723830482; x=1724435282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=riGddCBVcMqSZhpZl90A7CFiqL1QqGXrr5oPhf+7eSE=;
 b=ZQXvcu2Z2RYXhs50SeM3bMV1yOrKuqwySwha/m6Tmus9wquxr9E/8nT7RmXJ7wOChq
 wofJ7c+ZES/W62FVCEpftIBoXbc37CUcjKRM4aeFY0gt2l7L71fUI+mD2YPaGesRItmY
 uuw2pU6Rv/gIqNau1EnmUbXFRZ3Ftjetn2wCovlXQXD2mntK9HoJ6yaCfXhplfKs6e2z
 erEW/BAyW9sLLgmpD0l6dw9OAz7BAKlZue+DONli30g3kQsJd8rTBZtSDxOW+OWp1g/g
 30KhrblouxUZ4ZiuZBmF4hNPLyPo3rRmIK5ePl9ojo5FZ8vlze855g4PwntQkU9TkRmk
 6AEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJW8mn7SGodSle05A3x3CDntEzecK4yv3M30thVBqv+9TevznC1EGDuwKWdgItB3PoU39zipvYQNTJjYj4ZLn/olLwTsgnezaMRRQqJFQV9m5BQqR3bE8I/Fy4Bx6jiXHYMjqs4w29P4CR/ifrEa3a
X-Gm-Message-State: AOJu0YyC9sGKW02HzVrTX+C3nGikI6nH8kRK+fimOjPJ6Pz2sdQbOUsQ
 yrDbjXkc9fXfif93Z7Uu9uv+uNC+FajJ7g1kOzkoC9Y0sQbc8eDZaksyOjqHfpe10oZlkuK9G0t
 /wUJa6zNbkl0W6UATufaI8Rn8UlY=
X-Google-Smtp-Source: AGHT+IHZcHSyJ6Txw10o7YcCIzKf1ZlMMY3wB8pM2a/ajfH8agQCa9ezf0fW4JTyRoX4ydmf7qdRDClG5I7cxWTXrmY=
X-Received: by 2002:a2e:9084:0:b0:2ef:2d58:ec24 with SMTP id
 38308e7fff4ca-2f3be5899a2mr23608561fa.17.1723830481402; Fri, 16 Aug 2024
 10:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 16 Aug 2024 10:47:48 -0700
Message-ID: <CAF6AEGsiu2OBbwQJO5nS55CAQtCvKebc59-mu2h0BDiu4C2gxg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Preemption support for A7XX
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
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>
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

On Thu, Aug 15, 2024 at 11:27=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This series implements preemption for A7XX targets, which allows the GPU =
to
> switch to an higher priority ring when work is pushed to it, reducing lat=
ency
> for high priority submissions.
>
> This series enables L1 preemption with skip_save_restore which requires
> the following userspace patches to function:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>
> A flag is added to `msm_gem_submit` to only allow submissions from compat=
ible
> userspace to be preempted, therefore maintaining compatibility.

I guess this last para is from an earlier iteration of this series?
Looks like instead you are making this a submitqueue flag (which is an
approach that I prefer)

BR,
-R

> Some commits from this series are based on a previous series to enable
> preemption on A6XX targets:
>
> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeau=
rora.org
>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
> Antonino Maniscalco (7):
>       drm/msm: Fix bv_fence being used as bv_rptr
>       drm/msm: Add submitqueue setup and close
>       drm/msm: Add a `preempt_record_size` field
>       drm/msm/A6xx: Implement preemption for A7XX targets
>       drm/msm/A6xx: Add traces for preemption
>       drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>       drm/msm/A6xx: Enable preemption for A7xx targets
>
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
>  drivers/gpu/drm/msm/msm_gpu.h             |   7 +
>  drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
>  drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
>  include/uapi/drm/msm_drm.h                |   5 +-
>  11 files changed, 995 insertions(+), 16 deletions(-)
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240815-preemption-a750-t-fcee9a844b39
>
> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>
