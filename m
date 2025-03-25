Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07F3A70359
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 15:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9D310E57C;
	Tue, 25 Mar 2025 14:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sn5lhAS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43DC10E57E;
 Tue, 25 Mar 2025 14:15:06 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ff5f2c5924so1403866a91.2; 
 Tue, 25 Mar 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742912106; x=1743516906; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mCKU47dj2otELlNtayJc7yIJ8Hzjax+vXsoDrbo/fUE=;
 b=Sn5lhAS+b3ZiTEy5tENpqcjQv4N5aU5eBwfWpibPXRzOFBcq6KSt/6V3E4Xa1NEjPK
 obJfFOUyFKfhrVfJ8KD/bxlOW76AH5DBlcdwBKu76aRd/nWcfDe9eG8aBv/si8luSY7K
 kHpA0A8s8vuJarAnt8MAcBrONKvAy2M1djPjkdXUI7C8ksH+m2lsXEDLMGaoQ0j6p33N
 06jXvZ8Ro7U862DDJoLAXSYkQRuUrIKmylx6eeySqr1bk5aDfh8r6cLFllU+/oWuyLmc
 FnB0hxqor5ciB84K9cbZDzY2r4oTY13NYd/xH/ltHCUW9kNekXnnicJKfnntcHNd5GqK
 JauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742912106; x=1743516906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mCKU47dj2otELlNtayJc7yIJ8Hzjax+vXsoDrbo/fUE=;
 b=qSufSAsAB/80i9X8NwLV+p3IdvVK/8swkBfe2mvNMlMTIWICPJZ9N7JzvOnuQmMLHS
 A3DvkW0cwn+s/sX/+dAISqSUOCRJ2wVEhxIwracQGmlvgpAkcP0tdmkyLA5Lr/sluZpe
 aBuNNDibVtpurq570biageorN4pubZEV/g8QTj+oiTzqKh3oiqDSuB/xFFXBiQ9YGFay
 Cmsvvc7FbBehXkGd9rOmBeNdPuhgiB8dr+weyrqTrvetRQ6Fn4hkeqaPSBagh+kuOuGL
 ilaho5ZOziCIRtN1nkWjx/uXjul2dnHplKDVDfcYzqZ8ErA7R8/UJ/92+PGcWb4Z0jIH
 tRPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkwVoU9nYgwUMH3rHGPddBfzY7xlUt6RnQlWwaHnBmly4hT6EckEBDQ+FaNZbvqTRIBtLZ464e@lists.freedesktop.org,
 AJvYcCW8oXNao+DF+DwWrA44KdTJ0oH7YH7nVg9R8ChdbR2Dps0EW3OKVFQjvEsr6dlsxJ+Xx53BOTL7WAyL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ/IU/6huXVLMJSvnnZT5toISR9jEUngM4DNglUASSbXNQnMce
 /WVnyxT0fVz27WF9X+farLDQ5VeBRO/JSwLgjvikjBuZNud2U6Q+HvqYRAfPhTfhIZfeghbtCjo
 MoCEEdefnRjEVRFfV3ydu/shKRWuyCA==
X-Gm-Gg: ASbGnctpTH8pN8UKsTmWSUXF7hR1jLcN1n5IRE35CNK0CIHFNPVNxu11tPiWD9jYnFU
 mU/9VeNo+8mYydLxPHsbBY2nwUh9mLz31UiTaw1ox9i1d5HrQDU3+g1RR2yYmX+PDgMWYUtE/38
 hREYobpPJWB1L5N9dmxK6EiOBKow==
X-Google-Smtp-Source: AGHT+IENoNTT2vi+vx81CnNiKN/eCsH7p9pNWNefMo6VnWF4d5bjYJivy2kwVihxs9ql7UqSBZE/EIzvJ5YOwRCZ0hQ=
X-Received: by 2002:a17:90b:1811:b0:2ff:6bcf:5411 with SMTP id
 98e67ed59e1d1-3030fe52827mr10393858a91.1.1742912106018; Tue, 25 Mar 2025
 07:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250325000723.366365-1-andres.emb.sys@gmail.com>
In-Reply-To: <20250325000723.366365-1-andres.emb.sys@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Mar 2025 10:14:53 -0400
X-Gm-Features: AQ5f1JqAPTsSQjC_LnhDo8HUWP-Ttq1fkYL-D8DfQ-hqwgJfLlGcGFXIiF2Clv0
Message-ID: <CADnq5_MEEFwRM09qMkzU6SDssLEHn_BAE4+JXNDYvEXBHhQXsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Replace deprecated function strcpy() with
 strscpy()
To: Andres Urian Florez <andres.emb.sys@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, mario.limonciello@amd.com, arnd@arndb.de, Tim.Huang@amd.com, 
 skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Mar 24, 2025 at 8:08=E2=80=AFPM Andres Urian Florez
<andres.emb.sys@gmail.com> wrote:
>
> Instead of using the strcpy() deprecated function to populate the
> fw_name, use the strscpy() function
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strc=
py
>
> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 68 ++++++++++++-------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_cgs.c
> index 68bce6a6d09d..525e53c94f4f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> @@ -253,16 +253,16 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_=
device *cgs_device,
>                 if (!adev->pm.fw) {
>                         switch (adev->asic_type) {
>                         case CHIP_TAHITI:
> -                               strcpy(fw_name, "radeon/tahiti_smc.bin");
> +                               strscpy(fw_name, "radeon/tahiti_smc.bin")=
;
>                                 break;
>                         case CHIP_PITCAIRN:
>                                 if ((adev->pdev->revision =3D=3D 0x81) &&
>                                     ((adev->pdev->device =3D=3D 0x6810) |=
|
>                                     (adev->pdev->device =3D=3D 0x6811))) =
{
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "radeon/pitcairn_=
k_smc.bin");
> +                                       strscpy(fw_name, "radeon/pitcairn=
_k_smc.bin");
>                                 } else {
> -                                       strcpy(fw_name, "radeon/pitcairn_=
smc.bin");
> +                                       strscpy(fw_name, "radeon/pitcairn=
_smc.bin");
>                                 }
>                                 break;
>                         case CHIP_VERDE:
> @@ -276,9 +276,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_de=
vice *cgs_device,
>                                         ((adev->pdev->device =3D=3D 0x682=
3) ||
>                                         (adev->pdev->device =3D=3D 0x682b=
)))) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "radeon/verde_k_s=
mc.bin");
> +                                       strscpy(fw_name, "radeon/verde_k_=
smc.bin");
>                                 } else {
> -                                       strcpy(fw_name, "radeon/verde_smc=
.bin");
> +                                       strscpy(fw_name, "radeon/verde_sm=
c.bin");
>                                 }
>                                 break;
>                         case CHIP_OLAND:
> @@ -290,9 +290,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_de=
vice *cgs_device,
>                                     ((adev->pdev->revision =3D=3D 0x83) &=
&
>                                         (adev->pdev->device =3D=3D 0x6610=
))) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "radeon/oland_k_s=
mc.bin");
> +                                       strscpy(fw_name, "radeon/oland_k_=
smc.bin");
>                                 } else {
> -                                       strcpy(fw_name, "radeon/oland_smc=
.bin");
> +                                       strscpy(fw_name, "radeon/oland_sm=
c.bin");
>                                 }
>                                 break;
>                         case CHIP_HAINAN:
> @@ -304,13 +304,13 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_=
device *cgs_device,
>                                         (adev->pdev->device =3D=3D 0x6665=
) ||
>                                          (adev->pdev->device =3D=3D 0x666=
7)))) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "radeon/hainan_k_=
smc.bin");
> +                                       strscpy(fw_name, "radeon/hainan_k=
_smc.bin");
>                                 } else if ((adev->pdev->revision =3D=3D 0=
xc3) &&
>                                          (adev->pdev->device =3D=3D 0x666=
5)) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "radeon/banks_k_2=
_smc.bin");
> +                                       strscpy(fw_name, "radeon/banks_k_=
2_smc.bin");
>                                 } else {
> -                                       strcpy(fw_name, "radeon/hainan_sm=
c.bin");
> +                                       strscpy(fw_name, "radeon/hainan_s=
mc.bin");
>                                 }
>                                 break;
>                         case CHIP_BONAIRE:
> @@ -318,17 +318,17 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_=
device *cgs_device,
>                                         (adev->pdev->revision =3D=3D 0x81=
) ||
>                                         (adev->pdev->device =3D=3D 0x665f=
)) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "amdgpu/bonaire_k=
_smc.bin");
> +                                       strscpy(fw_name, "amdgpu/bonaire_=
k_smc.bin");
>                                 } else {
> -                                       strcpy(fw_name, "amdgpu/bonaire_s=
mc.bin");
> +                                       strscpy(fw_name, "amdgpu/bonaire_=
smc.bin");
>                                 }
>                                 break;
>                         case CHIP_HAWAII:
>                                 if (adev->pdev->revision =3D=3D 0x80) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "amdgpu/hawaii_k_=
smc.bin");
> +                                       strscpy(fw_name, "amdgpu/hawaii_k=
_smc.bin");
>                                 } else {
> -                                       strcpy(fw_name, "amdgpu/hawaii_sm=
c.bin");
> +                                       strscpy(fw_name, "amdgpu/hawaii_s=
mc.bin");
>                                 }
>                                 break;
>                         case CHIP_TOPAZ:
> @@ -338,76 +338,76 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_=
device *cgs_device,
>                                     ((adev->pdev->device =3D=3D 0x6900) &=
& (adev->pdev->revision =3D=3D 0xD1)) ||
>                                     ((adev->pdev->device =3D=3D 0x6900) &=
& (adev->pdev->revision =3D=3D 0xD3))) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "amdgpu/topaz_k_s=
mc.bin");
> +                                       strscpy(fw_name, "amdgpu/topaz_k_=
smc.bin");
>                                 } else
> -                                       strcpy(fw_name, "amdgpu/topaz_smc=
.bin");
> +                                       strscpy(fw_name, "amdgpu/topaz_sm=
c.bin");
>                                 break;
>                         case CHIP_TONGA:
>                                 if (((adev->pdev->device =3D=3D 0x6939) &=
& (adev->pdev->revision =3D=3D 0xf1)) ||
>                                     ((adev->pdev->device =3D=3D 0x6938) &=
& (adev->pdev->revision =3D=3D 0xf1))) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "amdgpu/tonga_k_s=
mc.bin");
> +                                       strscpy(fw_name, "amdgpu/tonga_k_=
smc.bin");
>                                 } else
> -                                       strcpy(fw_name, "amdgpu/tonga_smc=
.bin");
> +                                       strscpy(fw_name, "amdgpu/tonga_sm=
c.bin");
>                                 break;
>                         case CHIP_FIJI:
> -                               strcpy(fw_name, "amdgpu/fiji_smc.bin");
> +                               strscpy(fw_name, "amdgpu/fiji_smc.bin");
>                                 break;
>                         case CHIP_POLARIS11:
>                                 if (type =3D=3D CGS_UCODE_ID_SMU) {
>                                         if (ASICID_IS_P21(adev->pdev->dev=
ice, adev->pdev->revision)) {
>                                                 info->is_kicker =3D true;
> -                                               strcpy(fw_name, "amdgpu/p=
olaris11_k_smc.bin");
> +                                               strscpy(fw_name, "amdgpu/=
polaris11_k_smc.bin");
>                                         } else if (ASICID_IS_P31(adev->pd=
ev->device, adev->pdev->revision)) {
>                                                 info->is_kicker =3D true;
> -                                               strcpy(fw_name, "amdgpu/p=
olaris11_k2_smc.bin");
> +                                               strscpy(fw_name, "amdgpu/=
polaris11_k2_smc.bin");
>                                         } else {
> -                                               strcpy(fw_name, "amdgpu/p=
olaris11_smc.bin");
> +                                               strscpy(fw_name, "amdgpu/=
polaris11_smc.bin");
>                                         }
>                                 } else if (type =3D=3D CGS_UCODE_ID_SMU_S=
K) {
> -                                       strcpy(fw_name, "amdgpu/polaris11=
_smc_sk.bin");
> +                                       strscpy(fw_name, "amdgpu/polaris1=
1_smc_sk.bin");
>                                 }
>                                 break;
>                         case CHIP_POLARIS10:
>                                 if (type =3D=3D CGS_UCODE_ID_SMU) {
>                                         if (ASICID_IS_P20(adev->pdev->dev=
ice, adev->pdev->revision)) {
>                                                 info->is_kicker =3D true;
> -                                               strcpy(fw_name, "amdgpu/p=
olaris10_k_smc.bin");
> +                                               strscpy(fw_name, "amdgpu/=
polaris10_k_smc.bin");
>                                         } else if (ASICID_IS_P30(adev->pd=
ev->device, adev->pdev->revision)) {
>                                                 info->is_kicker =3D true;
> -                                               strcpy(fw_name, "amdgpu/p=
olaris10_k2_smc.bin");
> +                                               strscpy(fw_name, "amdgpu/=
polaris10_k2_smc.bin");
>                                         } else {
> -                                               strcpy(fw_name, "amdgpu/p=
olaris10_smc.bin");
> +                                               strscpy(fw_name, "amdgpu/=
polaris10_smc.bin");
>                                         }
>                                 } else if (type =3D=3D CGS_UCODE_ID_SMU_S=
K) {
> -                                       strcpy(fw_name, "amdgpu/polaris10=
_smc_sk.bin");
> +                                       strscpy(fw_name, "amdgpu/polaris1=
0_smc_sk.bin");
>                                 }
>                                 break;
>                         case CHIP_POLARIS12:
>                                 if (ASICID_IS_P23(adev->pdev->device, ade=
v->pdev->revision)) {
>                                         info->is_kicker =3D true;
> -                                       strcpy(fw_name, "amdgpu/polaris12=
_k_smc.bin");
> +                                       strscpy(fw_name, "amdgpu/polaris1=
2_k_smc.bin");
>                                 } else {
> -                                       strcpy(fw_name, "amdgpu/polaris12=
_smc.bin");
> +                                       strscpy(fw_name, "amdgpu/polaris1=
2_smc.bin");
>                                 }
>                                 break;
>                         case CHIP_VEGAM:
> -                               strcpy(fw_name, "amdgpu/vegam_smc.bin");
> +                               strscpy(fw_name, "amdgpu/vegam_smc.bin");
>                                 break;
>                         case CHIP_VEGA10:
>                                 if ((adev->pdev->device =3D=3D 0x687f) &&
>                                         ((adev->pdev->revision =3D=3D 0xc=
0) ||
>                                         (adev->pdev->revision =3D=3D 0xc1=
) ||
>                                         (adev->pdev->revision =3D=3D 0xc3=
)))
> -                                       strcpy(fw_name, "amdgpu/vega10_ac=
g_smc.bin");
> +                                       strscpy(fw_name, "amdgpu/vega10_a=
cg_smc.bin");
>                                 else
> -                                       strcpy(fw_name, "amdgpu/vega10_sm=
c.bin");
> +                                       strscpy(fw_name, "amdgpu/vega10_s=
mc.bin");
>                                 break;
>                         case CHIP_VEGA12:
> -                               strcpy(fw_name, "amdgpu/vega12_smc.bin");
> +                               strscpy(fw_name, "amdgpu/vega12_smc.bin")=
;
>                                 break;
>                         case CHIP_VEGA20:
> -                               strcpy(fw_name, "amdgpu/vega20_smc.bin");
> +                               strscpy(fw_name, "amdgpu/vega20_smc.bin")=
;
>                                 break;
>                         default:
>                                 DRM_ERROR("SMC firmware not supported\n")=
;
> --
> 2.43.0
>
