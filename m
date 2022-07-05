Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EBD567285
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 17:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298D512BD5E;
	Tue,  5 Jul 2022 15:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D53C11A130;
 Tue,  5 Jul 2022 15:25:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lg18so2457170ejb.0;
 Tue, 05 Jul 2022 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b82nd9N2NQ5PIgXaKHihSROQIOE6Sh+xDQ2S0TRBk8o=;
 b=QmhOB4Nh/I08thTXMmIahvYtPZlpl3sQDpvQIDvcMppE6YIf1ZDa23SEh5Mk/Js6t8
 iyOmMoSFZsyBL4UOOGJmtyGzBLhXem1ZfC2npo603cyTtuj7d/N8iTsEELGP4cLuZQr5
 xMLplpUefVzxLFqSbRhAh/jdzhwFL+GlyPJlFSvSjasFypeZ8smgZ6uFxojJ7eqdFVqn
 y/4XO25HkdB2k1/dOuWmWdDF69RYJeM804d9KKvnoDkz1yOOY+teEEYOYM2F95/VpEHw
 TBG+pv7921YOYjoT+ERpwrPZe11RCkX9/1Mpqi+nf5pWlEyzgAHNgTjtQ4S6zXQM1gzT
 82vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b82nd9N2NQ5PIgXaKHihSROQIOE6Sh+xDQ2S0TRBk8o=;
 b=yl9MBBHrFPRNZmvDRoKP09D2d/8j6cevJcBIaWRcJPWezmM43+d+B1CTF4LQVCeZ29
 5G0YhIf8qjlgLwTCK3JHokxhzcbLEVeZvKdN55T8QZg00fWL4fI3BObKIZQfB7z7lLBJ
 F968k72XnFaeTSVjb/1PEL1XLihckinHMOk3D9KlQtQXrrkihxVa9Fg683UFCQLpJJa9
 FCLl9ICuy+BePqvzifYOVutOgWqLEZtnP0zgz4/jCI9zoGrbrbC6kVqOZTcBw6mbzLwj
 WW2xNxooY5xexSl6xjMtKXhSzGPdBUenFT7oRsQZj/FZJZ/o8rjQmCYBIVPoI9dvcoqm
 T++w==
X-Gm-Message-State: AJIora8m+GuEjO+Q6MWNg3TWdZDKzHJTVUh01JL4b5j54bdA7tJOexsL
 KerGPeDv0ISrGeWvC68Eybes24sBcNjwG0Z0nI2f7bbZ
X-Google-Smtp-Source: AGRyM1sDuL7rGLTr45iig6VwfKtGfXv+dgL+1iLmPkeblfw8W3jLfgMmEqY2MzRkHo9alDBGHRZ5z2KyuL9LZPqJ6DA=
X-Received: by 2002:a17:906:5d0b:b0:726:a043:fcb4 with SMTP id
 g11-20020a1709065d0b00b00726a043fcb4mr35115739ejt.508.1657034745783; Tue, 05
 Jul 2022 08:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220630215316.1078841-1-mairacanal@riseup.net>
In-Reply-To: <20220630215316.1078841-1-mairacanal@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Jul 2022 11:25:34 -0400
Message-ID: <CADnq5_NWT-sMUMkgTU4gwjk4uX15ZYgrAV1KLPJpgLY+sEqi+A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unused variables from vba_vars_st
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: Leo Li <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 30, 2022 at 5:53 PM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> Some variables from the struct vba_vars_st are not referenced in any
> other place on the codebase. As they are not used, this commit removes
> those variables.
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>
> Unused variables from structs are not warned by compilers, so they are a =
bit
> harder to find. In order to find these unused variables, I used git grep =
and
> checked if they were used anywhere else.
>
> Any feedback or suggestion (maybe a tool to check unused variables from s=
tructs)
> is welcomed!
>
> Best Regards,
> - Ma=C3=ADra Canal
>
> ---
>  .../drm/amd/display/dc/dml/display_mode_vba.c |  1 -
>  .../drm/amd/display/dc/dml/display_mode_vba.h | 33 -------------------
>  2 files changed, 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/driv=
ers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> index ed23c7c79d86..6b3918609d26 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> @@ -346,7 +346,6 @@ static void fetch_socbb_params(struct display_mode_li=
b *mode_lib)
>         mode_lib->vba.DRAMClockChangeRequirementFinal =3D 1;
>         mode_lib->vba.FCLKChangeRequirementFinal =3D 1;
>         mode_lib->vba.USRRetrainingRequiredFinal =3D 1;
> -       mode_lib->vba.ConfigurableDETSizeEnFinal =3D 0;
>         mode_lib->vba.AllowForPStateChangeOrStutterInVBlankFinal =3D soc-=
>allow_for_pstate_or_stutter_in_vblank_final;
>         mode_lib->vba.DRAMClockChangeLatency =3D soc->dram_clock_change_l=
atency_us;
>         mode_lib->vba.DummyPStateCheck =3D soc->dram_clock_change_latency=
_us =3D=3D soc->dummy_pstate_latency_us;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/driv=
ers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> index 25a9a606ab6f..e95b2199d85a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> @@ -232,7 +232,6 @@ struct vba_vars_st {
>         double DISPCLKWithRampingRoundedToDFSGranularity;
>         double DISPCLKWithoutRampingRoundedToDFSGranularity;
>         double MaxDispclkRoundedToDFSGranularity;
> -       double MaxDppclkRoundedToDFSGranularity;
>         bool DCCEnabledAnyPlane;
>         double ReturnBandwidthToDCN;
>         unsigned int TotalActiveDPP;
> @@ -249,7 +248,6 @@ struct vba_vars_st {
>         double VBlankTime;
>         double SmallestVBlank;
>         enum dm_prefetch_modes AllowForPStateChangeOrStutterInVBlankFinal=
; // Mode Support only
> -       double DCFCLKDeepSleepPerSurface[DC__NUM_DPP__MAX];
>         double DCFCLKDeepSleepPerPlane[DC__NUM_DPP__MAX];
>         double EffectiveDETPlusLBLinesLuma;
>         double EffectiveDETPlusLBLinesChroma;
> @@ -297,7 +295,6 @@ struct vba_vars_st {
>         double SMNLatency;
>         double FCLKChangeLatency;
>         unsigned int MALLAllocatedForDCNFinal;
> -       double DefaultGPUVMMinPageSizeKBytes; // Default for the project
>         double MaxAveragePercentOfIdealFabricBWDisplayCanUseInNormalSyste=
mOperation;
>         double MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemO=
perationSTROBE;
>         double PercentOfIdealDRAMBWReceivedAfterUrgLatencySTROBE;
> @@ -819,8 +816,6 @@ struct vba_vars_st {
>         double         dummy8[DC__NUM_DPP__MAX];
>         double         dummy13[DC__NUM_DPP__MAX];
>         double         dummy_double_array[2][DC__NUM_DPP__MAX];
> -       unsigned int        dummyinteger1ms[DC__NUM_DPP__MAX];
> -       double        dummyinteger2ms[DC__NUM_DPP__MAX];
>         unsigned int        dummyinteger3[DC__NUM_DPP__MAX];
>         unsigned int        dummyinteger4[DC__NUM_DPP__MAX];
>         unsigned int        dummyinteger5;
> @@ -830,16 +825,7 @@ struct vba_vars_st {
>         unsigned int        dummyinteger9;
>         unsigned int        dummyinteger10;
>         unsigned int        dummyinteger11;
> -       unsigned int        dummyinteger12;
> -       unsigned int        dummyinteger30;
> -       unsigned int        dummyinteger31;
> -       unsigned int        dummyinteger32;
> -       unsigned int        dummyintegerarr1[DC__NUM_DPP__MAX];
> -       unsigned int        dummyintegerarr2[DC__NUM_DPP__MAX];
> -       unsigned int        dummyintegerarr3[DC__NUM_DPP__MAX];
> -       unsigned int        dummyintegerarr4[DC__NUM_DPP__MAX];
>         unsigned int        dummy_integer_array[8][DC__NUM_DPP__MAX];
> -       unsigned int        dummy_integer_array22[22][DC__NUM_DPP__MAX];
>
>         bool           dummysinglestring;
>         bool           SingleDPPViewportSizeSupportPerPlane[DC__NUM_DPP__=
MAX];
> @@ -980,7 +966,6 @@ struct vba_vars_st {
>         double TimePerChromaMetaChunkFlip[DC__NUM_DPP__MAX];
>         unsigned int DCCCMaxUncompressedBlock[DC__NUM_DPP__MAX];
>         unsigned int DCCCMaxCompressedBlock[DC__NUM_DPP__MAX];
> -       unsigned int DCCCIndependent64ByteBlock[DC__NUM_DPP__MAX];
>         double VStartupMargin;
>         bool NotEnoughTimeForDynamicMetadata[DC__NUM_DPP__MAX];
>
> @@ -1085,8 +1070,6 @@ struct vba_vars_st {
>         double WritebackDelayTime[DC__NUM_DPP__MAX];
>         unsigned int DCCYIndependentBlock[DC__NUM_DPP__MAX];
>         unsigned int DCCCIndependentBlock[DC__NUM_DPP__MAX];
> -       unsigned int dummyinteger15;
> -       unsigned int dummyinteger16;
>         unsigned int dummyinteger17;
>         unsigned int dummyinteger18;
>         unsigned int dummyinteger19;
> @@ -1147,17 +1130,11 @@ struct vba_vars_st {
>         int Z8NumberOfStutterBurstsPerFrame;
>         unsigned int MaximumDSCBitsPerComponent;
>         unsigned int NotEnoughUrgentLatencyHidingA[DC__VOLTAGE_STATES][2]=
;
> -       double UrgentLatencyWithUSRRetraining;
> -       double UrgLatencyWithUSRRetraining[DC__VOLTAGE_STATES];
>         double ReadBandwidthSurfaceLuma[DC__NUM_DPP__MAX];
>         double ReadBandwidthSurfaceChroma[DC__NUM_DPP__MAX];
>         double SurfaceRequiredDISPCLKWithoutODMCombine;
>         double SurfaceRequiredDISPCLK;
> -       double SurfaceRequiredDISPCLKWithODMCombine2To1;
> -       double SurfaceRequiredDISPCLKWithODMCombine4To1;
>         double MinActiveFCLKChangeLatencySupported;
> -       double dummy14;
> -       double dummy15;
>         int MinVoltageLevel;
>         int MaxVoltageLevel;
>         unsigned int TotalNumberOfSingleDPPSurfaces[DC__VOLTAGE_STATES][2=
];
> @@ -1168,17 +1145,10 @@ struct vba_vars_st {
>         bool ExceededMALLSize;
>         bool PTE_BUFFER_MODE[DC__NUM_DPP__MAX];
>         unsigned int BIGK_FRAGMENT_SIZE[DC__NUM_DPP__MAX];
> -       unsigned int dummyinteger33;
>         unsigned int CompressedBufferSizeInkByteThisState;
>         enum dm_fclock_change_support FCLKChangeSupport[DC__VOLTAGE_STATE=
S][2];
> -       Latencies myLatency;
> -       Latencies mLatency;
> -       Watermarks DummyWatermark;
>         bool USRRetrainingSupport[DC__VOLTAGE_STATES][2];
> -       bool dummyBooleanvector1[DC__NUM_DPP__MAX];
> -       bool dummyBooleanvector2[DC__NUM_DPP__MAX];
>         enum dm_use_mall_for_pstate_change_mode UsesMALLForPStateChange[D=
C__NUM_DPP__MAX];
> -       bool NotEnoughUrgentLatencyHiding_dml32[DC__VOLTAGE_STATES][2];
>         bool UnboundedRequestEnabledAllStates[DC__VOLTAGE_STATES][2];
>         bool SingleDPPViewportSizeSupportPerSurface[DC__NUM_DPP__MAX];
>         enum dm_use_mall_for_static_screen_mode UseMALLForStaticScreen[DC=
__NUM_DPP__MAX];
> @@ -1186,9 +1156,6 @@ struct vba_vars_st {
>         bool DRAMClockChangeRequirementFinal;
>         bool FCLKChangeRequirementFinal;
>         bool USRRetrainingRequiredFinal;
> -       bool MALLUseFinal;
> -       bool ConfigurableDETSizeEnFinal;
> -       bool dummyboolean;
>         unsigned int DETSizeOverride[DC__NUM_DPP__MAX];
>         unsigned int nomDETInKByte;
>         enum mpc_combine_affinity  MPCCombineUse[DC__NUM_DPP__MAX];
> --
> 2.36.1
>
