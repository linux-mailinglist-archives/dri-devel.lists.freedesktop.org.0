Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A435215D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 23:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6556ED7D;
	Thu,  1 Apr 2021 21:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884B66ED7D;
 Thu,  1 Apr 2021 21:12:14 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 c24-20020a9d6c980000b02902662e210895so2831303otr.9; 
 Thu, 01 Apr 2021 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M3/tEWKm2WNngayfE+mn8rCJF6DRzknNbizlXk5hWAQ=;
 b=quWAVivmqSnYqJErkZGmKg9qwlpZD3NQ8AWJiUrOuHYpbkMvu/Jndmq0HqRPwlxsz4
 Rt5IOu51LuPwwabACYkOb07TK/5OGUtYknO4J7ASyFgdWUwRbJOcbTjfR/Tjam+fg51V
 ftj5p6/qb9ztnkL0HTnkOa6dG3lKOa4BtQmgPW6OW0C1elEFHh827ChEOCIAZmAg8zqb
 2L+Ee7xKZzvK4dHH8EQj5nuaUKzUBRhQYXmoDTdztd442mUBJ+KEfW1s16zQ8Kzo/Tbi
 JrYuOAv2X/vJuBBPS77iArRHAybNK+hRRZlvbW0fHhlApStKbUqEI51I5K6Xj0RdzX/N
 y4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M3/tEWKm2WNngayfE+mn8rCJF6DRzknNbizlXk5hWAQ=;
 b=nIEw2a1dfbh6DqRUV6WUv/97CHoxQLqjOP3jMDk6+5pv7qnqFUwZ/7lMtFruo3Bry/
 DT4N80qZS8b44OzsF4m8OJwNROD7A/EwBLrKcDS/LX0IFJFM1hhAOpUz7G8ag4fK6xB7
 dAKCVrqlKeeRHwQSj5Xf+0xfXDEncn8rtAnbnRRIaBB513zooNZprsrZ8cAFz6h9g1Lh
 Kx/ZCp4/GLrooXjYoHXqGIrAdgqYpKJmrhuBJNlnFIOZKpF87mwVveIHRLmeS5/Q0vpP
 gn8YRAyfDJx/Y2r014cNoDKZc/NsDVEi4UZW7J8rLM+wuioldtg01i4BxTtecBOckkXF
 1nPg==
X-Gm-Message-State: AOAM532/heJxl+6rwSWhNJy9yfODA1CjO+8ZgQYG7bQa90mwqZdYhyfR
 QJNpUUNwNQBmFgrKpaPA3W+o4wwqId48oi1LRxc=
X-Google-Smtp-Source: ABdhPJwPQCH1cqO+Ky2uLyFBpFc2K35zocKbr6hWOWDYO5+4rEGoObsafNjofT3lm8rxgqts5uaXkx5PaX2npc5iF/Y=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr8496383ots.23.1617311533912;
 Thu, 01 Apr 2021 14:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210331131143.60652-1-bernard@vivo.com>
In-Reply-To: <20210331131143.60652-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Apr 2021 17:12:02 -0400
Message-ID: <CADnq5_Pc0iDmmuH5oTa0_T23EJGfhqf+zzedXL2n_QME5MrjQw@mail.gmail.com>
Subject: Re: [PATCH] amd/amdgpu: code refactoring to clean code style a bit
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, Deepak R Varma <mh12gx2825@gmail.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code has been dropped.

Alex

On Wed, Mar 31, 2021 at 9:36 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> Fix checkpatch.pl warning:
> Too many leading tabs - consider code refactoring
> WARNING: Too many leading tabs - consider code refactoring
> +                                               for (j = 0; j < profile->ucLeakageBinNum; j++) {
>
> WARNING: Too many leading tabs - consider code refactoring
> +                                                       if (vbios_voltage_id <= leakage_bin[j]) {
>
> WARNING: Too many leading tabs - consider code refactoring
> +                                               for (j = 0; j < profile->ucLeakageBinNum; j++) {
>
> WARNING: Too many leading tabs - consider code refactoring
> +                                                       if (vbios_voltage_id <= leakage_bin[j]) {
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 84 ++++++++------------
>  1 file changed, 35 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> index 86add0f4ea4d..9968ff8ddc9c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> @@ -1283,65 +1283,51 @@ int amdgpu_atombios_get_leakage_vddc_based_on_leakage_params(struct amdgpu_devic
>         profile = (ATOM_ASIC_PROFILING_INFO_V2_1 *)
>                 (adev->mode_info.atom_context->bios + data_offset);
>
> -       switch (frev) {
> -       case 1:
> +       if ((frev != 2) || (crev != 1)) {
> +               DRM_ERROR("Unknown table version %d, %d\n", frev, crev);
>                 return -EINVAL;
> -       case 2:
> -               switch (crev) {
> -               case 1:
> -                       if (size < sizeof(ATOM_ASIC_PROFILING_INFO_V2_1))
> -                               return -EINVAL;
> -                       leakage_bin = (u16 *)
> -                               (adev->mode_info.atom_context->bios + data_offset +
> -                                le16_to_cpu(profile->usLeakageBinArrayOffset));
> -                       vddc_id_buf = (u16 *)
> -                               (adev->mode_info.atom_context->bios + data_offset +
> -                                le16_to_cpu(profile->usElbVDDC_IdArrayOffset));
> -                       vddc_buf = (u16 *)
> -                               (adev->mode_info.atom_context->bios + data_offset +
> -                                le16_to_cpu(profile->usElbVDDC_LevelArrayOffset));
> -                       vddci_id_buf = (u16 *)
> -                               (adev->mode_info.atom_context->bios + data_offset +
> -                                le16_to_cpu(profile->usElbVDDCI_IdArrayOffset));
> -                       vddci_buf = (u16 *)
> -                               (adev->mode_info.atom_context->bios + data_offset +
> -                                le16_to_cpu(profile->usElbVDDCI_LevelArrayOffset));
> -
> -                       if (profile->ucElbVDDC_Num > 0) {
> -                               for (i = 0; i < profile->ucElbVDDC_Num; i++) {
> -                                       if (vddc_id_buf[i] == virtual_voltage_id) {
> -                                               for (j = 0; j < profile->ucLeakageBinNum; j++) {
> -                                                       if (vbios_voltage_id <= leakage_bin[j]) {
> -                                                               *vddc = vddc_buf[j * profile->ucElbVDDC_Num + i];
> -                                                               break;
> -                                                       }
> -                                               }
> +       }
> +
> +       if (size < sizeof(ATOM_ASIC_PROFILING_INFO_V2_1))
> +               return -EINVAL;
> +
> +       leakage_bin = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
> +                le16_to_cpu(profile->usLeakageBinArrayOffset));
> +       vddc_id_buf = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
> +                le16_to_cpu(profile->usElbVDDC_IdArrayOffset));
> +       vddc_buf = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
> +                le16_to_cpu(profile->usElbVDDC_LevelArrayOffset));
> +       vddci_id_buf = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
> +                le16_to_cpu(profile->usElbVDDCI_IdArrayOffset));
> +       vddci_buf = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
> +                le16_to_cpu(profile->usElbVDDCI_LevelArrayOffset));
> +
> +       if (profile->ucElbVDDC_Num > 0) {
> +               for (i = 0; i < profile->ucElbVDDC_Num; i++) {
> +                       if (vddc_id_buf[i] == virtual_voltage_id) {
> +                               for (j = 0; j < profile->ucLeakageBinNum; j++) {
> +                                       if (vbios_voltage_id <= leakage_bin[j]) {
> +                                               *vddc = vddc_buf[j * profile->ucElbVDDC_Num + i];
>                                                 break;
>                                         }
>                                 }
> +                               break;
>                         }
> -                       if (profile->ucElbVDDCI_Num > 0) {
> -                               for (i = 0; i < profile->ucElbVDDCI_Num; i++) {
> -                                       if (vddci_id_buf[i] == virtual_voltage_id) {
> -                                               for (j = 0; j < profile->ucLeakageBinNum; j++) {
> -                                                       if (vbios_voltage_id <= leakage_bin[j]) {
> -                                                               *vddci = vddci_buf[j * profile->ucElbVDDCI_Num + i];
> -                                                               break;
> -                                                       }
> -                                               }
> +               }
> +       }
> +
> +       if (profile->ucElbVDDCI_Num > 0) {
> +               for (i = 0; i < profile->ucElbVDDCI_Num; i++) {
> +                       if (vddci_id_buf[i] == virtual_voltage_id) {
> +                               for (j = 0; j < profile->ucLeakageBinNum; j++) {
> +                                       if (vbios_voltage_id <= leakage_bin[j]) {
> +                                               *vddci = vddci_buf[j * profile->ucElbVDDCI_Num + i];
>                                                 break;
>                                         }
>                                 }
> +                               break;
>                         }
> -                       break;
> -               default:
> -                       DRM_ERROR("Unknown table version %d, %d\n", frev, crev);
> -                       return -EINVAL;
>                 }
> -               break;
> -       default:
> -               DRM_ERROR("Unknown table version %d, %d\n", frev, crev);
> -               return -EINVAL;
>         }
>
>         return 0;
> --
> 2.31.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
