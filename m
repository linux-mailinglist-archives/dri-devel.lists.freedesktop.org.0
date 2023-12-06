Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A36806A74
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916A210E6AA;
	Wed,  6 Dec 2023 09:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787F510E6CE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:11:56 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-db8892a5f96so3762596276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 01:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701853915; x=1702458715; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YqJKf6k3LqdMOajnfjgr4qlTOkc+4XpnvbfWlmqLEqw=;
 b=P5Tfrez/bgV2GrAU89BDcNtgVqnyVZL+l//oRKtwg1tPDlbeQpqDp96smt3jCPfP8E
 3hw8k8BNq4kSS9ACLA0X/jeuWeI6Et6CY25dlEJTEn7+B23Yf8un3GU4HdGUvsoSHCKh
 HOubNtMp2JerehjogoR4hPSwrSILTNOshnMcoVF28wNCReXYcUmOVEIuCd60YYaVXotf
 uirGitR+NpDKol0lPUTI0pkUfBJVa3Vnxcdmr6d01rkn9dQtQ8IiYmHMmu4TmIhSyK+m
 MmGODCXYLoQU/mQo+ziR/GxtZfIO5SFLRFi99orEKXziyZXHCU33ditOujS6ILcAL7qV
 Zx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701853915; x=1702458715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YqJKf6k3LqdMOajnfjgr4qlTOkc+4XpnvbfWlmqLEqw=;
 b=gz4amxCsXlmPEDpi49/YRl7TTzbs9SrtDXHOpxoMomVAndmaZ5uFld7p/euCRW6gcl
 DeqMfR9Qm0+YjyJ/T+gVjet44qGT1csYdRtHqrzxaxTYJeWVBbRJ3u3TzImcbxISGh5u
 qb9J04di4h/wdWzbbR/UDtWPUDpb+Y7JB5Mrw+BxLb9QbebMyc0FQ55aLo4CPEpAgWsF
 LVLfaGfmaiqOgLyCdK4DiI9/j0tfD9rlrhmHoNPfn/Z1LCV2/gzpQuBNZ5/PUwMqx0c9
 cQ+LyiaYeMlTGEglm1lGWqo8kFCG4F92aFomKdtvx2p7tkLOlQXBlVuBUJgtvbjACrEi
 gvfw==
X-Gm-Message-State: AOJu0YxlPTHrkMYlSE5ipW41MITtxqewOk9lxq/HL7AXlbyacxexi4Em
 dKiEKEprDF1VZaIGqVlhP8lMY6w5vDkxBkMXbUrtAQ==
X-Google-Smtp-Source: AGHT+IEa3a5UoBcKWU2a9NslT+MOBgjSAC1zjicINvB9Ra2bERFvGcDVtQBsO6xLpYDOkNYNwp2dm8OphFFSIX5tAN0=
X-Received: by 2002:a25:3497:0:b0:db7:dacf:622a with SMTP id
 b145-20020a253497000000b00db7dacf622amr375926yba.124.1701853915593; Wed, 06
 Dec 2023 01:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-3-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:11:44 +0200
Message-ID: <CAA8EJppNjBCx2NDe4zS_41hEUBiiXcuG63frJ7E67A5M9-FSzg@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/adreno: Split catalog into separate files
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 at 00:06, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Split each gen's gpu table into it's own file.  Only code-motion, no
> functional change.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/Makefile               |   5 +
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |  53 ++
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  75 +++
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |  51 ++
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  | 145 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 285 +++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 570 +--------------------
>  7 files changed, 620 insertions(+), 564 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 49671364fdcf..32f2fd980452 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -7,12 +7,17 @@ ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
>  msm-y := \
>         adreno/adreno_device.o \
>         adreno/adreno_gpu.o \
> +       adreno/a2xx_catalog.o \
>         adreno/a2xx_gpu.o \
> +       adreno/a3xx_catalog.o \
>         adreno/a3xx_gpu.o \
> +       adreno/a4xx_catalog.o \
>         adreno/a4xx_gpu.o \
> +       adreno/a5xx_catalog.o \
>         adreno/a5xx_gpu.o \
>         adreno/a5xx_power.o \
>         adreno/a5xx_preempt.o \
> +       adreno/a6xx_catalog.o \
>         adreno/a6xx_gpu.o \
>         adreno/a6xx_gmu.o \
>         adreno/a6xx_hfi.o \
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> new file mode 100644
> index 000000000000..1a4d182279fc
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2013-2014 Red Hat
> + * Author: Rob Clark <robdclark@gmail.com>
> + *
> + * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> + */
> +
> +#include "adreno_gpu.h"
> +
> +const struct adreno_info a2xx_gpus[] = {
> +       {
> +               .chip_ids = ADRENO_CHIP_IDS(0x02000000),
> +               .family = ADRENO_2XX_GEN1,
> +               .revn  = 200,
> +               .fw = {
> +                       [ADRENO_FW_PM4] = "yamato_pm4.fw",
> +                       [ADRENO_FW_PFP] = "yamato_pfp.fw",
> +               },
> +               .gmem  = SZ_256K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init  = a2xx_gpu_init,
> +       }, { /* a200 on i.mx51 has only 128kib gmem */
> +               .chip_ids = ADRENO_CHIP_IDS(0x02000001),
> +               .family = ADRENO_2XX_GEN1,
> +               .revn  = 201,
> +               .fw = {
> +                       [ADRENO_FW_PM4] = "yamato_pm4.fw",
> +                       [ADRENO_FW_PFP] = "yamato_pfp.fw",
> +               },
> +               .gmem  = SZ_128K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init  = a2xx_gpu_init,
> +       }, {
> +               .chip_ids = ADRENO_CHIP_IDS(0x02020000),
> +               .family = ADRENO_2XX_GEN2,
> +               .revn  = 220,
> +               .fw = {
> +                       [ADRENO_FW_PM4] = "leia_pm4_470.fw",
> +                       [ADRENO_FW_PFP] = "leia_pfp_470.fw",
> +               },
> +               .gmem  = SZ_512K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init  = a2xx_gpu_init,
> +       }, {
> +               /* sentinal */
> +       }
> +};
> +
> +MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> +MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> +MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> +MODULE_FIRMWARE("qcom/yamato_pm4.fw");
> \ No newline at end of file

Nit: you might want to fix newlines (here and in other catalog files).



-- 
With best wishes
Dmitry
