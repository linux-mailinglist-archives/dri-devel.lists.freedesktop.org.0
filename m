Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D31772BBE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E3D10E2F8;
	Mon,  7 Aug 2023 16:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008C610E2F8;
 Mon,  7 Aug 2023 16:56:04 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-56ca1eebcd7so2903792eaf.0; 
 Mon, 07 Aug 2023 09:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427364; x=1692032164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=beDZjbbalYWwbDGUsSO0v+/HXnqZi1/VnHtRYjuZ0+4=;
 b=ImEKUzqeclILDmZaS8k97ytV1RXVCtHxaRu78+G64qjDmsYGMdCsGnuKYHvq+eKBDz
 JARuVhSV6I+82gFCTfR1eABBvJ5MRn5GOcWLd1drDs8UWxvqiHl6XrPShrmRBXDQ0VUn
 pZFdPkHBJNm8fcVGikF5WkX0lfzDFzUBO4JrF/dfcVGrXOZ9YBlKejpaPIEXspki2v3I
 bqvsJjPS1mglT3eAS0Cowz4llRCrgSCMD92RJ7CKeo5XjCg1Rybg5xIP03i+7/k/2JuW
 9SBvKKZtM8tPW7gvSwlFMOCoGrERcF46HOKdwZhWGgD4p+z++ILb1B1lXfXpqcpHcqoV
 fzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427364; x=1692032164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=beDZjbbalYWwbDGUsSO0v+/HXnqZi1/VnHtRYjuZ0+4=;
 b=UKIZebH6TNPGVCRkqrzD7Ywrp/0YWad7zzxT7ESIB0JFdY8T0Gy119hzxR3DIdu03A
 1keuYsEfOgJlSobROf7+lAFKQAsQaickILxtLCwzWSArZid2TQbmbvBL8XPb0Tvsqz7F
 XE3HsPD5ZuXP2UH005IAL4vTSfanF6bqVLnRcyOIqJFBCQ9lLpH21ldZyd/TiASDzmMW
 G51/4ndie/iW/RFIgXSJ1uiFTkJlGu/3KX48ADjBvBmNVycvga1Jz1xUDLkYfqnWKrv2
 FlMRf6q3/g1J2FaxeOWeUTzdTG8MuXg1FkvVza3sYuKO2t58jTguIvVIj63du7aNoBo3
 ZuHg==
X-Gm-Message-State: AOJu0Yxj0BDOeKT/El+I5UmOlPlxTnlMu8v48/LgcHPAfa6td3DVrVcw
 Nv5UluoKJVeI9JMEOpEVhVZk72GywvbeSJHA/azb9oXh
X-Google-Smtp-Source: AGHT+IEEyUblZYFAAwzOj84xyYJw3B8tUHYDCflhQppSAMoFASjHBqtEATDPSLQoSXHKmZ9SEGxDWEl3xyBS3AtYPIM=
X-Received: by 2002:a4a:341e:0:b0:56c:d297:164c with SMTP id
 b30-20020a4a341e000000b0056cd297164cmr8800093ooa.4.1691427364148; Mon, 07 Aug
 2023 09:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230802012302.8498-1-sunran001@208suo.com>
In-Reply-To: <20230802012302.8498-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:55:53 -0400
Message-ID: <CADnq5_MwvypKA+B9FGwHE1BCKjJdRCrbRZbF+7_U7GxiHSFwAA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu71.h
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

On Tue, Aug 1, 2023 at 9:23=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: space prohibited before open square bracket '['
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h | 22 +++++++-------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h b/drivers/gpu/d=
rm/amd/pm/powerplay/inc/smu71.h
> index 71c9b2d28640..b5f177412769 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h
> @@ -118,8 +118,7 @@ typedef struct {
>
>  #endif
>
> -struct SMU71_PIDController
> -{
> +struct SMU71_PIDController {
>      uint32_t Ki;
>      int32_t LFWindupUpperLim;
>      int32_t LFWindupLowerLim;
> @@ -133,8 +132,7 @@ struct SMU71_PIDController
>
>  typedef struct SMU71_PIDController SMU71_PIDController;
>
> -struct SMU7_LocalDpmScoreboard
> -{
> +struct SMU7_LocalDpmScoreboard {
>      uint32_t PercentageBusy;
>
>      int32_t  PIDError;
> @@ -179,8 +177,8 @@ struct SMU7_LocalDpmScoreboard
>      uint8_t  DteClampMode;
>      uint8_t  FpsClampMode;
>
> -    uint16_t LevelResidencyCounters [SMU71_MAX_LEVELS_GRAPHICS];
> -    uint16_t LevelSwitchCounters [SMU71_MAX_LEVELS_GRAPHICS];
> +    uint16_t LevelResidencyCounters[SMU71_MAX_LEVELS_GRAPHICS];
> +    uint16_t LevelSwitchCounters[SMU71_MAX_LEVELS_GRAPHICS];
>
>      void     (*TargetStateCalculator)(uint8_t);
>      void     (*SavedTargetStateCalculator)(uint8_t);
> @@ -200,8 +198,7 @@ typedef struct SMU7_LocalDpmScoreboard SMU7_LocalDpmS=
coreboard;
>
>  #define SMU7_MAX_VOLTAGE_CLIENTS 12
>
> -struct SMU7_VoltageScoreboard
> -{
> +struct SMU7_VoltageScoreboard {
>      uint16_t CurrentVoltage;
>      uint16_t HighestVoltage;
>      uint16_t MaxVid;
> @@ -325,8 +322,7 @@ typedef struct SMU7_PowerScoreboard SMU7_PowerScorebo=
ard;
>
>  // ---------------------------------------------------------------------=
-----------------------------
>
> -struct SMU7_ThermalScoreboard
> -{
> +struct SMU7_ThermalScoreboard {
>     int16_t  GpuLimit;
>     int16_t  GpuHyst;
>     uint16_t CurrGnbTemp;
> @@ -360,8 +356,7 @@ typedef struct SMU7_ThermalScoreboard SMU7_ThermalSco=
reboard;
>  #define SMU7_VCE_SCLK_HANDSHAKE_DISABLE                  0x00020000
>
>  // All 'soft registers' should be uint32_t.
> -struct SMU71_SoftRegisters
> -{
> +struct SMU71_SoftRegisters {
>      uint32_t        RefClockFrequency;
>      uint32_t        PmTimerPeriod;
>      uint32_t        FeatureEnables;
> @@ -413,8 +408,7 @@ struct SMU71_SoftRegisters
>
>  typedef struct SMU71_SoftRegisters SMU71_SoftRegisters;
>
> -struct SMU71_Firmware_Header
> -{
> +struct SMU71_Firmware_Header {
>      uint32_t Digest[5];
>      uint32_t Version;
>      uint32_t HeaderSize;
> --
> 2.17.1
>
