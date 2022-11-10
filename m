Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A462466C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 16:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B50C10E15A;
	Thu, 10 Nov 2022 15:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF9D10E142;
 Thu, 10 Nov 2022 15:58:11 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id v81so2238724oie.5;
 Thu, 10 Nov 2022 07:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PqIxv0ykgX1dUcCkKNelcPiK/Dm8WOI9ANa20Luuz78=;
 b=OeMN1rKkePk0RMijxlVlQsnyZva5JsgGdk5gD1Wmfp7zgg8+KrQGMefkBvzr+SwW44
 s1wNFKq9I7T0DgF0Ai2dExVtOhu3yU7GanqxsRIjgwOPwxHpRDfA1UqoHu/qXI8osEey
 uaCMOJc7hPOr9Bn5/DhUldUC4Jbj2aXb+ZHSIxC0ObYxXTACp84XRJcNR2XmXN7E+B82
 ZSko+6Tnz/F1L0TlLzaIiJxfm4DcyLWSncUbNnI6LasnDYaOjXCc8cInixSvW/8FNbaW
 gI8gssOFwptiwlEVmr09g2dgOVeOKPhdW7ei14S8gviE/FH2cBX0K2q2HIievlWtLBhO
 NO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PqIxv0ykgX1dUcCkKNelcPiK/Dm8WOI9ANa20Luuz78=;
 b=zc15rgYOhr4Xec9KhVKKHJfK9Zgy/KqWSPzipnvMTea5WlvUA1zDzBGaCE4UpSSFEm
 Vl+TLCcu9KD2uyoIcVxU3k4uR/HUQW/Wlfd1L7ABqf+lrs/0dH/Z8H1fhKri+aqRjpTK
 HThzDeDpNql4sgoRjRRtCEXZ93LoZCJXHBnTDUP6lj2KqtKVo9PDKpQSYSMknTjhUauC
 asYV0S8jGkJ97dR9kh5NU77KiJQGfSqKDKoR3If6uiZmkBPcp/l+SrTbZyHpDl601sby
 wMXxj8Kk7PEpXzn80yPNV3EfNeeJMFH4NEcGQFYVqfAaj/L7rXUlbJpAlV0IKph0k9sm
 PU0Q==
X-Gm-Message-State: ACrzQf3f9Nhvo3Z/YJ9SsCcTeZ9Uh4as58HtUJEZj+s6f47iorI93eij
 IfSWtVz6rjHagj7Fx7vbYiMaCUiAQac684qUC84=
X-Google-Smtp-Source: AMsMyM5yu9fp0U9ivZ86w+s8zY9m83vob70VluIoUBlOY2mSDFVVApkRPdDlzgO7pSrJ207FPp7MAWV6dVAFZV4Y9dY=
X-Received: by 2002:a05:6808:7dc:b0:34f:97ea:14d with SMTP id
 f28-20020a05680807dc00b0034f97ea014dmr1581484oij.96.1668095890301; Thu, 10
 Nov 2022 07:58:10 -0800 (PST)
MIME-Version: 1.0
References: <Y2tXzlBDxgg9WMl7@mail.google.com>
In-Reply-To: <Y2tXzlBDxgg9WMl7@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Nov 2022 10:57:58 -0500
Message-ID: <CADnq5_NJNa41y28-+PPjA6hUPrYGXc87K50LeiEYGnyGyackUQ@mail.gmail.com>
Subject: Re: [PATCH] [next] drm/amdgpu: Replace one-element array with
 flex-array member
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Slark Xiao <slark_xiao@163.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rongguang Wei <weirongguang@kylinos.cn>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 9, 2022 at 2:33 AM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in structs _ATOM_CONNECTOR_DEVICE_TAG_RECORD,
> _ATOM_OBJECT_GPIO_CNTL_RECORD, _ATOM_BRACKET_LAYOUT_RECORD,
> _ATOM_BRACKET_LAYOUT_RECORD, _ATOM_LEAKAGE_VOLTAGE_OBJECT_V3,
> _ATOM_FUSION_SYSTEM_INFO_V3, _ATOM_I2C_DATA_RECORD,
> _ATOM_I2C_DEVICE_SETUP_INFO, _ATOM_ASIC_MVDD_INFO and refactor the
> rest of the code accordingly. While at it, removed a redundant casting.
>
> Important to mention is that doing a build before/after this patch results
> in no binary output differences.
>
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
>
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/238
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>
> Alex, I noticed a few structs in atombios.h that were not referenced. Is
> there any appetite for removing them? Or is that one of those cases
> where the structs are there should one driver ever need it?

A lot of userspace tools use these tables and I'd like to keep the
headers compatible.  Also, as I mentioned in the other thread, the
atombios command tables often parse these tables when initializing the
hardware so when you are debugging a command table, it helps to have
the relevant structures defined so it's easier to understand what the
command tables are doing.

Alex


>
> Ex.:
>         struct _ATOM_I2C_DATA_RECORD
>         struct _ATOM_I2C_DEVICE_SETUP_INFO
>         struct _ATOM_ASIC_MVDD_INFO
> ---
>  .../gpu/drm/amd/display/dc/bios/bios_parser.c    |  5 ++---
>  drivers/gpu/drm/amd/include/atombios.h           | 16 ++++++++--------
>  2 files changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> index 39dd8b2dc254..6b9e64cd4379 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> @@ -2606,8 +2606,7 @@ static enum bp_result update_slot_layout_info(
>
>         for (;;) {
>
> -               record_header = (ATOM_COMMON_RECORD_HEADER *)
> -                       GET_IMAGE(ATOM_COMMON_RECORD_HEADER, record_offset);
> +               record_header = GET_IMAGE(ATOM_COMMON_RECORD_HEADER, record_offset);
>                 if (record_header == NULL) {
>                         result = BP_RESULT_BADBIOSTABLE;
>                         break;
> @@ -2621,7 +2620,7 @@ static enum bp_result update_slot_layout_info(
>
>                 if (record_header->ucRecordType ==
>                         ATOM_BRACKET_LAYOUT_RECORD_TYPE &&
> -                       sizeof(ATOM_BRACKET_LAYOUT_RECORD)
> +                       struct_size(record, asConnInfo, 1)
>                         <= record_header->ucRecordSize) {
>                         record = (ATOM_BRACKET_LAYOUT_RECORD *)
>                                 (record_header);
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
> index 55ae93c1e365..60c44a8a067f 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -4733,7 +4733,7 @@ typedef struct  _ATOM_CONNECTOR_DEVICE_TAG_RECORD
>    ATOM_COMMON_RECORD_HEADER   sheader;
>    UCHAR                       ucNumberOfDevice;
>    UCHAR                       ucReserved;
> -  ATOM_CONNECTOR_DEVICE_TAG   asDeviceTag[1];         //This Id is same as "ATOM_DEVICE_XXX_SUPPORT", 1 is only for allocation
> +  ATOM_CONNECTOR_DEVICE_TAG   asDeviceTag[];          //This Id is same as "ATOM_DEVICE_XXX_SUPPORT"
>  }ATOM_CONNECTOR_DEVICE_TAG_RECORD;
>
>
> @@ -4793,7 +4793,7 @@ typedef struct  _ATOM_OBJECT_GPIO_CNTL_RECORD
>    ATOM_COMMON_RECORD_HEADER   sheader;
>    UCHAR                       ucFlags;                // Future expnadibility
>    UCHAR                       ucNumberOfPins;         // Number of GPIO pins used to control the object
> -  ATOM_GPIO_PIN_CONTROL_PAIR  asGpio[1];              // the real gpio pin pair determined by number of pins ucNumberOfPins
> +  ATOM_GPIO_PIN_CONTROL_PAIR  asGpio[];               // the real gpio pin pair determined by number of pins ucNumberOfPins
>  }ATOM_OBJECT_GPIO_CNTL_RECORD;
>
>  //Definitions for GPIO pin state
> @@ -4982,7 +4982,7 @@ typedef struct  _ATOM_BRACKET_LAYOUT_RECORD
>    UCHAR                       ucWidth;
>    UCHAR                       ucConnNum;
>    UCHAR                       ucReserved;
> -  ATOM_CONNECTOR_LAYOUT_INFO  asConnInfo[1];
> +  ATOM_CONNECTOR_LAYOUT_INFO  asConnInfo[];
>  }ATOM_BRACKET_LAYOUT_RECORD;
>
>
> @@ -5161,7 +5161,7 @@ typedef struct  _ATOM_GPIO_VOLTAGE_OBJECT_V3
>     UCHAR  ucPhaseDelay;                      // phase delay in unit of micro second
>     UCHAR  ucReserved;
>     ULONG  ulGpioMaskVal;                     // GPIO Mask value
> -   VOLTAGE_LUT_ENTRY_V2 asVolGpioLut[1];
> +   VOLTAGE_LUT_ENTRY_V2 asVolGpioLut[];
>  }ATOM_GPIO_VOLTAGE_OBJECT_V3;
>
>  typedef struct  _ATOM_LEAKAGE_VOLTAGE_OBJECT_V3
> @@ -5171,7 +5171,7 @@ typedef struct  _ATOM_LEAKAGE_VOLTAGE_OBJECT_V3
>     UCHAR    ucLeakageEntryNum;               // indicate the entry number of LeakageId/Voltage Lut table
>     UCHAR    ucReserved[2];
>     ULONG    ulMaxVoltageLevel;
> -   LEAKAGE_VOLTAGE_LUT_ENTRY_V2 asLeakageIdLut[1];
> +   LEAKAGE_VOLTAGE_LUT_ENTRY_V2 asLeakageIdLut[];
>  }ATOM_LEAKAGE_VOLTAGE_OBJECT_V3;
>
>
> @@ -6599,7 +6599,7 @@ typedef struct _ATOM_FUSION_SYSTEM_INFO_V3
>  typedef struct _ATOM_I2C_DATA_RECORD
>  {
>    UCHAR         ucNunberOfBytes;                                              //Indicates how many bytes SW needs to write to the external ASIC for one block, besides to "Start" and "Stop"
> -  UCHAR         ucI2CData[1];                                                 //I2C data in bytes, should be less than 16 bytes usually
> +  UCHAR         ucI2CData[];                                                  //I2C data in bytes, should be less than 16 bytes usually
>  }ATOM_I2C_DATA_RECORD;
>
>
> @@ -6610,14 +6610,14 @@ typedef struct _ATOM_I2C_DEVICE_SETUP_INFO
>    UCHAR                              ucSSChipID;             //SS chip being used
>    UCHAR                              ucSSChipSlaveAddr;      //Slave Address to set up this SS chip
>    UCHAR                           ucNumOfI2CDataRecords;  //number of data block
> -  ATOM_I2C_DATA_RECORD            asI2CData[1];
> +  ATOM_I2C_DATA_RECORD            asI2CData[];
>  }ATOM_I2C_DEVICE_SETUP_INFO;
>
>  //==========================================================================================
>  typedef struct  _ATOM_ASIC_MVDD_INFO
>  {
>    ATOM_COMMON_TABLE_HEADER         sHeader;
> -  ATOM_I2C_DEVICE_SETUP_INFO      asI2CSetup[1];
> +  ATOM_I2C_DEVICE_SETUP_INFO      asI2CSetup[];
>  }ATOM_ASIC_MVDD_INFO;
>
>  //==========================================================================================
> --
> 2.37.3
>
