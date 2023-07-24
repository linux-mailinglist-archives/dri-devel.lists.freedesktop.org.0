Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21F76018B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533A510E37D;
	Mon, 24 Jul 2023 21:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AA510E37A;
 Mon, 24 Jul 2023 21:51:16 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1b06a46e1a9so3725890fac.2; 
 Mon, 24 Jul 2023 14:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235476; x=1690840276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0jdxfuCZAc+PZ4ZRbAjg61M3y3XULrDH9fUrg9oEp8=;
 b=Tu+uZyCHQ1X2Ifvxh3u0Znm/ouMs2pvYj9l0UQktzsa7OgijQI4M4qTqZ+QhI+t4t6
 JFDclgNB0i72J9Q7qurTPDemOVVx/ThSqa8xZLaPoS6HkDmknar5BYS5quS6up0Lu8G9
 23P8QhkNEZ6E5O7WtYfHSzIxwz2A/LfibgkPZgF3LlLmbrm/7D/RgnyYTw6yIlpCPVL3
 +LfW5YqogB2uXhHqe5c05QcI8T35iJPPRQ6L+3eEX3WcoozEOmqP2/jjV0UaACj3uDPX
 bLwh7/4ouE5wh0vp3bGUlUlXawzAxW4GpCP2g4Cm6qOLeIe9FDbe3TRqtZwfJpRRsVcM
 Q3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235476; x=1690840276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0jdxfuCZAc+PZ4ZRbAjg61M3y3XULrDH9fUrg9oEp8=;
 b=Ph5atHdLibbrink2Nfa3/EM99W+CsziIUPIyg6JYkkalJ5/ftNkBCvPIEFPTBg2aPh
 7ameZeZHGacbMkCJGoDZ/iDbt2SJQbBBAtR53EwNO596TQIedS+Ng9BJidE7d5RzQ0Kb
 Ga7z2292B8ty22ihi7ECJtBCj66HX6E5SEPmVh3Uz/KFPxptFy6Hs9GghTWyLwLYgESJ
 BIbwFobsX2narDU2HUReaL7t3AMDlodLyw5KmqVl7lNCf3OHMjIq4BKbETrtCfLOL2MU
 cLMjaPkdGDVyXwVjZkIXNwzjNocXtK22Y7/k9A+7FAXMhmkE6VYtMrwfFhsqbr14YtsS
 nHNQ==
X-Gm-Message-State: ABy/qLamxIileIHK4WvnrXmUHnRwVmK3X1dVUDD+hEnGBWJiwkJV49EE
 x/+/cK/4EuV78UQ9Bpeqoc6AYazYE9LE8n0hMYo=
X-Google-Smtp-Source: APBJJlFriHH1gyR+QZd+q1w5EErXWQw3J1uz55ZnGsDr/NJeLXUDbf/EwFxjQlBnK3n+RhFc1yjeJjMlxZa+QjD+SFY=
X-Received: by 2002:a05:6870:b14a:b0:1b7:6158:621a with SMTP id
 a10-20020a056870b14a00b001b76158621amr12169194oal.47.1690235475473; Mon, 24
 Jul 2023 14:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230724082935.9199-1-xujianghui@cdjrlc.com>
 <3ba625a965a2bf900c0f63f3c77bb072@208suo.com>
In-Reply-To: <3ba625a965a2bf900c0f63f3c77bb072@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:51:04 -0400
Message-ID: <CADnq5_ODdf8CVVkZbKyX2tQ8VnGTVa_Q3CxhgE+paF28z7=Qag@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in
 smu11_driver_if_sienna_cichlid.h
To: sunran001@208suo.com
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

This doesn't apply cleanly.

Alex

On Mon, Jul 24, 2023 at 4:30=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: trailing whitespace
> ERROR: space prohibited before open square bracket '['
> ERROR: space prohibited before that close square bracket ']'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   .../pmfw_if/smu11_driver_if_sienna_cichlid.h  | 386 +++++++++---------
>   1 file changed, 193 insertions(+), 193 deletions(-)
>
> diff --git
> a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid=
.h
> b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid=
.h
> index aa6d29de4002..703ade13d9f4 100644
> ---
> a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid=
.h
> +++
> b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid=
.h
> @@ -225,33 +225,33 @@ typedef enum {
>   #define FW_DSTATE_MP1_WHISPER_MODE_BIT      6
>   #define FW_DSTATE_SOC_LIV_MIN_BIT           7
>   #define FW_DSTATE_SOC_PLL_PWRDN_BIT         8
> -#define FW_DSTATE_MEM_PLL_PWRDN_BIT         9
> +#define FW_DSTATE_MEM_PLL_PWRDN_BIT         9
>   #define FW_DSTATE_OPTIMIZE_MALL_REFRESH_BIT 10
>   #define FW_DSTATE_MEM_PSI_BIT               11
>   #define FW_DSTATE_HSR_NON_STROBE_BIT        12
>   #define FW_DSTATE_MP0_ENTER_WFI_BIT         13
>
> -#define FW_DSTATE_SOC_ULV_MASK                    (1 <<
> FW_DSTATE_SOC_ULV_BIT          )
> -#define FW_DSTATE_G6_HSR_MASK                     (1 <<
> FW_DSTATE_G6_HSR_BIT           )
> -#define FW_DSTATE_G6_PHY_VDDCI_OFF_MASK           (1 <<
> FW_DSTATE_G6_PHY_VDDCI_OFF_BIT )
> -#define FW_DSTATE_MP1_DS_MASK                     (1 <<
> FW_DSTATE_MP1_DS_BIT           )
> -#define FW_DSTATE_MP0_DS_MASK                     (1 <<
> FW_DSTATE_MP0_DS_BIT           )
> -#define FW_DSTATE_SMN_DS_MASK                     (1 <<
> FW_DSTATE_SMN_DS_BIT           )
> -#define FW_DSTATE_MP1_WHISPER_MODE_MASK           (1 <<
> FW_DSTATE_MP1_WHISPER_MODE_BIT )
> -#define FW_DSTATE_SOC_LIV_MIN_MASK                (1 <<
> FW_DSTATE_SOC_LIV_MIN_BIT      )
> -#define FW_DSTATE_SOC_PLL_PWRDN_MASK              (1 <<
> FW_DSTATE_SOC_PLL_PWRDN_BIT    )
> -#define FW_DSTATE_MEM_PLL_PWRDN_MASK              (1 <<
> FW_DSTATE_MEM_PLL_PWRDN_BIT    )
> -#define FW_DSTATE_OPTIMIZE_MALL_REFRESH_MASK      (1 <<
> FW_DSTATE_OPTIMIZE_MALL_REFRESH_BIT    )
> -#define FW_DSTATE_MEM_PSI_MASK                    (1 <<
> FW_DSTATE_MEM_PSI_BIT    )
> -#define FW_DSTATE_HSR_NON_STROBE_MASK             (1 <<
> FW_DSTATE_HSR_NON_STROBE_BIT    )
> -#define FW_DSTATE_MP0_ENTER_WFI_MASK              (1 <<
> FW_DSTATE_MP0_ENTER_WFI_BIT    )
> +#define FW_DSTATE_SOC_ULV_MASK                    (1 <<
> FW_DSTATE_SOC_ULV_BIT)
> +#define FW_DSTATE_G6_HSR_MASK                     (1 <<
> FW_DSTATE_G6_HSR_BIT)
> +#define FW_DSTATE_G6_PHY_VDDCI_OFF_MASK           (1 <<
> FW_DSTATE_G6_PHY_VDDCI_OFF_BIT)
> +#define FW_DSTATE_MP1_DS_MASK                     (1 <<
> FW_DSTATE_MP1_DS_BIT)
> +#define FW_DSTATE_MP0_DS_MASK                     (1 <<
> FW_DSTATE_MP0_DS_BIT)
> +#define FW_DSTATE_SMN_DS_MASK                     (1 <<
> FW_DSTATE_SMN_DS_BIT)
> +#define FW_DSTATE_MP1_WHISPER_MODE_MASK           (1 <<
> FW_DSTATE_MP1_WHISPER_MODE_BIT)
> +#define FW_DSTATE_SOC_LIV_MIN_MASK                (1 <<
> FW_DSTATE_SOC_LIV_MIN_BIT)
> +#define FW_DSTATE_SOC_PLL_PWRDN_MASK              (1 <<
> FW_DSTATE_SOC_PLL_PWRDN_BIT)
> +#define FW_DSTATE_MEM_PLL_PWRDN_MASK              (1 <<
> FW_DSTATE_MEM_PLL_PWRDN_BIT)
> +#define FW_DSTATE_OPTIMIZE_MALL_REFRESH_MASK      (1 <<
> FW_DSTATE_OPTIMIZE_MALL_REFRESH_BIT)
> +#define FW_DSTATE_MEM_PSI_MASK                    (1 <<
> FW_DSTATE_MEM_PSI_BIT)
> +#define FW_DSTATE_HSR_NON_STROBE_MASK             (1 <<
> FW_DSTATE_HSR_NON_STROBE_BIT)
> +#define FW_DSTATE_MP0_ENTER_WFI_MASK              (1 <<
> FW_DSTATE_MP0_ENTER_WFI_BIT)
>
>   // GFX GPO Feature Contains PACE and DEM sub features
>   #define GFX_GPO_PACE_BIT                   0
>   #define GFX_GPO_DEM_BIT                    1
>
>   #define GFX_GPO_PACE_MASK                  (1 << GFX_GPO_PACE_BIT)
> -#define GFX_GPO_DEM_MASK                   (1 << GFX_GPO_DEM_BIT )
> +#define GFX_GPO_DEM_MASK                   (1 << GFX_GPO_DEM_BIT)
>
>   #define GPO_UPDATE_REQ_UCLKDPM_MASK  0x1
>   #define GPO_UPDATE_REQ_FCLKDPM_MASK  0x2
> @@ -312,10 +312,10 @@ typedef enum {
>     I2C_CONTROLLER_NAME_VR_VDDCI,
>     I2C_CONTROLLER_NAME_VR_MVDD,
>     I2C_CONTROLLER_NAME_LIQUID0,
> -  I2C_CONTROLLER_NAME_LIQUID1,
> +  I2C_CONTROLLER_NAME_LIQUID1,
>     I2C_CONTROLLER_NAME_PLX,
>     I2C_CONTROLLER_NAME_OTHER,
> -  I2C_CONTROLLER_NAME_COUNT,
> +  I2C_CONTROLLER_NAME_COUNT,
>   } I2cControllerName_e;
>
>   typedef enum {
> @@ -325,10 +325,10 @@ typedef enum {
>     I2C_CONTROLLER_THROTTLER_VR_VDDCI,
>     I2C_CONTROLLER_THROTTLER_VR_MVDD,
>     I2C_CONTROLLER_THROTTLER_LIQUID0,
> -  I2C_CONTROLLER_THROTTLER_LIQUID1,
> +  I2C_CONTROLLER_THROTTLER_LIQUID1,
>     I2C_CONTROLLER_THROTTLER_PLX,
>     I2C_CONTROLLER_THROTTLER_INA3221,
> -  I2C_CONTROLLER_THROTTLER_COUNT,
> +  I2C_CONTROLLER_THROTTLER_COUNT,
>   } I2cControllerThrottler_e;
>
>   typedef enum {
> @@ -336,24 +336,24 @@ typedef enum {
>     I2C_CONTROLLER_PROTOCOL_VR_IR35217,
>     I2C_CONTROLLER_PROTOCOL_TMP_TMP102A,
>     I2C_CONTROLLER_PROTOCOL_INA3221,
> -  I2C_CONTROLLER_PROTOCOL_COUNT,
> +  I2C_CONTROLLER_PROTOCOL_COUNT,
>   } I2cControllerProtocol_e;
>
>   typedef struct {
>     uint8_t   Enabled;
>     uint8_t   Speed;
> -  uint8_t   SlaveAddress;
> +  uint8_t   SlaveAddress;
>     uint8_t   ControllerPort;
>     uint8_t   ControllerName;
>     uint8_t   ThermalThrotter;
>     uint8_t   I2cProtocol;
> -  uint8_t   PaddingConfig;
> +  uint8_t   PaddingConfig;
>   } I2cControllerConfig_t;
>
>   typedef enum {
> -  I2C_PORT_SVD_SCL =3D 0,
> -  I2C_PORT_GPIO,
> -} I2cPort_e;
> +  I2C_PORT_SVD_SCL =3D 0,
> +  I2C_PORT_GPIO,
> +} I2cPort_e;
>
>   typedef enum {
>     I2C_SPEED_FAST_50K =3D 0,      //50  Kbits/s
> @@ -362,13 +362,13 @@ typedef enum {
>     I2C_SPEED_FAST_PLUS_1M,      //1   Mbits/s (in fast mode)
>     I2C_SPEED_HIGH_1M,           //1   Mbits/s (in high speed mode)
>     I2C_SPEED_HIGH_2M,           //2.3 Mbits/s
> -  I2C_SPEED_COUNT,
> +  I2C_SPEED_COUNT,
>   } I2cSpeed_e;
>
>   typedef enum {
>     I2C_CMD_READ =3D 0,
>     I2C_CMD_WRITE,
> -  I2C_CMD_COUNT,
> +  I2C_CMD_COUNT,
>   } I2cCmdType_e;
>
>   typedef enum {
> @@ -426,24 +426,24 @@ typedef enum {
>     PG_POWER_UP,
>   } PowerGatingSettings_e;
>
> -typedef struct {
> +typedef struct {
>     uint32_t a;  // store in IEEE float format in this variable
>     uint32_t b;  // store in IEEE float format in this variable
>     uint32_t c;  // store in IEEE float format in this variable
>   } QuadraticInt_t;
>
> -typedef struct {
> +typedef struct {
>     uint32_t a;  // store in fixed point, [31:20] signed integer, [19:0]
> fractional bits
>     uint32_t b;  // store in fixed point, [31:20] signed integer, [19:0]
> fractional bits
>     uint32_t c;  // store in fixed point, [31:20] signed integer, [19:0]
> fractional bits
>   } QuadraticFixedPoint_t;
>
> -typedef struct {
> +typedef struct {
>     uint32_t m;  // store in IEEE float format in this variable
>     uint32_t b;  // store in IEEE float format in this variable
>   } LinearInt_t;
>
> -typedef struct {
> +typedef struct {
>     uint32_t a;  // store in IEEE float format in this variable
>     uint32_t b;  // store in IEEE float format in this variable
>     uint32_t c;  // store in IEEE float format in this variable
> @@ -455,7 +455,7 @@ typedef enum {
>     PIECEWISE_LINEAR_FUSED_MODEL =3D 0,
>     PIECEWISE_LINEAR_PP_MODEL,
>     QUADRATIC_PP_MODEL,
> -  PERPART_PIECEWISE_LINEAR_PP_MODEL,
> +  PERPART_PIECEWISE_LINEAR_PP_MODEL,
>   } DfllDroopModelSelect_e;
>
>   typedef struct {
> @@ -464,10 +464,10 @@ typedef struct {
>   }PiecewiseLinearDroopInt_t;
>
>   typedef enum {
> -  GFXCLK_SOURCE_PLL =3D 0,
> -  GFXCLK_SOURCE_DFLL,
> -  GFXCLK_SOURCE_COUNT,
> -} GFXCLK_SOURCE_e;
> +  GFXCLK_SOURCE_PLL =3D 0,
> +  GFXCLK_SOURCE_DFLL,
> +  GFXCLK_SOURCE_COUNT,
> +} GFXCLK_SOURCE_e;
>
>   //Only Clks that have DPM descriptors are listed here
>   typedef enum {
> @@ -552,18 +552,18 @@ typedef struct {
>     uint8_t        VoltageMode;         // 0 - AVFS only, 1-
> min(AVFS,SS), 2-SS only
>     uint8_t        SnapToDiscrete;      // 0 - Fine grained DPM, 1 -
> Discrete DPM
>     uint8_t        NumDiscreteLevels;   // Set to 2 (Fmin, Fmax) when
> using fine grained DPM, otherwise set to # discrete levels used
> -  uint8_t        Padding;
> +  uint8_t        Padding;
>     LinearInt_t    ConversionToAvfsClk; // Transfer function to AVFS
> Clock (GHz->GHz)
>     QuadraticInt_t SsCurve;             // Slow-slow curve (GHz->V)
>     uint16_t       SsFmin;              // Fmin for SS curve. If SS curve
> is selected, will use V@SSFmin for F <=3D Fmin
> -  uint16_t       Padding16;
> +  uint16_t       Padding16;
>   } DpmDescriptor_t;
>
>   typedef enum  {
>     PPT_THROTTLER_PPT0,
>     PPT_THROTTLER_PPT1,
>     PPT_THROTTLER_PPT2,
> -  PPT_THROTTLER_PPT3,
> +  PPT_THROTTLER_PPT3,
>     PPT_THROTTLER_COUNT
>   } PPT_THROTTLER_e;
>
> @@ -574,9 +574,9 @@ typedef enum  {
>     TEMP_VR_GFX,
>     TEMP_VR_MEM0,
>     TEMP_VR_MEM1,
> -  TEMP_VR_SOC,
> +  TEMP_VR_SOC,
>     TEMP_LIQUID0,
> -  TEMP_LIQUID1,
> +  TEMP_LIQUID1,
>     TEMP_PLX,
>     TEMP_COUNT,
>   } TEMP_e;
> @@ -592,7 +592,7 @@ typedef enum {
>     CUSTOMER_VARIANT_FALCON,
>     CUSTOMER_VARIANT_COUNT,
>   } CUSTOMER_VARIANT_e;
> -
> +
>   // Used for 2-step UCLK DPM change workaround
>   typedef struct {
>     uint16_t Fmin;
> @@ -623,14 +623,14 @@ typedef struct {
>
>     // SECTION: Power Configuration
>     uint8_t      TotalPowerConfig;    //0-TDP, 1-TGP, 2-TCP Estimated,
> 3-TCP Measured. Use defines from PwrConfig_e
> -  uint8_t      TotalPowerPadding[3];
> +  uint8_t      TotalPowerPadding[3];
>
>     // SECTION: APCC Settings
>     uint32_t     ApccPlusResidencyLimit;
>
>     //SECTION: SMNCLK DPM
> -  uint16_t       SmnclkDpmFreq        [NUM_SMNCLK_DPM_LEVELS];       //
> in MHz
> -  uint16_t       SmnclkDpmVoltage     [NUM_SMNCLK_DPM_LEVELS];       //
> mV(Q2)
> +  uint16_t       SmnclkDpmFreq[NUM_SMNCLK_DPM_LEVELS];       // in MHz
> +  uint16_t       SmnclkDpmVoltage[NUM_SMNCLK_DPM_LEVELS];       //
> mV(Q2)
>
>     uint32_t       PaddingAPCC;
>     uint16_t
> PerPartDroopVsetGfxDfll[NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS];
> //In mV(Q2)
> @@ -639,14 +639,14 @@ typedef struct {
>     // SECTION: Throttler settings
>     uint32_t ThrottlerControlMask;   // See Throtter masks defines
>
> -  // SECTION: FW DSTATE Settings
> +  // SECTION: FW DSTATE Settings
>     uint32_t FwDStateMask;           // See FW DState masks defines
>
>     // SECTION: ULV Settings
>     uint16_t  UlvVoltageOffsetSoc; // In mV(Q2)
>     uint16_t  UlvVoltageOffsetGfx; // In mV(Q2)
>
> -  uint16_t     MinVoltageUlvGfx; // In mV(Q2)  Minimum Voltage ("Vmin")
> of VDD_GFX in ULV mode
> +  uint16_t     MinVoltageUlvGfx; // In mV(Q2)  Minimum Voltage ("Vmin")
> of VDD_GFX in ULV mode
>     uint16_t     MinVoltageUlvSoc; // In mV(Q2)  Minimum Voltage ("Vmin")
> of VDD_SOC in ULV mode
>
>     uint16_t     SocLIVmin;        // In mV(Q2)  Long Idle Vmin (deep
> ULV), for VDD_SOC
> @@ -678,62 +678,62 @@ typedef struct {
>     //SECTION: DPM Config 1
>     DpmDescriptor_t DpmDescriptor[PPCLK_COUNT];
>
> -  uint16_t       FreqTableGfx      [NUM_GFXCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTableVclk     [NUM_VCLK_DPM_LEVELS    ];     // In
> MHz
> -  uint16_t       FreqTableDclk     [NUM_DCLK_DPM_LEVELS    ];     // In
> MHz
> -  uint16_t       FreqTableSocclk   [NUM_SOCCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTableUclk     [NUM_UCLK_DPM_LEVELS    ];     // In
> MHz
> -  uint16_t       FreqTableDcefclk  [NUM_DCEFCLK_DPM_LEVELS ];     // In
> MHz
> -  uint16_t       FreqTableDispclk  [NUM_DISPCLK_DPM_LEVELS ];     // In
> MHz
> -  uint16_t       FreqTablePixclk   [NUM_PIXCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTablePhyclk   [NUM_PHYCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTableDtbclk   [NUM_DTBCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTableFclk     [NUM_FCLK_DPM_LEVELS    ];     // In
> MHz
> +  uint16_t       FreqTableGfx[NUM_GFXCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableVclk[NUM_VCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableDclk[NUM_DCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableSocclk[NUM_SOCCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableUclk[NUM_UCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableDcefclk[NUM_DCEFCLK_DPM_LEVELS];     // In
> MHz
> +  uint16_t       FreqTableDispclk[NUM_DISPCLK_DPM_LEVELS];     // In
> MHz
> +  uint16_t       FreqTablePixclk[NUM_PIXCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTablePhyclk[NUM_PHYCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableDtbclk[NUM_DTBCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableFclk[NUM_FCLK_DPM_LEVELS];     // In MHz
>     uint32_t       Paddingclks;
>
>     DroopInt_t
> PerPartDroopModelGfxDfll[NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS];
> //GHz ->Vstore in IEEE float format
>
> -  uint32_t       DcModeMaxFreq     [PPCLK_COUNT            ];     // In
> MHz
> +  uint32_t       DcModeMaxFreq[PPCLK_COUNT];     // In MHz
>
> -  uint8_t        FreqTableUclkDiv  [NUM_UCLK_DPM_LEVELS    ];     //
> 0:Div-1, 1:Div-1/2, 2:Div-1/4, 3:Div-1/8
> +  uint8_t        FreqTableUclkDiv[NUM_UCLK_DPM_LEVELS];     // 0:Div-1,
> 1:Div-1/2, 2:Div-1/4, 3:Div-1/8
>
>     // Used for MALL performance boost
>     uint16_t       FclkBoostFreq;                                   // In
> Mhz
>     uint16_t       FclkParamPadding;
>
>     // SECTION: DPM Config 2
> -  uint16_t       Mp0clkFreq        [NUM_MP0CLK_DPM_LEVELS];       // in
> MHz
> -  uint16_t       Mp0DpmVoltage     [NUM_MP0CLK_DPM_LEVELS];       //
> mV(Q2)
> -  uint16_t       MemVddciVoltage   [NUM_UCLK_DPM_LEVELS];         //
> mV(Q2)
> -  uint16_t       MemMvddVoltage    [NUM_UCLK_DPM_LEVELS];         //
> mV(Q2)
> +  uint16_t       Mp0clkFreq[NUM_MP0CLK_DPM_LEVELS];       // in MHz
> +  uint16_t       Mp0DpmVoltage[NUM_MP0CLK_DPM_LEVELS];       // mV(Q2)
> +  uint16_t       MemVddciVoltage[NUM_UCLK_DPM_LEVELS];         //
> mV(Q2)
> +  uint16_t       MemMvddVoltage[NUM_UCLK_DPM_LEVELS];         // mV(Q2)
>     // GFXCLK DPM
>     uint16_t        GfxclkFgfxoffEntry;   // in Mhz
> -  uint16_t        GfxclkFinit;          // in Mhz
> -  uint16_t        GfxclkFidle;          // in MHz
> +  uint16_t        GfxclkFinit;          // in Mhz
> +  uint16_t        GfxclkFidle;          // in MHz
>     uint8_t         GfxclkSource;         // 0 =3D PLL, 1 =3D DFLL
>     uint8_t         GfxclkPadding;
>
> -  // GFX GPO
> +  // GFX GPO
>     uint8_t         GfxGpoSubFeatureMask; // bit 0 =3D PACE, bit 1 =3D DE=
M
>     uint8_t         GfxGpoEnabledWorkPolicyMask; //Any policy that GPO
> can be enabled
>     uint8_t         GfxGpoDisabledWorkPolicyMask; //Any policy that GPO
> can be disabled
>     uint8_t         GfxGpoPadding[1];
>     uint32_t        GfxGpoVotingAllow;    //For indicating which feature
> changes should result in a GPO table recalculation
>
> -  uint32_t        GfxGpoPadding32[4];
> +  uint32_t        GfxGpoPadding32[4];
>
>     uint16_t        GfxDcsFopt;           // Optimal GFXCLK for DCS in
> Mhz
>     uint16_t        GfxDcsFclkFopt;       // Optimal FCLK for DCS in Mhz
>     uint16_t        GfxDcsUclkFopt;       // Optimal UCLK for DCS in Mhz
> -
> -  uint16_t        DcsGfxOffVoltage;     //Voltage in mV(Q2) applied to
> VDDGFX when entering DCS GFXOFF phase
> +
> +  uint16_t        DcsGfxOffVoltage;     //Voltage in mV(Q2) applied to
> VDDGFX when entering DCS GFXOFF phase
>
>     uint16_t        DcsMinGfxOffTime;     //Minimum amount of time PMFW
> shuts GFX OFF as part of GFX DCS phase
>     uint16_t        DcsMaxGfxOffTime;      //Maximum amount of time PMFW
> can shut GFX OFF as part of GFX DCS phase at a stretch.
>
>     uint32_t        DcsMinCreditAccum;    //Min amount of positive credit
> accumulation before waking GFX up as part of DCS.
>
> -  uint16_t        DcsExitHysteresis;    //The min amount of time power
> credit accumulator should have a value > 0 before SMU exits the DCS
> throttling phase.
> +  uint16_t        DcsExitHysteresis;    //The min amount of time power
> credit accumulator should have a value > 0 before SMU exits the DCS
> throttling phase.
>     uint16_t        DcsTimeout;           //This is the amount of time
> SMU FW waits for RLC to put GFX into GFXOFF before reverting to the
> fallback mechanism of throttling GFXCLK to Fmin.
>
>     uint32_t        DcsParamPadding[5];
> @@ -743,9 +743,9 @@ typedef struct {
>     // UCLK section
>     uint8_t      LowestUclkReservedForUlv; // Set this to 1 if UCLK DPM0
> is reserved for ULV-mode only
>     uint8_t      PaddingMem[3];
> -
> -  uint8_t      UclkDpmPstates     [NUM_UCLK_DPM_LEVELS];     // 4 DPM
> states, 0-P0, 1-P1, 2-P2, 3-P3.
> -
> +
> +  uint8_t      UclkDpmPstates[NUM_UCLK_DPM_LEVELS];     // 4 DPM
> states, 0-P0, 1-P1, 2-P2, 3-P3.
> +
>     // Used for 2-Step UCLK change workaround
>     UclkDpmChangeRange_t UclkDpmSrcFreqRange;  // In Mhz
>     UclkDpmChangeRange_t UclkDpmTargFreqRange; // In Mhz
> @@ -755,8 +755,8 @@ typedef struct {
>     // Link DPM Settings
>     uint8_t      PcieGenSpeed[NUM_LINK_LEVELS];           ///<
> 0:PciE-gen1 1:PciE-gen2 2:PciE-gen3 3:PciE-gen4
>     uint8_t      PcieLaneCount[NUM_LINK_LEVELS];          ///< 1=3Dx1,
> 2=3Dx2, 3=3Dx4, 4=3Dx8, 5=3Dx12, 6=3Dx16
> -  uint16_t     LclkFreq[NUM_LINK_LEVELS];
> -
> +  uint16_t     LclkFreq[NUM_LINK_LEVELS];
> +
>     // SECTION: Fan Control
>     uint16_t     FanStopTemp;          //Celcius
>     uint16_t     FanStartTemp;         //Celcius
> @@ -767,36 +767,36 @@ typedef struct {
>     uint16_t     FanAcousticLimitRpm;
>     uint16_t     FanThrottlingRpm;
>     uint16_t     FanMaximumRpm;
> -  uint16_t     MGpuFanBoostLimitRpm;
> +  uint16_t     MGpuFanBoostLimitRpm;
>     uint16_t     FanTargetTemperature;
>     uint16_t     FanTargetGfxclk;
>     uint16_t     FanPadding16;
>     uint8_t      FanTempInputSelect;
>     uint8_t      FanPadding;
> -  uint8_t      FanZeroRpmEnable;
> +  uint8_t      FanZeroRpmEnable;
>     uint8_t      FanTachEdgePerRev;
> -
> +
>     // The following are AFC override parameters. Leave at 0 to use FW
> defaults.
>     int16_t      FuzzyFan_ErrorSetDelta;
>     int16_t      FuzzyFan_ErrorRateSetDelta;
>     int16_t      FuzzyFan_PwmSetDelta;
>     uint16_t     FuzzyFan_Reserved;
>
> -  // SECTION: AVFS
> +  // SECTION: AVFS
>     // Overrides
>     uint8_t           OverrideAvfsGb[AVFS_VOLTAGE_COUNT];
> -  uint8_t           dBtcGbGfxDfllModelSelect;  //0 -> fused piece-wise
> model, 1 -> piece-wise linear(PPTable), 2 -> quadratic model(PPTable)
> +  uint8_t           dBtcGbGfxDfllModelSelect;  //0 -> fused piece-wise
> model, 1 -> piece-wise linear(PPTable), 2 -> quadratic model(PPTable)
>     uint8_t           Padding8_Avfs;
>
> -  QuadraticInt_t    qAvfsGb[AVFS_VOLTAGE_COUNT];              // GHz->V
> Override of fused curve
> +  QuadraticInt_t    qAvfsGb[AVFS_VOLTAGE_COUNT];              // GHz->V
> Override of fused curve
>     DroopInt_t        dBtcGbGfxPll;         // GHz->V BtcGb
>     DroopInt_t        dBtcGbGfxDfll;        // GHz->V BtcGb
>     DroopInt_t        dBtcGbSoc;            // GHz->V BtcGb
> -  LinearInt_t       qAgingGb[AVFS_VOLTAGE_COUNT];          // GHz->V
> +  LinearInt_t       qAgingGb[AVFS_VOLTAGE_COUNT];          // GHz->V
>
>     PiecewiseLinearDroopInt_t   PiecewiseLinearDroopIntGfxDfll; //GHz
> ->Vstore in IEEE float format
>
> -  QuadraticInt_t    qStaticVoltageOffset[AVFS_VOLTAGE_COUNT]; // GHz->V
> +  QuadraticInt_t    qStaticVoltageOffset[AVFS_VOLTAGE_COUNT]; // GHz->V
>
>     uint16_t          DcTol[AVFS_VOLTAGE_COUNT];            // mV Q2
>
> @@ -807,17 +807,17 @@ typedef struct {
>     uint16_t          DcBtcMax[AVFS_VOLTAGE_COUNT];       // mV Q2
>
>     uint16_t          DcBtcGb[AVFS_VOLTAGE_COUNT];       // mV Q2
> -
> +
>     // SECTION: XGMI
>     uint8_t           XgmiDpmPstates[NUM_XGMI_LEVELS]; // 2 DPM states,
> high and low.  0-P0, 1-P1, 2-P2, 3-P3.
>     uint8_t           XgmiDpmSpare[2];
>
>     // SECTION: Advanced Options
>     uint32_t          DebugOverrides;
> -  QuadraticInt_t    ReservedEquation0;
> -  QuadraticInt_t    ReservedEquation1;
> -  QuadraticInt_t    ReservedEquation2;
> -  QuadraticInt_t    ReservedEquation3;
> +  QuadraticInt_t    ReservedEquation0;
> +  QuadraticInt_t    ReservedEquation1;
> +  QuadraticInt_t    ReservedEquation2;
> +  QuadraticInt_t    ReservedEquation3;
>
>     // SECTION: Sku Reserved
>     uint8_t          CustomerVariant;
> @@ -825,17 +825,17 @@ typedef struct {
>     //VC BTC parameters are only applicable to VDD_GFX domain
>     uint8_t          VcBtcEnabled;
>     uint16_t         VcBtcVminT0;                 // T0_VMIN
> -  uint16_t         VcBtcFixedVminAgingOffset;   //
> FIXED_VMIN_AGING_OFFSET
> -  uint16_t         VcBtcVmin2PsmDegrationGb;    //
> VMIN_TO_PSM_DEGRADATION_GB
> +  uint16_t         VcBtcFixedVminAgingOffset;   //
> FIXED_VMIN_AGING_OFFSET
> +  uint16_t         VcBtcVmin2PsmDegrationGb;    //
> VMIN_TO_PSM_DEGRADATION_GB
>     uint32_t         VcBtcPsmA;                   // A_PSM
>     uint32_t         VcBtcPsmB;                   // B_PSM
>     uint32_t         VcBtcVminA;                  // A_VMIN
> -  uint32_t         VcBtcVminB;                  // B_VMIN
> -
> +  uint32_t         VcBtcVminB;                  // B_VMIN
> +
>     //GPIO Board feature
>     uint16_t         LedGpio;            //GeneriA GPIO flag used to
> control the radeon LEDs
> -  uint16_t         GfxPowerStagesGpio; //Genlk_vsync GPIO flag used to
> control gfx power stages
> -
> +  uint16_t         GfxPowerStagesGpio; //Genlk_vsync GPIO flag used to
> control gfx power stages
> +
>     uint32_t         SkuReserved[8];
>
>
> @@ -845,7 +845,7 @@ typedef struct {
>     uint32_t     GamingClk[6];
>
>     // SECTION: I2C Control
> -  I2cControllerConfig_t  I2cControllers[NUM_I2C_CONTROLLERS];
> +  I2cControllerConfig_t  I2cControllers[NUM_I2C_CONTROLLERS];
>
>     uint8_t      GpioScl;  // GPIO Number for SCL Line, used only for
> CKSVII2C1
>     uint8_t      GpioSda;  // GPIO Number for SDA Line, used only for
> CKSVII2C1
> @@ -875,21 +875,21 @@ typedef struct {
>     uint16_t     Mem0MaxCurrent;   // in Amps
>     int8_t       Mem0Offset;       // in Amps
>     uint8_t      Padding_TelemetryMem0;
> -
> +
>     uint16_t     Mem1MaxCurrent;   // in Amps
>     int8_t       Mem1Offset;       // in Amps
>     uint8_t      Padding_TelemetryMem1;
>
>     uint32_t     MvddRatio; // This is used for MVDD  Svi2 Div Ratio
> workaround. It has 16 fractional bits (Q16.16)
> -
> +
>     // SECTION: GPIO Settings
>     uint8_t      AcDcGpio;        // GPIO pin configured for AC/DC
> switching
>     uint8_t      AcDcPolarity;    // GPIO polarity for AC/DC switching
>     uint8_t      VR0HotGpio;      // GPIO pin configured for VR0 HOT
> event
>     uint8_t      VR0HotPolarity;  // GPIO polarity for VR0 HOT event
>
> -  uint8_t      VR1HotGpio;      // GPIO pin configured for VR1 HOT
> event
> -  uint8_t      VR1HotPolarity;  // GPIO polarity for VR1 HOT event
> +  uint8_t      VR1HotGpio;      // GPIO pin configured for VR1 HOT
> event
> +  uint8_t      VR1HotPolarity;  // GPIO polarity for VR1 HOT event
>     uint8_t      GthrGpio;        // GPIO pin configured for GTHR Event
>     uint8_t      GthrPolarity;    // replace GPIO polarity for GTHR
>
> @@ -914,7 +914,7 @@ typedef struct {
>     uint8_t      DfllGfxclkSpreadEnabled;   // on or off
>     uint8_t      DfllGfxclkSpreadPercent;   // Q4.4
>     uint16_t     DfllGfxclkSpreadFreq;      // kHz
> -
> +
>     // UCLK Spread Spectrum
>     uint16_t     UclkSpreadPadding;
>     uint16_t     UclkSpreadFreq;      // kHz
> @@ -923,23 +923,23 @@ typedef struct {
>     uint8_t      FclkSpreadEnabled;   // on or off
>     uint8_t      FclkSpreadPercent;   // Q4.4
>     uint16_t     FclkSpreadFreq;      // kHz
> -
> +
>     // Section: Memory Config
> -  uint32_t     MemoryChannelEnabled; // For DRAM use only, Max 32
> channels enabled bit mask.
> -
> +  uint32_t     MemoryChannelEnabled; // For DRAM use only, Max 32
> channels enabled bit mask.
> +
>     uint8_t      DramBitWidth; // For DRAM use only.  See Dram Bit width
> type defines
>     uint8_t      PaddingMem1[3];
>
>     // Section: Total Board Power
>     uint16_t     TotalBoardPower;     //Only needed for TCP Estimated
> case, where TCP =3D TGP+Total Board Power
> -  uint16_t     BoardPowerPadding;
> -
> +  uint16_t     BoardPowerPadding;
> +
>     // SECTION: XGMI Training
> -  uint8_t      XgmiLinkSpeed   [NUM_XGMI_PSTATE_LEVELS];
> -  uint8_t      XgmiLinkWidth   [NUM_XGMI_PSTATE_LEVELS];
> +  uint8_t      XgmiLinkSpeed[NUM_XGMI_PSTATE_LEVELS];
> +  uint8_t      XgmiLinkWidth[NUM_XGMI_PSTATE_LEVELS];
>
> -  uint16_t     XgmiFclkFreq    [NUM_XGMI_PSTATE_LEVELS];
> -  uint16_t     XgmiSocVoltage  [NUM_XGMI_PSTATE_LEVELS];
> +  uint16_t     XgmiFclkFreq[NUM_XGMI_PSTATE_LEVELS];
> +  uint16_t     XgmiSocVoltage[NUM_XGMI_PSTATE_LEVELS];
>
>     // SECTION: UMC feature flags
>     uint8_t      HsrEnabled;
> @@ -947,7 +947,7 @@ typedef struct {
>     uint8_t      PaddingUmcFlags[2];
>
>     // UCLK Spread Spectrum
> -  uint8_t      UclkSpreadPercent[16];
> +  uint8_t      UclkSpreadPercent[16];
>
>     // SECTION: Board Reserved
>     uint32_t     BoardReserved[11];
> @@ -983,14 +983,14 @@ typedef struct {
>
>     // SECTION: Power Configuration
>     uint8_t      TotalPowerConfig;    //0-TDP, 1-TGP, 2-TCP Estimated,
> 3-TCP Measured. Use defines from PwrConfig_e
> -  uint8_t      TotalPowerPadding[3];
> +  uint8_t      TotalPowerPadding[3];
>
>     // SECTION: APCC Settings
>     uint32_t     ApccPlusResidencyLimit;
>
>     //SECTION: SMNCLK DPM
> -  uint16_t       SmnclkDpmFreq        [NUM_SMNCLK_DPM_LEVELS];       //
> in MHz
> -  uint16_t       SmnclkDpmVoltage     [NUM_SMNCLK_DPM_LEVELS];       //
> mV(Q2)
> +  uint16_t       SmnclkDpmFreq[NUM_SMNCLK_DPM_LEVELS];       // in MHz
> +  uint16_t       SmnclkDpmVoltage[NUM_SMNCLK_DPM_LEVELS];       //
> mV(Q2)
>
>     uint32_t       PaddingAPCC;
>     uint16_t
> PerPartDroopVsetGfxDfll[NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS];
> //In mV(Q2)
> @@ -999,14 +999,14 @@ typedef struct {
>     // SECTION: Throttler settings
>     uint32_t ThrottlerControlMask;   // See Throtter masks defines
>
> -  // SECTION: FW DSTATE Settings
> +  // SECTION: FW DSTATE Settings
>     uint32_t FwDStateMask;           // See FW DState masks defines
>
>     // SECTION: ULV Settings
>     uint16_t  UlvVoltageOffsetSoc; // In mV(Q2)
>     uint16_t  UlvVoltageOffsetGfx; // In mV(Q2)
>
> -  uint16_t     MinVoltageUlvGfx; // In mV(Q2)  Minimum Voltage ("Vmin")
> of VDD_GFX in ULV mode
> +  uint16_t     MinVoltageUlvGfx; // In mV(Q2)  Minimum Voltage ("Vmin")
> of VDD_GFX in ULV mode
>     uint16_t     MinVoltageUlvSoc; // In mV(Q2)  Minimum Voltage ("Vmin")
> of VDD_SOC in ULV mode
>
>     uint16_t     SocLIVmin;
> @@ -1038,42 +1038,42 @@ typedef struct {
>     //SECTION: DPM Config 1
>     DpmDescriptor_t DpmDescriptor[PPCLK_COUNT];
>
> -  uint16_t       FreqTableGfx      [NUM_GFXCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTableVclk     [NUM_VCLK_DPM_LEVELS    ];     // In
> MHz
> -  uint16_t       FreqTableDclk     [NUM_DCLK_DPM_LEVELS    ];     // In
> MHz
> -  uint16_t       FreqTableSocclk   [NUM_SOCCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTableUclk     [NUM_UCLK_DPM_LEVELS    ];     // In
> MHz
> -  uint16_t       FreqTableDcefclk  [NUM_DCEFCLK_DPM_LEVELS ];     // In
> MHz
> -  uint16_t       FreqTableDispclk  [NUM_DISPCLK_DPM_LEVELS ];     // In
> MHz
> -  uint16_t       FreqTablePixclk   [NUM_PIXCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTablePhyclk   [NUM_PHYCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTableDtbclk   [NUM_DTBCLK_DPM_LEVELS  ];     // In
> MHz
> -  uint16_t       FreqTableFclk     [NUM_FCLK_DPM_LEVELS    ];     // In
> MHz
> +  uint16_t       FreqTableGfx[NUM_GFXCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableVclk[NUM_VCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableDclk[NUM_DCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableSocclk[NUM_SOCCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableUclk[NUM_UCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableDcefclk[NUM_DCEFCLK_DPM_LEVELS];     // In
> MHz
> +  uint16_t       FreqTableDispclk[NUM_DISPCLK_DPM_LEVELS];     // In
> MHz
> +  uint16_t       FreqTablePixclk[NUM_PIXCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTablePhyclk[NUM_PHYCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableDtbclk[NUM_DTBCLK_DPM_LEVELS];     // In MHz
> +  uint16_t       FreqTableFclk[NUM_FCLK_DPM_LEVELS];     // In MHz
>     uint32_t       Paddingclks;
>
>     DroopInt_t
> PerPartDroopModelGfxDfll[NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS];
> //GHz ->Vstore in IEEE float format
>
> -  uint32_t       DcModeMaxFreq     [PPCLK_COUNT            ];     // In
> MHz
> +  uint32_t       DcModeMaxFreq[PPCLK_COUNT];     // In MHz
>
> -  uint8_t        FreqTableUclkDiv  [NUM_UCLK_DPM_LEVELS    ];     //
> 0:Div-1, 1:Div-1/2, 2:Div-1/4, 3:Div-1/8
> +  uint8_t        FreqTableUclkDiv[NUM_UCLK_DPM_LEVELS];     // 0:Div-1,
> 1:Div-1/2, 2:Div-1/4, 3:Div-1/8
>
>     // Used for MALL performance boost
>     uint16_t       FclkBoostFreq;                                   // In
> Mhz
>     uint16_t       FclkParamPadding;
>
>     // SECTION: DPM Config 2
> -  uint16_t       Mp0clkFreq        [NUM_MP0CLK_DPM_LEVELS];       // in
> MHz
> -  uint16_t       Mp0DpmVoltage     [NUM_MP0CLK_DPM_LEVELS];       //
> mV(Q2)
> -  uint16_t       MemVddciVoltage   [NUM_UCLK_DPM_LEVELS];         //
> mV(Q2)
> -  uint16_t       MemMvddVoltage    [NUM_UCLK_DPM_LEVELS];         //
> mV(Q2)
> +  uint16_t       Mp0clkFreq[NUM_MP0CLK_DPM_LEVELS];       // in MHz
> +  uint16_t       Mp0DpmVoltage[NUM_MP0CLK_DPM_LEVELS];       // mV(Q2)
> +  uint16_t       MemVddciVoltage[NUM_UCLK_DPM_LEVELS];         //
> mV(Q2)
> +  uint16_t       MemMvddVoltage[NUM_UCLK_DPM_LEVELS];         // mV(Q2)
>     // GFXCLK DPM
>     uint16_t        GfxclkFgfxoffEntry;   // in Mhz
> -  uint16_t        GfxclkFinit;          // in Mhz
> -  uint16_t        GfxclkFidle;          // in MHz
> +  uint16_t        GfxclkFinit;          // in Mhz
> +  uint16_t        GfxclkFidle;          // in MHz
>     uint8_t         GfxclkSource;         // 0 =3D PLL, 1 =3D DFLL
>     uint8_t         GfxclkPadding;
>
> -  // GFX GPO
> +  // GFX GPO
>     uint8_t         GfxGpoSubFeatureMask; // bit 0 =3D PACE, bit 1 =3D DE=
M
>     uint8_t         GfxGpoEnabledWorkPolicyMask; //Any policy that GPO
> can be enabled
>     uint8_t         GfxGpoDisabledWorkPolicyMask; //Any policy that GPO
> can be disabled
> @@ -1086,14 +1086,14 @@ typedef struct {
>     uint16_t        GfxDcsFclkFopt;       // Optimal FCLK for DCS in Mhz
>     uint16_t        GfxDcsUclkFopt;       // Optimal UCLK for DCS in Mhz
>
> -  uint16_t        DcsGfxOffVoltage;     //Voltage in mV(Q2) applied to
> VDDGFX when entering DCS GFXOFF phase
> +  uint16_t        DcsGfxOffVoltage;     //Voltage in mV(Q2) applied to
> VDDGFX when entering DCS GFXOFF phase
>
>     uint16_t        DcsMinGfxOffTime;     //Minimum amount of time PMFW
> shuts GFX OFF as part of GFX DCS phase
>     uint16_t        DcsMaxGfxOffTime;      //Maximum amount of time PMFW
> can shut GFX OFF as part of GFX DCS phase at a stretch.
>
>     uint32_t        DcsMinCreditAccum;    //Min amount of positive credit
> accumulation before waking GFX up as part of DCS.
>
> -  uint16_t        DcsExitHysteresis;    //The min amount of time power
> credit accumulator should have a value > 0 before SMU exits the DCS
> throttling phase.
> +  uint16_t        DcsExitHysteresis;    //The min amount of time power
> credit accumulator should have a value > 0 before SMU exits the DCS
> throttling phase.
>     uint16_t        DcsTimeout;           //This is the amount of time
> SMU FW waits for RLC to put GFX into GFXOFF before reverting to the
> fallback mechanism of throttling GFXCLK to Fmin.
>
>     uint32_t        DcsParamPadding[5];
> @@ -1104,7 +1104,7 @@ typedef struct {
>     uint8_t      LowestUclkReservedForUlv; // Set this to 1 if UCLK DPM0
> is reserved for ULV-mode only
>     uint8_t      PaddingMem[3];
>
> -  uint8_t      UclkDpmPstates     [NUM_UCLK_DPM_LEVELS];     // 4 DPM
> states, 0-P0, 1-P1, 2-P2, 3-P3.
> +  uint8_t      UclkDpmPstates[NUM_UCLK_DPM_LEVELS];     // 4 DPM
> states, 0-P0, 1-P1, 2-P2, 3-P3.
>
>     // Used for 2-Step UCLK change workaround
>     UclkDpmChangeRange_t UclkDpmSrcFreqRange;  // In Mhz
> @@ -1115,7 +1115,7 @@ typedef struct {
>     // Link DPM Settings
>     uint8_t      PcieGenSpeed[NUM_LINK_LEVELS];           ///<
> 0:PciE-gen1 1:PciE-gen2 2:PciE-gen3 3:PciE-gen4
>     uint8_t      PcieLaneCount[NUM_LINK_LEVELS];          ///< 1=3Dx1,
> 2=3Dx2, 3=3Dx4, 4=3Dx8, 5=3Dx12, 6=3Dx16
> -  uint16_t     LclkFreq[NUM_LINK_LEVELS];
> +  uint16_t     LclkFreq[NUM_LINK_LEVELS];
>
>     // SECTION: Fan Control
>     uint16_t     FanStopTemp;          //Celcius
> @@ -1133,7 +1133,7 @@ typedef struct {
>     uint16_t     FanPadding16;
>     uint8_t      FanTempInputSelect;
>     uint8_t      FanPadding;
> -  uint8_t      FanZeroRpmEnable;
> +  uint8_t      FanZeroRpmEnable;
>     uint8_t      FanTachEdgePerRev;
>
>     // The following are AFC override parameters. Leave at 0 to use FW
> defaults.
> @@ -1142,21 +1142,21 @@ typedef struct {
>     int16_t      FuzzyFan_PwmSetDelta;
>     uint16_t     FuzzyFan_Reserved;
>
> -  // SECTION: AVFS
> +  // SECTION: AVFS
>     // Overrides
>     uint8_t           OverrideAvfsGb[AVFS_VOLTAGE_COUNT];
> -  uint8_t           dBtcGbGfxDfllModelSelect;  //0 -> fused piece-wise
> model, 1 -> piece-wise linear(PPTable), 2 -> quadratic model(PPTable)
> +  uint8_t           dBtcGbGfxDfllModelSelect;  //0 -> fused piece-wise
> model, 1 -> piece-wise linear(PPTable), 2 -> quadratic model(PPTable)
>     uint8_t           Padding8_Avfs;
>
> -  QuadraticInt_t    qAvfsGb[AVFS_VOLTAGE_COUNT];              // GHz->V
> Override of fused curve
> +  QuadraticInt_t    qAvfsGb[AVFS_VOLTAGE_COUNT];              // GHz->V
> Override of fused curve
>     DroopInt_t        dBtcGbGfxPll;         // GHz->V BtcGb
>     DroopInt_t        dBtcGbGfxDfll;        // GHz->V BtcGb
>     DroopInt_t        dBtcGbSoc;            // GHz->V BtcGb
> -  LinearInt_t       qAgingGb[AVFS_VOLTAGE_COUNT];          // GHz->V
> +  LinearInt_t       qAgingGb[AVFS_VOLTAGE_COUNT];          // GHz->V
>
>     PiecewiseLinearDroopInt_t   PiecewiseLinearDroopIntGfxDfll; //GHz
> ->Vstore in IEEE float format
>
> -  QuadraticInt_t    qStaticVoltageOffset[AVFS_VOLTAGE_COUNT]; // GHz->V
> +  QuadraticInt_t    qStaticVoltageOffset[AVFS_VOLTAGE_COUNT]; // GHz->V
>
>     uint16_t          DcTol[AVFS_VOLTAGE_COUNT];            // mV Q2
>
> @@ -1185,16 +1185,16 @@ typedef struct {
>       //VC BTC parameters are only applicable to VDD_GFX domain
>     uint8_t          VcBtcEnabled;
>     uint16_t         VcBtcVminT0;                 // T0_VMIN
> -  uint16_t         VcBtcFixedVminAgingOffset;   //
> FIXED_VMIN_AGING_OFFSET
> -  uint16_t         VcBtcVmin2PsmDegrationGb;    //
> VMIN_TO_PSM_DEGRADATION_GB
> +  uint16_t         VcBtcFixedVminAgingOffset;   //
> FIXED_VMIN_AGING_OFFSET
> +  uint16_t         VcBtcVmin2PsmDegrationGb;    //
> VMIN_TO_PSM_DEGRADATION_GB
>     uint32_t         VcBtcPsmA;                   // A_PSM
>     uint32_t         VcBtcPsmB;                   // B_PSM
>     uint32_t         VcBtcVminA;                  // A_VMIN
> -  uint32_t         VcBtcVminB;                  // B_VMIN
> +  uint32_t         VcBtcVminB;                  // B_VMIN
>
>     //GPIO Board feature
>     uint16_t         LedGpio;            //GeneriA GPIO flag used to
> control the radeon LEDs
> -  uint16_t         GfxPowerStagesGpio; //Genlk_vsync GPIO flag used to
> control gfx power stages
> +  uint16_t         GfxPowerStagesGpio; //Genlk_vsync GPIO flag used to
> control gfx power stages
>
>     uint32_t         SkuReserved[63];
>
> @@ -1206,7 +1206,7 @@ typedef struct {
>     uint32_t     GamingClk[6];
>
>     // SECTION: I2C Control
> -  I2cControllerConfig_t  I2cControllers[NUM_I2C_CONTROLLERS];
> +  I2cControllerConfig_t  I2cControllers[NUM_I2C_CONTROLLERS];
>
>     uint8_t      GpioScl;  // GPIO Number for SCL Line, used only for
> CKSVII2C1
>     uint8_t      GpioSda;  // GPIO Number for SDA Line, used only for
> CKSVII2C1
> @@ -1249,8 +1249,8 @@ typedef struct {
>     uint8_t      VR0HotGpio;      // GPIO pin configured for VR0 HOT
> event
>     uint8_t      VR0HotPolarity;  // GPIO polarity for VR0 HOT event
>
> -  uint8_t      VR1HotGpio;      // GPIO pin configured for VR1 HOT
> event
> -  uint8_t      VR1HotPolarity;  // GPIO polarity for VR1 HOT event
> +  uint8_t      VR1HotGpio;      // GPIO pin configured for VR1 HOT
> event
> +  uint8_t      VR1HotPolarity;  // GPIO polarity for VR1 HOT event
>     uint8_t      GthrGpio;        // GPIO pin configured for GTHR Event
>     uint8_t      GthrPolarity;    // replace GPIO polarity for GTHR
>
> @@ -1286,21 +1286,21 @@ typedef struct {
>     uint16_t     FclkSpreadFreq;      // kHz
>
>     // Section: Memory Config
> -  uint32_t     MemoryChannelEnabled; // For DRAM use only, Max 32
> channels enabled bit mask.
> +  uint32_t     MemoryChannelEnabled; // For DRAM use only, Max 32
> channels enabled bit mask.
>
>     uint8_t      DramBitWidth; // For DRAM use only.  See Dram Bit width
> type defines
>     uint8_t      PaddingMem1[3];
>
>     // Section: Total Board Power
>     uint16_t     TotalBoardPower;     //Only needed for TCP Estimated
> case, where TCP =3D TGP+Total Board Power
> -  uint16_t     BoardPowerPadding;
> +  uint16_t     BoardPowerPadding;
>
>     // SECTION: XGMI Training
> -  uint8_t      XgmiLinkSpeed   [NUM_XGMI_PSTATE_LEVELS];
> -  uint8_t      XgmiLinkWidth   [NUM_XGMI_PSTATE_LEVELS];
> +  uint8_t      XgmiLinkSpeed[NUM_XGMI_PSTATE_LEVELS];
> +  uint8_t      XgmiLinkWidth[NUM_XGMI_PSTATE_LEVELS];
>
> -  uint16_t     XgmiFclkFreq    [NUM_XGMI_PSTATE_LEVELS];
> -  uint16_t     XgmiSocVoltage  [NUM_XGMI_PSTATE_LEVELS];
> +  uint16_t     XgmiFclkFreq[NUM_XGMI_PSTATE_LEVELS];
> +  uint16_t     XgmiSocVoltage[NUM_XGMI_PSTATE_LEVELS];
>
>     // SECTION: UMC feature flags
>     uint8_t      HsrEnabled;
> @@ -1328,15 +1328,15 @@ typedef struct {
>     uint16_t     UclkAverageLpfTau;
>     uint16_t     GfxActivityLpfTau;
>     uint16_t     UclkActivityLpfTau;
> -  uint16_t     SocketPowerLpfTau;
> +  uint16_t     SocketPowerLpfTau;
>     uint16_t     VcnClkAverageLpfTau;
> -  uint16_t     padding16;
> +  uint16_t     padding16;
>   } DriverSmuConfig_t;
>
>   typedef struct {
>     DriverSmuConfig_t DriverSmuConfig;
>
> -  uint32_t     Spare[7];
> +  uint32_t     Spare[7];
>     // Padding - ignore
>     uint32_t     MmHubPadding[8]; // SMU internal use
>   } DriverSmuConfigExternal_t;
> @@ -1345,14 +1345,14 @@ typedef struct {
>     uint16_t               GfxclkFmin;           // MHz
>     uint16_t               GfxclkFmax;           // MHz
>     QuadraticInt_t         CustomGfxVfCurve;     // a: mV/MHz^2, b:
> mv/MHz, c: mV
> -  uint16_t               CustomCurveFmin;      // MHz
> -  uint16_t               UclkFmin;             // MHz
> +  uint16_t               CustomCurveFmin;      // MHz
> +  uint16_t               UclkFmin;             // MHz
>     uint16_t               UclkFmax;             // MHz
>     int16_t                OverDrivePct;         // %
>     uint16_t               FanMaximumRpm;
>     uint16_t               FanMinimumPwm;
>     uint16_t               FanAcousticLimitRpm;
> -  uint16_t               FanTargetTemperature; // Degree Celcius
> +  uint16_t               FanTargetTemperature; // Degree Celcius
>     uint8_t                FanLinearPwmPoints[NUM_OD_FAN_MAX_POINTS];
>     uint8_t                FanLinearTempPoints[NUM_OD_FAN_MAX_POINTS];
>     uint16_t               MaxOpTemp;            // Degree Celcius
> @@ -1361,13 +1361,13 @@ typedef struct {
>     uint8_t                FanZeroRpmStopTemp;
>     uint8_t                FanMode;
>     uint8_t                Padding[1];
> -} OverDriveTable_t;
> +} OverDriveTable_t;
>
>   typedef struct {
>     OverDriveTable_t OverDriveTable;
> -  uint32_t      Spare[8];
> +  uint32_t      Spare[8];
>
> -  uint32_t     MmHubPadding[8]; // SMU internal use
> +  uint32_t     MmHubPadding[8]; // SMU internal use
>   } OverDriveTableExternal_t;
>
>   typedef struct {
> @@ -1380,7 +1380,7 @@ typedef struct {
>     uint16_t AverageUclkFrequencyPreDs  ;
>     uint16_t AverageUclkFrequencyPostDs  ;
>
> -
> +
>     uint16_t AverageGfxActivity    ;
>     uint16_t AverageUclkActivity   ;
>     uint8_t  CurrSocVoltageOffset  ;
> @@ -1393,14 +1393,14 @@ typedef struct {
>     uint16_t TemperatureMem        ;
>     uint16_t TemperatureVrGfx      ;
>     uint16_t TemperatureVrMem0     ;
> -  uint16_t TemperatureVrMem1     ;
> +  uint16_t TemperatureVrMem1     ;
>     uint16_t TemperatureVrSoc      ;
>     uint16_t TemperatureLiquid0    ;
> -  uint16_t TemperatureLiquid1    ;
> +  uint16_t TemperatureLiquid1    ;
>     uint16_t TemperaturePlx        ;
>     uint16_t Padding16             ;
> -  uint32_t ThrottlerStatus       ;
> -
> +  uint32_t ThrottlerStatus       ;
> +
>     uint8_t  LinkDpmLevel;
>     uint8_t  CurrFanPwm;
>     uint16_t CurrFanSpeed;
> @@ -1416,7 +1416,7 @@ typedef struct {
>     uint16_t AverageVclk0Frequency  ;
>     uint16_t AverageDclk0Frequency  ;
>     uint16_t AverageVclk1Frequency  ;
> -  uint16_t AverageDclk1Frequency  ;
> +  uint16_t AverageDclk1Frequency  ;
>     uint16_t VcnActivityPercentage  ; //place holder, David N. to provide
> full sequence
>     uint8_t  PcieRate               ;
>     uint8_t  PcieWidth              ;
> @@ -1614,7 +1614,7 @@ typedef struct {
>     uint32_t Spare[1];
>
>     // Padding - ignore
> -  uint32_t     MmHubPadding[8]; // SMU internal use
> +  uint32_t     MmHubPadding[8]; // SMU internal use
>   } SmuMetricsExternal_t;
>
>   typedef struct {
> @@ -1622,7 +1622,7 @@ typedef struct {
>     uint16_t MaxClock; // This is either DCEFCLK or SOCCLK (in MHz)
>     uint16_t MinUclk;
>     uint16_t MaxUclk;
> -
> +
>     uint8_t  WmSetting;
>     uint8_t  Flags;
>     uint8_t  Padding[2];
> @@ -1658,7 +1658,7 @@ typedef struct {
>   typedef struct {
>     uint16_t avgPsmCount[67];
>     uint16_t minPsmCount[67];
> -  float    avgPsmVoltage[67];
> +  float    avgPsmVoltage[67];
>     float    minPsmVoltage[67];
>   } AvfsDebugTable_t;
>
> @@ -1673,7 +1673,7 @@ typedef struct {
>     uint8_t  Padding;
>
>     uint8_t  AvfsEn[AVFS_VOLTAGE_COUNT];
> -
> +
>     uint8_t  OverrideVFT[AVFS_VOLTAGE_COUNT];
>     uint8_t  OverrideAvfsGb[AVFS_VOLTAGE_COUNT];
>
> @@ -1729,7 +1729,7 @@ typedef struct {
>     uint8_t   Gfx_IdleHystLimit;
>     uint8_t   Gfx_FPS;
>     uint8_t   Gfx_MinActiveFreqType;
> -  uint8_t   Gfx_BoosterFreqType;
> +  uint8_t   Gfx_BoosterFreqType;
>     uint8_t   Gfx_MinFreqStep;                // Minimum delta between
> current and target frequeny in order for FW to change clock.
>     uint16_t  Gfx_MinActiveFreq;              // MHz
>     uint16_t  Gfx_BoosterFreq;                // MHz
> @@ -1744,7 +1744,7 @@ typedef struct {
>     uint8_t   Fclk_IdleHystLimit;
>     uint8_t   Fclk_FPS;
>     uint8_t   Fclk_MinActiveFreqType;
> -  uint8_t   Fclk_BoosterFreqType;
> +  uint8_t   Fclk_BoosterFreqType;
>     uint8_t   Fclk_MinFreqStep;                // Minimum delta between
> current and target frequeny in order for FW to change clock.
>     uint16_t  Fclk_MinActiveFreq;              // MHz
>     uint16_t  Fclk_BoosterFreq;                // MHz
> @@ -1780,19 +1780,19 @@ typedef struct {
>
>   typedef struct {
>     DpmActivityMonitorCoeffInt_t DpmActivityMonitorCoeffInt;
> -  uint32_t     MmHubPadding[8]; // SMU internal use
> +  uint32_t     MmHubPadding[8]; // SMU internal use
>   } DpmActivityMonitorCoeffIntExternal_t;
>
>   // Workload bits
> -#define WORKLOAD_PPLIB_DEFAULT_BIT        0
> -#define WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT 1
> -#define WORKLOAD_PPLIB_POWER_SAVING_BIT   2
> -#define WORKLOAD_PPLIB_VIDEO_BIT          3
> -#define WORKLOAD_PPLIB_VR_BIT             4
> -#define WORKLOAD_PPLIB_COMPUTE_BIT        5
> -#define WORKLOAD_PPLIB_CUSTOM_BIT         6
> -#define WORKLOAD_PPLIB_W3D_BIT            7
> -#define WORKLOAD_PPLIB_COUNT              8
> +#define WORKLOAD_PPLIB_DEFAULT_BIT        0
> +#define WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT 1
> +#define WORKLOAD_PPLIB_POWER_SAVING_BIT   2
> +#define WORKLOAD_PPLIB_VIDEO_BIT          3
> +#define WORKLOAD_PPLIB_VR_BIT             4
> +#define WORKLOAD_PPLIB_COMPUTE_BIT        5
> +#define WORKLOAD_PPLIB_CUSTOM_BIT         6
> +#define WORKLOAD_PPLIB_W3D_BIT            7
> +#define WORKLOAD_PPLIB_COUNT              8
>
>
>   // These defines are used with the following messages:
> @@ -1824,8 +1824,8 @@ typedef struct {
>
>   typedef struct {
>     RlcPaceFlopsPerByteOverride_t RlcPaceFlopsPerByteOverride;
> -
> -  uint32_t     MmHubPadding[8]; // SMU internal use
> +
> +  uint32_t     MmHubPadding[8]; // SMU internal use
>   } RlcPaceFlopsPerByteOverrideExternal_t;
>
>   // These defines are used with the SMC_MSG_SetUclkFastSwitch message.
>
