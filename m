Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF5782FEB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 20:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C103210E284;
	Mon, 21 Aug 2023 18:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D1C10E1A1;
 Mon, 21 Aug 2023 18:06:35 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a84c228f26so1115600b6e.1; 
 Mon, 21 Aug 2023 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692641195; x=1693245995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pqax+MnI9SXQoENwXtIv+o1Bq2aoIE2picQ2A155qEY=;
 b=OYrAalsTqJXXhtG693ybwysvn7+k8VuDktHSQP9TH1WoK1tUbIPErm8V2fOUnUTgqo
 lz1EFR1XDZqBD+dtpGuRNXms+YdARLA9j6MvuvMl7iRRIoI+WreK/uuQCf9bWDIW0MYC
 +nl+z0NnVxsmx7pk2AKbE9sRaW0jySWVrmeacGazzpObsJdyB83pB+NjSgN7M7W9SLO3
 ynb4gUtBXFE5c3amfNZ6x9tjcjFZfxaCFgAqgpg1gDnFXRsgKAa4bioPp0jPRrHDumqc
 p/EfK9WBTZiC/YHxyagY5h9UAGW2jsTSMrnHia7fqmriCMWIUQ88KBGuvvtapvIYb1gJ
 MHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692641195; x=1693245995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pqax+MnI9SXQoENwXtIv+o1Bq2aoIE2picQ2A155qEY=;
 b=iDEt6ycUh0eg/KS4A6qxTRSFi8T6kHK0sR1sUHgQcuEXB7LPz5IniI8cf5cbbFnSVi
 q6A0OUfyTWXmwxqrK7zYyl/acitRN0GJWZ437C3YdPlcPbIZiiQe0HjvtwIND/1qxkaO
 3HwvFOa1YdKv2AXCkxLi/TbyjLZnE6DJGUQH2JwgnMbEc8EK5TqhyXtoZ1K4LsdaLC14
 GgIjxhrGD64v9fX9e9LTlPluNc3Rp6QtKri+/xT4fORmAUsIEsLBo3Ruhi/Owlk0Svdz
 maprqije0BMtTHC4mlTGQWu1FvKPjecpQuhfrELnAAvQZ5cFwEpz2s/SHiQdp+ZrUfyO
 OwTw==
X-Gm-Message-State: AOJu0Yye56TwGuYs8ujhxHi1nY0+gjqKOaIUeeIV7gFpBWB+MbxAYACN
 ntdpepX3y7t2iqnh1uWe5JQT57o+848r7SFOvxw=
X-Google-Smtp-Source: AGHT+IEgrnJRbjoQCFPUCDgD32rzZanVrFjvgAt52ST2/EKn+YbV3CkRQoeq3EfzGk9Ay0eMEyGTwFX49fkerZzByZ0=
X-Received: by 2002:a05:6808:211b:b0:3a6:f5db:a86c with SMTP id
 r27-20020a056808211b00b003a6f5dba86cmr5635708oiw.1.1692641195090; Mon, 21 Aug
 2023 11:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-3-Arvind.Yadav@amd.com>
In-Reply-To: <20230821064759.94223-3-Arvind.Yadav@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Aug 2023 14:06:24 -0400
Message-ID: <CADnq5_PreqOHyhF2v5FxViJcBO2RKjEjCCE2_RoYXoD66TX4eA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power
 profile
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
Cc: shashank.sharma@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 2:55=E2=80=AFAM Arvind Yadav <Arvind.Yadav@amd.com>=
 wrote:
>
> This patch adds a function which will change the GPU
> power profile based on a submitted job. This can optimize
> the power performance when the workload is on.
>
> v2:
> - Splitting workload_profile_set and workload_profile_put
>   into two separate patches.
> - Addressed review comment.
>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 56 +++++++++++++++++++
>  drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>  2 files changed, 59 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_workload.c
> index 32166f482f77..e661cc5b3d92 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> @@ -24,6 +24,62 @@
>
>  #include "amdgpu.h"
>
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
> +static int
> +amdgpu_power_profile_set(struct amdgpu_device *adev,
> +                        enum PP_SMC_POWER_PROFILE profile)
> +{
> +       int ret =3D amdgpu_dpm_switch_power_profile(adev, profile, true);
> +
> +       if (!ret) {
> +               /* Set the bit for the submitted workload profile */
> +               adev->smu_workload.submit_workload_status |=3D (1 << prof=
ile);
> +               atomic_inc(&adev->smu_workload.power_profile_ref[profile]=
);
> +       }
> +
> +       return ret;
> +}
> +
> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
> +                                uint32_t ring_type)

Maybe rename this amdgpu_workload_profile_get() to align with put/get
naming semantics?

Alex

> +{
> +       struct amdgpu_smu_workload *workload =3D &adev->smu_workload;
> +       enum PP_SMC_POWER_PROFILE profile =3D ring_to_power_profile(ring_=
type);
> +       int ret;
> +
> +       if (profile =3D=3D PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> +               return;
> +
> +       mutex_lock(&workload->workload_lock);
> +
> +       ret =3D amdgpu_power_profile_set(adev, profile);
> +       if (ret) {
> +               DRM_WARN("Failed to set workload profile to %s, error =3D=
 %d\n",
> +                        amdgpu_workload_mode_name[profile], ret);
> +       }
> +
> +       mutex_unlock(&workload->workload_lock);
> +}
> +
>  void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>  {
>         adev->smu_workload.adev =3D adev;
> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/=
drm/amd/include/amdgpu_workload.h
> index 5d0f068422d4..5022f28fc2f9 100644
> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> @@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] =
=3D {
>         "Window3D"
>  };
>
> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
> +                                uint32_t ring_type);
> +
>  void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>
>  void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
> --
> 2.34.1
>
