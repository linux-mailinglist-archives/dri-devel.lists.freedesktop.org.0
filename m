Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683898A866
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D601110E2EA;
	Mon, 30 Sep 2024 15:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q5I2Cgi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0758F10E4F0;
 Mon, 30 Sep 2024 15:23:58 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3a1a22d0fe1so2088795ab.1; 
 Mon, 30 Sep 2024 08:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727709837; x=1728314637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbcQTVTfx3PIfcSyLQDeae8a/ZumYPEQcDGes/fyM8s=;
 b=Q5I2Cgi5uOTPbrYXTLlo0jrrTxZ6RJOXXbOguPdGd1xx0UJ9UmSR372zpEYGLR/LgB
 ejo6HWvmjvZ8MuVxVvw+jDUlN7YLA0nq/t2E6pbaTGpiNfjURo3goMrfp3EDdk0kmwWm
 3XX4fVpAPgL76rVOemz5/GPSnhK7uYLbsxsNqxycR2q2sdf+e9WPNOlFrMG3qJ+Yfg03
 QSAC3jfOBJ26KTxIWCFitRRKho6UFPy3HsYNkRqBBV5eGFBfH9fp//4f/abbS/O8f16J
 vfhkjB2J3hFXfJA1Npvi6+x1YIzPQeLplE0DFkNYQrTVQ+Ckpm+carshy9vT3lTprFNP
 CzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727709837; x=1728314637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbcQTVTfx3PIfcSyLQDeae8a/ZumYPEQcDGes/fyM8s=;
 b=GOQkP6XC4ZtIesDW9mg+oyExYctauVq0D0On5+UTDc6+okBUPS/gIh3kpmthJkjOac
 8RoaK1qOwe8uf9qNCJnRgzB7u9tk/PhjYY+GlL72TNX6FXXDbDejMA/U+fO1RPhh8deI
 YgfUTKDx+YLm4cl1eEMSBpqVYWs+JVWkNj68xCJqJQe1sNjqYGysUWjluQXsIDCq86kf
 49vr3Inw8z+EMl2PyfETfMHMLu0lsATsfue+6SIWbXcshkTvKRefj7NSu/v83jZEffH/
 M1gw+M9M1EhVS9QJajl7Oon+/4XfO7v9LVvEE47OHcTZQS3R5QDizrNIjvZeprLCYesp
 sFrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9rxHAHEpuGIU3EGoyc446ct5dPVRQsitCGYGPdqgAKHKFlF2Beh/uxwQWlD7dahwWNIrg9gwJl0+L@lists.freedesktop.org,
 AJvYcCWMUy47hM0Un5+CjUTl6izujjWkD5Ii5sDjkOAjUlBRedA+3qA8TY8pgKvdGgirqt1GCrTJ57Qw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTJ61I1tbovKb5ydDBipdYkABhNWs2KwrGKQz1jKl5YfdZc2+0
 XnACw/M6AY8iolex60Jbv8BSzRiuU6CSkv3EGwDDHgPmSIjcZ2B6yRt0YbMb3A4VvUIXw0MJFhR
 jNvoc3EaxJlA92MP80pjCATUKUhY=
X-Google-Smtp-Source: AGHT+IEz8P1r3qdrCP4qETVd0/8/7Pvp39fXazum2LXAAr2hBef75rnkTUEDHmc4hOfEBtOYa0meIU3eyT/B9o48lDM=
X-Received: by 2002:a05:6e02:1d14:b0:3a1:a227:c8a5 with SMTP id
 e9e14a558f8ab-3a34b4c7411mr17995495ab.5.1727709836781; Mon, 30 Sep 2024
 08:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240929210333.304747-1-linux@treblig.org>
In-Reply-To: <20240929210333.304747-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Sep 2024 11:23:44 -0400
Message-ID: <CADnq5_POYfHMgrbJvLyYbfHpz-Fp2WakoTdnWE3=RFrgq4sN1A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: Delete unused function and maths
 library
To: linux@treblig.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sun, Sep 29, 2024 at 5:28=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> We start with the function 'atomctrl_calculate_voltage_evv_on_sclk'
> which has been unused since 2016's commit
> e805ed83ba1c ("drm/amd/powerplay: delete useless files.")
>
> Remove it.
>
> It was the last user of the struct ATOM_ASIC_PROFILING_INFO_V3_4
> remove it.

Thanks.  I've applied the patch, but left the atombios.h structure in
place as it documents the vbios firmware data table structure which
might be useful for debugging.

Alex

>
> It was also the last user of the entire fixed point maths library in
> ppevvmath.h.
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/include/atombios.h        |  72 ---
>  .../drm/amd/pm/powerplay/hwmgr/ppatomctrl.c   | 428 -------------
>  .../drm/amd/pm/powerplay/hwmgr/ppatomctrl.h   |   2 -
>  .../drm/amd/pm/powerplay/hwmgr/ppevvmath.h    | 561 ------------------
>  4 files changed, 1063 deletions(-)
>  delete mode 100644 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
>
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd=
/include/atombios.h
> index b78360a71bc9..e810366a3c83 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -5432,78 +5432,6 @@ typedef struct  _ATOM_ASIC_PROFILING_INFO_V3_3
>    ULONG  ulSDCMargine;
>  }ATOM_ASIC_PROFILING_INFO_V3_3;
>
> -// for Fiji speed EVV algorithm
> -typedef struct  _ATOM_ASIC_PROFILING_INFO_V3_4
> -{
> -  ATOM_COMMON_TABLE_HEADER         asHeader;
> -  ULONG  ulEvvLkgFactor;
> -  ULONG  ulBoardCoreTemp;
> -  ULONG  ulMaxVddc;
> -  ULONG  ulMinVddc;
> -  ULONG  ulLoadLineSlop;
> -  ULONG  ulLeakageTemp;
> -  ULONG  ulLeakageVoltage;
> -  EFUSE_LINEAR_FUNC_PARAM sCACm;
> -  EFUSE_LINEAR_FUNC_PARAM sCACb;
> -  EFUSE_LOGISTIC_FUNC_PARAM sKt_b;
> -  EFUSE_LOGISTIC_FUNC_PARAM sKv_m;
> -  EFUSE_LOGISTIC_FUNC_PARAM sKv_b;
> -  USHORT usLkgEuseIndex;
> -  UCHAR  ucLkgEfuseBitLSB;
> -  UCHAR  ucLkgEfuseLength;
> -  ULONG  ulLkgEncodeLn_MaxDivMin;
> -  ULONG  ulLkgEncodeMax;
> -  ULONG  ulLkgEncodeMin;
> -  ULONG  ulEfuseLogisticAlpha;
> -  USHORT usPowerDpm0;
> -  USHORT usPowerDpm1;
> -  USHORT usPowerDpm2;
> -  USHORT usPowerDpm3;
> -  USHORT usPowerDpm4;
> -  USHORT usPowerDpm5;
> -  USHORT usPowerDpm6;
> -  USHORT usPowerDpm7;
> -  ULONG  ulTdpDerateDPM0;
> -  ULONG  ulTdpDerateDPM1;
> -  ULONG  ulTdpDerateDPM2;
> -  ULONG  ulTdpDerateDPM3;
> -  ULONG  ulTdpDerateDPM4;
> -  ULONG  ulTdpDerateDPM5;
> -  ULONG  ulTdpDerateDPM6;
> -  ULONG  ulTdpDerateDPM7;
> -  EFUSE_LINEAR_FUNC_PARAM sRoFuse;
> -  ULONG  ulEvvDefaultVddc;
> -  ULONG  ulEvvNoCalcVddc;
> -  USHORT usParamNegFlag;
> -  USHORT usSpeed_Model;
> -  ULONG  ulSM_A0;
> -  ULONG  ulSM_A1;
> -  ULONG  ulSM_A2;
> -  ULONG  ulSM_A3;
> -  ULONG  ulSM_A4;
> -  ULONG  ulSM_A5;
> -  ULONG  ulSM_A6;
> -  ULONG  ulSM_A7;
> -  UCHAR  ucSM_A0_sign;
> -  UCHAR  ucSM_A1_sign;
> -  UCHAR  ucSM_A2_sign;
> -  UCHAR  ucSM_A3_sign;
> -  UCHAR  ucSM_A4_sign;
> -  UCHAR  ucSM_A5_sign;
> -  UCHAR  ucSM_A6_sign;
> -  UCHAR  ucSM_A7_sign;
> -  ULONG ulMargin_RO_a;
> -  ULONG ulMargin_RO_b;
> -  ULONG ulMargin_RO_c;
> -  ULONG ulMargin_fixed;
> -  ULONG ulMargin_Fmax_mean;
> -  ULONG ulMargin_plat_mean;
> -  ULONG ulMargin_Fmax_sigma;
> -  ULONG ulMargin_plat_sigma;
> -  ULONG ulMargin_DC_sigma;
> -  ULONG ulReserved[8];            // Reserved for future ASIC
> -}ATOM_ASIC_PROFILING_INFO_V3_4;
> -
>  // for  Polaris10/Polaris11 speed EVV algorithm
>  typedef struct  _ATOM_ASIC_PROFILING_INFO_V3_5
>  {
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> index b56298d9da98..fe24219c3bf4 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> @@ -28,7 +28,6 @@
>  #include "ppatomctrl.h"
>  #include "atombios.h"
>  #include "cgs_common.h"
> -#include "ppevvmath.h"
>
>  #define MEM_ID_MASK           0xff000000
>  #define MEM_ID_SHIFT          24
> @@ -677,433 +676,6 @@ bool atomctrl_get_pp_assign_pin(
>         return bRet;
>  }
>
> -int atomctrl_calculate_voltage_evv_on_sclk(
> -               struct pp_hwmgr *hwmgr,
> -               uint8_t voltage_type,
> -               uint32_t sclk,
> -               uint16_t virtual_voltage_Id,
> -               uint16_t *voltage,
> -               uint16_t dpm_level,
> -               bool debug)
> -{
> -       ATOM_ASIC_PROFILING_INFO_V3_4 *getASICProfilingInfo;
> -       struct amdgpu_device *adev =3D hwmgr->adev;
> -       EFUSE_LINEAR_FUNC_PARAM sRO_fuse;
> -       EFUSE_LINEAR_FUNC_PARAM sCACm_fuse;
> -       EFUSE_LINEAR_FUNC_PARAM sCACb_fuse;
> -       EFUSE_LOGISTIC_FUNC_PARAM sKt_Beta_fuse;
> -       EFUSE_LOGISTIC_FUNC_PARAM sKv_m_fuse;
> -       EFUSE_LOGISTIC_FUNC_PARAM sKv_b_fuse;
> -       EFUSE_INPUT_PARAMETER sInput_FuseValues;
> -       READ_EFUSE_VALUE_PARAMETER sOutput_FuseValues;
> -
> -       uint32_t ul_RO_fused, ul_CACb_fused, ul_CACm_fused, ul_Kt_Beta_fu=
sed, ul_Kv_m_fused, ul_Kv_b_fused;
> -       fInt fSM_A0, fSM_A1, fSM_A2, fSM_A3, fSM_A4, fSM_A5, fSM_A6, fSM_=
A7;
> -       fInt fMargin_RO_a, fMargin_RO_b, fMargin_RO_c, fMargin_fixed, fMa=
rgin_FMAX_mean, fMargin_Plat_mean, fMargin_FMAX_sigma, fMargin_Plat_sigma, =
fMargin_DC_sigma;
> -       fInt fLkg_FT, repeat;
> -       fInt fMicro_FMAX, fMicro_CR, fSigma_FMAX, fSigma_CR, fSigma_DC, f=
DC_SCLK, fSquared_Sigma_DC, fSquared_Sigma_CR, fSquared_Sigma_FMAX;
> -       fInt fRLL_LoadLine, fDerateTDP, fVDDC_base, fA_Term, fC_Term, fB_=
Term, fRO_DC_margin;
> -       fInt fRO_fused, fCACm_fused, fCACb_fused, fKv_m_fused, fKv_b_fuse=
d, fKt_Beta_fused, fFT_Lkg_V0NORM;
> -       fInt fSclk_margin, fSclk, fEVV_V;
> -       fInt fV_min, fV_max, fT_prod, fLKG_Factor, fT_FT, fV_FT, fV_x, fT=
DP_Power, fTDP_Power_right, fTDP_Power_left, fTDP_Current, fV_NL;
> -       uint32_t ul_FT_Lkg_V0NORM;
> -       fInt fLn_MaxDivMin, fMin, fAverage, fRange;
> -       fInt fRoots[2];
> -       fInt fStepSize =3D GetScaledFraction(625, 100000);
> -
> -       int result;
> -
> -       getASICProfilingInfo =3D (ATOM_ASIC_PROFILING_INFO_V3_4 *)
> -                       smu_atom_get_data_table(hwmgr->adev,
> -                                       GetIndexIntoMasterTable(DATA, ASI=
C_ProfilingInfo),
> -                                       NULL, NULL, NULL);
> -
> -       if (!getASICProfilingInfo)
> -               return -1;
> -
> -       if (getASICProfilingInfo->asHeader.ucTableFormatRevision < 3 ||
> -           (getASICProfilingInfo->asHeader.ucTableFormatRevision =3D=3D =
3 &&
> -            getASICProfilingInfo->asHeader.ucTableContentRevision < 4))
> -               return -1;
> -
> -       /*-----------------------------------------------------------
> -        *GETTING MULTI-STEP PARAMETERS RELATED TO CURRENT DPM LEVEL
> -        *-----------------------------------------------------------
> -        */
> -       fRLL_LoadLine =3D Divide(getASICProfilingInfo->ulLoadLineSlop, 10=
00);
> -
> -       switch (dpm_level) {
> -       case 1:
> -               fDerateTDP =3D GetScaledFraction(le32_to_cpu(getASICProfi=
lingInfo->ulTdpDerateDPM1), 1000);
> -               break;
> -       case 2:
> -               fDerateTDP =3D GetScaledFraction(le32_to_cpu(getASICProfi=
lingInfo->ulTdpDerateDPM2), 1000);
> -               break;
> -       case 3:
> -               fDerateTDP =3D GetScaledFraction(le32_to_cpu(getASICProfi=
lingInfo->ulTdpDerateDPM3), 1000);
> -               break;
> -       case 4:
> -               fDerateTDP =3D GetScaledFraction(le32_to_cpu(getASICProfi=
lingInfo->ulTdpDerateDPM4), 1000);
> -               break;
> -       case 5:
> -               fDerateTDP =3D GetScaledFraction(le32_to_cpu(getASICProfi=
lingInfo->ulTdpDerateDPM5), 1000);
> -               break;
> -       case 6:
> -               fDerateTDP =3D GetScaledFraction(le32_to_cpu(getASICProfi=
lingInfo->ulTdpDerateDPM6), 1000);
> -               break;
> -       case 7:
> -               fDerateTDP =3D GetScaledFraction(le32_to_cpu(getASICProfi=
lingInfo->ulTdpDerateDPM7), 1000);
> -               break;
> -       default:
> -               pr_err("DPM Level not supported\n");
> -               fDerateTDP =3D GetScaledFraction(le32_to_cpu(getASICProfi=
lingInfo->ulTdpDerateDPM0), 1000);
> -       }
> -
> -       /*-------------------------
> -        * DECODING FUSE VALUES
> -        * ------------------------
> -        */
> -       /*Decode RO_Fused*/
> -       sRO_fuse =3D getASICProfilingInfo->sRoFuse;
> -
> -       sInput_FuseValues.usEfuseIndex =3D sRO_fuse.usEfuseIndex;
> -       sInput_FuseValues.ucBitShift =3D sRO_fuse.ucEfuseBitLSB;
> -       sInput_FuseValues.ucBitLength =3D sRO_fuse.ucEfuseLength;
> -
> -       sOutput_FuseValues.sEfuse =3D sInput_FuseValues;
> -
> -       result =3D amdgpu_atom_execute_table(adev->mode_info.atom_context=
,
> -                       GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
> -                       (uint32_t *)&sOutput_FuseValues, sizeof(sOutput_F=
useValues));
> -
> -       if (result)
> -               return result;
> -
> -       /* Finally, the actual fuse value */
> -       ul_RO_fused =3D le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
> -       fMin =3D GetScaledFraction(le32_to_cpu(sRO_fuse.ulEfuseMin), 1);
> -       fRange =3D GetScaledFraction(le32_to_cpu(sRO_fuse.ulEfuseEncodeRa=
nge), 1);
> -       fRO_fused =3D fDecodeLinearFuse(ul_RO_fused, fMin, fRange, sRO_fu=
se.ucEfuseLength);
> -
> -       sCACm_fuse =3D getASICProfilingInfo->sCACm;
> -
> -       sInput_FuseValues.usEfuseIndex =3D sCACm_fuse.usEfuseIndex;
> -       sInput_FuseValues.ucBitShift =3D sCACm_fuse.ucEfuseBitLSB;
> -       sInput_FuseValues.ucBitLength =3D sCACm_fuse.ucEfuseLength;
> -
> -       sOutput_FuseValues.sEfuse =3D sInput_FuseValues;
> -
> -       result =3D amdgpu_atom_execute_table(adev->mode_info.atom_context=
,
> -                       GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
> -                       (uint32_t *)&sOutput_FuseValues, sizeof(sOutput_F=
useValues));
> -
> -       if (result)
> -               return result;
> -
> -       ul_CACm_fused =3D le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
> -       fMin =3D GetScaledFraction(le32_to_cpu(sCACm_fuse.ulEfuseMin), 10=
00);
> -       fRange =3D GetScaledFraction(le32_to_cpu(sCACm_fuse.ulEfuseEncode=
Range), 1000);
> -
> -       fCACm_fused =3D fDecodeLinearFuse(ul_CACm_fused, fMin, fRange, sC=
ACm_fuse.ucEfuseLength);
> -
> -       sCACb_fuse =3D getASICProfilingInfo->sCACb;
> -
> -       sInput_FuseValues.usEfuseIndex =3D sCACb_fuse.usEfuseIndex;
> -       sInput_FuseValues.ucBitShift =3D sCACb_fuse.ucEfuseBitLSB;
> -       sInput_FuseValues.ucBitLength =3D sCACb_fuse.ucEfuseLength;
> -       sOutput_FuseValues.sEfuse =3D sInput_FuseValues;
> -
> -       result =3D amdgpu_atom_execute_table(adev->mode_info.atom_context=
,
> -                       GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
> -                       (uint32_t *)&sOutput_FuseValues, sizeof(sOutput_F=
useValues));
> -
> -       if (result)
> -               return result;
> -
> -       ul_CACb_fused =3D le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
> -       fMin =3D GetScaledFraction(le32_to_cpu(sCACb_fuse.ulEfuseMin), 10=
00);
> -       fRange =3D GetScaledFraction(le32_to_cpu(sCACb_fuse.ulEfuseEncode=
Range), 1000);
> -
> -       fCACb_fused =3D fDecodeLinearFuse(ul_CACb_fused, fMin, fRange, sC=
ACb_fuse.ucEfuseLength);
> -
> -       sKt_Beta_fuse =3D getASICProfilingInfo->sKt_b;
> -
> -       sInput_FuseValues.usEfuseIndex =3D sKt_Beta_fuse.usEfuseIndex;
> -       sInput_FuseValues.ucBitShift =3D sKt_Beta_fuse.ucEfuseBitLSB;
> -       sInput_FuseValues.ucBitLength =3D sKt_Beta_fuse.ucEfuseLength;
> -
> -       sOutput_FuseValues.sEfuse =3D sInput_FuseValues;
> -
> -       result =3D amdgpu_atom_execute_table(adev->mode_info.atom_context=
,
> -                       GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
> -                       (uint32_t *)&sOutput_FuseValues, sizeof(sOutput_F=
useValues));
> -
> -       if (result)
> -               return result;
> -
> -       ul_Kt_Beta_fused =3D le32_to_cpu(sOutput_FuseValues.ulEfuseValue)=
;
> -       fAverage =3D GetScaledFraction(le32_to_cpu(sKt_Beta_fuse.ulEfuseE=
ncodeAverage), 1000);
> -       fRange =3D GetScaledFraction(le32_to_cpu(sKt_Beta_fuse.ulEfuseEnc=
odeRange), 1000);
> -
> -       fKt_Beta_fused =3D fDecodeLogisticFuse(ul_Kt_Beta_fused,
> -                       fAverage, fRange, sKt_Beta_fuse.ucEfuseLength);
> -
> -       sKv_m_fuse =3D getASICProfilingInfo->sKv_m;
> -
> -       sInput_FuseValues.usEfuseIndex =3D sKv_m_fuse.usEfuseIndex;
> -       sInput_FuseValues.ucBitShift =3D sKv_m_fuse.ucEfuseBitLSB;
> -       sInput_FuseValues.ucBitLength =3D sKv_m_fuse.ucEfuseLength;
> -
> -       sOutput_FuseValues.sEfuse =3D sInput_FuseValues;
> -
> -       result =3D amdgpu_atom_execute_table(adev->mode_info.atom_context=
,
> -                       GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
> -                       (uint32_t *)&sOutput_FuseValues, sizeof(sOutput_F=
useValues));
> -       if (result)
> -               return result;
> -
> -       ul_Kv_m_fused =3D le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
> -       fAverage =3D GetScaledFraction(le32_to_cpu(sKv_m_fuse.ulEfuseEnco=
deAverage), 1000);
> -       fRange =3D GetScaledFraction((le32_to_cpu(sKv_m_fuse.ulEfuseEncod=
eRange) & 0x7fffffff), 1000);
> -       fRange =3D fMultiply(fRange, ConvertToFraction(-1));
> -
> -       fKv_m_fused =3D fDecodeLogisticFuse(ul_Kv_m_fused,
> -                       fAverage, fRange, sKv_m_fuse.ucEfuseLength);
> -
> -       sKv_b_fuse =3D getASICProfilingInfo->sKv_b;
> -
> -       sInput_FuseValues.usEfuseIndex =3D sKv_b_fuse.usEfuseIndex;
> -       sInput_FuseValues.ucBitShift =3D sKv_b_fuse.ucEfuseBitLSB;
> -       sInput_FuseValues.ucBitLength =3D sKv_b_fuse.ucEfuseLength;
> -       sOutput_FuseValues.sEfuse =3D sInput_FuseValues;
> -
> -       result =3D amdgpu_atom_execute_table(adev->mode_info.atom_context=
,
> -                       GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
> -                       (uint32_t *)&sOutput_FuseValues, sizeof(sOutput_F=
useValues));
> -
> -       if (result)
> -               return result;
> -
> -       ul_Kv_b_fused =3D le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
> -       fAverage =3D GetScaledFraction(le32_to_cpu(sKv_b_fuse.ulEfuseEnco=
deAverage), 1000);
> -       fRange =3D GetScaledFraction(le32_to_cpu(sKv_b_fuse.ulEfuseEncode=
Range), 1000);
> -
> -       fKv_b_fused =3D fDecodeLogisticFuse(ul_Kv_b_fused,
> -                       fAverage, fRange, sKv_b_fuse.ucEfuseLength);
> -
> -       /* Decoding the Leakage - No special struct container */
> -       /*
> -        * usLkgEuseIndex=3D56
> -        * ucLkgEfuseBitLSB=3D6
> -        * ucLkgEfuseLength=3D10
> -        * ulLkgEncodeLn_MaxDivMin=3D69077
> -        * ulLkgEncodeMax=3D1000000
> -        * ulLkgEncodeMin=3D1000
> -        * ulEfuseLogisticAlpha=3D13
> -        */
> -
> -       sInput_FuseValues.usEfuseIndex =3D getASICProfilingInfo->usLkgEus=
eIndex;
> -       sInput_FuseValues.ucBitShift =3D getASICProfilingInfo->ucLkgEfuse=
BitLSB;
> -       sInput_FuseValues.ucBitLength =3D getASICProfilingInfo->ucLkgEfus=
eLength;
> -
> -       sOutput_FuseValues.sEfuse =3D sInput_FuseValues;
> -
> -       result =3D amdgpu_atom_execute_table(adev->mode_info.atom_context=
,
> -                       GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
> -                       (uint32_t *)&sOutput_FuseValues, sizeof(sOutput_F=
useValues));
> -
> -       if (result)
> -               return result;
> -
> -       ul_FT_Lkg_V0NORM =3D le32_to_cpu(sOutput_FuseValues.ulEfuseValue)=
;
> -       fLn_MaxDivMin =3D GetScaledFraction(le32_to_cpu(getASICProfilingI=
nfo->ulLkgEncodeLn_MaxDivMin), 10000);
> -       fMin =3D GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulLk=
gEncodeMin), 10000);
> -
> -       fFT_Lkg_V0NORM =3D fDecodeLeakageID(ul_FT_Lkg_V0NORM,
> -                       fLn_MaxDivMin, fMin, getASICProfilingInfo->ucLkgE=
fuseLength);
> -       fLkg_FT =3D fFT_Lkg_V0NORM;
> -
> -       /*-------------------------------------------
> -        * PART 2 - Grabbing all required values
> -        *-------------------------------------------
> -        */
> -       fSM_A0 =3D fMultiply(GetScaledFraction(le32_to_cpu(getASICProfili=
ngInfo->ulSM_A0), 1000000),
> -                       ConvertToFraction(uPow(-1, getASICProfilingInfo->=
ucSM_A0_sign)));
> -       fSM_A1 =3D fMultiply(GetScaledFraction(le32_to_cpu(getASICProfili=
ngInfo->ulSM_A1), 1000000),
> -                       ConvertToFraction(uPow(-1, getASICProfilingInfo->=
ucSM_A1_sign)));
> -       fSM_A2 =3D fMultiply(GetScaledFraction(le32_to_cpu(getASICProfili=
ngInfo->ulSM_A2), 100000),
> -                       ConvertToFraction(uPow(-1, getASICProfilingInfo->=
ucSM_A2_sign)));
> -       fSM_A3 =3D fMultiply(GetScaledFraction(le32_to_cpu(getASICProfili=
ngInfo->ulSM_A3), 1000000),
> -                       ConvertToFraction(uPow(-1, getASICProfilingInfo->=
ucSM_A3_sign)));
> -       fSM_A4 =3D fMultiply(GetScaledFraction(le32_to_cpu(getASICProfili=
ngInfo->ulSM_A4), 1000000),
> -                       ConvertToFraction(uPow(-1, getASICProfilingInfo->=
ucSM_A4_sign)));
> -       fSM_A5 =3D fMultiply(GetScaledFraction(le32_to_cpu(getASICProfili=
ngInfo->ulSM_A5), 1000),
> -                       ConvertToFraction(uPow(-1, getASICProfilingInfo->=
ucSM_A5_sign)));
> -       fSM_A6 =3D fMultiply(GetScaledFraction(le32_to_cpu(getASICProfili=
ngInfo->ulSM_A6), 1000),
> -                       ConvertToFraction(uPow(-1, getASICProfilingInfo->=
ucSM_A6_sign)));
> -       fSM_A7 =3D fMultiply(GetScaledFraction(le32_to_cpu(getASICProfili=
ngInfo->ulSM_A7), 1000),
> -                       ConvertToFraction(uPow(-1, getASICProfilingInfo->=
ucSM_A7_sign)));
> -
> -       fMargin_RO_a =3D ConvertToFraction(le32_to_cpu(getASICProfilingIn=
fo->ulMargin_RO_a));
> -       fMargin_RO_b =3D ConvertToFraction(le32_to_cpu(getASICProfilingIn=
fo->ulMargin_RO_b));
> -       fMargin_RO_c =3D ConvertToFraction(le32_to_cpu(getASICProfilingIn=
fo->ulMargin_RO_c));
> -
> -       fMargin_fixed =3D ConvertToFraction(le32_to_cpu(getASICProfilingI=
nfo->ulMargin_fixed));
> -
> -       fMargin_FMAX_mean =3D GetScaledFraction(
> -               le32_to_cpu(getASICProfilingInfo->ulMargin_Fmax_mean), 10=
000);
> -       fMargin_Plat_mean =3D GetScaledFraction(
> -               le32_to_cpu(getASICProfilingInfo->ulMargin_plat_mean), 10=
000);
> -       fMargin_FMAX_sigma =3D GetScaledFraction(
> -               le32_to_cpu(getASICProfilingInfo->ulMargin_Fmax_sigma), 1=
0000);
> -       fMargin_Plat_sigma =3D GetScaledFraction(
> -               le32_to_cpu(getASICProfilingInfo->ulMargin_plat_sigma), 1=
0000);
> -
> -       fMargin_DC_sigma =3D GetScaledFraction(
> -               le32_to_cpu(getASICProfilingInfo->ulMargin_DC_sigma), 100=
);
> -       fMargin_DC_sigma =3D fDivide(fMargin_DC_sigma, ConvertToFraction(=
1000));
> -
> -       fCACm_fused =3D fDivide(fCACm_fused, ConvertToFraction(100));
> -       fCACb_fused =3D fDivide(fCACb_fused, ConvertToFraction(100));
> -       fKt_Beta_fused =3D fDivide(fKt_Beta_fused, ConvertToFraction(100)=
);
> -       fKv_m_fused =3D  fNegate(fDivide(fKv_m_fused, ConvertToFraction(1=
00)));
> -       fKv_b_fused =3D fDivide(fKv_b_fused, ConvertToFraction(10));
> -
> -       fSclk =3D GetScaledFraction(sclk, 100);
> -
> -       fV_max =3D fDivide(GetScaledFraction(
> -                                le32_to_cpu(getASICProfilingInfo->ulMaxV=
ddc), 1000), ConvertToFraction(4));
> -       fT_prod =3D GetScaledFraction(le32_to_cpu(getASICProfilingInfo->u=
lBoardCoreTemp), 10);
> -       fLKG_Factor =3D GetScaledFraction(le32_to_cpu(getASICProfilingInf=
o->ulEvvLkgFactor), 100);
> -       fT_FT =3D GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulL=
eakageTemp), 10);
> -       fV_FT =3D fDivide(GetScaledFraction(
> -                               le32_to_cpu(getASICProfilingInfo->ulLeaka=
geVoltage), 1000), ConvertToFraction(4));
> -       fV_min =3D fDivide(GetScaledFraction(
> -                                le32_to_cpu(getASICProfilingInfo->ulMinV=
ddc), 1000), ConvertToFraction(4));
> -
> -       /*-----------------------
> -        * PART 3
> -        *-----------------------
> -        */
> -
> -       fA_Term =3D fAdd(fMargin_RO_a, fAdd(fMultiply(fSM_A4, fSclk), fSM=
_A5));
> -       fB_Term =3D fAdd(fAdd(fMultiply(fSM_A2, fSclk), fSM_A6), fMargin_=
RO_b);
> -       fC_Term =3D fAdd(fMargin_RO_c,
> -                       fAdd(fMultiply(fSM_A0, fLkg_FT),
> -                       fAdd(fMultiply(fSM_A1, fMultiply(fLkg_FT, fSclk))=
,
> -                       fAdd(fMultiply(fSM_A3, fSclk),
> -                       fSubtract(fSM_A7, fRO_fused)))));
> -
> -       fVDDC_base =3D fSubtract(fRO_fused,
> -                       fSubtract(fMargin_RO_c,
> -                                       fSubtract(fSM_A3, fMultiply(fSM_A=
1, fSclk))));
> -       fVDDC_base =3D fDivide(fVDDC_base, fAdd(fMultiply(fSM_A0, fSclk),=
 fSM_A2));
> -
> -       repeat =3D fSubtract(fVDDC_base,
> -                       fDivide(fMargin_DC_sigma, ConvertToFraction(1000)=
));
> -
> -       fRO_DC_margin =3D fAdd(fMultiply(fMargin_RO_a,
> -                       fGetSquare(repeat)),
> -                       fAdd(fMultiply(fMargin_RO_b, repeat),
> -                       fMargin_RO_c));
> -
> -       fDC_SCLK =3D fSubtract(fRO_fused,
> -                       fSubtract(fRO_DC_margin,
> -                       fSubtract(fSM_A3,
> -                       fMultiply(fSM_A2, repeat))));
> -       fDC_SCLK =3D fDivide(fDC_SCLK, fAdd(fMultiply(fSM_A0, repeat), fS=
M_A1));
> -
> -       fSigma_DC =3D fSubtract(fSclk, fDC_SCLK);
> -
> -       fMicro_FMAX =3D fMultiply(fSclk, fMargin_FMAX_mean);
> -       fMicro_CR =3D fMultiply(fSclk, fMargin_Plat_mean);
> -       fSigma_FMAX =3D fMultiply(fSclk, fMargin_FMAX_sigma);
> -       fSigma_CR =3D fMultiply(fSclk, fMargin_Plat_sigma);
> -
> -       fSquared_Sigma_DC =3D fGetSquare(fSigma_DC);
> -       fSquared_Sigma_CR =3D fGetSquare(fSigma_CR);
> -       fSquared_Sigma_FMAX =3D fGetSquare(fSigma_FMAX);
> -
> -       fSclk_margin =3D fAdd(fMicro_FMAX,
> -                       fAdd(fMicro_CR,
> -                       fAdd(fMargin_fixed,
> -                       fSqrt(fAdd(fSquared_Sigma_FMAX,
> -                       fAdd(fSquared_Sigma_DC, fSquared_Sigma_CR))))));
> -       /*
> -        fA_Term =3D fSM_A4 * (fSclk + fSclk_margin) + fSM_A5;
> -        fB_Term =3D fSM_A2 * (fSclk + fSclk_margin) + fSM_A6;
> -        fC_Term =3D fRO_DC_margin + fSM_A0 * fLkg_FT + fSM_A1 * fLkg_FT =
* (fSclk + fSclk_margin) + fSM_A3 * (fSclk + fSclk_margin) + fSM_A7 - fRO_f=
used;
> -        */
> -
> -       fA_Term =3D fAdd(fMultiply(fSM_A4, fAdd(fSclk, fSclk_margin)), fS=
M_A5);
> -       fB_Term =3D fAdd(fMultiply(fSM_A2, fAdd(fSclk, fSclk_margin)), fS=
M_A6);
> -       fC_Term =3D fAdd(fRO_DC_margin,
> -                       fAdd(fMultiply(fSM_A0, fLkg_FT),
> -                       fAdd(fMultiply(fMultiply(fSM_A1, fLkg_FT),
> -                       fAdd(fSclk, fSclk_margin)),
> -                       fAdd(fMultiply(fSM_A3,
> -                       fAdd(fSclk, fSclk_margin)),
> -                       fSubtract(fSM_A7, fRO_fused)))));
> -
> -       SolveQuadracticEqn(fA_Term, fB_Term, fC_Term, fRoots);
> -
> -       if (GreaterThan(fRoots[0], fRoots[1]))
> -               fEVV_V =3D fRoots[1];
> -       else
> -               fEVV_V =3D fRoots[0];
> -
> -       if (GreaterThan(fV_min, fEVV_V))
> -               fEVV_V =3D fV_min;
> -       else if (GreaterThan(fEVV_V, fV_max))
> -               fEVV_V =3D fSubtract(fV_max, fStepSize);
> -
> -       fEVV_V =3D fRoundUpByStepSize(fEVV_V, fStepSize, 0);
> -
> -       /*-----------------
> -        * PART 4
> -        *-----------------
> -        */
> -
> -       fV_x =3D fV_min;
> -
> -       while (GreaterThan(fAdd(fV_max, fStepSize), fV_x)) {
> -               fTDP_Power_left =3D fMultiply(fMultiply(fMultiply(fAdd(
> -                               fMultiply(fCACm_fused, fV_x), fCACb_fused=
), fSclk),
> -                               fGetSquare(fV_x)), fDerateTDP);
> -
> -               fTDP_Power_right =3D fMultiply(fFT_Lkg_V0NORM, fMultiply(=
fLKG_Factor,
> -                               fMultiply(fExponential(fMultiply(fAdd(fMu=
ltiply(fKv_m_fused,
> -                               fT_prod), fKv_b_fused), fV_x)), fV_x)));
> -               fTDP_Power_right =3D fMultiply(fTDP_Power_right, fExponen=
tial(fMultiply(
> -                               fKt_Beta_fused, fT_prod)));
> -               fTDP_Power_right =3D fDivide(fTDP_Power_right, fExponenti=
al(fMultiply(
> -                               fAdd(fMultiply(fKv_m_fused, fT_prod), fKv=
_b_fused), fV_FT)));
> -               fTDP_Power_right =3D fDivide(fTDP_Power_right, fExponenti=
al(fMultiply(
> -                               fKt_Beta_fused, fT_FT)));
> -
> -               fTDP_Power =3D fAdd(fTDP_Power_left, fTDP_Power_right);
> -
> -               fTDP_Current =3D fDivide(fTDP_Power, fV_x);
> -
> -               fV_NL =3D fAdd(fV_x, fDivide(fMultiply(fTDP_Current, fRLL=
_LoadLine),
> -                               ConvertToFraction(10)));
> -
> -               fV_NL =3D fRoundUpByStepSize(fV_NL, fStepSize, 0);
> -
> -               if (GreaterThan(fV_max, fV_NL) &&
> -                       (GreaterThan(fV_NL, fEVV_V) ||
> -                       Equal(fV_NL, fEVV_V))) {
> -                       fV_NL =3D fMultiply(fV_NL, ConvertToFraction(1000=
));
> -
> -                       *voltage =3D (uint16_t)fV_NL.partial.real;
> -                       break;
> -               } else
> -                       fV_x =3D fAdd(fV_x, fStepSize);
> -       }
> -
> -       return result;
> -}
> -
>  /**
>   * atomctrl_get_voltage_evv_on_sclk: gets voltage via call to ATOM COMMA=
ND table.
>   * @hwmgr:              input: pointer to hwManager
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
> index 1f987e846628..22b0ac12df97 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
> @@ -316,8 +316,6 @@ extern int atomctrl_get_engine_pll_dividers_kong(stru=
ct pp_hwmgr *hwmgr,
>                                                  pp_atomctrl_clock_divide=
rs_kong *dividers);
>  extern int atomctrl_read_efuse(struct pp_hwmgr *hwmgr, uint16_t start_in=
dex,
>                 uint16_t end_index, uint32_t *efuse);
> -extern int atomctrl_calculate_voltage_evv_on_sclk(struct pp_hwmgr *hwmgr=
, uint8_t voltage_type,
> -               uint32_t sclk, uint16_t virtual_voltage_Id, uint16_t *vol=
tage, uint16_t dpm_level, bool debug);
>  extern int atomctrl_get_engine_pll_dividers_ai(struct pp_hwmgr *hwmgr, u=
int32_t clock_value, pp_atomctrl_clock_dividers_ai *dividers);
>  extern int atomctrl_set_ac_timing_ai(struct pp_hwmgr *hwmgr, uint32_t me=
mory_clock,
>                                                                 uint8_t l=
evel);
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h b/drivers=
/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
> deleted file mode 100644
> index 409aeec6baa9..000000000000
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
> +++ /dev/null
> @@ -1,561 +0,0 @@
> -/*
> - * Copyright 2015 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -#include <asm/div64.h>
> -
> -enum ppevvmath_constants {
> -       /* We multiply all original integers with 2^SHIFT_AMOUNT to get t=
he fInt representation */
> -       SHIFT_AMOUNT    =3D 16,
> -
> -       /* Change this value to change the number of decimal places in th=
e final output - 5 is a good default */
> -       PRECISION       =3D  5,
> -
> -       SHIFTED_2       =3D (2 << SHIFT_AMOUNT),
> -
> -       /* 32767 - Might change in the future */
> -       MAX             =3D (1 << (SHIFT_AMOUNT - 1)) - 1,
> -};
> -
> -/* ---------------------------------------------------------------------=
----------
> - * NEW TYPE - fINT
> - * ---------------------------------------------------------------------=
----------
> - * A variable of type fInt can be accessed in 3 ways using the dot (.) o=
perator
> - * fInt A;
> - * A.full =3D> The full number as it is. Generally not easy to read
> - * A.partial.real =3D> Only the integer portion
> - * A.partial.decimal =3D> Only the fractional portion
> - */
> -typedef union _fInt {
> -    int full;
> -    struct _partial {
> -        unsigned int decimal: SHIFT_AMOUNT; /*Needs to always be unsigne=
d*/
> -        int real: 32 - SHIFT_AMOUNT;
> -    } partial;
> -} fInt;
> -
> -/* ---------------------------------------------------------------------=
----------
> - * Function Declarations
> - *  --------------------------------------------------------------------=
-----------
> - */
> -static fInt ConvertToFraction(int);                       /* Use this to=
 convert an INT to a FINT */
> -static fInt Convert_ULONG_ToFraction(uint32_t);           /* Use this to=
 convert an uint32_t to a FINT */
> -static fInt GetScaledFraction(int, int);                  /* Use this to=
 convert an INT to a FINT after scaling it by a factor */
> -static int ConvertBackToInteger(fInt);                    /* Convert a F=
INT back to an INT that is scaled by 1000 (i.e. last 3 digits are the decim=
al digits) */
> -
> -static fInt fNegate(fInt);                                /* Returns -1 =
* input fInt value */
> -static fInt fAdd (fInt, fInt);                            /* Returns the=
 sum of two fInt numbers */
> -static fInt fSubtract (fInt A, fInt B);                   /* Returns A-B=
 - Sometimes easier than Adding negative numbers */
> -static fInt fMultiply (fInt, fInt);                       /* Returns the=
 product of two fInt numbers */
> -static fInt fDivide (fInt A, fInt B);                     /* Returns A/B=
 */
> -static fInt fGetSquare(fInt);                             /* Returns the=
 square of a fInt number */
> -static fInt fSqrt(fInt);                                  /* Returns the=
 Square Root of a fInt number */
> -
> -static int uAbs(int);                                     /* Returns the=
 Absolute value of the Int */
> -static int uPow(int base, int exponent);                  /* Returns bas=
e^exponent an INT */
> -
> -static void SolveQuadracticEqn(fInt, fInt, fInt, fInt[]); /* Returns the=
 2 roots via the array */
> -static bool Equal(fInt, fInt);                            /* Returns tru=
e if two fInts are equal to each other */
> -static bool GreaterThan(fInt A, fInt B);                  /* Returns tru=
e if A > B */
> -
> -static fInt fExponential(fInt exponent);                  /* Can be used=
 to calculate e^exponent */
> -static fInt fNaturalLog(fInt value);                      /* Can be used=
 to calculate ln(value) */
> -
> -/* Fuse decoding functions
> - * ---------------------------------------------------------------------=
----------------
> - */
> -static fInt fDecodeLinearFuse(uint32_t fuse_value, fInt f_min, fInt f_ra=
nge, uint32_t bitlength);
> -static fInt fDecodeLogisticFuse(uint32_t fuse_value, fInt f_average, fIn=
t f_range, uint32_t bitlength);
> -static fInt fDecodeLeakageID (uint32_t leakageID_fuse, fInt ln_max_div_m=
in, fInt f_min, uint32_t bitlength);
> -
> -/* Internal Support Functions - Use these ONLY for testing or adding to =
internal functions
> - * ---------------------------------------------------------------------=
----------------
> - * Some of the following functions take two INTs as their input - This i=
s unsafe for a variety of reasons.
> - */
> -static fInt Divide (int, int);                            /* Divide two =
INTs and return result as FINT */
> -static fInt fNegate(fInt);
> -
> -static int uGetScaledDecimal (fInt);                      /* Internal fu=
nction */
> -static int GetReal (fInt A);                              /* Internal fu=
nction */
> -
> -/* ---------------------------------------------------------------------=
----------------
> - * TROUBLESHOOTING INFORMATION
> - * ---------------------------------------------------------------------=
----------------
> - * 1) ConvertToFraction - InputOutOfRangeException: Only accepts numbers=
 smaller than MAX (default: 32767)
> - * 2) fAdd - OutputOutOfRangeException: Output bigger than MAX (default:=
 32767)
> - * 3) fMultiply - OutputOutOfRangeException:
> - * 4) fGetSquare - OutputOutOfRangeException:
> - * 5) fDivide - DivideByZeroException
> - * 6) fSqrt - NegativeSquareRootException: Input cannot be a negative nu=
mber
> - */
> -
> -/* ---------------------------------------------------------------------=
----------------
> - * START OF CODE
> - * ---------------------------------------------------------------------=
----------------
> - */
> -static fInt fExponential(fInt exponent)        /*Can be used to calculat=
e e^exponent*/
> -{
> -       uint32_t i;
> -       bool bNegated =3D false;
> -
> -       fInt fPositiveOne =3D ConvertToFraction(1);
> -       fInt fZERO =3D ConvertToFraction(0);
> -
> -       fInt lower_bound =3D Divide(78, 10000);
> -       fInt solution =3D fPositiveOne; /*Starting off with baseline of 1=
 */
> -       fInt error_term;
> -
> -       static const uint32_t k_array[11] =3D {55452, 27726, 13863, 6931,=
 4055, 2231, 1178, 606, 308, 155, 78};
> -       static const uint32_t expk_array[11] =3D {2560000, 160000, 40000,=
 20000, 15000, 12500, 11250, 10625, 10313, 10156, 10078};
> -
> -       if (GreaterThan(fZERO, exponent)) {
> -               exponent =3D fNegate(exponent);
> -               bNegated =3D true;
> -       }
> -
> -       while (GreaterThan(exponent, lower_bound)) {
> -               for (i =3D 0; i < 11; i++) {
> -                       if (GreaterThan(exponent, GetScaledFraction(k_arr=
ay[i], 10000))) {
> -                               exponent =3D fSubtract(exponent, GetScale=
dFraction(k_array[i], 10000));
> -                               solution =3D fMultiply(solution, GetScale=
dFraction(expk_array[i], 10000));
> -                       }
> -               }
> -       }
> -
> -       error_term =3D fAdd(fPositiveOne, exponent);
> -
> -       solution =3D fMultiply(solution, error_term);
> -
> -       if (bNegated)
> -               solution =3D fDivide(fPositiveOne, solution);
> -
> -       return solution;
> -}
> -
> -static fInt fNaturalLog(fInt value)
> -{
> -       uint32_t i;
> -       fInt upper_bound =3D Divide(8, 1000);
> -       fInt fNegativeOne =3D ConvertToFraction(-1);
> -       fInt solution =3D ConvertToFraction(0); /*Starting off with basel=
ine of 0 */
> -       fInt error_term;
> -
> -       static const uint32_t k_array[10] =3D {160000, 40000, 20000, 1500=
0, 12500, 11250, 10625, 10313, 10156, 10078};
> -       static const uint32_t logk_array[10] =3D {27726, 13863, 6931, 405=
5, 2231, 1178, 606, 308, 155, 78};
> -
> -       while (GreaterThan(fAdd(value, fNegativeOne), upper_bound)) {
> -               for (i =3D 0; i < 10; i++) {
> -                       if (GreaterThan(value, GetScaledFraction(k_array[=
i], 10000))) {
> -                               value =3D fDivide(value, GetScaledFractio=
n(k_array[i], 10000));
> -                               solution =3D fAdd(solution, GetScaledFrac=
tion(logk_array[i], 10000));
> -                       }
> -               }
> -       }
> -
> -       error_term =3D fAdd(fNegativeOne, value);
> -
> -       return fAdd(solution, error_term);
> -}
> -
> -static fInt fDecodeLinearFuse(uint32_t fuse_value, fInt f_min, fInt f_ra=
nge, uint32_t bitlength)
> -{
> -       fInt f_fuse_value =3D Convert_ULONG_ToFraction(fuse_value);
> -       fInt f_bit_max_value =3D Convert_ULONG_ToFraction((uPow(2, bitlen=
gth)) - 1);
> -
> -       fInt f_decoded_value;
> -
> -       f_decoded_value =3D fDivide(f_fuse_value, f_bit_max_value);
> -       f_decoded_value =3D fMultiply(f_decoded_value, f_range);
> -       f_decoded_value =3D fAdd(f_decoded_value, f_min);
> -
> -       return f_decoded_value;
> -}
> -
> -
> -static fInt fDecodeLogisticFuse(uint32_t fuse_value, fInt f_average, fIn=
t f_range, uint32_t bitlength)
> -{
> -       fInt f_fuse_value =3D Convert_ULONG_ToFraction(fuse_value);
> -       fInt f_bit_max_value =3D Convert_ULONG_ToFraction((uPow(2, bitlen=
gth)) - 1);
> -
> -       fInt f_CONSTANT_NEG13 =3D ConvertToFraction(-13);
> -       fInt f_CONSTANT1 =3D ConvertToFraction(1);
> -
> -       fInt f_decoded_value;
> -
> -       f_decoded_value =3D fSubtract(fDivide(f_bit_max_value, f_fuse_val=
ue), f_CONSTANT1);
> -       f_decoded_value =3D fNaturalLog(f_decoded_value);
> -       f_decoded_value =3D fMultiply(f_decoded_value, fDivide(f_range, f=
_CONSTANT_NEG13));
> -       f_decoded_value =3D fAdd(f_decoded_value, f_average);
> -
> -       return f_decoded_value;
> -}
> -
> -static fInt fDecodeLeakageID (uint32_t leakageID_fuse, fInt ln_max_div_m=
in, fInt f_min, uint32_t bitlength)
> -{
> -       fInt fLeakage;
> -       fInt f_bit_max_value =3D Convert_ULONG_ToFraction((uPow(2, bitlen=
gth)) - 1);
> -
> -       fLeakage =3D fMultiply(ln_max_div_min, Convert_ULONG_ToFraction(l=
eakageID_fuse));
> -       fLeakage =3D fDivide(fLeakage, f_bit_max_value);
> -       fLeakage =3D fExponential(fLeakage);
> -       fLeakage =3D fMultiply(fLeakage, f_min);
> -
> -       return fLeakage;
> -}
> -
> -static fInt ConvertToFraction(int X) /*Add all range checking here. Is i=
t possible to make fInt a private declaration? */
> -{
> -       fInt temp;
> -
> -       if (X <=3D MAX)
> -               temp.full =3D (X << SHIFT_AMOUNT);
> -       else
> -               temp.full =3D 0;
> -
> -       return temp;
> -}
> -
> -static fInt fNegate(fInt X)
> -{
> -       fInt CONSTANT_NEGONE =3D ConvertToFraction(-1);
> -       return fMultiply(X, CONSTANT_NEGONE);
> -}
> -
> -static fInt Convert_ULONG_ToFraction(uint32_t X)
> -{
> -       fInt temp;
> -
> -       if (X <=3D MAX)
> -               temp.full =3D (X << SHIFT_AMOUNT);
> -       else
> -               temp.full =3D 0;
> -
> -       return temp;
> -}
> -
> -static fInt GetScaledFraction(int X, int factor)
> -{
> -       int times_shifted, factor_shifted;
> -       bool bNEGATED;
> -       fInt fValue;
> -
> -       times_shifted =3D 0;
> -       factor_shifted =3D 0;
> -       bNEGATED =3D false;
> -
> -       if (X < 0) {
> -               X =3D -1*X;
> -               bNEGATED =3D true;
> -       }
> -
> -       if (factor < 0) {
> -               factor =3D -1*factor;
> -               bNEGATED =3D !bNEGATED; /*If bNEGATED =3D true due to X <=
 0, this will cover the case of negative cancelling negative */
> -       }
> -
> -       if ((X > MAX) || factor > MAX) {
> -               if ((X/factor) <=3D MAX) {
> -                       while (X > MAX) {
> -                               X =3D X >> 1;
> -                               times_shifted++;
> -                       }
> -
> -                       while (factor > MAX) {
> -                               factor =3D factor >> 1;
> -                               factor_shifted++;
> -                       }
> -               } else {
> -                       fValue.full =3D 0;
> -                       return fValue;
> -               }
> -       }
> -
> -       if (factor =3D=3D 1)
> -               return ConvertToFraction(X);
> -
> -       fValue =3D fDivide(ConvertToFraction(X * uPow(-1, bNEGATED)), Con=
vertToFraction(factor));
> -
> -       fValue.full =3D fValue.full << times_shifted;
> -       fValue.full =3D fValue.full >> factor_shifted;
> -
> -       return fValue;
> -}
> -
> -/* Addition using two fInts */
> -static fInt fAdd (fInt X, fInt Y)
> -{
> -       fInt Sum;
> -
> -       Sum.full =3D X.full + Y.full;
> -
> -       return Sum;
> -}
> -
> -/* Addition using two fInts */
> -static fInt fSubtract (fInt X, fInt Y)
> -{
> -       fInt Difference;
> -
> -       Difference.full =3D X.full - Y.full;
> -
> -       return Difference;
> -}
> -
> -static bool Equal(fInt A, fInt B)
> -{
> -       if (A.full =3D=3D B.full)
> -               return true;
> -       else
> -               return false;
> -}
> -
> -static bool GreaterThan(fInt A, fInt B)
> -{
> -       if (A.full > B.full)
> -               return true;
> -       else
> -               return false;
> -}
> -
> -static fInt fMultiply (fInt X, fInt Y) /* Uses 64-bit integers (int64_t)=
 */
> -{
> -       fInt Product;
> -       int64_t tempProduct;
> -
> -       /*The following is for a very specific common case: Non-zero numb=
er with ONLY fractional portion*/
> -       /* TEMPORARILY DISABLED - CAN BE USED TO IMPROVE PRECISION
> -       bool X_LessThanOne, Y_LessThanOne;
> -
> -       X_LessThanOne =3D (X.partial.real =3D=3D 0 && X.partial.decimal !=
=3D 0 && X.full >=3D 0);
> -       Y_LessThanOne =3D (Y.partial.real =3D=3D 0 && Y.partial.decimal !=
=3D 0 && Y.full >=3D 0);
> -
> -       if (X_LessThanOne && Y_LessThanOne) {
> -               Product.full =3D X.full * Y.full;
> -               return Product
> -       }*/
> -
> -       tempProduct =3D ((int64_t)X.full) * ((int64_t)Y.full); /*Q(16,16)=
*Q(16,16) =3D Q(32, 32) - Might become a negative number! */
> -       tempProduct =3D tempProduct >> 16; /*Remove lagging 16 bits - Wil=
l lose some precision from decimal; */
> -       Product.full =3D (int)tempProduct; /*The int64_t will lose the le=
ading 16 bits that were part of the integer portion */
> -
> -       return Product;
> -}
> -
> -static fInt fDivide (fInt X, fInt Y)
> -{
> -       fInt fZERO, fQuotient;
> -       int64_t longlongX, longlongY;
> -
> -       fZERO =3D ConvertToFraction(0);
> -
> -       if (Equal(Y, fZERO))
> -               return fZERO;
> -
> -       longlongX =3D (int64_t)X.full;
> -       longlongY =3D (int64_t)Y.full;
> -
> -       longlongX =3D longlongX << 16; /*Q(16,16) -> Q(32,32) */
> -
> -       div64_s64(longlongX, longlongY); /*Q(32,32) divided by Q(16,16) =
=3D Q(16,16) Back to original format */
> -
> -       fQuotient.full =3D (int)longlongX;
> -       return fQuotient;
> -}
> -
> -static int ConvertBackToInteger (fInt A) /*THIS is the function that wil=
l be used to check with the Golden settings table*/
> -{
> -       fInt fullNumber, scaledDecimal, scaledReal;
> -
> -       scaledReal.full =3D GetReal(A) * uPow(10, PRECISION-1); /* DOUBLE=
 CHECK THISSSS!!! */
> -
> -       scaledDecimal.full =3D uGetScaledDecimal(A);
> -
> -       fullNumber =3D fAdd(scaledDecimal, scaledReal);
> -
> -       return fullNumber.full;
> -}
> -
> -static fInt fGetSquare(fInt A)
> -{
> -       return fMultiply(A, A);
> -}
> -
> -/* x_new =3D x_old - (x_old^2 - C) / (2 * x_old) */
> -static fInt fSqrt(fInt num)
> -{
> -       fInt F_divide_Fprime, Fprime;
> -       fInt test;
> -       fInt twoShifted;
> -       int seed, counter, error;
> -       fInt x_new, x_old, C, y;
> -
> -       fInt fZERO =3D ConvertToFraction(0);
> -
> -       /* (0 > num) is the same as (num < 0), i.e., num is negative */
> -
> -       if (GreaterThan(fZERO, num) || Equal(fZERO, num))
> -               return fZERO;
> -
> -       C =3D num;
> -
> -       if (num.partial.real > 3000)
> -               seed =3D 60;
> -       else if (num.partial.real > 1000)
> -               seed =3D 30;
> -       else if (num.partial.real > 100)
> -               seed =3D 10;
> -       else
> -               seed =3D 2;
> -
> -       counter =3D 0;
> -
> -       if (Equal(num, fZERO)) /*Square Root of Zero is zero */
> -               return fZERO;
> -
> -       twoShifted =3D ConvertToFraction(2);
> -       x_new =3D ConvertToFraction(seed);
> -
> -       do {
> -               counter++;
> -
> -               x_old.full =3D x_new.full;
> -
> -               test =3D fGetSquare(x_old); /*1.75*1.75 is reverting back=
 to 1 when shifted down */
> -               y =3D fSubtract(test, C); /*y =3D f(x) =3D x^2 - C; */
> -
> -               Fprime =3D fMultiply(twoShifted, x_old);
> -               F_divide_Fprime =3D fDivide(y, Fprime);
> -
> -               x_new =3D fSubtract(x_old, F_divide_Fprime);
> -
> -               error =3D ConvertBackToInteger(x_new) - ConvertBackToInte=
ger(x_old);
> -
> -               if (counter > 20) /*20 is already way too many iterations=
. If we dont have an answer by then, we never will*/
> -                       return x_new;
> -
> -       } while (uAbs(error) > 0);
> -
> -       return x_new;
> -}
> -
> -static void SolveQuadracticEqn(fInt A, fInt B, fInt C, fInt Roots[])
> -{
> -       fInt *pRoots =3D &Roots[0];
> -       fInt temp, root_first, root_second;
> -       fInt f_CONSTANT10, f_CONSTANT100;
> -
> -       f_CONSTANT100 =3D ConvertToFraction(100);
> -       f_CONSTANT10 =3D ConvertToFraction(10);
> -
> -       while (GreaterThan(A, f_CONSTANT100) || GreaterThan(B, f_CONSTANT=
100) || GreaterThan(C, f_CONSTANT100)) {
> -               A =3D fDivide(A, f_CONSTANT10);
> -               B =3D fDivide(B, f_CONSTANT10);
> -               C =3D fDivide(C, f_CONSTANT10);
> -       }
> -
> -       temp =3D fMultiply(ConvertToFraction(4), A); /* root =3D 4*A */
> -       temp =3D fMultiply(temp, C); /* root =3D 4*A*C */
> -       temp =3D fSubtract(fGetSquare(B), temp); /* root =3D b^2 - 4AC */
> -       temp =3D fSqrt(temp); /*root =3D Sqrt (b^2 - 4AC); */
> -
> -       root_first =3D fSubtract(fNegate(B), temp); /* b - Sqrt(b^2 - 4AC=
) */
> -       root_second =3D fAdd(fNegate(B), temp); /* b + Sqrt(b^2 - 4AC) */
> -
> -       root_first =3D fDivide(root_first, ConvertToFraction(2)); /* [b +=
- Sqrt(b^2 - 4AC)]/[2] */
> -       root_first =3D fDivide(root_first, A); /*[b +- Sqrt(b^2 - 4AC)]/[=
2*A] */
> -
> -       root_second =3D fDivide(root_second, ConvertToFraction(2)); /* [b=
 +- Sqrt(b^2 - 4AC)]/[2] */
> -       root_second =3D fDivide(root_second, A); /*[b +- Sqrt(b^2 - 4AC)]=
/[2*A] */
> -
> -       *(pRoots + 0) =3D root_first;
> -       *(pRoots + 1) =3D root_second;
> -}
> -
> -/* ---------------------------------------------------------------------=
--------
> - * SUPPORT FUNCTIONS
> - * ---------------------------------------------------------------------=
--------
> - */
> -
> -/* Conversion Functions */
> -static int GetReal (fInt A)
> -{
> -       return (A.full >> SHIFT_AMOUNT);
> -}
> -
> -static fInt Divide (int X, int Y)
> -{
> -       fInt A, B, Quotient;
> -
> -       A.full =3D X << SHIFT_AMOUNT;
> -       B.full =3D Y << SHIFT_AMOUNT;
> -
> -       Quotient =3D fDivide(A, B);
> -
> -       return Quotient;
> -}
> -
> -static int uGetScaledDecimal (fInt A) /*Converts the fractional portion =
to whole integers - Costly function */
> -{
> -       int dec[PRECISION];
> -       int i, scaledDecimal =3D 0, tmp =3D A.partial.decimal;
> -
> -       for (i =3D 0; i < PRECISION; i++) {
> -               dec[i] =3D tmp / (1 << SHIFT_AMOUNT);
> -               tmp =3D tmp - ((1 << SHIFT_AMOUNT)*dec[i]);
> -               tmp *=3D 10;
> -               scaledDecimal =3D scaledDecimal + dec[i]*uPow(10, PRECISI=
ON - 1 - i);
> -       }
> -
> -       return scaledDecimal;
> -}
> -
> -static int uPow(int base, int power)
> -{
> -       if (power =3D=3D 0)
> -               return 1;
> -       else
> -               return (base)*uPow(base, power - 1);
> -}
> -
> -static int uAbs(int X)
> -{
> -       if (X < 0)
> -               return (X * -1);
> -       else
> -               return X;
> -}
> -
> -static fInt fRoundUpByStepSize(fInt A, fInt fStepSize, bool error_term)
> -{
> -       fInt solution;
> -
> -       solution =3D fDivide(A, fStepSize);
> -       solution.partial.decimal =3D 0; /*All fractional digits changes t=
o 0 */
> -
> -       if (error_term)
> -               solution.partial.real +=3D 1; /*Error term of 1 added */
> -
> -       solution =3D fMultiply(solution, fStepSize);
> -       solution =3D fAdd(solution, fStepSize);
> -
> -       return solution;
> -}
> -
> --
> 2.46.2
>
