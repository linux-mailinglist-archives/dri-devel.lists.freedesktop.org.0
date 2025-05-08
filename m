Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CACAB0310
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A101F10E962;
	Thu,  8 May 2025 18:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bdz2hXpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5532810E967;
 Thu,  8 May 2025 18:41:31 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3da73df6c4eso9042135ab.0; 
 Thu, 08 May 2025 11:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746729685; x=1747334485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIIIefdaY9sYKEAXeUQFab1kLTouIAql70z4Rrnnjfg=;
 b=bdz2hXpV5WK/fmWAes4phYo49k3qCy4M2CcHMRJx+5bPLmhcHoCZTTTYox6/jseRL0
 5KP+kCq78mgYL+c37xwDszaYS9Ilf+K+8swH9tucnfD/2hb/vdgLmVWfu/5YdJPTrO1B
 BrFt3V6sIRUgHVkWgDXXiXesVx6QpxH/wPqZbXmBIqbOyN7h2mayJ99BCSvHuiAzspy6
 ryC6uF71AYY0ihEXTouhELZ8hvEQtUKgkudND/uKQS/oISa0Irl10yc32H6VrC52rIFH
 lSeCGFOhgK4k+ICXPkUo2/G3jMYoWr8T6A7clRvH8Y3NIVguRVZSNAxjhqTEzwfDxFaW
 nUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746729685; x=1747334485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIIIefdaY9sYKEAXeUQFab1kLTouIAql70z4Rrnnjfg=;
 b=QqUf7nr5NtEcMxW4ozS9UhUGvaE0EuD2bIEGoiAvpE+pvfxcd4HFIzArXnu3CB0K17
 q0ZLGvS1UjIpy0XQUXfkEJA83m/ClROoMz/d0k9BQ8F9fOMw5I+E9rs47KgtVfT/IrNG
 zAm0rCF1mICSMZBOZSQwIGHaevGQLuxg2RSlpKFA8jXizMRtFGa2I7/mU/vZFbFGhtTi
 wZR82rypnlG+pyE8qihv9p0CTVaGlEpQ8XznmeYzTpVmO8bk0NuxypXpLH2kQM1/TDIz
 TtbEvoj1OJEesMAqpXuE5qyBYQACJGbHkH83yDvH+lSwHbjviSJJ+QpA5VM85zdNHGAw
 967g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfzvyaUHgMnupeVnd3+mcBg9r9v8HfSZtgYA1CT8601zQvQPkDhC/da2rISH7/ed4hp0SBfFG28Do=@lists.freedesktop.org,
 AJvYcCWvd0vE4RYK5k1VtOOkL7xG7tLbjpqURRSCOg0Y2q5tanZ9thn8DDPio8A2vTN6uhFMp+Aow6unZraS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzogz3JpmZU2bkaPZPC7LtP4V66v0bEyip0NrckHlmNSF8trzai
 BUisxSxEDFeP5CiGoxA5KTOI15vkI8hrG592koFBV5o3DEmR4ohCdxnT7EzMuXobD3zRyDEtzvH
 PUaP/a43w/Sw8YeWQ71D4A578O5s=
X-Gm-Gg: ASbGnct8pvQ0iAKpeRRktFDpDSJK0mFHHHWKxhRCWYLHy9/oy7rtfZZYcw01KTEK5N9
 2vN0GR04o6CU4mMLIvWNSEzzI3EuaBaJy5Yp9h1AWLMDXuu/xwD894Zr8t0uMIiQLr59b8D2TLE
 bPP7oJAQvGLannJM2RcLt9AZlTViMV8D/8UbaHNQRK/JoCSdqsayA=
X-Google-Smtp-Source: AGHT+IEnu1L6F7VfV0Ubjw5sm0H1uMFjC+BmvIneeK2e24BLLnOMQ238GCHU+ApH04ZY1S2AcpFqb+ZwprrQ5Xvp1Oc=
X-Received: by 2002:a05:6e02:1809:b0:3d8:19e8:e738 with SMTP id
 e9e14a558f8ab-3da7e20cfd3mr7774505ab.17.1746729684889; Thu, 08 May 2025
 11:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 8 May 2025 11:41:12 -0700
X-Gm-Features: ATxdqUGX42iaxTvC7pe_iBnJYk6Ho2xV2KhxTzfU1hlmmWDCQoDzombs5VYi5E8
Message-ID: <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

On Thu, May 8, 2025 at 11:13=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366=
cfbd22d5bcf4bc7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), prote=
ct->regs[i]);
>  }
>
> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  {
> +       /* Inherit the common config and make some necessary fixups */
> +       gpu->common_ubwc_cfg =3D qcom_ubwc_config_get_data();

This does look a bit funny given the devm_kzalloc() below.. I guess
just so that the ptr is never NULL?

BR,
-R

> +       if (IS_ERR(gpu->common_ubwc_cfg))
> +               return -EINVAL;
> +
>         gpu->ubwc_config.rgb565_predicator =3D 0;
>         gpu->ubwc_config.uavflagprd_inv =3D 0;
>         gpu->ubwc_config.min_acc_len =3D 0;
> @@ -663,6 +668,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
>                 gpu->ubwc_config.min_acc_len =3D 1;
>         }
> +
> +       return 0;
>  }
>
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> @@ -2540,7 +2547,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *d=
ev)
>                 msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>                                 a6xx_fault_handler);
>
> -       a6xx_calc_ubwc_config(adreno_gpu);
> +       ret =3D a6xx_calc_ubwc_config(adreno_gpu);
> +       if (ret) {
> +               a6xx_destroy(&(a6xx_gpu->base.base));
> +               return ERR_PTR(ret);
> +       }
> +
>         /* Set up the preemption specific bits and pieces for each ringbu=
ffer */
>         a6xx_preempt_init(gpu);
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 2348ffb35f7eb73a26da47881901d9111dca1ad9..b7f7eb8dcb272394dce8ed1e6=
8310a394c1734a9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1149,6 +1149,12 @@ int adreno_gpu_init(struct drm_device *drm, struct=
 platform_device *pdev,
>                 speedbin =3D 0xffff;
>         adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
>
> +       adreno_gpu->common_ubwc_cfg =3D devm_kzalloc(dev,
> +                                                  sizeof(*adreno_gpu->co=
mmon_ubwc_cfg),
> +                                                  GFP_KERNEL);
> +       if (!adreno_gpu->common_ubwc_cfg)
> +               return -ENOMEM;
> +
>         gpu_name =3D devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT=
,
>                         ADRENO_CHIPID_ARGS(config->chip_id));
>         if (!gpu_name)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index a8f4bf416e64fadbd1c61c991db13d539581e324..06be95d3efaee94e4107a484a=
d3132e0a6a9ea46 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -12,6 +12,8 @@
>  #include <linux/firmware.h>
>  #include <linux/iopoll.h>
>
> +#include <linux/soc/qcom/ubwc.h>
> +
>  #include "msm_gpu.h"
>
>  #include "adreno_common.xml.h"
> @@ -243,6 +245,7 @@ struct adreno_gpu {
>                  */
>                 u32 macrotile_mode;
>         } ubwc_config;
> +       const struct qcom_ubwc_cfg_data *common_ubwc_cfg;
>
>         /*
>          * Register offsets are different between some GPUs.
>
> --
> 2.49.0
>
