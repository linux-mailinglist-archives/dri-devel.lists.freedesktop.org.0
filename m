Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75A6B98E5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2968910E81B;
	Tue, 14 Mar 2023 15:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA98C10E81C;
 Tue, 14 Mar 2023 15:23:10 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bi17so12057420oib.3;
 Tue, 14 Mar 2023 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678807390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZthyf9O7m+4xnS4ELJlsYXDAkPMiY/lLsht07DclGg=;
 b=i9GIoQK6IG1EhUNatHWrIDXSgiVA6QYilOjlsQcjN6aAjRokymSQMk/MpQVe2k8k3P
 X4+1BRavCnPk3i77vvRPiuAFNpeFa1aqA72h6R9FqtmLQtTnvbGHT77xWXDHOig3gdYh
 apn/OHfsZf0qK/RziVA5noSb3R5Zsb3HI2VNqkC6YkvjCL/Cyq9yHHqas/vAjltC/rYZ
 w8Z4Qmk+H6pSCHNmiNKVtO0nZkuFYvsEOsI5E3wZRRBm6kKQFOuhqdSVRyslrKe+tJAg
 kusYYbrF+vSWYZjkuPGk5XZF7uecTdi3BholAmn/Deatgd45JrwqN/QoSplSc1+CQdS6
 tkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZthyf9O7m+4xnS4ELJlsYXDAkPMiY/lLsht07DclGg=;
 b=giZ1R3I7W+wkFq0/ntKeGCQ7bN2++7WJSHoLbB39RGvKamgTLHYig7m8PmHOV7+dM7
 ABJWYXn+dwU9RzTKNcZBA2h9EsX5ossYSw/mTGl4ZpGG/e0olC78sb/IyffQ/uPdCKdZ
 d68kyRj2AFDs+oPbqY/gTbfWFG9AMU7FySq7iGJuNToFZNGkXkoMExDRqglTlSnvnz6H
 mcHLXAUIGjNraBwFu7cvDl8AJrgx+a33AIluqNvDF3AvY/JqHyVjyHOCConVuhhS7Ecc
 4H2l7502J7GZuXYO4giZ5h12b6J2GtC3b2DiYdaux1dn1W0POoKVWnUCHKeGGukvMhyW
 46jQ==
X-Gm-Message-State: AO0yUKVHmCgYxEQm6uHb8+X2gcc7VTCZK2UrTpenXVyrfHWDxd4MyaGA
 oYmy2KPgzkoD+wUDMjtF+hh7JeVqIxyGyYuHpD0=
X-Google-Smtp-Source: AK7set94v1q4xLwDYtzPczh6Lmqc0MOw4TXfK+D1Yib/S6HGBlKAmKq/i19ZBpZ6z/63O59YIBlMj08NJipEKwDHlRM=
X-Received: by 2002:a05:6808:354:b0:37f:b1b8:4a19 with SMTP id
 j20-20020a056808035400b0037fb1b84a19mr11212188oie.3.1678807390120; Tue, 14
 Mar 2023 08:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230314042605.346458-1-kai.heng.feng@canonical.com>
In-Reply-To: <20230314042605.346458-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Mar 2023 11:22:56 -0400
Message-ID: <CADnq5_OkFhONSKn2DbGhxaXyaSjzu0RBnydd99wgsVudxW3kxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Victor Zhao <Victor.Zhao@amd.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>, Evan Quan <evan.quan@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Richard Gong <richard.gong@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, alexander.deucher@amd.com,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 12:35=E2=80=AFAM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> S2idle resume freeze can be observed on Intel ADL + AMD WX5500. This is
> caused by commit 0064b0ce85bb ("drm/amd/pm: enable ASPM by default").
>
> The root cause is still not clear for now.
>
> So extend and apply the ASPM quirk from commit e02fe3bc7aba
> ("drm/amdgpu: vi: disable ASPM on Intel Alder Lake based systems"), to
> workaround the issue on Navi cards too.
>
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/nv.c            |  2 +-
>  drivers/gpu/drm/amd/amdgpu/vi.c            | 15 ---------------
>  4 files changed, 17 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 164141bc8b4a..c697580f1ee4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1272,6 +1272,7 @@ void amdgpu_device_pci_config_reset(struct amdgpu_d=
evice *adev);
>  int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>  bool amdgpu_device_need_post(struct amdgpu_device *adev);
>  bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);
> +bool aspm_support_quirk_check(void);
>
>  void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_by=
tes,
>                                   u64 num_vis_bytes);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index c4a4e2fe6681..c09f19385628 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -80,6 +80,10 @@
>
>  #include <drm/drm_drv.h>
>
> +#if IS_ENABLED(CONFIG_X86)
> +#include <asm/intel-family.h>
> +#endif
> +
>  MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
> @@ -1356,6 +1360,17 @@ bool amdgpu_device_should_use_aspm(struct amdgpu_d=
evice *adev)
>         return pcie_aspm_enabled(adev->pdev);
>  }
>
> +bool aspm_support_quirk_check(void)

For consistency with naming, rename this
amdgpu_device_aspm_support_quirk().  Other than that, looks good to
me.  With that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Alex


> +{
> +#if IS_ENABLED(CONFIG_X86)
> +       struct cpuinfo_x86 *c =3D &cpu_data(0);
> +
> +       return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D INTEL_FAM6_ALDERL=
AKE);
> +#else
> +       return true;
> +#endif
> +}
> +
>  /* if we get transitioned to only one device, take VGA back */
>  /**
>   * amdgpu_device_vga_set_decode - enable/disable vga decode
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu=
/nv.c
> index 855d390c41de..921adf66e3c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -578,7 +578,7 @@ static void nv_pcie_gen3_enable(struct amdgpu_device =
*adev)
>
>  static void nv_program_aspm(struct amdgpu_device *adev)
>  {
> -       if (!amdgpu_device_should_use_aspm(adev))
> +       if (!amdgpu_device_should_use_aspm(adev) || !aspm_support_quirk_c=
heck())
>                 return;
>
>         if (!(adev->flags & AMD_IS_APU) &&
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu=
/vi.c
> index 12ef782eb478..e61ae372d674 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -81,10 +81,6 @@
>  #include "mxgpu_vi.h"
>  #include "amdgpu_dm.h"
>
> -#if IS_ENABLED(CONFIG_X86)
> -#include <asm/intel-family.h>
> -#endif
> -
>  #define ixPCIE_LC_L1_PM_SUBSTATE       0x100100C6
>  #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK       0=
x00000001L
>  #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK   0x0000000=
2L
> @@ -1138,17 +1134,6 @@ static void vi_enable_aspm(struct amdgpu_device *a=
dev)
>                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
>  }
>
> -static bool aspm_support_quirk_check(void)
> -{
> -#if IS_ENABLED(CONFIG_X86)
> -       struct cpuinfo_x86 *c =3D &cpu_data(0);
> -
> -       return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D INTEL_FAM6_ALDERL=
AKE);
> -#else
> -       return true;
> -#endif
> -}
> -
>  static void vi_program_aspm(struct amdgpu_device *adev)
>  {
>         u32 data, data1, orig;
> --
> 2.34.1
>
