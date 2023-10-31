Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2A7DD6EB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 21:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FAC10E5B6;
	Tue, 31 Oct 2023 20:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA90610E5B6;
 Tue, 31 Oct 2023 20:08:13 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-586beb5e6a7so3185980eaf.1; 
 Tue, 31 Oct 2023 13:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698782893; x=1699387693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iu1Hcatd1VMcKcshOO2Tp9XCxjRyh4/pRps0AbnJ/RA=;
 b=gQVrGP+sfcj1alAJeo450G7zAYKnBSO6vwiX7DamKg8KwWSmavrWa8f00mNFJSjbSA
 bmdi25dhh/kyYQdQ2Ga34riEvVSOv1zvKyo7zrKcnJ5SEG9hv7ds5Zv6R1g+1DSQtsYG
 1emlb6EANZYZKj/OcOWDduFSYc76Y3shnOTZ5/HmI0lVHxCvXInOrn4rEG1RlfSIwTOO
 LOJ53Q7RzhrI4UQyP0l4CGKqxcLTdi/xOX9zxF7yJdFMc4f6Ia5a/D6W48NdxricU2CO
 ZVefaWZ+Vlg2XxmYqlAR3XxKRr9Gx6szkTGbjRTE6g1ZmEKmSbqHZtLTtQGZ+RukNKkO
 xK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698782893; x=1699387693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iu1Hcatd1VMcKcshOO2Tp9XCxjRyh4/pRps0AbnJ/RA=;
 b=sHp9XaVm+LSkcEPuo40BEicW/2Kb++q9GzGCW4nBEHOscquZ2YviAM7KamLdrvN0WP
 URpLWJfEfjZPi5+hZKTS2acUI4Jpb2QKgAmEUe8AmiA7QNN2fmxGLTXlXTnoo/qfJnY8
 q6vEpqqLZecDF6YuqqiFkXXliykKz9rCpGYOOr8QogVER8v3v8/m/JZYIV+Lh2vFd+4P
 +HD9uDltAarxDysXXrdy8f8pD2lTZonkmHNQkNAvVSHd6Di9zLE5YbJempYqEzt0MJYm
 IhyZK7Wh4DnykSyLeBF98vSsy+oqgsXITAw1HCnnPcScYQ1sSgB1MmC7nGWx7QpATIMy
 uCiQ==
X-Gm-Message-State: AOJu0YzOZxHn9orE6MU61uF/tOnwoqrUsczemm3YlYjJky5pOrBj1jAW
 htPKlswqMXlM780GN3cWbGqt8vny9InsfWTmR88=
X-Google-Smtp-Source: AGHT+IG+P7koVY8SGJbHtXG0/I8RB4zJVep7b7vhj49JCoS41sDj06lVp1lboFSvN8IsADheLWD1PEtNE+1O9JUH1WY=
X-Received: by 2002:a05:6870:f814:b0:1ef:b949:3f5a with SMTP id
 fr20-20020a056870f81400b001efb9493f5amr9883998oab.4.1698782892851; Tue, 31
 Oct 2023 13:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231031170847.23458-1-jose.pekkarinen@foxhound.fi>
In-Reply-To: <20231031170847.23458-1-jose.pekkarinen@foxhound.fi>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Oct 2023 16:08:00 -0400
Message-ID: <CADnq5_NX2XDA87xfgF0ddStKyJofhkCr-rzvnKVkZ2XfM4t=mw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon: replace 1-element arrays with
 flexible-array members
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, alexander.deucher@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 31, 2023 at 1:09=E2=80=AFPM Jos=C3=A9 Pekkarinen
<jose.pekkarinen@foxhound.fi> wrote:
>
> Reported by coccinelle, the following patch will move the
> following 1 element arrays to flexible arrays.
>
> drivers/gpu/drm/radeon/atombios.h:5523:32-48: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:5545:32-48: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:5461:34-44: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:4447:30-40: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:4236:30-41: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:7095:28-45: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:3896:27-37: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:5443:16-25: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:5454:34-43: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:4603:21-32: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:4628:32-46: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:6285:29-39: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:4296:30-36: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:4756:28-36: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:4064:22-35: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:7327:9-24: WARNING use flexible-array m=
ember instead (https://www.kernel.org/doc/html/latest/process/deprecated.ht=
ml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:7332:32-53: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:7362:26-41: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:7369:29-44: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:7349:24-32: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
> drivers/gpu/drm/radeon/atombios.h:7355:27-35: WARNING use flexible-array =
member instead (https://www.kernel.org/doc/html/latest/process/deprecated.h=
tml#zero-length-and-one-element-arrays)
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
> [v1 -> v2] removed padding and hinted sensitive cases from original patch

Applied.  Thanks!

Alex

>
>  drivers/gpu/drm/radeon/atombios.h | 42 +++++++++++++++----------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/a=
tombios.h
> index 8a6621f1e82c..2db40789235c 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -3893,7 +3893,7 @@ typedef struct _ATOM_GPIO_PIN_ASSIGNMENT
>  typedef struct _ATOM_GPIO_PIN_LUT
>  {
>    ATOM_COMMON_TABLE_HEADER  sHeader;
> -  ATOM_GPIO_PIN_ASSIGNMENT     asGPIO_Pin[1];
> +  ATOM_GPIO_PIN_ASSIGNMENT     asGPIO_Pin[];
>  }ATOM_GPIO_PIN_LUT;
>
>  /***********************************************************************=
*****/
> @@ -4061,7 +4061,7 @@ typedef struct _ATOM_SRC_DST_TABLE_FOR_ONE_OBJECT  =
       //usSrcDstTableOffset
>    UCHAR               ucNumberOfSrc;
>    USHORT              usSrcObjectID[1];
>    UCHAR               ucNumberOfDst;
> -  USHORT              usDstObjectID[1];
> +  USHORT              usDstObjectID[];
>  }ATOM_SRC_DST_TABLE_FOR_ONE_OBJECT;
>
>
> @@ -4233,7 +4233,7 @@ typedef struct  _ATOM_CONNECTOR_DEVICE_TAG_RECORD
>    ATOM_COMMON_RECORD_HEADER   sheader;
>    UCHAR                       ucNumberOfDevice;
>    UCHAR                       ucReserved;
> -  ATOM_CONNECTOR_DEVICE_TAG   asDeviceTag[1];         //This Id is same =
as "ATOM_DEVICE_XXX_SUPPORT", 1 is only for allocation
> +  ATOM_CONNECTOR_DEVICE_TAG   asDeviceTag[];          //This Id is same =
as "ATOM_DEVICE_XXX_SUPPORT", 1 is only for allocation
>  }ATOM_CONNECTOR_DEVICE_TAG_RECORD;
>
>
> @@ -4293,7 +4293,7 @@ typedef struct  _ATOM_OBJECT_GPIO_CNTL_RECORD
>    ATOM_COMMON_RECORD_HEADER   sheader;
>    UCHAR                       ucFlags;                // Future expnadib=
ility
>    UCHAR                       ucNumberOfPins;         // Number of GPIO =
pins used to control the object
> -  ATOM_GPIO_PIN_CONTROL_PAIR  asGpio[1];              // the real gpio p=
in pair determined by number of pins ucNumberOfPins
> +  ATOM_GPIO_PIN_CONTROL_PAIR  asGpio[];               // the real gpio p=
in pair determined by number of pins ucNumberOfPins
>  }ATOM_OBJECT_GPIO_CNTL_RECORD;
>
>  //Definitions for GPIO pin state
> @@ -4444,7 +4444,7 @@ typedef struct  _ATOM_BRACKET_LAYOUT_RECORD
>    UCHAR                       ucWidth;
>    UCHAR                       ucConnNum;
>    UCHAR                       ucReserved;
> -  ATOM_CONNECTOR_LAYOUT_INFO  asConnInfo[1];
> +  ATOM_CONNECTOR_LAYOUT_INFO  asConnInfo[];
>  }ATOM_BRACKET_LAYOUT_RECORD;
>
>  /***********************************************************************=
*****/
> @@ -4600,7 +4600,7 @@ typedef struct  _ATOM_I2C_VOLTAGE_OBJECT_V3
>     UCHAR    ucVoltageControlAddress;
>     UCHAR    ucVoltageControlOffset;
>     ULONG    ulReserved;
> -   VOLTAGE_LUT_ENTRY asVolI2cLut[1];        // end with 0xff
> +   VOLTAGE_LUT_ENTRY asVolI2cLut[];         // end with 0xff
>  }ATOM_I2C_VOLTAGE_OBJECT_V3;
>
>  // ATOM_I2C_VOLTAGE_OBJECT_V3.ucVoltageControlFlag
> @@ -4625,7 +4625,7 @@ typedef struct  _ATOM_LEAKAGE_VOLTAGE_OBJECT_V3
>     UCHAR    ucLeakageEntryNum;           // indicate the entry number of=
 LeakageId/Voltage Lut table
>     UCHAR    ucReserved[2];
>     ULONG    ulMaxVoltageLevel;
> -   LEAKAGE_VOLTAGE_LUT_ENTRY_V2 asLeakageIdLut[1];
> +   LEAKAGE_VOLTAGE_LUT_ENTRY_V2 asLeakageIdLut[];
>  }ATOM_LEAKAGE_VOLTAGE_OBJECT_V3;
>
>
> @@ -4753,7 +4753,7 @@ typedef struct _ATOM_POWER_SOURCE_INFO
>  {
>                 ATOM_COMMON_TABLE_HEADER                asHeader;
>                 UCHAR                                                    =
                                       asPwrbehave[16];
> -               ATOM_POWER_SOURCE_OBJECT                asPwrObj[1];
> +               ATOM_POWER_SOURCE_OBJECT                asPwrObj[];
>  }ATOM_POWER_SOURCE_INFO;
>
>
> @@ -5440,7 +5440,7 @@ typedef struct _ATOM_FUSION_SYSTEM_INFO_V2
>  typedef struct _ATOM_I2C_DATA_RECORD
>  {
>    UCHAR         ucNunberOfBytes;                                        =
      //Indicates how many bytes SW needs to write to the external ASIC for=
 one block, besides to "Start" and "Stop"
> -  UCHAR         ucI2CData[1];                                           =
      //I2C data in bytes, should be less than 16 bytes usually
> +  UCHAR         ucI2CData[];                                            =
      //I2C data in bytes, should be less than 16 bytes usually
>  }ATOM_I2C_DATA_RECORD;
>
>
> @@ -5451,14 +5451,14 @@ typedef struct _ATOM_I2C_DEVICE_SETUP_INFO
>    UCHAR                                        ucSSChipID;             /=
/SS chip being used
>    UCHAR                                        ucSSChipSlaveAddr;      /=
/Slave Address to set up this SS chip
>    UCHAR                           ucNumOfI2CDataRecords;  //number of da=
ta block
> -  ATOM_I2C_DATA_RECORD            asI2CData[1];
> +  ATOM_I2C_DATA_RECORD            asI2CData[];
>  }ATOM_I2C_DEVICE_SETUP_INFO;
>
>  //=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  typedef struct  _ATOM_ASIC_MVDD_INFO
>  {
>    ATOM_COMMON_TABLE_HEADER           sHeader;
> -  ATOM_I2C_DEVICE_SETUP_INFO      asI2CSetup[1];
> +  ATOM_I2C_DEVICE_SETUP_INFO      asI2CSetup[];
>  }ATOM_ASIC_MVDD_INFO;
>
>  //=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -5520,7 +5520,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO
>  typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V2
>  {
>    ATOM_COMMON_TABLE_HEADER           sHeader;
> -  ATOM_ASIC_SS_ASSIGNMENT_V2             asSpreadSpectrum[1];      //thi=
s is point only.
> +  ATOM_ASIC_SS_ASSIGNMENT_V2             asSpreadSpectrum[];       //thi=
s is point only.
>  }ATOM_ASIC_INTERNAL_SS_INFO_V2;
>
>  typedef struct _ATOM_ASIC_SS_ASSIGNMENT_V3
> @@ -5542,7 +5542,7 @@ typedef struct _ATOM_ASIC_SS_ASSIGNMENT_V3
>  typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
>  {
>    ATOM_COMMON_TABLE_HEADER           sHeader;
> -  ATOM_ASIC_SS_ASSIGNMENT_V3             asSpreadSpectrum[1];      //thi=
s is pointer only.
> +  ATOM_ASIC_SS_ASSIGNMENT_V3             asSpreadSpectrum[];       //thi=
s is pointer only.
>  }ATOM_ASIC_INTERNAL_SS_INFO_V3;
>
>
> @@ -6282,7 +6282,7 @@ typedef union _ATOM_MEMORY_SETTING_ID_CONFIG_ACCESS
>
>  typedef struct _ATOM_MEMORY_SETTING_DATA_BLOCK{
>         ATOM_MEMORY_SETTING_ID_CONFIG_ACCESS                    ulMemoryI=
D;
> -       ULONG                                                            =
                                                               aulMemData[1=
];
> +       ULONG                                                            =
                                                               aulMemData[]=
;
>  }ATOM_MEMORY_SETTING_DATA_BLOCK;
>
>
> @@ -7092,7 +7092,7 @@ typedef struct _ATOM_DISP_OUT_INFO_V3
>    UCHAR  ucCoreRefClkSource;                    // value of CORE_REF_CLK=
_SOURCE
>    UCHAR  ucDispCaps;
>    UCHAR  ucReserved[2];
> -  ASIC_TRANSMITTER_INFO_V2  asTransmitterInfo[1];     // for alligment o=
nly
> +  ASIC_TRANSMITTER_INFO_V2  asTransmitterInfo[];      // for alligment o=
nly
>  }ATOM_DISP_OUT_INFO_V3;
>
>  //ucDispCaps
> @@ -7324,12 +7324,12 @@ typedef struct _CLOCK_CONDITION_SETTING_ENTRY{
>    USHORT usMaxClockFreq;
>    UCHAR  ucEncodeMode;
>    UCHAR  ucPhySel;
> -  ULONG  ulAnalogSetting[1];
> +  ULONG  ulAnalogSetting[];
>  }CLOCK_CONDITION_SETTING_ENTRY;
>
>  typedef struct _CLOCK_CONDITION_SETTING_INFO{
>    USHORT usEntrySize;
> -  CLOCK_CONDITION_SETTING_ENTRY asClkCondSettingEntry[1];
> +  CLOCK_CONDITION_SETTING_ENTRY asClkCondSettingEntry[];
>  }CLOCK_CONDITION_SETTING_INFO;
>
>  typedef struct _PHY_CONDITION_REG_VAL{
> @@ -7346,27 +7346,27 @@ typedef struct _PHY_CONDITION_REG_VAL_V2{
>  typedef struct _PHY_CONDITION_REG_INFO{
>    USHORT usRegIndex;
>    USHORT usSize;
> -  PHY_CONDITION_REG_VAL asRegVal[1];
> +  PHY_CONDITION_REG_VAL asRegVal[];
>  }PHY_CONDITION_REG_INFO;
>
>  typedef struct _PHY_CONDITION_REG_INFO_V2{
>    USHORT usRegIndex;
>    USHORT usSize;
> -  PHY_CONDITION_REG_VAL_V2 asRegVal[1];
> +  PHY_CONDITION_REG_VAL_V2 asRegVal[];
>  }PHY_CONDITION_REG_INFO_V2;
>
>  typedef struct _PHY_ANALOG_SETTING_INFO{
>    UCHAR  ucEncodeMode;
>    UCHAR  ucPhySel;
>    USHORT usSize;
> -  PHY_CONDITION_REG_INFO  asAnalogSetting[1];
> +  PHY_CONDITION_REG_INFO  asAnalogSetting[];
>  }PHY_ANALOG_SETTING_INFO;
>
>  typedef struct _PHY_ANALOG_SETTING_INFO_V2{
>    UCHAR  ucEncodeMode;
>    UCHAR  ucPhySel;
>    USHORT usSize;
> -  PHY_CONDITION_REG_INFO_V2  asAnalogSetting[1];
> +  PHY_CONDITION_REG_INFO_V2  asAnalogSetting[];
>  }PHY_ANALOG_SETTING_INFO_V2;
>
>  typedef struct _GFX_HAVESTING_PARAMETERS {
> --
> 2.39.2
>
