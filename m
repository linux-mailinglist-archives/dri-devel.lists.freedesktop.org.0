Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940FA5BEAC8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 18:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A646710E705;
	Tue, 20 Sep 2022 16:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED45110E704;
 Tue, 20 Sep 2022 16:06:58 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 f20-20020a9d7b54000000b006574e21f1b6so2048549oto.5; 
 Tue, 20 Sep 2022 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=fPO3niesXLPuIBvl16MuqansIpb5OJYa66EGif/RAEY=;
 b=XyKUHVw6BseG+DMb/7f31+sxqL8zVw4TCrFbiW5GsuVjhCYhKeZM4vbOzFSiiLWlbf
 MA0QKS3ar2TEuCXEM8QMbFo5Rkd1k6HIeJVTP65Y3s5VR836st1/cpECfLVjYBc6OPXk
 6b8k3Gwyok2UYAixrt767gDsQPj8/zQ70xHRDFa7IvSO8toZDSFxBJclu0ujQb91Sna7
 2c0egx+D6Ejc6eF2qwB4i99o/5bIf2xFHmNZxzdCeSUSZvU8YKnCpb0JEvob6YXgOR4B
 7oTvuCv7t5pMbJJKfW205bTwDHf4MaIvRyxaW+EkndvqeOQGSWhYVnllWtUdDfv8HMNL
 cEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fPO3niesXLPuIBvl16MuqansIpb5OJYa66EGif/RAEY=;
 b=y7xW5cg+V+XPhCOFBuhyCTzBxlEEVQT0brRVUngDt2hxxOtgEWNxUOxyxVW+QkQhUY
 k5FkPeuBQfq6JIR+sbjJp4KwIxXvN9y9JZdsQrprZC49UGCmhB9TXhJKecDcvpaCIMBB
 HMpBqkBw//PVXBsiSQehpLBWN/C/qb3knapl8CAOV91ijFSfTgFem1s6wVuOAqnxLbld
 8fRqF50wE8WJjVyMrQzwXMkFaOjexdQVBVPnXeYLDVBa/V3rDFvzqPBeKdX5uL5JqGjP
 QVjdeaBE9cpadRobDvRrVpYLCjdFumM0WDPxYWLIUNGgqtTX4l6j2R3VsIW3bsNUNNtP
 lr5w==
X-Gm-Message-State: ACrzQf3anov56Nneue0C8QHWNbGphaGl2HEPN+Oi+lm0PzpBwFL4Y4ZK
 reyrkXlNAn3U3xOpy1caOrtD4etuBDFjJeb0cp4=
X-Google-Smtp-Source: AMsMyM7DtCVNxcR1OM6/Z1J2KmxjZ2uIkWWKYOipntM5aa6+Ussk9x9mTPkTjU+4Q3vmhtyDuIkCHaT33oylRVo4oWA=
X-Received: by 2002:a9d:376:0:b0:655:b4bc:fd6e with SMTP id
 109-20020a9d0376000000b00655b4bcfd6emr10659708otv.233.1663690017993; Tue, 20
 Sep 2022 09:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220916210658.3412450-1-nathan@kernel.org>
 <5e0b4692-b3ac-20ce-bd0b-65f52804601b@riseup.net>
In-Reply-To: <5e0b4692-b3ac-20ce-bd0b-65f52804601b@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Sep 2022 12:06:46 -0400
Message-ID: <CADnq5_O67aFW95nNbgPJipypnpzAC-HO=FYkdxOMpOJQXF+CKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Reduce number of arguments of
 dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
 "kernelci.org bot" <bot@kernelci.org>, Leo Li <sunpeng.li@amd.com>,
 Tom Rix <trix@redhat.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Sat, Sep 17, 2022 at 8:38 AM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> Hi Nathan,
>
> On 9/16/22 18:06, Nathan Chancellor wrote:
> > Most of the arguments are identical between the two call sites and they
> > can be accessed through the 'struct vba_vars_st' pointer. This reduces
> > the total amount of stack space that
> > dml314_ModeSupportAndSystemConfigurationFull() uses by 240 bytes with
> > LLVM 16 (2216 -> 1976), helping clear up the following clang warning:
> >
> >   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_=
314.c:4020:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31=
4_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> >   void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode=
_lib *mode_lib)
> >        ^
> >   1 error generated.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1710
> > Reported-by: "kernelci.org bot" <bot@kernelci.org>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> I have built-tested the whole series with clang 14.0.5 (Fedora
> 14.0.5-1.fc36), using:
>
> $ make -kj"$(nproc)" ARCH=3Dx86_64 LLVM=3D1 mrproper allmodconfig
> drivers/gpu/drm/amd/amdgpu/
>
> Another great patch to the DML! As Tom, I also would like to see this
> expand to all display_mode_vba files, but so far this is great to
> unbreak the build.
>
> To the whole series:
>
> Tested-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
>
> Best Regards,
> - Ma=C3=ADra Canal
>
> > ---
> >
> > This is just commit ab2ac59c32db ("drm/amd/display: Reduce number of
> > arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()")
> > applied to dml314.
> >
> >  .../dc/dml/dcn314/display_mode_vba_314.c      | 248 ++++--------------
> >  1 file changed, 52 insertions(+), 196 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba=
_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> > index 2829f179f982..32ceb72f7a14 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> > @@ -325,64 +325,28 @@ static void CalculateVupdateAndDynamicMetadataPar=
ameters(
> >  static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> >               struct display_mode_lib *mode_lib,
> >               unsigned int PrefetchMode,
> > -             unsigned int NumberOfActivePlanes,
> > -             unsigned int MaxLineBufferLines,
> > -             unsigned int LineBufferSize,
> > -             unsigned int WritebackInterfaceBufferSize,
> >               double DCFCLK,
> >               double ReturnBW,
> > -             bool SynchronizedVBlank,
> > -             unsigned int dpte_group_bytes[],
> > -             unsigned int MetaChunkSize,
> >               double UrgentLatency,
> >               double ExtraLatency,
> > -             double WritebackLatency,
> > -             double WritebackChunkSize,
> >               double SOCCLK,
> > -             double DRAMClockChangeLatency,
> > -             double SRExitTime,
> > -             double SREnterPlusExitTime,
> > -             double SRExitZ8Time,
> > -             double SREnterPlusExitZ8Time,
> >               double DCFCLKDeepSleep,
> >               unsigned int DETBufferSizeY[],
> >               unsigned int DETBufferSizeC[],
> >               unsigned int SwathHeightY[],
> >               unsigned int SwathHeightC[],
> > -             unsigned int LBBitPerPixel[],
> >               double SwathWidthY[],
> >               double SwathWidthC[],
> > -             double HRatio[],
> > -             double HRatioChroma[],
> > -             unsigned int vtaps[],
> > -             unsigned int VTAPsChroma[],
> > -             double VRatio[],
> > -             double VRatioChroma[],
> > -             unsigned int HTotal[],
> > -             double PixelClock[],
> > -             unsigned int BlendingAndTiming[],
> >               unsigned int DPPPerPlane[],
> >               double BytePerPixelDETY[],
> >               double BytePerPixelDETC[],
> > -             double DSTXAfterScaler[],
> > -             double DSTYAfterScaler[],
> > -             bool WritebackEnable[],
> > -             enum source_format_class WritebackPixelFormat[],
> > -             double WritebackDestinationWidth[],
> > -             double WritebackDestinationHeight[],
> > -             double WritebackSourceHeight[],
> >               bool UnboundedRequestEnabled,
> >               unsigned int CompressedBufferSizeInkByte,
> >               enum clock_change_support *DRAMClockChangeSupport,
> > -             double *UrgentWatermark,
> > -             double *WritebackUrgentWatermark,
> > -             double *DRAMClockChangeWatermark,
> > -             double *WritebackDRAMClockChangeWatermark,
> >               double *StutterExitWatermark,
> >               double *StutterEnterPlusExitWatermark,
> >               double *Z8StutterExitWatermark,
> > -             double *Z8StutterEnterPlusExitWatermark,
> > -             double *MinActiveDRAMClockChangeLatencySupported);
> > +             double *Z8StutterEnterPlusExitWatermark);
> >
> >  static void CalculateDCFCLKDeepSleep(
> >               struct display_mode_lib *mode_lib,
> > @@ -3041,64 +3005,28 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetc=
hParametersWatermarksAndPerforman
> >               CalculateWatermarksAndDRAMSpeedChangeSupport(
> >                               mode_lib,
> >                               PrefetchMode,
> > -                             v->NumberOfActivePlanes,
> > -                             v->MaxLineBufferLines,
> > -                             v->LineBufferSize,
> > -                             v->WritebackInterfaceBufferSize,
> >                               v->DCFCLK,
> >                               v->ReturnBW,
> > -                             v->SynchronizedVBlank,
> > -                             v->dpte_group_bytes,
> > -                             v->MetaChunkSize,
> >                               v->UrgentLatency,
> >                               v->UrgentExtraLatency,
> > -                             v->WritebackLatency,
> > -                             v->WritebackChunkSize,
> >                               v->SOCCLK,
> > -                             v->DRAMClockChangeLatency,
> > -                             v->SRExitTime,
> > -                             v->SREnterPlusExitTime,
> > -                             v->SRExitZ8Time,
> > -                             v->SREnterPlusExitZ8Time,
> >                               v->DCFCLKDeepSleep,
> >                               v->DETBufferSizeY,
> >                               v->DETBufferSizeC,
> >                               v->SwathHeightY,
> >                               v->SwathHeightC,
> > -                             v->LBBitPerPixel,
> >                               v->SwathWidthY,
> >                               v->SwathWidthC,
> > -                             v->HRatio,
> > -                             v->HRatioChroma,
> > -                             v->vtaps,
> > -                             v->VTAPsChroma,
> > -                             v->VRatio,
> > -                             v->VRatioChroma,
> > -                             v->HTotal,
> > -                             v->PixelClock,
> > -                             v->BlendingAndTiming,
> >                               v->DPPPerPlane,
> >                               v->BytePerPixelDETY,
> >                               v->BytePerPixelDETC,
> > -                             v->DSTXAfterScaler,
> > -                             v->DSTYAfterScaler,
> > -                             v->WritebackEnable,
> > -                             v->WritebackPixelFormat,
> > -                             v->WritebackDestinationWidth,
> > -                             v->WritebackDestinationHeight,
> > -                             v->WritebackSourceHeight,
> >                               v->UnboundedRequestEnabled,
> >                               v->CompressedBufferSizeInkByte,
> >                               &DRAMClockChangeSupport,
> > -                             &v->UrgentWatermark,
> > -                             &v->WritebackUrgentWatermark,
> > -                             &v->DRAMClockChangeWatermark,
> > -                             &v->WritebackDRAMClockChangeWatermark,
> >                               &v->StutterExitWatermark,
> >                               &v->StutterEnterPlusExitWatermark,
> >                               &v->Z8StutterExitWatermark,
> > -                             &v->Z8StutterEnterPlusExitWatermark,
> > -                             &v->MinActiveDRAMClockChangeLatencySuppor=
ted);
> > +                             &v->Z8StutterEnterPlusExitWatermark);
> >
> >               for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> >                       if (v->WritebackEnable[k] =3D=3D true) {
> > @@ -5496,64 +5424,28 @@ void dml314_ModeSupportAndSystemConfigurationFu=
ll(struct display_mode_lib *mode_
> >                       CalculateWatermarksAndDRAMSpeedChangeSupport(
> >                                       mode_lib,
> >                                       v->PrefetchModePerState[i][j],
> > -                                     v->NumberOfActivePlanes,
> > -                                     v->MaxLineBufferLines,
> > -                                     v->LineBufferSize,
> > -                                     v->WritebackInterfaceBufferSize,
> >                                       v->DCFCLKState[i][j],
> >                                       v->ReturnBWPerState[i][j],
> > -                                     v->SynchronizedVBlank,
> > -                                     v->dpte_group_bytes,
> > -                                     v->MetaChunkSize,
> >                                       v->UrgLatency[i],
> >                                       v->ExtraLatency,
> > -                                     v->WritebackLatency,
> > -                                     v->WritebackChunkSize,
> >                                       v->SOCCLKPerState[i],
> > -                                     v->DRAMClockChangeLatency,
> > -                                     v->SRExitTime,
> > -                                     v->SREnterPlusExitTime,
> > -                                     v->SRExitZ8Time,
> > -                                     v->SREnterPlusExitZ8Time,
> >                                       v->ProjectedDCFCLKDeepSleep[i][j]=
,
> >                                       v->DETBufferSizeYThisState,
> >                                       v->DETBufferSizeCThisState,
> >                                       v->SwathHeightYThisState,
> >                                       v->SwathHeightCThisState,
> > -                                     v->LBBitPerPixel,
> >                                       v->SwathWidthYThisState,
> >                                       v->SwathWidthCThisState,
> > -                                     v->HRatio,
> > -                                     v->HRatioChroma,
> > -                                     v->vtaps,
> > -                                     v->VTAPsChroma,
> > -                                     v->VRatio,
> > -                                     v->VRatioChroma,
> > -                                     v->HTotal,
> > -                                     v->PixelClock,
> > -                                     v->BlendingAndTiming,
> >                                       v->NoOfDPPThisState,
> >                                       v->BytePerPixelInDETY,
> >                                       v->BytePerPixelInDETC,
> > -                                     v->DSTXAfterScaler,
> > -                                     v->DSTYAfterScaler,
> > -                                     v->WritebackEnable,
> > -                                     v->WritebackPixelFormat,
> > -                                     v->WritebackDestinationWidth,
> > -                                     v->WritebackDestinationHeight,
> > -                                     v->WritebackSourceHeight,
> >                                       UnboundedRequestEnabledThisState,
> >                                       CompressedBufferSizeInkByteThisSt=
ate,
> >                                       &v->DRAMClockChangeSupport[i][j],
> > -                                     &v->UrgentWatermark,
> > -                                     &v->WritebackUrgentWatermark,
> > -                                     &v->DRAMClockChangeWatermark,
> > -                                     &v->WritebackDRAMClockChangeWater=
mark,
> > -                                     &dummy,
> >                                       &dummy,
> >                                       &dummy,
> >                                       &dummy,
> > -                                     &v->MinActiveDRAMClockChangeLaten=
cySupported);
> > +                                     &dummy);
> >               }
> >       }
> >
> > @@ -5679,64 +5571,28 @@ void dml314_ModeSupportAndSystemConfigurationFu=
ll(struct display_mode_lib *mode_
> >  static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> >               struct display_mode_lib *mode_lib,
> >               unsigned int PrefetchMode,
> > -             unsigned int NumberOfActivePlanes,
> > -             unsigned int MaxLineBufferLines,
> > -             unsigned int LineBufferSize,
> > -             unsigned int WritebackInterfaceBufferSize,
> >               double DCFCLK,
> >               double ReturnBW,
> > -             bool SynchronizedVBlank,
> > -             unsigned int dpte_group_bytes[],
> > -             unsigned int MetaChunkSize,
> >               double UrgentLatency,
> >               double ExtraLatency,
> > -             double WritebackLatency,
> > -             double WritebackChunkSize,
> >               double SOCCLK,
> > -             double DRAMClockChangeLatency,
> > -             double SRExitTime,
> > -             double SREnterPlusExitTime,
> > -             double SRExitZ8Time,
> > -             double SREnterPlusExitZ8Time,
> >               double DCFCLKDeepSleep,
> >               unsigned int DETBufferSizeY[],
> >               unsigned int DETBufferSizeC[],
> >               unsigned int SwathHeightY[],
> >               unsigned int SwathHeightC[],
> > -             unsigned int LBBitPerPixel[],
> >               double SwathWidthY[],
> >               double SwathWidthC[],
> > -             double HRatio[],
> > -             double HRatioChroma[],
> > -             unsigned int vtaps[],
> > -             unsigned int VTAPsChroma[],
> > -             double VRatio[],
> > -             double VRatioChroma[],
> > -             unsigned int HTotal[],
> > -             double PixelClock[],
> > -             unsigned int BlendingAndTiming[],
> >               unsigned int DPPPerPlane[],
> >               double BytePerPixelDETY[],
> >               double BytePerPixelDETC[],
> > -             double DSTXAfterScaler[],
> > -             double DSTYAfterScaler[],
> > -             bool WritebackEnable[],
> > -             enum source_format_class WritebackPixelFormat[],
> > -             double WritebackDestinationWidth[],
> > -             double WritebackDestinationHeight[],
> > -             double WritebackSourceHeight[],
> >               bool UnboundedRequestEnabled,
> >               unsigned int CompressedBufferSizeInkByte,
> >               enum clock_change_support *DRAMClockChangeSupport,
> > -             double *UrgentWatermark,
> > -             double *WritebackUrgentWatermark,
> > -             double *DRAMClockChangeWatermark,
> > -             double *WritebackDRAMClockChangeWatermark,
> >               double *StutterExitWatermark,
> >               double *StutterEnterPlusExitWatermark,
> >               double *Z8StutterExitWatermark,
> > -             double *Z8StutterEnterPlusExitWatermark,
> > -             double *MinActiveDRAMClockChangeLatencySupported)
> > +             double *Z8StutterEnterPlusExitWatermark)
> >  {
> >       struct vba_vars_st *v =3D &mode_lib->vba;
> >       double EffectiveLBLatencyHidingY;
> > @@ -5756,103 +5612,103 @@ static void CalculateWatermarksAndDRAMSpeedCh=
angeSupport(
> >       double TotalPixelBW =3D 0.0;
> >       int k, j;
> >
> > -     *UrgentWatermark =3D UrgentLatency + ExtraLatency;
> > +     v->UrgentWatermark =3D UrgentLatency + ExtraLatency;
> >
> >  #ifdef __DML_VBA_DEBUG__
> >       dml_print("DML::%s: UrgentLatency =3D %f\n", __func__, UrgentLate=
ncy);
> >       dml_print("DML::%s: ExtraLatency =3D %f\n", __func__, ExtraLatenc=
y);
> > -     dml_print("DML::%s: UrgentWatermark =3D %f\n", __func__, *UrgentW=
atermark);
> > +     dml_print("DML::%s: UrgentWatermark =3D %f\n", __func__, v->Urgen=
tWatermark);
> >  #endif
> >
> > -     *DRAMClockChangeWatermark =3D DRAMClockChangeLatency + *UrgentWat=
ermark;
> > +     v->DRAMClockChangeWatermark =3D v->DRAMClockChangeLatency + v->Ur=
gentWatermark;
> >
> >  #ifdef __DML_VBA_DEBUG__
> > -     dml_print("DML::%s: DRAMClockChangeLatency =3D %f\n", __func__, D=
RAMClockChangeLatency);
> > -     dml_print("DML::%s: DRAMClockChangeWatermark =3D %f\n", __func__,=
 *DRAMClockChangeWatermark);
> > +     dml_print("DML::%s: v->DRAMClockChangeLatency =3D %f\n", __func__=
, v->DRAMClockChangeLatency);
> > +     dml_print("DML::%s: DRAMClockChangeWatermark =3D %f\n", __func__,=
 v->DRAMClockChangeWatermark);
> >  #endif
> >
> >       v->TotalActiveWriteback =3D 0;
> > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > -             if (WritebackEnable[k] =3D=3D true) {
> > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > +             if (v->WritebackEnable[k] =3D=3D true) {
> >                       v->TotalActiveWriteback =3D v->TotalActiveWriteba=
ck + 1;
> >               }
> >       }
> >
> >       if (v->TotalActiveWriteback <=3D 1) {
> > -             *WritebackUrgentWatermark =3D WritebackLatency;
> > +             v->WritebackUrgentWatermark =3D v->WritebackLatency;
> >       } else {
> > -             *WritebackUrgentWatermark =3D WritebackLatency + Writebac=
kChunkSize * 1024.0 / 32.0 / SOCCLK;
> > +             v->WritebackUrgentWatermark =3D v->WritebackLatency + v->=
WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> >       }
> >
> >       if (v->TotalActiveWriteback <=3D 1) {
> > -             *WritebackDRAMClockChangeWatermark =3D DRAMClockChangeLat=
ency + WritebackLatency;
> > +             v->WritebackDRAMClockChangeWatermark =3D v->DRAMClockChan=
geLatency + v->WritebackLatency;
> >       } else {
> > -             *WritebackDRAMClockChangeWatermark =3D DRAMClockChangeLat=
ency + WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> > +             v->WritebackDRAMClockChangeWatermark =3D v->DRAMClockChan=
geLatency + v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / S=
OCCLK;
> >       }
> >
> > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> >               TotalPixelBW =3D TotalPixelBW
> > -                             + DPPPerPlane[k] * (SwathWidthY[k] * Byte=
PerPixelDETY[k] * VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * VRatio=
Chroma[k])
> > -                                             / (HTotal[k] / PixelClock=
[k]);
> > +                             + DPPPerPlane[k] * (SwathWidthY[k] * Byte=
PerPixelDETY[k] * v->VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * v->=
VRatioChroma[k])
> > +                                             / (v->HTotal[k] / v->Pixe=
lClock[k]);
> >       }
> >
> > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> >               double EffectiveDETBufferSizeY =3D DETBufferSizeY[k];
> >
> >               v->LBLatencyHidingSourceLinesY =3D dml_min(
> > -                             (double) MaxLineBufferLines,
> > -                             dml_floor(LineBufferSize / LBBitPerPixel[=
k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (vtaps[k] - 1);
> > +                             (double) v->MaxLineBufferLines,
> > +                             dml_floor(v->LineBufferSize / v->LBBitPer=
Pixel[k] / (SwathWidthY[k] / dml_max(v->HRatio[k], 1.0)), 1)) - (v->vtaps[k=
] - 1);
> >
> >               v->LBLatencyHidingSourceLinesC =3D dml_min(
> > -                             (double) MaxLineBufferLines,
> > -                             dml_floor(LineBufferSize / LBBitPerPixel[=
k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTAPsChroma[k=
] - 1);
> > +                             (double) v->MaxLineBufferLines,
> > +                             dml_floor(v->LineBufferSize / v->LBBitPer=
Pixel[k] / (SwathWidthC[k] / dml_max(v->HRatioChroma[k], 1.0)), 1)) - (v->V=
TAPsChroma[k] - 1);
> >
> > -             EffectiveLBLatencyHidingY =3D v->LBLatencyHidingSourceLin=
esY / VRatio[k] * (HTotal[k] / PixelClock[k]);
> > +             EffectiveLBLatencyHidingY =3D v->LBLatencyHidingSourceLin=
esY / v->VRatio[k] * (v->HTotal[k] / v->PixelClock[k]);
> >
> > -             EffectiveLBLatencyHidingC =3D v->LBLatencyHidingSourceLin=
esC / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
> > +             EffectiveLBLatencyHidingC =3D v->LBLatencyHidingSourceLin=
esC / v->VRatioChroma[k] * (v->HTotal[k] / v->PixelClock[k]);
> >
> >               if (UnboundedRequestEnabled) {
> >                       EffectiveDETBufferSizeY =3D EffectiveDETBufferSiz=
eY
> > -                                     + CompressedBufferSizeInkByte * 1=
024 * SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] / (HTotal[k] / Pixel=
Clock[k]) / TotalPixelBW;
> > +                                     + CompressedBufferSizeInkByte * 1=
024 * SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] / (v->HTotal[k] /=
 v->PixelClock[k]) / TotalPixelBW;
> >               }
> >
> >               LinesInDETY[k] =3D (double) EffectiveDETBufferSizeY / Byt=
ePerPixelDETY[k] / SwathWidthY[k];
> >               LinesInDETYRoundedDownToSwath[k] =3D dml_floor(LinesInDET=
Y[k], SwathHeightY[k]);
> > -             FullDETBufferingTimeY =3D LinesInDETYRoundedDownToSwath[k=
] * (HTotal[k] / PixelClock[k]) / VRatio[k];
> > +             FullDETBufferingTimeY =3D LinesInDETYRoundedDownToSwath[k=
] * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
> >               if (BytePerPixelDETC[k] > 0) {
> >                       LinesInDETC =3D v->DETBufferSizeC[k] / BytePerPix=
elDETC[k] / SwathWidthC[k];
> >                       LinesInDETCRoundedDownToSwath =3D dml_floor(Lines=
InDETC, SwathHeightC[k]);
> > -                     FullDETBufferingTimeC =3D LinesInDETCRoundedDownT=
oSwath * (HTotal[k] / PixelClock[k]) / VRatioChroma[k];
> > +                     FullDETBufferingTimeC =3D LinesInDETCRoundedDownT=
oSwath * (v->HTotal[k] / v->PixelClock[k]) / v->VRatioChroma[k];
> >               } else {
> >                       LinesInDETC =3D 0;
> >                       FullDETBufferingTimeC =3D 999999;
> >               }
> >
> >               ActiveDRAMClockChangeLatencyMarginY =3D EffectiveLBLatenc=
yHidingY + FullDETBufferingTimeY
> > -                             - ((double) DSTXAfterScaler[k] / HTotal[k=
] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWatermark - *D=
RAMClockChangeWatermark;
> > +                             - ((double) v->DSTXAfterScaler[k] / v->HT=
otal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] - v->Urg=
entWatermark - v->DRAMClockChangeWatermark;
> >
> > -             if (NumberOfActivePlanes > 1) {
> > +             if (v->NumberOfActivePlanes > 1) {
> >                       ActiveDRAMClockChangeLatencyMarginY =3D ActiveDRA=
MClockChangeLatencyMarginY
> > -                                     - (1 - 1.0 / NumberOfActivePlanes=
) * SwathHeightY[k] * HTotal[k] / PixelClock[k] / VRatio[k];
> > +                                     - (1 - 1.0 / v->NumberOfActivePla=
nes) * SwathHeightY[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatio[k];
> >               }
> >
> >               if (BytePerPixelDETC[k] > 0) {
> >                       ActiveDRAMClockChangeLatencyMarginC =3D Effective=
LBLatencyHidingC + FullDETBufferingTimeC
> > -                                     - ((double) DSTXAfterScaler[k] / =
HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWaterm=
ark - *DRAMClockChangeWatermark;
> > +                                     - ((double) v->DSTXAfterScaler[k]=
 / v->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] =
- v->UrgentWatermark - v->DRAMClockChangeWatermark;
> >
> > -                     if (NumberOfActivePlanes > 1) {
> > +                     if (v->NumberOfActivePlanes > 1) {
> >                               ActiveDRAMClockChangeLatencyMarginC =3D A=
ctiveDRAMClockChangeLatencyMarginC
> > -                                             - (1 - 1.0 / NumberOfActi=
vePlanes) * SwathHeightC[k] * HTotal[k] / PixelClock[k] / VRatioChroma[k];
> > +                                             - (1 - 1.0 / v->NumberOfA=
ctivePlanes) * SwathHeightC[k] * v->HTotal[k] / v->PixelClock[k] / v->VRati=
oChroma[k];
> >                       }
> >                       v->ActiveDRAMClockChangeLatencyMargin[k] =3D dml_=
min(ActiveDRAMClockChangeLatencyMarginY, ActiveDRAMClockChangeLatencyMargin=
C);
> >               } else {
> >                       v->ActiveDRAMClockChangeLatencyMargin[k] =3D Acti=
veDRAMClockChangeLatencyMarginY;
> >               }
> >
> > -             if (WritebackEnable[k] =3D=3D true) {
> > -                     WritebackDRAMClockChangeLatencyHiding =3D Writeba=
ckInterfaceBufferSize * 1024
> > -                                     / (WritebackDestinationWidth[k] *=
 WritebackDestinationHeight[k] / (WritebackSourceHeight[k] * HTotal[k] / Pi=
xelClock[k]) * 4);
> > -                     if (WritebackPixelFormat[k] =3D=3D dm_444_64) {
> > +             if (v->WritebackEnable[k] =3D=3D true) {
> > +                     WritebackDRAMClockChangeLatencyHiding =3D v->Writ=
ebackInterfaceBufferSize * 1024
> > +                                     / (v->WritebackDestinationWidth[k=
] * v->WritebackDestinationHeight[k] / (v->WritebackSourceHeight[k] * v->HT=
otal[k] / v->PixelClock[k]) * 4);
> > +                     if (v->WritebackPixelFormat[k] =3D=3D dm_444_64) =
{
> >                               WritebackDRAMClockChangeLatencyHiding =3D=
 WritebackDRAMClockChangeLatencyHiding / 2;
> >                       }
> >                       WritebackDRAMClockChangeLatencyMargin =3D Writeba=
ckDRAMClockChangeLatencyHiding - v->WritebackDRAMClockChangeWatermark;
> > @@ -5862,14 +5718,14 @@ static void CalculateWatermarksAndDRAMSpeedChan=
geSupport(
> >
> >       v->MinActiveDRAMClockChangeMargin =3D 999999;
> >       PlaneWithMinActiveDRAMClockChangeMargin =3D 0;
> > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> >               if (v->ActiveDRAMClockChangeLatencyMargin[k] < v->MinActi=
veDRAMClockChangeMargin) {
> >                       v->MinActiveDRAMClockChangeMargin =3D v->ActiveDR=
AMClockChangeLatencyMargin[k];
> > -                     if (BlendingAndTiming[k] =3D=3D k) {
> > +                     if (v->BlendingAndTiming[k] =3D=3D k) {
> >                               PlaneWithMinActiveDRAMClockChangeMargin =
=3D k;
> >                       } else {
> > -                             for (j =3D 0; j < NumberOfActivePlanes; +=
+j) {
> > -                                     if (BlendingAndTiming[k] =3D=3D j=
) {
> > +                             for (j =3D 0; j < v->NumberOfActivePlanes=
; ++j) {
> > +                                     if (v->BlendingAndTiming[k] =3D=
=3D j) {
> >                                               PlaneWithMinActiveDRAMClo=
ckChangeMargin =3D j;
> >                                       }
> >                               }
> > @@ -5877,11 +5733,11 @@ static void CalculateWatermarksAndDRAMSpeedChan=
geSupport(
> >               }
> >       }
> >
> > -     *MinActiveDRAMClockChangeLatencySupported =3D v->MinActiveDRAMClo=
ckChangeMargin + DRAMClockChangeLatency;
> > +     v->MinActiveDRAMClockChangeLatencySupported =3D v->MinActiveDRAMC=
lockChangeMargin + v->DRAMClockChangeLatency ;
> >
> >       SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank =3D 999999=
;
> > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > -             if (!((k =3D=3D PlaneWithMinActiveDRAMClockChangeMargin) =
&& (BlendingAndTiming[k] =3D=3D k)) && !(BlendingAndTiming[k] =3D=3D PlaneW=
ithMinActiveDRAMClockChangeMargin)
> > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > +             if (!((k =3D=3D PlaneWithMinActiveDRAMClockChangeMargin) =
&& (v->BlendingAndTiming[k] =3D=3D k)) && !(v->BlendingAndTiming[k] =3D=3D =
PlaneWithMinActiveDRAMClockChangeMargin)
> >                               && v->ActiveDRAMClockChangeLatencyMargin[=
k] < SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank) {
> >                       SecondMinActiveDRAMClockChangeMarginOneDisplayInV=
BLank =3D v->ActiveDRAMClockChangeLatencyMargin[k];
> >               }
> > @@ -5889,25 +5745,25 @@ static void CalculateWatermarksAndDRAMSpeedChan=
geSupport(
> >
> >       v->TotalNumberOfActiveOTG =3D 0;
> >
> > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > -             if (BlendingAndTiming[k] =3D=3D k) {
> > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > +             if (v->BlendingAndTiming[k] =3D=3D k) {
> >                       v->TotalNumberOfActiveOTG =3D v->TotalNumberOfAct=
iveOTG + 1;
> >               }
> >       }
> >
> >       if (v->MinActiveDRAMClockChangeMargin > 0 && PrefetchMode =3D=3D =
0) {
> >               *DRAMClockChangeSupport =3D dm_dram_clock_change_vactive;
> > -     } else if ((SynchronizedVBlank =3D=3D true || v->TotalNumberOfAct=
iveOTG =3D=3D 1
> > +     } else if ((v->SynchronizedVBlank =3D=3D true || v->TotalNumberOf=
ActiveOTG =3D=3D 1
> >                       || SecondMinActiveDRAMClockChangeMarginOneDisplay=
InVBLank > 0) && PrefetchMode =3D=3D 0) {
> >               *DRAMClockChangeSupport =3D dm_dram_clock_change_vblank;
> >       } else {
> >               *DRAMClockChangeSupport =3D dm_dram_clock_change_unsuppor=
ted;
> >       }
> >
> > -     *StutterExitWatermark =3D SRExitTime + ExtraLatency + 10 / DCFCLK=
DeepSleep;
> > -     *StutterEnterPlusExitWatermark =3D (SREnterPlusExitTime + ExtraLa=
tency + 10 / DCFCLKDeepSleep);
> > -     *Z8StutterExitWatermark =3D SRExitZ8Time + ExtraLatency + 10 / DC=
FCLKDeepSleep;
> > -     *Z8StutterEnterPlusExitWatermark =3D SREnterPlusExitZ8Time + Extr=
aLatency + 10 / DCFCLKDeepSleep;
> > +     *StutterExitWatermark =3D v->SRExitTime + ExtraLatency + 10 / DCF=
CLKDeepSleep;
> > +     *StutterEnterPlusExitWatermark =3D (v->SREnterPlusExitTime + Extr=
aLatency + 10 / DCFCLKDeepSleep);
> > +     *Z8StutterExitWatermark =3D v->SRExitZ8Time + ExtraLatency + 10 /=
 DCFCLKDeepSleep;
> > +     *Z8StutterEnterPlusExitWatermark =3D v->SREnterPlusExitZ8Time + E=
xtraLatency + 10 / DCFCLKDeepSleep;
> >
> >  #ifdef __DML_VBA_DEBUG__
> >       dml_print("DML::%s: StutterExitWatermark =3D %f\n", __func__, *St=
utterExitWatermark);
> >
> > base-commit: dacd2d2d9d800b7ab2ee2734578112532cba8105
