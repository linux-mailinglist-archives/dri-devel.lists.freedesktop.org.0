Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906BE77BBBE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 16:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB4A10E216;
	Mon, 14 Aug 2023 14:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0710E213;
 Mon, 14 Aug 2023 14:34:03 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bcade59b24so3657278a34.0; 
 Mon, 14 Aug 2023 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692023643; x=1692628443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMCYSTnI0EaprvPrU8AJ07Nk7OqdkIqQaqivREr/cT8=;
 b=QRd3C0YnJaysian8xt/KxSBaqAEuHPSaeFv3ixRchVmcK0PySTPYp5hTqK86LfyoCI
 b259L7WTVX1D4ciGHvnNgXKrNHldN1ir7dcGWXptL6A6iMrwYq4fUaL6jbEf4tyzwsDy
 QS+yUfW0E+6a35PN3oihVshMJcPGAZRrAJy5s6000+wdTlEZI02gpDFrUQdRhX0Nqqu8
 zaIy4Y89WMiIeYpjozBYBa3ylUGEcSrVqzpwNRqxU5uasZa9JKwVPgTXlGiH3ncdgxUM
 JgnSW9e+YFprma05b5tTQZqQDT4+n3PcTdkKnMHCtDjXQ+J9KgiFSJT1RyoS4vfmPPI8
 vzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692023643; x=1692628443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VMCYSTnI0EaprvPrU8AJ07Nk7OqdkIqQaqivREr/cT8=;
 b=FUfdlAazndI25cU2wRa6vw4LcuhudEh1H75/ntFZ29onbrOo6He7GkScvjp4DmFKw+
 A29PfhAV48uSUHpDjllyFJIAxUByISAnoRqEcwdAs2RCN7Xg/uSrOgI3AHM63rOEwRzb
 /Uztzbq1cktsrJa3bj+rXQtfyUWB4xotob2zp3NoTTcnPTFG5Ipwv5IxWpgKEzbCvqZg
 rViSkOZpk/PbGKLMiW2HLnZ+Zaon6/9BkFqyJUf82OPTa5I/dLYVKYLC1LAXCeLT1BtC
 M1T0y8uVrI883d8MTqDLCfCLMMq20D4jyeoxUn3uINesmd9DiRudwqYm1LXgR9O13A4k
 Trlg==
X-Gm-Message-State: AOJu0Yw/F3LmQ3OLCXs9h9hbNMagR5p/bXNakjFtmkkop8DPn91K3+Ju
 Q9bHp9WNVbfzmzIRxJ3gSrkTfqv6lTvvBMB8GsE=
X-Google-Smtp-Source: AGHT+IGBnw15mEd8LCUpANzlvT1pKn1oKCqBOba0YRURUjQhSKCMPqrZVG3jdyFGkT+kCkNQv89nkEcisSZIw6yZoVQ=
X-Received: by 2002:a05:6870:b01a:b0:17f:7388:4c69 with SMTP id
 y26-20020a056870b01a00b0017f73884c69mr10778590oae.30.1692023642423; Mon, 14
 Aug 2023 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-2-Arvind.Yadav@amd.com>
In-Reply-To: <20230814073438.10682-2-Arvind.Yadav@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Aug 2023 10:33:51 -0400
Message-ID: <CADnq5_N2YzOv4naA_etwQ_C5NkNYwV-PtBAJ3UKEXp6RbdQojQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: Add new api to switch on/off power
 profile mode
To: Arvind Yadav <Arvind.Yadav@amd.com>
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
Cc: shashank.sharma@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 3:35=E2=80=AFAM Arvind Yadav <Arvind.Yadav@amd.com>=
 wrote:
>
> This patch adds a function which will allow to
> change the GPU power profile based on a submitted job.
> This can optimize the power performance when the
> workload is on.

A few minor comments inline below.  One thing to double check is that
we properly cancel this work before a suspend or driver unload.  We
need to make sure this is taken care of before we take down the SMU.

Alex

>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 156 ++++++++++++++++++
>  drivers/gpu/drm/amd/include/amdgpu_workload.h |  44 +++++
>  5 files changed, 206 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>  create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/am=
dgpu/Makefile
> index 415a7fa395c4..6a9e187d61e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -60,7 +60,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_kms.o \
>         amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>         amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>         amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
> -       amdgpu_ring_mux.o
> +       amdgpu_ring_mux.o amdgpu_workload.o
>
>  amdgpu-$(CONFIG_PROC_FS) +=3D amdgpu_fdinfo.o
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 02b827785e39..1939fa1af8a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -107,6 +107,7 @@
>  #include "amdgpu_fdinfo.h"
>  #include "amdgpu_mca.h"
>  #include "amdgpu_ras.h"
> +#include "amdgpu_workload.h"
>
>  #define MAX_GPU_INSTANCE               16
>
> @@ -1050,6 +1051,8 @@ struct amdgpu_device {
>
>         bool                            job_hang;
>         bool                            dc_enabled;
> +
> +       struct amdgpu_smu_workload      smu_workload;
>  };
>
>  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 5c7d40873ee2..0ec18b8fe29f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3672,6 +3672,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>
>         INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>
> +       amdgpu_smu_workload_init(adev);
> +
>         adev->gfx.gfx_off_req_count =3D 1;
>         adev->gfx.gfx_off_residency =3D 0;
>         adev->gfx.gfx_off_entrycount =3D 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_workload.c
> new file mode 100644
> index 000000000000..ce0339d75c12
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#include "amdgpu.h"
> +
> +/* 100 millsecond timeout */
> +#define SMU_IDLE_TIMEOUT       msecs_to_jiffies(100)
> +
> +static enum PP_SMC_POWER_PROFILE
> +ring_to_power_profile(uint32_t ring_type)
> +{
> +       switch (ring_type) {
> +       case AMDGPU_RING_TYPE_GFX:
> +               return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
> +       case AMDGPU_RING_TYPE_COMPUTE:
> +               return PP_SMC_POWER_PROFILE_COMPUTE;
> +       case AMDGPU_RING_TYPE_UVD:
> +       case AMDGPU_RING_TYPE_VCE:
> +       case AMDGPU_RING_TYPE_UVD_ENC:
> +       case AMDGPU_RING_TYPE_VCN_DEC:
> +       case AMDGPU_RING_TYPE_VCN_ENC:
> +       case AMDGPU_RING_TYPE_VCN_JPEG:
> +               return PP_SMC_POWER_PROFILE_VIDEO;
> +       default:
> +               return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> +       }
> +}
> +
> +static void
> +amdgpu_power_profile_set(struct amdgpu_device *adev,
> +                        enum PP_SMC_POWER_PROFILE profile)
> +{
> +       int ret =3D amdgpu_dpm_switch_power_profile(adev, profile, true);
> +
> +       if (ret =3D=3D 0) {
> +               /* Set the bit for the submitted workload profile */
> +               adev->smu_workload.submit_workload_status |=3D (1 << prof=
ile);
> +               atomic_inc(&adev->smu_workload.power_profile_ref[profile]=
);
> +       } else {
> +               DRM_ERROR("Failed to set power profile, error %d\n", ret)=
;
> +       }
> +
> +}
> +
> +static void
> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
> +                          enum PP_SMC_POWER_PROFILE profile)
> +{
> +       int ret =3D amdgpu_dpm_switch_power_profile(adev, profile, false)=
;
> +
> +       if (ret =3D=3D 0) {
> +                /* Clear the bit for the submitted workload profile */
> +               adev->smu_workload.submit_workload_status &=3D ~(1 << pro=
file);
> +       } else
> +               DRM_ERROR("Failed to clear power profile, error %d\n", re=
t);
> +
> +}
> +
> +static void amdgpu_smu_idle_work_handler(struct work_struct *work)

How about amdgpu_power_profile_idle_work_handler() for consistency?

> +{
> +
> +       struct amdgpu_smu_workload *wl =3D container_of(work,
> +                                                     struct amdgpu_smu_w=
orkload,
> +                                                     smu_delayed_work.wo=
rk);
> +       struct amdgpu_device *adev =3D wl->adev;
> +       bool reschedule =3D false;
> +
> +       mutex_lock(&adev->smu_workload.workload_lock);
> +       for (int index  =3D fls(adev->smu_workload.submit_workload_status=
);
> +            index >=3D 0; index--) {
> +               if (!atomic_read(&adev->smu_workload.power_profile_ref[in=
dex]) &&
> +                   adev->smu_workload.submit_workload_status & (1 << ind=
ex)) {
> +                       amdgpu_power_profile_clear(adev, index);
> +               } else if (atomic_read(&adev->smu_workload.power_profile_=
ref[index]))
> +                       reschedule =3D true;
> +       }
> +
> +       if (reschedule)
> +               schedule_delayed_work(&adev->smu_workload.smu_delayed_wor=
k,
> +                                     SMU_IDLE_TIMEOUT);
> +
> +       mutex_unlock(&adev->smu_workload.workload_lock);
> +}
> +
> +void amdgpu_put_workload_profile(struct amdgpu_device *adev,

amdgpu_workload_profile_put() for consistency.

> +                                uint32_t ring_type)
> +{
> +
> +       enum PP_SMC_POWER_PROFILE profile =3D ring_to_power_profile(ring_=
type);
> +
> +       if (profile =3D=3D PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> +               return;
> +
> +       mutex_lock(&adev->smu_workload.workload_lock);
> +       atomic_dec(&adev->smu_workload.power_profile_ref[profile]);
> +       schedule_delayed_work(&adev->smu_workload.smu_delayed_work, SMU_I=
DLE_TIMEOUT);
> +       mutex_unlock(&adev->smu_workload.workload_lock);
> +}
> +
> +void amdgpu_set_workload_profile(struct amdgpu_device *adev,
> +                                uint32_t ring_type)

amdgpu_workload_profile_set() for consistency.

> +{
> +       enum PP_SMC_POWER_PROFILE profile =3D ring_to_power_profile(ring_=
type);
> +
> +       if (profile =3D=3D PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> +               return;
> +
> +       mutex_lock(&adev->smu_workload.workload_lock);
> +       cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
> +
> +       amdgpu_power_profile_set(adev, profile);
> +
> +       /* Clear the already finished jobs of higher power profile*/
> +       for (int index =3D fls(adev->smu_workload.submit_workload_status)=
;
> +            index > profile; index--) {
> +               if (!atomic_read(&adev->smu_workload.power_profile_ref[in=
dex]) &&
> +                   adev->smu_workload.submit_workload_status & (1 << ind=
ex)) {
> +                       amdgpu_power_profile_clear(adev, index);
> +               }
> +       }
> +
> +       mutex_unlock(&adev->smu_workload.workload_lock);
> +}
> +
> +void amdgpu_smu_workload_init(struct amdgpu_device *adev)

amdgpu_workload_profile_init() for consistency.

> +{
> +       struct amdgpu_smu_workload wl;
> +
> +       wl.adev =3D adev;
> +       wl.submit_workload_status =3D 0;
> +       adev->smu_workload =3D wl;
> +
> +       mutex_init(&adev->smu_workload.workload_lock);
> +       INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work, amdgpu_sm=
u_idle_work_handler);
> +}
> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/=
drm/amd/include/amdgpu_workload.h
> new file mode 100644
> index 000000000000..09804c3d2869
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef _AMDGPU_WORKLOAD_H_
> +#define _AMDGPU_WORKLOAD_H_
> +
> +struct amdgpu_smu_workload {
> +       struct amdgpu_device    *adev;
> +       struct mutex            workload_lock;
> +       struct delayed_work     smu_delayed_work;
> +       uint32_t                submit_workload_status;
> +       atomic_t                power_profile_ref[PP_SMC_POWER_PROFILE_CO=
UNT];
> +};
> +
> +void amdgpu_set_workload_profile(struct amdgpu_device *adev,
> +                                uint32_t ring_type);
> +
> +void amdgpu_put_workload_profile(struct amdgpu_device *adev,
> +                                uint32_t ring_type);
> +
> +void amdgpu_smu_workload_init(struct amdgpu_device *adev);
> +
> +#endif
> --
> 2.34.1
>
