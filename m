Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1A36A0BFE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 15:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6F810E4F8;
	Thu, 23 Feb 2023 14:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983CA10E4F0;
 Thu, 23 Feb 2023 14:38:46 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-17264e9b575so6579769fac.9; 
 Thu, 23 Feb 2023 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89NsqED1qF/po/TfxBNhjGb/jmRTrx5vpNyDKSLECZo=;
 b=nugu40U/fOag+rkXZn2YUuoTYJqJRiRuCYQg6KWSgX3z6NyJZaPj0S5vywrlIqhbnd
 d6usVAPisI/85pqpaRLofv9SX36rBae78b19JSa8FMG79ZsU4nO1OtT+ob3/hv8YeuI/
 xzYoiRQYrffO2j66iZhcqBEJgjuvDcrgcC56heEyUcesHAsqKXc65Oo1RcSqcpuEwXnu
 5oO1170mpOn+IwNjtkSSBKyMtMt4pONokRreuQM7J1Ekc2wYN7l7H262kDQQz44SU7le
 Lbwklslo6gREViMLAw/eU29qOLcI/RBujv3PcujGr9t9cklZhLfrjkZKajYKUvkDZg14
 jg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=89NsqED1qF/po/TfxBNhjGb/jmRTrx5vpNyDKSLECZo=;
 b=V0QMTZBtc+/XcVQgfzt4VOSFsz2Xwya06qiaM/4BvqQUVAw/78ytMRs/PP1ges1uJ7
 MFIslWfKEaLO/H8LEtoVB6KlzzDa9q0Bas68UsUm6aqVld+aea8nvjyYWMvswr4APO+5
 Fei0o/MBODcA58Fy6SLp6SqK8ixS6d8uLRuzPpE+V9BxgLwPN30glxQa4TJjtm6VTh5r
 WPLPJS/rHCAoOI49HrbYT/EfoXugWD4cr8rtA9HR9Ys8GLYLbwwxg7TH62w4oQRAeiKd
 fptwDgPOMSNbpJC0fRtk5fcTe7JrZFBPTMEiTn5IStn4sNbkRWnoWa67iz7BeY7LvWo0
 ezqw==
X-Gm-Message-State: AO0yUKWvA15b4OPITMUjmh7docgOgeueywoUSBgU4cxxvrPnzCMWUja/
 Fsk+mEHxxgraD98dqX1RcyTIxMeD6GzuPdIHyto=
X-Google-Smtp-Source: AK7set+KLT2r3rBnZPapukBmtA/EjG5tO3KzBKTBeiIuotbag24KGdSOJM9a9xWivFfnMxaCddrYo7zKyJPEgzz5YOM=
X-Received: by 2002:a05:6871:6a0:b0:172:3bf5:2855 with SMTP id
 l32-20020a05687106a000b001723bf52855mr1127648oao.96.1677163125808; Thu, 23
 Feb 2023 06:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20230217181409.218008-1-arthurgrillo@riseup.net>
 <20230217181409.218008-2-arthurgrillo@riseup.net>
In-Reply-To: <20230217181409.218008-2-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Feb 2023 09:38:33 -0500
Message-ID: <CADnq5_PP4O4HuZ5GDhRx9m5BV1W7X77f6ciNqXj4k_m3VHeVFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/amd/display: Fix implicit enum conversion
To: Arthur Grillo <arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch doesn't apply.  Please make sure you are using drm-next or
linux-next.

Alex

On Fri, Feb 17, 2023 at 1:15 PM Arthur Grillo <arthurgrillo@riseup.net> wro=
te:
>
> Make implicit enum conversion to avoid -Wenum-conversion warning, such
> as:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:=
4109:88: warning: implicit conversion from =E2=80=98enum <anonymous>=E2=80=
=99 to =E2=80=98enum odm_combine_mode=E2=80=99 [-Wenum-conversion]
>  4109 |                                                 locals->ODMCombin=
eEnablePerState[i][k] =3D true;
>       |                                                                  =
                      ^
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  .../amd/display/dc/dml/dcn20/display_mode_vba_20.c   |  9 +++++----
>  .../amd/display/dc/dml/dcn20/display_mode_vba_20v2.c | 11 ++++++-----
>  .../amd/display/dc/dml/dcn21/display_mode_vba_21.c   | 12 ++++++------
>  3 files changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20=
.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> index d3b5b6fedf04..1b47249f01d8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> @@ -26,6 +26,7 @@
>  #include "../display_mode_lib.h"
>  #include "display_mode_vba_20.h"
>  #include "../dml_inline_defs.h"
> +#include "dml/display_mode_enums.h"
>
>  /*
>   * NOTE:
> @@ -3897,14 +3898,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(=
struct display_mode_lib *mode_l
>                                         mode_lib->vba.PlaneRequiredDISPCL=
KWithODMCombine =3D mode_lib->vba.PixelClock[k] / 2
>                                                         * (1 + mode_lib->=
vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>
> -                               locals->ODMCombineEnablePerState[i][k] =
=3D false;
> +                               locals->ODMCombineEnablePerState[i][k] =
=3D dm_odm_combine_mode_disabled;
>                                 mode_lib->vba.PlaneRequiredDISPCLK =3D mo=
de_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>                                 if (mode_lib->vba.ODMCapability) {
>                                         if (locals->PlaneRequiredDISPCLKW=
ithoutODMCombine > mode_lib->vba.MaxDispclkRoundedDownToDFSGranularity) {
> -                                               locals->ODMCombineEnableP=
erState[i][k] =3D true;
> +                                               locals->ODMCombineEnableP=
erState[i][k] =3D dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequir=
edDISPCLK =3D mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->HActive[k] > D=
CN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] =3D=3D dm_420) {
> -                                               locals->ODMCombineEnableP=
erState[i][k] =3D true;
> +                                               locals->ODMCombineEnableP=
erState[i][k] =3D dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequir=
edDISPCLK =3D mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         }
>                                 }
> @@ -3957,7 +3958,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(st=
ruct display_mode_lib *mode_l
>                                 locals->RequiredDISPCLK[i][j] =3D 0.0;
>                                 locals->DISPCLK_DPPCLK_Support[i][j] =3D =
true;
>                                 for (k =3D 0; k <=3D mode_lib->vba.Number=
OfActivePlanes - 1; k++) {
> -                                       locals->ODMCombineEnablePerState[=
i][k] =3D false;
> +                                       locals->ODMCombineEnablePerState[=
i][k] =3D dm_odm_combine_mode_disabled;
>                                         if (locals->SwathWidthYSingleDPP[=
k] <=3D locals->MaximumSwathWidth[k]) {
>                                                 locals->NoOfDPP[i][j][k] =
=3D 1;
>                                                 locals->RequiredDPPCLK[i]=
[j][k] =3D locals->MinDPPCLKUsingSingleDPP[k]
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20=
v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> index edd098c7eb92..4781bf82eec6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> @@ -26,6 +26,7 @@
>  #include "../display_mode_lib.h"
>  #include "display_mode_vba_20v2.h"
>  #include "../dml_inline_defs.h"
> +#include "dml/display_mode_enums.h"
>
>  /*
>   * NOTE:
> @@ -4008,17 +4009,17 @@ void dml20v2_ModeSupportAndSystemConfigurationFul=
l(struct display_mode_lib *mode
>                                         mode_lib->vba.PlaneRequiredDISPCL=
KWithODMCombine =3D mode_lib->vba.PixelClock[k] / 2
>                                                         * (1 + mode_lib->=
vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>
> -                               locals->ODMCombineEnablePerState[i][k] =
=3D false;
> +                               locals->ODMCombineEnablePerState[i][k] =
=3D dm_odm_combine_mode_disabled;
>                                 mode_lib->vba.PlaneRequiredDISPCLK =3D mo=
de_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>                                 if (mode_lib->vba.ODMCapability) {
>                                         if (locals->PlaneRequiredDISPCLKW=
ithoutODMCombine > MaxMaxDispclkRoundedDown) {
> -                                               locals->ODMCombineEnableP=
erState[i][k] =3D true;
> +                                               locals->ODMCombineEnableP=
erState[i][k] =3D dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequir=
edDISPCLK =3D mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->DSCEnabled[k] =
&& (locals->HActive[k] > DCN20_MAX_DSC_IMAGE_WIDTH)) {
> -                                               locals->ODMCombineEnableP=
erState[i][k] =3D true;
> +                                               locals->ODMCombineEnableP=
erState[i][k] =3D dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequir=
edDISPCLK =3D mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->HActive[k] > D=
CN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] =3D=3D dm_420) {
> -                                               locals->ODMCombineEnableP=
erState[i][k] =3D true;
> +                                               locals->ODMCombineEnableP=
erState[i][k] =3D dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequir=
edDISPCLK =3D mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         }
>                                 }
> @@ -4071,7 +4072,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(=
struct display_mode_lib *mode
>                                 locals->RequiredDISPCLK[i][j] =3D 0.0;
>                                 locals->DISPCLK_DPPCLK_Support[i][j] =3D =
true;
>                                 for (k =3D 0; k <=3D mode_lib->vba.Number=
OfActivePlanes - 1; k++) {
> -                                       locals->ODMCombineEnablePerState[=
i][k] =3D false;
> +                                       locals->ODMCombineEnablePerState[=
i][k] =3D dm_odm_combine_mode_disabled;
>                                         if (locals->SwathWidthYSingleDPP[=
k] <=3D locals->MaximumSwathWidth[k]) {
>                                                 locals->NoOfDPP[i][j][k] =
=3D 1;
>                                                 locals->RequiredDPPCLK[i]=
[j][k] =3D locals->MinDPPCLKUsingSingleDPP[k]
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21=
.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> index 1d84ae50311d..b7c2844d0cbe 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> @@ -4102,17 +4102,17 @@ void dml21_ModeSupportAndSystemConfigurationFull(=
struct display_mode_lib *mode_l
>                                         mode_lib->vba.PlaneRequiredDISPCL=
KWithODMCombine =3D mode_lib->vba.PixelClock[k] / 2
>                                                         * (1 + mode_lib->=
vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>
> -                               locals->ODMCombineEnablePerState[i][k] =
=3D false;
> +                               locals->ODMCombineEnablePerState[i][k] =
=3D dm_odm_combine_mode_disabled;
>                                 mode_lib->vba.PlaneRequiredDISPCLK =3D mo=
de_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>                                 if (mode_lib->vba.ODMCapability) {
>                                         if (locals->PlaneRequiredDISPCLKW=
ithoutODMCombine > MaxMaxDispclkRoundedDown) {
> -                                               locals->ODMCombineEnableP=
erState[i][k] =3D true;
> +                                               locals->ODMCombineEnableP=
erState[i][k] =3D dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequir=
edDISPCLK =3D mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->DSCEnabled[k] =
&& (locals->HActive[k] > DCN21_MAX_DSC_IMAGE_WIDTH)) {
> -                                               locals->ODMCombineEnableP=
erState[i][k] =3D true;
> +                                               locals->ODMCombineEnableP=
erState[i][k] =3D dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequir=
edDISPCLK =3D mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->HActive[k] > D=
CN21_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] =3D=3D dm_420) {
> -                                               locals->ODMCombineEnableP=
erState[i][k] =3D true;
> +                                               locals->ODMCombineEnableP=
erState[i][k] =3D dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequir=
edDISPCLK =3D mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         }
>                                 }
> @@ -4165,7 +4165,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(st=
ruct display_mode_lib *mode_l
>                                 locals->RequiredDISPCLK[i][j] =3D 0.0;
>                                 locals->DISPCLK_DPPCLK_Support[i][j] =3D =
true;
>                                 for (k =3D 0; k <=3D mode_lib->vba.Number=
OfActivePlanes - 1; k++) {
> -                                       locals->ODMCombineEnablePerState[=
i][k] =3D false;
> +                                       locals->ODMCombineEnablePerState[=
i][k] =3D dm_odm_combine_mode_disabled;
>                                         if (locals->SwathWidthYSingleDPP[=
k] <=3D locals->MaximumSwathWidth[k]) {
>                                                 locals->NoOfDPP[i][j][k] =
=3D 1;
>                                                 locals->RequiredDPPCLK[i]=
[j][k] =3D locals->MinDPPCLKUsingSingleDPP[k]
> @@ -5230,7 +5230,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(st=
ruct display_mode_lib *mode_l
>                         mode_lib->vba.ODMCombineEnabled[k] =3D
>                                         locals->ODMCombineEnablePerState[=
mode_lib->vba.VoltageLevel][k];
>                 } else {
> -                       mode_lib->vba.ODMCombineEnabled[k] =3D false;
> +                       mode_lib->vba.ODMCombineEnabled[k] =3D dm_odm_com=
bine_mode_disabled;
>                 }
>                 mode_lib->vba.DSCEnabled[k] =3D
>                                 locals->RequiresDSC[mode_lib->vba.Voltage=
Level][k];
> --
> 2.39.2
>
