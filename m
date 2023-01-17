Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9B766E667
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25C210E5B7;
	Tue, 17 Jan 2023 18:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECC710E328;
 Tue, 17 Jan 2023 18:49:48 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-15bb8ec196aso21196733fac.3; 
 Tue, 17 Jan 2023 10:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d3KD/4A2J8yQYLK7u5mPtbJnPhhTITEco8MNWNkQ76g=;
 b=P6U1VOaWh8x4YcUJxRl6J6wwXbXG7MtxzhJ4Mc+FSSsop+ENKFGfbyCXu/XGhj2/5Y
 lR6hOUklvHeJaofwTzHRMuc3xgRBWrqyFN8ZiDbCJWr9p17gh6lpKBlWyFvdoSvB//0q
 zhwwmOyVDtqHEQ5Ma37i6mS8gIJEJyzWzWDz1cVrJQdGaGGP9NIMIbsnq5DFqz6uwwkK
 pmleAFJbFNFRcjalDef6u7fFYz27hNXZ+8u6t91lGhQd296Hrt4AMicy7/kwXJBd01A5
 ISBqqTzFQeMd2Bs5+1b9hXV0zW54H7iswqOdSKJoDIabz8mwAmXgZ43O/F6qculBvHqF
 OceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d3KD/4A2J8yQYLK7u5mPtbJnPhhTITEco8MNWNkQ76g=;
 b=w/tD3taiz5pElI9W1YohZZG2Wl9bckXxcMTc/uC2qThmr21/Yhrdtm/Wzt5nhi5EDB
 HUll6sdKR0yESJ8/Cov/Psm85NQBRgGB29hfJdZaSEvfTPQLPj1z7ZdYSoWHpJzYSumH
 +fAKTgD4ucBRIHgtJFfOslPxS30rCGR1oH44oqZ6Elct3HRbAA/u578FO//XcuvYgotk
 F1XH5NJ82+Il/uS/xej4Y0AnC29QH1VEQGFXFadSJQ4/TOgmWBEZzYT+sOfU9E1RWrLu
 ijGgySPVT0r14Av2uEEV/d8dJ094Kdi51iC3ip5qNY8boHWkpYUFQ1JyZPXS0BlOZiXj
 d9qQ==
X-Gm-Message-State: AFqh2kpkKuYw6NVf6dkxKqIG2YDQjdRmNNAzDOHICbfbIy9RoNqjGNDe
 /UxTQhRzzrL1CvPOc/D8UzIDcwMbw2WhCTdYUxM=
X-Google-Smtp-Source: AMrXdXuE0mA0a5beSu7kR+h55N7zRNPT9zXoMGW6u/7Q8EalF0r55KdVpBqjN/42xP98OSAXzS1VK80zAguFzatRIs4=
X-Received: by 2002:a05:6871:4593:b0:150:d9aa:4011 with SMTP id
 nl19-20020a056871459300b00150d9aa4011mr351570oab.96.1673981388073; Tue, 17
 Jan 2023 10:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20230117181524.915372-1-gpiccoli@igalia.com>
 <20230117181524.915372-2-gpiccoli@igalia.com>
In-Reply-To: <20230117181524.915372-2-gpiccoli@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Jan 2023 13:49:34 -0500
Message-ID: <CADnq5_OE9eURUJ2LwyOrTbrNBSd--Nhc330UFV-Z0-d4q7VOPA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amdgpu/vcn: Remove redundant indirect SRAM HW
 model check
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: Lazar Lijo <Lijo.Lazar@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Sonny Jiang <sonny.jiang@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Alex Deucher <Alexander.Deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Tue, Jan 17, 2023 at 1:15 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> The HW model validation that guards the indirect SRAM checking in the
> VCN code path is redundant - there's no model that's not included in the
> switch, making it useless in practice [0].
>
> So, let's remove this switch statement for good.
>
> [0] lore.kernel.org/amd-gfx/MN0PR12MB61013D20B8A2263B22AE1BCFE2C19@MN0PR12MB6101.namprd12.prod.outlook.com
>
> Suggested-by: Alex Deucher <Alexander.Deucher@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Cc: James Zhu <James.Zhu@amd.com>
> Cc: Lazar Lijo <Lijo.Lazar@amd.com>
> Cc: Leo Liu <leo.liu@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>
>
> V3:
> * Added Mario's review tag and Alex's suggested tag - thanks
> for the reminder Mario!
>
> V2:
> * Changed the approach after ML discussion- instead of cleaning up
> the switch statement, removed it entirely - special thanks to Alex
> and Mario for the feedback!
>
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 81 +------------------------
>  1 file changed, 3 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 1b1a3c9e1863..02d428ddf2f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -110,84 +110,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>         for (i = 0; i < adev->vcn.num_vcn_inst; i++)
>                 atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
>
> -       switch (adev->ip_versions[UVD_HWIP][0]) {
> -       case IP_VERSION(1, 0, 0):
> -       case IP_VERSION(1, 0, 1):
> -       case IP_VERSION(2, 5, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(2, 2, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(2, 6, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(2, 0, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(2, 0, 2):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 0, 0):
> -       case IP_VERSION(3, 0, 64):
> -       case IP_VERSION(3, 0, 192):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 0, 2):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 0, 16):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 0, 33):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 1, 1):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 1, 2):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(4, 0, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(4, 0, 2):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(4, 0, 4):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       default:
> -               return -EINVAL;
> -       }
> +       if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> +           (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> +               adev->vcn.indirect_sram = true;
>
>         hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
>         adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
> --
> 2.39.0
>
