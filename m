Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61965A702FE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A648D10E3A2;
	Tue, 25 Mar 2025 13:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CseAqFYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABDA10E398;
 Tue, 25 Mar 2025 13:59:37 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3032a9c7cfeso1103815a91.1; 
 Tue, 25 Mar 2025 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742911177; x=1743515977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHsIjWZRxIowHqARUdyK/Q6E9HTzh2JqRCdqVXBheyA=;
 b=CseAqFYq0DdRtXJrh8/K8AAIYFfgCAABqqHR8ruOcZsQBqMh05PLuXEAn0Cu/1OjSX
 F5mvID0GXSsd5NT5T/2gI8EKscuuIckun9flX0FTfkInNJHaT8RQYniARV3xu9hfjmRC
 X34rhtN8rx8kjyTp/ILQL88LPov7P8jpxOY/hMeh5chmoU/CLBK93uUmRe2vGgJGu7nn
 NBx0k4z9C0n31eTuz8+6I/HMc/V26s8PDoO+KjtIHq5H++ZXvUNmK9MIHdyKrjRpTOna
 d9bLxmPUHH32jDt/zHrDYaqwE63WVylNNamiiIXL4tNcF6IqTcbwhYibKi7+fYmrGbLc
 FtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742911177; x=1743515977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHsIjWZRxIowHqARUdyK/Q6E9HTzh2JqRCdqVXBheyA=;
 b=PFyFvKMtcVqW8MX+zEUADNskgZSfI3iTUzaJ+vfcXyGkQJyveGIYnbyxeAzkIGpyfA
 LtP08p7oKjclyvGAh3j1vtaiWq0TvoxN8WvqPkaxqgTYtno1GKj5EIcq8rdU+aNAosAW
 Ig55KsBvaq8MaAlfhSl96+kwJjMKvx/BUqdY1HTuaM6HsnneubymUS8FDkTJkdLocubo
 wTjIe4AIgrmZf6uy2fpyoaohguFBlk9BgKnEsXnMf626LEcZmdqEenS6Hb7tlj8K8aHK
 cS4cD6+0xZcPnAS+ug4fT5vqent5JyxUYub7Pl+yOx3AVl/CYded0Kh252W2wSNDqqPQ
 qupg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Pi4cehJRtNS3kd2FTry9GiSxv9dwJCk8p8ES6rIMMTv6Z+CceUXXuqF/fHmzw+GB1NXOhc1s@lists.freedesktop.org,
 AJvYcCXx7qPDcRk/GZx9/jCYkXBDVd0THZjQ2RqcemwgbaScbubLFCuD/FxNtl4e6JBRN8A0Q74rWWZpkKAr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd5uelQdbtAABjvHREhXSJFxV67G2l5jWWI2K72O+xBhxCZAvn
 kOEfTQ+9Pn7rwwalNxwpEKVcDEYvFA65nGHtamWasWCIawPjv+bAyFhTy9a4XM5QuL0LmzWmc0o
 6l+5T4hDlQ9AeyftJuMOYcYOp2BBbcw==
X-Gm-Gg: ASbGncsH8pA67O6mseHI0CRqm5+uHkMNjV6DxYF+fZWDdufLrAIQ63FL7XV8/tB/6+o
 +XfPJii7e6xNwfKFdTCHHQPcewbgHmAr0cHDFCzDoif6eeMU9gaMNAEd5Ft2nJh269XhBxtrFIR
 qVJ2RWIPOVF910G2Fo9RpCLnZc6Q==
X-Google-Smtp-Source: AGHT+IEfw9fQiARD33qNKgdpANhLby4iyXGm+mVQBe4FVd4RKDFeJ8Ytyp8GZMyNmTl8igpKa6GusLQI3v0pAWc2T40=
X-Received: by 2002:a17:90b:1a86:b0:2ff:4be6:c5bd with SMTP id
 98e67ed59e1d1-3036b4de998mr1762409a91.8.1742911176367; Tue, 25 Mar 2025
 06:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250325000723.366365-1-andres.emb.sys@gmail.com>
 <85bda3bf-eaed-4eac-97ca-92c6301c0f9b@amd.com>
 <CADnq5_OQEA07TNXdJy5wfViAk2dp-LNvaQQbT2UCs7BtcokgQg@mail.gmail.com>
 <436be94f-2aab-4d15-9322-01ee72d46337@amd.com>
In-Reply-To: <436be94f-2aab-4d15-9322-01ee72d46337@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Mar 2025 09:59:24 -0400
X-Gm-Features: AQ5f1JopC53LeQUmK-6XBQ6Dh2FJeRaDctQ0VghHhPEWQdFgRyI_T4s2DYsketU
Message-ID: <CADnq5_M3OyXkrut=pf+mdmQQDbVLD5w2tc_q=WMwDmtyEM4sDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Replace deprecated function strcpy() with
 strscpy()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>, alexander.deucher@amd.com,
 airlied@gmail.com, 
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

On Tue, Mar 25, 2025 at 9:50=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 25.03.25 um 14:30 schrieb Alex Deucher:
> > On Tue, Mar 25, 2025 at 4:38=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Alex shouldn't be try to completely nuke the CGS functions?
> > Sure, but it would need to be replaced with something else so I'm not
> > sure it's worth the effort since it's only used by a few older GPUs.
>
> Well how about at least nuking this code here? Take a closer look it's tr=
ying to pull in firmware from "radeon/*".
>
> That is certainly not used :)

Yes, that can be removed.

Alex

>
> Christian.
>
> >
> > Alex
> >
> >> Christian.
> >>
> >> Am 25.03.25 um 01:07 schrieb Andres Urian Florez:
> >>> Instead of using the strcpy() deprecated function to populate the
> >>> fw_name, use the strscpy() function
> >>>
> >>> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#=
strcpy
> >>>
> >>> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> >>> ---
> >>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 68 ++++++++++++-----------=
--
> >>>  1 file changed, 34 insertions(+), 34 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_cgs.c
> >>> index 68bce6a6d09d..525e53c94f4f 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> >>> @@ -253,16 +253,16 @@ static int amdgpu_cgs_get_firmware_info(struct =
cgs_device *cgs_device,
> >>>               if (!adev->pm.fw) {
> >>>                       switch (adev->asic_type) {
> >>>                       case CHIP_TAHITI:
> >>> -                             strcpy(fw_name, "radeon/tahiti_smc.bin"=
);
> >>> +                             strscpy(fw_name, "radeon/tahiti_smc.bin=
");
> >>>                               break;
> >>>                       case CHIP_PITCAIRN:
> >>>                               if ((adev->pdev->revision =3D=3D 0x81) =
&&
> >>>                                   ((adev->pdev->device =3D=3D 0x6810)=
 ||
> >>>                                   (adev->pdev->device =3D=3D 0x6811))=
) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "radeon/pitcair=
n_k_smc.bin");
> >>> +                                     strscpy(fw_name, "radeon/pitcai=
rn_k_smc.bin");
> >>>                               } else {
> >>> -                                     strcpy(fw_name, "radeon/pitcair=
n_smc.bin");
> >>> +                                     strscpy(fw_name, "radeon/pitcai=
rn_smc.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_VERDE:
> >>> @@ -276,9 +276,9 @@ static int amdgpu_cgs_get_firmware_info(struct cg=
s_device *cgs_device,
> >>>                                       ((adev->pdev->device =3D=3D 0x6=
823) ||
> >>>                                       (adev->pdev->device =3D=3D 0x68=
2b)))) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "radeon/verde_k=
_smc.bin");
> >>> +                                     strscpy(fw_name, "radeon/verde_=
k_smc.bin");
> >>>                               } else {
> >>> -                                     strcpy(fw_name, "radeon/verde_s=
mc.bin");
> >>> +                                     strscpy(fw_name, "radeon/verde_=
smc.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_OLAND:
> >>> @@ -290,9 +290,9 @@ static int amdgpu_cgs_get_firmware_info(struct cg=
s_device *cgs_device,
> >>>                                   ((adev->pdev->revision =3D=3D 0x83)=
 &&
> >>>                                       (adev->pdev->device =3D=3D 0x66=
10))) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "radeon/oland_k=
_smc.bin");
> >>> +                                     strscpy(fw_name, "radeon/oland_=
k_smc.bin");
> >>>                               } else {
> >>> -                                     strcpy(fw_name, "radeon/oland_s=
mc.bin");
> >>> +                                     strscpy(fw_name, "radeon/oland_=
smc.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_HAINAN:
> >>> @@ -304,13 +304,13 @@ static int amdgpu_cgs_get_firmware_info(struct =
cgs_device *cgs_device,
> >>>                                       (adev->pdev->device =3D=3D 0x66=
65) ||
> >>>                                        (adev->pdev->device =3D=3D 0x6=
667)))) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "radeon/hainan_=
k_smc.bin");
> >>> +                                     strscpy(fw_name, "radeon/hainan=
_k_smc.bin");
> >>>                               } else if ((adev->pdev->revision =3D=3D=
 0xc3) &&
> >>>                                        (adev->pdev->device =3D=3D 0x6=
665)) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "radeon/banks_k=
_2_smc.bin");
> >>> +                                     strscpy(fw_name, "radeon/banks_=
k_2_smc.bin");
> >>>                               } else {
> >>> -                                     strcpy(fw_name, "radeon/hainan_=
smc.bin");
> >>> +                                     strscpy(fw_name, "radeon/hainan=
_smc.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_BONAIRE:
> >>> @@ -318,17 +318,17 @@ static int amdgpu_cgs_get_firmware_info(struct =
cgs_device *cgs_device,
> >>>                                       (adev->pdev->revision =3D=3D 0x=
81) ||
> >>>                                       (adev->pdev->device =3D=3D 0x66=
5f)) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "amdgpu/bonaire=
_k_smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/bonair=
e_k_smc.bin");
> >>>                               } else {
> >>> -                                     strcpy(fw_name, "amdgpu/bonaire=
_smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/bonair=
e_smc.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_HAWAII:
> >>>                               if (adev->pdev->revision =3D=3D 0x80) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "amdgpu/hawaii_=
k_smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/hawaii=
_k_smc.bin");
> >>>                               } else {
> >>> -                                     strcpy(fw_name, "amdgpu/hawaii_=
smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/hawaii=
_smc.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_TOPAZ:
> >>> @@ -338,76 +338,76 @@ static int amdgpu_cgs_get_firmware_info(struct =
cgs_device *cgs_device,
> >>>                                   ((adev->pdev->device =3D=3D 0x6900)=
 && (adev->pdev->revision =3D=3D 0xD1)) ||
> >>>                                   ((adev->pdev->device =3D=3D 0x6900)=
 && (adev->pdev->revision =3D=3D 0xD3))) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "amdgpu/topaz_k=
_smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/topaz_=
k_smc.bin");
> >>>                               } else
> >>> -                                     strcpy(fw_name, "amdgpu/topaz_s=
mc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/topaz_=
smc.bin");
> >>>                               break;
> >>>                       case CHIP_TONGA:
> >>>                               if (((adev->pdev->device =3D=3D 0x6939)=
 && (adev->pdev->revision =3D=3D 0xf1)) ||
> >>>                                   ((adev->pdev->device =3D=3D 0x6938)=
 && (adev->pdev->revision =3D=3D 0xf1))) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "amdgpu/tonga_k=
_smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/tonga_=
k_smc.bin");
> >>>                               } else
> >>> -                                     strcpy(fw_name, "amdgpu/tonga_s=
mc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/tonga_=
smc.bin");
> >>>                               break;
> >>>                       case CHIP_FIJI:
> >>> -                             strcpy(fw_name, "amdgpu/fiji_smc.bin");
> >>> +                             strscpy(fw_name, "amdgpu/fiji_smc.bin")=
;
> >>>                               break;
> >>>                       case CHIP_POLARIS11:
> >>>                               if (type =3D=3D CGS_UCODE_ID_SMU) {
> >>>                                       if (ASICID_IS_P21(adev->pdev->d=
evice, adev->pdev->revision)) {
> >>>                                               info->is_kicker =3D tru=
e;
> >>> -                                             strcpy(fw_name, "amdgpu=
/polaris11_k_smc.bin");
> >>> +                                             strscpy(fw_name, "amdgp=
u/polaris11_k_smc.bin");
> >>>                                       } else if (ASICID_IS_P31(adev->=
pdev->device, adev->pdev->revision)) {
> >>>                                               info->is_kicker =3D tru=
e;
> >>> -                                             strcpy(fw_name, "amdgpu=
/polaris11_k2_smc.bin");
> >>> +                                             strscpy(fw_name, "amdgp=
u/polaris11_k2_smc.bin");
> >>>                                       } else {
> >>> -                                             strcpy(fw_name, "amdgpu=
/polaris11_smc.bin");
> >>> +                                             strscpy(fw_name, "amdgp=
u/polaris11_smc.bin");
> >>>                                       }
> >>>                               } else if (type =3D=3D CGS_UCODE_ID_SMU=
_SK) {
> >>> -                                     strcpy(fw_name, "amdgpu/polaris=
11_smc_sk.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/polari=
s11_smc_sk.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_POLARIS10:
> >>>                               if (type =3D=3D CGS_UCODE_ID_SMU) {
> >>>                                       if (ASICID_IS_P20(adev->pdev->d=
evice, adev->pdev->revision)) {
> >>>                                               info->is_kicker =3D tru=
e;
> >>> -                                             strcpy(fw_name, "amdgpu=
/polaris10_k_smc.bin");
> >>> +                                             strscpy(fw_name, "amdgp=
u/polaris10_k_smc.bin");
> >>>                                       } else if (ASICID_IS_P30(adev->=
pdev->device, adev->pdev->revision)) {
> >>>                                               info->is_kicker =3D tru=
e;
> >>> -                                             strcpy(fw_name, "amdgpu=
/polaris10_k2_smc.bin");
> >>> +                                             strscpy(fw_name, "amdgp=
u/polaris10_k2_smc.bin");
> >>>                                       } else {
> >>> -                                             strcpy(fw_name, "amdgpu=
/polaris10_smc.bin");
> >>> +                                             strscpy(fw_name, "amdgp=
u/polaris10_smc.bin");
> >>>                                       }
> >>>                               } else if (type =3D=3D CGS_UCODE_ID_SMU=
_SK) {
> >>> -                                     strcpy(fw_name, "amdgpu/polaris=
10_smc_sk.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/polari=
s10_smc_sk.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_POLARIS12:
> >>>                               if (ASICID_IS_P23(adev->pdev->device, a=
dev->pdev->revision)) {
> >>>                                       info->is_kicker =3D true;
> >>> -                                     strcpy(fw_name, "amdgpu/polaris=
12_k_smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/polari=
s12_k_smc.bin");
> >>>                               } else {
> >>> -                                     strcpy(fw_name, "amdgpu/polaris=
12_smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/polari=
s12_smc.bin");
> >>>                               }
> >>>                               break;
> >>>                       case CHIP_VEGAM:
> >>> -                             strcpy(fw_name, "amdgpu/vegam_smc.bin")=
;
> >>> +                             strscpy(fw_name, "amdgpu/vegam_smc.bin"=
);
> >>>                               break;
> >>>                       case CHIP_VEGA10:
> >>>                               if ((adev->pdev->device =3D=3D 0x687f) =
&&
> >>>                                       ((adev->pdev->revision =3D=3D 0=
xc0) ||
> >>>                                       (adev->pdev->revision =3D=3D 0x=
c1) ||
> >>>                                       (adev->pdev->revision =3D=3D 0x=
c3)))
> >>> -                                     strcpy(fw_name, "amdgpu/vega10_=
acg_smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/vega10=
_acg_smc.bin");
> >>>                               else
> >>> -                                     strcpy(fw_name, "amdgpu/vega10_=
smc.bin");
> >>> +                                     strscpy(fw_name, "amdgpu/vega10=
_smc.bin");
> >>>                               break;
> >>>                       case CHIP_VEGA12:
> >>> -                             strcpy(fw_name, "amdgpu/vega12_smc.bin"=
);
> >>> +                             strscpy(fw_name, "amdgpu/vega12_smc.bin=
");
> >>>                               break;
> >>>                       case CHIP_VEGA20:
> >>> -                             strcpy(fw_name, "amdgpu/vega20_smc.bin"=
);
> >>> +                             strscpy(fw_name, "amdgpu/vega20_smc.bin=
");
> >>>                               break;
> >>>                       default:
> >>>                               DRM_ERROR("SMC firmware not supported\n=
");
>
