Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD6772CB7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0395110E34B;
	Mon,  7 Aug 2023 17:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE92010E34B;
 Mon,  7 Aug 2023 17:22:31 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-56cc461f34fso2822167eaf.0; 
 Mon, 07 Aug 2023 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428951; x=1692033751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tdiT4VDFwEWB7gXAPktsqljyYxoKDZsI+pliCIWNBKQ=;
 b=sq0kRQ+cYhoTN4ibTazfI3lKdSnU5a9uzGkj1ndxEhIbDKbavoAD0G1dE5zZ+F0X3J
 x7DXk4NLGQyj+ps3xDE6TdwL2TeeVjHXGpV6DIOagKlPNfNiqK5yso4W7d7w/TDjCqeD
 v96FwIeBKk8g6MaAhbEQ1B16PTDrabTq+doldAUbRQRcewkL4fYYQ1a2E9f/w+li3NvE
 nLTMhI0iSvdayvRthG10b+nl/ZKYIU7dhurR8pOnliiy9YS0UJhoVFbFLTs5vE1nvaBV
 fc6YSG/J16ANEEE+V2nKQD0vA0zbCeElVNcG1Q0R7Wk0O4Yca/gzGLo1J2DK9j05eTO1
 F2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428951; x=1692033751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tdiT4VDFwEWB7gXAPktsqljyYxoKDZsI+pliCIWNBKQ=;
 b=H5w4YFvYTykRQdU4iLXXg9Oh/9+BpDJ8ug8L3xHvSaoU1e5qPY3tdka7GqY2hirqBx
 tHzBG/mG7DTJsTZe4cjbs/VEP7pGfeDF3WHMzITPQy9P/p3IxaVKW0HMJ235HEEa48Ii
 4wiHlaChk5fgLCFAop0rcOUOYpc4LmXdvwJslTw73CauzqDLdNVdF7v2f1r2ZVS48lbd
 0T4MgPjKj5FVD8oGh5DCBL0HL1DHxrCxrUkWwVgaLcE+uQfXH04vQqGOfVRgYFdwXgq/
 aQeaT4oz6RJ76ZDfa89alNktMZsCn0e4eeNCr9accXP5K+Nlh4862vuLYNX9ACW944UJ
 dMPw==
X-Gm-Message-State: AOJu0Yx83we+VJXTPG5i4ousbaaqGKFHh3mDo7kFGi2g0VWvdoSq5Myf
 /bz6ZDHQz3cDDJv6YNsl4qMJub+zI9kj6v3qxhY=
X-Google-Smtp-Source: AGHT+IF9DSieLDJ6wkuhVPEfT0WAsY+ArX+WPqVB+kikaHFxvekHPQvooC1UarJCEEPloluOY2IppngCAPeUPb1xJlo=
X-Received: by 2002:a05:6808:189b:b0:3a7:2a94:73f6 with SMTP id
 bi27-20020a056808189b00b003a72a9473f6mr13171907oib.49.1691428950972; Mon, 07
 Aug 2023 10:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230802065804.12360-1-sunran001@208suo.com>
In-Reply-To: <20230802065804.12360-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:22:20 -0400
Message-ID: <CADnq5_Ntw2+Ett+JVPtye1RH4yi8WBD3si7_CqfErvC9keUi1A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in uvd_v7_0.c
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

On Wed, Aug 2, 2023 at 2:58=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that ':' (ctx:VxE)
> that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/uvd_v7_0.c
> index abaa4463e906..86d1d46e1e5e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -679,11 +679,11 @@ static void uvd_v7_0_mc_resume(struct amdgpu_device=
 *adev)
>                 if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP) {
>                         WREG32_SOC15(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_B=
AR_LOW,
>                                 i =3D=3D 0 ?
> -                               adev->firmware.ucode[AMDGPU_UCODE_ID_UVD]=
.tmr_mc_addr_lo:
> +                               adev->firmware.ucode[AMDGPU_UCODE_ID_UVD]=
.tmr_mc_addr_lo :
>                                 adev->firmware.ucode[AMDGPU_UCODE_ID_UVD1=
].tmr_mc_addr_lo);
>                         WREG32_SOC15(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_B=
AR_HIGH,
>                                 i =3D=3D 0 ?
> -                               adev->firmware.ucode[AMDGPU_UCODE_ID_UVD]=
.tmr_mc_addr_hi:
> +                               adev->firmware.ucode[AMDGPU_UCODE_ID_UVD]=
.tmr_mc_addr_hi :
>                                 adev->firmware.ucode[AMDGPU_UCODE_ID_UVD1=
].tmr_mc_addr_hi);
>                         WREG32_SOC15(UVD, i, mmUVD_VCPU_CACHE_OFFSET0, 0)=
;
>                         offset =3D 0;
> @@ -1908,8 +1908,7 @@ static void uvd_v7_0_set_irq_funcs(struct amdgpu_de=
vice *adev)
>         }
>  }
>
> -const struct amdgpu_ip_block_version uvd_v7_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version uvd_v7_0_ip_block =3D {
>                 .type =3D AMD_IP_BLOCK_TYPE_UVD,
>                 .major =3D 7,
>                 .minor =3D 0,
> --
> 2.17.1
>
