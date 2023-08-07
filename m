Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35673772BE7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF37F10E038;
	Mon,  7 Aug 2023 17:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C18F10E304;
 Mon,  7 Aug 2023 17:00:31 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6bd011dc2e7so194194a34.3; 
 Mon, 07 Aug 2023 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427630; x=1692032430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lku3mSpHphjbjAm2T6u+ieCGGFFROzE48as9JT2wvy4=;
 b=SX2EKjGXvall0/Z2aQXKNN40J9iu/5gt62fnBonYd4iTXwBUf+sCVaAzpVbMH5uCmM
 DJlUFt8PlDKS55Zjo2N8AKfj2T1amMgkvj0zCQizOhpTsXUvuFRFyzFgGJLy9xeUeET5
 Hg2ncSBCSFb04yEUlZDxCa13Eww314wCAWL9HMo7GoJjjwS+tI6e1kmH3AcDu9qfDhra
 hklB5dk0bpx4pg7+p1acdPn1J2RoTCfrTLNOmUeONPjXtd8Tv6VtQXMzaebsWGMXM8kN
 BahYXF0ckqo2jPL8pslZKxEKnrvj/1/k+BzuLLeI4MewshQC4I/cSV5tV4lSK03Ogn4A
 YkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427630; x=1692032430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lku3mSpHphjbjAm2T6u+ieCGGFFROzE48as9JT2wvy4=;
 b=i4q8EnMPS633jrradYvY8arCjfO9S501OIzOJC4qjX43LYjNq14iS/gigktE+G4nTT
 57b+Usq+G1evNGlu2JxyqV2ZiHmOXbe9A9DDYZ5wrjtAzKK3A7yelhkT5oLJep1KrRF7
 167QqKUJy9yeqiDFXPRGSR8YUd+abp+6cvlRiuNgcK7mZMOElhoYTZ1moqbn2IehLJe7
 W+GCca2lywNhmM9Um4M4aY47oozJbbJrBOiglNdmE3hbxLdlWWxzWNBXlfLOA5lS5FT4
 ZxGFVQsarzkYMI8prx/wPWnynKDFahI1jRfzwoikS6vv+Z5uhn26hBsis5E2474FdJCU
 y7yw==
X-Gm-Message-State: AOJu0YxtMjKL5ivNqwAlkNlc/tpPoMcyrdvGw4rRYdx0kINa70P1mmac
 XzHcaGULuM73FMZD/E5t8IcJ+c68tL0Q/mph670=
X-Google-Smtp-Source: AGHT+IEmC/Wgxm1ABfio+rgysFi4QGc2WlU+VbH6VcqTcPPP94QUOhpIpKpBepbgXQyZs7IiZs06eybqfXGakEDOmi4=
X-Received: by 2002:a9d:6449:0:b0:6b9:c7de:68e0 with SMTP id
 m9-20020a9d6449000000b006b9c7de68e0mr7794469otl.29.1691427630302; Mon, 07 Aug
 2023 10:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230802015557.9034-1-sunran001@208suo.com>
In-Reply-To: <20230802015557.9034-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:00:19 -0400
Message-ID: <CADnq5_PdmvM_hNcpJRgg1DLCO9TfPJ2krHtAWFBZYLY6wZOxcA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu73.h
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

On Tue, Aug 1, 2023 at 9:56=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: space prohibited before open square bracket '['
> ERROR: "foo * bar" should be "foo *bar"
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h | 45 ++++++++------------
>  1 file changed, 17 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h b/drivers/gpu/d=
rm/amd/pm/powerplay/inc/smu73.h
> index c6b12a4c00db..cf4b2c3c65bc 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h
> @@ -37,8 +37,7 @@ enum Poly3rdOrderCoeff {
>      POLY_3RD_ORDER_COUNT
>  };
>
> -struct SMU7_Poly3rdOrder_Data
> -{
> +struct SMU7_Poly3rdOrder_Data {
>      int32_t a;
>      int32_t b;
>      int32_t c;
> @@ -51,8 +50,7 @@ struct SMU7_Poly3rdOrder_Data
>
>  typedef struct SMU7_Poly3rdOrder_Data SMU7_Poly3rdOrder_Data;
>
> -struct Power_Calculator_Data
> -{
> +struct Power_Calculator_Data {
>    uint16_t NoLoadVoltage;
>    uint16_t LoadVoltage;
>    uint16_t Resistance;
> @@ -71,8 +69,7 @@ struct Power_Calculator_Data
>
>  typedef struct Power_Calculator_Data PowerCalculatorData_t;
>
> -struct Gc_Cac_Weight_Data
> -{
> +struct Gc_Cac_Weight_Data {
>    uint8_t index;
>    uint32_t value;
>  };
> @@ -187,8 +184,7 @@ typedef struct {
>  #define SMU73_THERMAL_CLAMP_MODE_COUNT 8
>
>
> -struct SMU7_HystController_Data
> -{
> +struct SMU7_HystController_Data {
>      uint16_t waterfall_up;
>      uint16_t waterfall_down;
>      uint16_t waterfall_limit;
> @@ -199,8 +195,7 @@ struct SMU7_HystController_Data
>
>  typedef struct SMU7_HystController_Data SMU7_HystController_Data;
>
> -struct SMU73_PIDController
> -{
> +struct SMU73_PIDController {
>      uint32_t Ki;
>      int32_t LFWindupUpperLim;
>      int32_t LFWindupLowerLim;
> @@ -215,8 +210,7 @@ struct SMU73_PIDController
>
>  typedef struct SMU73_PIDController SMU73_PIDController;
>
> -struct SMU7_LocalDpmScoreboard
> -{
> +struct SMU7_LocalDpmScoreboard {
>      uint32_t PercentageBusy;
>
>      int32_t  PIDError;
> @@ -261,8 +255,8 @@ struct SMU7_LocalDpmScoreboard
>      uint8_t  DteClampMode;
>      uint8_t  FpsClampMode;
>
> -    uint16_t LevelResidencyCounters [SMU73_MAX_LEVELS_GRAPHICS];
> -    uint16_t LevelSwitchCounters [SMU73_MAX_LEVELS_GRAPHICS];
> +    uint16_t LevelResidencyCounters[SMU73_MAX_LEVELS_GRAPHICS];
> +    uint16_t LevelSwitchCounters[SMU73_MAX_LEVELS_GRAPHICS];
>
>      void     (*TargetStateCalculator)(uint8_t);
>      void     (*SavedTargetStateCalculator)(uint8_t);
> @@ -315,8 +309,7 @@ typedef uint8_t (*VoltageChangeHandler_t)(uint16_t, u=
int8_t);
>
>  typedef uint32_t SMU_VoltageLevel;
>
> -struct SMU7_VoltageScoreboard
> -{
> +struct SMU7_VoltageScoreboard {
>      SMU_VoltageLevel TargetVoltage;
>      uint16_t MaxVid;
>      uint8_t  HighestVidOffset;
> @@ -354,7 +347,7 @@ struct SMU7_VoltageScoreboard
>
>      VoltageChangeHandler_t functionLinks[6];
>
> -    uint16_t * VddcFollower1;
> +    uint16_t *VddcFollower1;
>
>      int16_t  Driver_OD_RequestedVidOffset1;
>      int16_t  Driver_OD_RequestedVidOffset2;
> @@ -366,8 +359,7 @@ typedef struct SMU7_VoltageScoreboard SMU7_VoltageSco=
reboard;
>  // ---------------------------------------------------------------------=
----------------------------------------------------
>  #define SMU7_MAX_PCIE_LINK_SPEEDS 3 /* 0:Gen1 1:Gen2 2:Gen3 */
>
> -struct SMU7_PCIeLinkSpeedScoreboard
> -{
> +struct SMU7_PCIeLinkSpeedScoreboard {
>      uint8_t     DpmEnable;
>      uint8_t     DpmRunning;
>      uint8_t     DpmForce;
> @@ -396,8 +388,7 @@ typedef struct SMU7_PCIeLinkSpeedScoreboard SMU7_PCIe=
LinkSpeedScoreboard;
>  #define SMU7_SCALE_I  7
>  #define SMU7_SCALE_R 12
>
> -struct SMU7_PowerScoreboard
> -{
> +struct SMU7_PowerScoreboard {
>      uint32_t GpuPower;
>
>      uint32_t VddcPower;
> @@ -436,8 +427,7 @@ typedef struct SMU7_PowerScoreboard SMU7_PowerScorebo=
ard;
>  #define SMU7_VCE_SCLK_HANDSHAKE_DISABLE                  0x00020000
>
>  // All 'soft registers' should be uint32_t.
> -struct SMU73_SoftRegisters
> -{
> +struct SMU73_SoftRegisters {
>      uint32_t        RefClockFrequency;
>      uint32_t        PmTimerPeriod;
>      uint32_t        FeatureEnables;
> @@ -493,8 +483,7 @@ struct SMU73_SoftRegisters
>
>  typedef struct SMU73_SoftRegisters SMU73_SoftRegisters;
>
> -struct SMU73_Firmware_Header
> -{
> +struct SMU73_Firmware_Header {
>      uint32_t Digest[5];
>      uint32_t Version;
>      uint32_t HeaderSize;
> @@ -708,9 +697,9 @@ typedef struct VFT_CELL_t VFT_CELL_t;
>
>  struct VFT_TABLE_t {
>    VFT_CELL_t    Cell[TEMP_RANGE_MAXSTEPS][NUM_VFT_COLUMNS];
> -  uint16_t      AvfsGbv [NUM_VFT_COLUMNS];
> -  uint16_t      BtcGbv  [NUM_VFT_COLUMNS];
> -  uint16_t      Temperature [TEMP_RANGE_MAXSTEPS];
> +  uint16_t      AvfsGbv[NUM_VFT_COLUMNS];
> +  uint16_t      BtcGbv[NUM_VFT_COLUMNS];
> +  uint16_t      Temperature[TEMP_RANGE_MAXSTEPS];
>
>    uint8_t       NumTemperatureSteps;
>    uint8_t       padding[3];
> --
> 2.17.1
>
