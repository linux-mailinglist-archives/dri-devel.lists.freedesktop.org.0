Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71EA65DB04
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 18:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF69910E5D0;
	Wed,  4 Jan 2023 17:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0B10E5CF;
 Wed,  4 Jan 2023 17:16:09 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 x44-20020a05683040ac00b006707c74330eso21122306ott.10; 
 Wed, 04 Jan 2023 09:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7KENzpgraJEUniVnBFGmdFZ+oGMoQCkV6H0MhS8ffL4=;
 b=kmc3o1f0rE8CmUIWc/jVXSxNPYJ0O3Rjq8XHVZa6nMeoUFJGrK92Zn2Ayyb8DQQwVu
 ADtJn+MWCfx0KAoP7hzR/BKkrDkplI+VcFK6eTRvzAgWxlhpDoDSI8DmD+Ittx0U6ZhY
 MH8Foc5aNbhjbM0ceIe/yVwAq93yoH3C5wOjEgWfmF/yuEvCk+jUs1svB70dShs5SGFF
 QKoE2xgRo7dWT1p/4NyDl2CsEhye4R+1iA/QMpzVH32ED9uJLMIy2ff04gzioOOufXjy
 /83aKf12NskMriK1XVmnlB31JVX1cVNR4mL62Dne9+a53Xmj5cktSOamx46Y1yXtNGHR
 zICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7KENzpgraJEUniVnBFGmdFZ+oGMoQCkV6H0MhS8ffL4=;
 b=wLfT/lAi16wywJkiIroun4WGzfQLOAYDkiHd9PgauJvFo/jZeiALdj42NuKJx1aTlo
 L17wgbh6Bd/qmHLVwzUc4uqQ/j4Y4S2AU6NsN/kWwfYn5H4wY69KgFGgvjqOxmljj4OO
 2RxyGq+lUr7byHxEo0wOEY8L3YWz4Haq6EYmtyOkrTjFICw7f++VCkrPkBsIi6mjSdW2
 Jhm6NhB5KlvmE/4RI55PDU3g56dErtGXvLVanqSx8GLde0gDw/9ebPF0aD0U3eGWaHez
 8fZnbI/dVFJkAykDJdwe2MmXD0ZfeYSpfQlzKd3AvmMyUqLegPNmVnWhtcKJe4vbo2Nw
 6xvg==
X-Gm-Message-State: AFqh2kpZxXzgIkZE6tLYL8pH0Q/EUz4PzNvWZ2ZKkwo8+zD4rO5UYAsv
 B9F6q1G4o2Wf5x82v0+Lv4f0JXLDsvNyuBj6e7M=
X-Google-Smtp-Source: AMrXdXvzjjQ3mhqe5V0QYzRn1WRByGhfqs+vit71DOT4RswGFghGVTFpFk8hu86YHlo8ux6DHDHF7Xswy/WmYqw2Xc8=
X-Received: by 2002:a9d:6ac6:0:b0:671:cacb:681f with SMTP id
 m6-20020a9d6ac6000000b00671cacb681fmr3036539otq.233.1672852568335; Wed, 04
 Jan 2023 09:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20230104164042.30271-1-mario.limonciello@amd.com>
 <20230104164042.30271-11-mario.limonciello@amd.com>
In-Reply-To: <20230104164042.30271-11-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Jan 2023 12:15:56 -0500
Message-ID: <CADnq5_PUnPH_WS8RLZwC=8skmp0_6sr8o=rEioiWL=0dVdn-Mg@mail.gmail.com>
Subject: Re: [PATCH v5 10/45] drm/amd: Load VCN microcode during early_init
To: Mario Limonciello <mario.limonciello@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Carlos Soriano Sanchez <csoriano@redhat.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 4, 2023 at 11:42 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Simplifies the code so that all VCN versions will get the firmware
> name from `amdgpu_ucode_ip_version_decode` and then use this filename
> to load microcode as part of the early_init process.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 91 +++++++++----------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c   |  5 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   |  5 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c   |  5 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   |  5 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   |  5 +-
>  7 files changed, 50 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index b5692f825589..55bbe4c8ff5b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -36,25 +36,25 @@
>  #include "soc15d.h"
>
>  /* Firmware Names */
> -#define FIRMWARE_RAVEN         "amdgpu/raven_vcn.bin"
> -#define FIRMWARE_PICASSO       "amdgpu/picasso_vcn.bin"
> -#define FIRMWARE_RAVEN2                "amdgpu/raven2_vcn.bin"
> -#define FIRMWARE_ARCTURUS      "amdgpu/arcturus_vcn.bin"
> -#define FIRMWARE_RENOIR                "amdgpu/renoir_vcn.bin"
> -#define FIRMWARE_GREEN_SARDINE "amdgpu/green_sardine_vcn.bin"
> -#define FIRMWARE_NAVI10                "amdgpu/navi10_vcn.bin"
> -#define FIRMWARE_NAVI14                "amdgpu/navi14_vcn.bin"
> -#define FIRMWARE_NAVI12                "amdgpu/navi12_vcn.bin"
> -#define FIRMWARE_SIENNA_CICHLID        "amdgpu/sienna_cichlid_vcn.bin"
> -#define FIRMWARE_NAVY_FLOUNDER "amdgpu/navy_flounder_vcn.bin"
> -#define FIRMWARE_VANGOGH       "amdgpu/vangogh_vcn.bin"
> -#define FIRMWARE_DIMGREY_CAVEFISH      "amdgpu/dimgrey_cavefish_vcn.bin"
> -#define FIRMWARE_ALDEBARAN     "amdgpu/aldebaran_vcn.bin"
> -#define FIRMWARE_BEIGE_GOBY    "amdgpu/beige_goby_vcn.bin"
> -#define FIRMWARE_YELLOW_CARP   "amdgpu/yellow_carp_vcn.bin"
> -#define FIRMWARE_VCN_3_1_2     "amdgpu/vcn_3_1_2.bin"
> -#define FIRMWARE_VCN4_0_0      "amdgpu/vcn_4_0_0.bin"
> -#define FIRMWARE_VCN4_0_2      "amdgpu/vcn_4_0_2.bin"
> +#define FIRMWARE_RAVEN         "amdgpu/raven_vcn.bin"
> +#define FIRMWARE_PICASSO       "amdgpu/picasso_vcn.bin"
> +#define FIRMWARE_RAVEN2                "amdgpu/raven2_vcn.bin"
> +#define FIRMWARE_ARCTURUS      "amdgpu/arcturus_vcn.bin"
> +#define FIRMWARE_RENOIR                "amdgpu/renoir_vcn.bin"
> +#define FIRMWARE_GREEN_SARDINE "amdgpu/green_sardine_vcn.bin"
> +#define FIRMWARE_NAVI10                "amdgpu/navi10_vcn.bin"
> +#define FIRMWARE_NAVI14                "amdgpu/navi14_vcn.bin"
> +#define FIRMWARE_NAVI12                "amdgpu/navi12_vcn.bin"
> +#define FIRMWARE_SIENNA_CICHLID        "amdgpu/sienna_cichlid_vcn.bin"
> +#define FIRMWARE_NAVY_FLOUNDER "amdgpu/navy_flounder_vcn.bin"
> +#define FIRMWARE_VANGOGH       "amdgpu/vangogh_vcn.bin"
> +#define FIRMWARE_DIMGREY_CAVEFISH      "amdgpu/dimgrey_cavefish_vcn.bin"
> +#define FIRMWARE_ALDEBARAN     "amdgpu/aldebaran_vcn.bin"
> +#define FIRMWARE_BEIGE_GOBY    "amdgpu/beige_goby_vcn.bin"
> +#define FIRMWARE_YELLOW_CARP   "amdgpu/yellow_carp_vcn.bin"
> +#define FIRMWARE_VCN_3_1_2     "amdgpu/vcn_3_1_2.bin"
> +#define FIRMWARE_VCN4_0_0      "amdgpu/vcn_4_0_0.bin"
> +#define FIRMWARE_VCN4_0_2      "amdgpu/vcn_4_0_2.bin"
>  #define FIRMWARE_VCN4_0_4      "amdgpu/vcn_4_0_4.bin"

Is this just a whitespace change?

Alex

>
>  MODULE_FIRMWARE(FIRMWARE_RAVEN);
> @@ -80,10 +80,24 @@ MODULE_FIRMWARE(FIRMWARE_VCN4_0_4);
>
>  static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
>
> +int amdgpu_vcn_early_init(struct amdgpu_device *adev)
> +{
> +       char ucode_prefix[30];
> +       char fw_name[40];
> +       int r;
> +
> +       amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
> +       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
> +       r = amdgpu_ucode_request(adev, &adev->vcn.fw, fw_name);
> +       if (r)
> +               amdgpu_ucode_release(adev->vcn.fw);
> +
> +       return r;
> +}
> +
>  int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>  {
>         unsigned long bo_size;
> -       const char *fw_name;
>         const struct common_firmware_header *hdr;
>         unsigned char fw_check;
>         unsigned int fw_shared_size, log_offset;
> @@ -99,46 +113,27 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>         switch (adev->ip_versions[UVD_HWIP][0]) {
>         case IP_VERSION(1, 0, 0):
>         case IP_VERSION(1, 0, 1):
> -               if (adev->apu_flags & AMD_APU_IS_RAVEN2)
> -                       fw_name = FIRMWARE_RAVEN2;
> -               else if (adev->apu_flags & AMD_APU_IS_PICASSO)
> -                       fw_name = FIRMWARE_PICASSO;
> -               else
> -                       fw_name = FIRMWARE_RAVEN;
> -               break;
>         case IP_VERSION(2, 5, 0):
> -               fw_name = FIRMWARE_ARCTURUS;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(2, 2, 0):
> -               if (adev->apu_flags & AMD_APU_IS_RENOIR)
> -                       fw_name = FIRMWARE_RENOIR;
> -               else
> -                       fw_name = FIRMWARE_GREEN_SARDINE;
> -
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(2, 6, 0):
> -               fw_name = FIRMWARE_ALDEBARAN;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(2, 0, 0):
> -               fw_name = FIRMWARE_NAVI10;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(2, 0, 2):
> -               if (adev->asic_type == CHIP_NAVI12)
> -                       fw_name = FIRMWARE_NAVI12;
> -               else
> -                       fw_name = FIRMWARE_NAVI14;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
> @@ -146,58 +141,46 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>         case IP_VERSION(3, 0, 0):
>         case IP_VERSION(3, 0, 64):
>         case IP_VERSION(3, 0, 192):
> -               if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
> -                       fw_name = FIRMWARE_SIENNA_CICHLID;
> -               else
> -                       fw_name = FIRMWARE_NAVY_FLOUNDER;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(3, 0, 2):
> -               fw_name = FIRMWARE_VANGOGH;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(3, 0, 16):
> -               fw_name = FIRMWARE_DIMGREY_CAVEFISH;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(3, 0, 33):
> -               fw_name = FIRMWARE_BEIGE_GOBY;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(3, 1, 1):
> -               fw_name = FIRMWARE_YELLOW_CARP;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(3, 1, 2):
> -               fw_name = FIRMWARE_VCN_3_1_2;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                     (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(4, 0, 0):
> -               fw_name = FIRMWARE_VCN4_0_0;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                         (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(4, 0, 2):
> -               fw_name = FIRMWARE_VCN4_0_2;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                         (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(4, 0, 4):
> -               fw_name = FIRMWARE_VCN4_0_4;
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>                         (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
> @@ -206,12 +189,6 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>                 return -EINVAL;
>         }
>
> -       r = amdgpu_ucode_request(adev, &adev->vcn.fw, fw_name);
> -       if (r) {
> -               amdgpu_ucode_release(adev->vcn.fw);
> -               return r;
> -       }
> -
>         hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
>         adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> index dbb8d68a30c6..d3e2af902907 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> @@ -369,6 +369,7 @@ enum vcn_ring_type {
>         VCN_UNIFIED_RING,
>  };
>
> +int amdgpu_vcn_early_init(struct amdgpu_device *adev);
>  int amdgpu_vcn_sw_init(struct amdgpu_device *adev);
>  int amdgpu_vcn_sw_fini(struct amdgpu_device *adev);
>  int amdgpu_vcn_suspend(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> index f0fbcda76f5e..c305b2cb8490 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -57,11 +57,12 @@ static void vcn_v1_0_idle_work_handler(struct work_struct *work);
>  static void vcn_v1_0_ring_begin_use(struct amdgpu_ring *ring);
>
>  /**
> - * vcn_v1_0_early_init - set function pointers
> + * vcn_v1_0_early_init - set function pointers and load microcode
>   *
>   * @handle: amdgpu_device pointer
>   *
>   * Set ring and irq function pointers
> + * Load microcode from filesystem
>   */
>  static int vcn_v1_0_early_init(void *handle)
>  {
> @@ -75,7 +76,7 @@ static int vcn_v1_0_early_init(void *handle)
>
>         jpeg_v1_0_early_init(handle);
>
> -       return 0;
> +       return amdgpu_vcn_early_init(adev);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> index 08871bad9994..4b4cd88414e0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> @@ -62,11 +62,12 @@ static int vcn_v2_0_pause_dpg_mode(struct amdgpu_device *adev,
>                                 int inst_idx, struct dpg_pause_state *new_state);
>  static int vcn_v2_0_start_sriov(struct amdgpu_device *adev);
>  /**
> - * vcn_v2_0_early_init - set function pointers
> + * vcn_v2_0_early_init - set function pointers and load microcode
>   *
>   * @handle: amdgpu_device pointer
>   *
>   * Set ring and irq function pointers
> + * Load microcode from filesystem
>   */
>  static int vcn_v2_0_early_init(void *handle)
>  {
> @@ -81,7 +82,7 @@ static int vcn_v2_0_early_init(void *handle)
>         vcn_v2_0_set_enc_ring_funcs(adev);
>         vcn_v2_0_set_irq_funcs(adev);
>
> -       return 0;
> +       return amdgpu_vcn_early_init(adev);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> index ec87b00f2e05..b0b0e69c6a94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -71,11 +71,12 @@ static int amdgpu_ih_clientid_vcns[] = {
>  };
>
>  /**
> - * vcn_v2_5_early_init - set function pointers
> + * vcn_v2_5_early_init - set function pointers and load microcode
>   *
>   * @handle: amdgpu_device pointer
>   *
>   * Set ring and irq function pointers
> + * Load microcode from filesystem
>   */
>  static int vcn_v2_5_early_init(void *handle)
>  {
> @@ -107,7 +108,7 @@ static int vcn_v2_5_early_init(void *handle)
>         vcn_v2_5_set_irq_funcs(adev);
>         vcn_v2_5_set_ras_funcs(adev);
>
> -       return 0;
> +       return amdgpu_vcn_early_init(adev);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> index 9c8b5fd99037..bd228512424a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> @@ -78,11 +78,12 @@ static void vcn_v3_0_dec_ring_set_wptr(struct amdgpu_ring *ring);
>  static void vcn_v3_0_enc_ring_set_wptr(struct amdgpu_ring *ring);
>
>  /**
> - * vcn_v3_0_early_init - set function pointers
> + * vcn_v3_0_early_init - set function pointers and load microcode
>   *
>   * @handle: amdgpu_device pointer
>   *
>   * Set ring and irq function pointers
> + * Load microcode from filesystem
>   */
>  static int vcn_v3_0_early_init(void *handle)
>  {
> @@ -109,7 +110,7 @@ static int vcn_v3_0_early_init(void *handle)
>         vcn_v3_0_set_enc_ring_funcs(adev);
>         vcn_v3_0_set_irq_funcs(adev);
>
> -       return 0;
> +       return amdgpu_vcn_early_init(adev);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index 1e2b22299975..a79b6088374b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -68,11 +68,12 @@ static void vcn_v4_0_unified_ring_set_wptr(struct amdgpu_ring *ring);
>  static void vcn_v4_0_set_ras_funcs(struct amdgpu_device *adev);
>
>  /**
> - * vcn_v4_0_early_init - set function pointers
> + * vcn_v4_0_early_init - set function pointers and load microcode
>   *
>   * @handle: amdgpu_device pointer
>   *
>   * Set ring and irq function pointers
> + * Load microcode from filesystem
>   */
>  static int vcn_v4_0_early_init(void *handle)
>  {
> @@ -88,7 +89,7 @@ static int vcn_v4_0_early_init(void *handle)
>         vcn_v4_0_set_irq_funcs(adev);
>         vcn_v4_0_set_ras_funcs(adev);
>
> -       return 0;
> +       return amdgpu_vcn_early_init(adev);
>  }
>
>  /**
> --
> 2.34.1
>
