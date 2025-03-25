Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C5A701CF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE60A10E576;
	Tue, 25 Mar 2025 13:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bk6bMMI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84D10E574;
 Tue, 25 Mar 2025 13:30:24 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ff5544af03so1706441a91.1; 
 Tue, 25 Mar 2025 06:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742909424; x=1743514224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q722jxqTVT+g05tQCH2LFkIe6kWPI1juC49lLz8NS48=;
 b=bk6bMMI7/2cKMcxzVGEeRfK6GABYjN6ndE5/bkgglvB3+7/h1GBVObXs+yPV75zheY
 4ex4hChbZAdm4bIV17KLeDXh+VYQR2u8I5oafGzcT60dLWiIiXaXQiGH2ykADIr+bpRW
 fYLlvExo0wP43MS1J3FA+FJ1jMyRPbCgrRCVNK3hBCzqnknVnqEwRxTD9pzUJzxQqKTa
 PlbBuWtPVSyTlQdnWmJW4Wnlj6HNV/2jsy/zI4maJeEhZqqxMLYWx9gYPSs878zljo8i
 ZZ8GgQMnf01iRNnRLRyJ+wtrLcKOVPWQ0Xgmq66n8VD+duwLIt/UKQDb7tYc4vLFAoOi
 F/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742909424; x=1743514224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q722jxqTVT+g05tQCH2LFkIe6kWPI1juC49lLz8NS48=;
 b=WON25lEaYdJidMh/AYdHOWbhHA9lwpXDyIano+//O6qzSgJCvDL86kd1+lSjlQWmTc
 gGx9s8bHxsAnmOGmSTg/XaLrFSO5naxpMKbu4WYGMRRpJtV3zUtgCsZD3I9OqzEkb/O4
 Qp9oiyrarnI5Poh/wqKEcjcjcA9JwVg5H0TQbrt2Ic118EO4Ou9VpMypcsMmXV6zUwvf
 K2hSesmMkSyYJlWpYedmm0TO8ySerUKWC5OFUaAot+Ti0tcurmLmAZXrlWLuB35eOp5F
 BMccCTgL2xKB8Qv+YqYriwjcyBOk7znzB3i6k6VRbcu9x1OuWXMujyyUVngaDw+wCGhH
 p1kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgtox36W9LrAs6xVwCUbHTMo5wRZn+IJRWwli2refaUrC8H+q1uGeHEGjSBQ/xT8DkpFyvlJV1@lists.freedesktop.org,
 AJvYcCXOE31Ry67jHxJlIiYPdhRv1ulAHqvSaifO+SWP/irLmg9l4ot9xIhH5Nyc40/VJbYJTHeaAhwc5JDW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj7FtMNiBL0gq0UU4MQK0vwAufWpSDuxjqnaIS2JYUV0/gh1Bm
 JHY805gQLZ/uQOEVw0ic57tHooZubhQOlpMaQs+I87c7cRIWsQduMlrhAKaYtrmIcXmHv9OhERf
 1dc3FszEa0FzZYeJY7nOzKyzwezM=
X-Gm-Gg: ASbGncsCpC5fPI3a1EkFWPrjrd37Msr3nKYpIO3uUixCPOavmaA4ZPoMoG7S3GzrCHW
 aVO2KhtVpRCxQ0bBTNVt9MdoVVX7hOu/MOb4l7BtHbPvEYNStpQrDKrhHcx/15bjET/le5s43eF
 pLOcDi0Zbj3Muw7OmaAYmB/J4aZeN6BK2eFgr6
X-Google-Smtp-Source: AGHT+IFEwU0mzQzwopVChbmLTLgCHCdSEM0Oiqahw3awoVPc8dmuryHOr1+zVb9LRkoPMKr/uXX4e/1cbyOcLA5DyrQ=
X-Received: by 2002:a17:90b:4b51:b0:2fa:6055:17e7 with SMTP id
 98e67ed59e1d1-3030ff111e8mr10630014a91.8.1742909423599; Tue, 25 Mar 2025
 06:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250325000723.366365-1-andres.emb.sys@gmail.com>
 <85bda3bf-eaed-4eac-97ca-92c6301c0f9b@amd.com>
In-Reply-To: <85bda3bf-eaed-4eac-97ca-92c6301c0f9b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Mar 2025 09:30:10 -0400
X-Gm-Features: AQ5f1JraLUR9qpob73hgVIVippaYdrSK1QKjYozttCiCMgHcKic32VXlQjSG_e4
Message-ID: <CADnq5_OQEA07TNXdJy5wfViAk2dp-LNvaQQbT2UCs7BtcokgQg@mail.gmail.com>
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

On Tue, Mar 25, 2025 at 4:38=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Alex shouldn't be try to completely nuke the CGS functions?

Sure, but it would need to be replaced with something else so I'm not
sure it's worth the effort since it's only used by a few older GPUs.

Alex

>
> Christian.
>
> Am 25.03.25 um 01:07 schrieb Andres Urian Florez:
> > Instead of using the strcpy() deprecated function to populate the
> > fw_name, use the strscpy() function
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rcpy
> >
> > Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 68 ++++++++++++-------------
> >  1 file changed, 34 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_cgs.c
> > index 68bce6a6d09d..525e53c94f4f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> > @@ -253,16 +253,16 @@ static int amdgpu_cgs_get_firmware_info(struct cg=
s_device *cgs_device,
> >               if (!adev->pm.fw) {
> >                       switch (adev->asic_type) {
> >                       case CHIP_TAHITI:
> > -                             strcpy(fw_name, "radeon/tahiti_smc.bin");
> > +                             strscpy(fw_name, "radeon/tahiti_smc.bin")=
;
> >                               break;
> >                       case CHIP_PITCAIRN:
> >                               if ((adev->pdev->revision =3D=3D 0x81) &&
> >                                   ((adev->pdev->device =3D=3D 0x6810) |=
|
> >                                   (adev->pdev->device =3D=3D 0x6811))) =
{
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "radeon/pitcairn_=
k_smc.bin");
> > +                                     strscpy(fw_name, "radeon/pitcairn=
_k_smc.bin");
> >                               } else {
> > -                                     strcpy(fw_name, "radeon/pitcairn_=
smc.bin");
> > +                                     strscpy(fw_name, "radeon/pitcairn=
_smc.bin");
> >                               }
> >                               break;
> >                       case CHIP_VERDE:
> > @@ -276,9 +276,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_=
device *cgs_device,
> >                                       ((adev->pdev->device =3D=3D 0x682=
3) ||
> >                                       (adev->pdev->device =3D=3D 0x682b=
)))) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "radeon/verde_k_s=
mc.bin");
> > +                                     strscpy(fw_name, "radeon/verde_k_=
smc.bin");
> >                               } else {
> > -                                     strcpy(fw_name, "radeon/verde_smc=
.bin");
> > +                                     strscpy(fw_name, "radeon/verde_sm=
c.bin");
> >                               }
> >                               break;
> >                       case CHIP_OLAND:
> > @@ -290,9 +290,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_=
device *cgs_device,
> >                                   ((adev->pdev->revision =3D=3D 0x83) &=
&
> >                                       (adev->pdev->device =3D=3D 0x6610=
))) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "radeon/oland_k_s=
mc.bin");
> > +                                     strscpy(fw_name, "radeon/oland_k_=
smc.bin");
> >                               } else {
> > -                                     strcpy(fw_name, "radeon/oland_smc=
.bin");
> > +                                     strscpy(fw_name, "radeon/oland_sm=
c.bin");
> >                               }
> >                               break;
> >                       case CHIP_HAINAN:
> > @@ -304,13 +304,13 @@ static int amdgpu_cgs_get_firmware_info(struct cg=
s_device *cgs_device,
> >                                       (adev->pdev->device =3D=3D 0x6665=
) ||
> >                                        (adev->pdev->device =3D=3D 0x666=
7)))) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "radeon/hainan_k_=
smc.bin");
> > +                                     strscpy(fw_name, "radeon/hainan_k=
_smc.bin");
> >                               } else if ((adev->pdev->revision =3D=3D 0=
xc3) &&
> >                                        (adev->pdev->device =3D=3D 0x666=
5)) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "radeon/banks_k_2=
_smc.bin");
> > +                                     strscpy(fw_name, "radeon/banks_k_=
2_smc.bin");
> >                               } else {
> > -                                     strcpy(fw_name, "radeon/hainan_sm=
c.bin");
> > +                                     strscpy(fw_name, "radeon/hainan_s=
mc.bin");
> >                               }
> >                               break;
> >                       case CHIP_BONAIRE:
> > @@ -318,17 +318,17 @@ static int amdgpu_cgs_get_firmware_info(struct cg=
s_device *cgs_device,
> >                                       (adev->pdev->revision =3D=3D 0x81=
) ||
> >                                       (adev->pdev->device =3D=3D 0x665f=
)) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "amdgpu/bonaire_k=
_smc.bin");
> > +                                     strscpy(fw_name, "amdgpu/bonaire_=
k_smc.bin");
> >                               } else {
> > -                                     strcpy(fw_name, "amdgpu/bonaire_s=
mc.bin");
> > +                                     strscpy(fw_name, "amdgpu/bonaire_=
smc.bin");
> >                               }
> >                               break;
> >                       case CHIP_HAWAII:
> >                               if (adev->pdev->revision =3D=3D 0x80) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "amdgpu/hawaii_k_=
smc.bin");
> > +                                     strscpy(fw_name, "amdgpu/hawaii_k=
_smc.bin");
> >                               } else {
> > -                                     strcpy(fw_name, "amdgpu/hawaii_sm=
c.bin");
> > +                                     strscpy(fw_name, "amdgpu/hawaii_s=
mc.bin");
> >                               }
> >                               break;
> >                       case CHIP_TOPAZ:
> > @@ -338,76 +338,76 @@ static int amdgpu_cgs_get_firmware_info(struct cg=
s_device *cgs_device,
> >                                   ((adev->pdev->device =3D=3D 0x6900) &=
& (adev->pdev->revision =3D=3D 0xD1)) ||
> >                                   ((adev->pdev->device =3D=3D 0x6900) &=
& (adev->pdev->revision =3D=3D 0xD3))) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "amdgpu/topaz_k_s=
mc.bin");
> > +                                     strscpy(fw_name, "amdgpu/topaz_k_=
smc.bin");
> >                               } else
> > -                                     strcpy(fw_name, "amdgpu/topaz_smc=
.bin");
> > +                                     strscpy(fw_name, "amdgpu/topaz_sm=
c.bin");
> >                               break;
> >                       case CHIP_TONGA:
> >                               if (((adev->pdev->device =3D=3D 0x6939) &=
& (adev->pdev->revision =3D=3D 0xf1)) ||
> >                                   ((adev->pdev->device =3D=3D 0x6938) &=
& (adev->pdev->revision =3D=3D 0xf1))) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "amdgpu/tonga_k_s=
mc.bin");
> > +                                     strscpy(fw_name, "amdgpu/tonga_k_=
smc.bin");
> >                               } else
> > -                                     strcpy(fw_name, "amdgpu/tonga_smc=
.bin");
> > +                                     strscpy(fw_name, "amdgpu/tonga_sm=
c.bin");
> >                               break;
> >                       case CHIP_FIJI:
> > -                             strcpy(fw_name, "amdgpu/fiji_smc.bin");
> > +                             strscpy(fw_name, "amdgpu/fiji_smc.bin");
> >                               break;
> >                       case CHIP_POLARIS11:
> >                               if (type =3D=3D CGS_UCODE_ID_SMU) {
> >                                       if (ASICID_IS_P21(adev->pdev->dev=
ice, adev->pdev->revision)) {
> >                                               info->is_kicker =3D true;
> > -                                             strcpy(fw_name, "amdgpu/p=
olaris11_k_smc.bin");
> > +                                             strscpy(fw_name, "amdgpu/=
polaris11_k_smc.bin");
> >                                       } else if (ASICID_IS_P31(adev->pd=
ev->device, adev->pdev->revision)) {
> >                                               info->is_kicker =3D true;
> > -                                             strcpy(fw_name, "amdgpu/p=
olaris11_k2_smc.bin");
> > +                                             strscpy(fw_name, "amdgpu/=
polaris11_k2_smc.bin");
> >                                       } else {
> > -                                             strcpy(fw_name, "amdgpu/p=
olaris11_smc.bin");
> > +                                             strscpy(fw_name, "amdgpu/=
polaris11_smc.bin");
> >                                       }
> >                               } else if (type =3D=3D CGS_UCODE_ID_SMU_S=
K) {
> > -                                     strcpy(fw_name, "amdgpu/polaris11=
_smc_sk.bin");
> > +                                     strscpy(fw_name, "amdgpu/polaris1=
1_smc_sk.bin");
> >                               }
> >                               break;
> >                       case CHIP_POLARIS10:
> >                               if (type =3D=3D CGS_UCODE_ID_SMU) {
> >                                       if (ASICID_IS_P20(adev->pdev->dev=
ice, adev->pdev->revision)) {
> >                                               info->is_kicker =3D true;
> > -                                             strcpy(fw_name, "amdgpu/p=
olaris10_k_smc.bin");
> > +                                             strscpy(fw_name, "amdgpu/=
polaris10_k_smc.bin");
> >                                       } else if (ASICID_IS_P30(adev->pd=
ev->device, adev->pdev->revision)) {
> >                                               info->is_kicker =3D true;
> > -                                             strcpy(fw_name, "amdgpu/p=
olaris10_k2_smc.bin");
> > +                                             strscpy(fw_name, "amdgpu/=
polaris10_k2_smc.bin");
> >                                       } else {
> > -                                             strcpy(fw_name, "amdgpu/p=
olaris10_smc.bin");
> > +                                             strscpy(fw_name, "amdgpu/=
polaris10_smc.bin");
> >                                       }
> >                               } else if (type =3D=3D CGS_UCODE_ID_SMU_S=
K) {
> > -                                     strcpy(fw_name, "amdgpu/polaris10=
_smc_sk.bin");
> > +                                     strscpy(fw_name, "amdgpu/polaris1=
0_smc_sk.bin");
> >                               }
> >                               break;
> >                       case CHIP_POLARIS12:
> >                               if (ASICID_IS_P23(adev->pdev->device, ade=
v->pdev->revision)) {
> >                                       info->is_kicker =3D true;
> > -                                     strcpy(fw_name, "amdgpu/polaris12=
_k_smc.bin");
> > +                                     strscpy(fw_name, "amdgpu/polaris1=
2_k_smc.bin");
> >                               } else {
> > -                                     strcpy(fw_name, "amdgpu/polaris12=
_smc.bin");
> > +                                     strscpy(fw_name, "amdgpu/polaris1=
2_smc.bin");
> >                               }
> >                               break;
> >                       case CHIP_VEGAM:
> > -                             strcpy(fw_name, "amdgpu/vegam_smc.bin");
> > +                             strscpy(fw_name, "amdgpu/vegam_smc.bin");
> >                               break;
> >                       case CHIP_VEGA10:
> >                               if ((adev->pdev->device =3D=3D 0x687f) &&
> >                                       ((adev->pdev->revision =3D=3D 0xc=
0) ||
> >                                       (adev->pdev->revision =3D=3D 0xc1=
) ||
> >                                       (adev->pdev->revision =3D=3D 0xc3=
)))
> > -                                     strcpy(fw_name, "amdgpu/vega10_ac=
g_smc.bin");
> > +                                     strscpy(fw_name, "amdgpu/vega10_a=
cg_smc.bin");
> >                               else
> > -                                     strcpy(fw_name, "amdgpu/vega10_sm=
c.bin");
> > +                                     strscpy(fw_name, "amdgpu/vega10_s=
mc.bin");
> >                               break;
> >                       case CHIP_VEGA12:
> > -                             strcpy(fw_name, "amdgpu/vega12_smc.bin");
> > +                             strscpy(fw_name, "amdgpu/vega12_smc.bin")=
;
> >                               break;
> >                       case CHIP_VEGA20:
> > -                             strcpy(fw_name, "amdgpu/vega20_smc.bin");
> > +                             strscpy(fw_name, "amdgpu/vega20_smc.bin")=
;
> >                               break;
> >                       default:
> >                               DRM_ERROR("SMC firmware not supported\n")=
;
>
