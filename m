Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56E3DB020
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 02:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE5F6EE9B;
	Fri, 30 Jul 2021 00:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BF86EE9B;
 Fri, 30 Jul 2021 00:04:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h14so8886043wrx.10;
 Thu, 29 Jul 2021 17:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6YU4gr4JLAH79FQY1Mi8gwnDKyTILc7bVIjh7qm7FDU=;
 b=MqG8qOYtjM2cKzT/ShaVzrAwzlCuFLRrG9X3Ym1zcT1I3XwKuyV7I7QnmCJtRCquoZ
 D2rBMuHhCA4GfNHrj14ywnxWaXGUl4EBnKvpkJLPocRDngL+/oTZP8kfOSAzaCOWpG2l
 dZVVrVLl9w+EHN9SEesB5+AtcBaPkK5lbRUuKbex2OU3HAU61FV58LOGh26UY4GMX+wX
 4IfJmWBtaSHUq4QAZGfkvZH6uvVFHOV0/2qFlEyzKd6FrQKq0taQMN95C8ZzXABMpq5O
 iy3/e3HJgYJ3GqpBh0ruc3Q8/menfLSHHvASzYPGaYz7F+Su/72GmJg/1MFmiEP4xujl
 mvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6YU4gr4JLAH79FQY1Mi8gwnDKyTILc7bVIjh7qm7FDU=;
 b=aeCdMkf0xbdoSYNjbHF5q+lFnCn07fQ4rcg//aOx6qT84QGpTuEOb60RCA76YwpbWJ
 sdHcUYM9GQJFOhAGE7CKo1xh6B1dK2ut4vLrnfMeQdabU141ij0NJFTMo/26+IDYk0pv
 rd8fat7eU28/wmpibD+pND4aE67odsDxWHKRYT8qs9kiPHiqwbZhCkIWZQmf7hntM+w0
 vdhlMemn1TDVVxmEERzyHyN6+/9ET2Vt2z6riDdAxMlNBcYcRsGVNt7pxYIVzDkESBKD
 1ImPVG1ktTfcfgvqd2RODRx6Dl6uXnMob1Cc/QD/sdfkNFVVfRNCL8EeKhyocRF9STkG
 XFig==
X-Gm-Message-State: AOAM5301Byw1+SaHha+OBHFa3mRgjoY/naoh1x3YEdvBiccN+rzTXZ4q
 S2xd9do9FXyOgBmyID/+mrcLiZFHT04+yy0FK64=
X-Google-Smtp-Source: ABdhPJzVxMoQelwSuCARcI4vG5jeNvmbeM2Fr3Veb5gPC48Ooi8AoPVU6Kz9wLmiX0dohW521AXMHnUwmH2evWHxWUw=
X-Received: by 2002:a5d:4348:: with SMTP id u8mr35748wrr.28.1627603461037;
 Thu, 29 Jul 2021 17:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210725032002.3961691-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210725032002.3961691-1-bjorn.andersson@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 17:08:30 -0700
Message-ID: <CAF6AEGvADHz7YmOZQTX8g+ZRG1rp7sk9wevgBQsknQytH+eFSA@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: Add 680 gpu to the adreno gpu list
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 8:21 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> This patch adds a Adreno 680 entry to the gpulist.

Looks reasonable, but I wonder if we should just go ahead and add
adreno_is_a640_family() in a similar vein to
adreno_is_a650_familiy()/adreno_is_a660_family().. I think most of the
'if (a640) ...' should also apply to a680?

BR,
-R

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  5 +++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 12 +++++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>  5 files changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b349692219b7..1c0d75e1189f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -521,7 +521,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>
>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>                 pdc_in_aop = true;
> -       else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
> +       else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu) ||
> +                adreno_is_a680(adreno_gpu))
>                 pdc_address_offset = 0x30090;
>         else
>                 pdc_address_offset = 0x30080;
> @@ -1522,7 +1523,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>                         SZ_16M - SZ_16K, 0x04000);
>                 if (ret)
>                         goto err_memory;
> -       } else if (adreno_is_a640(adreno_gpu)) {
> +       } else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
>                 ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
>                         SZ_256K - SZ_16K, 0x04000);
>                 if (ret)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 9c5e4618aa0a..5cdafc6c8bb0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -683,7 +683,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>         if (adreno_is_a618(adreno_gpu))
>                 return;
>
> -       if (adreno_is_a640(adreno_gpu))
> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
>                 amsbc = 1;
>
>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
> @@ -757,7 +757,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>          * a660 targets have all the critical security fixes from the start
>          */
>         if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
> -               adreno_is_a640(adreno_gpu)) {
> +           adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
>                 /*
>                  * If the lowest nibble is 0xa that is an indication that this
>                  * microcode has been patched. The actual version is in dword
> @@ -897,7 +897,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         a6xx_set_hwcg(gpu, true);
>
>         /* VBIF/GBIF start*/
> -       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
> +           adreno_is_a680(adreno_gpu)) {
>                 gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
>                 gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
>                 gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
> @@ -935,7 +936,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
>         gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
>
> -       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu))
> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
> +           adreno_is_a680(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
>         else
>                 gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
> @@ -952,7 +954,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         */
>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
> -       else if (adreno_is_a640(adreno_gpu))
> +       else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
>         else
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 919433732b43..df8af237cf6a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -428,7 +428,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>
>         if (adreno_is_a618(adreno_gpu))
>                 a618_build_bw_table(&msg);
> -       else if (adreno_is_a640(adreno_gpu))
> +       else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
>                 a640_build_bw_table(&msg);
>         else if (adreno_is_a650(adreno_gpu))
>                 a650_build_bw_table(&msg);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 6dad8015c9a1..799e4a35ca44 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -300,6 +300,19 @@ static const struct adreno_info gpulist[] = {
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a660_zap.mdt",
>                 .hwcg = a660_hwcg,
> +       }, {
> +               .rev = ADRENO_REV(6, 8, 0, ANY_ID),
> +               .revn = 680,
> +               .name = "A680",
> +               .fw = {
> +                       [ADRENO_FW_SQE] = "a630_sqe.fw",
> +                       [ADRENO_FW_GMU] = "a640_gmu.bin",
> +               },
> +               .gmem = SZ_2M,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init = a6xx_gpu_init,
> +               .zapfw = "a640_zap.mdt",
> +               .hwcg = a640_hwcg,
>         },
>  };
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 8dbe0d157520..a7e843e81b1e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -258,6 +258,11 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>         return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660;
>  }
>
> +static inline int adreno_is_a680(struct adreno_gpu *gpu)
> +{
> +       return gpu->revn == 680;
> +}
> +
>  int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
>  const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
>                 const char *fwname);
> --
> 2.29.2
>
