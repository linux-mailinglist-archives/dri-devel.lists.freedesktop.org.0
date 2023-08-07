Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1FE772D0A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD0610E36F;
	Mon,  7 Aug 2023 17:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579D910E36C;
 Mon,  7 Aug 2023 17:32:32 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1bfce114ef9so1237696fac.1; 
 Mon, 07 Aug 2023 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429551; x=1692034351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppiBBjYJG/XW1kAAXzQTC+/nWhNIEYjSapFb0lojsPM=;
 b=oHFC/ciAFq4RNMuFiAKJAQHIwKXCkfbl7thPWsUwm6ItTlyfmLkH+LsZLcGe1MpDsO
 goQWvV/Qx5hdyN2u0GKRmqUVdO448yZwS3kmw3aykmk2vc65aBclZOldjDifiQh2EByb
 V68B3u/P7uLY0LXZLUH1/w1JnM5w6uKSv+M/ro0Pqq2drB8Q1uOG3HaiAmj98QTMY/6b
 KygmFg48GRchZlBDe/Ck61W9hFnfl//x5WE9l7uc/oqC2StddE7tQgspXCJ4S0arjhIV
 EnqU0/viKMttdlp9OrwJoEJ0zdXKeS1GeEOaHjMUBZikeqTgT4vaYtKH9r3UGEUTpxuy
 rZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429551; x=1692034351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppiBBjYJG/XW1kAAXzQTC+/nWhNIEYjSapFb0lojsPM=;
 b=bQqcoULHF3qDUsWzSccs6F2JO8OvmzLAnC2Bu4WfQw7x0hNSyxrI+3hsZXZOBTSTjZ
 ccaK20J70eBOWYiViOn+qxli0H3KFrusGpGW7aNJPOHJlUH12D/4zD30i0Y2jOV8ZxEb
 ymT5811eLNJ7kxV9/1nd8EY9s6oLTDe9LxxZrP84mr1li7+qfOKuU/ktXfi1/hFSg55m
 FtM3SZ3b4ZRbypzfBxA5nTXKowY1y4mOB1PXQLPcdQj4OqCKZKE20HaUJhjJkHtCfbba
 W7vp2IwhcYbAv+DOPAz5yLdD0h2R014jqWufi4bjeSo7op6DvMOixTgRpkWucZtCP3Yd
 bjAA==
X-Gm-Message-State: AOJu0Ywfh+nY17bkB8CyHzoQIKdNbNvrBcJA1ipIOkr0qRqyv7b1LvHn
 aJx7xmOTFMNgvY/HIvem4+OMTlDKR5DGnKuT2UQ7X3+x
X-Google-Smtp-Source: AGHT+IFGfTUDhGDdBV33XG4hu9P4aAEmS7czwMpfrpRKuTz/A3zu2jsstMLqzpomseAVz+m9Kp+dn+yHx1/2VpoqUwA=
X-Received: by 2002:a05:6870:c20d:b0:1bf:1346:63e with SMTP id
 z13-20020a056870c20d00b001bf1346063emr9773323oae.49.1691429551577; Mon, 07
 Aug 2023 10:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230802074844.13773-1-sunran001@208suo.com>
In-Reply-To: <20230802074844.13773-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:32:20 -0400
Message-ID: <CADnq5_MtGmXSpDM4znwXbrT+CrzNO8HvFy6_tvS8NQ-PDR9SSg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in gfx_v7_0.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 3:49=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: trailing statements should be on next line
> ERROR: open brace '{' following struct go on the same line
> ERROR: space prohibited before that '++' (ctx:WxB)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 28 +++++++++++----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v7_0.c
> index 8c174c11eaee..90b034b173c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -90,8 +90,7 @@ MODULE_FIRMWARE("amdgpu/mullins_ce.bin");
>  MODULE_FIRMWARE("amdgpu/mullins_rlc.bin");
>  MODULE_FIRMWARE("amdgpu/mullins_mec.bin");
>
> -static const struct amdgpu_gds_reg_offset amdgpu_gds_reg_offset[] =3D
> -{
> +static const struct amdgpu_gds_reg_offset amdgpu_gds_reg_offset[] =3D {
>         {mmGDS_VMID0_BASE, mmGDS_VMID0_SIZE, mmGDS_GWS_VMID0, mmGDS_OA_VM=
ID0},
>         {mmGDS_VMID1_BASE, mmGDS_VMID1_SIZE, mmGDS_GWS_VMID1, mmGDS_OA_VM=
ID1},
>         {mmGDS_VMID2_BASE, mmGDS_VMID2_SIZE, mmGDS_GWS_VMID2, mmGDS_OA_VM=
ID2},
> @@ -110,8 +109,7 @@ static const struct amdgpu_gds_reg_offset amdgpu_gds_=
reg_offset[] =3D
>         {mmGDS_VMID15_BASE, mmGDS_VMID15_SIZE, mmGDS_GWS_VMID15, mmGDS_OA=
_VMID15}
>  };
>
> -static const u32 spectre_rlc_save_restore_register_list[] =3D
> -{
> +static const u32 spectre_rlc_save_restore_register_list[] =3D {
>         (0x0e00 << 16) | (0xc12c >> 2),
>         0x00000000,
>         (0x0e00 << 16) | (0xc140 >> 2),
> @@ -557,8 +555,7 @@ static const u32 spectre_rlc_save_restore_register_li=
st[] =3D
>         (0x0e00 << 16) | (0x9600 >> 2),
>  };
>
> -static const u32 kalindi_rlc_save_restore_register_list[] =3D
> -{
> +static const u32 kalindi_rlc_save_restore_register_list[] =3D {
>         (0x0e00 << 16) | (0xc12c >> 2),
>         0x00000000,
>         (0x0e00 << 16) | (0xc140 >> 2),
> @@ -933,7 +930,8 @@ static int gfx_v7_0_init_microcode(struct amdgpu_devi=
ce *adev)
>         case CHIP_MULLINS:
>                 chip_name =3D "mullins";
>                 break;
> -       default: BUG();
> +       default:
> +               BUG();
>         }
>
>         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name=
);
> @@ -2759,8 +2757,7 @@ static int gfx_v7_0_mec_init(struct amdgpu_device *=
adev)
>         return 0;
>  }
>
> -struct hqd_registers
> -{
> +struct hqd_registers {
>         u32 cp_mqd_base_addr;
>         u32 cp_mqd_base_addr_hi;
>         u32 cp_hqd_active;
> @@ -5124,11 +5121,11 @@ static void gfx_v7_0_get_cu_info(struct amdgpu_de=
vice *adev)
>                         bitmap =3D gfx_v7_0_get_cu_active_bitmap(adev);
>                         cu_info->bitmap[i][j] =3D bitmap;
>
> -                       for (k =3D 0; k < adev->gfx.config.max_cu_per_sh;=
 k ++) {
> +                       for (k =3D 0; k < adev->gfx.config.max_cu_per_sh;=
 k++) {
>                                 if (bitmap & mask) {
>                                         if (counter < ao_cu_num)
>                                                 ao_bitmap |=3D mask;
> -                                       counter ++;
> +                                       counter++;
>                                 }
>                                 mask <<=3D 1;
>                         }
> @@ -5150,8 +5147,7 @@ static void gfx_v7_0_get_cu_info(struct amdgpu_devi=
ce *adev)
>         cu_info->lds_size =3D 64;
>  }
>
> -const struct amdgpu_ip_block_version gfx_v7_1_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version gfx_v7_1_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_GFX,
>         .major =3D 7,
>         .minor =3D 1,
> @@ -5159,8 +5155,7 @@ const struct amdgpu_ip_block_version gfx_v7_1_ip_bl=
ock =3D
>         .funcs =3D &gfx_v7_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version gfx_v7_2_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version gfx_v7_2_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_GFX,
>         .major =3D 7,
>         .minor =3D 2,
> @@ -5168,8 +5163,7 @@ const struct amdgpu_ip_block_version gfx_v7_2_ip_bl=
ock =3D
>         .funcs =3D &gfx_v7_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version gfx_v7_3_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version gfx_v7_3_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_GFX,
>         .major =3D 7,
>         .minor =3D 3,
> --
> 2.17.1
>
