Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2D772CB2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789D010E1A0;
	Mon,  7 Aug 2023 17:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F14E10E1A0;
 Mon,  7 Aug 2023 17:21:48 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1bb954414e8so3650863fac.0; 
 Mon, 07 Aug 2023 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428907; x=1692033707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YvbsUJg0/MEi6rG+cUpAFNtn5WudefBqhX2T15JqJg=;
 b=ed1lHmdV820f17A4KM8vckb+CtmsQK+h8Na/No7yS6n8rRy92/oVzmqcGTuD+zm0j5
 c6KO4c4ZAHIaUqTRd4Jq/QxdveAcVWJMMhhXWnoiUuHV2uDzmoWABAL4jtoVrkdieqdX
 DvdPuBSLG/NC+MaWVyhOnGIflKlJDmuptwkQKdi8xPk31LKQJYvTavYfbLb+05F5TGJ8
 FgvhEDtssv3/jG168DMsO04k23WP8HE2zjqt51dC5n3nl2zUvWVvqvLJUcahraUXX5ha
 Yztyi+jc5YLth7eArr7EZogtQITjFmR+8RcUYRJV51nHiFAkCVB2Lr+PZiu6uJ7ayhG/
 KVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428907; x=1692033707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YvbsUJg0/MEi6rG+cUpAFNtn5WudefBqhX2T15JqJg=;
 b=lUymwtjAfJLQtolVMhwaP0TDLOjf1EkdAgxDlPxyk73j22KxZ8gTaLEobOHU4cM3nz
 Y9CA3uPc8AHYOk11DzUX3EWU7ZtoayAFRQOpNabn8AEUaZcVV4y6TUX7qYDaDYmC5rIl
 BXnWkNRN7kHu+2oQ8y8tgEgdySuZsWOOfpXxnsLXYdWB+3crNOwCiOoGRsg6VeCVRBhp
 qbNT0exFe3U2CTkXmHw0llbzFk9Clze5A66Rv8mFG+WdRGUhGxa7a5ViSnFQWKWxY29p
 ETJvjrGLWAoxLo8UhDA7l2dffTd8NdeB4nt1DCV/zfdjaUe8c06G90e8aHdaujMZC+0b
 4aDQ==
X-Gm-Message-State: AOJu0YxowmoQi91Nm8SGclwd/yS5VV2RCJpLnb0xN24qHI2ed9N+uyR1
 uRfaie7Yzs++RWCw10joTU7ZWkklQp6EXCYndaNheAdi
X-Google-Smtp-Source: AGHT+IHawkKgmlrHGsgRqcMkQZbxvKoqspEbzHp781Amg3VTbLYE3tUVZu5Y5/KQnXJrM1eeSgpKwe0EleAfxLnD29I=
X-Received: by 2002:a05:6870:c1cb:b0:1bf:4a66:d54f with SMTP id
 i11-20020a056870c1cb00b001bf4a66d54fmr11790002oad.56.1691428907356; Mon, 07
 Aug 2023 10:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230802065518.12271-1-sunran001@208suo.com>
In-Reply-To: <20230802065518.12271-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:21:36 -0400
Message-ID: <CADnq5_NOoz1ciFDqtbv54dRB2Bd_55sO-0kLnZXxBxxdT2cc_A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Clean up errors in amdgpu_cgs.c
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

Already fixed.

On Wed, Aug 2, 2023 at 2:55=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: switch and case should be at the same indent
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 64 ++++++++++++-------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_cgs.c
> index 456e385333b6..fafe7057a8c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> @@ -163,38 +163,38 @@ static uint16_t amdgpu_get_firmware_version(struct =
cgs_device *cgs_device,
>         uint16_t fw_version =3D 0;
>
>         switch (type) {
> -               case CGS_UCODE_ID_SDMA0:
> -                       fw_version =3D adev->sdma.instance[0].fw_version;
> -                       break;
> -               case CGS_UCODE_ID_SDMA1:
> -                       fw_version =3D adev->sdma.instance[1].fw_version;
> -                       break;
> -               case CGS_UCODE_ID_CP_CE:
> -                       fw_version =3D adev->gfx.ce_fw_version;
> -                       break;
> -               case CGS_UCODE_ID_CP_PFP:
> -                       fw_version =3D adev->gfx.pfp_fw_version;
> -                       break;
> -               case CGS_UCODE_ID_CP_ME:
> -                       fw_version =3D adev->gfx.me_fw_version;
> -                       break;
> -               case CGS_UCODE_ID_CP_MEC:
> -                       fw_version =3D adev->gfx.mec_fw_version;
> -                       break;
> -               case CGS_UCODE_ID_CP_MEC_JT1:
> -                       fw_version =3D adev->gfx.mec_fw_version;
> -                       break;
> -               case CGS_UCODE_ID_CP_MEC_JT2:
> -                       fw_version =3D adev->gfx.mec_fw_version;
> -                       break;
> -               case CGS_UCODE_ID_RLC_G:
> -                       fw_version =3D adev->gfx.rlc_fw_version;
> -                       break;
> -               case CGS_UCODE_ID_STORAGE:
> -                       break;
> -               default:
> -                       DRM_ERROR("firmware type %d do not have version\n=
", type);
> -                       break;
> +       case CGS_UCODE_ID_SDMA0:
> +               fw_version =3D adev->sdma.instance[0].fw_version;
> +               break;
> +       case CGS_UCODE_ID_SDMA1:
> +               fw_version =3D adev->sdma.instance[1].fw_version;
> +               break;
> +       case CGS_UCODE_ID_CP_CE:
> +               fw_version =3D adev->gfx.ce_fw_version;
> +               break;
> +       case CGS_UCODE_ID_CP_PFP:
> +               fw_version =3D adev->gfx.pfp_fw_version;
> +               break;
> +       case CGS_UCODE_ID_CP_ME:
> +               fw_version =3D adev->gfx.me_fw_version;
> +               break;
> +       case CGS_UCODE_ID_CP_MEC:
> +               fw_version =3D adev->gfx.mec_fw_version;
> +               break;
> +       case CGS_UCODE_ID_CP_MEC_JT1:
> +               fw_version =3D adev->gfx.mec_fw_version;
> +               break;
> +       case CGS_UCODE_ID_CP_MEC_JT2:
> +               fw_version =3D adev->gfx.mec_fw_version;
> +               break;
> +       case CGS_UCODE_ID_RLC_G:
> +               fw_version =3D adev->gfx.rlc_fw_version;
> +               break;
> +       case CGS_UCODE_ID_STORAGE:
> +               break;
> +       default:
> +               DRM_ERROR("firmware type %d do not have version\n", type)=
;
> +               break;
>         }
>         return fw_version;
>  }
> --
> 2.17.1
>
